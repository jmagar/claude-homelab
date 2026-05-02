Save workflows as skills | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Save workflows as skills
Create a skill Codex can keep on hand for work you repeat.
Difficulty **Easy**
Time horizon **5m**
Turn a working Codex thread, review rules, test commands, release checklists, design conventions, writing examples, or repo-specific scripts into a skill Codex can use in future threads.
## Best for
* Codified workflows you want Codex to use again.
* Teams that want a reusable skill instead of a long prompt pasted into every thread.
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/reusable-codex-skills/?export=pdf)
Turn a working Codex thread, review rules, test commands, release checklists, design conventions, writing examples, or repo-specific scripts into a skill Codex can use in future threads.
Easy
5m
Related links
[ Agent skills ](/codex/skills)
##
Best for
* Codified workflows you want Codex to use again.
* Teams that want a reusable skill instead of a long prompt pasted into every thread.
##
Skills & Plugins
*
[ Skill Creator ](https://github.com/openai/skills/tree/main/skills/.system/skill-creator)
Gather information about the workflow, scaffold a skill, keep the main instructions short, and validate the result.
|
Skill
|
Why use it
|
|[ Skill Creator ](https://github.com/openai/skills/tree/main/skills/.system/skill-creator)| Gather information about the workflow, scaffold a skill, keep the main instructions short, and validate the result. |
##
Starter prompt
Use $skill-creator to create a Codex skill that [fixes failing Buildkite checks on a GitHub PR / turns PR notes into inline review comments / writes our release notes from merged PRs]
Use these sources when creating the skill:
- Working example: [say "use this thread," link a merged PR, or paste a good Codex answer]
- Source: [paste a Slack thread, PR review link, runbook URL, docs URL, or ticket]
- Repo: [repo path, if this skill depends on one repo]
- Scripts or commands to reuse: [test command], [preview command], [log-fetch script], [release command]
- Good output: [paste the Slack update, changelog entry, review comment, ticket, or final answer you want future threads to match]
[Open in the Codex app](<codex://new?prompt=Use+$skill-creator+to+create+a+Codex+skill+that+[fixes+failing+Buildkite+checks+on+a+GitHub+PR+/+turns+PR+notes+into+inline+review+comments+/+writes+our+release+notes+from+merged+PRs]
Use+these+sources+when+creating+the+skill:
-+Working+example:+[say+"use+this+thread,"+link+a+merged+PR,+or+paste+a+good+Codex+answer]
-+Source:+[paste+a+Slack+thread,+PR+review+link,+runbook+URL,+docs+URL,+or+ticket]
-+Repo:+[repo+path,+if+this+skill+depends+on+one+repo]
-+Scripts+or+commands+to+reuse:+[test+command],+[preview+command],+[log-fetch+script],+[release+command]
-+Good+output:+[paste+the+Slack+update,+changelog+entry,+review+comment,+ticket,+or+final+answer+you+want+future+threads+to+match]>)
Use $skill-creator to create a Codex skill that [fixes failing Buildkite checks on a GitHub PR / turns PR notes into inline review comments / writes our release notes from merged PRs]
Use these sources when creating the skill:
- Working example: [say "use this thread," link a merged PR, or paste a good Codex answer]
- Source: [paste a Slack thread, PR review link, runbook URL, docs URL, or ticket]
- Repo: [repo path, if this skill depends on one repo]
- Scripts or commands to reuse: [test command], [preview command], [log-fetch script], [release command]
- Good output: [paste the Slack update, changelog entry, review comment, ticket, or final answer you want future threads to match]
## Create a skill Codex can keep on hand
Use skills to give Codex reusable instructions, resources, and scripts for work you repeat. A [skill](/codex/skills) can preserve the thread, doc, command, or example that made Codex useful the first time.
Start with one working example: a Codex thread that cherry-picked a PR, a release checklist from Notion, a set of useful PR comments, or a Slack thread explaining a launch process.
## How to use
1. Add the context you want Codex to use.
Stay in the Codex thread you want to preserve, paste the Slack thread or docs link, and add the rule, command, or example Codex should remember.
2. Run the starter prompt.
The prompt names the skill you want, then gives `$skill-creator` the thread, doc, PR, command, or output to preserve.
3. Let Codex create and validate the skill.
The result should define the `$skill-name`, describe when it should trigger, and keep reusable instructions in the right place.
Skills in `\~/.codex/skills` are available from any repo. Skills in the current repo can be committed so teammates can use them too.
4. Use the skill, then update it from the thread.
Invoke the new `$skill-name` on the next PR, alert, review, release note, or design task. If it uses the wrong test command, misses a review rule, skips a runbook step, or writes a draft you would not send, ask Codex to add that correction to the skill.
## Provide source material
Give `$skill-creator` the material that explains how the skill should work.
|What you have|What to add|
|**A workflow from a Codex thread that you want to preserve**|Stay in that thread and say `use this thread`. Codex can use the conversation, commands, edits, and feedback from that thread as the starting point.|
|**Docs or a runbook**|Paste the release checklist, link the incident-response runbook, attach the API PDF, or point Codex at the markdown guide in your repo.|
|**Team conversation**|Paste the Slack thread where someone explained an alert, link the PR review with frontend rules, or attach the support conversation that explains the customer problem.|
|**Scripts or commands the skill should reuse**|Add the test command, preview command, release script, log-fetch script, or local helper command you want future Codex threads to run.|
|**A good result**|Add the merged PR, final changelog entry, accepted launch note, resolved ticket, before/after screenshot, or final Codex answer you want future threads to match.|
If the source is in Slack, Linear, GitHub, Notion, or Sentry, connect that tool in Codex with a [plugin](/codex/plugins), mention it in the starter prompt, or paste the relevant part into the thread.
## What Codex creates
Most skills start as a `SKILL.md` file. `$skill-creator` can add longer references, scripts, or assets when the workflow needs them.
* my-skill/
*
SKILL.md Required: instructions and metadata
*
references/ Optional: longer docs
*
scripts/ Optional: repeatable commands
*
assets/ Optional: templates and starter files
## Skills you could create
Use the same pattern when future threads should read the same runbook, run the same CLI, follow the same review rubric, write the same team update, or QA the same browser flow. For example:
* **`$buildkite-fix-ci`** downloads failed job logs, diagnoses the error, and proposes the smallest code fix.
* **`$fix-merge-conflicts`** checks out a GitHub PR, updates it against the base branch, resolves conflicts, and returns the exact push command.
* **`$frontend-skill`** keeps Codex close to your UI taste, existing components, screenshot QA loop, asset choices, and browser polish pass.
* **`$pr-review-comments`** turns review notes into concise inline comments with the right tone and GitHub links.
* **`$web-game-prototyper`** scopes the first playable loop, chooses assets, tunes game feel, captures screenshots, and polishes in the browser.
##
Related use cases
[
### Create a CLI Codex can use
Ask Codex to create a composable CLI it can run from any folder, combine with repo scripts...
Engineering Code
](/codex/use-cases/agent-friendly-clis)[
### Create browser-based games
Use Codex to turn a game brief into first a well-defined plan, and then a real browser-based...
Engineering Code
](/codex/use-cases/browser-games)[
### Deploy an app or website
Use Codex with Build Web Apps and Vercel to turn a repo, screenshot, design, or rough app...
Front-end Integrations
](/codex/use-cases/deploy-app-or-website)