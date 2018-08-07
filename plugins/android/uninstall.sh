#!/bin/bash

android_plugin_path="$DOTFILES_PLUGIN/android"
# shellcheck source=/dev/null
source "$android_plugin_path/common.sh"

echo "Uninstalling Android SDK..."
sdkmanager --uninstall --sdk_root="$ANDROID_HOME"

echo "Uninstalled Android SDK and Studio"
