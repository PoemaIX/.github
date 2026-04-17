#!/usr/bin/env bash
set -euo pipefail

BASEURL="${BASEURL:-https://ix.poema.eu.org/}"

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <input_file> <output_file>" >&2
  exit 1
fi

INPUT="$1"
OUTPUT="$2"

if [[ ! -f "$INPUT" ]]; then
  echo "Error: input file not found: $INPUT" >&2
  exit 1
fi

# Normalize BASEURL to always end with exactly one slash
BASEURL="${BASEURL%/}/"

sed -E \
  "s|\[([^]]+)\]\(([^)#]+)\.md(#[^)]*)?\)|[\1](${BASEURL}\2\3)|g" \
  "$INPUT" > "$OUTPUT"
