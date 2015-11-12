#!/usr/bin/env bash

left_status=$(tmux show-option -gqv "@left-status")
right_status=$(tmux show-option -gqv "@right-status")

trim() {
  local var="$*"
  var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
  var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
  echo -n "$var"
}

main () {
  IFS=\|
  tmux set-option -g status-left ""
  tmux set-option -g status-right ""
  for status in $left_status; do
    tmux set-option -agq status-left "$(trim $status) "
  done
  for status in $right_status; do
    tmux set-option -agq status-right "$(trim $status) "
  done
}

main
