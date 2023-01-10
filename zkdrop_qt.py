from PyQt6 import QtCore, QtGui, QtWidgets, uic
from PyQt6.QtSql import QSqlDatabase, QSqlQuery

import os

import shutil
import sys
import json
import requests
import sqlite3

import threading
import pathlib
import filetype
from zipfile import ZipFile
from time import sleep

from mimetypes import MimeTypes
import urllib 

from binascii import hexlify, unhexlify
import hashlib
from cryptography.fernet import Fernet

from umbral import PublicKey

# unused libs

# import io
# import ipfshttpclient

# QR Libs

import qrcode
from PIL import Image
from PIL.ImageQt import ImageQt

###
# My Libs
###

from lib.keys import load_aleo_keys, restore_keys_from_aleo, pyumbral_encrypt_secret, load_aleo_address, pyumbral_decrypt_secret
import aleo_python

# KYC dialog

class KYCDialog(QtWidgets.QDialog):
    def __init__(self, account_name):
        super().__init__()

        self.account_name = account_name

        uic.loadUi("pyqt_zkdrop_kyc.ui", self)
        self.pushButton_OpenDocument.clicked.connect(self.getFile)
        self.pushButton_kycUpload.clicked.connect(self.uploadFile)

        self.pushButton_Cancel.clicked.connect(self.closeDialog)

        self.pushButton_SaveKYC.clicked.connect(self.saveKYC)


    def getFile(self):

        fname = QtWidgets.QFileDialog.getOpenFileName(None, 'Open File')

        self.lineEdit_fileToUpload.setText(fname[0])

        # if filetype.is_image(fname[0]):
        #     print(f"{fname[0]} is a valid image...")

    
    def uploadFile(self):

        kyc_file = self.lineEdit_fileToUpload.text()

        if  not os.path.isfile(kyc_file):

            dlg = QtWidgets.QMessageBox(ui)
            dlg.setWindowTitle("Aleo Account creation confirmation")
            dlg.setText("File is not exist")
            button = dlg.exec()

            return

        # check file size

        file_size = os.path.getsize(kyc_file)/1024
        print(str(file_size) + " KB")   

        if file_size > 512:

            dlg = QtWidgets.QMessageBox(ui)
            dlg.setWindowTitle("Aleo Account creation confirmation")
            dlg.setText("File is too big. Consider upload less than 512 KB")
            button = dlg.exec()

            return

        if filetype.is_image(kyc_file):
            print(f"{kyc_file} is a valid image...")

            kyc_url = "https://api.zkdrop.xyz/api/kyc"

            mime = MimeTypes()
            url = urllib.request.pathname2url(kyc_file)
            mime_type = mime.guess_type(url)


            payload={}
            files=[
            ('photo',(pathlib.Path(kyc_file).name,open(kyc_file,'rb'),mime_type[0]))
            ]
            headers = {}

            kyc_response = requests.request("POST", kyc_url, headers=headers, data=payload, files=files)

            self.displayKYCData(kyc_response.json()["TextDetections"])

    def displayKYCData(self, kyc_json):
        # print(json.dumps(kyc_json))
        
        tmp_json = json.loads("{}")
        for kyc_text in kyc_json:
            tmp_json["DetectedText"] = kyc_text.pop("DetectedText")
            tmp_json["Type"] = kyc_text.pop("Type")
            self.textBrowser_parsingResults.append(json.dumps(tmp_json))

    def closeDialog(self):
        self.close()

    def saveKYC(self):

        kyc_file = self.lineEdit_fileToUpload.text()

        if  not os.path.isfile(kyc_file):

            dlg = QtWidgets.QMessageBox(ui)
            dlg.setWindowTitle("Aleo Account creation confirmation")
            dlg.setText("File is not exist")
            button = dlg.exec()

            return

        # check file size

        file_size = os.path.getsize(kyc_file)/1024
        print(str(file_size) + " KB")   

        if file_size > 512:

            dlg = QtWidgets.QMessageBox(ui)
            dlg.setWindowTitle("Aleo Account creation confirmation")
            dlg.setText("File is too big. Consider upload less than 512 KB")
            button = dlg.exec()

            return
                                                                            
        sender_profile_name = self.account_name
        aleo_private_key = load_aleo_keys(sender_profile_name)
        sender_secret_key = restore_keys_from_aleo(aleo_private_key)

        # get recipient data

        recipient_profile_name = self.account_name
        sender_address = load_aleo_address(sender_profile_name)
        recipient_address = load_aleo_address(recipient_profile_name)

        URL = "https://api.zkdrop.xyz/api/account/" + recipient_address

        try:
            r = requests.get(url = URL,timeout=5)
            r.raise_for_status()
        except requests.exceptions.HTTPError as errh:
            print ("Http Error:",errh)
        except requests.exceptions.ConnectionError as errc:
            print ("Error Connecting:",errc)
        except requests.exceptions.Timeout as errt:
            print ("Timeout Error:",errt)
        except requests.exceptions.RequestException as err:
            print ("OOps: Something Else",err)

        recipient_nucypher_address = r.json()[0]["nucypher_address"]

        recipient_public_key = PublicKey.from_bytes(unhexlify(recipient_nucypher_address))

        # file encryption key
        key = Fernet.generate_key()

        # file itself
        # Open the file to encrypt
        with open(kyc_file, 'rb') as f:
            data = f.read()

        #file md5 sum (32 bytes)

        data_md5_hash = hashlib.md5(data).hexdigest()

        ciphertext = pyumbral_encrypt_secret(sender_secret_key, recipient_public_key, key, data_md5_hash)

        # encrypt file
        
        fernet = Fernet(key)
        encrypted = fernet.encrypt(data)

        # envelop has 32 bytes md5 sum + ciphertext from pyumbral + encryted data

        head, file_name = os.path.split(kyc_file)

        # Write the envelope file
        with open("encrypted_files_tmp/" + file_name + '.encrypted', 'wb') as f:
            f.write(data_md5_hash.encode())
            f.write(ciphertext)
            f.write(encrypted)

        # ipfs upload

        # ipfs_client = ipfshttpclient.connect()

        # new_file = ipfs_client.add("encrypted_files_tmp/" + file_name + '.encrypted')

        with ZipFile("encrypted_files_tmp/" + file_name + "_" + data_md5_hash + '.zip', 'w') as myzip:
            myzip.write("encrypted_files_tmp/" + file_name + '.encrypted')
            myzip.write("encrypted_files_tmp/capsule_{}".format(data_md5_hash))
            myzip.write("encrypted_files_tmp/kfrags_{}".format(data_md5_hash))
            myzip.write("encrypted_files_tmp/ciphertext_{}".format(data_md5_hash))


        ipfs_file = open("encrypted_files_tmp/" + file_name + "_" + data_md5_hash + '.zip', "rb")

        ipfs_url = "https://api.zkdrop.xyz/api/ipfs_upload"

        ipfs_response = requests.post(ipfs_url, files = {"file": ipfs_file})

        os.remove("encrypted_files_tmp/" + file_name + "_" + data_md5_hash + '.zip') 

        print(ipfs_response)
        
        try:
            signature = aleo_python.sign_message(aleo_private_key, ipfs_response.json()["Hash"])
            # print(signature)
            # print(json.loads(signature)["Signature"])

        except ValueError as err_message:
            ui.ui_logging(err_message)
        
        URL = "https://api.zkdrop.xyz/api/publish/" + sender_address + "/" + recipient_address + "/" + ipfs_response.json()["Hash"] + "/" + json.loads(signature)["Signature"]


        # sending get request and saving the response as response object
        try:
            r = requests.get(url = URL,timeout=5)
            r.raise_for_status()
        except requests.exceptions.HTTPError as errh:
            print ("Http Error:",errh)
        except requests.exceptions.ConnectionError as errc:
            print ("Error Connecting:",errc)
        except requests.exceptions.Timeout as errt:
            print ("Timeout Error:",errt)
        except requests.exceptions.RequestException as err:
            print ("OOps: Something Else",err)


