#!/usr/local/bin/fish

#function to create an alias and immediately save it
function salias -d "create and save alias, 1st arg alias_name, 2nd arg command"
	alias $argv[1]=$argv[2]
	funcsave $argv[1]
end
funcsave salias

# Easier navigation: .., ..., ...., ....., ~ and -
salias .. "cd .."
salias ... "cd ../.."
salias .... "cd ../../.."
salias ..... "cd ../../../.."

# Shortcuts
salias dl "cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads"
salias ldl "cd ~/Downloads"
salias dt "cd ~/Desktop"
salias dev "cd ~/dev"

# List all files colorized in long format
salias l "ls -Apho"

# Get week number
salias week 'date +%V'

# Stopwatch
salias timer 'echo "Timer started. Stop with Ctrl-D."; and date; and time cat; and date'

# Get macOS Software Updates, and update Homebrew, npm, and their installed packages
salias update 'sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g'

# Google Chrome
salias chrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
# Google Chrome Incognito mode
salias chromei '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --incognito'

# IP addresses
salias ip "dig +short myip.opendns.com @resolver1.opendns.com"
salias localip "ipconfig getifaddr en0"
salias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
salias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
salias lscleanup "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder"

# Trim new lines and copy to clipboard
salias c "tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
salias cleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
salias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/Library/Mobile\ Documents/com~apple~CloudDocs/.Trash; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
salias show "defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"
salias hide "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# Hide/show all desktop icons (useful when presenting)
salias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"
salias showdesktop "defaults write com.apple.finder CreateDesktop -bool true; and killall Finder"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
salias mergepdf '/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
salias spotoff "sudo mdutil -a -i off"
# Enable Spotlight
salias spoton "sudo mdutil -a -i on"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
salias stfu "osascript -e 'set volume output muted true'"
salias pumpitup "osascript -e 'set volume output volume 100'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
salias chromekill "ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
salias afk "open -a ScreenSaverEngine"

# Reload the shell (i.e. invoke as a login shell)
salias reload "exec $SHELL -l"
