#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Make Workspace
	mkdir -p ~/Workspace/bin ~/Workspace/dev ~/Workspace/git ~/Workspace/tmp ~/.config/nvim

	# Install Brew & things
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor
	brew update
	brew bundle
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Link things
	yarn config set prefix ~/.yarn-global
	ln -s zsh/zshrc ~/.zshrc
	ln -s tmux/tmux.conf ~/.tmux.conf
	ln -s neovim/init.vim ~/.config/nvim/init.vim

else
	# WIP
fi