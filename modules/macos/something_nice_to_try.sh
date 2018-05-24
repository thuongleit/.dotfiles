#!/bin/sh

# Thanks to Mathias Bynens! https://mths.be/macos

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable smooth scrolling
# (Uncomment if you’re on an older Mac that messes up the animation)
#defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

# Increase window resize speed for Cocoa applications
#defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
#defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
#defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
#defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
#defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
#defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
#defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
#defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"

# Set Help Viewer windows to non-floating mode
#defaults write com.apple.helpviewer DevMode -bool true

# Fix for the ancient UTF-8 bug in QuickLook (https://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See https://github.com/mathiasbynens/dotfiles/issues/237
#echo "0x08000100:0" > ~/.CFUserTextEncoding

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg



###############################################################################
# Tweetbot.app                                                                #
###############################################################################

# Bypass the annoyingly slow t.co URL shortener
#defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true

###############################################################################
# Twitter.app                                                                 #
###############################################################################

# Disable smart quotes as it’s annoying for code tweets
#defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu bar icon
#defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
#defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
#defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
#defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
#defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
#defaults write com.twitter.twitter-mac HideInBackground -bool true

###############################################################################
# Transmission.app                                                            #
###############################################################################

# Use `~/Documents/Torrents` to store incomplete downloads
#defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
#defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# Use `~/Downloads` to store completed downloads
#defaults write org.m0k.transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before downloading
#defaults write org.m0k.transmission DownloadAsk -bool false
#defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Don’t prompt for confirmation before removing non-downloading active transfers
#defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Trash original torrent files
#defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
#defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
#defaults write org.m0k.transmission WarningLegal -bool false

# IP block list.
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
#defaults write org.m0k.transmission BlocklistNew -bool true
#defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
#defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

# Randomize port on launch
#defaults write org.m0k.transmission RandomPort -bool true

###############################################################################
# Sublime Text                                                                #
###############################################################################

# Install Sublime Text settings
#cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

###############################################################################
# Spectacle.app                                                               #
###############################################################################

# Set up my preferred keyboard shortcuts
#cp -r init/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

###############################################################################
# SizeUp.app                                                                  #
###############################################################################

# Start SizeUp at login
#defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# Don’t show the preferences window on next start
#defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false

###############################################################################
# GPGMail 2                                                                   #
###############################################################################

# Disable signing emails by default
#defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool false

###############################################################################
# Opera & Opera Developer                                                     #
###############################################################################

# Expand the print dialog by default
#defaults write com.operasoftware.Opera PMPrintingExpandedStateForPrint2 -boolean true
#defaults write com.operasoftware.OperaDeveloper PMPrintingExpandedStateForPrint2 -boolean true

###############################################################################
# Messages                                                                    #
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Disable the all too sensitive backswipe on trackpads
#defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
#defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Disable the all too sensitive backswipe on Magic Mouse
#defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
#defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
#defaults write com.google.Chrome DisablePrintPreview -bool true
#defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
#defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
#defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Terminal                                                                    #
###############################################################################

# Only use UTF-8 in Terminal.app
#defaults write com.apple.terminal StringEncodings -array 4

# Use a modified version of the Solarized Dark theme by default in Terminal.app
#osascript <<EOD
#tell application "Terminal"
#local allOpenedWindows
#local initialOpenedWindows
#local windowID
#set themeName to "Solarized Dark xterm-256color"
#(* Store the IDs of all the open terminal windows. *)
#set initialOpenedWindows to id of every window
#(* Open the custom theme so that it gets added to the list
#of available terminal themes (note: this will open two
#additional terminal windows). *)
#do shell script "open '$HOME/init/" & themeName & ".terminal'"
#(* Wait a little bit to ensure that the custom theme is added. *)
#delay 1
#(* Set the custom theme as the default terminal theme. *)
#set default settings to settings set themeName
#(* Get the IDs of all the currently opened terminal windows. *)
#set allOpenedWindows to id of every window
#repeat with windowID in allOpenedWindows
#(* Close the additional windows that were opened in order
#to add the custom theme to the list of terminal themes. *)
#if initialOpenedWindows does not contain windowID then
#close (every window whose id is windowID)
#(* Change the theme for the initial opened terminal windows
#to remove the need to close them in order for the custom
#theme to be applied. *)
#else
#set current settings of tabs of (every window whose id is windowID) to settings set themeName
#end if
#end repeat
#end tell
#EOD

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
#defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
#defaults write com.apple.Terminal ShowLineMarks -int 0


