#!/bin/zsh
set -euo pipefail

cd /Users/mattharg/dev/jekyll-tailwind-platform

REMOTE_NAME="${1:-github}"
BUMP_TYPE="${2:-patch}"

cd "$(dirname "$0")/.."

git fetch --tags "$REMOTE_NAME" >/dev/null 2>&1 || true

latest_tag=$(git tag --list 'v*' --sort=-version:refname | head -n 1)

if [[ -z "$latest_tag" ]]; then
  latest_tag="v0.1.0"
  major=0
  minor=1
  patch=0
else
  version="${latest_tag#v}"
  IFS='.' read -r major minor patch <<< "$version"
fi

case "$BUMP_TYPE" in
  patch)
    patch=$((patch + 1))
    ;;
  minor)
    minor=$((minor + 1))
    patch=0
    ;;
  major)
    major=$((major + 1))
    minor=0
    patch=0
    ;;
  *)
    echo "Usage: $0 [remote] [patch|minor|major]" >&2
    exit 1
    ;;
esac

new_tag="v${major}.${minor}.${patch}"

echo "Latest tag: ${latest_tag:-none}"
echo "New tag:    $new_tag"

git tag -d "$new_tag" >/dev/null 2>&1 || true
git push "$REMOTE_NAME" ":refs/tags/$new_tag" >/dev/null 2>&1 || true
git tag "$new_tag"
git push "$REMOTE_NAME" "$new_tag"

echo "Done: pushed $new_tag to $REMOTE_NAME"


