#!/usr/bin/env bash

getOption() { echo "$(tmux show-option -gqv "$1")"; }

getWindowOption() { echo "$(tmux show-option -gwqv "$1")"; }

appendOption() {
  tmux set-option -agq $1 $2
}

setOption() {
  if [ -z "$(getOption $1)" ] || [ "$(getOption $1)" == "default" ]; then
    tmux set-option -gq $1 $2
  fi
}

setWindowOption() {
  windowOption=$(getWindowOption $1)
  if [ -z "$windowOption" ] || [ "$windowOption" == "default" ]; then
    tmux set-window-option -gq $1 $2
  fi
}

getOptionOrElse() {
  local optionValue="$(getOption $1)"
  if [ -z "$optionValue" ]; then
    echo "$2"
  else
    echo "$optionValue"
  fi
}

trimString() {
  local var="$*"
  var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
  var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
  echo -n "$var"
}

splitStringOn() {
  IFS="${1}" read -r -a result <<< "$2"
  for i in "${result[@]}"; do echo "$i"; done
}

splitStringLength() {
  IFS="${1}" read -r -a result <<< "$2"
  echo "${#result[@]}"
}

getBgColor() {
  IFS="," read -r -a colors <<< "$1"
  colorSet=${colors[$2]}
  if [ -z $colorSet ]; then
    colorSet="$darkColor"
  fi
  echo $(trimString "$colorSet")
}

getFgColor() {
  IFS="," read -r -a colors <<< "$1"
  if [ -z ${colors[$2]} ]; then
    echo "$fgColor"
  else
    echo "$bgColor"
  fi
}
