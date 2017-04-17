#!/usr/bin/env bash

#Install Sync Settings Extension, and download latest settings and extensions from personal gist
code --install-extension code-settings-sync
echo '{ "sync.gist": "fb4e83258a4210157e3250e340aa630f", "sync.autoDownload": true }' > ~/Library/Application\ Support/Code/User/settings.json

# Add "Open in VS Code" to context menu in Finder
cp -r "Open in VS Code.workflow" ~/Library/Services/"Open in VS Code.workflow"
