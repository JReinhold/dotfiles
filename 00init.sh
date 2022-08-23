#!/usr/bin/env bash
#######################################
# INITIAL SCRIPT
# Runs all other scripts
#######################################
source ./05functions.sh
announce "Initialization started"

#Setups the required tools for the script
mkdir ~/dev

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
eval "$(/opt/homebrew/bin/brew shellenv)"
brew doctor
brew update
brew tap homebrew/cask-drivers
brew tap homebrew/cask-versions

# Run install scripts
./10manual-installs.sh
./20clis.sh
./30-1password.sh
./40mackup.sh
./50apps.sh
./60node.sh
./70settings.sh

########################################
# FINALS
########################################
announce "Installs done - cleaning up"
brew cleanup
brew doctor

mas list >> ~/Desktop/appList.txt
printf "\n\n"
announce "All done"
announce "A list of the apps installed have been placed on your desktop: appList.txt"
open ~/Desktop/appList.txt