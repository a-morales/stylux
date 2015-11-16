#!/usr/bin/env bash

initialize() {
  leftSeperator=$(getOptionOrElse "@left-seperator" "")
  rightSeperator=$(getOptionOrElse "@right-seperator" "")
  leftSubseperator=$(getOptionOrElse "@left-subseperator" "")
  rightSubseperator=$(getOptionOrElse "@right-subseperator" "")

  darkColor=$(getOptionOrElse "@dark-color" 'black')
  lightColor=$(getOptionOrElse "@light-color" 'white')
  primaryColor=$(getOptionOrElse "@primary-color" 'green')
  secondaryColor=$(getOptionOrElse "@secondary-color" 'yellow')
  tertiaryColor=$(getOptionOrElse "@tertiary-color" 'red')
}

setDefaults() {
  setOption "message-command-style" "fg=$lightColor,bg=$darkColor"
  setOption "message-style" "fg=$lightColor,bg=$darkColor"
  setOption "status-style" "fg=$lightColor,bg=$darkColor"
  setOption 'pane-border-style' "fg=$darkColor,bg=$darkColor"
  setOption 'pane-active-border-style' "fg=$primaryColor"
  setWindowOption "window-status-activity-style" "fg=$darkColor,bg=$secondaryColor"
  setWindowOption "window-status-bell-style" "fg=$darkColor,bg=$secondaryColor"
  setWindowOption "window-status-current-style" "fg=$darkColor,bg=$primaryColor"
  setWindowOption "window-status-style" "fg=$lightColor,bg=$darkColor"
}

setColor() {
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$darkColor,bg=$primaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$darkColor,bg=$secondaryColor]"
  else
    appendOption "$1" "#[fg=$lightColor,bg=$darkColor]"
  fi
}

setColorBoundary() {
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$secondaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$secondaryColor,bg=$darkColor]"
  else
    appendOption "$1" "#[fg=$lightColor,bg=$darkColor]"
  fi
}

setRightColorBoundary() {
  echo $2
  if [ $2 == 1 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$primaryColor]"
  elif [ $2 == 2 ]; then
    appendOption "$1" "#[fg=$primaryColor,bg=$secondaryColor]"
  else
    appendOption "$1" "#[fg=$secondaryColor,bg=$darkColor]"
  fi
}
