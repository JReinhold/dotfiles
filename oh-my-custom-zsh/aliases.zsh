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
alias cat="bat --paging=never" 

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


##############
# JavaScript #
##############

#############
# Storybook #
#############

alias compile='yarn --cwd $HOME/dev/work/storybook/storybook/code task --task compile --start-from install'
alias sand='yarn --cwd $HOME/dev/work/storybook/storybook/code task --start-from sandbox --task sandbox --template'
alias build='yarn --cwd $HOME/dev/work/storybook/storybook/code build'
alias buildw='yarn --cwd $HOME/dev/work/storybook/storybook/code build --watch'
alias ui='yarn --cwd $HOME/dev/work/storybook/storybook/code storybook:ui --no-open'
alias sbcli='$HOME/dev/work/storybook/storybook/code/core/bin/index.js'
alias book='nr storybook --no-open'
alias servebook='npx --yes http-server storybook-static -c-1'
alias sbs='nr build-storybook && npx --yes http-server storybook-static -c-1'
alias playground='ssh -i ~/.ssh/chroma-oregon.pem -L 5901:localhost:5901 -C chromatic@35.155.91.170'
function c() {
    cursor "${1:-.}"
}
function kp() {
  kill -9 $(lsof -t -i:${1:-6001})
}

function canary() {
  # Determine PR number if not provided
  if [[ -z "$1" ]]; then
    echo "🔍 No PR number provided — searching for PR linked to the current branch..."

    # Find the current branch
    local branch=$(git rev-parse --abbrev-ref HEAD)

    # Use GitHub CLI to find an associated PR
    local pr_number=$(gh pr list --head "$branch" --limit 1 --json number -q ".[0].number")

    if [[ -z "$pr_number" ]]; then
      echo "❌ No PR found for branch '$branch'."
      return 1
    fi

    echo "✅ Found PR: #$pr_number"
  else
    local pr_number="$1"
  fi

  # Trigger the workflow
  gh workflow run --repo storybookjs/storybook publish.yml --field pr="$pr_number"
  echo "\n🚀 Preparing canary for PR https://github.com/storybookjs/storybook/pull/$pr_number"

  # Wait a moment to ensure the workflow registers
  sleep 3

  # Fetch the latest run ID for the "publish.yml" workflow specifically
  local run_id=$(gh run list --repo storybookjs/storybook --workflow publish.yml --limit 1 --json databaseId -q ".[0].databaseId")

  echo "🛠️ Run ID: $run_id"
  if [[ -z "$run_id" ]]; then
    echo "❌ Failed to get run ID."
    return 1
  fi

  # Watch only this specific run
  gh run watch $run_id --repo storybookjs/storybook
}
