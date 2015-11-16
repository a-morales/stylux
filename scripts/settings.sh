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
  setWindowOption "window-status-activity-style" "fg=$darkColor,bg=$secondaryColor"
  setWindowOption "window-status-bell-style" "fg=$darkColor,bg=$secondaryColor"
  setWindowOption "window-status-current-style" "fg=$darkColor,bg=$primaryColor"
  setWindowOption "window-status-style" "fg=$lightColor,bg=$darkColor"
}

setColor() {
  if [ $1 == 1 ]; then
    appendOption 'status-left' "#[fg=$darkColor,bg=$primaryColor]"
  elif [ $1 == 2 ]; then
    appendOption 'status-left' "#[fg=$darkColor,bg=$secondaryColor]"
  else
    appendOption 'status-left' "#[fg=$lightColor,bg=$darkColor]"
  fi
}

setColorBoundary() {
  if [ $1 == 1 ]; then
    appendOption 'status-left' "#[fg=$primaryColor,bg=$secondaryColor]"
  elif [ $1 == 2 ]; then
    appendOption 'status-left' "#[fg=$secondaryColor,bg=$darkColor]"
  else
    appendOption 'status-left' "#[fg=$lightColor,bg=$darkColor]"
  fi
}
