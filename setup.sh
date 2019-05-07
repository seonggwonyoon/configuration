#!/bin/bash

brew () {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle
}

make_folder () {
	mkdir -p ~/Workspace/bin ~/Workspace/dev ~/Workspace/git ~/Workspace/tmp # Setting Workspace
	mkdir -p ~/.config/nvim # Setting neovim config
}

yarn_global () {
	yarn config set prefix ~/.yarn-global
}

vim-plug () {
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

link-things () {
	ln -s ~/.zshrc zsh/zshrc
	ln -s ~/.tmux.conf tmux/tmux.conf
	ln -s ~/.config/nvim/init.vim neovim/init.vim
}

if [[ "$OSTYPE" == "darwin"* ]]; then
	# echo "WIP"
else
	# echo "Ubuntu, ETC..."
fi
