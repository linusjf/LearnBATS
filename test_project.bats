#!/usr/bin/env bats

@test "project script with inputs" {
  run ./project.sh "Hello, " "World" "project.txt"
}

@test "must return concatenated input" {
  run ./project.sh "Hello, " "World!" "project.txt"
  [ "$output" = "Hello, World!" ]
  [ "$status" -eq 0 ]
  run cat "project.txt"
  [ "$output" = "Hello, World!" ]
}
