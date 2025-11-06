FROM debian:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y nodejs npm git vim

# Install the Gemini CLI
RUN npm install -g @google/gemini-cli
