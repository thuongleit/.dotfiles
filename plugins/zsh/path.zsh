# System paths
export DROPBOX=~/Dropbox
export DOWNLOADS=~/Downloads
export DESKTOP=~/Desktop
export DOC=~/Documents
export work=~/workspace
export dotfiles=~/.dotfiles

# Android paths
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter paths
export FLUTTER_PATH="$HOME"/flutter_sdk
export PATH=$PATH:$FLUTTER_PATH/bin
# Go paths
export GO_PATH="$HOME/go_sdk"
export PATH=$PATH:$GO_PATH/bin

# Java paths
# JAVA_HOME PATH for java8
JAVA8_HOME=/Library/Java/JavaVirtualMachines/"$(cd /Library/Java/JavaVirtualMachines || return; echo *jdk1.8*)"/Contents/Home

# Latex path
export LATEXT_PATH="/Library/TeX/Root/bin/x86_64-darwin"
export PATH=$PATH:$LATEXT_PATH
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
