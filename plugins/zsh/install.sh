#!/bin/bash

echo "Setting up zsh..."

mkdir -p "$HOME/.zsh" >/dev/null 2>&1

git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure" >/dev/null 2>&1

# Fix insecure directories and files, run compaudit for list
# https://github.com/zsh-users/zsh-completions/issues/433
compaudit | xargs chmod g-w

echo "zsh is configured."