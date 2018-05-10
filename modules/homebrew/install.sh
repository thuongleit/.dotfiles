#!/bin/sh

cd $HOME/.dotfiles
source global_functions.sh

if [ $(is_admin "$(whoami)") ]; then
    brew bundle
fi
