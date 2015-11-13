#!/usr/bin/env bash

getSeperators() {
  leftSeperator=$(getTmuxOptionOrElse "@left-seperator" "")
  rightSeperator=$(getTmuxOptionOrElse "@right-seperator" "")
  leftSubseperator=$(getTmuxOptionOrElse "@left-subseperator" "")
  rightSubseperator=$(getTmuxOptionOrElse "@right-subseperator" "")
}
