alias active_env='source $HOME/.zshrc'
alias work='cd $work'
alias dotfiles='cd $dotfiles'

alias t='tig'
#macos aliases
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ......='cd ../../../../..'
alias -g .......='cd ../../../../../..'
alias -g ........='cd ../../../../../../..'

alias google='web_search google'                  # Note: websearch function is loaded in function file, see above
alias ddg='web_search ddg'
alias github='web_search github'
alias wiki='web_search ddg \!w'
alias news='web_search ddg \!n'
alias youtube='web_search ddg \!yt'
alias map='web_search ddg \!m'
alias image='web_search ddg \!i'

alias -g l='ls'
alias -g ll='ls -l'
alias -g la='ls -al'
alias -g li='ls -ali'
