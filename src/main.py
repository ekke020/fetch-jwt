import jwt
import time
import base64
import os


def generate_token(key, app_id):
    time_since_epoch_in_seconds = int(time.time())
    payload = {
        'iat': time_since_epoch_in_seconds,
        'exp': time_since_epoch_in_seconds + (10 * 60),
        'iss': app_id
    }
    token = jwt.encode(payload, key, algorithm='RS256')

    return token


if __name__ == '__main__':
    key = os.environ["KEY"]
    app_id = os.environ["ID"]
    decoded = base64.b64decode(key)
    token = generate_token(decoded, app_id)
    print(f'::set-output name=token::{token}')
