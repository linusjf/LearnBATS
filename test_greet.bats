#!/usr/bin/env bats

load './greet.sh'

@test "greet function with name" {
  run greet "World"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, World!" ]
}

@test "greet function without name" {
  run greet ""
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, !" ]
}

@test "fetch_greeting function" {
  # Mocking curl
  function curl() {
    echo "Mocked greeting"
  }

  run fetch_greeting
  [ "$output" = "Mocked greeting" ]
}
