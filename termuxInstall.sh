#!/bin/bash

# Configuration
NODE_LTS_VERSION="20" # Node.js LTS major version (e.g., 20)
GEMINI_CLI_PACKAGE="@google/gemini-cli"

# --- Helper Function ---
log () {
  echo -e "\n\e[1m>>> $1\e[0m"
}

log "Starting quick installation of Node.js and Gemini CLI on Termux..."

## 1. Install System Dependencies (Termux uses pkg and no sudo)
log "1. Updating package lists and installing required system dependencies..."
pkg update -y
pkg install -y \
    curl \
    git \
    nodejs \
    # We install nodejs here directly, as the Nodesource PPA method is not needed 
    # and doesn't work the same way in Termux.

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install core system dependencies. Exiting."
    exit 1
fi

---

## 2. Install Node.js and npm Verification
log "2. Node.js and npm installed successfully via pkg."

if command -v node >/dev/null 2>&1; then
    log "Node.js version: $(node -v)"
else
    echo "ERROR: Node.js installation failed. Exiting."
    exit 1
fi

---

## 3. Update npm and Install Gemini CLI
# Note: Global npm installs work without sudo in Termux's environment.
log "3. Updating npm to the latest version globally..."
npm install -g npm@latest

log "4. Installing the Gemini CLI ($GEMINI_CLI_PACKAGE) globally..."
npm install -g "$GEMINI_CLI_PACKAGE"

# Verification
if command -v gemini >/dev/null 2>&1; then
    log "Gemini CLI installed successfully. Version: $(gemini --version)"
    log "Installation complete! Run 'gemini --help' to get started."
else
    echo "ERROR: Gemini CLI installation failed. Please check the logs."
    exit 1
fi
