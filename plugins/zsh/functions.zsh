# Functions
# intellegently extract archives based on extension. 
function extract {  
   
   file=$1
   dir=$2

   if [[ -n $dir ]]; then
      mkdir -p $dir; 
      echo Extracting $1 into $2 ...
   else 
      echo Extracting $1 ...
   fi

   if [[ ! -f $1 ]] ; then
      echo "'$1' is not a valid file"
   else
      case $1 in
         *.tar.bz2)   
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xjvf $1 $dc" 
             echo $cmd
             eval ${cmd}
             ;;   
         *.tar.gz)    
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xzvf $1 $dc"; 
             echo $cmd;
             eval ${cmd}
             ;;
         *.tar)       
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar vxf $1 $dc";
             echo $cmd;
             eval ${cmd}
             ;;
         *.tbz2)      
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xjvf $1 $dc";
             echo $cmd; 
             eval ${cmd}
             ;;  
         *.tgz) 
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xzf $1 $dc"; 
             echo $cmd; 
             eval ${cmd} 
             ;;    
         *.bz2)       
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar jf $1 $dc"; 
             echo $cmd; 
             eval ${cmd} 
             ;;     
         *.zip)       
             if [[ -n $dir ]]; then dc="-d $dir"; fi
             cmd="unzip $1 $dc"; 
             echo $cmd; 
             eval ${cmd}
             ;;
         *.gz)
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar zf $1 $dc"; 
             echo $cmd; 
             eval ${cmd}
             ;;
         *.7z)        
             #TODO dir
             cmd="7z x -o$dir $1"; 
             echo $cmd; 
             eval ${cmd} 
             ;;
         *.rar)       
             #TODO Dir
             cmd="unrar x $1 $dir";
             echo $cmd;
             eval ${cmd}
             ;;
         *)           
            echo "'$1' cannot be extracted via extract()" 
            ;;
         esac
   fi
}

# web_search from terminal
function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    google      "https://www.google.com/search?q="
    ddg         "https://www.duckduckgo.com/?q="
    github      "https://github.com/search?q="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}

#use generalized open command
function open_command() {
  emulate -L zsh
  setopt shwordsplit

  local open_cmd

  # define the open command
  case "$OSTYPE" in
    darwin*)  open_cmd='open' ;;
    cygwin*)  open_cmd='cygstart' ;;
    linux*)   open_cmd='xdg-open' ;;
    msys*)    open_cmd='start ""' ;;
    *)        echo "Platform $OSTYPE not supported"
              return 1
              ;;
  esac

  # don't use nohup on OSX
  if [[ "$OSTYPE" == darwin* ]]; then
    $open_cmd "$@" &>/dev/null
  else
    nohup $open_cmd "$@" &>/dev/null
  fi
}

# Show dots while waiting for tab-completion
function expand-or-complete-with-dots() {
	# toggle line-wrapping off and back on again
	[[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti rmam
	print -Pn "%{%F{red}......%f%}"
	[[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti smam

	zle expand-or-complete
	zle redisplay
}

# Utilities functions
# Download png and save it to a file
function dl {
  curl $1 --out $2
}
# Make a folder and move cursor to this folder
function mkgo {
  mkdir $1 && cd $1
}

# Make a directory and cd into it
function take {
	mkdir -p $1
	cd $1
}
function create_and_edit_new_file() {
    touch "$1"
    vi "$1"
}

function backup_file() {
    mv "$1" "$1.bak"
}

function to_trash(){
    mv -fv "$@" ~/.Trash/
}

#Open a github repo in browser from terminal
#https://gist.github.com/igrigorik/6666860
function open_github() {
 git remote -v | grep push
 remote=${1:-origin}
 echo "Using remote $remote"

 URL=$(git config remote.$remote.url | sed "s/git@\(.*\):\(.*\).git/https:\/\/\1\/\2/")
 echo "Opening $URL..."
 open $URL
}

# this function needs brew install ghostscript 
function compresspdf() {
  echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# convert and reduce *.mov files to mp4 files
function convert_video() {
  for f in *.mov; do
    ffmpeg -i "$f" -vcodec h264 -acodec mp2 "${f%".mov"}.mp4"
  done
}

# convert webm to mp3 sound files
function convert_mp3() {
  for FILE in *.webm; do
     echo -e "Processing video '\e[32m$FILE\e[0m'";
     ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";
  done
}

function download_videos() {
  local link_file="$1"
  echo "Link file: $link_file"

  while IFS= read -r link
  do
    echo "Download video from $link"
    youtube-dl --write-auto-sub --convert-subs=srt --sub-lang en "$link"
  done < "$link_file"
}

function download_blob() {
    ffmpeg -i "$1" -codec copy downloaded_blob_file.mkv
}

function speed_test() {
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}

function write_link() {
    local default_folder="${DROPBOX:-$(HOME)}"
    local default_file="links.txt"
    local link_file="$default_folder/${2:-$default_file}"

    echo "Writing $1 to $link_file"

    echo "$1" >> $link_file
    echo "DONE!"
}
alias wl=write_link
