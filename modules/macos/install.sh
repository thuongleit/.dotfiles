#!/bin/sh

source $dotfiles/common.lib

info "Customizing your macOS"

. $dotfiles/modules/macos/preferences.sh
. $dotfiles/modules/macos/dock.sh

success "Finished customzing macOS"
