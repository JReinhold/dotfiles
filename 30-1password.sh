#!/usr/bin/env bash
#######################################
# 1PASSWORD
# Logs in and gets secret from 1Password vaults 
#######################################
source ./05functions.sh
announce "Getting secrets from 1Password vault - log in to 1Password:"

# Sign in to 1Password CLI and set OP_SESSION variable. retry up to 5 times if password fails
opsignin(){
    n=0
    until [ "$n" -ge 5 ]
    do
        OP_SESSION=$(op signin --raw) && break
        n=$((n+1))
    done
}
opsignin

touch secrets.sh
chmod 755 secrets.sh

# Add SSH keys
mkdir ~/.ssh
op document get "SSH private key - main" --output ~/.ssh/id_rsa --session $OP_SESSION
op document get "SSH public key - main" --output ~/.ssh/id_rsa.pub --session $OP_SESSION
