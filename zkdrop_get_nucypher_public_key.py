from binascii import hexlify, unhexlify

from lib.keys import load_aleo_keys, restore_keys_from_aleo, pyumbral_encrypt_secret, load_aleo_address, pyumbral_decrypt_secret


nucypher_secret_key = restore_keys_from_aleo("APrivateKey1zkp2eS6gQy5unzZUaR4xLH9TwKy3Jt2edCrv34o4cPuc12Q")
nucypher_public_key = nucypher_secret_key.public_key()


print(str(hexlify(bytes(nucypher_public_key)), "utf-8"))

