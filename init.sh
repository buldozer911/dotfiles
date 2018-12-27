#!/bin/bash

# Install zsh tmux neovim 
if [ "$(uname)" == "Darwin" ]; then
    # Mac OS X platform
    echo "OSX"

    brew install zsh tmux neovim/neovim/neovim python3
    brew tap caskroom/cask
    brew cask install iterm2

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/jungunn/vim-plug/plug.vim
    pip3 install neovim
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GNU/Linux platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # 32 bits Windows NT platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # 64 bits Windows NT platform
fi
# Install fonts

# Change shell

# Backup old config files

# Create folders

# Create symlinks
