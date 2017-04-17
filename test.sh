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


caski visual-studio-code

./vscode.sh
