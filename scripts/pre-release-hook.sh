#!/usr/bin/env bash
set -euxo pipefail

if [[ "${NO_UPDATE:-}" == "1" ]]; then
  echo "NO_UPDATE is set, skipping update"
else
  cargo update && git add Cargo.lock
fi

mise run render-mangen render-help

./scripts/update-shorthand-repo.sh
mise run lint-fix

git add man src/default_shorthands.rs
