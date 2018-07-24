#!/bin/sh

source $dotfiles/common.lib

brew doctor
brew bundle
brew upgrade

