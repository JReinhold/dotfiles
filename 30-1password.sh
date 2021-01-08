#!/usr/bin/env bash
#######################################
# 1PASSWORD
# Logs in and gets secret from 1Password vaults 
#######################################
source ./05functions.sh
announce "Getting secrets from 1Password vault - log in to 1Password:"

# Ensure CLI is up-to-date
op update

# Sign in to 1Password CLI and set OP_SESSION variable. retry up to 5 times if password fails
opsignin(){
    n=0
    until [ "$n" -ge 5 ]
    do
        OP_SESSION=$(op signin --raw my jeppe@hey.com) && break
        n=$((n+1))
    done
}
opsignin

# Add Fontawesome Pro NPM token to env variables
FONTAWSOME_NPM_TOKEN=$(op get item ff2e37is2nbabkggbcfsqsho7y --session ${OP_SESSION} | jq '.details.sections | .[0].fields | .[1].v')
echo "export FONTAWESOME_NPM_TOKEN=${FONTAWSOME_NPM_TOKEN}" >> secrets.sh
chmod 755 secrets.sh

# Add SSH keys
mkdir ~/.ssh
op get document ct4qum3zwfd4pbbyxabya5lcri --output ~/.ssh/lolid_rsa --session $OP_SESSION
op get document wq5f46kfp5ekjdjt47jbazrmka --output ~/.ssh/lolid_rsa.pub --session $OP_SESSION