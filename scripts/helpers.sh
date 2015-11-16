#!/usr/bin/env bash

getOption() { echo "$(tmux show-option -gqv $1)"; }

getWindowOption() { echo "$(tmux show-option -gwqv $1)"; }

setOption() {
  if [ -z "$(getOption $1)" ] || [ "$(getOption $1)" == "default" ] || [ "$3" == true ]; then
    tmux set-option -gq $1 $2
  fi
}

setWindowOption() {
  windowOption=$(getWindowOption $1)
  if [ -z "$windowOption" ] || [ "$windowOption" == "default" ] || [ "$3" == true ]; then
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

getColorCombination() {
  echo "#[fg=$(getFgColor $1),bg=$(getBgColor $1)]"
}

getColorBoundary() {
  echo "#[fg=$(getBgColor $1),bg=$(getBgColor $2)]"
}

getBgColor() {
  IFS="," read -r -a colors <<< "$colorList"
  colorSet=${colors[$1]}
  if [ -z $colorSet ]; then
    colorSet="$bgColor"
  fi
  echo $(trimString "$colorSet")
}

getFgColor() {
  IFS="," read -r -a colors <<< "$colorList"
  if [ -z ${colors[$1]} ]; then
    echo "$fgColor"
  else
    echo "$bgColor"
  fi
}
