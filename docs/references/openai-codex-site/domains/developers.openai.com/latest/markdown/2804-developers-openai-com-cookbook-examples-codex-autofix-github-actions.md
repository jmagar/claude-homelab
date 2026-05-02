Use Codex CLI to automatically fix CI failures
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Sep 30, 2025
# Use Codex CLI to automatically fix CI failures
[ HA ](https://www.linkedin.com/in/himadri-acharya-086ba261/)[ KA ](https://github.com/alwell-kevin)[ CW ](https://wee.ms)
[ Himadri Acharya , ](https://www.linkedin.com/in/himadri-acharya-086ba261/)[ Kevin Alwell
(OpenAI)
, ](https://github.com/alwell-kevin)[ Charlie Weems ](https://wee.ms)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/codex/Autofix-github-actions.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/codex/Autofix-github-actions.ipynb)
## Purpose of this cookbook
This cookbook shows you how to embed the OpenAI Codex CLI into your CI/CD pipeline so that when your builds or tests fail, codex automatically generates & proposes fixes. The following is an example in a node project with CI running in GitHub Actions.
## End to End Flow
Below is the pipeline flow we’ll implement:
## Prerequisites
* A GitHub Repo with Actions workflows
* You’ll need to create `OPENAI\_API\_KEY` as an environment variable in GitHub settings under [https://github.com/{org-name}/{repo-name}/settings/secrets/actions](https://github.com/{org-name}/{repo-name}/settings/secrets/actions). You can also set this at org level(for sharing secrets across multiple repos)
* Codex requires python as a prerequisite to use `codex login`
* You’ll need to check the setting to enable actions to create PRs on your repo, and also in your organization:
## Step 1: Add the Github Action to your CI Pipeline
The following YAML shows a GitHub action that auto triggers when CI fails, installs Codex, uses codex exec and then makes a PR on the failing branch with the fix. Replace “CI” with the name of the workflow you want to monitor.
```
`name: Codex Auto-Fix on Failure
on:
workflow\_run:
# Trigger this job after any run of the primary CI workflow completes
workflows: ["CI"]
types: [completed]
permissions:
contents: write
pull-requests: write
jobs:
auto-fix:
# Only run when the referenced workflow concluded with a failure
if: ${{ github.event.workflow\_run.conclusion == 'failure' }}
runs-on: ubuntu-latest
env:
OPENAI\_API\_KEY: ${{ secrets.OPENAI\_API\_KEY }}
FAILED\_WORKFLOW\_NAME: ${{ github.event.workflow\_run.name }}
FAILED\_RUN\_URL: ${{ github.event.workflow\_run.html\_url }}
FAILED\_HEAD\_BRANCH: ${{ github.event.workflow\_run.head\_branch }}
FAILED\_HEAD\_SHA: ${{ github.event.workflow\_run.head\_sha }}
steps:
- name: Check OpenAI API Key Set
run: |
if [ -z "$OPENAI\_API\_KEY" ]; then
echo "OPENAI\_API\_KEY secret is not set. Skipping auto-fix." \>&2
exit 1
fi
- name: Checkout Failing Ref
uses: actions/checkout@v4
with:
ref: ${{ env.FAILED\_HEAD\_SHA }}
fetch-depth: 0
- name: Setup Node.js
uses: actions/setup-node@v4
with:
node-version: '20'
cache: 'npm'
- name: Install dependencies
run: |
if [ -f package-lock.json ]; then npm ci; else npm i; fi
- name: Run Codex
uses: openai/codex-action@main
id: codex
with:
openai\_api\_key: ${{ secrets.OPENAI\_API\_KEY }}
prompt: "You are working in a Node.js monorepo with Jest tests and GitHub Actions. Read the repository, run the test suite, identify the minimal change needed to make all tests pass, implement only that change, and stop. Do not refactor unrelated code or files. Keep changes small and surgical."
codex\_args: '["--config","sandbox\_mode=\\"workspace-write\\""]'
- name: Verify tests
run: npm test --silent
- name: Create pull request with fixes
if: success()
uses: peter-evans/create-pull-request@v6
with:
commit-message: "fix(ci): auto-fix failing tests via Codex"
branch: codex/auto-fix-${{ github.event.workflow\_run.run\_id }}
base: ${{ env.FAILED\_HEAD\_BRANCH }}
title: "Auto-fix failing CI via Codex"
body: |
Codex automatically generated this PR in response to a CI failure on workflow `${{ env.FAILED\_WORKFLOW\_NAME }}`.
Failed run: ${{ env.FAILED\_RUN\_URL }}
Head branch: `${{ env.FAILED\_HEAD\_BRANCH }}`
This PR contains minimal changes intended solely to make the CI pass.`
```
## Step 2: Actions Workflow kicked off
You can navigate to the Actions tab under Repo to view the failing jobs in your Actions workflow.
The Codex workflow should be triggered upon completion of the failed workflow.
## Step 3: Verify that Codex Created a PR for Review
And after the Codex workflow completes execution, it should open a pull request from the feature branch codex/auto-fix. Check to see if everything looks good and then merge it.
## Conclusion
This automation seamlessly integrates OpenAI Codex CLI with GitHub Actions to automatically propose fixes for failing CI runs.
By leveraging Codex, you can reduce manual intervention, accelerate code reviews, and keep your main branch healthy. The workflow ensures that test failures are addressed quickly and efficiently, letting developers focus on higher-value tasks. Explore more about codex-cli and its capabilities [here](https://github.com/openai/codex/).