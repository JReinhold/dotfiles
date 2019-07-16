# Shortcuts
alias dl='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads'
alias ldl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias dev='cd ~/dev'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
# Google Chrome Incognito mode
alias chromei='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --incognito'

# SSH into VDI
alias vdi='ssh reinhold-vdi'

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/Library/Mobile\ Documents/com~apple~CloudDocs/.Trash; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false; and killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true; and killall Finder'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Lock the screen (when going AFK)
alias afk='open -a ScreenSaverEngine'

# Use bat instead of cat
alias cat=bat

# fuzzy search a file, open it in VSCode
alias fzfo='fzf | xargs -o code'

# forward localhost to reinhold.serveo.net, reachable anywhere
# optional 1st parameter can be port to forward - defaults to 8000
function serveo() {
	local SRC_PORT=8000
	if [ -n "$1" ]
	then
		SRC_PORT=$1
	fi
	echo "Forwarding localhost:$SRC_PORT"
	ssh -R reinhold:80:localhost:$SRC_PORT serveo.net
}

alias emu='emulator -avd Pixel_2_API_27'

##########
# Python #
##########

# pipenv
alias psh='pipenv shell'

# Django
alias m='./manage.py'
alias run='./manage.py runserver 0.0.0.0:8000'
alias shell='./manage.py shell'
alias dev='./manage.py runserver & ./manage.py livereload && fg'
alias pop='yes | ./manage.py populate_db'