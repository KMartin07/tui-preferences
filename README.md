# Gemini CLI Development Environment

This repository provides a standardized development environment for interacting with the Gemini CLI. It simplifies the setup process by providing a Dockerized environment with the Gemini CLI pre-installed, allowing you to quickly get started with your projects.

## Overview

To effectively utilize this repository and the Gemini CLI for your projects, follow these general steps:

1.  **Clone this repository:** Obtain a local copy of this development environment.
2.  **Start the containerized environment:** Launch the Docker container to access the pre-configured Gemini CLI.
3.  **Access the container and clone your project:** Enter the running container and clone your specific project repository into it. The Gemini CLI is already installed within this environment.
4.  **Initialize your project with `workflow.md`:** Copy the provided `workflow.md` into your project's root directory within the container, then start the Gemini CLI and run the `/init` command to set up your project's context.

## Getting Started

To use this repository, follow these detailed steps:

### 1. Run the Docker Container

To run the container, pull the image from the GitHub Container Registry:

```bash
docker run -it --name gemini-dev-container ghcr.io/kmartin07/gemini-dev:latest
```

### 2. Get API key 

If you aren't able to auth via google link you can get an API key from https://aistudio.google.com/api-keys

```bash
export GEMINI_API_KEY=
```

### 3. Initialize a Session with `workflow.md`

To initialize a session, copy the `workflow.md` file to your project repository. This file is a template that can be customized to fit your needs. Then, open the Gemini CLI tool `gemini` within that repository and run the `/init` command. The CLI will use `workflow.md` to create a `GEMINI.md` file, which is where the CLI will store its state and configuration, tailored with the context of your project and the preferences defined in the workflow.
