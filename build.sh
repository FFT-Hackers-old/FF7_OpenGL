#!/usr/bin/env bash
set -e

mkdir -p .dist/build/x86-Release

cd .dist/build/x86-Release

cmake \
  -G "MinGW Makefiles" \
  -DCMAKE_BUILD_TYPE="Release" \
  -DCMAKE_BINARY_DIR=".dist/build/x86-Release" \
  -DCMAKE_SH="CMAKE_SH-NOTFOUND" \
  ../../..

cmake --build .
