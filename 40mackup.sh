#!/usr/bin/env bash

#######################################
# MACKUP
# Restores application preferences
#######################################
announce "Restoring mackups"

ln .mackup.cfg ~
mackup restore