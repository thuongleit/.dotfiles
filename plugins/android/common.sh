#!/bin/bash

android_dotfile_path="$DOTFILES_ROOT/plugins/android"

# shellcheck source=/dev/null
source "$android_dotfile_path/path.zsh"

android_studio_preferences_path="$HOME/Library/Preferences/AndroidStudio${ANDROID_STUDIO_VERSION}"
android_studio_plugins_path="$HOME/Library/Application Support/AndroidStudio${ANDROID_STUDIO_VERSION}"

copy_android_studio_preferences() {
   # Install Android Studio custom settings
   echo "Copying Android Studio Preferences..."
   local config_path="$android_dotfile_path/AndroidStudioSettings"

   if [ ! -d "${android_studio_preferences_path}" ]; then
       mkdir "$android_studio_preferences_path"
   fi

   # Setting up $ANDROID_HOME to preferences
   local setting_files=("jdk.table.xml" "project.default.xml")

   for file in "${setting_files[@]}"; do
       cp -f "$config_path/options/${file}.sample" "$config_path/options/${file}"
       sed -i '' "s|\$ANDROID_HOME|${ANDROID_HOME}|g" "$config_path/options/$file"
   done

   cp -R "$config_path"/* "$android_studio_preferences_path"
   echo "Copied Android Studio Preferences."
}

copy_android_studio_plugins() {
    # Install Android Studio plugins
    echo "Installing Android Studio Plugins..."
    local config_path="$android_dotfile_path/AndroidStudioPlugins"

    if [ ! -d "${android_studio_plugins_path}" ]; then
        mkdir "${android_studio_plugins_path}"
    fi

    cp -R "$config_path"/* "${android_studio_plugins_path}"
    echo "Installed Android Studio Plugins."
}
