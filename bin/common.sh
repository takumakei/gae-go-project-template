#!/usr/bin/env bash

set -eu

run() {
  echo -e "\e[1m==> $*\e[0m"
  "$@"
}

err() {
  echo -e "\e[1;38;5;255;48;5;9mError: $*\e[0m"
  exit 1
}
