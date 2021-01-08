#!/usr/bin/env bash
#######################################
# FUNCTIONS
# Used different install scripts
#######################################

# Highly readable echo to announce what is going on
announce () {
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@"
    echo "@@@@ $1"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@"
}

# utility to add an app to manually install to the appList.txt file on desktop
manual () {
    printf "MANUAL: $1\n" >> ~/Desktop/appList.txt
}

# Install tools with brew, and announce it
brewi () {
    announce $*
    brew install $*
}

# Install function, with notification support
# first parameter is app to install
caski () {
	if brew install --cask $* ; then
		terminal-notifier -message "$1 installed successfully 🎉🎈" -title "🍺 Cask Install" -sound default -timeout 10
	else
		printf "FAILED: $*\n" >> ~/Desktop/appList.txt
		terminal-notifier -message " ⛔️ $1 INSTALLATION FAILED" -title "⚠️  Cask Install" -sound default -timeout 10
	fi
}