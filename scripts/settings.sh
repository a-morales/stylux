#!/usr/bin/env bash

initialize() {
  leftSeperator=$(getOptionOrElse "@left-seperator" "")
  rightSeperator=$(getOptionOrElse "@right-seperator" "")
  leftSubseperator=$(getOptionOrElse "@left-subseperator" "")
  rightSubseperator=$(getOptionOrElse "@right-subseperator" "")

  bgColor=$(getOptionOrElse "@bg-color" 'black')
  fgColor=$(getOptionOrElse "@fg-color" 'white')
  primaryColor=$(getOptionOrElse "@primary-color" 'green')
  secondaryColor=$(getOptionOrElse "@secondary-color" 'red')

  colorList=$(getOptionOrElse "@left-colors", "$primaryColor, $secondaryColor")
}

setDefaults() {
  setOption "message-command-style" "fg=$fgColor,bg=$bgColor" true
  setOption "message-style" "fg=$fgColor,bg=$bgColor" true
  setOption "status-style" "fg=$fgColor,bg=$bgColor" true
  setOption 'pane-border-style' "fg=$bgColor,bg=$bgColor" true
  setOption 'pane-active-border-style' "fg=$primaryColor" true
  setWindowOption "window-status-activity-style" "fg=$bgColor,bg=$secondaryColor" true
  setWindowOption "window-status-bell-style" "fg=$bgColor,bg=$secondaryColor" true
  setWindowOption "window-status-current-style" "fg=$bgColor,bg=$primaryColor" true
  setWindowOption "window-status-style" "fg=$fgColor,bg=$bgColor" true
}

setColor() {
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$bgColor,bg=$primaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$bgColor,bg=$secondaryColor]"
  else
    appendOption "$1" "#[fg=$fgColor,bg=$bgColor]"
  fi
  echo "#[fg=$1,bg=$2]"
}

setColorBoundary() {
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$secondaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$secondaryColor,bg=$bgColor]"
  else
    appendOption "$1" "#[fg=$fgColor,bg=$bgColor]"
  fi
}

setRightColorBoundary() {
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$primaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$secondaryColor]"
  else
    appendOption "$1" "#[fg=$secondaryColor,bg=$bgColor]"
  fi
}
