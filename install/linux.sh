#!/bin/bash
printf "${CYAN}Apt-get updating...${NORMAL}\n"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update -q
printf "${GREEN}DONE!${NORMAL}\n"

printf "${CYAN}Install apps from brew...${NORMAL}\n"
sudo apt-get install python -q
sudo apt-get install vim -q
sudo apt-get install tmux -q

sudo apt-get install software-properties-common -q
sudo apt-get install python-software-properties -q
sudo apt-get install neovim -q
sudo apt-get install python-dev -q
sudo apt-get install python-pip -q
sudo apt-get install python3-dev -q
sudo apt-get install python3-pip -q

sudo apt-get install curl -q
sudo apt-get install zsh -q
sudo apt-get intall git -q

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
cd -

printf "${GREEN}DONE!${NORMAL}\n"
