require 'openssl'

rsa_private = OpenSSL::PKey::RSA.generate(2048)
rsa_public = rsa_private.public_key

secret = 'Ruby'

enc_data = rsa_public.public_encrypt(secret)

rsa_private.private_decrypt(enc_data)
