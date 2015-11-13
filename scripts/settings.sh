#!/usr/bin/env bash

getSeperators() {
  leftSeperator=$(getTmuxOptionOrElse "@primary-left" "")
  rightSeperator=$(getTmuxOptionOrElse "@primary-right" "")
  leftSubseperator=$(getTmuxOptionOrElse "@secondary-left" "")
  rightSubseperator=$(getTmuxOptionOrElse "@secondary-right" "")
}
