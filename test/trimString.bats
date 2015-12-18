#!/usr/bin/env bats

load ../scripts/helpers

@test "Should trim whitespace at the beginning" {
  run trimString "   This is a test string"
  [ "$output" = "This is a test string" ]
}

@test "Should trim whitespace at the end" {
  run trimString "This is a test string     "
  [ "$output" = "This is a test string" ]
}
