from PyQt6 import QtCore, QtGui, QtWidgets
from PyQt6.QtSql import QSqlDatabase, QSqlTableModel, QSqlQuery

import os
import sys
import json
import requests
import sqlite3
import ipfshttpclient
import threading
from time import sleep

import hashlib
from cryptography.fernet import Fernet

###
# My Libs
###

from lib.keys import load_aleo_keys, restore_keys_from_aleo, pyumbral_encrypt_secret, load_aleo_address, pyumbral_decrypt_secret

# Received files dialog

class ReceivedFilesDialog(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("zkDrop | File Browser")

        self.layout = QtWidgets.QVBoxLayout()
        message = QtWidgets.QLabel("Received files")

        self.resize(1000, 300)
        # Set up the model

        # Set up the view
        self.tableFiles = QtWidgets.QTableWidget()
        self.tableFiles.setColumnCount(3)
        self.tableFiles.setHorizontalHeaderLabels(["Aleo Address", "IPFS Hash", "Status"])

        self.tableFiles.doubleClicked.connect(self.selectFileToDecrypt)

        db_con = QSqlDatabase.addDatabase("QSQLITE")
        db_con.setDatabaseName("zkdrop_database.db")

        db_con.open()
        query = QSqlQuery("SELECT aleo_address, file_ipfs, status FROM ZKDROP_FILES")

        while query.next():
            rows = self.tableFiles.rowCount()
            self.tableFiles.setRowCount(rows + 1)
            self.tableFiles.setItem(rows, 0, QtWidgets.QTableWidgetItem(query.value(0)))
            self.tableFiles.setItem(rows, 1, QtWidgets.QTableWidgetItem(query.value(1)))
            self.tableFiles.setItem(rows, 2, QtWidgets.QTableWidgetItem(query.value(2)))

        self.tableFiles.resizeColumnsToContents()

        self.layout.addWidget(message)
        self.layout.addWidget(self.tableFiles)
        self.setLayout(self.layout)

        db_con.close()

        

    def selectFileToDecrypt(self):
        for idx in self.tableFiles.selectionModel().selectedIndexes():
            row_number = idx.row()
            column_number = idx.column()

        # print(self.tableFiles.item(idx.row(),1).text())
        
        ipfs_client = ipfshttpclient.connect()

        file_received = ipfs_client.cat(self.tableFiles.item(idx.row(),1).text())

        received_md5 = file_received[:32].decode("utf-8") 
        received_cyphertext = file_received[32:116]
        received_data = file_received[116:]

        # Get Recipient Profile name and keys

        recipient_profile_name = ui.label_AccountName.text().removeprefix('Account Name: ')
        aleo_private_key = load_aleo_keys(recipient_profile_name)
        recipient_secret_key = restore_keys_from_aleo(aleo_private_key)

        # Get Sender Profile name and keys

        sender_profile_name = "RustamOne"
        aleo_private_key = load_aleo_keys(sender_profile_name)
        sender_secret_key = restore_keys_from_aleo(aleo_private_key)
        sender_public_key = sender_secret_key.public_key()

        #files

        encrypted_ciphertext = "secret_sharing/ciphertext_"+received_md5
        capsule_file = "secret_sharing/capsule_"+received_md5
        kfrags_file = "secret_sharing/kfrags_"+received_md5

        decrypted_key = pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, encrypted_ciphertext, capsule_file, kfrags_file)

        fernet = Fernet(decrypted_key)
        decrypted_data = fernet.decrypt(received_data, 24*60*60)

        print(decrypted_data)


        with open("received_files/"+self.tableFiles.item(idx.row(),1).text()+'.txt', 'wb') as f:
            f.write(decrypted_data)

