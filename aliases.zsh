# Shortcuts
alias dl='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads'
alias ldl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias dev='cd ~/dev'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
# Google Chrome Incognito mode
alias chromei='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --incognito'

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

# Use colored cat (ccat) instead of cat
alias cat=ccat

# fuzzy search a file, open it in VSCode
alias fzfo='fzf | xargs -o code'
