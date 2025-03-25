#!/usr/bin/env bats

setup() {
    load 'test_helper/common-setup'
    _common_setup
}

@test "must return concatenated input" {
  run concat.sh "Hello, " "World!"
  assert_output "Hello, World!"
}
