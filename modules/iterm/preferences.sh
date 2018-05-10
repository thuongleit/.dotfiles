# Checked: Load preferences from a custom folder or URL --> uses dotfiles/modules/iterm 
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -int 1
defaults write com.googlecode.iterm2 "NSNavLastRootDirectory" "$DOTFILE_ROOT/modules/iterm"
defaults write com.googlecode.iterm2 "PrefsCustomFolder" "$DOTFILE_ROOT/modules/iterm"

# Checked: Save changes to folder when iTerms2 quits
defaults write com.googlecode.iterm2 "NoSyncNeverRemindPrefsChangesLostForFile" -int 1
defaults write com.googlecode.iterm2 "NoSyncNeverRemindPrefsChangesLostForFile_selection" -int 0
