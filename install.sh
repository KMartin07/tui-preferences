#!/bin/bash

# Configuration
NODE_LTS_VERSION="20" # Node.js LTS major version (e.g., 20)
GEMINI_CLI_PACKAGE="@google/gemini-cli"

# --- Helper Function ---
log () {
  echo -e "\n\e[1m>>> $1\e[0m"
}

log "Starting quick installation of Node.js and Gemini CLI..."

## 1. Install System Dependencies
log "1. Updating package lists and installing required system dependencies..."
sudo apt update -y
sudo apt install -y curl ca-certificates git sudo

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install core system dependencies. Exiting."
    exit 1
fi

---

## 2. Install Node.js (LTS) and npm
log "2. Installing Node.js (LTS v$NODE_LTS_VERSION) and npm via Nodesource..."

# Get NodeSource setup script for the specified LTS version
# This ensures you get a recent, maintained version of Node.js
curl -fsSL https://deb.nodesource.com/setup_${NODE_LTS_VERSION}.x | sudo -E bash -

# Install Node.js and npm
sudo apt install -y nodejs

# Verify Node.js
if command -v node >/dev/null 2>&1; then
    log "Node.js installed. Version: $(node -v)"
else
    echo "ERROR: Node.js installation failed. Exiting."
    exit 1
fi

---

## 3. Update npm and Install Gemini CLI
log "3. Updating npm to the latest version globally..."
sudo npm install -g npm@latest

log "4. Installing the Gemini CLI ($GEMINI_CLI_PACKAGE) globally..."
sudo npm install -g "$GEMINI_CLI_PACKAGE"

# Verify Gemini CLI
if command -v gemini >/dev/null 2>&1; then
    log "Gemini CLI installed successfully. Version: $(gemini --version)"
else
    echo "ERROR: Gemini CLI installation failed. Please check the logs."
    exit 1
fi

log "Installation complete! Run 'gemini --help' to get started."
