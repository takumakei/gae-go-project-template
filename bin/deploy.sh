#!/usr/bin/env bash

SERVICES=(app/default/app.yaml)

eval "$("$(dirname "$0")/env.sh")"
eval "source \"$(dirname "$0")/common.sh\""

if [[ "x${GOOGLE_PROJECT_ID:-}" == "x" ]]; then
  err "GOOGLE_PROJECT_ID (environment variable) needed"
fi

PROMOTE="--no-promote"
for OPT in "$@"; do
  case "$OPT" in
    --promote | --no-promote)
      PROMOTE="$OPT"
      ;;
    *)
      err "unknown option '$OPT'"
      ;;
  esac
  shift
done

VERSION="$(date +%Y%m%d-%H%M%S)-$(git rev-parse --short HEAD)"

cd "$PROJECT_ROOT" && \
run gcloud app deploy "$PROMOTE" --project "$GOOGLE_PROJECT_ID" --version "$VERSION" "${SERVICES[@]}"