# Main UI dialog

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(532, 658)
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(Dialog)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.horizontalLayout_1 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_1.setObjectName("horizontalLayout_1")
        self.groupBox = QtWidgets.QGroupBox(Dialog)
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.groupBox)
        self.verticalLayout.setObjectName("verticalLayout")
        self.label_Static_YourAleoAccount = QtWidgets.QLabel(self.groupBox)
        self.label_Static_YourAleoAccount.setObjectName("label_Static_YourAleoAccount")
        self.verticalLayout.addWidget(self.label_Static_YourAleoAccount)
        spacerItem = QtWidgets.QSpacerItem(20, 40, QtWidgets.QSizePolicy.Policy.Minimum, QtWidgets.QSizePolicy.Policy.Expanding)
        self.verticalLayout.addItem(spacerItem)
        self.accountSelectBox = QtWidgets.QComboBox(self.groupBox)
        self.accountSelectBox.setObjectName("accountSelectBox")
        self.verticalLayout.addWidget(self.accountSelectBox)
        self.label_AccountName = QtWidgets.QLabel(self.groupBox)
        self.label_AccountName.setObjectName("label_AccountName")
        self.verticalLayout.addWidget(self.label_AccountName)
        self.label_PublicKey = QtWidgets.QLabel(self.groupBox)
        self.label_PublicKey.setObjectName("label_PublicKey")
        self.verticalLayout.addWidget(self.label_PublicKey)
        self.horizontalLayout_1.addWidget(self.groupBox)
        self.label = QtWidgets.QLabel(Dialog)
        self.label.setText("")
        self.label.setPixmap(QtGui.QPixmap(":/assets/logo.png"))
        self.label.setScaledContents(False)
        self.label.setAlignment(QtCore.Qt.AlignmentFlag.AlignCenter)
        self.label.setObjectName("label")
        self.horizontalLayout_1.addWidget(self.label)
        self.verticalLayout_2.addLayout(self.horizontalLayout_1)
        self.groupBox_FileExplorer = QtWidgets.QGroupBox(Dialog)
        self.groupBox_FileExplorer.setTitle("")
        self.groupBox_FileExplorer.setObjectName("groupBox_FileExplorer")
        self.gridLayout_3 = QtWidgets.QGridLayout(self.groupBox_FileExplorer)
        self.gridLayout_3.setObjectName("gridLayout_3")
        self.label_FilesUnread = QtWidgets.QLabel(self.groupBox_FileExplorer)
        self.label_FilesUnread.setObjectName("label_FilesUnread")
        self.gridLayout_3.addWidget(self.label_FilesUnread, 0, 0, 1, 1)
        spacerItem1 = QtWidgets.QSpacerItem(274, 20, QtWidgets.QSizePolicy.Policy.Expanding, QtWidgets.QSizePolicy.Policy.Minimum)
        self.gridLayout_3.addItem(spacerItem1, 0, 1, 1, 1)
        self.incomingFilesButton = QtWidgets.QPushButton(self.groupBox_FileExplorer)
        self.incomingFilesButton.setObjectName("incomingFilesButton")
        self.gridLayout_3.addWidget(self.incomingFilesButton, 0, 2, 1, 1)
        self.verticalLayout_2.addWidget(self.groupBox_FileExplorer)
        self.groupBox_OpenFile = QtWidgets.QGroupBox(Dialog)
        self.groupBox_OpenFile.setTitle("")
        self.groupBox_OpenFile.setObjectName("groupBox_OpenFile")
        self.gridLayout = QtWidgets.QGridLayout(self.groupBox_OpenFile)
        self.gridLayout.setObjectName("gridLayout")
        self.label_4 = QtWidgets.QLabel(self.groupBox_OpenFile)
        self.label_4.setObjectName("label_4")
        self.gridLayout.addWidget(self.label_4, 0, 0, 1, 1)
        self.pushButton_OpenFile = QtWidgets.QPushButton(self.groupBox_OpenFile)
        self.pushButton_OpenFile.setObjectName("pushButton_OpenFile")
        self.gridLayout.addWidget(self.pushButton_OpenFile, 2, 0, 1, 1)
        self.lineEdit = QtWidgets.QLineEdit(self.groupBox_OpenFile)
        self.lineEdit.setReadOnly(True)
        self.lineEdit.setObjectName("lineEdit")
        self.gridLayout.addWidget(self.lineEdit, 2, 1, 1, 1)
        self.verticalLayout_2.addWidget(self.groupBox_OpenFile)
        self.groupBox_Recipient = QtWidgets.QGroupBox(Dialog)
        self.groupBox_Recipient.setTitle("")
        self.groupBox_Recipient.setObjectName("groupBox_Recipient")
        self.gridLayout_2 = QtWidgets.QGridLayout(self.groupBox_Recipient)
        self.gridLayout_2.setObjectName("gridLayout_2")
        self.label_5 = QtWidgets.QLabel(self.groupBox_Recipient)
        self.label_5.setObjectName("label_5")
        self.gridLayout_2.addWidget(self.label_5, 0, 0, 1, 1)
        spacerItem2 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Policy.Expanding, QtWidgets.QSizePolicy.Policy.Minimum)
        self.gridLayout_2.addItem(spacerItem2, 2, 1, 1, 1)
        self.recipientSelectBox = QtWidgets.QComboBox(self.groupBox_Recipient)
        self.recipientSelectBox.setObjectName("recipientSelectBox")
        self.gridLayout_2.addWidget(self.recipientSelectBox, 2, 0, 1, 1)
        self.verticalLayout_2.addWidget(self.groupBox_Recipient)
        self.groupBox_EncryptionData = QtWidgets.QGroupBox(Dialog)
        self.groupBox_EncryptionData.setObjectName("groupBox_EncryptionData")
        self.horizontalLayout_6 = QtWidgets.QHBoxLayout(self.groupBox_EncryptionData)
        self.horizontalLayout_6.setObjectName("horizontalLayout_6")
        self.scrollArea = QtWidgets.QScrollArea(self.groupBox_EncryptionData)
        self.scrollArea.setWidgetResizable(True)
        self.scrollArea.setAlignment(QtCore.Qt.AlignmentFlag.AlignLeading|QtCore.Qt.AlignmentFlag.AlignLeft|QtCore.Qt.AlignmentFlag.AlignTop)
        self.scrollArea.setObjectName("scrollArea")
        self.scrollAreaWidgetContents = QtWidgets.QWidget()
        self.scrollAreaWidgetContents.setGeometry(QtCore.QRect(0, 0, 446, 77))
        self.scrollAreaWidgetContents.setObjectName("scrollAreaWidgetContents")
        self.verticalLayout_3 = QtWidgets.QVBoxLayout(self.scrollAreaWidgetContents)
        self.verticalLayout_3.setContentsMargins(-1, 0, -1, 0)
        self.verticalLayout_3.setObjectName("verticalLayout_3")
        self.logFieldLabel = QtWidgets.QLabel(self.scrollAreaWidgetContents)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Policy.Maximum, QtWidgets.QSizePolicy.Policy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.logFieldLabel.sizePolicy().hasHeightForWidth())
        self.logFieldLabel.setSizePolicy(sizePolicy)
        self.logFieldLabel.setTextFormat(QtCore.Qt.TextFormat.PlainText)
        self.logFieldLabel.setAlignment(QtCore.Qt.AlignmentFlag.AlignLeading|QtCore.Qt.AlignmentFlag.AlignLeft|QtCore.Qt.AlignmentFlag.AlignTop)
        self.logFieldLabel.setWordWrap(True)
        self.logFieldLabel.setObjectName("logFieldLabel")
        self.verticalLayout_3.addWidget(self.logFieldLabel)
        self.scrollArea.setWidget(self.scrollAreaWidgetContents)
        self.horizontalLayout_6.addWidget(self.scrollArea)
        spacerItem3 = QtWidgets.QSpacerItem(20, 40, QtWidgets.QSizePolicy.Policy.Minimum, QtWidgets.QSizePolicy.Policy.Expanding)
        self.horizontalLayout_6.addItem(spacerItem3)
        self.verticalLayout_2.addWidget(self.groupBox_EncryptionData)
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.encryptButton = QtWidgets.QPushButton(Dialog)
        self.encryptButton.setObjectName("encryptButton")
        self.horizontalLayout_2.addWidget(self.encryptButton)
        spacerItem4 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Policy.Expanding, QtWidgets.QSizePolicy.Policy.Minimum)
        self.horizontalLayout_2.addItem(spacerItem4)
        self.label_2 = QtWidgets.QLabel(Dialog)
        self.label_2.setMaximumSize(QtCore.QSize(50, 50))
        self.label_2.setText("")
        self.label_2.setPixmap(QtGui.QPixmap(":/assets/square-aleo.png"))
        self.label_2.setScaledContents(True)
        self.label_2.setObjectName("label_2")
        self.horizontalLayout_2.addWidget(self.label_2)
        self.verticalLayout_2.addLayout(self.horizontalLayout_2)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "zkDrop | Aleo"))
        self.label_Static_YourAleoAccount.setText(_translate("Dialog", "Your Aleo Account"))
        self.label_AccountName.setText(_translate("Dialog", "Account Name: "))
        self.label_PublicKey.setText(_translate("Dialog", "Public Key:"))
        self.label_FilesUnread.setText(_translate("Dialog", "TextLabel"))
        self.incomingFilesButton.setText(_translate("Dialog", "Received Files"))
        self.label_4.setText(_translate("Dialog", "Choose file to encrypt"))
        self.pushButton_OpenFile.setText(_translate("Dialog", "Open File"))
        self.label_5.setText(_translate("Dialog", "Choose file recipient"))
        self.groupBox_EncryptionData.setTitle(_translate("Dialog", "Log"))
        self.logFieldLabel.setText(_translate("Dialog", "TextLabel"))
        self.encryptButton.setText(_translate("Dialog", "Encrypt and Send"))

    def addAccountsMenu(self, Dialog):

        directory = 'aleo_keys'

        # iterate over files in
        # that directory
        for filename in os.listdir(directory):
            f = os.path.join(directory, filename)
            # checking if it is a file
            if os.path.isfile(f):
                file = open(f)
                data = json.load(file)

                self.accountSelectBox.addItem(data['AccountName'])

        self.active_account_changed(self.accountSelectBox.currentText())

        self.accountSelectBox.currentTextChanged.connect(self.active_account_changed)


    def addRecipientsMenu(self, Dialog):

        directory = 'aleo_keys'

        # iterate over files in
        # that directory
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

    def active_account_changed(self, s):

        sender_profile_name = s

        aleo_private_key = load_aleo_keys(sender_profile_name)
        sender_secret_key = restore_keys_from_aleo(aleo_private_key)
        sender_public_key = sender_secret_key.public_key()

        aleo_address = load_aleo_address(sender_profile_name)

        print(aleo_address)

        # print(sender_profile_name)

        self.label_AccountName.setText("Account Name: " + sender_profile_name)
        self.label_PublicKey.setText("Account Public Key: " + str(sender_public_key))

        self.label.setPixmap(QtGui.QPixmap("qr/zkdrop_"+aleo_address+".png").scaled(200, 200))
        
        self.ui_logging("Current profile: " + sender_profile_name)

        sqlite_db = sqlite3.connect('zkdrop_database.db')

        with sqlite_db:
            query = "SELECT * FROM ZKDROP_FILES WHERE aleo_address == \"%s\" AND status == \"unread\"" % (aleo_address)
            sql_select = sqlite_db.execute(query)

            self.label_FilesUnread.setText("Unread files: " + str(len(sql_select.fetchall())))

    def recipient_account_changed(self, s):

        sender_profile_name = s

        self.ui_logging("Recipient profile: " + sender_profile_name)

    def getfile(self):
        fname = QtWidgets.QFileDialog.getOpenFileName(None, 'Open File')
        # print(fname[0])
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
        
        dlg = ReceivedFilesDialog()
        dlg.setWindowTitle("Received files")
        dlg.exec()

