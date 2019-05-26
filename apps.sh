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

# 1Password - password manager
caski 1password

# Browsers
caski google-chrome
caski brave-browser
caski firefox

# Fira Code Font - Monospace font with ligatures
brew tap caskroom/fonts
caski font-fira-code

# Visual Studio Code - Lightweight editor
caski visual-studio-code
./vscode.sh # setup settings and extensions on first launch

# Alfred - Launcher - NEEDS LICENCE
caski alfred

# BetterTouchTool - tool to customize mouse and keyboard
caski bettertouchtool

# HyperDock - Manage Dock and windows - NEEDS LICENSE
caski hyperdock

# iStat Menus - Hardware Monitor - NEEDS LICENSE
caski istat-menus

# Spectacle - Better window resizer and mover
caski spectacle

# Contexts - Better CMD+TAB
caski contexts

# Caprine - Facebook Messenger app
caski caprine

# Slack - Messaging app
caski slack

# Skype - voice communication app
caski skype

# Toggl - Timer app
caski toggldesktop

# Figma - Webbased vector app
caski figma

# Spotify - Music streaming app
caski spotify

# SourceTree - Git GUI
caski sourcetree

# Postman - API-tester
caski postman

# iTerm2 - terminal
caski iterm2
cp ./com.googlecode.iterm2.plist ~/Library/Preferences/

# JDK - Java Development Kit, needed for Android SDK
caski java

# Android Studio
caski android-studio
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Arduino IDE
caski arduino

# Fluor - enable/disable fn keys for specific apps
caski fluor

# Googles awesome screensaver - needs manual enabling in Sys Prefs
caski google-featured-photos

# Transmission - torrent downloader
caski transmission

# VLC - media player
caski vlc

# Teensy - Flashing tool for teensy boards (ErogDox keyboard)
caski teensy

# Keka - Archive manager (zip, rar, dmg, etc.)
caski keka

# Handbrake - media encoder
caski handbrake

#  Videostream - Cast any video to Chromecast
caski Videostream

# Docker - VM and container handler
caski docker

# Android File Transfer - transfer files to a cabled android device
caski android-file-transfer

# NoSleep - System Utility to toggle wether mac sleeps
caski nosleep

# Quicklook extensions - different extensions to the native quicklook to make it better with different file types
caski qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook qlvideo

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
