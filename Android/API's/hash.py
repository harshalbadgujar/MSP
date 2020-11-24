import hmac
import hashlib
import binascii
import hmac
def create_sha256_signature(secret_key, total_params):
    Sec   = bytes(secret_key, 'utf-8')
    Param = bytes(total_params, 'utf-8')
    signature = hmac.new(Sec, Param, hashlib.sha256).hexdigest()
    return   signature