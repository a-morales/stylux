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


getLeftColorCombination() {
  echo "#[fg=$(getFgColor $1 $leftFgList),bg=$(getBgColor $1 $leftBgList)]"
}

getRightColorCombination() {
  echo "#[fg=$(getFgColor $1 $rightFgList),bg=$(getBgColor $1 $rightBgList)]"
}

getLeftColorBoundary() {
  echo "#[fg=$(getBgColor $1 $leftBgList),bg=$(getBgColor $(($1 + 1)) $leftBgList)]"
}

getRightColorBoundary() {
  echo "#[fg=$(getBgColor $(($1 -1)) $rightBgList),bg=$(getBgColor $1 $rightBgList)]"
}

getBgColor() {
  echo $(getColor "$1" "$2" "$bgColor")
}

getFgColor() {
  echo $(getColor "$1" "$2" "$fgColor")
}

getColor() {
  IFS="," read -r -a colors <<< "$2"
  color=${colors[$1]}
  if [ -z $color ]; then
    color=$3
  fi
  echo $(trimString "$color")
}

