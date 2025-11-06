FROM debian:bullseye-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    vim \
    sudo \
    curl \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Manually install Node.js 20.x in a robust way
RUN set -eux && \
    NODE_VERSION=20.11.1 && \
    ARCH=x64 && \
    cd /tmp && \
    curl -fsSL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${ARCH}.tar.xz" -o node.tar.xz && \
    tar -xJf node.tar.xz -C /usr/local --strip-components=1 && \
    rm node.tar.xz

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
