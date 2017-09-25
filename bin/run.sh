#!/usr/bin/env bash

SERVICES=(app/default/app.yaml)

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

cd "$PROJECT_ROOT" && \
run dev_appserver.py "$@" "${SERVICES[@]}"
