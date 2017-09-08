#!/usr/bin/env bash

eval "source \"$(dirname "$0")/common.sh\""

main() {
  if [[ $# -eq 0 ]]; then
    print_env
  else
    eval "$(print_env)"
    eval "$@"
  fi
}

print_env() {
  local dev_appserver_py
  if ! dev_appserver_py="$(which dev_appserver.py)"; then
    err "dev_appserver.py not found. Google Cloud SDK missing ?" >&2
  fi

  PROJECT_ROOT="$(dirname "$(dirname "$(realpath "$0")")")"
  echo "export PROJECT_ROOT=\"$PROJECT_ROOT\""

  GOPATH="${PROJECT_ROOT}/.go:${PROJECT_ROOT}/.src:${PROJECT_ROOT}/.vendor"
  echo "export GOPATH=\"$GOPATH\""

  GOROOT="$(dirname "$(dirname "$(realpath "$dev_appserver_py")")")/platform/google_appengine/goroot-1.8"
  echo "export GOROOT=\"$GOROOT\""

  PATH="${PROJECT_ROOT}/bin:${PROJECT_ROOT}/.go/bin:$PATH"
  echo "export PATH=\"$PATH\""
}

realpath () {
(
  TARGET_FILE="$1"

  cd "$(dirname "$TARGET_FILE")" || exit 1
  TARGET_FILE=$(basename "$TARGET_FILE")

  COUNT=0
  while [[ -L "$TARGET_FILE" ]] && [[ $COUNT -lt 100 ]]
  do
      TARGET_FILE=$(readlink "$TARGET_FILE")
      cd "$(dirname "$TARGET_FILE")" || exit 1
      TARGET_FILE=$(basename "$TARGET_FILE")
      COUNT=$((COUNT + 1))
  done

  echo "$(pwd -P)/$TARGET_FILE"
)
}

main "$@"
