install:
	ansible-galaxy collection install community.general
	ansible-playbook -i "localhost," -c local -K playbooks/all.yml

stow:
	stow kitty nvim tmux wezterm

.PHONY: install stow 
