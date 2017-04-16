#Setups the required tools for the script

mkdir ~/dev

#homebrew - CLI-installer
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew doctor
brew update

# Install function, with notification support
# first parameter is app to install
caski () {
	if brew cask install $1 ; then
		terminal-notifier -message "$1 installed succesfully 🎉🎈" -title "🍺 Cask Install" -sound default -timeout 10
	else
		printf "FAILED: $1\n" >> ~/Desktop/appList.txt
		terminal-notifier -message " ⛔️ $1 INSTALLATION FAILED" -title "⚠️  Cask Install" -sound default -timeout 10
	fi
}

./clis.sh
./apps.sh
./npms.sh
./settings.sh

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
echo "A list of the apps installed have been placed on your desktop: appList.txt"