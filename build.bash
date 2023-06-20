#!/usr/bin/env bash
set -eu
rm -rf build
mkdir -p build
clang -o build/uuid.o -c uuid.c
ar -rs build/uuid.a build/uuid.o 2>/dev/null
clang -o build/main.o -c main.c
clang -o build/test -Wl,-framework -Wl,CoreFoundation build/uuid.a build/main.o
