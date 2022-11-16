# -*- coding: utf-8 -*-

###########################################################################
## Python code generated with wxFormBuilder (version 3.10.1-239-ge2e4764f)
## http://www.wxformbuilder.org/
##
## PLEASE DO *NOT* EDIT THIS FILE!
###########################################################################

import wx
import wx.xrc

import sys
import json


import cryptography
from cryptography.fernet import Fernet

import ipfshttpclient


###
# My Libs
###

from lib.keys import load_aleo_keys, restore_keys_from_aleo, pyumbral_encrypt_secret

###########################################################################
## Class MyFrame4
###########################################################################

class MyFrame4 ( wx.Frame ):

    def __init__( self, parent ):
        wx.Frame.__init__ ( self, parent, id = wx.ID_ANY, title = wx.EmptyString, pos = wx.DefaultPosition, size = wx.Size( 575,790 ), style = wx.DEFAULT_FRAME_STYLE|wx.TAB_TRAVERSAL )

        self.SetSizeHints( wx.DefaultSize, wx.DefaultSize )

        bSizer1 = wx.BoxSizer( wx.VERTICAL )

        gbSizer1 = wx.GridBagSizer( 0, 0 )
        gbSizer1.SetFlexibleDirection( wx.BOTH )
        gbSizer1.SetNonFlexibleGrowMode( wx.FLEX_GROWMODE_SPECIFIED )


        gbSizer1.Add( ( 0, 15 ), wx.GBPosition( 0, 1 ), wx.GBSpan( 1, 3 ), wx.EXPAND, 5 )

        sbSizer1 = wx.StaticBoxSizer( wx.StaticBox( self, wx.ID_ANY, wx.EmptyString ), wx.VERTICAL )

        self.m_staticText1 = wx.StaticText( sbSizer1.GetStaticBox(), wx.ID_ANY, u"Your Aleo Account", wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_staticText1.Wrap( -1 )

        self.m_staticText1.SetFont( wx.Font( 18, wx.FONTFAMILY_SWISS, wx.FONTSTYLE_NORMAL, wx.FONTWEIGHT_NORMAL, False, "Lucida Grande" ) )

        sbSizer1.Add( self.m_staticText1, 0, wx.ALL, 5 )


        sbSizer1.Add( ( 0, 25), 1, wx.EXPAND, 5 )

        self.m_staticText2 = wx.StaticText( sbSizer1.GetStaticBox(), wx.ID_ANY, u"Account Name: ", wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_staticText2.Wrap( -1 )

        sbSizer1.Add( self.m_staticText2, 0, wx.ALL, 5 )

        self.m_staticText3 = wx.StaticText( sbSizer1.GetStaticBox(), wx.ID_ANY, u"Account Public Key:", wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_staticText3.Wrap( -1 )

        sbSizer1.Add( self.m_staticText3, 0, wx.ALL, 5 )


        gbSizer1.Add( sbSizer1, wx.GBPosition( 1, 1 ), wx.GBSpan( 1, 1 ), 0, 5 )

        self.m_bitmap1 = wx.StaticBitmap( self, wx.ID_ANY, wx.Bitmap( u"assets/logo.png", wx.BITMAP_TYPE_ANY ), wx.DefaultPosition, wx.DefaultSize, 0 )
        gbSizer1.Add( self.m_bitmap1, wx.GBPosition( 1, 2 ), wx.GBSpan( 1, 1 ), wx.ALL, 5 )


        gbSizer1.Add( ( 0, 30 ), wx.GBPosition( 1, 4 ), wx.GBSpan( 1, 1 ), wx.EXPAND, 5 )

        sbSizer3 = wx.StaticBoxSizer( wx.StaticBox( self, wx.ID_ANY, wx.EmptyString ), wx.VERTICAL )

        self.m_staticText4 = wx.StaticText( sbSizer3.GetStaticBox(), wx.ID_ANY, u"Choose file to encrypt", wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_staticText4.Wrap( -1 )

        sbSizer3.Add( self.m_staticText4, 0, wx.ALL, 5 )

        self.m_filePicker1 = wx.FilePickerCtrl( sbSizer3.GetStaticBox(), wx.ID_ANY, wx.EmptyString, u"Select a file", u"*.*", wx.DefaultPosition, wx.DefaultSize, wx.FLP_DEFAULT_STYLE )
        self.m_filePicker1.SetMinSize( wx.Size( 500,-1 ) )

        sbSizer3.Add( self.m_filePicker1, 0, wx.ALL, 5 )


        gbSizer1.Add( sbSizer3, wx.GBPosition( 3, 1 ), wx.GBSpan( 1, 3 ), wx.EXPAND, 5 )


        gbSizer1.Add( ( 0, 30 ), wx.GBPosition( 1, 5 ), wx.GBSpan( 1, 1 ), wx.EXPAND, 5 )

        sbSizer5 = wx.StaticBoxSizer( wx.StaticBox( self, wx.ID_ANY, wx.EmptyString ), wx.VERTICAL )

        self.m_staticText5 = wx.StaticText( sbSizer5.GetStaticBox(), wx.ID_ANY, u"Secret to be used", wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_staticText5.Wrap( -1 )

        sbSizer5.Add( self.m_staticText5, 0, wx.ALL, 5 )

        self.m_textCtrl1 = wx.TextCtrl( sbSizer5.GetStaticBox(), wx.ID_ANY, u"SomeSecret", wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_textCtrl1.SetMinSize( wx.Size( 500,-1 ) )

        sbSizer5.Add( self.m_textCtrl1, 0, wx.ALL, 5 )


        gbSizer1.Add( sbSizer5, wx.GBPosition( 5, 1 ), wx.GBSpan( 1, 3 ), wx.EXPAND, 5 )

        sbSizer8 = wx.StaticBoxSizer( wx.StaticBox( self, wx.ID_ANY, wx.EmptyString ), wx.VERTICAL )

        self.m_staticText81 = wx.StaticText( sbSizer8.GetStaticBox(), wx.ID_ANY, u"Choose file recepient", wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_staticText81.Wrap( -1 )

        sbSizer8.Add( self.m_staticText81, 0, wx.ALL, 5 )

        m_choice1Choices = [ u"RustamTwo", u"RustamThree" ]
        self.m_choice1 = wx.Choice( sbSizer8.GetStaticBox(), wx.ID_ANY, wx.DefaultPosition, wx.DefaultSize, m_choice1Choices, 0 )
        self.m_choice1.SetSelection( 0 )
        sbSizer8.Add( self.m_choice1, 0, wx.ALL, 5 )


        gbSizer1.Add( sbSizer8, wx.GBPosition( 7, 1 ), wx.GBSpan( 1, 3 ), wx.EXPAND, 5 )

        self.m_button1 = wx.Button( self, wx.ID_ANY, u"Encrypt and Store", wx.DefaultPosition, wx.DefaultSize, 0 )
        gbSizer1.Add( self.m_button1, wx.GBPosition( 9, 1 ), wx.GBSpan( 1, 1 ), wx.ALL, 5 )

        sbSizer6 = wx.StaticBoxSizer( wx.StaticBox( self, wx.ID_ANY, u"Logs" ), wx.VERTICAL )

        sbSizer6.SetMinSize( wx.Size( -1,200 ) )
        self.m_staticText8 = wx.StaticText( sbSizer6.GetStaticBox(), wx.ID_ANY, wx.EmptyString, wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_staticText8.Wrap( 550 )

        sbSizer6.Add( self.m_staticText8, 0, wx.ALL, 5 )


        gbSizer1.Add( sbSizer6, wx.GBPosition( 10, 1 ), wx.GBSpan( 4, 3 ), wx.EXPAND, 5 )

        self.m_bitmap3 = wx.StaticBitmap( self, wx.ID_ANY, wx.Bitmap( u"assets/aleo.png", wx.BITMAP_TYPE_ANY ), wx.DefaultPosition, wx.DefaultSize, 0 )
        self.m_bitmap3.SetMaxSize( wx.Size( 150,50 ) )

        gbSizer1.Add( self.m_bitmap3, wx.GBPosition( 14, 2 ), wx.GBSpan( 1, 1 ), wx.ALL, 5 )


        bSizer1.Add( gbSizer1, 1, wx.EXPAND, 5 )


        self.SetSizer( bSizer1 )
        self.Layout()

        self.Centre( wx.BOTH )

        # Connect Events
        self.Bind( wx.EVT_ACTIVATE, self.ui_init )
        self.m_button1.Bind( wx.EVT_LEFT_UP, self.encrypt_file )

    def __del__( self ):
        pass






    # Virtual event handlers, override them in your derived class
    def ui_init( self, event ):
        sender_profile_name = "RustamOne"
        aleo_private_key = load_aleo_keys(sender_profile_name)
        sender_secret_key = restore_keys_from_aleo(aleo_private_key)
        sender_public_key = sender_secret_key.public_key()

        print(sender_profile_name)

        self.m_staticText2.SetLabel("Account Name: " + sender_profile_name)
        self.m_staticText3.SetLabel("Account Public Key: " + str(sender_public_key))

        event.Skip()

    def encrypt_file( self, event ):

        sender_profile_name = "RustamOne"
        aleo_private_key = load_aleo_keys(sender_profile_name)
        sender_secret_key = restore_keys_from_aleo(aleo_private_key)
        sender_public_key = sender_secret_key.public_key()

        recipient_profile_name = "RustamTwo"
        aleo_private_key = load_aleo_keys(recipient_profile_name)
        recipient_secret_key = restore_keys_from_aleo(aleo_private_key)
        recipient_public_key = recipient_secret_key.public_key()

        key = Fernet.generate_key()

        self.m_textCtrl1.SetValue(key)

        self.m_staticText8.SetLabel("")

        self.m_staticText8.SetLabel(self.m_staticText8.GetLabel() + "File to be encrypted and sent to IPFS:\n" + self.m_filePicker1.GetPath() + "\n\n")


        self.m_staticText8.SetLabel(self.m_staticText8.GetLabel() + "Encryption key to be used:\n" + self.m_textCtrl1.GetValue() + "\n\n")


        ciphertext = pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, self.m_textCtrl1.GetValue())

        print(ciphertext)

        #  Open the file to encrypt
        with open(self.m_filePicker1.GetPath(), 'rb') as f:
            data = f.read()


        fernet = Fernet(key)
        encrypted = fernet.encrypt(data)

        envelope = ciphertext + encrypted

        # Write the encrypted file
        with open(self.m_filePicker1.GetPath()+'.encrypted', 'wb') as f:
            f.write(envelope)


        client = ipfshttpclient.connect('/ip4/127.0.0.1/tcp/5001/http')
        
        new_file = client.add(self.m_filePicker1.GetPath()+'.encrypted')

        self.m_staticText8.SetLabel(self.m_staticText8.GetLabel() + "IPFS data:\n" + str(new_file) + "\n\n")

        self.m_staticText8.Wrap(500)


        event.Skip()



app = wx.App()
frame = MyFrame4(None)
frame.Show()
app.MainLoop()
