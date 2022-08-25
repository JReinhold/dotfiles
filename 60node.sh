#!/usr/bin/env bash
########################################
# NODE INSTALLS
# Installs Node.js and root-level packages (using yarn)
########################################
source ./05functions.sh
announce "Installing Node.js and tools"

# install node.js LTS with npm - JavaScript runner and package manager
brewi node@18
brewi node@16
brewi node@14
corepack enable
corepack prepare pnpm@7.9.5 --activate
npm update -g npm

# ESLint - To lint JavaScript files
pnpm add --global eslint

# Prettier - format files
pnpm add --global prettier

# Serve - To create a minimalistisk http server local
pnpm add --global serve

# TypeScript compiler
pnpm add --global typescript

