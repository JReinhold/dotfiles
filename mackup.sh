#!/usr/bin/env bash

#######################################
# MACKUP
# Restores application preferences
#######################################

echo "----- RESTORING MACKUPS --------"

ln .mackup.cfg ~
mackup restore