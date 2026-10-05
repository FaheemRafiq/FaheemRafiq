#!/usr/bin/env bash
# Switch the profile README to one of the side themes.
#   ./switch.sh              list the themes
#   ./switch.sh one-piece    make README.one-piece.md the live README.md
set -euo pipefail
cd "$(dirname "$0")"

if [ $# -eq 0 ]; then
  echo "Themes:"
  for f in README.*.md; do t="${f#README.}"; echo "  ${t%.md}"; done
  exit 0
fi

src="README.$1.md"
[ -f "$src" ] || { echo "No such theme: $1 (run ./switch.sh to list them)" >&2; exit 1; }
cp "$src" README.md
echo "README.md is now the '$1' theme. Commit and push to publish it:"
echo "  git commit -am 'Switch profile to $1' && git push"
