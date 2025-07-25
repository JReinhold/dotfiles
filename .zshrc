# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=60

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/dev/open-source/dotfiles/oh-my-custom-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  frontend-search
  fzf
  git
  jsontools
  node
  macos
  sudo
  timer
  vscode
  z
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
)

HOMEBREW_NO_AUTO_UPDATE=1

# Allow insecurely source completions from all folders
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshonfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# default system user, to remove "user@hostname" in the prompt
DEFAULT_USER=jeppe

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# auto-ls on cd and <enter>
auto-ls-ls-custom () {
  ls -Apho
}
AUTO_LS_COMMANDS=(ls-custom git-status)

# give path autocompletion for arguments
setopt magicequalsubst	

# tell pipenv to install environments to project root instead of ~/.local/share/virtualenvs
export PIPENV_VENV_IN_PROJECT=true

# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:~/.local/bin

# Make "python" point to "python3"
PATH="/usr/local/opt/python/libexec/bin:$PATH"

# contains global secrets, gitignored from dotfiles
source ~/dev/open-source/dotfiles/secrets.sh

# add 1Password CLI completion
eval "$(op completion zsh)"; compdef _op op

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/zsh_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/zsh_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/jeppe/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# make puppeteer use chromium instead of Chrome
export CHROME_PATH=`which chromium`
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1

# expose DOCKER_HOST from colima
# from https://github.com/nektos/act/issues/1051#issuecomment-1340342410

export DOCKER_HOST="$(docker context inspect colima | jq -r '.[0].Endpoints.docker.Host')"

export STORYBOOK_TELEMETRY_URL="http://localhost:6007/event-log"
export SKIP_STORYBOOK_GIT_HOOKS=true

# fnm
export PATH="/Users/jeppe/Library/Application Support/fnm:$PATH"
export FNM_COREPACK_ENABLED="true"
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(fnm completions --shell zsh)"
