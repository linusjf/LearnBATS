#!/usr/bin/env bash

function greet() {
  echo "Hello, $1!"
}

function fetch_greeting() {
  curl http://example.com/greeting
}
