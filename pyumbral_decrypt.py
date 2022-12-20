# Usage:
# python3 pyumbral_generate_keys_from_aleo.py [ACCOUNT_NAME]

import os
import string
import time    

import hashlib
import random

from umbral import VerifiedKeyFrag, KeyFrag, PublicKey, SecretKey, Signer, encrypt, decrypt_original, generate_kfrags, reencrypt, CapsuleFrag, decrypt_reencrypted, Capsule

import sys
import json

from lib.keys import load_aleo_keys, restore_keys_from_aleo, pyumbral_decrypt_secret 


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

print(bytes(recipient_public_key))

# Get ciphertext, capsule and kfrags files

encrypted_ciphertext = sys.argv[3]
capsule_file = sys.argv[4]
kfrags_file = sys.argv[5]

# Decryption

pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, encrypted_ciphertext, capsule_file, kfrags_file)

