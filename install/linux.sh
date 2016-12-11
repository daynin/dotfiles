#!/bin/bash
printf "${CYAN}Apt-get updating...${NORMAL}\n"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get -qq update
printf "${GREEN}DONE!${NORMAL}\n"

printf "${CYAN}Install apps from apt-get...${NORMAL}\n"
sudo apt-get -qqy install python
sudo apt-get -qqy install python3
sudo apt-get -qqy install vim
sudo apt-get -qqy install tmux
sudo apt-get -qqy install cmake

sudo apt-get -qqy install software-properties-common
sudo apt-get -qqy install python-software-properties
sudo apt-get -qqy install neovim
sudo apt-get -qqy install python-dev
sudo apt-get -qqy install python-pip
sudo apt-get -qqy install python3-dev
sudo apt-get -qqy install python3-pip
sudo apt-get -qqy install silversearcher-ag

sudo apt-get -qqy install curl
sudo apt-get -qqy install zsh
sudo apt-get -qqy install git-extras
pip3 install --upgrade neovim

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
cd -

printf "${GREEN}DONE!${NORMAL}\n"
