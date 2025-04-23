#!/bin/bash
set -e

# Build the top-level indexbook
echo "📘 Building indexbook to ../book"
mdbook build -d ../book indexbook

# Build all books under contents/*/*
echo "📚 Searching and building all books in contents/*/*"
find contents -type f -name "book.toml" | while read -r bookfile; do
  bookdir=$(dirname "$bookfile")
  output_dir="../../../book/$bookdir"
  echo "📘 Building $bookdir to $output_dir"
  mdbook build -d "$output_dir" "$bookdir"
done
