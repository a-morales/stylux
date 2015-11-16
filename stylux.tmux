#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/settings.sh"

main () {
  IFS=$'\n'
  tmux set-option -g status-left ""
  tmux set-option -g status-right ""

  leftStatus=$(getSections "$(getOption "@left-status")")
  sectionLength=$(getSectionsLength "$(getOption "@left-status")")
  local currentSection=1
  for status in $leftStatus; do
    local sectionLength=$(getSubsectionsLength "$status")
    local currentSubSection=1
    setColor $currentSection

    for subStatus in $(getSubSections "$status"); do
      tmux set-option -agq status-left " $(trim "$subStatus") "
      if [ $currentSubSection != $sectionLength ]; then
        tmux set-option -agq status-left "$leftSubseperator"
        currentSubSection=$((currentSubSection + 1))
      fi
    done

    if [ $currentSection != $sectionLength ]; then
      setColorBoundary $currentSection
      tmux set-option -agq status-left "$leftSeperator"
      currentSection=$((currentSection + 1))
    fi

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
