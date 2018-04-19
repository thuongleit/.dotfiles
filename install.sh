#!/bin/sh

# Setting up in HOME folder
cd ~
DOTFILE_ROOT="$(pwd -P)/.dotfiles"

set -e

echo Setting up your Mac

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

check_system (){
    # Check Homebrew and install it if need
    if [ ! $(which brew) ]
    then
        echo Installing Homebrew...
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew doctor
        echo
    else
        echo Updating Homebrew...
        brew doctor && brew upgrade
    fi

    # Check Apple Command Line Tools and install it if need
    if [ ! $(xcode-select -p) ]
    then
        echo "Installing Apple Command Line Tools..."
        xcode-select --install
        echo
    fi

    # Check git
    if [ ! $(which git) ]
    then
        echo "Installing git..."
        brew install git
        echo
    fi

    # Check there is a cloned of dotfile repository?
    if [ ! -d DOTFILE_ROOT ] && [ ! -f DOTFILE_ROOT/.thuongleit ]
    then
        echo "Clone dotfiles repository..."
        git clone git@github.com:thuongleit/.dotfiles.git $DOTFILE_ROOT
        echo
    else
        git pull
    fi
}

git_config (){
    if [ ! $(git config --global user.email) ]
    then
        echo 'Setting up your git config'
        user ' - What is your git author name?'
        read -e git_authorname
        user ' - What is your git author email?'
        read -e git_authoremail

        git config --global user.name $git_authorname
        git config --global user.email $git_authoremail
    fi
}

link_file () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

}

install_dotfile (){
    return 1
}

echo "---------- Setting up ----------"

check_system
install_dotfiles
git_config


# Change shell to zsh if need
if [ $0 != "-zsh" ]
then
    chsh -s $(which zsh)
fi

# Active the env
source ~/.zshrc

echo ---------- YAY! Enjoy your MAC ----------
