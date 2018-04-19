#!/bin/sh

# Setting up in HOME folder
cd ~
DOTFILE_ROOT="$(pwd -P)/.dotfiles"

set -e

echo Setting up your Mac

# Check Homebrew and install it if need
if [ ! $(which brew) ]
then
    echo Installing Homebrew...
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo
fi

# Check Apple Command Line Tools and install it if need
if [ ! $(xcode-select -p) ]
then
    echo "Installing Apple Command Line Tools..."
    xcode-select --install
    echo
fi

if [ ! $(which git) ]
then
    echo "Installing git..."
    brew install git
    echo
fi

if [ ! -d DOTFILE_ROOT ] && [ ! -f DOTFILE_ROOT/.thuongleit ]
then
    echo "Clone dotfiles repositoty..."
    git clone git@github.com:thuongleit/.dotfiles.git $DOTFILE_ROOT
    echo
fi

echo "---------- Setting up ----------"
#ln -s ~/.config/.zshrc ~/.zshrc
#chsh -s $(which zsh)
#source ~/.zshrc

echo ---------- YAY! Enjoy your MAC ----------
