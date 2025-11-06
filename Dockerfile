FROM debian:bullseye-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    vim \
    sudo \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 20.x using ADD for reliability
ADD https://nodejs.org/dist/v20.19.5/node-v20.19.5-linux-x64.tar.xz /tmp/node.tar.xz
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
