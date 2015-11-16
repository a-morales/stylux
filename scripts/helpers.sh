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

trim() {
  local var="$*"
  var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
  var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
  echo -n "$var"
}

getSections() {
  IFS="|" read -r -a result <<< "$1"
  for i in "${result[@]}"; do echo "$i"; done
}

getSubSections() {
  IFS="," read -r -a result <<< "$1"
  for i in "${result[@]}"; do echo "$i"; done
}

getSectionsLength() {
  IFS="|" read -r -a result <<< "$1"
  echo "${#result[@]}"
}

getSubsectionsLength() {
  IFS="," read -r -a result <<< "$1"
  echo "${#result[@]}"
}
