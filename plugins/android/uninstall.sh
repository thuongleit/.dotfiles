#!/bin/bash

android_plugin_path="$DOTFILES_PLUGIN/android"
# shellcheck source=/dev/null
source "$android_plugin_path/common.sh"

echo "Uninstalling Android SDK..."
sdkmanager --uninstall --sdk_root="$ANDROID_HOME"

brew uninstall gradle
brew cask uninstall android-sdk
brew cask uninstall android-studio
brew cask uninstall android-studio-preview

echo "Uninstalled Android SDK and Studio"
