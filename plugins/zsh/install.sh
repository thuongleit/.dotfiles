#!/bin/bash

echo "Setting up zsh..."

mkdir -p "$HOME/.zsh" >/dev/null 2>&1

git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure" >/dev/null 2>&1

echo "zsh is configured."