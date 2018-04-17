#!/bin/sh

echo "Setting up your Mac"

# Check Homebrew and install it if need
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if 

echo "---------- Setting up ----------"
ln -s ~/.zprezto/runcoms/zlogin ~/.zlogin
ln -s ~/.zprezto/runcoms/zlogout ~/.zlogout
ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -s ~/.zprezto/runcoms/zprofile ~/.zprofile
ln -s ~/.zprezto/runcoms/zshenv ~/.zshenv
ln -s ~/.config/.zshrc ~/.zshrc
chsh -s $(which zsh)
source ~/.zshrc
echo "---------- YAY! Enjoy your MAC ----------"
