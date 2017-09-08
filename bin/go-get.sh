#!/usr/bin/env bash

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

run go get -u github.com/Masterminds/glide && \
run go get -u github.com/golang/lint/golint && \
run go get -u golang.org/x/tools/cmd/goimports
