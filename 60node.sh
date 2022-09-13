#!/usr/bin/env bash
########################################
# NODE INSTALLS
# Installs Node.js and root-level packages (using yarn)
########################################
source ./05functions.sh
announce "Installing Node.js and tools"

# install nvm - Node Version Manager
brewi nvm

# install node.js LTS with npm - JavaScript runner and package manager
nvm install node
nvm install 16
nvm install 14
nvm alias default 14

npm update -g npm

brewi yarn
brewi pnpm

pnpm add --global corepack

# ESLint - To lint JavaScript files
pnpm add --global eslint

# Prettier - format files
pnpm add --global prettier

# Serve - To create a minimalistisk http server local
pnpm add --global serve

# TypeScript compiler
pnpm add --global typescript

