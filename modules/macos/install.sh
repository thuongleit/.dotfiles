#!/bin/sh

source $dotfiles/common.lib

info "Customizing your macOS..."

info "Customizing Dock..."
. $dotfiles/modules/macos/dock.sh
success "Customized Dock"

sleep 1

info "Customizing macos settings..."
. $dotfiles/modules/macos/preferences.sh

echo "Done. Note that some of these changes require a logout/restart to take effect."

success "Finished customzing macOS"
