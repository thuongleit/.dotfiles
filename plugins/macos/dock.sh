#!/bin/sh

echo "Customizing macOS Dock..."
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Utilities/Activity Monitor.app"
dockutil --no-restart --add "/Applications/iTunes.app"
dockutil --no-restart --add "/Applications/Spotify.app"
#dockutil --no-restart --add "/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Skype.app"
#dockutil --no-restart --add "/Applications/FaceTime.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Android Studio.app"
dockutil --no-restart --add "/Applications/Xcode.app"
dockutil --add "$HOME/Downloads" --view grid --display folder --before Trash
echo "Customized macOS Dock."
killall Dock
