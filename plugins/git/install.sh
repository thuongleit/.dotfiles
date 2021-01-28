#!/bin/sh

if [ -z "$(git config --global user.email)" ]; then
    echo "Setting up your git config global..."
    echo " - What is your git author name?"
    read -r git_author_name
    echo " - What is your git author email?"
    read -r git_author_email

    git config --global user.name "$git_author_name"
    git config --global user.email "$git_author_email"

    echo "Git is configured."
fi

