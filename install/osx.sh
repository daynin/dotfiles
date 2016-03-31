#!/bin/bash
function brew_install () {
  if ! type "$$1" > /dev/null 2> /dev/null; then
    printf "${GREEN}$1 already installed!${NORMAL}\n"
  else
    brew install $1
  fi
}
if ! type "$brew" > /dev/null 2> /dev/null; then
  printf "${GREEN}brew already installed!${NORMAL}\n"
else
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf "${CYAN}Brew updating...${NORMAL}\n"
brew update
printf "${GREEN}DONE!${NORMAL}\n"

printf "${CYAN}Install apps from brew...${NORMAL}\n"
brew_install python
brew_install "macvim --override-system-vim"
brew_install tmux

if ! type "$nvim" > /dev/null 2> /dev/null; then
  printf "${GREEN}neovim already installed!${NORMAL}\n"
else
  brew install neovim/neovim/neovim
fi

brew_install curl
brew_install zsh
brew_install git-extras

cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

printf "${GREEN}DONE!${NORMAL}\n"
