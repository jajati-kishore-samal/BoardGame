#!/bin/bash
set -e

FILE="kubeaudit_0.22.0_linux_amd64.tar.gz"

echo "Checking archive..."
if [ ! -f "$FILE" ]; then
    echo "ERROR: $FILE not found."
    echo "Download it from:"
    echo "https://github.com/Shopify/kubeaudit/releases/tag/v0.22.0"
    exit 1
fi

echo "Extracting..."
tar -xzf "$FILE"

echo "Installing..."
chmod +x kubeaudit
sudo mv kubeaudit /usr/local/bin/

echo "Verifying installation..."
which kubeaudit
kubeaudit version

echo ""
echo "Installation completed successfully."
echo "Run:"
echo "kubeaudit all"
