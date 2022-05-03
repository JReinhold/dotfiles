#!/usr/bin/env bash
########################################
# NODE INSTALLS
# Installs Node.js and root-level packages (using yarn)
########################################
source ./05functions.sh
announce "Installing Node.js and tools"

# install node.js LTS with npm - JavaScript runner and package manager
brew install node@16
npm update -g npm
brew install yarn
brew install pnpm

# ESLint - To lint JavaScript files
yarn global add eslint

# Prettier - format files
yarn global add prettier

# Serve - To create a minimalistisk http server local
yarn global add serve

# TypeScript compiler
yarn global add typescript

