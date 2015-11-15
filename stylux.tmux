#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/settings.sh"

main () {
  IFS=$'\n'
  tmux set-option -g status-left ""
  tmux set-option -g status-right ""

  leftStatus=$(getSections "$(getOption "@left-status")")
  leftLength=$(getSectionsLength "$(getOption "@left-status")")
  for status in $leftStatus; do
    tmux set-option -agq status-left " $(trim "$status")$leftSeperator"
  done

  rightStatus=$(getSections "$(getOption "@right-status")")
  rightLength=$(getSectionsLength "$(getOption "@right-status")")
  for status in $rightStatus; do
    tmux set-option -agq status-right " $rightSeperator$(trim "$status")"
  done
}

initialize
setDefaults
main
