# System paths
export DROPBOX=~/Dropbox
export DOWNLOADS=~/Downloads
export DESKTOP=~/Desktop
export DOC=~/Documents
export work=/Volumes/work
export dotfiles=~/.dotfiles

# Android paths
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Flutter paths
export FLUTTER_PATH="$HOME"/flutter_sdk
export PATH=$PATH:$FLUTTER_PATH/bin
# Go paths
export GO_PATH="$HOME/go_sdk"
export PATH=$PATH:$GO_PATH/bin

# Java paths
export JAVA_HOME=/Library/Java/JavaVirtualMachines/"$(cd /Library/Java/JavaVirtualMachines || return; echo *jdk1.8*)"/Contents/Home
export PATH=$JAVA_HOME:$PATH

# Latex path
export LATEXT_PATH="/Library/TeX/Root/bin/x86_64-darwin"
export PATH=$PATH:$LATEXT_PATH

# Brew paths 
export PATH="/usr/local/bin:$PATH"
