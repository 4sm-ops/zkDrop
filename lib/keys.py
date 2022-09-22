import os
import string

import hashlib

from umbral import PublicKey, SecretKey

import sys
import json

# Load JSON file with Aleo Keys

def load_aleo_keys(profileName):

    f = open("aleo_keys/aleo_{}_key.json".format(profileName))
    data = json.load(f)

    return data['AleoPrivateKey']

# Aleo Private Key -> Umbral SecretKey PoC function

def restore_keys_from_aleo(aleoPrivateKey):
    
    # Calculate sha256 hash from sample Aleo Private Key
    # snarkos experimental new_account
    aleo_private_key_hash = hashlib.sha256()

    # aleo_private_key_hash.update(b"{}".format(aleoPrivateKey))
    aleo_private_key_hash.update(bytes(aleoPrivateKey,'UTF-8'))    

    # We use .from_bytes function to read new SecretKey from sha256() output
    # .from_bytes function expects 32 bytes
    # that's why we cannot use Aleo Private Key itself (which is 59 bytes long)

    sk = SecretKey.from_bytes(aleo_private_key_hash.digest())

    # print(sk.to_secret_bytes())
    # print(sk.serialized_size())
    
    # Generating public key from SecretKey
    pk_from_sk = sk.public_key()

    # Validation of data types
    
    assert type(sk) == SecretKey
    assert type(pk_from_sk) == PublicKey

    return sk