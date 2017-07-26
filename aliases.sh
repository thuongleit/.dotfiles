export DROPBOX=$HOME/Dropbox
export DOWNLOADS=$HOME/Downloads
export APPS=$HOME/Apps
export DESKTOP=$HOME/Desktop
export DOC=$HOME/Documents
export work=$HOME/workspace
export GOPATH=$HOME/go
export config=$HOME/.config
export ANDROID_HOME=$HOME/Library/Android/sdk

alias active='source $HOME/.zshrc'
alias zshconfig='vi $HOME/.zshrc'
alias work='cd $work'

alias t='tig'
alias del='rm -rf'

# git aliases
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'

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
alias gfo='git fetch origin'\alias gl='git pull'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias gss='git status -s'
alias gst='git status'

#macos aliases
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'

alias google='web_search google'                  # Note: websearch function is loaded in function file, see above
alias ddg='web_search ddg'
alias github='web_search github'
alias wiki='web_search ddg \!w'
alias news='web_search ddg \!n'
alias youtube='web_search ddg \!yt'
alias map='web_search ddg \!m'
alias image='web_search ddg \!i'

#android command
alias build='./gradlew clean build --stacktrace --info --debug'
alias debug='./gradlew clean assembleDebug installDebug --stacktrace --info --debug'
alias release='./gradlew clean assembleRelease installRelease --stacktrace --info --debug'

