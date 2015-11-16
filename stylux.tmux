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
    local currentSubsection=1
    setColor 'status-left' $currentSection

    for subStatus in $(getSubsections "$status"); do
      appendOption 'status-left' " $(trim "$subStatus") "
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

  rightStatus=$(getSections "$(getOption "@right-status")")
  currentSection=$(getSectionsLength "$(getOption "@right-status")")
  for status in $rightStatus; do
    local currentSubsection=$(getSubsectionsLength "$status")
    setColor 'status-right' $currentSection

    for subStatus in $(getSubsections "$status"); do
      appendOption 'status-right' " $(trim "$subStatus") "
      if [ $currentSubsection != 1 ]; then
        appendOption 'status-right' "$rightSubseperator"
        currentSubsection=$((currentSubsection - 1))
      fi
    done

    echo $currentSection $status
    if [ $currentSection > 1 ]; then
      appendOption 'status-right' "$rightSeperator"
      currentSection=$((currentSection - 1))
    fi
  done
}

initialize
setDefaults
main
