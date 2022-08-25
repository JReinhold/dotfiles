# Shortcuts
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias dev='cd ~/dev'

# IP addresses
alias ip='curl ifconfig.me'
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

# alias when a git PR has been merged and/or squashed, to get back to develop and cleanup.
# optionally supply an argument that tells which branch to goto, eg. "gitfinish master" will checkout master instead of develop
function gitfinish() {
	FINISHED_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
	if [ "$1" != "" ]; then
		git checkout $1
	else
    	git checkout develop
	fi
	git pull
	git branch --delete --force $FINISHED_BRANCH
	git fetch --prune
}

# forward localhost to localhost.run, reachable anywhere
# optional 1st parameter can be port to forward - defaults to 8000
function lh() {
	local SRC_PORT=8000
	if [ -n "$1" ]
	then
		SRC_PORT=$1
	fi
	echo "Forwarding localhost:$SRC_PORT"
	ssh -R 80:localhost:$SRC_PORT ssh.localhost.run
}

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


##########
# JavaScript #
##########

# Node version switcher
# See https://notiz.dev/blog/how-to-manage-multiple-node-versions-on-mac
alias node18='export PATH="/opt/homebrew/opt/node@18/bin:$PATH"'
alias node16='export PATH="/opt/homebrew/opt/node@16/bin:$PATH"'
alias node14='export PATH="/opt/homebrew/opt/node@14/bin:$PATH"'

