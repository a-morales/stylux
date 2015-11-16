#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/settings.sh"

main () {
  IFS=$'\n'
  tmux set-option -g status-left ""
  tmux set-option -g status-right ""

  leftStatus=$(splitStringOn '|' "$(getOption "@left-status")")
  sectionLength=$(splitStringLength '|' "$(getOption "@left-status")")
  local currentSection=1
  for status in $leftStatus; do
    local sectionLength=$(splitStringLength ',' "$status")
    local currentSubsection=1
    setColor 'status-left' $currentSection

    for subStatus in $(splitStringOn ',' "$status"); do
      appendOption 'status-left' " $(trimString "$subStatus") "
      if [ $currentSubsection != $sectionLength ]; then
        appendOption 'status-left' "$leftSubseperator"
        currentSubsection=$((currentSubsection + 1))
      fi
    done

    if [ $currentSection != $sectionLength ]; then
      setColorBoundary 'status-left' $currentSection
      appendOption 'status-left' "$leftSeperator"
      currentSection=$((currentSection + 1))
    fi

  done

  rightStatus=$(splitStringOn '|' "$(getOption "@right-status")")
  currentSection=$(splitStringLength '|' "$(getOption "@right-status")")
  for status in $rightStatus; do
    local currentSubsection=$(splitStringLength ',' "$status")
    setColor 'status-right' $currentSection

    for subStatus in $(splitStringOn ',' "$status"); do
      appendOption 'status-right' " $(trimString "$subStatus") "
      if [ $currentSubsection != 1 ]; then
        appendOption 'status-right' "$rightSubseperator"
        currentSubsection=$((currentSubsection - 1))
      fi
    done

    if [ $currentSection > 1 ]; then
      appendOption 'status-right' "$rightSeperator"
      currentSection=$((currentSection - 1))
    fi
  done
}

initialize
setDefaults
main
