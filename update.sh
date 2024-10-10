#!/bin/bash

set -e

mkdir .tmp || true

echo "Downloading latest al-folio release..."
curl -s https://api.github.com/repos/alshedivat/al-folio/releases/latest \
| grep -o '"zipball_url": "[^"]*"' \
| cut -d '"' -f 4 \
| wget -qi - -O al-folio.zip
echo "Done."

echo "Extracting files..."
unzip al-folio.zip -d .tmp

echo "Removing downloaded ZIP file..."
rm al-folio.zip

echo "Cleaning up .tmp directory"
rm -rf .tmp
