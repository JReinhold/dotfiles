#!/usr/bin/env bash

########################################
# YARN INSTALLS
# Common packages required for JavaScript development
########################################
echo "----- WILL NOW INSTALL GLOBAL NPM PACKAGES -------"
# install node.js with npm - JavaScript runner and package manager
brew install node
npm update -g npm
brew install yarn

# React Native CLI - to create and run React Native projects
yarn global add react-native-cli

# ESLint - To lint JavaScript files
yarn global add eslint


# ESLint - To lint JavaScript files
yarn global add eslint

# Prettier - format files
yarn global add prettier

# Serve - To create a minimalistisk http server local
yarn global add serve

# TypeScript compiler
yarn global add typescript

echo "----- NPM PACKAGES DONE-------"
