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

def append_github_output(token):
    with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
        print(f'token={token}', file=fh)

if __name__ == '__main__':
    key = os.getenv('INPUT_KEY')
    app_id = os.getenv('INPUT_ID')
    decoded = base64.b64decode(key)
    token = generate_token(decoded, app_id)
    # append_github_output(token)