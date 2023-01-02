---
parent: git
title:  app-token-v2 (src)
nav_exclude: true
---

# Impersonate a Github app

This action helps you retrieve an authenticated app token with a GitHub app id & a base64 encoded PEM file. You can use this key inside an actions workflow instead of `GITHUB_TOKEN`, to impersonate the App.

## Inputs

| Key | Description                                                                            |
|-----|----------------------------------------------------------------------------------------|
| key | a base64 encoded string version of your PEM file used to authenticate as a GitHub App. |
| id  | The ID of the App                                                                      |

## Outputs

| Key   | Description                                                                                |
|-------|--------------------------------------------------------------------------------------------|
| token | The access token that can be used as a substitute for the default value of `GITHUB_TOKEN`. |


**Language**: docker

<!-- HAND_WRITTEN_DOCS_BELOW -->

# Impersonate Your GitHub App In A GitHub Action

This action will generate an access token for a GitHub App so that the app can authenticate itself and make API requests on behalf of the installation. This is used as a substitute for the default value of `GITHUB_TOKEN`.

## Why Would You Do This?

In general, authenticating as a GitHub App can be a good choice if you are building a tool or integration that needs to make API requests on behalf of an installation, and you want to take advantage of the security, granular permissions, and higher rate limits that GitHub Apps offer.

- Improved security: By authenticating as a GitHub App, you can use a private key to sign your requests, rather than a username and password. This reduces the risk of someone else gaining access to your account if your password is compromised.
- More granular permissions: When you authenticate as a GitHub App, you can request specific permissions (e.g. read-only access to repositories, or the ability to create issues). This allows you to fine-tune the permissions your app has, rather than giving it access to everything the user has access to.
- Increased rate limits: GitHub Apps have higher rate limits than individual users, so you can make more API requests in a shorter period of time. This can be useful if you are building a tool that makes a lot of API requests.
- Easy to use with automation: Because GitHub Apps are authenticated with a private key, you can use them in automated scripts or continuous integration/continuous deployment (CI/CD) systems without having to store a username and password.

# Usage

1. If you do not already own a GitHub App you want to impersonate, [create a new GitHub App](https://developer.github.com/apps/building-github-apps/creating-a-github-app/) with your desired permissions.  If only creating a new app for the purposes of impersonation by Actions, you do not need to provide a `Webhook URL or Webhook Secret`

2. Install the App on your repositories.

3. See [action.yml](action.yml) for the api spec.

Example:

```yml
steps:
- name: Get access token
  id: get_token
  uses: ./.github/shared-actions/git/1.0/app-token-v2
  with:
    key: ${{ secrets.APP_PEM }}
    id: ${{ secrets.APP_ID }}

- name: Authenticate as App
  uses: actions/checkout@v3
  with:
    fetch-depth: 0
    token: ${{ steps.get_token.outputs.token }}
```

**Note: The input `key` needs to be base64 encoded.**  You can encode your private key file like this from the terminal:

```
cat your_app_key.pem | base64 -w 0 && echo
```
*The base64 encoded string must be on a single line, so be sure to remove any linebreaks when creating `key` in your project's GitHub secrets.*

## Mandatory Inputs

- `key`: A base64 encoded string version of your PEM file used to authenticate as a GitHub App.

- `id`: The ID of the app.

## Outputs

- `token`: The access token that can be used as a substitute for the default value of `GITHUB_TOKEN`

