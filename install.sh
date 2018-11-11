#!/bin/bash

# apt update upgrade
echo Updating system
sudo apt update --force-yes
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

mkdir Programs
cd Programs

# init packages
echo Installing init packages
sudo apt-get install --force-yes gcc g++ cmake vim tmux git curl i3 i3status rofi gnome-session gnome-flashback i3lock 

# install Oh My Bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# install pip
echo Installing pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

# install homesick
echo Installing Homesick
sudo apt install homesick

# Install fonts
wget https://raw.githubusercontent.com/naiqus/dotfiles/master/Hiragino_W3.otf
wget https://raw.githubusercontent.com/naiqus/dotfiles/master/Hiragino_W6.otf
mv ./Hiragino_W* $Home/.local/share/fonts

# install i3wm-theme
echo Installing i3wm-theme
git clone https://github.com/unix121/i3wm-themer
cd i3wm-themer/
sudo pip install -r requirements.txt
./install_ubuntu.sh
./change 000
cd $HOME

# install i3-gnome 
echo Installing i3-gnome
cd $HOME/Programs
git clone https://github.com/csxr/i3-gnome.git
cd i3-gnome
sudo make install

# install lolclock
cd $HOME/Programs
wget https://raw.githubusercontent.com/naiqus/lolclock/master/lolclock
sudo chmod +x lolclock
cd $HOME

# get dotfiles
echo Downloading dotfiles and set-up links
homesick clone https://github.com/Naiqus/dotfiles.git
homesick link dotfiles