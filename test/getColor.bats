#!/usr/bin/env bats

load ../scripts/helpers

@test "Should get the color at the index provided" {
  run getColor 1 "red,blue,white"
  [ "$output" == "blue" ]
}

@test "Should trim the output" {
  run getColor 2 "  red,blue   ,    white  "
  [ "$output" == "white" ]
}

@test "Use the default color provided if index is invalid" {
  run getColor 5 "red,blue,white" "black"
  [ "$output" == "black" ]
}

@test "Exit if index is invalid and no default color is provided" {
  run getColor 5 "red,blue,white"
  [ "$status" -eq 1 ]
}
