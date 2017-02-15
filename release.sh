#!/bin/bash
set -e
set -u
set -o pipefail

pushd apps/web_ui
./node_modules/brunch/bin/brunch b -p
mix phoenix.digest
popd
MIX_ENV=prod mix release --env=prod
