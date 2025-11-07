ARG NODE_VERSION=20.19.5

# Stage 1: Build for AMD64
FROM debian:bullseye-slim AS node-builder-amd64
ARG NODE_VERSION
ADD https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz /tmp/node.tar.xz

# Stage 2: Build for ARM64
FROM debian:bullseye-slim AS node-builder-arm64
ARG NODE_VERSION
ADD https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-arm64.tar.xz /tmp/node.tar.xz

# Intermediate stage to select the correct builder
FROM node-builder-${TARGETARCH} AS node-builder

# Final stage
FROM debian:bullseye-slim

# Install necessary dependencies (xz-utils is still needed for tar)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    vim \
    sudo \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Copy Node.js from the appropriate builder stage
COPY --from=node-builder /tmp/node.tar.xz /tmp/node.tar.xz
RUN tar -xJf /tmp/node.tar.xz -C /usr/local --strip-components=1 && \
    rm /tmp/node.tar.xz

# Update npm to the latest version
RUN npm install -g npm@latest

# Create a non-root user with a home directory and bash shell
RUN useradd -ms /bin/bash gemini

# Add the new user to the sudo group
RUN usermod -aG sudo gemini

# Configure passwordless sudo for the sudo group
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/sudo-nopasswd

# Set the working directory to the user's home
WORKDIR /home/gemini

# Install the Gemini CLI globally
RUN npm install -g @google/gemini-cli

# Switch to the non-root user
USER gemini

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]