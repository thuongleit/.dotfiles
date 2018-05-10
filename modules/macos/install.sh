#!/bin/sh

echo "Customizing your macOS"

set -e

cd $DOTFILE_ROOT/modules/macos

chmod +x preferences.sh
./preferences.sh

chmod +x dock.sh
./dock.sh

cd $DOTFILE_ROOT

echo "Finished customzing macOS"