###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Privacy: don’t send search queries to Apple
#defaults write com.apple.Safari UniversalSearchEnabled -bool false
#defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
#defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
#defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
#defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
#defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
#defaults write com.apple.Safari ShowFavoritesBar -bool false

# Hide Safari’s sidebar in Top Sites
#defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
#defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
#defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
#defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
#defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
#defaults write com.apple.Safari IncludeDevelopMenu -bool true
#defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
#defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
#defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
#defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Disable AutoFill
#defaults write com.apple.Safari AutoFillFromAddressBook -bool false
#defaults write com.apple.Safari AutoFillPasswords -bool false
#defaults write com.apple.Safari AutoFillCreditCardData -bool false
#defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Warn about fraudulent websites
#defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disable plug-ins
#defaults write com.apple.Safari WebKitPluginsEnabled -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

# Disable Java
#defaults write com.apple.Safari WebKitJavaEnabled -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# Block pop-up windows
#defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Disable auto-playing video
#defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
#defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

# Enable “Do Not Track”
#defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
#defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Privacy: don’t send search queries to Apple
#defaults write com.apple.Safari UniversalSearchEnabled -bool false
#defaults write com.apple.Safari SuppressSearchSuggestions -bool true

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable send and reply animations in Mail.app
#defaults write com.apple.mail DisableReplyAnimations -bool true
#defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
#defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
#defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
#defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
#defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
#defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

# Disable send and reply animations in Mail.app
#defaults write com.apple.mail DisableReplyAnimations -bool true
#defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
#defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Disable inline attachments (just show the icons)
#defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
#defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"


###############################################################################
# Spotlight                                                                   #
###############################################################################

# Hide Spotlight tray-icon (and subsequent helper)
#sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
#sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
# Change indexing order and disable some search results
# Yosemite-specific search results (remove them if you are using macOS 10.9 or older):
#     MENU_DEFINITION
#     MENU_CONVERSION
#     MENU_EXPRESSION
#     MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
#     MENU_WEBSEARCH             (send search queries to Apple)
#     MENU_OTHER
#defaults write com.apple.spotlight orderedItems -array \
#'{"enabled" = 1;"name" = "APPLICATIONS";}' \
#'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
#'{"enabled" = 1;"name" = "DIRECTORIES";}' \
#'{"enabled" = 1;"name" = "PDF";}' \
#'{"enabled" = 1;"name" = "FONTS";}' \
#'{"enabled" = 0;"name" = "DOCUMENTS";}' \
#'{"enabled" = 0;"name" = "MESSAGES";}' \
#'{"enabled" = 0;"name" = "CONTACT";}' \
#'{"enabled" = 0;"name" = "EVENT_TODO";}' \
#'{"enabled" = 0;"name" = "IMAGES";}' \
#'{"enabled" = 0;"name" = "BOOKMARKS";}' \
#'{"enabled" = 0;"name" = "MUSIC";}' \
#'{"enabled" = 0;"name" = "MOVIES";}' \
#'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
#'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
#'{"enabled" = 0;"name" = "SOURCE";}' \
#'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
#'{"enabled" = 0;"name" = "MENU_OTHER";}' \
#'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
#'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
#'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
#'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Load new settings before rebuilding the index
#killall mds > /dev/null 2>&1
# Make sure indexing is enabled for the main volume
#sudo mdutil -i on / > /dev/null
# Rebuild the index from scratch
#sudo mdutil -E / > /dev/null



