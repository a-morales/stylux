#!/usr/bin/env bash

getTmuxOption() {
  echo "$(tmux show-option -gqv "$1")"
}

getTmuxOptionOrElse() {
  local optionValue="$(tmux show-option -gqv $1)"
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
  for i in "${result[@]}"; do
    echo "$i"
  done
}

getSectionsLength() {
  IFS="|" read -r -a result <<< "$1"
  echo "${#result[@]}"
}
