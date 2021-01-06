#!/usr/bin/env bash
#######################################
# CLI-SETOUP
# Installs CLI-tools
#######################################
source ./05functions.sh
announce "Installing CLI tools"

# terminal-notifier - used when installing casks later, see 50apps.sh
brewi terminal-notifier

# wget - Grab remote files with a URL
brewi wget

# dockutil - CLI to manage dock items
brewi dockutil

# broot - File browser CLI
brewi broot

# Azure CLI
brewi azure-cli

# bitwarden CLI - password manager
brewi bitwarden-cli

# 1Password CLI - Password manager
brewi --cask 1password-cli

# mas-cli - Mac App Store CLI
brewi mas

# .NET SDK - Development
brewi dotnet-sdk
dotnet tool install --global dotnet-ef

# Git and Git Flow - add Git Flow extension to Git
# NOTE: git is already installed by default on OSX, but it's outdated, this ensures latest version and Bash Completion
brewi git git-flow-avh
rm ~/.gitconfig ~/.gitignore_global
ln -s ./gitconfig.symlink ~/.gitconfig
ln -s ./gitignore_global.symlink ~/.gitignore_global
git config --global core.excludesfile '~/.gitignore_global'

ln -s .editorconfig ~/.editorconfig

# Various clis, to enhance terminal workflow
brewi the_silver_searcher bat fzf tig jq

# mackup - tool for backing up and restoring application preferences
brewi mackup

# Zsh Shell
brewi zsh
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#  symlink Zsh configuration to this directory
rm ~/.zshrc
ln -s ./.zshrc ~/.zshrc
