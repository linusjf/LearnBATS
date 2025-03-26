#!/usr/bin/env bats

setup() {
    load 'test_helper/common-setup'
    _common_setup
}

@test "should run script" {
    concat.sh "Hello, " "Baeldung" "${PREFIX}/tmp/output"
}


@test "must return concatenated input" {
  run concat.sh "Hello, " "World!" "${PREFIX}/tmp/output"
  assert_output "Hello, World!"
}

@test "should create file" {
    run project.sh 'Hello ' 'Baeldung' "${PREFIX}/tmp/output"

    assert_exists "${PREFIX}/tmp/output"
}
