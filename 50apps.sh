#!/usr/bin/env bash
########################################
# CASK INSTALLS
# Installs all the GUI, non-Mac App Store apps
########################################
source ./05functions.sh
announce "Installing cask apps"

# 1Password - password manager
# https://1password.com
caski 1password
 
# Browsers
caski brave-browser # https://brave.com
caski google-chrome # https://google.com/chrome
caski firefox # https://www.mozilla.org/firefox

# Fira Code Font - Monospace font with ligatures
# https://github.com/tonsky/FiraCode
brew tap homebrew/cask-fonts
caski font-fira-code

# Visual Studio Code - Lightweight editor
# https://code.visualstudio.com
caski visual-studio-code

# Alfred - Launcher - NEEDS LICENCE
# https://alfredapp.com
caski alfred3

# Logitech Options - configure Logiceh peripherals
# https://www.logitech.com/en-us/product/options
caski logitech-options

# BetterTouchTool - tool to customize mouse and keyboard
# https://folivora.ai
caski bettertouchtool

# HyperDock - Manage Dock and windows - NEEDS LICENSE
# https://bahoom.com/hyperdock
# caski hyperdock

# iStat Menus - Hardware Monitor - NEEDS LICENSE
# https://bjango.com/mac/istatmenus
caski istat-menus5

# Rectangle - Better window resizer and mover
# https://rectangleapp.com
caski rectangle

# Facebook Messenger app
# https://messenger.com
caski messenger

# Slack - Messaging app
# https://slack.com
caski slack

# Figma - Webbased vector app
# https://figma.com
caski figma

# Spotify - Music streaming app
# https://spotify.com
caski spotify

# iTerm2 - terminal
# https://www.iterm2.com
caski iterm2
cp ./com.googlecode.iterm2.plist ~/Library/Preferences/

# Postman - API-tester
# https://postman.com
caski postman

# OpenJDK - Java Development Kit, needed for Android SDK
# https://adoptopenjdk.net/
caski adoptopenjdk

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
# caski fluor

# Aerial screensaver
# https://aerialscreensaver.github.io
caski aerial

# NordVPN - VPN
# https://nordvpn.com
caski nordvpn

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

# Transmission - torrent downloader
# https://transmissionbt.com
caski transmission

# Microsoft 365 suite - NEEDS LICENSE
# https://www.microsoft.com/da-dk/microsoft-365/mac/microsoft-365-for-mac
caski microsoft-word
caski microsoft-outlook
caski microsoft-excel
caski microsoft-powerpoint
caski microsoft-teams

# Quicklook extensions - different extensions to the native quicklook to make it better with different file types
caski qlcolorcode qlmarkdown quicklook-json webpquicklook qlvideo
defaults write org.n8gray.QLColorCode hlTheme base16/solarized-dark

########################################
# MAC APP STORE INSTALLS
########################################
announce "Installing Mac App Store apps"

# Keynote
mas install 409183694
# Pages
mas install 409201541
# Numbers
mas install 409203825

# Xcode - Apple Development tools - BEWARE, TAKES A LONG TIME!!
#mas install 497799835
