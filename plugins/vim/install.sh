#!/bin/bash

echo "Setting up vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null 2>&1

vim +PlugInstall +PlugUpgrade +PlugUpdate +qall

echo "vim is configured."