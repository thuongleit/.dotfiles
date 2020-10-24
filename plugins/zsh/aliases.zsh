# git aliases
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gac='git add . && git commit -v .'

alias gb='git branch'

alias gc='git commit -v'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcb='git checkout -b'
alias gcl='git clone --recursive'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'

alias grso='git remote show origin'
alias grh='git reset --hard'
alias gr='git reset' 

alias gd='git diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias gss='git status -s'
alias gst='git status'

# OS aliases
alias active_env='source $HOME/.zshrc'
alias work='cd $work'
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ......='cd ../../../../..'
alias -g .......='cd ../../../../../..'
alias -g ........='cd ../../../../../../..'

# Note: websearch function is loaded in function file, see above
alias google='web_search google'
alias ddg='web_search ddg'
alias github='web_search github'
alias wiki='web_search ddg \!w'
alias news='web_search ddg \!n'
alias youtube='web_search ddg \!yt'
alias map='web_search ddg \!m'
alias image='web_search ddg \!i'

# Shortcuts
alias -g l='ls'
alias -g ll='ls -l'
alias -g la='ls -al'
alias -g li='ls -ali'

alias v=bat
alias e=vi
alias s=ask
alias t=tig
alias bk=backup_file
alias rr=move_files_to_trash
alias cre=create_and_edit_new_file
