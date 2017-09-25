#!/usr/bin/env bash

set -eu

run() {
  printf "\e[1m==> %s\e[0m\n" "$*"
  eval -- "$@"
}

err() {
  printf "\e[1;38;5;255;48;5;9mError: %s\e[0m\n" "$*"
  exit 1
}
