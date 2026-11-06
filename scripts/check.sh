#!/bin/sh
set -eu

claude plugin validate .
claude plugin validate plugins/h-req

set +e
git grep -n -a -E -i 'babes|B\.A\.B\.E\.S' -- . ':(exclude)scripts/check.sh'
grep_status=$?
set -e

case $grep_status in
  0)
    echo "Forbidden project name found; public files must use fictional examples." >&2
    exit 1
    ;;
  1) ;;
  *)
    echo "Project leak scan failed." >&2
    exit "$grep_status"
    ;;
esac
