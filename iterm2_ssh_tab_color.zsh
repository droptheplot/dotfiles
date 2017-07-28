function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi

  echo -e "\033]50;SetProfile=$NAME\a"

  echo -ne "\033]6;1;bg;red;brightness;255\a"
  echo -ne "\033]6;1;bg;green;brightness;0\a"
  echo -ne "\033]6;1;bg;blue;brightness;0\a"
}

function tab-reset() {
  NAME="Default"
  echo -e "\033]50;SetProfile=$NAME\a"
  echo -ne "\033]6;1;bg;*;default\a"
}

function colorssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tab-reset" INT EXIT
    tabc SSH
  fi
  ssh $*
}
compdef _ssh tabc=ssh

alias ssh="colorssh"
