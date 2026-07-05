#!/usr/bin/env bash

#!/bin/bash

#Purpose:
#
#Create a migration branch.
#
#Add jekyll-remote-theme to Gemfile if missing.
#
#Add jekyll-remote-theme to _config.yml plugins.
#
#Remove old default theme: entry if present.
#
#Insert pinned remote_theme:.
#
#Add theme_settings: defaults.
#
#Commit the changes.


set -euo pipefail

SITE_DIR="$1"
THEME_REF="${2:-itchy.studio/jekyll-tailwind-theme-public@v0.1.0}"
cd "$SITE_DIR"

git checkout -b "feat/remote-theme-setup" || git checkout "feat/remote-theme-setup"

if ! grep -q 'jekyll-remote-theme' Gemfile; then
  cat >> Gemfile <<'GEMEOF'

group :jekyll_plugins do
  gem "jekyll-remote-theme"
end
GEMEOF
fi

if grep -q '^theme:' _config.yml; then
  perl -0pi -e 's/^theme:.*\n//m' _config.yml
fi

if ! grep -q 'jekyll-remote-theme' _config.yml; then
  cat >> _config.yml <<EOF2

plugins:
  - jekyll-remote-theme

remote_theme: ${THEME_REF}

theme_settings:
  style_variant: default
  accent: teal
  dark_mode: true
  ads_enabled: false
EOF2
fi

bundle install
bundle exec jekyll build

git add Gemfile Gemfile.lock _config.yml
git commit -m "Adopt shared remote theme ${THEME_REF}" || true