# New accounts dialog

class NewAccountDialog(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()

        uic.loadUi("pyqt_zkdrop_new_account.ui", self)

        self.setWindowTitle("zkDrop | Create New Account")

        self.newAccountButton.clicked.connect(self.createNewAleoKeys)

    def createNewAleoKeys(self):

        new_keys = json.loads(aleo_python.new_keys())

        new_keys["AccountName"] = self.newAccountName.text()

        # check existing accounts

        file_exists = os.path.exists('aleo_keys/aleo_' + new_keys["AccountName"] + '_key.json')

        if new_keys["AccountName"] == "":

            dlg = QtWidgets.QMessageBox(self)
            dlg.setWindowTitle("Aleo Account creation confirmation")
            dlg.setText("Empty Aleo.ID")
            button = dlg.exec()

        else:

            if file_exists:

                dlg = QtWidgets.QMessageBox(self)
                dlg.setWindowTitle("Aleo Account creation confirmation")
                dlg.setText("Aleo.ID is exists. Please choose different name")
                button = dlg.exec()

            else:
                with open('aleo_keys/aleo_'+new_keys["AccountName"]+'_key.json', 'w') as outfile:
                    outfile.write(json.dumps(new_keys))

                dlg = QtWidgets.QMessageBox(self)
                dlg.setWindowTitle("Aleo Account creation confirmation")
                dlg.setText("New account is created")
                button = dlg.exec()

                if button == QtWidgets.QMessageBox.StandardButton.Ok:
                    self.close()

                nucypher_secret_key = restore_keys_from_aleo(new_keys["AleoPrivateKey"])
                nucypher_public_key = nucypher_secret_key.public_key()

                # print(str(hexlify(bytes(nucypher_public_key)), "utf-8")) 

                URL = "https://api.zkdrop.xyz/api/createaccount/" + new_keys["AleoAddress"] + "/" + new_keys["AccountName"] + "/" + str(hexlify(bytes(nucypher_public_key)), "utf-8")

                # sending get request and saving the response as response object

                try:
                    r = requests.get(url = URL,timeout=5)
                    r.raise_for_status()
                except requests.exceptions.HTTPError as errh:
                    print ("Http Error:",errh)
                except requests.exceptions.ConnectionError as errc:
                    print ("Error Connecting:",errc)
                except requests.exceptions.Timeout as errt:
                    print ("Timeout Error:",errt)
                except requests.exceptions.RequestException as err:
                    print ("OOps: Something Else",err)

# Received files dialog

class ReceivedFilesDialog(QtWidgets.QDialog):
    def __init__(self, account_name):
        super().__init__()

        uic.loadUi("pyqt_zkdrop_received_files.ui", self)


        self.setWindowTitle("zkDrop | File Browser")

        # self.layout = QtWidgets.QVBoxLayout()
        # message = QtWidgets.QLabel("Received files")

        self.resize(1000, 300)
        # Set up the model

        # Set up the view
        # self.tableFiles = QtWidgets.QTableWidget()
        self.tableFiles.setColumnCount(4)
        self.tableFiles.setHorizontalHeaderLabels(["Sender Address", "IPFS Hash", "Status", "Signature"])

        self.tableFiles.doubleClicked.connect(self.selectFileToDecrypt)

        self.pushButton_Close.clicked.connect(self.closeDialog)


        db_con = QSqlDatabase.addDatabase("QSQLITE")
        db_con.setDatabaseName("zkdrop_database.db")

        aleo_address = load_aleo_address(account_name)

        db_con.open()
        query_text = "SELECT sender_address, aleo_address, file_ipfs, status, signature FROM ZKDROP_FILES where aleo_address = \"{}\"".format(aleo_address)

        query = QSqlQuery(query_text)

        while query.next():
            rows = self.tableFiles.rowCount()
            self.tableFiles.setRowCount(rows + 1)
            self.tableFiles.setItem(rows, 0, QtWidgets.QTableWidgetItem(query.value(0)))
            self.tableFiles.setItem(rows, 1, QtWidgets.QTableWidgetItem(query.value(2)))
            self.tableFiles.setItem(rows, 2, QtWidgets.QTableWidgetItem(query.value(3)))
            self.tableFiles.setItem(rows, 3, QtWidgets.QTableWidgetItem(query.value(4)))

        # making not editable
        self.tableFiles.setEditTriggers(QtWidgets.QTableWidget.EditTrigger.NoEditTriggers)

        self.tableFiles.resizeColumnsToContents()

        # self.image_lbl = QtWidgets.QLabel()

        # self.layout.addWidget(message)
        # self.layout.addWidget(self.tableFiles)
        # self.layout.addStretch()
        # self.layout.addWidget(self.image_lbl)
        # self.setLayout(self.layout)

        db_con.close()

    def closeDialog(self):
        self.close()

    def selectFileToDecrypt(self):


        # cleanup folders

        try:
            os.remove("received_files/received_tmp.zip")
        except OSError as e:
            # If it fails, inform the user.
            print("Error: %s - %s." % (e.filename, e.strerror))

        try:
            shutil.rmtree("received_files/encrypted_files_tmp/")
        except OSError as e:
            print("Error: %s - %s." % (e.filename, e.strerror))



        # get selected  item row and column
        for idx in self.tableFiles.selectionModel().selectedIndexes():
            row_number = idx.row()
            column_number = idx.column()


        ipfs_hash = self.tableFiles.item(row_number,1).text()
        recipient_address = self.tableFiles.item(row_number,0).text()
        signature = self.tableFiles.item(row_number,3).text()



        # clear pixmap
        
        self.image_lbl.clear()

        # sample ipfs file on infura
        # https://zkdrop.infura-ipfs.io/ipfs/QmPMykL31BSTnkLRvSHP7dQFD39CPnoaZg3r4Kv2hde4TC

        # projectId = ""
        # projectSecret = ""
        # endpoint = "https://ipfs.infura.io:5001"
 
        # ipfs_client = ipfshttpclient.connect('/dns/ipfs.infura.io/tcp/5001/https', auth=(projectId, projectSecret))

        # file_received = ipfs_client.cat(self.tableFiles.item(row_number,1).text())


        URL = "https://zkdrop.infura-ipfs.io/ipfs/" + ipfs_hash

        try:
            response = requests.get(url = URL,timeout=5)
            response.raise_for_status()
        except requests.exceptions.HTTPError as errh:
            print ("Http Error:",errh)
        except requests.exceptions.ConnectionError as errc:
            print ("Error Connecting:",errc)
        except requests.exceptions.Timeout as errt:
            print ("Timeout Error:",errt)
        except requests.exceptions.RequestException as err:
            print ("OOps: Something Else",err)

        open("received_files/received_tmp.zip", "wb").write(response.content)


        # received zip file with nucypher files and encrypted data

        # with open("received_files/received_tmp.zip", 'wb') as f:
        #     f.write(file_received)

        ZipFile("received_files/received_tmp.zip").extractall(path="received_files/")

        encrypted_file_path = sorted(pathlib.Path('received_files/encrypted_files_tmp/').glob('*.encrypted'))[0]
    
        with open(encrypted_file_path, "rb") as file_encrypted:
            temp_file = file_encrypted.read()
            received_md5 = temp_file[:32].decode("utf-8") 
            received_cyphertext = temp_file[32:116]
            received_data = temp_file[116:]

        # Get Recipient Profile name and keys

        # python 3.9 version 
        # recipient_profile_name = ui.label_AccountName.text().removeprefix('Aleo.ID: ')

        # python 3.7 version



        recipient_profile_name = ui.label_AccountName.text().replace('Aleo.ID: ','')

        print(recipient_profile_name)
        
        aleo_private_key = load_aleo_keys(recipient_profile_name)
        recipient_secret_key = restore_keys_from_aleo(aleo_private_key)

        # Get Sender Profile name and keys

        URL = "https://api.zkdrop.xyz/api/account/" + recipient_address

        # sending get request and saving the response as response object

        try:
            r = requests.get(url = URL,timeout=5)
            r.raise_for_status()
        except requests.exceptions.HTTPError as errh:
            print ("Http Error:",errh)
        except requests.exceptions.ConnectionError as errc:
            print ("Error Connecting:",errc)
        except requests.exceptions.Timeout as errt:
            print ("Timeout Error:",errt)
        except requests.exceptions.RequestException as err:
            print ("OOps: Something Else",err)

        sender_nucypher_address = r.json()[0]["nucypher_address"]

        print(sender_nucypher_address)

        sender_public_key = PublicKey.from_bytes(unhexlify(sender_nucypher_address))

        # nucypher files from archive

        encrypted_ciphertext = "received_files/encrypted_files_tmp/ciphertext_"+received_md5
        capsule_file = "received_files/encrypted_files_tmp/capsule_"+received_md5
        kfrags_file = "received_files/encrypted_files_tmp/kfrags_"+received_md5

        # decrypting key

        decrypted_key = pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, encrypted_ciphertext, capsule_file, kfrags_file)

        # decrypt data file

        fernet = Fernet(decrypted_key)
        decrypted_data = fernet.decrypt(received_data, 24*60*60)

        # save file 

        with open("received_files/"+encrypted_file_path.stem, 'wb') as f:
            f.write(decrypted_data)

        # verify signature

        try:
            verify_signature = aleo_python.verify_message(recipient_address, ipfs_hash, signature)
            print(verify_signature)
            self.label_signature.setText("Signature status: " + verify_signature)

        except ValueError as err_message:
            print(err_message.args[0])
            self.label_signature.setText("Signature status: " + err_message.args[0])


        # if file is image, then show it 

        filename = "received_files/"+encrypted_file_path.stem

        if filetype.is_image(filename):
            print(f"{filename} is a valid image...")
            self.image_lbl.setPixmap(QtGui.QPixmap("received_files/"+encrypted_file_path.stem).scaledToHeight(50))

        # cleanup folders

        try:
            os.remove("received_files/received_tmp.zip")
        except OSError as e:
            # If it fails, inform the user.
            print("Error: %s - %s." % (e.filename, e.strerror))

        try:
            shutil.rmtree("received_files/encrypted_files_tmp/")
        except OSError as e:
            print("Error: %s - %s." % (e.filename, e.strerror))

