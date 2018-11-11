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
sudo apt install gcc g++ cmake vim tmux git curl i3 i3status rofi gnome-session gnome-flashback i3lock 

# install pip
echo Installing pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

# install homesick
echo Installing Homesick
sudo apt install homesick

# install i3wm-theme
echo Installing i3wm-theme
git clone https://github.com/unix121/i3wm-themer
cd i3wm-themer/
sudo pip install -r requirements.txt
./install_ubuntu.sh
./change 000
cd $HOME

# get dotfiles
echo Downloading dotfiles and set-up links
homesick clone https://github.com/Naiqus/dotfiles.git
homesick link dotfiles

# update fonts cache
echo Updating font cache
fc-cache -f -v

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
echo "export PATH="$HOME/Programs:$PATH"" > $HOME/.bashrc
cd $HOME


# install Oh My Bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
