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
brew doctor
brew update
brew tap homebrew/cask-drivers

# Run install scripts
./10manual-installs.sh
./20clis.sh
./30bitwarden.sh
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

printf "\nINSTALLED APPS\n" >> ~/Desktop/appList.txt
brew list --formulae >> ~/Desktop/appList.txt
brew list --cask >> ~/Desktop/appList.txt
mas list >> ~/Desktop/appList.txt
printf "\n\n"
announce "All done"
announce "A list of the apps installed have been placed on your desktop: appList.txt"
open ~/Desktop/appList.txt