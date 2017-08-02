#!/usr/bin/env bash

# Install function, with notification support
# first parameter is app to install
caski () {
	if brew cask install $1 ; then
		terminal-notifier -message "$1 installed successfully 🎉🎈" -title "🍺 Cask Install" -sound default -timeout 10
	else
		printf "FAILED: $1\n" >> ~/Desktop/appList.txt
		terminal-notifier -message " ⛔️ $1 INSTALLATION FAILED" -title "⚠️  Cask Install" -sound default -timeout 10
	fi
}

########################################
# CASK INSTALLS
# All the GUI apps - non-Mac App Store
# Uses created "caski" function from init.sh
########################################
echo "----- WILL NOW INSTALL APPS -------"

#1Password - password manager
caski 1password

#Google Chrome Browser
caski google-chrome

#Fira Code Font - Monospace font with ligatures
brew tap caskroom/fonts
caski font-fira-code

#Visual Studio Code - Lightweight editor
caski visual-studio-code
./vscode.sh #setup settings and extensions on first launch

#Alfred - Launcher - NEEDS LICENCE
caski alfred

#BetterTouchTool - tool to customize mouse and keyboard
caski bettertouchtool

#HyperDock - Manage Dock and windows - NEEDS LICENSE
caski hyperdock

#iStat Menus - Hardware Monitor - NEEDS LICENSE
caski istat-menus

#Spectacle - Better window resizer and mover
caski spectacle

#Contexts - Better CMD+TAB
caski contexts

#Wavebox - Single app for multiple web accounts, Inbox, Google Drive, Slack, etc.
caski wavebox

#Caprine - Facebook Messenger app
caski caprine

#Slack - Messaging app
caski slack

#Screenhero - Screensharing app
caski screenhero

#Skype - voice communication app
caski skype

#Toggl - Timer app
caski toggldesktop

#Microsoft Office 2016
#caski microsoft-office

#Figma - Webbased vector app
caski figma

#Spotify - Music streaming app
caski spotify

#SourceTree - Git GUI
caski sourcetree

#Postman - API-tester
caski postman

#OpenConnect-GUI - Open source version of Cisco AyConnect
caski openconnect-gui

#JDK - Java Development Kit, needed for Android SDK
caski java

#Android Studio
caski android-studio
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#Arduino IDE
caski arduino

#Googles awesome screensaver - needs manual enabling in Sys Prefs
caski google-featured-photos

#Transmission - torrent downloader
caski transmission

#VLC - media player
caski vlc

#Framer.js - prototyping app
#caski framer

#Keka - Archive manager (zip, rar, dmg, etc.)
caski keka

#Handbrake - media encoder
caski handbrake

#Docker - VM and container handler
caski docker

#Android File Transfer - transfer files to a cabled android device
caski android-file-transfer

#NoSleep - System Utility to toggle wether mac sleeps
caski nosleep

#DropBox - Cloud storage app
#caski dropbox

#Google Drive - Cloud storage app
#caski google-drive

########################################
# MAC APP STORE INSTALLS
########################################

brew install mas
# GIPHY Capture - To create Gifs
mas install 668208984
# Keynote
mas install 409183694
# Pages
mas install 409201541
# Numbers
mas install 4092038250

# Xcode - Apple Development tools - BEWARE, TAKES A LONG TIME!!
#mas install 497799835
echo "----- APPS DONE-------"
