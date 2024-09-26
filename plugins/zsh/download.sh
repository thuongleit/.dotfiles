#!/bin/bash


#function wl() {
#  echo "$1" >> "$download_file"
  #cat "$download_file"
#}

#function rm_file() {
#rm $download_file
#}

function speed_test() {
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}

function download_videos() {
  local output_folder="output"
  if [ ! -d $output_folder ]
  then
      mkdir "$output_folder"
  fi

  speed_test
  local download_file="links.txt"

  while IFS= read -r link
  do
    echo "Download video from $link"
    # youtube-dl --write-auto-sub --convert-subs=srt --sub-lang en "$link"
    yt-dlp -f "bestvideo[height<=1080]+bestaudio/best" -o "$output_folder/%(title)s-%(id)s.%(ext)s" "$link"
    sed -i "/s/$link//" "$download_file"
  done < "$download_file"
}

download_videos
