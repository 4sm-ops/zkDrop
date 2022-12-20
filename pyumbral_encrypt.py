# Usage:
# python3 pyumbral_generate_keys_from_aleo.py [SENDER_ACCOUNT_NAME] [RECIPIENT_ACCOUNT_NAME]

import os
import string
import time    

import hashlib
import random

from umbral import VerifiedKeyFrag, KeyFrag, PublicKey, SecretKey, Signer, encrypt, decrypt_original, generate_kfrags, reencrypt, CapsuleFrag, decrypt_reencrypted, Capsule

import sys
import json

from lib.keys import load_aleo_keys, restore_keys_from_aleo, pyumbral_encrypt_secret


import cryptography
from cryptography.fernet import Fernet

# MAIN #

# Get Sender Profile name and keys

sender_profile_name = sys.argv[1]
aleo_private_key = load_aleo_keys(sys.argv[1])
sender_secret_key = restore_keys_from_aleo(aleo_private_key)
sender_public_key = sender_secret_key.public_key()


# Get Recipient Profile name and keys

recipient_profile_name = sys.argv[2]
aleo_private_key = load_aleo_keys(sys.argv[2])
recipient_secret_key = restore_keys_from_aleo(aleo_private_key)
recipient_public_key = recipient_secret_key.public_key()

# Encryption

key = Fernet.generate_key()

print(key)

pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, key)
