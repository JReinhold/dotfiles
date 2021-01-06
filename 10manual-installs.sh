# utility to add an app to manually install to the appList.txt file on desktop
manual () {
    printf "MANUAL: $1\n" >> ~/Desktop/appList.txt
}

announce "Adding list of apps to manually install to appList.txt on Desktop"

manual "XCode - https://apps.apple.com/us/app/xcode/id497799835?mt=12"
manual "Elgato WaveLink - https://www.elgato.com/en/gaming/downloads"
manual "Audacity - https://www.audacityteam.org/download/mac/"