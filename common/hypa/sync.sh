#!/usr/bin/bash

# Check if upstream remote is set
if ! git remote | grep -q upstream; then
    git remote add upstream https://github.com/void-linux/void-packages.git
    echo "[+] Added upstream remote"
fi

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "[?] Fetching upstream changes"
git fetch --depth=1 upstream
echo ""

echo "[?] Moving original common/ to tmp/common"
mkdir -p tmp
mv common tmp/common
mv xbps-src tmp/
echo ""

echo "[?] Copying common/ & xbps-src from upstream/master to $BRANCH"
git checkout upstream/master -- common
git checkout upstream/master -- xbps-src
echo ""

echo "[?] Copying tmp/common/hypa to common/hypa"
cp -r tmp/common/hypa common/hypa
echo ""

echo "[?] Removing tmp/ directory"
rm -rf tmp
echo ""

echo "[+] Update completed"
