GitHub Action – Codex | OpenAI Developers
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
Use the Codex GitHub Action (`openai/codex-action@v1`) to run Codex in CI/CD jobs, apply patches, or post reviews from a GitHub Actions workflow.
The action installs the Codex CLI, starts the Responses API proxy when you provide an API key, and runs `codex exec` under the permissions you specify.
Reach for the action when you want to:
* Automate Codex feedback on pull requests or releases without managing the CLI yourself.
* Gate changes on Codex-driven quality checks as part of your CI pipeline.
* Run repeatable Codex tasks (code review, release prep, migrations) from a workflow file.
For a CI example, see [Non-interactive mode](/codex/noninteractive) and explore the source in the [openai/codex-action repository](https://github.com/openai/codex-action).
## Prerequisites
* Store your OpenAI key as a GitHub secret (for example `OPENAI\_API\_KEY`) and reference it in the workflow.
* Run the job on a Linux or macOS runner. For Windows, set `safety-strategy: unsafe`.
* Check out your code before invoking the action so Codex can read the repository contents.
* Decide which prompts you want to run. You can provide inline text via `prompt` or point to a file committed in the repo with `prompt-file`.
## Example workflow
The sample workflow below reviews new pull requests, captures Codex’s response, and posts it back on the PR.
```
`name: Codex pull request review
on:
pull\_request:
types: [opened, synchronize, reopened]
jobs:
codex:
runs-on: ubuntu-latest
permissions:
contents: read
pull-requests: write
outputs:
final\_message: ${{ steps.run\_codex.outputs.final-message }}
steps:
- uses: actions/checkout@v5
with:
ref: refs/pull/${{ github.event.pull\_request.number }}/merge
- name: Pre-fetch base and head refs
run: |
git fetch --no-tags origin \\
${{ github.event.pull\_request.base.ref }} \\
+refs/pull/${{ github.event.pull\_request.number }}/head
- name: Run Codex
id: run\_codex
uses: openai/codex-action@v1
with:
openai-api-key: ${{ secrets.OPENAI\_API\_KEY }}
prompt-file: .github/codex/prompts/review.md
output-file: codex-output.md
safety-strategy: drop-sudo
sandbox: workspace-write
post\_feedback:
runs-on: ubuntu-latest
needs: codex
if: needs.codex.outputs.final\_message != ''
steps:
- name: Post Codex feedback
uses: actions/github-script@v7
with:
github-token: ${{ github.token }}
script: |
await github.rest.issues.createComment({
owner: context.repo.owner,
repo: context.repo.repo,
issue\_number: context.payload.pull\_request.number,
body: process.env.CODEX\_FINAL\_MESSAGE,
});
env:
CODEX\_FINAL\_MESSAGE: ${{ needs.codex.outputs.final\_message }}`
```
Replace `.github/codex/prompts/review.md` with your own prompt file or use the `prompt` input for inline text. The example also writes the final Codex message to `codex-output.md` for later inspection or artifact upload.
## Configure `codex exec`
Fine-tune how Codex runs by setting the action inputs that map to `codex exec` options:
* `prompt` or `prompt-file` (choose one): Inline instructions or a repository path to Markdown or text with your task. Consider storing prompts in `.github/codex/prompts/`.
* `codex-args`: Extra CLI flags. Provide a JSON array (for example `["--json"]`) or a shell string (`--sandbox workspace-write --json`) to allow edits, streaming, or MCP configuration.
* `model` and `effort`: Pick the Codex agent configuration you want; leave empty for defaults.
* `sandbox`: Match the sandbox mode (`workspace-write`, `read-only`, `danger-full-access`) to the permissions Codex needs during the run.
* `output-file`: Save the final Codex message to disk so later steps can upload or diff it.
* `codex-version`: Pin a specific CLI release. Leave blank to use the latest published version.
* `codex-home`: Point to a shared Codex home directory if you want to reuse configuration files or MCP setups across steps.
## Manage privileges
Codex has broad access on GitHub-hosted runners unless you restrict it. Use these inputs to control exposure:
* `safety-strategy` (default `drop-sudo`) removes `sudo` before running Codex. This is irreversible for the job and protects secrets in memory. On Windows you must set `safety-strategy: unsafe`.
* `unprivileged-user` pairs `safety-strategy: unprivileged-user` with `codex-user` to run Codex as a specific account. Ensure the user can read and write the repository checkout (see `.cache/codex-action/examples/unprivileged-user.yml` for an ownership fix).
* `read-only` keeps Codex from changing files or using the network, but it still runs with elevated privileges. Don’t rely on `read-only` alone to protect secrets.
* `sandbox` limits filesystem and network access within Codex itself. Choose the narrowest option that still lets the task complete.
* `allow-users` and `allow-bots` restrict who can trigger the workflow. By default only users with write access can run the action; list extra trusted accounts explicitly or leave the field empty for the default behavior.
## Capture outputs
The action emits the last Codex message through the `final-message` output. Map it to a job output (as shown above) or handle it directly in later steps. Combine `output-file` with the uploaded artifacts feature if you prefer to collect the full transcript from the runner. When you need structured data, pass `--output-schema` through `codex-args` to enforce a JSON shape.
## Security checklist
* Limit who can start the workflow. Prefer trusted events or explicit approvals instead of allowing everyone to run Codex against your repository.
* Sanitize prompt inputs from pull requests, commit messages, or issue bodies to avoid prompt injection. Review HTML comments or hidden text before feeding it to Codex.
* Protect your `OPENAI\_API\_KEY` by keeping `safety-strategy` on `drop-sudo` or moving Codex to an unprivileged user. Never leave the action in `unsafe` mode on multi-tenant runners.
* Run Codex as the last step in a job so later steps don’t inherit any unexpected state changes.
* Rotate keys immediately if you suspect the proxy logs or action output exposed secret material.
## Troubleshooting
* **You set both prompt and prompt-file**: Remove the duplicate input so you provide exactly one source.
* **responses-api-proxy didn’t write server info**: Confirm the API key is present and valid; the proxy starts only when you provide `openai-api-key`.
* **Expected `sudo` removal, but `sudo` succeeded**: Ensure no earlier step restored `sudo` and that the runner OS is Linux or macOS. Re-run with a fresh job.
* **Permission errors after `drop-sudo`**: Grant write access before the action runs (for example with `chmod -R g+rwX "$GITHUB\_WORKSPACE"` or by using the unprivileged-user pattern).
* **Unauthorized trigger blocked**: Adjust `allow-users` or `allow-bots` inputs if you need to permit service accounts beyond the default write collaborators.