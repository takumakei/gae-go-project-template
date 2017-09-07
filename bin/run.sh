#!/usr/bin/env bash

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

SERVICES=()
SERVICES+=(app/default/app.yaml)

cd "$PROJECT_ROOT"
run dev_appserver.py "${SERVICES[@]}"
