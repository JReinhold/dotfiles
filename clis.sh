#!/usr/bin/env bash

#######################################
# CLI-SETOUP
# Installs CLI-tools
#######################################

echo "----- INSTALLING CLI TOOLS --------"

# Bash Completion - autocomplete for Bash, if you still want to use that...
brew install bash bash-completion
touch ~/.bash_profile
echo "if [ -f $(brew --prefix)/etc/bash_completion ]; then" >> ~/.bash_profile
echo "  . $(brew --prefix)/etc/bash_completion" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile
brew tap homebrew/completions

# install brew cask - CLI-installer for GUI apps
brew install cask homebrew/completions/brew-cask-completion

# wget - Grab remote files with a URL
brew install wget

# dockutil - CLI to manage dock items
brew install dockutil

# Azure CLI
brew install azure-cli

# bitwarden CLI - password manager
brew install bitwarden-cli

# 1Password CLI - Password manager
brew install --cask 1password-cli

# mas-cli - Mac App Store CLI
brew install mas

# .NET SDK - Development
brew install dotnet-sdk
dotnet tool install --global dotnet-ef

# Git and Git Flow - add Git Flow extension to Git
# NOTE: git is already installed by default on OSX, but it's outdated, this ensures latest version and Bash Completion
brew install git git-flow-avh
rm ~/.gitconfig ~/.gitignore_global
ln -s ./gitconfig.symlink ~/.gitconfig
ln -s ./gitignore_global.symlink ~/.gitignore_global

# Various clis, to enhance terminal workflow
brew install the_silver_searcher bat fzf tig jq pipenv

# mackup - tool for backing up and restoring application preferences
brew install mackup

# Zsh Shell
brew install zsh
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#  symlink Zsh configuration to this directory
rm ~/.zshrc
ln -s ./.zshrc ~/.zshrc
