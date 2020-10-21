#!/bin/bash

ANDROID_STUDIO_VERSION=4.1
# shellcheck source=/dev/null
android_dotfile_path="$DOTFILES_ROOT/plugins/android"

android_studio_preferences_path="$HOME/Library/Application Support/Google/AndroidStudio${ANDROID_STUDIO_VERSION}"

# Install Android Studio custom settings
config_path="$android_dotfile_path/AndroidStudioSettings"

if [ ! -d "${android_studio_preferences_path}" ]; then
   mkdir "$android_studio_preferences_path"
fi

# # Setting up $ANDROID_HOME to preferences
# local setting_files=("jdk.table.xml" "project.default.xml")

# for file in "${setting_files[@]}"; do
#     cp -f "$config_path/options/${file}.sample" "$config_path/options/${file}"
#     sed -i '' "s|\$ANDROID_HOME|${ANDROID_HOME}|g" "$config_path/options/$file"
# done

cp -R "$config_path"/* "$android_studio_preferences_path"
