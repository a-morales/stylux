#!/usr/bin/env bats

load ../scripts/settings

@test "Should set to powerline when passed in 'powerline'" {
  setSeperators "powerline"
  echo $leftSeperator
  echo $leftSubseperator
  [ "$leftSeperator" == "" ]
  [ "$leftSubseperator" == "" ]
}

@test "Should set to dithered when passed in 'dithered'" {
  setSeperators "dithered"
  [ "$leftSeperator" == "░▓" ]
  [ "$leftSubseperator" == "░" ]
}

@test "Should set to blocks otherwise'" {
  setSeperators "foo"
  echo $leftSeperator
  [ "$leftSeperator" == "" ]
  [ "$leftSubseperator" == "|" ]
}
