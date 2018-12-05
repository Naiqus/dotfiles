#!/bin/bash
GSETTINGPATH=$HOME/.homesick/repos/dotfiles/home/.config/gsettings
dconf load /org/gnome/shell/ < $GSETTINGPATH/shell.dconf
dconf load /org/gnome/settings-daemon/plugins/ < $GSETTINGPATH/plugins.dconf
dconf load /org/gnome/desktop/wm/ < $GSETTINGPATH/wm.dconf
dconf load /org/gnome/desktop/interface/ < $GSETTINGPATH/interface.dconf
dconf load /org/gnome/desktop/input-sources/ < $GSETTINGPATH/input-sources.dconf

