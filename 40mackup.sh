#!/usr/bin/env bash
#######################################
# MACKUP
# Restores app settings from mackup
#######################################
source ./05functions.sh
announce "Restoring mackups"

ln .mackup.cfg ~
mackup restore