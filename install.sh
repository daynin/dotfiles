GREEN='\033[0;32m'
CYAN='\033[0;36m'
NORMAL='\033[0m'
YELLOW='\033[0;33m'
SCRIPTPATH=`pwd -P`

function brew_install () {
  if ! type "$$1" > /dev/null 2> /dev/null; then
    echo "${GREEN}$1 already installed!${NORMAL}"
  else
    brew install $1
  fi
}

echo "${GREEN}"
echo "______      _    __ _ _           "
echo "|  _  \    | |  / _(_) |          "
echo "| | | |___ | |_| |_ _| | ___  ___ "
echo "| | | / _ \| __|  _| | |/ _ \/ __|"
echo "| |/ / (_) | |_| | | | |  __/\__ \\"
echo "|___/ \___/ \__|_| |_|_|\___||___/"
echo "${NORMAl}\n\n"

echo "${CYAN}Installation started...\n${NORMAL}"

if ! type "$brew" > /dev/null 2> /dev/null; then
  echo "${GREEN}brew already installed!${NORMAL}"
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "${CYAN}Brew updating...${NORMAL}"
brew update
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install apps from brew...${NORMAL}"
brew_install python
brew_install "macvim --override-system-vim"
brew_install tmux

if ! type "$nvim" > /dev/null 2> /dev/null; then
  echo "${GREEN}neovim already installed!${NORMAL}"
else
  brew install neovim/neovim/neovim
fi

brew_install curl
brew_install zsh
brew_install git
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install vim plug...${NORMAL}"
mv --backup=numbered ~/.config/nvim ~/.config/nvim.back
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Create symlinks to .tmux.conf and init.vim...${NORMAL}"
mv ~/.tmux.conf ~/.tmux.conf.back
ln -s ${SCRIPTPATH}/.tmux.conf ~/.tmux.conf
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.back
ln -s ${SCRIPTPATH}/init.vim ~/.config/nvim/init.vim
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install python library for neovim...${NORMAL}"
pip2 install neovim
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install oh-my-zsh...${NORMAL}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.back
ln -s ${SCRIPTPATH}/.zshrc ~/.zshrc

chsh -s $(which zsh)
echo "${GREEN}DONE!${NORMAL}"
echo "${GREEN}COMPLETE!${NORMAL}"
echo "\n\n${YELLOW}NOTE: ${NORMAL} You should install Neovim plugins (:PlugInstall). But before do it you should set up your git (set your email, username and so on) and compile YouCompleteMe. \nSEE: ${CYAN}https://github.com/Valloric/YouCompleteMe#mac-os-x-installation${NORMAL}\n OR: ${CYAN}sudo sh ~/.vim/plugged/YouCompleteMe/install.sh${NORMAL}"












