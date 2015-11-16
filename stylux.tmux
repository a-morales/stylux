#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
source "$CURRENT_DIR/scripts/settings.sh"

renderLeftStatus() {
  leftStatusString=""

  leftStatus=$(splitStringOn '|' "$(getOption "@left-status")")
  numberOfSections=$(splitStringLength '|' "$(getOption "@left-status")")
  local currentSection=0
  for status in $leftStatus; do
    local sectionLength=$(splitStringLength ',' "$status")
    local currentSubsection=1
    leftStatusString="${leftStatusString}$(getColorCombination $currentSection)"

    for subStatus in $(splitStringOn ',' "$status"); do
      leftStatusString="${leftStatusString} $(trimString "$subStatus") "
      if [ $currentSubsection -lt $sectionLength ]; then
        leftStatusString="${leftStatusString}$leftSubseperator"
        ((currentSubsection+=1))
      fi
    done

    if [ $currentSection -lt $numberOfSections ]; then
      leftStatusString="${leftStatusString}$(getColorBoundary $currentSection $((currentSection + 1)))$leftSeperator"
      ((currentSection+=1))
    fi
  done

  if [ -n $leftStatusString ]; then
    setOption 'status-left' "$leftStatusString" true
  fi
}

main () {
  IFS=$'\n'
  # tmux set-option -g status-right ""

  renderLeftStatus


  # rightStatus=$(splitStringOn '|' "$(getOption "@right-status")")
  # currentSection=$(splitStringLength '|' "$(getOption "@right-status")")
  # for status in $rightStatus; do
  #   local currentSubsection=$(splitStringLength ',' "$status")
  #   setColor 'status-right' $currentSection

  #   for subStatus in $(splitStringOn ',' "$status"); do
  #     appendOption 'status-right' " $(trimString "$subStatus") "
  #     if [ $currentSubsection != 1 ]; then
  #       appendOption 'status-right' "$rightSubseperator"
  #       currentSubsection=$((currentSubsection - 1))
  #     fi
  #   done

  #   if [ $currentSection > 1 ]; then
  #     appendOption 'status-right' "$rightSeperator"
  #     currentSection=$((currentSection - 1))
  #   fi
  # done
}

initialize
setDefaults
main
