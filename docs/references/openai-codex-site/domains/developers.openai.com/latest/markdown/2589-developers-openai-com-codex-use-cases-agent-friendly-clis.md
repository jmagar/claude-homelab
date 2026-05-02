Create a CLI Codex can use | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Create a CLI Codex can use
Give Codex a composable command for an API, log source, export, or team script.
Difficulty **Intermediate**
Time horizon **1h**
Ask Codex to create a composable CLI it can run from any folder, combine with repo scripts, use to download files, and remember through a companion skill.
## Best for
* Repeated work where Codex needs to search, read, download from, or safely write to the same service, export, local archive, or repo script.
* Agent tools that need paged search, exact reads by ID, predictable JSON, downloaded files, local indexes, or draft-before-write commands.
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/agent-friendly-clis/?export=pdf)
Ask Codex to create a composable CLI it can run from any folder, combine with repo scripts, use to download files, and remember through a companion skill.
Intermediate
1h
Related links
[ Codex skills ](/codex/skills)[ Create custom skills ](/codex/skills/create-skill)
##
Best for
* Repeated work where Codex needs to search, read, download from, or safely write to the same service, export, local archive, or repo script.
* Agent tools that need paged search, exact reads by ID, predictable JSON, downloaded files, local indexes, or draft-before-write commands.
##
Skills & Plugins
*
[ Cli Creator ](https://github.com/openai/skills/tree/main/skills/.curated/cli-creator)
Design the command surface, build the CLI, add setup and auth checks, install the command on PATH, and verify it from another folder.
*
[ Skill Creator ](https://github.com/openai/skills/tree/main/skills/.system/skill-creator)
Create the companion skill that teaches later Codex tasks which CLI commands to run first and which write actions require approval.
|
Skill
|
Why use it
|
|[ Cli Creator ](https://github.com/openai/skills/tree/main/skills/.curated/cli-creator)| Design the command surface, build the CLI, add setup and auth checks, install the command on PATH, and verify it from another folder. |
|[ Skill Creator ](https://github.com/openai/skills/tree/main/skills/.system/skill-creator)| Create the companion skill that teaches later Codex tasks which CLI commands to run first and which write actions require approval. |
##
Starter prompt
Use $cli-creator to create a CLI you can use, and use $skill-creator to create the companion skill in this same thread.
Source to learn from: [docs URL, OpenAPI spec, redacted curl command, existing script path, log folder, CSV or JSON export, SQLite database path, or pasted --help output].
First job the CLI should support: [download failed CI logs from a build URL, search support tickets and read one by ID, query an admin API, read a local database, or run one step from an existing script].
Optional write job: [create a draft comment, upload media, retry a failed job, or read-only for now].
Command name: [cli-name, or recommend one].
Before coding, show me the proposed command surface and ask only for missing details that would block the build.
[Open in the Codex app](<codex://new?prompt=Use+$cli-creator+to+create+a+CLI+you+can+use,+and+use+$skill-creator+to+create+the+companion+skill+in+this+same+thread.
Source+to+learn+from:+[docs+URL,+OpenAPI+spec,+redacted+curl+command,+existing+script+path,+log+folder,+CSV+or+JSON+export,+SQLite+database+path,+or+pasted+--help+output].
First+job+the+CLI+should+support:+[download+failed+CI+logs+from+a+build+URL,+search+support+tickets+and+read+one+by+ID,+query+an+admin+API,+read+a+local+database,+or+run+one+step+from+an+existing+script].
Optional+write+job:+[create+a+draft+comment,+upload+media,+retry+a+failed+job,+or+read-only+for+now].
Command+name:+[cli-name,+or+recommend+one].
Before+coding,+show+me+the+proposed+command+surface+and+ask+only+for+missing+details+that+would+block+the+build.>)
Use $cli-creator to create a CLI you can use, and use $skill-creator to create the companion skill in this same thread.
Source to learn from: [docs URL, OpenAPI spec, redacted curl command, existing script path, log folder, CSV or JSON export, SQLite database path, or pasted --help output].
First job the CLI should support: [download failed CI logs from a build URL, search support tickets and read one by ID, query an admin API, read a local database, or run one step from an existing script].
Optional write job: [create a draft comment, upload media, retry a failed job, or read-only for now].
Command name: [cli-name, or recommend one].
Before coding, show me the proposed command surface and ask only for missing details that would block the build.
## Introduction
When Codex keeps using the same API, log source, exported inbox, local database, or team script, give that work a composable interface: a command it can run from any folder, inspect, narrow, and combine with `git`, `gh`, `rg`, tests, and repo scripts.
Add a companion skill that records when Codex should use the CLI, what to run first, how to keep output small, where downloaded files land, and which write commands need approval.
In this workflow, `$cli-creator` helps Codex build the command. `$skill-creator` helps Codex save a reusable skill such as `$ci-logs`, which future tasks can invoke by name.
## How to use
1. [Decide whether the job needs a CLI](#choose-what-the-cli-should-do)
2. [Share the source Codex should learn from](#share-the-docs-files-or-commands)
3. [Run `$cli-creator`](#ask-codex-to-build-the-cli-and-skill)
4. [Test the installed command](#verify-the-command-works-from-any-folder)
5. [Invoke the saved skill later](#use-the-skill-later)
## Choose what the CLI should do
Start with the thing you want Codex to do, not the technology you want it to write. A good CLI turns a repeated read, search, download, export, draft, upload, poll, or safe write into a command Codex can run from any repo.
|Situation|What Codex can do with the CLI|
|**CI logs live behind a build page.**|Take a build URL, download failed job logs to `./logs`, and return file paths plus short snippets.|
|**Support tickets arrive as a weekly export.**|Index the newest CSV or JSON export, search by customer or phrase, and read one ticket by stable ID.|
|**An API response is too large for context.**|List only the fields it needs, read the full object by ID, and export the complete response to a file.|
|**A Slack export has long threads.**|Search with `--limit`, read one thread, and return nearby context instead of the whole archive.|
|**A team script runs four different steps.**|Split setup, discovery, download, draft, upload, poll, and live write into separate commands.|
|**A plugin finds the record, but Codex needs a file.**|Keep the plugin in the thread; use a CLI to download the attachment, trace, report, video, or log bundle and return the path.|
## Share the docs, files, or commands
Codex needs something concrete to learn from: docs or OpenAPI, a redacted curl command, an export or database path, a log folder, or an existing script. If you want the CLI to follow a familiar style, paste a short `--help` output from `gh`, `kubectl`, or your team’s own tool.
If the command needs auth, tell Codex the environment variable name, config file path, or login flow it should support. Set the secret yourself in your shell or config file. Do not paste secrets into the thread. Ask Codex to make the CLI’s setup check fail clearly when auth is missing.
## Ask Codex to build the CLI and skill
Use the starter prompt on this page. Fill in the source Codex should learn from and the first job the CLI should support.
Before Codex writes code, it should show the proposed command surface and ask only for missing details that would block the build.
## Verify the command works from any folder
Codex should not stop after `cargo run`, `python path/to/script.py`, or an uninstalled package command. Ask it to test the installed command from another repo or a temporary folder, the way a later task will use it.
**Test the CLI like a future agent**
Test [cli-name] the way you would use it in a future task.
Please show proof that:
- command -v [cli-name] succeeds from outside the CLI source folder
- [cli-name] --help explains the main commands
- the setup/auth check runs
- one safe discovery, list, or search command works
- one exact read command works with an ID from the discovery result
- any large log, export, trace, or payload writes to a file and returns the path
- live write commands are not run unless I explicitly approved them
Then read the companion skill and tell me the shortest prompt I should use when I need this CLI again.
If Codex returns a giant JSON blob, ask it to narrow the default response and add a file export for full payloads. If it forgets the approval boundary, ask it to update the companion skill before you use it in another thread.
## Use the skill later
When you need the CLI again, invoke the skill instead of pasting the docs again:
Use $ci-logs to download the failed logs for this build URL and tell me the first failing step.
Use $support-export to search this week's refund complaints and read the three highest-value tickets.
Use $admin-api to find this user's workspace, read the billing record, and draft a safe account note.
For recurring work, test the skill once in a normal thread, then ask Codex to turn that same invocation into an automation.
##
Related use cases
[
### Create browser-based games
Use Codex to turn a game brief into first a well-defined plan, and then a real browser-based...
Engineering Code
](/codex/use-cases/browser-games)[
### Deploy an app or website
Use Codex with Build Web Apps and Vercel to turn a repo, screenshot, design, or rough app...
Front-end Integrations
](/codex/use-cases/deploy-app-or-website)[
### Refactor your codebase
Use Codex to remove dead code, untangle large files, collapse duplicated logic, and...
Engineering Code
](/codex/use-cases/refactor-your-codebase)