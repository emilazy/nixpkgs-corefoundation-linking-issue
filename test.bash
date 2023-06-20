#!/usr/bin/env bash
set -eu

printf 'correct (system toolchain):\n'
PATH="$(getconf PATH)" ./build.bash
build/test

printf '\ncorrect (2023-06-18 with system CoreFoundation):\n'
nix run .#correct-apple-sdk

printf '\ncrash (2023-06-18):\n'
nix run .#crash || true

printf '\nincorrect (2023-06-17):\n'
nix run .#incorrect-recent

printf '\nincorrect (21.05):\n'
nix run .#incorrect-old
