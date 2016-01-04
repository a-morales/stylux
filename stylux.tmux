#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.bash"
source "$CURRENT_DIR/scripts/settings.bash"

renderLeftStatus() {
  leftStatusString=""

  leftStatus=$(splitStringOn '|' "$(getOption "status-left")")
  numberOfSections=$(splitStringLength '|' "$(getOption "status-left")")
  local currentSection=0
  for status in $leftStatus; do
    local sectionLength=$(splitStringLength ',' "$status")
    local currentSubsection=1
    leftStatusString="${leftStatusString}$(getColorCombination $currentSection 'left')"

    for subStatus in $(splitStringOn ',' "$status"); do
      leftStatusString="${leftStatusString} $(trimString "$subStatus") "
      if [ $currentSubsection -lt $sectionLength ]; then
        leftStatusString="${leftStatusString}$leftSubseperator"
        currentSubsection=$((currentSubsection + 1))
      fi
    done

    if [ $currentSection -lt $numberOfSections ]; then
      leftStatusString="${leftStatusString}$(getSeperator $currentSection 'left')"
    fi

    currentSection=$((currentSection + 1))
  done

  echo "$leftStatusString"
}

renderRightStatus() {
  rightStatusString=""

  rightStatus=$(splitStringOn '|' "$(getOption "status-right")")
  numberOfSections=$(splitStringLength '|' "$(getOption "status-right")")
  local currentSection=$((numberOfSections))

  for status in $rightStatus; do
    local sectionLength=$(splitStringLength ',' "$status")
    local currentSubsection=($sectionLength)

    # echo $currentSection
    if [ $currentSection -gt 0 ]; then
      rightStatusString="${rightStatusString}$(getSeperator $currentSection 'right')"
    fi
    rightStatusString="${rightStatusString}$(getColorCombination $currentSection 'right')"

    for subStatus in $(splitStringOn ',' "$status"); do
      rightStatusString="${rightStatusString} $(trimString $subStatus) "
      # echo $currentSubsection
      if [ $currentSubsection -gt 1 ]; then
        rightStatusString="${rightStatusString}$rightSubseperator"
        currentSubsection=$((currentSubsection - 1))
      fi
    done

    # echo $rightStatusString
    currentSection=$((currentSection + -1))
  done

  echo "$rightStatusString"
}

main () {
  IFS=$'\n'

  setOption 'status-left' $(renderLeftStatus) true
  setOption 'status-right' $(renderRightStatus) true

}

initialize
main
