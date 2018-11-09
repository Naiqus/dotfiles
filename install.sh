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
sudo apt --force-yes install gcc g++ cmake vim tmux git i3 i3status rofi gnome-session gnome-flashback i3lock 

# install pip
echo Installing pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

# install homeshick
echo Installing Homeshick
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
activate $HOME/.bashrc

# install i3wm-theme
echo Installing i3wm-theme
git clone https://github.com/unix121/i3wm-themer
cd i3wm-themer/
sudo pip install -r requirements.txt
./install_ubuntu.sh
./change 000
cd $HOME

# get dotfiles
echo Downloading dotfiles and set up links
homeshick clone https://github.com/Naiqus/dotfiles.git
homeshick link dotfiles

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
cd $HOME
mkdir Programs && cd Programs
wget https://raw.githubusercontent.com/naiqus/lolclock/master/lolclock
sudo chmod +x lolclock
echo "export PATH="$HOME/Programs:$PATH"" > $HOME/.bashrc
cd $HOME


# install Oh My Bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# restart i3
i3-msg reload
i3-msg restart
