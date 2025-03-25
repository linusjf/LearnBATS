
setup() {
    load 'test_helper/common-setup'
    _common_setup
}


@test "Show welcome message on first invocation" {
    if [[ -e "${PREFIX}/tmp/bats-tutorial-project-ran" ]]; then
        skip 'The FIRST_RUN_FILE already exists'
    fi

    run project.sh
    assert_output --partial 'Welcome to our project!'

    run project.sh
    refute_output --partial 'Welcome to our project!'
}

teardown() {
: # Look Ma! No cleanup!
}
