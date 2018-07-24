#!/bin/sh

function git_config {
    if [ ! $(git config --global user.email) ]; then
        echo "Setting up your git config"
        echo " - What is your git author name?"
        read -e git_authorname
        echo " - What is your git author email?"
        read -e git_authoremail
        
        git config --global user.name "$git_authorname"
        git config --global user.email "$git_authoremail"
        
        echo "Git configged"
    fi
}

git_config
