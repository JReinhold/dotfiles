# JReinhold dotfiles

Scripts to setup a fresh macOS installation with apps and settings.
Heavily inspired by [mathiasbynens' dotfiles](https://github.com/mathiasbynens/dotfiles)

## Usage

**Warning**: If you want to give this setup a try, you should first fork this repository, review the code, and remove things you don't want or need. Don't blindly use my settings unless you know what that entails. Use at your own risk!

Especially Visual Studio Code is tailored to my own settings, as it pulls settings and extensions from my [personal gist](https://gist.github.com/JReinhold/fb4e83258a4210157e3250e340aa630f). You are welcome to use my gist, but I suggest you either define your own, or delete it by changing/deleting this line in `vscode.sh`

```bash
echo '{ "sync.gist": "fb4e83258a4210157e3250e340aa630f", "sync.autoDownload": true }' > ~/Library/Application\ Support/Code/User/settings.json
```

It uses the awesome [Z shell](https://www.zsh.org/), so aliases and functions will be created for that shell.

## Using git

The full script can be downloaded and executed using the command

```bash
git clone https://github.com/jreinhold/dotfiles.git && cd dotfiles & ./init.sh
```

Sit back and relax with a cup of ☕️

## Recommendations

It uses native notifications to notify the user when an new app has been installed, and is ready to be set up by the user.

A final list of each app installed (and failed) will be placed in `~/Desktop/appList.txt`. Use this as your personal ToDo-list, to cross off each app when you have set it up with your preferences.

## Troubleshooting

VSCode currently gives an error on first load, because it is trying to overwrite the `settings.json`, but it has recently been modified. The user must then handle the conflict. I recommend closing the `settings.json` file, and mark the downloaded `settings.json` as the one to keep. I don't know how to fix this.

## ErgoDox EZ keyboard

I use the ErgoDox EZ keyboard with a custom layout. The firmware is located in this repository, and can be seen [here](https://configure.ergodox-ez.com/ergodox-ez/layouts/gZwN/latest/0)