# File encryption

def encrypt_file():                                                                                     

    sender_profile_name = ui.accountSelectBox.currentText()
    aleo_private_key = load_aleo_keys(sender_profile_name)
    sender_secret_key = restore_keys_from_aleo(aleo_private_key)
    sender_public_key = sender_secret_key.public_key()

    recipient_profile_name = ui.recipientSelectBox.currentText()
    aleo_private_key = load_aleo_keys(recipient_profile_name)
    recipient_secret_key = restore_keys_from_aleo(aleo_private_key)
    recipient_public_key = recipient_secret_key.public_key()

    recipient_address = load_aleo_address(recipient_profile_name)

    # file encryption key
    key = Fernet.generate_key()

    # file itself
    #  Open the file to encrypt
    with open(ui.lineEdit.text(), 'rb') as f:
        data = f.read()

    #file md5 sum (32 bytes)

    data_md5_hash = hashlib.md5(data).hexdigest()

    ui.ui_logging("File to be encrypted and sent to IPFS:\n" + ui.lineEdit.text())

    ciphertext = pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, key, data_md5_hash)

    # print key file
    print(key)

    # encrypt file
    
    fernet = Fernet(key)
    encrypted = fernet.encrypt(data)

    print(encrypted)

    # envelop has 32 bytes md5 sum + ciphertext from pyumbral + encryted data

    head, file_name = os.path.split(ui.lineEdit.text())

    # Write the envelope file
    with open("encrypted_files_tmp/" + file_name + '.encrypted', 'wb') as f:
        f.write(data_md5_hash.encode())
        f.write(ciphertext)
        f.write(encrypted)

    ui.ui_logging("File is encrypted and stored with \n" + ui.lineEdit.text()+'.encrypted' + " filename")

    # ipfs upload

    ipfs_client = ipfshttpclient.connect()

    new_file = ipfs_client.add("encrypted_files_tmp/" + file_name + '.encrypted')

    ui.ui_logging("IPFS data:\n" + str(new_file))

    # print(new_file["Hash"])
    # print(recipient_address)
    
    URL = "http://localhost:3000/api/publish/" + recipient_address + "/" + new_file["Hash"]

    # sending get request and saving the response as response object
    r = requests.get(url = URL)

    print(r)

