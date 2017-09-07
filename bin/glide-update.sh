#!/usr/bin/env bash

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

cd "$PROJECT_ROOT/vendor"
run glide update
