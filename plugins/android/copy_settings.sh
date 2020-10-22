#!/bin/bash
source ./install.sh

if [ ! -d "${config_path}" ]; then
   mkdir "$config_path"
fi

cp -i -R "$android_studio_preferences_path/keymaps" "$config_path/keymaps"
cp -i "$android_studio_preferences_path/options/keymap.xml" "$config_path/options"
