set fish_greeting ""
# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
alias tmux='env TERM=screen-256color-bce tmux'


# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'agnoster'
Plugin 'theme'

function p --description "Go to Documents/projects/"
	cd ~/Documents/projects
end

function vim
  mvim -v $argv
end

set -x GOPATH ~/go
set -x GOBIN ~/go/bin
set --universal fish_user_paths $fish_user_paths ~/go/bin

