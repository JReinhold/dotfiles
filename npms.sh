
########################################
# YARN INSTALLS
# Common packages required for JavaScript development
########################################
echo "----- WILL NOW INSTALL GLOBAL NPM PACKAGES -------"
#install node.js with npm - JavaScript runner and package manager
brew install node
npm update -g npm
brew install yarn

#gulp - automatic builder
npm install -g gulp

#React Native CLI - to create and run React Native projects
npm install -g react-native-cli

#ESLint - To lint JavaScript files
npm install -g eslint

#HTTP-Server - To create a minimalistisk http server local
npm install -g http-server

#TypeScript compiler
npm install -g typescript

echo "----- NPM PACKAGES DONE-------"