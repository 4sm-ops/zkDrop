# import modules

import sys

import qrcode
from PIL import Image

print(sys.argv[1])

# taking image which user wants
# in the QR code center
Logo_link = 'assets/aleo-logo-qr.png'

logo = Image.open(Logo_link)

# taking base width
basewidth = 70

# # adjust image size
# wpercent = (basewidth/float(logo.size[0]))
# hsize = int((float(logo.size[1])*float(wpercent)))
# logo = logo.resize((basewidth, hsize), Image.ANTIALIAS)

QRcode = qrcode.QRCode(
	error_correction=qrcode.constants.ERROR_CORRECT_H,
	border=1,
	box_size=7,
	version=1
)

# taking url or text
url = 'https://www.zkdrop.xyz/api/account/'+sys.argv[1]

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
pos = ((QRimg.size[0] - logo.size[0]) // 2,
	(QRimg.size[1] - logo.size[1]) // 2)
QRimg.paste(logo, pos)

# save the QR code generated
QRimg.save('qr/zkdrop_' + sys.argv[1] + '.png')

# print('QR code generated!')
