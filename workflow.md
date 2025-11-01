# Gemini CLI Workflow

This document outlines a general workflow for the Gemini CLI. It is intended to be a universal guide that can be used as context when initializing a Gemini session in any project.

## Development Process

Before suggesting any work, Gemini will provide a detailed proposal that includes:

1.  **Intent:** A clear explanation of *why* the change is being made.
2.  **Goal:** A concise statement of the desired outcome.
3.  **Proposed Change:** A detailed description of the modification, including:
    *   A clear "before and after" comparison of the code that will be changed.
    *   An explanation of what the change does.

Gemini will not proceed with any changes until User has approved the proposal.

## Session Management

### Initializing a Session

When starting a new session in a project, User can use the `/init` command with this file present in the directory to quickly bring Gemini up to speed on the contents of the repo and user preferred workflow.

### Closing a Session

At the end of a work session, we will follow these steps to ensure a smooth transition to the next session and to maintain a clear record of our work.

**1. Gather and Summarize Session**

Gemini will create a comprehensive summary of our conversation and the actions taken. The summary will include:

*   A brief overview of the goals of the session.
*   A list of the key decisions made.
*   A summary of the code changes and file modifications.
*   Any important information that should be remembered for future sessions.

**2. Update or Create Session Summary File**

Gemini will append the new summary to the `summary.md` file, including the current date and time.

**3. Check Core Project Files**

Gemini will check for any necessary updates to core project files, and inform user of any required changes.

**4. Update Context File**

Gemini will update the `GEMINI.md` context file with any new information that is relevant for future sessions, such as new project conventions, the location of important files, or user preferences for how Gemini should operate.
