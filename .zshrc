#
 #Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
local ZSH_CONFIG=$HOME/.zsh

source $ZSH_CONFIG/aliases.sh
source $ZSH_CONFIG/functions.zsh

export PATH=$HOME/bin:$GOPATH/bin:$ANDROID_HOME/platform-tools:$PATH
