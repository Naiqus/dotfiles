#!/bin/bash
GSETTINGPATH=$HOME/.homesick/repos/dotfiles/home/.config/gsettings
dconf dump / > $GSETTINGPATH/gsettings.dconf
