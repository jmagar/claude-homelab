Kick off coding tasks from Slack | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Kick off coding tasks from Slack
Turn Slack threads into scoped cloud tasks.
Difficulty **Easy**
Time horizon **5m**
Mention `@Codex` in Slack to start a task tied to the right repo and environment, then review the result back in the thread or in Codex cloud.
## Best for
* Async handoffs that start in a Slack thread and already have enough context to act on
* Teams that want quick issue triage, bug fixes, or scoped implementation work without context switching
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/slack-coding-tasks/?export=pdf)
Mention `@Codex` in Slack to start a task tied to the right repo and environment, then review the result back in the thread or in Codex cloud.
Easy
5m
Related links
[ Use Codex in Slack ](/codex/integrations/slack)[ Codex cloud environments ](/codex/cloud/environments)
##
Best for
* Async handoffs that start in a Slack thread and already have enough context to act on
* Teams that want quick issue triage, bug fixes, or scoped implementation work without context switching
##
Starter prompt
@Codex analyze the issue mentioned in this thread and implement a fix in \<name of your environment\>.
@Codex analyze the issue mentioned in this thread and implement a fix in \<name of your environment\>.
## How to use
1. Install the Slack app, connect the right repositories and environments, and add `@Codex` to the channel.
2. Mention `@Codex` in a thread with a clear request, constraints, and the outcome you want.
3. Open the task link, review the result, and continue the follow-up in Slack if the task needs another pass.
You can learn more about how to use Codex in Slack in the [dedicated guide](/codex/integrations/slack).
## Tips
* If the thread does not already include enough context or suggested fix, include in your prompt some guidance
* Make sure the repo and environment mapping are correct by mentioning the name of the project or environment in your prompt
* Scope the request so Codex can finish it without a second planning loop
* If your project is a large codebase, guide Codex by mentioning which files or folders are relevant to the task
##
Related use cases
[
### Complete tasks from messages
Use Computer Use to read one Messages thread, complete the task, and draft a reply.
Knowledge Work Integrations
](/codex/use-cases/complete-tasks-from-messages)[
### Coordinate new-hire onboarding
Use Codex to gather approved new-hire context, stage tracker updates, draft team-by-team...
Integrations Data
](/codex/use-cases/new-hire-onboarding)[
### Generate slide decks
Use Codex to update existing presentations or build new decks by editing slides directly...
Data Integrations
](/codex/use-cases/generate-slide-decks)