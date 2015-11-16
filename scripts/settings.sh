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

  leftColors=$(getOptionOrElse "@left-colors", 'blue, green')
  rightColors=$(getOptionOrElse "@right-colors", 'blue, green')
}

setDefaults() {
  setOption "message-command-style" "fg=$fgColor,bg=$bgColor"
  setOption "message-style" "fg=$fgColor,bg=$bgColor"
  setOption "status-style" "fg=$fgColor,bg=$bgColor"
  setOption 'pane-border-style' "fg=$bgColor,bg=$bgColor"
  setOption 'pane-active-border-style' "fg=$primaryColor"
  setWindowOption "window-status-activity-style" "fg=$bgColor,bg=$secondaryColor"
  setWindowOption "window-status-bell-style" "fg=$bgColor,bg=$secondaryColor"
  setWindowOption "window-status-current-style" "fg=$bgColor,bg=$primaryColor"
  setWindowOption "window-status-style" "fg=$fgColor,bg=$bgColor"
}

setColor() {
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$bgColor,bg=$primaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$bgColor,bg=$secondaryColor]"
  else
    appendOption "$1" "#[fg=$fgColor,bg=$bgColor]"
  fi
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
  echo $2
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$primaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$secondaryColor]"
  else
    appendOption "$1" "#[fg=$secondaryColor,bg=$bgColor]"
  fi
}
