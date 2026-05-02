Auto Memory | Gemini CLI
[Skip to content](#_top)
# Auto Memory
Copy as Markdown Copied!
Auto Memory is an experimental feature that mines your past Gemini CLI sessions
in the background and turns recurring workflows into reusable
[Agent Skills](/docs/cli/skills). You review, accept, or discard each extracted skill
before it becomes available to future sessions.
This is an experimental feature currently under active development.
## Overview
[Section titled “Overview”](#overview)
Every session you run with Gemini CLI is recorded locally as a transcript. Auto
Memory scans those transcripts for procedural patterns that recur across
sessions, then drafts each pattern as a `SKILL.md` file in a project-local
inbox. You inspect the draft, decide whether it captures real expertise, and
promote it to your global or workspace skills directory if you want it.
You’ll use Auto Memory when you want to:
* **Capture team workflows** that you find yourself walking the agent through
more than once.
* **Codify hard-won fixes** for project-specific landmines so future sessions
avoid them.
* **Bootstrap a skills library** without writing every `SKILL.md` by hand.
Auto Memory complements—but does not replace—the
[`save\_memory` tool](/docs/tools/memory), which captures single facts into
`GEMINI.md`. Auto Memory captures multi-step procedures into skills.
## Prerequisites
[Section titled “Prerequisites”](#prerequisites)
* Gemini CLI installed and authenticated.
* At least 10 user messages across recent, idle sessions in the project. Auto
Memory ignores active or trivial sessions.
## How to enable Auto Memory
[Section titled “How to enable Auto Memory”](#how-to-enable-auto-memory)
Auto Memory is off by default. Enable it in your settings file:
1. Open your global settings file at `\~/.gemini/settings.json`. If you only
want Auto Memory in one project, edit `.gemini/settings.json` in that
project instead.
2. Add the experimental flag:
```
`
{
"experimental": {
"autoMemory": true
}
}
`
```
3. Restart Gemini CLI. The flag requires a restart because the extraction
service starts during session boot.
## How Auto Memory works
[Section titled “How Auto Memory works”](#how-auto-memory-works)
Auto Memory runs as a background task on session startup. It does not block the
UI, consume your interactive turns, or surface tool prompts.
1. **Eligibility scan.** The service indexes recent sessions from
`\~/.gemini/tmp/\<project\>/chats/`. Sessions are eligible only if they have
been idle for at least three hours and contain at least 10 user messages.
2. **Lock acquisition.** A lock file in the project’s memory directory
coordinates across multiple CLI instances so extraction runs at most once at
a time.
3. **Sub-agent extraction.** A specialized sub-agent (named `confucius`)
reviews the session index, reads any sessions that look like they contain
repeated procedural workflows, and drafts new `SKILL.md` files. Its
instructions tell it to default to creating zero skills unless the evidence
is strong, so most runs produce no inbox items.
4. **Patch validation.** If the sub-agent proposes edits to skills outside the
inbox (for example, an existing global skill), it writes a unified diff
`.patch` file. Auto Memory dry-runs each patch and discards any that do not
apply cleanly.
5. **Notification.** When a run produces new skills or patches, Gemini CLI
surfaces an inline message telling you how many items are waiting.
## How to review extracted skills
[Section titled “How to review extracted skills”](#how-to-review-extracted-skills)
Use the `/memory inbox` slash command to open the inbox dialog at any time:
**Command:** `/memory inbox`
The dialog lists each draft skill with its name, description, and source
sessions. From there you can:
* **Read** the full `SKILL.md` body before deciding.
* **Promote** a skill to your user (`\~/.gemini/skills/`) or workspace
(`.gemini/skills/`) directory.
* **Discard** a skill you do not want.
* **Apply** or reject a `.patch` proposal against an existing skill.
Promoted skills become discoverable in the next session and follow the standard
[skill discovery precedence](/docs/cli/skills#skill-discovery-tiers).
## How to disable Auto Memory
[Section titled “How to disable Auto Memory”](#how-to-disable-auto-memory)
To turn off background extraction, set the flag back to `false` in your settings
file and restart Gemini CLI:
```
`
{
"experimental": {
"autoMemory": false
}
}
`
```
Disabling the flag stops the background service immediately on the next session
start. Existing inbox items remain on disk; you can either drain them with
`/memory inbox` first or remove the project memory directory manually.
## Data and privacy
[Section titled “Data and privacy”](#data-and-privacy)
* Auto Memory only reads session files that already exist locally on your
machine. Nothing is uploaded to Gemini outside the normal API calls the
extraction sub-agent makes during its run.
* The sub-agent is instructed to redact secrets, tokens, and credentials it
encounters and to never copy large tool outputs verbatim.
* Drafted skills live in your project’s memory directory until you promote or
discard them. They are not automatically loaded into any session.
## Limitations
[Section titled “Limitations”](#limitations)
* The sub-agent runs on a preview Gemini Flash model. Extraction quality depends
on the model’s ability to recognize durable patterns versus one-off incidents.
* Auto Memory does not extract skills from the current session. It only
considers sessions that have been idle for three hours or more.
* Inbox items are stored per project. Skills extracted in one workspace are not
visible from another until you promote them to the user-scope skills
directory.
## Next steps
[Section titled “Next steps”](#next-steps)
* Learn how skills are discovered and activated in [Agent Skills](/docs/cli/skills).
* Explore the [memory management tutorial](/docs/cli/tutorials/memory-management) for
the complementary `save\_memory` and `GEMINI.md` workflows.
* Review the experimental settings catalog in
[Settings](/docs/cli/settings#experimental).
Last updated: Apr 18, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.