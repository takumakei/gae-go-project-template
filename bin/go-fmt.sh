#!/usr/bin/env bash

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

cd "$PROJECT_ROOT" && \
run goimports -l ./app/ ./src && \
run go fmt ./app/... ./src/...
