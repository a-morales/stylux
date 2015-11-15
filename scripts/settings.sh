#!/usr/bin/env bash

initialize() {
  leftSeperator=$(getOptionOrElse "@left-seperator" "")
  rightSeperator=$(getOptionOrElse "@right-seperator" "")
  leftSubseperator=$(getOptionOrElse "@left-subseperator" "")
  rightSubseperator=$(getOptionOrElse "@right-subseperator" "")

  bgColor=$(getOptionOrElse "@bg-color" 'black')
  fgColor=$(getOptionOrElse "@fg-color" 'white')
  primaryColor=$(getOptionOrElse "@primary-color" 'green')
  secondaryColor=$(getOptionOrElse "@secondary-color" 'yellow')
  tertiaryColor=$(getOptionOrElse "@tertiary-color" 'red')
}

setDefaults() {
  setOption "message-command-style" "fg=$fgColor,bg=$bgColor"
  setOption "message-style" "fg=$fgColor,bg=$bgColor"
  setOption "status-style" "fg=$fgColor,bg=$bgColor"
  setWindowOption "window-status-activity-style" "fg=$bgColor,bg=$secondaryColor"
  setWindowOption "window-status-bell-style" "fg=$bgColor,bg=$secondaryColor"
  setWindowOption "window-status-current-style" "fg=$bgColor,bg=$primaryColor"
  setWindowOption "window-status-style" "fg=$fgColor,bg=$bgColor"
}
