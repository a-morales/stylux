#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/settings.sh"

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

  for status in $(getTmuxOption "@left-status"); do
    tmux set-option -agq status-left "$(trim $status) $leftSeperator "
  done
  for status in $(getTmuxOption "@right-status"); do
    tmux set-option -agq status-right "$rightSeperator $(trim $status) "
  done
}

getSeperators
main
