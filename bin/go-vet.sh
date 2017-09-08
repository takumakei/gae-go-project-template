#!/usr/bin/env bash

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

unset GOROOT

cd "$PROJECT_ROOT" && \
run go vet ./app/... ./src/...
