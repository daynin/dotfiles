#!/bin/bash
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NORMAL='\033[0m'
YELLOW='\033[0;33m'
SCRIPTPATH=`pwd -P`

printf "${GREEN}"
echo "______      _    __ _ _           "
echo "|  _  \    | |  / _(_) |          "
echo "| | | |___ | |_| |_ _| | ___  ___ "
echo "| | | / _ \| __|  _| | |/ _ \/ __|"
echo "| |/ / (_) | |_| | | | |  __/\__ \\"
echo "|___/ \___/ \__|_| |_|_|\___||___/"
printf "${NORMAl}\n\n"

printf "${CYAN}Installation started...\n${NORMAL}"


if [ "$(uname)" = 'Linux' ]; then
  source install/linux.sh
elif [ "$(uname)" = 'Darwin' ]; then
  source install/osx.sh
fi

if [ ! -d "~/.config" ]; then
  mkdir ~/.config
  mkdir ~/.config/nvim
fi

printf "${CYAN}Install vim plug...${NORMAL}\n"
mv --backup=numbered ~/.config/nvim ~/.config/nvim.back
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
printf "${GREEN}DONE!${NORMAL}\n"

printf "${CYAN}Create symlinks to .tmux.conf and init.vim...${NORMAL}\n"
mv ~/.tmux.conf ~/.tmux.conf.back

if [ "$(uname)" = 'Linux' ]; then
  ln -s ${SCRIPTPATH}/.tmux-linux.conf ~/.tmux.conf
elif [ "$(uname)" = 'Darwin' ]; then
  ln -s ${SCRIPTPATH}/.tmux-osx.conf ~/.tmux.conf
fi

mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.back
ln -s ${SCRIPTPATH}/init.vim ~/.config/nvim/init.vim
printf "${GREEN}DONE!${NORMAL}\n"

printf "${CYAN}Install python library for neovim...${NORMAL}\n"
if [ "$(uname)" = 'Linux' ]; then
  sudo pip2 install neovim
elif [ "$(uname)" = 'Darwin' ]; then
  pip2 install neovim
fi
printf "${GREEN}DONE!${NORMAL}\n"

printf "${CYAN}Install oh-my-zsh...${NORMAL}\n"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.back
ln -s ${SCRIPTPATH}/.zshrc ~/.zshrc

chsh -s $(which zsh)
printf "${GREEN}DONE!${NORMAL}\n"
printf "${GREEN}COMPLETE!${NORMAL}\n"
printf "\n\n${YELLOW}NOTE: ${NORMAL} You should install Neovim plugins (:PlugInstall). But before do it you should set up your git (set your email, username and so on) and compile YouCompleteMe. \nSEE: ${CYAN}https://github.com/Valloric/YouCompleteMe#mac-os-x-installation${NORMAL}\n OR: ${CYAN}sudo sh ~/.vim/plugged/YouCompleteMe/install.sh${NORMAL}"

printf "\n\n${YELLOW}NODE: ${NORMAL} Also you should set up 'Droid Sans Mono for Powerline' font in your terminal emulator"
