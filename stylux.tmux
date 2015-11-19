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
    leftStatusString="${leftStatusString}$(getLeftColorCombination $currentSection)"

    for subStatus in $(splitStringOn ',' "$status"); do
      leftStatusString="${leftStatusString} $(trimString "$subStatus") "
      if [ $currentSubsection -lt $sectionLength ]; then
        leftStatusString="${leftStatusString}$leftSubseperator"
        currentSubsection=$((currentSubsection + 1))
      fi
    done

    if [ $currentSection -lt $numberOfSections ]; then
      leftStatusString="${leftStatusString}$(getLeftColorBoundary $currentSection)$leftSeperator"
    fi

    currentSection=$((currentSection + 1))
  done

  if [ -n $leftStatusString ]; then
    setOption 'status-left' "$leftStatusString" true
  fi
}

renderRightStatus() {
  rightStatusString=""

  rightStatus=$(splitStringOn '|' "$(getOption "@right-status")")
  numberOfSections=$(splitStringLength '|' "$(getOption "@right-status")")
  local currentSection=$((numberOfSections))

  for status in $rightStatus; do
    local sectionLength=$(splitStringLength ',' "$status")
    local currentSubsection=$((sectionLength - 1))

    if [ $currentSection -gt 0 ]; then
      rightStatusString="${rightStatusString}$(getRightColorBoundary $currentSection)$rightSeperator"
    fi
    rightStatusString="${rightStatusString}$(getRightColorCombination $((currentSection - 1)))"

    for subStatus in $(splitStringOn ',' "$status"); do
      rightStatusString="${rightStatusString} $(trimString $subStatus) "
      if [ $currentSubsection -gt 0 ]; then
        rightStatusString="${rightStatusString}$rightSubseperator"
        currentSubsection=$((currentSubsection - 1))
      fi
    done

    currentSection=$((currentSection - 1))
  done

  if [ -n $rightStatusString ]; then
    setOption 'status-right' "$rightStatusString" true
  fi
}

main () {
  IFS=$'\n'

  renderLeftStatus
  renderRightStatus

}

initialize
setDefaults
main
