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
    run concat.sh 'Hello ' 'Baeldung' "${PREFIX}/tmp/output"

    assert_exists "${PREFIX}/tmp/output"
}

@test "should write to file" {
    run concat.sh 'Hello ' 'Baeldung' "${PREFIX}/tmp/output"

    file_content="$(cat "${PREFIX}/tmp/output")"
    [ "$file_content" == 'Hello Baeldung' ]
}

@test "should write logs" {
    skip "Logs are not implemented yet"
    run concat.sh 'Hello ' 'Baeldung' "${PREFIX}/tmp/output"

    file_content="$(cat "${PREFIX}/tmp/logs")"
    [ "$file_content" == 'I logged something' ]
}

@test "test node version" {
    run node --version

    assert_output --partial "v23"
}