def sqs_listener():

    sqlite_db = sqlite3.connect('zkdrop_database.db')

    while True:
        
        aleo_address = load_aleo_address(ui.label_AccountName.text().removeprefix('Account Name: '))

        print("checking api for address: " + aleo_address )

        URL = "http://localhost:3000/api/receive/" + aleo_address

        # sending get request and saving the response as response object
        api_response = requests.get(url = URL)

        data = api_response.json()

        # print(api_response.content)
        # print(data["ipfs_hash"])

        if data["ipfs_hash"] == "":
            print("nothing received")

        else:
            print("received a file: " + data["ipfs_hash"])

            with sqlite_db:

                # we need to check whether or not this file is available

                query = "SELECT * FROM ZKDROP_FILES WHERE aleo_address == \"%s\" AND file_ipfs == \"%s\"" % (data["recipient_address"], data["ipfs_hash"])

                sql_select = sqlite_db.execute(query)

                # if not, then we add it to local database
                
                if len(sql_select.fetchall()) == 0:
                    print("File is not exists, adding to local database")            
                    sql_insert = "INSERT INTO ZKDROP_FILES (id, aleo_address, file_ipfs, status ) values(%d, \"%s\", \"%s\", \"%s\")" % (0, data["recipient_address"], data["ipfs_hash"], "unread")
                    sqlite_db.execute(sql_insert)

                    query = "SELECT * FROM ZKDROP_FILES WHERE aleo_address == \"%s\" AND status == \"unread\"" % (aleo_address)
                    sql_select = sqlite_db.execute(query)

                    ui.label_FilesUnread.setText("Unread files: " + str(len(sql_select.fetchall())))

                # if yes, we skip it

                else:
                    print("File is already added to local database")

        sleep(30)

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Dialog = QtWidgets.QDialog()
    ui = Ui_Dialog()
    ui.setupUi(Dialog)
    ui.setLogos(Dialog)
    ui.defineActions(Dialog)
    ui.addAccountsMenu(Dialog)
    ui.addRecipientsMenu(Dialog)

    thread = threading.Thread(target=sqs_listener)
    thread.daemon = True
    thread.start()

    Dialog.show()
    sys.exit(app.exec())
