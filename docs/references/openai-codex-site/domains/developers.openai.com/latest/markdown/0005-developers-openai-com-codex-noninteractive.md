Non-interactive mode – Codex | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
### Getting Started
* [ Overview ](/codex)
* [ Quickstart ](/codex/quickstart)
* [ Explore use cases ](/codex/use-cases)
* [ Pricing ](/codex/pricing)
* Concepts
* [ Prompting ](/codex/prompting)
* [ Customization ](/codex/concepts/customization)
* [ Memories ](/codex/memories)
* [ Chronicle ](/codex/memories/chronicle)
* [ Sandboxing ](/codex/concepts/sandboxing)
* [ Subagents ](/codex/concepts/subagents)
* [ Workflows ](/codex/workflows)
* [ Models ](/codex/models)
* [ Cyber Safety ](/codex/concepts/cyber-safety)
### Using Codex
* App
* [ Overview ](/codex/app)
* [ Features ](/codex/app/features)
* [ Settings ](/codex/app/settings)
* [ Review ](/codex/app/review)
* [ Automations ](/codex/app/automations)
* [ Worktrees ](/codex/app/worktrees)
* [ Local Environments ](/codex/app/local-environments)
* [ In-app browser ](/codex/app/browser)
* [ Computer Use ](/codex/app/computer-use)
* [ Commands ](/codex/app/commands)
* [ Windows ](/codex/app/windows)
* [ Troubleshooting ](/codex/app/troubleshooting)
* IDE Extension
* [ Overview ](/codex/ide)
* [ Features ](/codex/ide/features)
* [ Settings ](/codex/ide/settings)
* [ IDE Commands ](/codex/ide/commands)
* [ Slash commands ](/codex/ide/slash-commands)
* CLI
* [ Overview ](/codex/cli)
* [ Features ](/codex/cli/features)
* [ Command Line Options ](/codex/cli/reference)
* [ Slash commands ](/codex/cli/slash-commands)
* Web
* [ Overview ](/codex/cloud)
* [ Environments ](/codex/cloud/environments)
* [ Internet Access ](/codex/cloud/internet-access)
* Integrations
* [ GitHub ](/codex/integrations/github)
* [ Slack ](/codex/integrations/slack)
* [ Linear ](/codex/integrations/linear)
* Codex Security
* [ Overview ](/codex/security)
* [ Setup ](/codex/security/setup)
* [ Improving the threat model ](/codex/security/threat-model)
* [ FAQ ](/codex/security/faq)
### Configuration
* Config File
* [ Config Basics ](/codex/config-basic)
* [ Advanced Config ](/codex/config-advanced)
* [ Config Reference ](/codex/config-reference)
* [ Sample Config ](/codex/config-sample)
* [ Speed ](/codex/speed)
* [ Rules ](/codex/rules)
* [ Hooks ](/codex/hooks)
* [ AGENTS.md ](/codex/guides/agents-md)
* [ MCP ](/codex/mcp)
* Plugins
* [ Overview ](/codex/plugins)
* [ Build plugins ](/codex/plugins/build)
* [ Skills ](/codex/skills)
* [ Subagents ](/codex/subagents)
### Administration
* [ Authentication ](/codex/auth)
* [ Agent approvals & security ](/codex/agent-approvals-security)
* [ Remote connections ](/codex/remote-connections)
* Enterprise
* [ Admin Setup ](/codex/enterprise/admin-setup)
* [ Governance ](/codex/enterprise/governance)
* [ Managed configuration ](/codex/enterprise/managed-configuration)
* [ Windows ](/codex/windows)
### Automation
* [ Non-interactive Mode ](/codex/noninteractive)
* [ Codex SDK ](/codex/sdk)
* [ App Server ](/codex/app-server)
* [ MCP Server ](/codex/guides/agents-sdk)
* [ GitHub Action ](/codex/github-action)
### Learn
* [ Best practices ](/codex/learn/best-practices)
* [ Videos ](/codex/videos)
* [ Community ](/community)
* Blog
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
* [ View all ](/blog/topic/codex)
* Cookbooks
* [ Codex Prompting Guide ](/cookbook/examples/gpt-5/codex_prompting_guide)
* [ Modernizing your Codebase with Codex ](/cookbook/examples/codex/code_modernization)
* [ View all ](/cookbook/topic/codex)
* [ Building AI Teams ](/codex/guides/build-ai-native-engineering-team)
### Releases
* [ Changelog ](/codex/changelog)
* [ Feature Maturity ](/codex/feature-maturity)
* [ Open Source ](/codex/open-source)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Non-interactive mode lets you run Codex from scripts (for example, continuous integration (CI) jobs) without opening the interactive TUI.
You invoke it with `codex exec`.
For flag-level details, see [`codex exec`](/codex/cli/reference#codex-exec).
## When to use `codex exec`
Use `codex exec` when you want Codex to:
* Run as part of a pipeline (CI, pre-merge checks, scheduled jobs).
* Produce output you can pipe into other tools (for example, to generate release notes or summaries).
* Fit naturally into CLI workflows that chain command output into Codex and pass Codex output to other tools.
* Run with explicit, pre-set sandbox and approval settings.
## Basic usage
Pass a task prompt as a single argument:
```
`codex exec "summarize the repository structure and list the top 5 risky areas"`
```
While `codex exec` runs, Codex streams progress to `stderr` and prints only the final agent message to `stdout`. This makes it straightforward to redirect or pipe the final result:
```
`codex exec "generate release notes for the last 10 commits" | tee release-notes.md`
```
Use `--ephemeral` when you don’t want to persist session rollout files to disk:
```
`codex exec --ephemeral "triage this repository and suggest next steps"`
```
If stdin is piped and you also provide a prompt argument, Codex treats the prompt as the instruction and the piped content as additional context.
This makes it easy to generate input with one command and hand it directly to Codex:
```
`curl -s https://jsonplaceholder.typicode.com/comments \\
| codex exec "format the top 20 items into a markdown table" \\
\> table.md`
```
For more advanced stdin piping patterns, see [Advanced stdin piping](#advanced-stdin-piping).
## Permissions and safety
By default, `codex exec` runs in a read-only sandbox. In automation, set the least permissions needed for the workflow:
* Allow edits: `codex exec --sandbox workspace-write "\<task\>"`
* Allow broader access: `codex exec --sandbox danger-full-access "\<task\>"`
Use `danger-full-access` only in a controlled environment (for example, an isolated CI runner or container).
Codex keeps `codex exec --full-auto` as a deprecated compatibility flag and prints a warning. Prefer the explicit `--sandbox workspace-write` flag in new scripts.
Use `--ignore-user-config` when you need a run that doesn’t load `$CODEX\_HOME/config.toml`, and `--ignore-rules` when you need to skip user and project execpolicy `.rules` files for a controlled automation environment.
If you configure an enabled MCP server with `required = true` and it fails to initialize, `codex exec` exits with an error instead of continuing without that server.
## Make output machine-readable
To consume Codex output in scripts, use JSON Lines output:
```
`codex exec --json "summarize the repo structure" | jq`
```
When you enable `--json`, `stdout` becomes a JSON Lines (JSONL) stream so you can capture every event Codex emits while it’s running. Event types include `thread.started`, `turn.started`, `turn.completed`, `turn.failed`, `item.\*`, and `error`.
Item types include agent messages, reasoning, command executions, file changes, MCP tool calls, web searches, and plan updates.
Sample JSON stream (each line is a JSON object):
```
`{"type":"thread.started","thread\_id":"0199a213-81c0-7800-8aa1-bbab2a035a53"}
{"type":"turn.started"}
{"type":"item.started","item":{"id":"item\_1","type":"command\_execution","command":"bash -lc ls","status":"in\_progress"}}
{"type":"item.completed","item":{"id":"item\_3","type":"agent\_message","text":"Repo contains docs, sdk, and examples directories."}}
{"type":"turn.completed","usage":{"input\_tokens":24763,"cached\_input\_tokens":24448,"output\_tokens":122,"reasoning\_output\_tokens":0}}`
```
If you only need the final message, write it to a file with `-o \<path\>`/`--output-last-message \<path\>`. This writes the final message to the file and still prints it to `stdout` (see [`codex exec`](/codex/cli/reference#codex-exec) for details).
## Create structured outputs with a schema
If you need structured data for downstream steps, use `--output-schema` to request a final response that conforms to a JSON Schema.
This is useful for automated workflows that need stable fields (for example, job summaries, risk reports, or release metadata).
`schema.json`
```
`{
"type": "object",
"properties": {
"project\_name": { "type": "string" },
"programming\_languages": {
"type": "array",
"items": { "type": "string" }
}
},
"required": ["project\_name", "programming\_languages"],
"additionalProperties": false
}`
```
Run Codex with the schema and write the final JSON response to disk:
```
`codex exec "Extract project metadata" \\
--output-schema ./schema.json \\
-o ./project-metadata.json`
```
Example final output (stdout):
```
`{
"project\_name": "Codex CLI",
"programming\_languages": ["Rust", "TypeScript", "Shell"]
}`
```
## Authenticate in CI
`codex exec` reuses saved CLI authentication by default. In CI, it’s common to provide credentials explicitly:
### Use API key auth (recommended)
* Set `CODEX\_API\_KEY` as a secret environment variable for the job.
* Keep prompts and tool output in mind: they can include sensitive code or data.
To use a different API key for a single run, set `CODEX\_API\_KEY` inline:
```
`CODEX\_API\_KEY=\<api-key\> codex exec --json "triage open bug reports"`
```
`CODEX\_API\_KEY` is only supported in `codex exec`.
Use ChatGPT-managed auth in CI/CD (advanced)
Read this if you need to run CI/CD jobs with a Codex user account instead of an
API key, such as enterprise teams using ChatGPT-managed Codex access on trusted
runners or users who need ChatGPT/Codex rate limits instead of API key usage.
API keys are the right default for automation because they are simpler to
provision and rotate. Use this path only if you specifically need to run as
your Codex account.
Treat `\~/.codex/auth.json` like a password: it contains access tokens. Don’t
commit it, paste it into tickets, or share it in chat.
Do not use this workflow for public or open-source repositories. If `codex login`
is not an option on the runner, seed `auth.json` through secure storage, run
Codex on the runner so Codex refreshes it in place, and persist the updated file
between runs.
See [Maintain Codex account auth in CI/CD (advanced)](/codex/auth/ci-cd-auth).
## Resume a non-interactive session
If you need to continue a previous run (for example, a two-stage pipeline), use the `resume` subcommand:
```
`codex exec "review the change for race conditions"
codex exec resume --last "fix the race conditions you found"`
```
You can also target a specific session ID with `codex exec resume \<SESSION\_ID\>`.
## Git repository required
Codex requires commands to run inside a Git repository to prevent destructive changes. Override this check with `codex exec --skip-git-repo-check` if you’re sure the environment is safe.
## Common automation patterns
### Example: Autofix CI failures in GitHub Actions
You can use `codex exec` to automatically propose fixes when a CI workflow fails. The typical pattern is:
1. Trigger a follow-up workflow when your main CI workflow completes with an error.
2. Check out the failing commit SHA.
3. Install dependencies and run Codex with a narrow prompt and minimal permissions.
4. Re-run the test command.
5. Open a pull request with the resulting patch.
#### Minimal workflow using the Codex CLI
The example below shows the core steps. Adjust the install and test commands to match your stack.
```
`name: Codex auto-fix on CI failure
on:
workflow\_run:
workflows: ["CI"]
types: [completed]
permissions:
contents: write
pull-requests: write
jobs:
auto-fix:
if: ${{ github.event.workflow\_run.conclusion == 'failure' }}
runs-on: ubuntu-latest
env:
OPENAI\_API\_KEY: ${{ secrets.OPENAI\_API\_KEY }}
FAILED\_HEAD\_SHA: ${{ github.event.workflow\_run.head\_sha }}
FAILED\_HEAD\_BRANCH: ${{ github.event.workflow\_run.head\_branch }}
steps:
- uses: actions/checkout@v4
with:
ref: ${{ env.FAILED\_HEAD\_SHA }}
fetch-depth: 0
- uses: actions/setup-node@v4
with:
node-version: "20"
- name: Install dependencies
run: |
if [ -f package-lock.json ]; then npm ci; else npm i; fi
- name: Install Codex
run: npm i -g @openai/codex
- name: Authenticate Codex
run: codex login --api-key "$OPENAI\_API\_KEY"
- name: Run Codex
run: |
codex exec --sandbox workspace-write \\
"Read the repository, run the test suite, identify the minimal change needed to make all tests pass, implement only that change, and stop. Do not refactor unrelated files."
- name: Verify tests
run: npm test --silent
- name: Create pull request
if: success()
uses: peter-evans/create-pull-request@v6
with:
branch: codex/auto-fix-${{ github.event.workflow\_run.run\_id }}
base: ${{ env.FAILED\_HEAD\_BRANCH }}
title: "Auto-fix failing CI via Codex"`
```
#### Alternative: Use the Codex GitHub Action
If you want to avoid installing the CLI yourself, you can run `codex exec` through the [Codex GitHub Action](/codex/github-action) and pass the prompt as an input.
## Advanced stdin piping
When another command produces input for Codex, choose the stdin pattern based on where the instruction should come from. Use prompt-plus-stdin when you already know the instruction and want to pass piped output as context. Use `codex exec -` when stdin should become the full prompt.
### Use prompt-plus-stdin
Prompt-plus-stdin is useful when another command already produces the data you want Codex to inspect. In this mode, you write the instruction yourself and pipe in the output as context, which makes it a natural fit for CLI workflows built around command output, logs, and generated data.
```
`npm test 2\>&1 \\
| codex exec "summarize the failing tests and propose the smallest likely fix" \\
| tee test-summary.md`
```
More prompt-plus-stdin examples
### Summarize logs
```
`tail -n 200 app.log \\
| codex exec "identify the likely root cause, cite the most important errors, and suggest the next three debugging steps" \\
\> log-triage.md`
```
### Inspect TLS or HTTP issues
```
`curl -vv https://api.example.com/health 2\>&1 \\
| codex exec "explain the TLS or HTTP failure and suggest the most likely fix" \\
\> tls-debug.md`
```
### Prepare a Slack-ready update
```
`gh run view 123456 --log \\
| codex exec "write a concise Slack-ready update on the CI failure, including the likely cause and next step" \\
| pbcopy`
```
### Draft a pull request comment from CI logs
```
`gh run view 123456 --log \\
| codex exec "summarize the failure in 5 bullets for the pull request thread" \\
| gh pr comment 789 --body-file -`
```
### Use `codex exec -` when stdin is the prompt
If you omit the prompt argument, Codex reads the prompt from stdin. Use `codex exec -` when you want to force that behavior explicitly.
The `-` sentinel is useful when another command or script is generating the entire prompt dynamically. This is a good fit when you store prompts in files, assemble prompts with shell scripts, or combine live command output with instructions before handing the whole prompt to Codex.
```
`cat prompt.txt | codex exec -`
```
```
`printf "Summarize this error log in 3 bullets:\\n\\n%s\\n" "$(tail -n 200 app.log)" \\
| codex exec -`
```
```
`generate\_prompt.sh | codex exec - --json \> result.jsonl`
```