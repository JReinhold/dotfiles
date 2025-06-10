#!/usr/bin/env bash
########################################
# NODE INSTALLS
# Installs Node.js and root-level packages (using yarn)
########################################
source ./05functions.sh
announce "Installing Node.js and tools"

# install fnm - Fast Node Manager
curl -fsSL https://fnm.vercel.app/install | bash

# install Node.js
fnm install --lts
fnm install --latest
fnm install 18
fnm default 18

npm update -g npm

brewi yarn

corepack enable pnpm
corepack enable yarn

# ni - use the right package manager
npm install --global @antfu/ni

# ESLint - To lint JavaScript files
npm install --global eslint

# Prettier - format files
npm install --global prettier

# Serve - To create a minimalistisk http server local
npm install --global serve

# TypeScript compiler
npm install --global typescript

