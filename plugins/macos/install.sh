#!/bin/bash

macos_plugin_path="$DOTFILES_PLUGIN/macos"

sh -c "$macos_plugin_path/dock.sh"
sleep 1
sh -c "$macos_plugin_path/preferences.sh"
echo "Finished customzing macOS."
