#  Getting Started

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

### 3. Get API key 

If you aren't able to auth via google link you can get an API key from https://aistudio.google.com/api-keys

```bash
export GEMINI_API_KEY=
```

### 4. Initialize a Session with `workflow.md`

To initialize a session, copy the `workflow.md` file to your project repository. This file is a template that can be customized to fit your needs. Then, open the Gemini CLI tool `gemini` within that repository and run the `/init` command. The CLI will use `workflow.md` to create a `GEMINI.md` file, which is where the CLI will store its state and configuration, tailored with the context of your project and the preferences defined in the workflow.
