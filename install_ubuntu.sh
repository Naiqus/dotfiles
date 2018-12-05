#!/bin/bash

set -e 
ANACONDA_VERSION=5.3.1
BIN_PATH=$HOME/.bin

# apt update upgrade
echo Updating system
sudo apt update --force-yes
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# init packages
echo Installing init packages
sudo apt-get install -y \
	gcc \
	g++ \
	cmake \
	vim \
	tmux \
	git \
	curl \
	python \
	rofi \
	fcitx \
	fcitx-rime \
	apt-transport-https \
        ca-certificates \
	software-properties-common \
	gnome-shell-extensions \
	gnome-tweak-tool

# generate ssh key
echo "Generate SSH key, input your email address:"
read email
ssh-keygen -t rsa -C ${email}

# install oh-my-Bash
git clone --depth=1 https://github.com/ohmybash/oh-my-bash.git $HOME/.oh-my-bash
cp $HOME/.bashrc $HOME/.bashrc.orig

mkdir -p $BIN_PATH
cd $BIN_PATH

# install pip
echo Installing pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# install visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install -y code
rm microsoft.gpg

# install docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# install anaconda
wget https://repo.anaconda.com/archive/Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh
sh Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh
rm Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh

# install homesick
echo Installing Homesick
sudo apt-get install -y homesick

# Install fonts
wget https://raw.githubusercontent.com/naiqus/dotfiles/fonts/home/.fonts/Hiragino_W3.otf
wget https://raw.githubusercontent.com/naiqus/dotfiles/fonts/home/.fonts/Hiragino_W6.otf
sudo mkdir -p $HOME/.local/share/fonts
sudo mv ./Hiragino_W* $HOME/.local/share/fonts

# Install Numix theme
sudo apt install arc-theme numix-icon-theme

# install lolclock
sudo apt install lolcat toilet
cd $BIN_PATH
wget https://raw.githubusercontent.com/naiqus/lolclock/master/lolclock
sudo chmod +x lolclock
cd $HOME

# get dotfiles
echo Downloading dotfiles and set-up links
homesick clone https://github.com/Naiqus/dotfiles.git
homesick link dotfiles
DOTFILES_PATH=$HOME/.homesick/repos/dotfiles

# restore gnome settings 
dconf load / < $HOME/.config/gsettings/gsettings.dconf
ln -s $DOTFILES_PATH/home/.config/gsettings/restoregsettings.sh $BIN_PATH/restoregsettings  
ln -s $DOTFILES_PATH/home/.config/gsettings/exportgsettings.sh $BIN_PATH/exportgsettings  
