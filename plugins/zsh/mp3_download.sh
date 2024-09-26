#!/bin/bash

function speed_test() {
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}

function download_videos() {
  local link_file="$1"
  echo "Link file: $link_file"

  local output_folder="output"
  if [ ! -d $output_folder ]
  then
      mkdir "$output_folder"
  fi

  while IFS= read -r link
  do
    echo "Download video from $link"
    # youtube-dl --write-auto-sub --convert-subs=srt --sub-lang en "$link"
    yt-dlp -x --audio-format "mp3" -f "bestvideo[height<=1080]+bestaudio/best" -o "$output_folder/%(title)s-%(id)s.%(ext)s" "$link"
  done < "$link_file"
}

speed_test
download_videos "links.txt"
