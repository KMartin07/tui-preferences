#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo ">>> Updating package lists..."
sudo apt update -y

echo ">>> Installing curl..."
sudo apt install -y curl

echo ">>> Setting up Nodesource for the latest Node.js version..."
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -

echo ">>> Installing Node.js (which includes npm)..."
sudo apt install -y nodejs

echo ">>> Updating npm to the latest version..."
sudo npm install -g npm@latest

echo ">>> Installing Gemini CLI..."
sudo npm install -g @google/gemini-cli

echo ">>> Installation complete!"
