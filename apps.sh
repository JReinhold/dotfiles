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
# Uses created "caski" function above
########################################
echo "----- INSTALLING APPLICATIONS --------"

# Bitwarden - password manager
# https://bitwarden.com
caski bitwarden

# Browsers
caski google-chrome # https://google.com/chrome
caski brave-browser # https://brave.com
caski firefox # https://www.mozilla.org/firefox

# Fira Code Font - Monospace font with ligatures
# https://github.com/tonsky/FiraCode
brew tap caskroom/fonts
caski font-fira-code

# Visual Studio Code - Lightweight editor
# https://code.visualstudio.com
caski visual-studio-code

# Alfred - Launcher - NEEDS LICENCE
# https://alfredapp.com
caski alfred3

# BetterTouchTool - tool to customize mouse and keyboard
# https://folivora.ai
caski bettertouchtool

# HyperDock - Manage Dock and windows - NEEDS LICENSE
# https://bahoom.com/hyperdock
caski hyperdock

# iStat Menus - Hardware Monitor - NEEDS LICENSE
# https://bjango.com/mac/istatmenus
caski istat-menus5

# Rectangle - Better window resizer and mover
# https://rectangleapp.com
caski rectangle

# Caprine - Facebook Messenger app
# https://sindresorhus.com/caprine
caski caprine

# Slack - Messaging app
# https://slack.com
caski slack

# Figma - Webbased vector app
# https://figma.com
caski figma

# Spotify - Music streaming app
# https://spotify.com
caski spotify

# Postman - API-tester
# https://postman.com
caski postman

# iTerm2 - terminal
# https://www.iterm2.com
caski iterm2
cp ./com.googlecode.iterm2.plist ~/Library/Preferences/

# OpenJDK - Java Development Kit, needed for Android SDK
# https://openjdk.java.net
caski java

# Android Studio
# https://developer.android.com/studio
caski android-studio
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Arduino IDE
# https://www.arduino.cc/en/main/software
caski arduino

# Fluor - enable/disable fn keys for specific apps
# https://fluorapp.net
caski fluor

# Aerial screensaver
# https://aerialscreensaver.github.io
caski aerial

# Transmission - torrent downloader
# https://transmissionbt.com
caski transmission

# VLC - media player
# https://videolan.org
caski vlc

# Teensy - Flashing tool for teensy boards (ErogDox keyboard)
# https://www.pjrc.com/teensy/loader.html
caski teensy

# Keka - Archive manager (zip, rar, dmg, etc.)
# https://keka.io
caski keka

# Handbrake - media encoder
# https://handbrake.fr
caski handbrake

# Docker - VM and container handler
# https://docker.com
caski docker

# HEY - e-mail app
# https://hey.com
caski hey

# Notion - All things note app
# https://notion.so
caski notion

# Signal - Messaging app
caski signal

# Steam - Game launcher
# https://steampowered.com
caski steam

# TeamViewer - remote desktop tool
# https://teamviewer.com
caski teamviewer

# Microsoft 365 suite - NEEDS LICENSE
# https://www.microsoft.com/da-dk/microsoft-365/mac/microsoft-365-for-mac
caski microsoft-word
caski microsoft-outlook
caski microsoft-excel
caski microsoft-powerpoint
caski microsoft-teams

# Quicklook extensions - different extensions to the native quicklook to make it better with different file types
caski qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook qlvideo
defaults write org.n8gray.QLColorCode hlTheme base16/solarized-dark

########################################
# MAC APP STORE INSTALLS
########################################

# JIRA Cloud
mas install 1475897096
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
