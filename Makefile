install:
	ansible-playbook -i "localhost," -c local -K playbooks/all.yml

stow:
	stow kitty nvim tmux

.PHONY: install stow 
