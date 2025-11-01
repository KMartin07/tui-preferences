# Session Closer Instructions for Gemini CLI

This document outlines the steps for Gemini CLI to perform when closing a work session.

## 1. Gather and Summarize Session

At the end of a session, I will provide you with the session's conversation. Your task is to create a comprehensive summary of our conversation and the actions taken. The summary should include:

*   A brief overview of the goals of the session.
*   A list of the key decisions made.
*   A summary of the code changes and file modifications.
*   Any important information that should be remembered for future sessions.

## 2. Update Session Summary File

Once you have the summary, you will update (or create) the session summary file (summary.md).. You should append the new summary to this file, including the current date and time.

For example:

```markdown
## 2025-10-31

*   Goal: Create a session closer script.
*   Key Decisions: Decided to create a markdown file with instructions for Gemini CLI instead of a bash script.
*   File Modifications: Created `/root/session-closer-instructions.md`.
*   Future Reference: The user wants to use this instruction file to guide the session closing process in the future.
```

## 3. Check Core Project Files

After updating the summary file, you will check for any necessary updates to core project files. This may include, but is not limited to:

*   `package.json`
*   `requirements.txt`
*   `pom.xml`
*   `build.gradle`
*   `Cargo.toml`

You should check if any dependencies need to be updated or if any other changes are required based on the session's activities.

## 4. Update gemini.md Context File

Finally, you will update the `gemini.md` context file (GEMINI.md). You should add any information to this file that is relevant for you to know in future sessions. This may include:

*   New project conventions.
*   The location of important files.
*   My preferences for how you should operate.
