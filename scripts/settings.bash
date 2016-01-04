#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.bash"

initialize() {
  setSeperators "$(getOptionOrElse @seperators 'powerline')"

  setColors
  setDefaults
}

setSeperators() {
  seperatorType="$1"
  if [ $1 == 'powerline' ]; then
    leftSeperator=$(getOptionOrElse '@left-seperator' '')
    rightSeperator=$(getOptionOrElse '@right-seperator' '')
    leftSubseperator=$(getOptionOrElse '@left-subseperator' '')
    rightSubseperator=$(getOptionOrElse '@right-subseperator' '')
  elif [ $1 == 'dithered' ]; then
    leftSeperator=$(getOptionOrElse '@left-seperator' '▓░')
    rightSeperator=$(getOptionOrElse '@right-seperator' '░▓')
    leftSubseperator=$(getOptionOrElse '@left-subseperator' '░')
    rightSubseperator=$(getOptionOrElse '@right-subseperator' '░')
  else
    seperatorType='block'
    leftSeperator=$(getOptionOrElse '@left-seperator' '')
    rightSeperator=$(getOptionOrElse '@right-seperator' '')
    leftSubseperator=$(getOptionOrElse '@left-subseperator' '|')
    rightSubseperator=$(getOptionOrElse '@right-subseperator' '|')
  fi
}

setColors() {
  bgColor=$(getOptionOrElse '@bg-color' 'black')
  fgColor=$(getOptionOrElse '@fg-color' 'white')
  primaryColor=$(getOptionOrElse '@primary-color' 'green')
  secondaryColor=$(getOptionOrElse '@secondary-color' 'blue')

  leftBgList=$(getOptionOrElse '@left-bg-list' "$primaryColor, $secondaryColor")
  leftFgList=$(getOptionOrElse '@left-fg-list' "$bgColor, $bgColor")
  rightBgList=$(getOptionOrElse '@right-bg-list' "$primaryColor, $secondaryColor")
  rightFgList=$(getOptionOrElse '@right-fg-list' "$bgColor, $bgColor")
}

setDefaults() {
  setOption 'status' 'on' true
  setOption 'status-utf8' 'on' true
  setOption 'message-command-style' "fg=$fgColor,bg=$bgColor" true
  setOption 'message-style' "fg=$fgColor,bg=$bgColor" true
  setOption 'status-style' "fg=$fgColor,bg=$bgColor" true
  setOption 'pane-border-style' "fg=$bgColor,bg=$bgColor" true
  setOption 'pane-active-border-style' "fg=$primaryColor" true
  setWindowOption 'window-status-activity-style' "fg=$bgColor,bg=$secondaryColor" true
  setWindowOption 'window-status-bell-style' "fg=$bgColor,bg=$secondaryColor" true
  setWindowOption 'window-status-current-style' "fg=$bgColor,bg=$primaryColor" true
  setWindowOption 'window-status-style' "fg=$fgColor,bg=$bgColor" true
}
