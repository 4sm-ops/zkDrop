# Form implementation generated from reading ui file 'pyqt_zkdrop.ui'
#
# Created by: PyQt6 UI code generator 6.4.0
#
# WARNING: Any manual changes made to this file will be lost when pyuic6 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt6 import QtCore, QtGui, QtWidgets


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
        self.pushButton_newAccount = QtWidgets.QPushButton(self.groupBox)
        self.pushButton_newAccount.setObjectName("pushButton_newAccount")
        self.verticalLayout.addWidget(self.pushButton_newAccount)
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
        self.scrollAreaWidgetContents.setGeometry(QtCore.QRect(0, 0, 446, 76))
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
        self.pushButton_newAccount.setText(_translate("Dialog", "Create new Aleo account"))
        self.label_FilesUnread.setText(_translate("Dialog", "TextLabel"))
        self.incomingFilesButton.setText(_translate("Dialog", "Received Files"))
        self.label_4.setText(_translate("Dialog", "Choose file to encrypt"))
        self.pushButton_OpenFile.setText(_translate("Dialog", "Open File"))
        self.label_5.setText(_translate("Dialog", "Choose file recipient"))
        self.groupBox_EncryptionData.setTitle(_translate("Dialog", "Log"))
        self.logFieldLabel.setText(_translate("Dialog", "TextLabel"))
        self.encryptButton.setText(_translate("Dialog", "Encrypt and Send"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Dialog = QtWidgets.QDialog()
    ui = Ui_Dialog()
    ui.setupUi(Dialog)
    Dialog.show()
    sys.exit(app.exec())