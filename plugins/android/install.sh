#!/bin/bash

# shellcheck source=/dev/null
android_plugin_path="$DOTFILES_PLUGIN/android"
source "$android_plugin_path/common.sh"

# Install sdk packages to $ANDROID_HOME path
while read -r package
do
    echo "Installing ${package}..."
    sdkmanager "${package}" --sdk_root="${ANDROID_HOME}"
done < "$android_plugin_path/sdk_packages.txt"

copy_android_studio_preferences
copy_android_studio_plugins

echo "Installed and customized Android Studio $ANDROID_STUDIO_VERSION"  
