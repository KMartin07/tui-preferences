FROM debian:bullseye-slim

# Install necessary dependencies, including sudo and curl for NodeSource
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    vim \
    sudo \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Setup and install Node.js 20.x, explicitly setting the distro
RUN export NODESOURCE_DEB_REPO=node_20.x && \
    export NODESOURCE_DEB_DISTRO=bullseye && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

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
