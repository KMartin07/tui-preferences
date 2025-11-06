# TUI Preferences Repository

This repository contains configurations and scripts for managing TUI (Terminal User Interface) preferences.

## Getting Started

To use this repository, follow these steps:

### 1. Build the Docker Image

First, build the Docker image using the provided `Dockerfile`:

```bash
docker build -t gemini-dev .
```

### 2. Run the Docker Container

Once the image is built, you can run a container from it:

```bash
docker run -it --name gemini-dev-container gemini-dev
```

### 3. Initialize a Session with `workflow.md`

To initialize a session, copy the `workflow.md` file to your project repository. Then, open the Gemini CLI tool within that repository and run the `/init` command. The CLI will use `workflow.md` to create a `GEMINI.md` file, tailored with the context of your project and the preferences defined in the workflow.
