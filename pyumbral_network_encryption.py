# Usage:
# python3 pyumbral_generate_keys_from_aleo.py [ACCOUNT_NAME]

import os
import string
import time    

import hashlib
import random

from umbral import PublicKey, SecretKey, Signer, encrypt, decrypt_original, generate_kfrags, Capsule # KeyFrag, reencrypt, CapsuleFrag, decrypt_reencrypted # unused import


import sys
import json

from nucypher.characters.lawful import Ursula

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

    # print(aleoPrivateKey)
    # print(aleo_private_key_hash.digest())
    # print(aleo_private_key_hash.digest_size)

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


# Aleo Encrypt Secret [String]

def pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, secret_text):

    sender_secret_key = sender_secret_key
    sender_public_key = sender_secret_key.public_key()

    sender_signing_key = sender_secret_key
    sender_verifying_key = sender_signing_key.public_key()
    sender_signer = Signer(sender_signing_key)


    # Add Ursula node

    seed_uri = 'https://lynx.nucypher.network:9151'
    ursula = Ursula.from_seed_and_stake_info(seed_uri=seed_uri)

    # Encrypt with a public key
    # Now let’s encrypt data with Alice’s public key. Invocation of umbral.encrypt() returns both a capsule and a ciphertext. Note that anyone with Alice’s public key can perform this operation.

    plaintext = bytes(secret_text,'UTF-8')

    # encrypt with sender or recipient public key

    capsule, ciphertext = encrypt(recipient_public_key, plaintext)
    # capsule, ciphertext = encrypt(sender_public_key, plaintext) - CORRECT VERSION


    # Alice grants access to Bob by generating kfrags
    # When Alice wants to grant Bob access to view her encrypted data, 
    # she creates re-encryption key fragments, or “kfrags”, which are next sent to N proxies or Ursulas.

    kfrags = generate_kfrags(delegating_sk=sender_secret_key,
                            receiving_pk=recipient_public_key,
                            signer=sender_signer,
                            threshold=10,
                            shares=20)
    print("kfrags output")
    print(kfrags)

    # Save Ciphertext to file
    # The "rb" clause tells the open method to read the file as bytes

    file = open("secret_sharing/ciphertext_from_{}_to_{}_{}".format(sender_profile_name, recipient_profile_name, int(time.time()) ), 'wb')
    file.write(ciphertext)
    file.close()

    # Save Ciphertext to file
    # The "rb" clause tells the open method to read the file as bytes

    file = open("secret_sharing/capsule_from_{}_to_{}_{}".format(sender_profile_name, recipient_profile_name, int(time.time()) ), 'wb')
    file.write(bytes(capsule))
    file.close()

    # Save kfrags to file
    # The "rb" clause tells the open method to read the file as bytes

    # file = open("secret_sharing/kfrags_from_{}_{}_key.json".format(sender_profile_name, int(time.time()) ), 'wb')
    # file.write(bytes(kfrags))
    # file.close()


    # with open("secret_sharing/kfrags_from_{}_{}_key.json".format(sender_profile_name, int(time.time()) ), 'w') as fp:
    #     for item in kfrags:
    #         # write each item on a new line
    #         fp.write("%s\n" % item)


def pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, encrypted_ciphertext, capsule_file):

    print("Received Ciphertext:")

    # Read the cyphertext file
    file = open("secret_sharing/{}".format(encrypted_ciphertext), "rb")   # The "rb" clause tells the open method to read the file as bytes
    ciphertext = file.read()

    print(ciphertext)

    print("Received Capsule:")

    # Read the Capsule file
    file = open("secret_sharing/{}".format(capsule_file), "rb")   # The "rb" clause tells the open method to read the file as bytes
    plaintext = file.read()

    capsule = Capsule._from_exact_bytes(plaintext)

    print(capsule)

    print("Received kfrags:")
    # Read the kgrags file

    # # empty list to read list from a file
    # kfrags = []

    # # open file and read the content in a list
    # with open("secret_sharing/{}".format(kfrags_file), 'r') as fp:
    #     for line in fp:
    #         # remove linebreak from a current name
    #         # linebreak is the last character of each line
    #         x = line[:-1]

    #         # add current item to the list
    #         kfrags.append(x)

    # # # display list
    # # print(type(kfrags))

    # file = open("secret_sharing/{}".format(kfrags_file), "rb")   # The "rb" clause tells the open method to read the file as bytes
    # plaintext = file.read()

    # kfrags = KeyFrag._from_exact_bytes(plaintext)

    # print(kfrags)

    # recepient Public key

    recipient_public_key = recipient_secret_key.public_key()

    # test = 123

    # # Bob receives a capsule
    # # Next, let’s generate a key pair for Bob, and pretend to send him the capsule 
    # # through a side channel like S3, IPFS, Google Cloud, Sneakernet, etc.

    # bobs_capsule = capsule

    # # Bob fails to open the capsule
    # # If Bob attempts to open a capsule that was not encrypted for his public key, 
    # # or re-encrypted for him by Ursula, he will not be able to open it.


    print("Decrypted original secret:")
    
    decrypted_secret = decrypt_original(delegating_sk=recipient_secret_key, capsule=capsule, ciphertext=ciphertext)

    print(decrypted_secret)

    # Ursulas perform re-encryption
    # Bob asks several Ursulas to re-encrypt the capsule so he can open it. 
    # Each Ursula performs re-encryption on the capsule using the kfrag provided by Alice, obtaining this way a “capsule fragment”, or cfrag. 

    # # All kfrags from above
    # # M - Threshold
    # kfrags = random.sample(kfrags, 10)      

    # cfrags = list()                 # Bob's cfrag collection
    # for kfrag in kfrags:
    #     cfrag = reencrypt(capsule=capsule, kfrag=kfrag)
    #     cfrags.append(cfrag)        # Bob collects a cfrag

    # # Decryption
    # # Bob checks the capsule fragments
    # # If Bob received the capsule fragments in serialized form, he can verify that 
    # # they are valid and really originate from Alice, using Alice’s public keys.

    # suspicious_cfrags = [CapsuleFrag.from_bytes(bytes(cfrag)) for cfrag in cfrags]
    # cfrags = [cfrag.verify(capsule, verifying_pk=sender_public_key,
    #                    delegating_pk=sender_public_key,
    #                        receiving_pk=recipient_public_key,
    #                        )
    #           for cfrag in suspicious_cfrags]
    
    # # Bob opens the capsule

    # # Finally, Bob decrypts the re-encrypted ciphertext using his key.

    # decrypted_cleartext = decrypt_reencrypted(receiving_sk=recipient_secret_key,
    #                                 delegating_pk=sender_public_key,
    #                                 capsule=capsule,
    #                                 verified_cfrags=cfrags,
    #                                 ciphertext=ciphertext)

    # # Verify decryption result

    # print("Bob decrypted text:")
    # print(decrypted_cleartext)


# MAIN #

# Get Sender Profile name

sender_profile_name = sys.argv[1]
recipient_profile_name = sys.argv[2]

# Load Aleo private key from json file

aleo_private_key = load_aleo_keys(sys.argv[1])

# Generate pyUmbral keys from Aleo private key 

sender_secret_key = restore_keys_from_aleo(aleo_private_key)
sender_public_key = sender_secret_key.public_key()

# Encrypt Secret [Sting]

# Get recipient public key

aleo_private_key = load_aleo_keys(sys.argv[2])

recipient_secret_key = restore_keys_from_aleo(aleo_private_key)

recipient_public_key = recipient_secret_key.public_key()


pyumbral_encrypt_secret(sender_secret_key, sender_profile_name, recipient_public_key, recipient_profile_name, "Aleo + pyUmbral = Privacy")

#pyumbral_decrypt_secret(recipient_secret_key, sender_public_key, "ciphertext_from_RustamOne_to_RustamTwo_1663694412", "capsule_from_RustamOne_to_RustamTwo_1663694412")

