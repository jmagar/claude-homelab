Session management | Gemini CLI
[Skip to content](#_top)
# Session management
Copy as Markdown Copied!
Session management saves your conversation history so you can resume your work
where you left off. Use these features to review past interactions, manage
history across different projects, and configure how long data is retained.
## Automatic saving
[Section titled “Automatic saving”](#automatic-saving)
Your session history is recorded automatically as you interact with the model.
This background process ensures your work is preserved even if you interrupt a
session.
* **What is saved:** The complete conversation history, including:
* Your prompts and the model’s responses.
* All tool executions (inputs and outputs).
* Token usage statistics (input, output, cached, etc.).
* Assistant thoughts and reasoning summaries (when available).
* **Location:** Sessions are stored in `\~/.gemini/tmp/\<project\_hash\>/chats/`,
where `\<project\_hash\>` is a unique identifier based on your project’s root
directory.
* **Scope:** Sessions are project-specific. Switching directories to a different
project switches to that project’s session history.
## Resuming sessions
[Section titled “Resuming sessions”](#resuming-sessions)
You can resume a previous session to continue the conversation with all prior
context restored. Resuming is supported both through command-line flags and an
interactive browser.
### From the command line
[Section titled “From the command line”](#from-the-command-line)
When starting Gemini CLI, use the `--resume` (or `-r`) flag to load existing
sessions.
* **Resume latest:**
Terminal window
```
`
gemini --resume
`
```
This immediately loads the most recent session.
* **Resume by index:** List available sessions first (see
[Listing sessions](#listing-sessions)), then use the index number:
Terminal window
```
`
gemini --resume 1
`
```
* **Resume by ID:** You can also provide the full session UUID:
Terminal window
```
`
gemini --resume a1b2c3d4-e5f6-7890-abcd-ef1234567890
`
```
### From the interactive interface
[Section titled “From the interactive interface”](#from-the-interactive-interface)
While the CLI is running, use the `/resume` slash command to open the **Session
Browser**:
```
`
/resume
`
```
When typing `/resume` (or `/chat`) in slash completion, commands are grouped
under titled separators:
* `-- auto --` (session browser)
* `list` is selectable and opens the session browser
* `-- checkpoints --` (manual tagged checkpoint commands)
Unique prefixes such as `/resum` and `/cha` resolve to the same grouped menu.
The Session Browser provides an interactive interface where you can perform the
following actions:
* **Browse:** Scroll through a list of your past sessions.
* **Preview:** See details like the session date, message count, and the first
user prompt.
* **Search:** Press `/` to enter search mode, then type to filter sessions by ID
or content.
* **Select:** Press **Enter** to resume the selected session.
* **Esc:** Press **Esc** to exit the Session Browser.
### Manual chat checkpoints
[Section titled “Manual chat checkpoints”](#manual-chat-checkpoints)
For named branch points inside a session, use chat checkpoints:
```
`
/resume save decision-point
/resume list
/resume resume decision-point
`
```
Compatibility aliases:
* `/chat ...` works for the same commands.
* `/resume checkpoints ...` also remains supported during migration.
## Parallel sessions with Git worktrees
[Section titled “Parallel sessions with Git worktrees”](#parallel-sessions-with-git-worktrees)
When working on multiple tasks at once, you can use
[Git worktrees](/docs/cli/git-worktrees) to give each Gemini session its own copy of
the codebase. This prevents changes in one session from colliding with another.
## Managing sessions
[Section titled “Managing sessions”](#managing-sessions)
You can list and delete sessions to keep your history organized and manage disk
space.
### Listing sessions
[Section titled “Listing sessions”](#listing-sessions)
To see a list of all available sessions for the current project from the command
line, use the `--list-sessions` flag:
Terminal window
```
`
gemini --list-sessions
`
```
Output example:
```
`
Available sessions for this project (3):
1. Fix bug in auth (2 days ago) [a1b2c3d4]
2. Refactor database schema (5 hours ago) [e5f67890]
3. Update documentation (Just now) [abcd1234]
`
```
### Deleting sessions
[Section titled “Deleting sessions”](#deleting-sessions)
You can remove old or unwanted sessions to free up space or declutter your
history.
**From the command line:** Use the `--delete-session` flag with an index or ID:
Terminal window
```
`
gemini --delete-session 2
`
```
**From the Session Browser:**
1. Open the browser with `/resume`.
2. Navigate to the session you want to remove.
3. Press **x**.
## Configuration
[Section titled “Configuration”](#configuration)
You can configure how Gemini CLI manages your session history in your
`settings.json` file. These settings let you control retention policies and
session lengths.
### Session retention
[Section titled “Session retention”](#session-retention)
By default, Gemini CLI automatically cleans up old session data to prevent your
history from growing indefinitely. When a session is deleted, Gemini CLI also
removes all associated data, including implementation plans, task trackers, tool
outputs, and activity logs.
The default policy is to **retain sessions for 30 days**.
#### Configuration
[Section titled “Configuration”](#configuration-1)
You can customize these policies using the `/settings` command or by manually
editing your `settings.json` file:
```
`
{
"general": {
"sessionRetention": {
"enabled": true,
"maxAge": "30d",
"maxCount": 50
}
}
}
`
```
* **`enabled`**: (boolean) Master switch for session cleanup. Defaults to
`true`.
* **`maxAge`**: (string) Duration to keep sessions (for example, “24h”, “7d”,
“4w”). Sessions older than this are deleted. Defaults to `"30d"`.
* **`maxCount`**: (number) Maximum number of sessions to retain. The oldest
sessions exceeding this count are deleted. Defaults to undefined (unlimited).
* **`minRetention`**: (string) Minimum retention period (safety limit). Defaults
to `"1d"`. Sessions newer than this period are never deleted by automatic
cleanup.
### Session limits
[Section titled “Session limits”](#session-limits)
You can limit the length of individual sessions to prevent context windows from
becoming too large and expensive.
```
`
{
"model": {
"maxSessionTurns": 100
}
}
`
```
* **`maxSessionTurns`**: (number) The maximum number of turns (user and model
exchanges) allowed in a single session. Set to `-1` for unlimited (default).
**Behavior when limit is reached:**
* **Interactive mode:** The CLI shows an informational message and stops
sending requests to the model. You must manually start a new session.
* **Non-interactive mode:** The CLI exits with an error.
## Next steps
[Section titled “Next steps”](#next-steps)
* Explore the [Memory tool](/docs/tools/memory) to save persistent information
across sessions.
* Learn how to [Checkpoint](/docs/cli/checkpointing) your session state.
* Check out the [CLI reference](/docs/cli/cli-reference) for all command-line flags.
Last updated: Mar 20, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.