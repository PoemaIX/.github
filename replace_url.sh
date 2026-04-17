#!/usr/bin/env bash

BASEURL="https://ix.poema.eu.org"

# process all markdown files recursively
find . -type f -name "*.md" | while read -r file; do
  sed -E -i \
    "s|\[([^\]]+)\]\(([^)]+)\.md\)|[\1](${BASEURL}/\2)|g" \
    "$file"
done
