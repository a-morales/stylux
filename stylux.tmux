#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/settings.sh"
source "$CURRENT_DIR/scripts/defaults.sh"

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

setDefaults
getSeperators
main
