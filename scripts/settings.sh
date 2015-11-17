#!/usr/bin/env bash

initialize() {
  leftSeperator=$(getOptionOrElse '@left-seperator' '')
  rightSeperator=$(getOptionOrElse '@right-seperator' '')
  leftSubseperator=$(getOptionOrElse '@left-subseperator' '')
  rightSubseperator=$(getOptionOrElse '@right-subseperator' '')

  bgColor=$(getOptionOrElse '@bg-color' 'black')
  fgColor=$(getOptionOrElse '@fg-color' 'white')
  primaryColor=$(getOptionOrElse '@primary-color' 'green')
  secondaryColor=$(getOptionOrElse '@secondary-color' 'blue')

  colorList=$(getOptionOrElse '@color-list', "$primaryColor, $secondaryColor")
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
