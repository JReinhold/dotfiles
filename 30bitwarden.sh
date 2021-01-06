#!/usr/bin/env bash

announce "Getting secrets from Bitwarden vault - log in to Bitwarden:"

# Log in to Bitwarden CLI and set BW_SESSION variable. retry up to 5 times if password fails
bwlogin(){
    n=0
    until [ "$n" -ge 5 ]
    do
        BW_SESSION=$(bw login --raw) && break
        n=$((n+1))
    done
}

# Add Fontawesome Pro NPM token to env variables
FONTAWSOME_NPM_TOKEN=$(bw get item ffee47d6-b143-47bd-a06d-ac2c0126726b --session ${BW_SESSION} | jq '.fields | .[0].value')
echo "export FONTAWESOME_NPM_TOKEN=${FONTAWSOME_NPM_TOKEN}" >> secrets.sh
ln -s ./secrets.sh 
# Add SSH keys
bw get item 46f79f8e-6850-420b-953b-ac240125c686 --session ${BW_SESSION} | jq --raw-output '.notes' > ~/.ssh/id_rsa
bw get item b09b8552-7838-4001-891e-ac240127c093 --session ${BW_SESSION} | jq --raw-output '.notes' > ~/.ssh/id_rsa.pub
