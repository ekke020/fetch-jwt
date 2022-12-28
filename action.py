import jwt
import time
import base64
import os
import requests

base_url = "https://api.github.com/app/installations"
key = os.getenv('INPUT_KEY')
app_id = os.getenv('INPUT_ID')

def generate_token(key, app_id):
    time_since_epoch_in_seconds = int(time.time())
    payload = {
        'iat': time_since_epoch_in_seconds,
        'exp': time_since_epoch_in_seconds + (10 * 60),
        'iss': app_id
    }
    token = jwt.encode(payload, key, algorithm='RS256')
    return token

def get_installation_id(token):
    headers = {'Authorization' : f'Bearer {token}', 
                'Accept' : 'application/vnd.github+json'}
    response = requests.get(base_url, headers=headers).json()
    return response[0]['id']

def get_access_token(installation_id, token):
    url = f"{base_url}/{installation_id}/access_tokens"
    headers = {'Authorization' : f'Bearer {token}', 
                'Accept' : 'application/vnd.github+json'}
    response = requests.post(url, headers=headers).json()
    return response['token']

def append_github_output(token):
    with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
        print(f'token={token}', file=fh)

if __name__ == '__main__':
    decoded = base64.b64decode(key)
    token = generate_token(decoded, app_id)
    installation_id = get_installation_id(token)
    access_token = get_access_token(installation_id, token)
    append_github_output(access_token)