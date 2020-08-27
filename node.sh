#!/usr/bin/env bash

########################################
# YARN INSTALLS
# Common packages required for JavaScript development
########################################
echo "----- INSTALLING NODE.JS STUFF --------"
# install node.js LTS with npm - JavaScript runner and package manager
brew install node@12
npm update -g npm
brew install yarn

# ESLint - To lint JavaScript files
yarn global add eslint

# Prettier - format files
yarn global add prettier

# Serve - To create a minimalistisk http server local
yarn global add serve

# TypeScript compiler
yarn global add typescript

echo "----- NPM PACKAGES DONE-------"
