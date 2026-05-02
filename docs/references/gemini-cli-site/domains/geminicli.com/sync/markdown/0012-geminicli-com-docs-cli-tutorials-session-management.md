Manage sessions and history | Gemini CLI
[Skip to content](#_top)
# Manage sessions and history
Copy as Markdown Copied!
Resume, browse, and rewind your conversations with Gemini CLI. In this guide,
you’ll learn how to switch between tasks, manage your session history, and undo
mistakes using the rewind feature.
## Prerequisites
[Section titled “Prerequisites”](#prerequisites)
* Gemini CLI installed and authenticated.
* At least one active or past session.
## How to resume where you left off
[Section titled “How to resume where you left off”](#how-to-resume-where-you-left-off)
It’s common to switch context—maybe you’re waiting for a build and want to work
on a different feature. Gemini makes it easy to jump back in.
### Scenario: Resume the last session
[Section titled “Scenario: Resume the last session”](#scenario-resume-the-last-session)
The fastest way to pick up your most recent work is with the `--resume` flag (or
`-r`).
Terminal window
```
`
gemini -r
`
```
This restores your chat history and memory, so you can say “Continue with the
next step” immediately.
### Scenario: Browse past sessions
[Section titled “Scenario: Browse past sessions”](#scenario-browse-past-sessions)
If you want to find a specific conversation from yesterday, use the interactive
browser.
**Command:** `/resume`
This opens a searchable list of all your past sessions. You’ll see:
* A timestamp (for example, “2 hours ago”).
* The first user message (helping you identify the topic).
* The number of turns in the conversation.
Select a session and press **Enter** to load it.
## How to manage your workspace
[Section titled “How to manage your workspace”](#how-to-manage-your-workspace)
Over time, you’ll accumulate a lot of history. Keeping your session list clean
helps you find what you need.
### Scenario: Deleting sessions
[Section titled “Scenario: Deleting sessions”](#scenario-deleting-sessions)
In the `/resume` browser, navigate to a session you no longer need and press
**x**. This permanently deletes the history for that specific conversation.
You can also manage sessions from the command line:
Terminal window
```
`
# List all sessions with their IDs
gemini --list-sessions
# Delete a specific session by ID or index
gemini --delete-session 1
`
```
### Scenario: Delete session on exit
[Section titled “Scenario: Delete session on exit”](#scenario-delete-session-on-exit)
If you’re doing a one-off task and don’t want to leave any session history
behind, use the `--delete` flag when exiting:
```
`
/exit --delete
`
```
This removes the current session’s conversation history and tool output files
before exiting. It’s useful for privacy-sensitive tasks or quick one-off
interactions.
## How to rewind time (Undo mistakes)
[Section titled “How to rewind time (Undo mistakes)”](#how-to-rewind-time-undo-mistakes)
Gemini CLI’s **Rewind** feature is like `Ctrl+Z` for your workflow.
### Scenario: Triggering rewind
[Section titled “Scenario: Triggering rewind”](#scenario-triggering-rewind)
At any point in a chat, type `/rewind` or press **Esc** twice.
### Scenario: Choosing a restore point
[Section titled “Scenario: Choosing a restore point”](#scenario-choosing-a-restore-point)
You’ll see a list of your recent interactions. Select the point *before* the
undesired changes occurred.
### Scenario: Choosing what to revert
[Section titled “Scenario: Choosing what to revert”](#scenario-choosing-what-to-revert)
Gemini gives you granular control over the undo process. You can choose to:
1. **Rewind conversation:** Only remove the chat history. The files stay
changed. (Useful if the code is good but the chat got off track).
2. **Revert code changes:** Keep the chat history but undo the file edits.
(Useful if you want to keep the context but retry the implementation).
3. **Rewind both:** Restore everything to exactly how it was.
## How to fork conversations
[Section titled “How to fork conversations”](#how-to-fork-conversations)
Sometimes you want to try two different approaches to the same problem.
1. Start a session and get to a decision point.
2. Save the current state with `/resume save decision-point`.
3. Try your first approach.
4. Later, use `/resume resume decision-point` to fork the conversation back to
that moment and try a different approach.
This creates a new branch of history without losing your original work.
## Next steps
[Section titled “Next steps”](#next-steps)
* Learn about [Checkpointing](/docs/cli/checkpointing) to understand the
underlying safety mechanism.
* Explore [Task planning](/docs/cli/tutorials/task-planning) to keep complex sessions organized.
* See the [Command reference](/docs/reference/commands) for `/resume`
options, grouped checkpoint menus, and `/chat` compatibility aliases.
Last updated: Apr 29, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.