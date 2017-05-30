#!/usr/bin/env bash

#Setups the required tools for the script
mkdir ~/dev

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew doctor
brew update

#Run install scripts
./clis.sh
./apps.sh
./node.sh
./aliases.sh
./functions.sh
./settings.sh

cp .editorconfig ~/.editorconfig
cp .gitignore ~/.gitignore_global
git config --global core.excludesfile '~/.gitignore_global'

########################################
# FINALS
########################################
echo "DONE INSTALLING"
brew cleanup
brew doctor

printf "\nINSTALLED APPS\n" >> ~/Desktop/appList.txt
brew list >> ~/Desktop/appList.txt
brew cask list >> ~/Desktop/appList.txt
mas list >> ~/Desktop/appList.txt
printf "\n\n"
echo "DONE"
echo "A list of the apps installed have been placed on your desktop:"
echo "appList.txt"
