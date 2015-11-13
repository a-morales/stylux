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

splitString() {
  IFS="$1" read -ra result <<< "$2"
  echo "$result"
}
