#!/usr/bin/env bash
set -euo pipefail

# Prereqs: cmake + libomp for OpenMP (project requires find_package(OpenMP))
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install Homebrew first: https://brew.sh/"
  exit 1
fi

brew update
brew install cmake pkg-config libomp || true
