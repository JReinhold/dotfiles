#!/usr/bin/env bash

echo "----- GETTING SECRETS FROM BITWARDEN VAULT --------"
echo "Log in to Bitwarden:"

BW_SESSION=$(bw login --raw)

# Add Fontawesome Pro NPM token to env variables
FONTAWSOME_NPM_TOKEN=$(bw get item ffee47d6-b143-47bd-a06d-ac2c0126726b --session ${BW_SESSION} | jq '.fields | .[0].value')
echo "export FONTAWESOME_NPM_TOKEN=${FONTAWSOME_NPM_TOKEN}" >> secrets.sh

# Add SSH keys
bw get item 46f79f8e-6850-420b-953b-ac240125c686 --session ${BW_SESSION} | jq --raw-output '.notes' > ~/.ssh/id_rsa
bw get item b09b8552-7838-4001-891e-ac240127c093 --session ${BW_SESSION} | jq --raw-output '.notes' > ~/.ssh/id_rsa.pub
