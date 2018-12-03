#!/bin/bash

# shellcheck source=/dev/null
android_plugin_path="$DOTFILES_PLUGIN/android"
source "$android_plugin_path/common.sh"

copy_android_studio_preferences
copy_android_studio_plugins

echo "Installed and customized Android Studio $ANDROID_STUDIO_VERSION"  
