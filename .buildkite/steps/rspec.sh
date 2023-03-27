#! /bin/bash
set -euox pipefail

# download & install captain
arch=x86_64 # Supported values are x86_64 or aarch64
os=linux    # Supported values are linux or darwin

tmp="$(mktemp -d)/captain" &&
  wget -qO "$tmp" "https://releases.captain.build/v1/$os/$arch/captain" &&
  install "$tmp" /usr/local/bin &&
  rm "$tmp" &&
  captain --version

# run captain
captain run \
  --suite-id rspec \
  --test-results tmp/rspec.json \
  --reporter junit-xml=tmp/junit.xml \
  -- bundle exec rspec --format json --out tmp/rspec.json --format progress
