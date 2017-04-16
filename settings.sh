########################################
# DOCK MANAGEMENT
# Removes and inserts items in the dock
########################################
echo "----- SETTING UP DOCK ITEMS --------"

dockutil --remove all --no-restart
dockutil --add '/Applications/Photos.app' --no-restart
dockutil --add '/Applications/Google Chrome.app' --no-restart
dockutil --add '/Applications/Wavebox.app' --no-restart
dockutil --add '/Applications/Caprine.app' --no-restart
dockutil --add '/Applications/Slack.app' --no-restart
dockutil --add '/Applications/Visual Studio Code.app' --no-restart

#iCloud Downloads folder, needs to exist beforehand, at root iCloud Drive
dockutil --add '~/Library/Mobile Documents/com~apple~CloudDocs/Downloads' --view list --display stack --sort name --section others --no-restart
#Local Downloads folder
#dockutil --add '~/Downloads' --view list --display stack --sort name --section others --no-restart
dockutil --add '/Applications' --view grid --display folder --sort name --section others
