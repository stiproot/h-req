#!/bin/sh
set -eu

claude plugin validate .
claude plugin validate plugins/h-req

git ls-files -z | while IFS= read -r -d '' file; do
  [ "$file" = "scripts/check.sh" ] && continue
  if grep -nH -m 1 -E -i 'babes|B\.A\.B\.E\.S' "$file"; then
    echo "Forbidden project name found; public files must use fictional examples." >&2
    exit 1
  fi
done
