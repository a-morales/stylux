#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

primaryLeft=''
primaryRight=''
secondaryLeft=''
secondaryRigh=''

primaryLeftDefault=''
primaryRightDefault=''
secondaryLeftDefault=''
secondaryRightDefault=''

getOptionOrElse() {
  local optionValue="$(tmux show-option -gqv $1)"
  if [ -z "$optionValue" ]; then
    echo "$2"
  else
    echo "$optionValue"
  fi
}

getSeperators() {
  primaryLeft=$(getOptionOrElse "@primary-left" "$primaryLeftDefault")
  primaryRight=$(getOptionOrElse "@primary-right" "$primaryRightDefault")
  secondaryLeft=$(getOptionOrElse "@secondary-left" "$secondaryLeftDefault")
  secondaryRigh=$(getOptionOrElse "@secondary-right" "$secondaryRightDefault")
}

getSeperators
