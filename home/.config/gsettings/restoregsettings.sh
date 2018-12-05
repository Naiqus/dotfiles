#!/bin/bash
GSETTINGPATH=$HOME/.homesick/repos/dotfiles/home/.config/gsettings
dconf load / < $GSETTINGPATH/gsettings.dconf
