#!/usr/bin/env bash

set -eu

run() {
  echo "$(tput bold)==> $*$(tput sgr0)"
  "$@"
}

err() {
  echo "$(tput bold)Error$(tput sgr0): $*"
  exit 1
}
