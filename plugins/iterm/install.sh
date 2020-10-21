echo "Customzing iTerms2"

# Checked: Load preferences from a custom folder or URL --> uses dotfiles/plugins/iterm 
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -int 1
defaults write com.googlecode.iterm2 "NSNavLastRootDirectory" "$DOTFILES_PLUGIN/iterm"
defaults write com.googlecode.iterm2 "PrefsCustomFolder" "$DOTFILES_PLUGIN/iterm"

# Checked: Save changes to folder when iTerms2 quits
defaults write com.googlecode.iterm2 "NoSyncNeverRemindPrefsChangesLostForFile" -int 1
defaults write com.googlecode.iterm2 "NoSyncNeverRemindPrefsChangesLostForFile_selection" -int 0

echo "Customized iTerms2"
