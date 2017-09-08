#!/usr/bin/env bash

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

cd "$PROJECT_ROOT" && \
run goimports -l ./app/ && \
run goimports -l ./src/ && \
run go fmt ./app/... && \
run go fmt ./src/...
