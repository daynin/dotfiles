install:
	ansible-playbook -i "localhost," -c local -K playbooks/all.yml

install-ansible:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install ansible

.PHONY: install install-ansible
