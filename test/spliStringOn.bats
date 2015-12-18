#!/usr/bin/env bats

load ../scripts/helpers

@test "Should split the string on the given delimiter" {
  run splitStringOn ',' 'one,two,three'
  [ "${lines[0]}" = "one" ]
  [ "${lines[1]}" = "two" ]
  [ "${lines[2]}" = "three" ]
}

@test "The splitted strings should be trimmed" {
  run splitStringOn '|' " one, two|three, four | five, six "
  [ "${lines[0]}" = "one, two" ]
  [ "${lines[1]}" = "three, four" ]
  [ "${lines[2]}" = "five, six" ]
}
