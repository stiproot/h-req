#!/bin/sh
set -eu

claude plugin validate .
claude plugin validate plugins/h-req

if git grep -n -a -E -i 'babes|B\.A\.B\.E\.S' -- . ':(exclude)scripts/check.sh'; then
  echo "Forbidden project name found; public files must use fictional examples." >&2
  exit 1
fi
