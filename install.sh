GREEN='\033[0;32m'
CYAN='\033[0;36m'
NORMAL='\033[0m'
YELLOW='\033[0;33m'
SCRIPTPATH=`pwd -P`
echo "${SCRIPTPATH}"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "${CYAN}Brew updating...${NORMAL}"
brew update
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install apps from brew...${NORMAL}"
brew install python
brew install macvim --override-system-vim
brew install tmux
brew install neovim/neovim/neovim
brew install curl
brew install zsh
brew install git
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install vim plug...${NORMAL}"
sudo rm -rf ~/.config/nvim
sudo curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Create symlinks to .tmux.conf and init.vim...${NORMAL}"
sudo rm -rf ~/.tmux.conf
sudo ln -s ${SCRIPTPATH}/.tmux.conf ~/.tmux.conf
sudo rm -rf ~/.config/nvim/init.vim
sudo ln -s ${SCRIPTPATH}/init.vim ~/.config/nvim/init.vim
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install python library for neovim...${NORMAL}"
sudo pip2 install neovim
echo "${GREEN}DONE!${NORMAL}"

echo "${CYAN}Install oh-my-zsh...${NORMAL}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo rm -rf ~/.zshrc
sudo ln -s ${SCRIPTPATH}/.zshrc ~/.zshrc

chsh -s $(which zsh)
echo "${GREEN}DONE!${NORMAL}"
echo "${GREEN}COMPLETE!${NORMAL}"
echo "${YELLOW}NOTE: ${NORMAL} You should install Neovim plugins (:PlugInstall). But before do it you should set up your git (set your email, username and so on) and compile YouCompleteMe. \nSEE: ${CYAN}https://github.com/Valloric/YouCompleteMe#mac-os-x-installation${NORMAL}\n OR: ${CYAN}sudo sh ~/.vim/plugged/YouCompleteMe/install.sh${NORMAL}"












