# Functions
function new_chrome(){
  local new_dir="$HOME/.another_chrome"

  if [ ! -d "$new_dir" ]; then
   mkdir "$new_dir"
  fi

  exec open -na "Google Chrome" --args "--user-data-dir=$new_dir"
}
