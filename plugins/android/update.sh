#!/bin/bash

android_plugin_path="$DOTFILES_PLUGIN/android"
# shellcheck source=/dev/null
source "$android_plugin_path/common.sh"

echo "Updating Android SDK..."
sdkmanager --update --sdk_root="$ANDROID_HOME"

copy_android_studio_preferences
copy_android_studio_plugins

echo "Updated Android SDK and Studio"
