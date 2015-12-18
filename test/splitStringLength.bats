#!/usr/bin/env bats

load ../scripts/helpers

@test "should return the length of the splitted string" {
  run splitStringLength ',' 'one,two,three'
  [ "$output" = "3" ]
}
