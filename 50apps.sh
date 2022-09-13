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
caski google-chrome # https://google.com/chrome
caski firefox # https://www.mozilla.org/firefox

# Fira Code Font - Monospace font with ligatures
# https://github.com/tonsky/FiraCode
brew tap homebrew/cask-fonts
caski font-fira-code

# Visual Studio Code - Lightweight editor
# https://code.visualstudio.com
caski visual-studio-code

# Raycast
# https://raycast.app
caski raycast

# Centered - Productivity/focus/todo list
# https://centered.app
caski centered

# Linear - Project management
# https://linear.app
caski linear-linear

# Logitech Options - configure Logiceh peripherals
# https://www.logitech.com/en-us/product/options
caski logitech-options

# Elgato Wave Link - control panel for Elgato Wave microphones
# https://www.elgato.com/en/downloads
caski elgato-wave-link

# BetterTouchTool - tool to customize mouse and keyboard
# https://folivora.ai
caski bettertouchtool

# iStat Menus - Hardware Monitor - NEEDS LICENSE
# https://bjango.com/mac/istatmenus
caski istat-menus5

# Rectangle - Better window resizer and mover
# https://rectangleapp.com
caski rectangle

# Alt-Tab
# Better window switcher https://alt-tab-macos.netlify.app/
caski alt-tab

# Facebook Messenger app
# https://messenger.com
caski messenger

# Slack - Messaging app
# https://slack.com
caski slack

# Discord - Messaging app
# https://discord.com
caski discord

# Figma - Webbased vector app
# https://figma.com
caski figma

# Spotify - Music streaming app
# https://spotify.com
caski spotify

# Warp - terminal
# https://warp.dev
caski warp

# OpenJDK - Java Development Kit, needed for Android SDK
# caski temurin

# Android Studio
# https://developer.android.com/studio
# caski android-studio
# export ANDROID_HOME=${HOME}/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Arduino IDE
# https://www.arduino.cc/en/main/software
# caski arduino

# Fluor - enable/disable fn keys for specific apps
# https://fluorapp.net
caski fluor

# Aerial screensaver
# https://aerialscreensaver.github.io
caski aerial

# NordVPN - VPN
# https://nordvpn.com
# caski nordvpn

# Docker - VM and container handler
# https://docker.com
# REPLACED BY COLIMA IN 20clis.sh
# caski docker

# Fmail - client for Fastmail
# http://fmail-app.fr
caski fmail2

# Notion - All things note app
# https://notion.so
caski notion

# Steam - Game launcher
# https://steampowered.com
caski steam

# VLC - media player
# https://videolan.org
caski vlc

# Keka - Archive manager (zip, rar, dmg, etc.)
# https://keka.io
caski keka

# Handbrake - media encoder
# https://handbrake.fr
caski handbrake

# Transmission - torrent downloader
# https://transmissionbt.com
caski transmission

# Chromium
brewi chromium

# Microsoft 365 suite - NEEDS LICENSE
# https://www.microsoft.com/da-dk/microsoft-365/mac/microsoft-365-for-mac
# caski microsoft-word
# caski microsoft-outlook
# caski microsoft-excel
# caski microsoft-powerpoint
# caski microsoft-teams

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