# Main UI dialog

class Ui_Dialog(QtWidgets.QDialog):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        uic.loadUi("pyqt_zkdrop.ui", self)

    def addAccountsMenu(self, Dialog):

        # self.accountSelectBox.clear()

        directory = 'aleo_keys'

        # iterate over files in that directory
        for filename in os.listdir(directory):
            f = os.path.join(directory, filename)
            # checking if it is a file
            if os.path.isfile(f):
                file = open(f)
                data = json.load(file)

            # checking for files with empty Private Key field and Duplicated records

                if data['AleoPrivateKey'] != "":
                    item_available = self.accountSelectBox.findText(data['AccountName'])
                    if item_available == -1:
                        self.accountSelectBox.addItem(data['AccountName'])

        # check if no accounts created        

        if self.accountSelectBox.count() == 0:

            dlg = NewAccountDialog()
            dlg.setWindowTitle("New Account")
            dlg.exec()
            self.addAccountsMenu(self)

        self.active_account_changed(self.accountSelectBox.currentText())

        self.accountSelectBox.currentTextChanged.connect(self.active_account_changed)

    def addRecipientsMenu(self, Dialog):

        self.recipientSelectBox.clear()

        directory = 'aleo_keys'

        # iterate over files in that directory
        for filename in os.listdir(directory):
            f = os.path.join(directory, filename)
            # checking if it is a file
            if os.path.isfile(f):
                file = open(f)
                data = json.load(file)

                self.recipientSelectBox.addItem(data['AccountName'])

        self.recipient_account_changed(self.recipientSelectBox.currentText())

        self.recipientSelectBox.currentTextChanged.connect(self.recipient_account_changed)

    def defineActions(self, Dialog):

        self.pushButton_OpenFile.clicked.connect(self.getfile)
        self.encryptButton.clicked.connect(encrypt_file)

        self.incomingFilesButton.clicked.connect(self.check_received_files)

        self.pushButton_newAccount.clicked.connect(self.create_new_account)

        self.pushButton_newRecipient.clicked.connect(self.add_new_recipient)
        self.pushButton_uploadDocument.clicked.connect(self.start_kyc)

    def active_account_changed(self, s):

        sender_profile_name = s

        aleo_private_key = load_aleo_keys(sender_profile_name)
        sender_secret_key = restore_keys_from_aleo(aleo_private_key)
        sender_public_key = sender_secret_key.public_key()

        aleo_address = load_aleo_address(sender_profile_name)

        self.label_AccountName.setText("Aleo.ID: " + sender_profile_name)
        self.label_PublicKey.setText("Account Public Key: " + str(sender_public_key))

        self.generate_qr(aleo_address)
        
        self.ui_logging("Current profile: " + sender_profile_name)

        sqlite_db = sqlite3.connect('zkdrop_database.db')

        with sqlite_db:
            query = "SELECT * FROM ZKDROP_FILES WHERE aleo_address == \"%s\" AND status == \"unread\"" % (aleo_address)
            sql_select = sqlite_db.execute(query)

            self.label_FilesUnread.setText("Unread files: " + str(len(sql_select.fetchall())))

    def generate_qr(self, s):

        # taking image which user wants
        # in the QR code center
        Logo_link = 'assets/icon-128.png'

        logo = Image.open(Logo_link)

        white_logo = Image.new("RGBA", logo.size, "WHITE") # Create a white rgba background
        white_logo.paste(logo, (0, 0), logo)

        # taking base width
        basewidth = 70

        # adjust image size
        wpercent = (basewidth/float(white_logo.size[0]))
        hsize = int((float(white_logo.size[1])*float(wpercent)))
        white_logo = white_logo.resize((basewidth, hsize), Image.ANTIALIAS)

        QRcode = qrcode.QRCode(
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            border=1,
            box_size=7,
            version=1
        )

        # taking url or text
        url = 'https://api.zkdrop.xyz/api/account/' + s

        # adding URL or text to QRcode
        QRcode.add_data(url)

        # generating QR code
        QRcode.make()

        # taking color name from user
        QRcolor = 'Black'

        # adding color to QR code
        QRimg = QRcode.make_image(
            fill_color=QRcolor, back_color="white").convert('RGB')

        # set size of QR code
        pos = ((QRimg.size[0] - white_logo.size[0]) // 2,
            (QRimg.size[1] - white_logo.size[1]) // 2)
        QRimg.paste(white_logo, pos)

        # save the QR code generated
        
        qim = ImageQt(QRimg)
        self.label.setPixmap(QtGui.QPixmap.fromImage(qim).scaled(200, 200))

    def recipient_account_changed(self, s):

        sender_profile_name = s

        self.ui_logging("Recipient profile: " + sender_profile_name)

    def getfile(self):
        fname = QtWidgets.QFileDialog.getOpenFileName(None, 'Open File')

        self.lineEdit.setText(fname[0])

        self.ui_logging("Selected file:\n" + fname[0])

    def setLogos(self, Dialog):

        self.label_2.setPixmap(QtGui.QPixmap("assets/square-aleo.png"))
        ui.logFieldLabel.setText("")

    def ui_logging(self, message):

        ui.logFieldLabel.setText(ui.logFieldLabel.text() + message + "\n")

        vbar = self.scrollArea.verticalScrollBar()
        vbar.setValue(vbar.maximum())

    def check_received_files(self):
        
        dlg = ReceivedFilesDialog(self.accountSelectBox.currentText())
        dlg.setWindowTitle("Received files")
        dlg.exec()

    def start_kyc(self):
        
        dlg = KYCDialog(self.accountSelectBox.currentText())
        dlg.setWindowTitle("zkDrop | KYC")
        dlg.exec()

    def create_new_account(self):
        
        dlg = NewAccountDialog()
        dlg.setWindowTitle("New Account")
        dlg.exec()

        self.addRecipientsMenu(self)
        self.addAccountsMenu(self)
        
    def add_new_recipient(self):

        new_recipient_aleo_address = self.lineEdit_newRecipient.text()

        if len(new_recipient_aleo_address) != 63:
            dlg = QtWidgets.QMessageBox(self)
            dlg.setWindowTitle("Aleo Account creation confirmation")
            dlg.setText("Incorrect Aleo Address")
            button = dlg.exec()
        else:
            URL = "https://api.zkdrop.xyz/api/account/" + new_recipient_aleo_address

            # sending get request and saving the response as response object

            try:
                r = requests.get(url = URL,timeout=5)
                r.raise_for_status()
            except requests.exceptions.HTTPError as errh:
                print ("Http Error:",errh)
            except requests.exceptions.ConnectionError as errc:
                print ("Error Connecting:",errc)
            except requests.exceptions.Timeout as errt:
                print ("Timeout Error:",errt)
            except requests.exceptions.RequestException as err:
                print ("OOps: Something Else",err)

            new_account = r.json()[0]

            new_account["AleoPrivateKey"] = ""
            new_account["AleoViewKey"] = ""
            new_account["AccountName"] = new_account.pop("account_name")
            new_account["AleoAddress"] = new_account.pop("aleo_address")

            with open('aleo_keys/aleo_'+new_account["AccountName"]+'_key.json', 'w') as outfile:
                outfile.write(json.dumps(new_account))

            self.addRecipientsMenu(self)
            
# File encryption

def encrypt_file():

    file_to_encrypt = ui.lineEdit.text()

    # check file availability
    
    if  not os.path.isfile(file_to_encrypt):

        dlg = QtWidgets.QMessageBox(ui)
        dlg.setWindowTitle("Aleo Account creation confirmation")
        dlg.setText("File is not exist")
        button = dlg.exec()

        return

    # check file size

    file_size = os.path.getsize(file_to_encrypt)/1024
    print(str(file_size) + " KB")   

    if file_size > 512:

        dlg = QtWidgets.QMessageBox(ui)
        dlg.setWindowTitle("Aleo Account creation confirmation")
        dlg.setText("File is too big. Consider upload less than 512 KB")
        button = dlg.exec()

        return

    # continue if OK
                                                                    
    sender_profile_name = ui.accountSelectBox.currentText()
    aleo_private_key = load_aleo_keys(sender_profile_name)
    sender_secret_key = restore_keys_from_aleo(aleo_private_key)
    sender_public_key = sender_secret_key.public_key()

    # get recipient data

    recipient_profile_name = ui.recipientSelectBox.currentText()
    sender_address = load_aleo_address(sender_profile_name)
    recipient_address = load_aleo_address(recipient_profile_name)

    URL = "https://api.zkdrop.xyz/api/account/" + recipient_address

    try:
        r = requests.get(url = URL,timeout=5)
        r.raise_for_status()
    except requests.exceptions.HTTPError as errh:
        print ("Http Error:",errh)
    except requests.exceptions.ConnectionError as errc:
        print ("Error Connecting:",errc)
    except requests.exceptions.Timeout as errt:
        print ("Timeout Error:",errt)
    except requests.exceptions.RequestException as err:
        print ("OOps: Something Else",err)

    recipient_nucypher_address = r.json()[0]["nucypher_address"]

    recipient_public_key = PublicKey.from_bytes(unhexlify(recipient_nucypher_address))

    # file encryption key
    key = Fernet.generate_key()

    # file itself
    # Open the file to encrypt
    with open(file_to_encrypt, 'rb') as f:
        data = f.read()

    #file md5 sum (32 bytes)

    data_md5_hash = hashlib.md5(data).hexdigest()

    ui.ui_logging("File to be encrypted and sent to IPFS:\n" + file_to_encrypt)

    ciphertext = pyumbral_encrypt_secret(sender_secret_key, recipient_public_key, key, data_md5_hash)

    # encrypt file
    
    fernet = Fernet(key)
    encrypted = fernet.encrypt(data)

    # envelop has 32 bytes md5 sum + ciphertext from pyumbral + encryted data

    head, file_name = os.path.split(file_to_encrypt)

    # Write the envelope file
    with open("encrypted_files_tmp/" + file_name + '.encrypted', 'wb') as f:
        f.write(data_md5_hash.encode())
        f.write(ciphertext)
        f.write(encrypted)

    ui.ui_logging("File is encrypted and stored with \n" + file_to_encrypt + '.encrypted' + " filename")

    # ipfs upload

    # ipfs_client = ipfshttpclient.connect()

    # new_file = ipfs_client.add("encrypted_files_tmp/" + file_name + '.encrypted')

    with ZipFile("encrypted_files_tmp/" + file_name + "_" + data_md5_hash + '.zip', 'w') as myzip:
        myzip.write("encrypted_files_tmp/" + file_name + '.encrypted')
        myzip.write("encrypted_files_tmp/capsule_{}".format(data_md5_hash))
        myzip.write("encrypted_files_tmp/kfrags_{}".format(data_md5_hash))
        myzip.write("encrypted_files_tmp/ciphertext_{}".format(data_md5_hash))


    ipfs_file = open("encrypted_files_tmp/" + file_name + "_" + data_md5_hash + '.zip', "rb")

    ipfs_url = "https://api.zkdrop.xyz/api/ipfs_upload"

    ipfs_response = requests.post(ipfs_url, files = {"file": ipfs_file})

    os.remove("encrypted_files_tmp/" + file_name + "_" + data_md5_hash + '.zip') 

    print(ipfs_response)

    ui.ui_logging("IPFS data:\n" + str(ipfs_response.json()))

    try:
        signature = aleo_python.sign_message(aleo_private_key, ipfs_response.json()["Hash"])
        # print(signature)
        # print(json.loads(signature)["Signature"])

    except ValueError as err_message:
        ui.ui_logging(err_message)
    
    URL = "https://api.zkdrop.xyz/api/publish/" + sender_address + "/" + recipient_address + "/" + ipfs_response.json()["Hash"] + "/" + json.loads(signature)["Signature"]

    # sending get request and saving the response as response object
    try:
        r = requests.get(url = URL,timeout=5)
        r.raise_for_status()
    except requests.exceptions.HTTPError as errh:
        print ("Http Error:",errh)
    except requests.exceptions.ConnectionError as errc:
        print ("Error Connecting:",errc)
    except requests.exceptions.Timeout as errt:
        print ("Timeout Error:",errt)
    except requests.exceptions.RequestException as err:
        print ("OOps: Something Else",err)

def message_listener():

    sqlite_db = sqlite3.connect('zkdrop_database.db')

    while True:
        
        # python 3.9 version aleo_address = load_aleo_address(ui.label_AccountName.text().removeprefix('Aleo.ID: '))

        # python 3.7 version

        aleo_address = load_aleo_address(ui.label_AccountName.text().replace('Aleo.ID: ',''))

        ui.ui_logging("checking api for address: " + aleo_address )

        URL = "https://api.zkdrop.xyz/api/receive/" + aleo_address

        # sending get request and saving the response as response object

        try:
            api_response = requests.get(url = URL,timeout=5)
            api_response.raise_for_status()
        except requests.exceptions.HTTPError as errh:
            print ("Http Error:",errh)
        except requests.exceptions.ConnectionError as errc:
            print ("Error Connecting:",errc)
        except requests.exceptions.Timeout as errt:
            print ("Timeout Error:",errt)
        except requests.exceptions.RequestException as err:
            print ("OOps: Something Else",err)

        data = api_response.json()

        if data[0]["ipfs_hash"] == "":
            ui.ui_logging("nothing received")

        else:

            for data_item in data:
                ui.ui_logging("received a file: " + data_item["ipfs_hash"])

                with sqlite_db:

                    # we need to check whether or not this file is available

                    query = "SELECT * FROM ZKDROP_FILES WHERE aleo_address == \"%s\" AND file_ipfs == \"%s\"" % (data_item["recipient_address"], data_item["ipfs_hash"])

                    sql_select = sqlite_db.execute(query)

                    # if not, then we add it to local database
                    
                    if len(sql_select.fetchall()) == 0:
                        ui.ui_logging("File is not exists, adding to local database")            
                        sql_insert = "INSERT INTO ZKDROP_FILES (id, sender_address, aleo_address, file_ipfs, status, signature ) values(%d, \"%s\", \"%s\", \"%s\", \"%s\", \"%s\")" % (0, data_item["sender_address"], data_item["recipient_address"], data_item["ipfs_hash"], "unread", data_item["signature"])
                        sqlite_db.execute(sql_insert)

                        query = "SELECT * FROM ZKDROP_FILES WHERE aleo_address == \"%s\" AND status == \"unread\"" % (aleo_address)
                        sql_select = sqlite_db.execute(query)

                        ui.label_FilesUnread.setText("Unread files: " + str(len(sql_select.fetchall())))

                    # if yes, we skip it

                    else:
                        ui.ui_logging("File is already added to local database")

        sleep(15)


def init_app():
    # check db file 
    file_exists = os.path.exists('zkdrop_database.db')

    # create db tables
    if not file_exists: 
        conn = sqlite3.connect('zkdrop_database.db')
        c = conn.cursor()

        c.execute('''
                CREATE TABLE IF NOT EXISTS "ZKDROP_FILES" (
                    "id"	INTEGER,
                    "aleo_address"	TEXT,
                    "file_ipfs"	TEXT,
                    "status"	TEXT,
	                "sender_address"	TEXT,
	                "file_name"	TEXT,
	                "signature"	TEXT
                )
                ''')
                            
        conn.commit()

    # create folders:
    # - encrypted_files_tmp
    # - aleo_keys
    # - received_files
    
    folder_exists = os.path.isdir('encrypted_files_tmp')
    if not folder_exists:
        os.mkdir('encrypted_files_tmp')

    folder_exists = os.path.isdir('aleo_keys')
    if not folder_exists:
        os.mkdir('aleo_keys')    

    folder_exists = os.path.isdir('received_files')
    if not folder_exists:
        os.mkdir('received_files')    

if __name__ == "__main__":
    
    import sys

    init_app()

    app = QtWidgets.QApplication(sys.argv)
    Dialog = QtWidgets.QDialog()
    ui = Ui_Dialog()
    #ui.setupUi(Dialog)
    ui.show()
    ui.setLogos(Dialog)
    ui.defineActions(Dialog)
    ui.addAccountsMenu(Dialog)
    ui.addRecipientsMenu(Dialog)

    thread = threading.Thread(target=message_listener)
    thread.daemon = True
    thread.start()

    # Dialog.show()
    sys.exit(app.exec())
