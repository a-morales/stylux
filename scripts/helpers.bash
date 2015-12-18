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
  for i in "${result[@]}"; do echo "$(trimString $i)"; done
}

splitStringLength() {
  IFS="${1}" read -r -a result <<< "$2"
  echo "${#result[@]}"
}

getColorCombination() {
  fgList=$(eval "echo \$$2FgList")
  bgList=$(eval "echo \$$2BgList")
  if [ $2 == 'left' ]; then
    index=$1
  else
    index=$(($1 - 1))
  fi
  echo "#[fg=$(getColor $index "$fgList" "$fgColor"),bg=$(getColor $index "$bgLIst" $bgColor)]"
}

getSeperator() {
  bgList=$(eval "echo \$$2BgList")
  seperator=$(eval "echo \$$2Seperator")
  subSeperator=$(eval "echo \$$2Subseperator")
  if [ $2 == 'left' ]; then
    leftBoundary=$1
    rightBoundary="$(($1 + 1))"
  else
    leftBoundary=$(($1 - 1))
    rightBoundary=$1
  fi
  result="#[fg=$(getColor $leftBoundary "$bgList" "$bgColor"),bg=$(getColor $rightBoundary "$bgList" "$bgColor")]"

  if [ $result == '#[fg=black,bg=black]' ]; then
    result="$(getColorCombination $1 $2)$subSeperator"
  else
    result="${result}$seperator"
  fi

  echo $result
}

getColor() {
  IFS="," read -r -a colors <<< "$2"
  color=${colors[$1]}
  if [ -z $color ]; then
    color=$3
  fi
  if [ -z $color ]; then
    exit 1
  fi
  echo $(trimString "$color")
}
