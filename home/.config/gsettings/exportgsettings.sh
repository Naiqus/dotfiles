#!/bin/bash
GSETTINGPATH=$HOME/.homesick/repos/dotfiles/home/.config/gsettings
dconf dump /org/gnome/shell/ > $GSETTINGPATH/shell.dconf
dconf dump /org/gnome/settings-daemon/plugins/ > $GSETTINGPATH/plugins.dconf
dconf dump /org/gnome/desktop/wm/ > $GSETTINGPATH/wm.dconf
dconf dump /org/gnome/desktop/interface/ > $GSETTINGPATH/interface.dconf
dconf dump /org/gnome/desktop/input-sources/ > $GSETTINGPATH/input-sources.dconf
