Maintain Codex account auth in CI/CD (advanced) | OpenAI Developers
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
This guide shows how to keep ChatGPT-managed Codex auth working on a trusted
CI/CD runner without calling the OAuth token endpoint yourself.
The right way to authenticate automation is with an API key. Use this guide
only if you specifically need to run the workflow as your Codex account.
The pattern is:
1. Create `auth.json` once on a trusted machine with `codex login`.
2. Put that file on the runner.
3. Run Codex normally.
4. Let Codex refresh the session when it becomes stale.
5. Keep the refreshed `auth.json` for the next run.
This is an advanced workflow for enterprise and other trusted private
automation. API keys are still the recommended option for most CI/CD jobs.
Treat `\~/.codex/auth.json` like a password: it contains access tokens. Don’t
commit it, paste it into tickets, or share it in chat. Do not use this
workflow for public or open-source repositories.
## Why this works
Codex already knows how to refresh a ChatGPT-managed session.
As of the current open-source client:
* Codex loads the local auth cache from `auth.json`
* if `last\_refresh` is older than about 8 days, Codex refreshes the token
bundle before the run continues
* after a successful refresh, Codex writes the new tokens and a new
`last\_refresh` back to `auth.json`
* if a request gets a `401`, Codex also has a built-in refresh-and-retry path
That means the supported CI/CD strategy is not “call the refresh API yourself.”
It is “run Codex and persist the updated `auth.json`.”
## When to use this
Use this guide only when all of the following are true:
* you need ChatGPT-managed Codex auth rather than an API key
* `codex login` cannot run on the remote runner
* the runner is trusted private infrastructure
* you can preserve the refreshed `auth.json` between runs
* only one machine or serialized job stream will use a given `auth.json` copy
This guide applies to Codex-managed ChatGPT auth (`auth\_mode: "chatgpt"`).
It does not apply to:
* API key auth
* external-token host integrations (`auth\_mode: "chatgptAuthTokens"`)
* generic OAuth clients outside Codex
If your credentials are stored in the OS keyring, switch to file-backed storage
first. See [Credential storage](/codex/auth#credential-storage).
## Seed `auth.json` once
On a trusted machine where browser login is possible:
1. Configure Codex to store credentials in a file:
```
`cli\_auth\_credentials\_store = "file"`
```
1. Run:
```
`codex login`
```
1. Verify the file looks like managed ChatGPT auth:
```
`AUTH\_FILE="${CODEX\_HOME:-$HOME/.codex}/auth.json"
jq '{
auth\_mode,
has\_tokens: (.tokens != null),
has\_refresh\_token: ((.tokens.refresh\_token // "") != ""),
last\_refresh
}' "$AUTH\_FILE"`
```
Continue only if:
* `auth\_mode` is `"chatgpt"`
* `has\_refresh\_token` is `true`
Then place the contents of `auth.json` into your CI/CD secret manager or copy
it to a trusted persistent runner.
## Recommended pattern: GitHub Actions on a self-hosted runner
The simplest fully automated setup is a self-hosted GitHub Actions runner with a
persistent `CODEX\_HOME`.
Why this pattern works well:
* the runner can keep `auth.json` on disk between jobs
* Codex can refresh the file in place
* later jobs automatically pick up the refreshed tokens
* you only need the original secret for bootstrap or reseeding
The critical detail is to seed `auth.json` only if it is missing. If you
rewrite the file from the original secret on every run, you throw away the
refreshed tokens that Codex just wrote.
Example scheduled workflow:
```
`name: Keep Codex auth fresh
on:
schedule:
- cron: "0 9 \* \* 1"
workflow\_dispatch:
jobs:
keep-codex-auth-fresh:
runs-on: self-hosted
steps:
- name: Bootstrap auth.json if needed
shell: bash
env:
CODEX\_AUTH\_JSON: ${{ secrets.CODEX\_AUTH\_JSON }}
run: |
export CODEX\_HOME="${CODEX\_HOME:-$HOME/.codex}"
mkdir -p "$CODEX\_HOME"
chmod 700 "$CODEX\_HOME"
if [ ! -f "$CODEX\_HOME/auth.json" ]; then
printf '%s' "$CODEX\_AUTH\_JSON" \> "$CODEX\_HOME/auth.json"
chmod 600 "$CODEX\_HOME/auth.json"
fi
- name: Run Codex
shell: bash
run: |
codex exec --json "Reply with the single word OK." \>/dev/null`
```
What this does:
* the first run seeds `auth.json`
* later runs reuse the same file
* once the cached session is old enough, Codex refreshes it during the normal
`codex exec` step
* the refreshed file remains on disk for the next workflow run
A weekly schedule is usually enough because Codex treats the session as stale
after roughly 8 days in the current open-source client.
## Ephemeral runners: restore, run Codex, persist the updated file
If you use GitHub-hosted runners, GitLab shared runners, or any other ephemeral
environment, the runner filesystem disappears after each job. In that setup,
you need a round-trip:
1. restore the current `auth.json` from secure storage
2. run Codex
3. write the updated `auth.json` back to secure storage
Generic GitHub Actions shape:
```
`name: Run Codex with managed auth
on:
workflow\_dispatch:
jobs:
codex-job:
runs-on: ubuntu-latest
steps:
- name: Restore auth.json
shell: bash
run: |
export CODEX\_HOME="${CODEX\_HOME:-$HOME/.codex}"
mkdir -p "$CODEX\_HOME"
chmod 700 "$CODEX\_HOME"
# Replace this with your secret manager or secure storage command.
my-secret-cli read codex-auth-json \> "$CODEX\_HOME/auth.json"
chmod 600 "$CODEX\_HOME/auth.json"
- name: Run Codex
shell: bash
run: |
codex exec --json "summarize the failing tests"
- name: Persist refreshed auth.json
if: always()
shell: bash
run: |
# Replace this with your secret manager or secure storage command.
my-secret-cli write codex-auth-json \< "$CODEX\_HOME/auth.json"`
```
The key requirement is that the write-back step stores the refreshed file that
Codex produced during the run, not the original seed.
## You do not need a separate refresh command
Any normal Codex run can refresh the session.
That means you have two good options:
* let your existing CI/CD Codex job refresh the file naturally
* add a lightweight scheduled maintenance job, like the GitHub Actions example
above, if your real jobs do not run often enough
The first Codex run after the session becomes stale is the one that refreshes
`auth.json`.
## Operational rules that matter
* Use one `auth.json` per runner or per serialized workflow stream.
* Do not share the same file across concurrent jobs or multiple machines.
* Do not overwrite a persistent runner’s refreshed file from the original seed
on every run.
* Do not store `auth.json` in the repository, logs, or public artifact storage.
* Reseed from a trusted machine if built-in refresh stops working.
## What to do when refresh stops working
This flow reduces manual work, but it does not guarantee the same session lasts
forever.
Reseed the runner with a fresh `auth.json` if:
* Codex starts returning `401` and the runner can no longer refresh
* the refresh token was revoked or expired
* another machine or concurrent job rotated the token first
* your secure-storage round trip failed and an old file was restored
To reseed:
1. Run `codex login` on a trusted machine.
2. Replace the stored CI/CD copy of `auth.json`.
3. Let the next runner job continue using Codex’s built-in refresh flow.
## Verify that the runner is maintaining the session
Check that the runner still has managed auth tokens and that `last\_refresh`
exists:
```
`AUTH\_FILE="${CODEX\_HOME:-$HOME/.codex}/auth.json"
jq '{
auth\_mode,
last\_refresh,
has\_access\_token: ((.tokens.access\_token // "") != ""),
has\_id\_token: ((.tokens.id\_token // "") != ""),
has\_refresh\_token: ((.tokens.refresh\_token // "") != "")
}' "$AUTH\_FILE"`
```
If your runner is persistent, you should see the same file continue to exist
between runs. If your runner is ephemeral, confirm that your write-back step is
storing the updated file from the last job.
## Source references
If you want to verify this behavior in the open-source client:
* [`codex-rs/core/src/auth.rs`](https://github.com/openai/codex/blob/main/codex-rs/core/src/auth.rs)
covers stale-token detection, automatic refresh, refresh-on-401 recovery, and
persistence of refreshed tokens
* [`codex-rs/core/src/auth/storage.rs`](https://github.com/openai/codex/blob/main/codex-rs/core/src/auth/storage.rs)
covers file-backed `auth.json` storage