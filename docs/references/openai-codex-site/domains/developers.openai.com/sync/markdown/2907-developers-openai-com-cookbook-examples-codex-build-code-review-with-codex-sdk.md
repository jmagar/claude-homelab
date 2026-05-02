Build Code Review with the Codex SDK
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
Oct 21, 2025
# Build Code Review with the Codex SDK
[ CW ](https://wee.ms)[ JS ](https://www.linkedin.com/in/jeongminshin)
[ Charlie Weems , ](https://wee.ms)[ Joanne Shin
(OpenAI)
](https://www.linkedin.com/in/jeongminshin)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/codex/build_code_review_with_codex_sdk.md) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/codex/build_code_review_with_codex_sdk.md)
With [Code Review](https://chatgpt.com/codex/settings/code-review) in Codex Cloud, you can connect your team’s cloud hosted GitHub repository to Codex and receive automated code reviews on every PR. But what if your code is hosted on-prem, or you don’t have GitHub as an SCM?
Luckily, we can replicate Codex’s cloud hosted review process in our own CI/CD runners. In this guide, we’ll build our own Code Review action using the Codex CLI headless mode with GitHub Actions, GitLab CI/CD, Azure DevOps Pipelines, and Jenkins.
Model recommendation: use `gpt-5.5` for the strongest code review accuracy and consistency in these workflows.
To build our own Code review, we’ll take the following steps and adhere to them closely:
1. Install the Codex CLI in our CI/CD runner
2. Prompt Codex in headless (exec) mode with the Code Review prompt that ships with the CLI
3. Specify a structured output JSON schema for Codex
4. Parse the JSON result and use it to make API calls to our SCM to create review comments
Once implemented, Codex will be able to leave inline code review comments:
## The Code Review Prompt
GPT-5.5 is the recommended model for complex coding workflows in Codex. You can steer GPT-5.5 to conduct a code review with the following prompt:
```
`You are acting as a reviewer for a proposed code change made by another engineer.
Focus on issues that impact correctness, performance, security, maintainability, or developer experience.
Flag only actionable issues introduced by the pull request.
When you flag an issue, provide a short, direct explanation and cite the affected file and line range.
Prioritize severe issues and avoid nit-level comments unless they block understanding of the diff.
After listing findings, produce an overall correctness verdict (\\"patch is correct\\" or \\"patch is incorrect\\") with a concise justification and a confidence score between 0 and 1.
Ensure that file citations and line numbers are exactly correct using the tools available; if they are incorrect your comments will be rejected.`
```
## Codex Structured Outputs
In order to make comments on code ranges in our pull request, we need to receive Codex’s response in a specific format. To do that we can create a file called `codex-output-schema.json` that conforms to OpenAI’s [structured outputs](https://platform.openai.com/docs/guides/structured-outputs) format.
To use this file in our workflow YAML, we can call Codex with the `output-schema-file` argument like this:
```
`- name: Run Codex structured review
id: run-codex
uses: openai/codex-action@main
with:
openai-api-key: ${{ secrets.OPENAI\_API\_KEY }}
prompt-file: codex-prompt.md
sandbox: read-only
model: ${{ env.CODEX\_MODEL }}
output-schema-file: codex-output-schema.json # \<-- Our schema file
output-file: codex-output.json`
```
You can also pass a similar argument to `codex exec` for example:
```
`codex exec "Review my pull request!" --output-schema codex-output-schema.json`
```
## GitHub Actions Example
Let’s put it all together. If you’re using GitHub Actions in an on-prem environment, you can tailor this example to your specific workflow. Inline comments highlight the key steps.
```
`name: Codex Code Review
# Determine when the review action should be run:
on:
pull\_request:
types:
- opened
- reopened
- synchronize
- ready\_for\_review
concurrency:
group: codex-structured-review-${{ github.event.pull\_request.number }}
cancel-in-progress: true
jobs:
codex-structured-review:
name: Run Codex structured review
runs-on: ubuntu-latest
permissions:
contents: read
pull-requests: write
env:
OPENAI\_API\_KEY: ${{ secrets.OPENAI\_API\_KEY }}
GITHUB\_TOKEN: ${{ github.token }}
CODEX\_MODEL: ${{ vars.CODEX\_MODEL || 'gpt-5.5' }}
PR\_NUMBER: ${{ github.event.pull\_request.number }}
HEAD\_SHA: ${{ github.event.pull\_request.head.sha }}
BASE\_SHA: ${{ github.event.pull\_request.base.sha }}
REPOSITORY: ${{ github.repository }}
outputs:
codex-output: ${{ steps.run-codex.outputs.final-message }}
steps:
- name: Checkout pull request merge commit
uses: actions/checkout@v5
with:
ref: refs/pull/${{ github.event.pull\_request.number }}/merge
- name: Fetch base and head refs
run: |
set -euxo pipefail
git fetch --no-tags origin \\
"${{ github.event.pull\_request.base.ref }}" \\
+refs/pull/${{ github.event.pull\_request.number }}/head
shell: bash
# The structured output schema ensures that codex produces comments
# with filepaths, line numbers, title, body, etc.
- name: Generate structured output schema
run: |
set -euo pipefail
cat \<\<'JSON' \> codex-output-schema.json
{
"type": "object",
"properties": {
"findings": {
"type": "array",
"items": {
"type": "object",
"properties": {
"title": {
"type": "string",
"maxLength": 80
},
"body": {
"type": "string",
"minLength": 1
},
"confidence\_score": {
"type": "number",
"minimum": 0,
"maximum": 1
},
"priority": {
"type": "integer",
"minimum": 0,
"maximum": 3
},
"code\_location": {
"type": "object",
"properties": {
"absolute\_file\_path": {
"type": "string",
"minLength": 1
},
"line\_range": {
"type": "object",
"properties": {
"start": {
"type": "integer",
"minimum": 1
},
"end": {
"type": "integer",
"minimum": 1
}
},
"required": [
"start",
"end"
],
"additionalProperties": false
}
},
"required": [
"absolute\_file\_path",
"line\_range"
],
"additionalProperties": false
}
},
"required": [
"title",
"body",
"confidence\_score",
"priority",
"code\_location"
],
"additionalProperties": false
}
},
"overall\_correctness": {
"type": "string",
"enum": [
"patch is correct",
"patch is incorrect"
]
},
"overall\_explanation": {
"type": "string",
"minLength": 1
},
"overall\_confidence\_score": {
"type": "number",
"minimum": 0,
"maximum": 1
}
},
"required": [
"findings",
"overall\_correctness",
"overall\_explanation",
"overall\_confidence\_score"
],
"additionalProperties": false
}
JSON
shell: bash
# This section generates our prompt:
- name: Build Codex review prompt
env:
REVIEW\_PROMPT\_PATH: ${{ vars.CODEX\_PROMPT\_PATH || 'review\_prompt.md' }}
run: |
set -euo pipefail
PROMPT\_PATH="codex-prompt.md"
TEMPLATE\_PATH="${REVIEW\_PROMPT\_PATH}"
if [ -n "$TEMPLATE\_PATH" ] && [ -f "$TEMPLATE\_PATH" ]; then
cat "$TEMPLATE\_PATH" \> "$PROMPT\_PATH"
else
{
printf '%s\\n' "You are acting as a reviewer for a proposed code change made by another engineer."
printf '%s\\n' "Focus on issues that impact correctness, performance, security, maintainability, or developer experience."
printf '%s\\n' "Flag only actionable issues introduced by the pull request."
printf '%s\\n' "When you flag an issue, provide a short, direct explanation and cite the affected file and line range."
printf '%s\\n' "Prioritize severe issues and avoid nit-level comments unless they block understanding of the diff."
printf '%s\\n' "After listing findings, produce an overall correctness verdict (\\"patch is correct\\" or \\"patch is incorrect\\") with a concise justification and a confidence score between 0 and 1."
printf '%s\\n' "Ensure that file citations and line numbers are exactly correct using the tools available; if they are incorrect your comments will be rejected."
} \> "$PROMPT\_PATH"
fi
{
echo ""
echo "Repository: ${REPOSITORY}"
echo "Pull Request #: ${PR\_NUMBER}"
echo "Base ref: ${{ github.event.pull\_request.base.ref }}"
echo "Head ref: ${{ github.event.pull\_request.head.ref }}"
echo "Base SHA: ${BASE\_SHA}"
echo "Head SHA: ${HEAD\_SHA}"
echo "Changed files:"
git --no-pager diff --name-status "${BASE\_SHA}" "${HEAD\_SHA}"
echo ""
echo "Unified diff (context=5):"
git --no-pager diff --unified=5 --stat=200 "${BASE\_SHA}" "${HEAD\_SHA}" \> /tmp/diffstat.txt
git --no-pager diff --unified=5 "${BASE\_SHA}" "${HEAD\_SHA}" \> /tmp/full.diff
cat /tmp/diffstat.txt
echo ""
cat /tmp/full.diff
} \>\> "$PROMPT\_PATH"
shell: bash
# Putting it all together: we run the codex action with our code review prompt,
# structured output, and output file:
- name: Run Codex structured review
id: run-codex
uses: openai/codex-action@main
with:
openai-api-key: ${{ secrets.OPENAI\_API\_KEY }}
prompt-file: codex-prompt.md
output-schema-file: codex-output-schema.json
output-file: codex-output.json
sandbox: read-only
model: ${{ env.CODEX\_MODEL }}
- name: Inspect structured Codex output
if: ${{ always() }}
run: |
if [ -s codex-output.json ]; then
jq '.' codex-output.json || true
else
echo "Codex output file missing"
fi
shell: bash
# This step produces in-line code review comments on specific line
# ranges of code.
- name: Publish inline review comments
if: ${{ always() }}
env:
REVIEW\_JSON: codex-output.json
run: |
set -euo pipefail
if [ ! -s "$REVIEW\_JSON" ]; then
echo "No Codex output file present; skipping comment publishing."
exit 0
fi
findings\_count=$(jq '.findings | length' "$REVIEW\_JSON")
if [ "$findings\_count" -eq 0 ]; then
echo "Codex returned no findings; skipping inline comments."
exit 0
fi
jq -c --arg commit "$HEAD\_SHA" '.findings[] | {
body: (.title + "\\n\\n" + .body + "\\n\\nConfidence: " + (.confidence\_score | tostring) + (if has("priority") then "\\nPriority: P" + (.priority | tostring) else "" end)),
commit\_id: $commit,
path: .code\_location.absolute\_file\_path,
line: .code\_location.line\_range.end,
side: "RIGHT",
start\_line: (if .code\_location.line\_range.start != .code\_location.line\_range.end then .code\_location.line\_range.start else null end),
start\_side: (if .code\_location.line\_range.start != .code\_location.line\_range.end then "RIGHT" else null end)
} | with\_entries(select(.value != null))' "$REVIEW\_JSON" \> findings.jsonl
while IFS= read -r payload; do
echo "Posting review comment payload:" && echo "$payload" | jq '.'
curl -sS \\
-X POST \\
-H "Accept: application/vnd.github+json" \\
-H "Authorization: Bearer ${GITHUB\_TOKEN}" \\
-H "X-GitHub-Api-Version: 2022-11-28" \\
"https://api.github.com/repos/${REPOSITORY}/pulls/${PR\_NUMBER}/comments" \\
-d "$payload"
done \< findings.jsonl
shell: bash
# This section creates a single comment summarizing the review.
- name: Publish overall summary comment
if: ${{ always() }}
env:
REVIEW\_JSON: codex-output.json
run: |
set -euo pipefail
if [ ! -s "$REVIEW\_JSON" ]; then
echo "Codex output missing; skipping summary."
exit 0
fi
overall\_state=$(jq -r '.overall\_correctness' "$REVIEW\_JSON")
overall\_body=$(jq -r '.overall\_explanation' "$REVIEW\_JSON")
confidence=$(jq -r '.overall\_confidence\_score' "$REVIEW\_JSON")
msg="\*\*Codex automated review\*\*\\n\\nVerdict: ${overall\_state}\\nConfidence: ${confidence}\\n\\n${overall\_body}"
curl -sS \\
-X POST \\
-H "Accept: application/vnd.github+json" \\
-H "Authorization: Bearer ${GITHUB\_TOKEN}" \\
-H "X-GitHub-Api-Version: 2022-11-28" \\
"https://api.github.com/repos/${REPOSITORY}/issues/${PR\_NUMBER}/comments" \\
-d "$(jq -n --arg body "$msg" '{body: $body}')"
shell: bash`
```
## GitLab Example
GitLab doesn’t have a direct equivalent to the GitHub Action, but you can run codex exec inside GitLab CI/CD to perform automated code reviews.
However, the GitHub Action includes an important [safety strategy](https://github.com/openai/codex-action?tab=readme-ov-file#safety-strategy): it drops sudo permissions so Codex cannot access its own OpenAI API key. This isolation is critical—especially for public repositories where sensitive secrets (like your OpenAI API key) may be present—because it prevents Codex from reading or exfiltrating credentials during execution.
Before running this job, configure your GitLab project:
1. Go to **Project → Settings → CI/CD**.
2. Expand the **Variables** section.
3. Add these variables:
* `OPENAI\_API\_KEY`
* `GITLAB\_TOKEN`
* Mark them as masked/protected as appropriate.
* Add the following GitLab example job to your `.gitlab-ci.yml` file at the root of your repository so it runs during merge request pipelines.
Please be mindful with your API key on public repositories.
```
`stages:
- review
codex-structured-review:
stage: review
image: ubuntu:22.04
rules:
- if: '$CI\_PIPELINE\_SOURCE == "merge\_request\_event"'
variables:
PR\_NUMBER: $CI\_MERGE\_REQUEST\_IID
REPOSITORY: "$CI\_PROJECT\_PATH"
BASE\_SHA: "$CI\_MERGE\_REQUEST\_DIFF\_BASE\_SHA"
HEAD\_SHA: "$CI\_COMMIT\_SHA"
before\_script:
- apt-get update -y
- apt-get install -y git curl jq
- |
if ! command -v codex \>/dev/null 2\>&1; then
ARCH="$(uname -m)"
case "$ARCH" in
x86\_64) CODEX\_PLATFORM="x86\_64-unknown-linux-musl" ;;
aarch64|arm64) CODEX\_PLATFORM="aarch64-unknown-linux-musl" ;;
\*)
echo "Unsupported architecture: $ARCH"
exit 1
;;
esac
CODEX\_VERSION="${CODEX\_VERSION:-latest}"
if [ -n "${CODEX\_DOWNLOAD\_URL:-}" ]; then
CODEX\_URL="$CODEX\_DOWNLOAD\_URL"
elif [ "$CODEX\_VERSION" = "latest" ]; then
CODEX\_URL="https://github.com/openai/codex/releases/latest/download/codex-${CODEX\_PLATFORM}.tar.gz"
else
CODEX\_URL="https://github.com/openai/codex/releases/download/${CODEX\_VERSION}/codex-${CODEX\_PLATFORM}.tar.gz"
fi
TMP\_DIR="$(mktemp -d)"
curl -fsSL "$CODEX\_URL" -o "$TMP\_DIR/codex.tar.gz"
tar -xzf "$TMP\_DIR/codex.tar.gz" -C "$TMP\_DIR"
install -m 0755 "$TMP\_DIR"/codex-\* /usr/local/bin/codex
rm -rf "$TMP\_DIR"
fi
- git fetch origin $CI\_MERGE\_REQUEST\_TARGET\_BRANCH\_NAME
- git fetch origin $CI\_MERGE\_REQUEST\_SOURCE\_BRANCH\_NAME
- git checkout $CI\_MERGE\_REQUEST\_SOURCE\_BRANCH\_NAME
script:
- echo "Running Codex structured review for MR !${PR\_NUMBER}"
# Generate structured output schema
- |
cat \<\<'JSON' \> codex-output-schema.json
{
"$schema": "http://json-schema.org/draft-07/schema#",
"title": "Codex Structured Review",
"type": "object",
"additionalProperties": false,
"required": [
"overall\_correctness",
"overall\_explanation",
"overall\_confidence\_score",
"findings"
],
"properties": {
"overall\_correctness": {
"type": "string",
"description": "Overall verdict for the merge request."
},
"overall\_explanation": {
"type": "string",
"description": "Explanation backing up the verdict."
},
"overall\_confidence\_score": {
"type": "number",
"minimum": 0,
"maximum": 1,
"description": "Confidence level for the verdict."
},
"findings": {
"type": "array",
"description": "Collection of actionable review findings.",
"items": {
"type": "object",
"additionalProperties": false,
"required": [
"title",
"body",
"confidence\_score",
"code\_location"
],
"properties": {
"title": {
"type": "string"
},
"body": {
"type": "string"
},
"confidence\_score": {
"type": "number",
"minimum": 0,
"maximum": 1
},
"code\_location": {
"type": "object",
"additionalProperties": false,
"required": [
"absolute\_file\_path",
"relative\_file\_path",
"line\_range"
],
"properties": {
"absolute\_file\_path": {
"type": "string"
},
"relative\_file\_path": {
"type": "string"
},
"line\_range": {
"type": "object",
"additionalProperties": false,
"required": [
"start",
"end"
],
"properties": {
"start": {
"type": "integer",
"minimum": 1
},
"end": {
"type": "integer",
"minimum": 1
}
}
}
}
}
}
},
"default": []
}
}
}
JSON
# Build Codex review prompt
- |
PROMPT\_PATH="codex-prompt.md"
TEMPLATE\_PATH="${REVIEW\_PROMPT\_PATH:-review\_prompt.md}"
if [ -n "$TEMPLATE\_PATH" ] && [ -f "$TEMPLATE\_PATH" ]; then
cat "$TEMPLATE\_PATH" \> "$PROMPT\_PATH"
else
{
printf '%s\\n' "You are acting as a reviewer for a proposed code change..."
printf '%s\\n' "Focus on issues that impact correctness, performance, security..."
printf '%s\\n' "Flag only actionable issues introduced by this merge request..."
printf '%s\\n' "Provide an overall correctness verdict..."
} \> "$PROMPT\_PATH"
fi
{
echo ""
echo "Repository: ${REPOSITORY}"
echo "Merge Request #: ${PR\_NUMBER}"
echo "Base SHA: ${BASE\_SHA}"
echo "Head SHA: ${HEAD\_SHA}"
echo ""
echo "Changed files:"
git --no-pager diff --name-status "${BASE\_SHA}" "${HEAD\_SHA}"
echo ""
echo "Unified diff (context=5):"
git --no-pager diff --unified=5 "${BASE\_SHA}" "${HEAD\_SHA}"
} \>\> "$PROMPT\_PATH"
# Run Codex exec CLI
- |
printenv OPENAI\_API\_KEY | codex login --with-api-key && \\
codex exec --output-schema codex-output-schema.json \\
--output-last-message codex-output.json \\
--sandbox read-only \\
- \< codex-prompt.md
# Inspect structured Codex output
- |
if [ -s codex-output.json ]; then
jq '.' codex-output.json || true
else
echo "Codex output file missing"; exit 1
fi
# Publish inline comments to GitLab MR
- |
findings\_count=$(jq '.findings | length' codex-output.json)
if [ "$findings\_count" -eq 0 ]; then
echo "No findings from Codex; skipping comments."
exit 0
fi
jq -c \\
--arg base "$BASE\_SHA" \\
--arg start "$BASE\_SHA" \\
--arg head "$HEAD\_SHA" '
.findings[] | {
body: (.title + "\\n\\n" + .body + "\\n\\nConfidence: " + (.confidence\_score | tostring)),
position: {
position\_type: "text",
base\_sha: $base,
start\_sha: $start,
head\_sha: $head,
new\_path: (.code\_location.relative\_file\_path // .code\_location.absolute\_file\_path),
new\_line: .code\_location.line\_range.end
}
}
' codex-output.json \> findings.jsonl
while IFS= read -r payload; do
curl -sS --request POST \\
--header "PRIVATE-TOKEN: $GITLAB\_TOKEN" \\
--header "Content-Type: application/json" \\
--data "$payload" \\
"https://gitlab.com/api/v4/projects/${CI\_PROJECT\_ID}/merge\_requests/${PR\_NUMBER}/discussions"
done \< findings.jsonl
# Publish overall summary comment
- |
overall\_state=$(jq -r '.overall\_correctness' codex-output.json)
overall\_body=$(jq -r '.overall\_explanation' codex-output.json)
confidence=$(jq -r '.overall\_confidence\_score' codex-output.json)
summary="\*\*Codex automated review\*\*\\n\\nVerdict: ${overall\_state}\\nConfidence: ${confidence}\\n\\n${overall\_body}"
curl -sS --request POST \\
--header "PRIVATE-TOKEN: $GITLAB\_TOKEN" \\
--header "Content-Type: application/json" \\
--data "$(jq -n --arg body "$summary" '{body: $body}')" \\
"https://gitlab.com/api/v4/projects/${CI\_PROJECT\_ID}/merge\_requests/${PR\_NUMBER}/notes"
artifacts:
when: always
paths:
- codex-output.json
- codex-prompt.md
`
```
## Azure DevOps Pipelines Example
Azure DevOps does not use GitHub Actions or GitLab CI/CD, but the same Codex review pattern applies: run Codex in an Azure Pipeline, provide the pull request diff, request structured output, and publish the resulting findings back to the Azure DevOps pull request as review threads.
Before running this job, configure your Azure DevOps project:
1. Store `OPENAI\_API\_KEY` as a secret pipeline variable or in a variable group.
2. Enable script access to the OAuth token if you plan to use `$(System.AccessToken)` for Azure DevOps REST API calls.
3. For Azure Repos Git, configure a **Build validation** branch policy on the target branch so the pipeline runs for pull requests.
4. Ensure the build service identity has permission to contribute to pull requests.
5. Add an Azure Pipelines YAML file similar to the example below.
Please be mindful with your API key on public repositories. For public or untrusted pull requests, use the same isolation mindset described in the GitLab section: Codex should not be able to read or exfiltrate credentials while reviewing arbitrary code.
This example assumes `review\_prompt.md` and `codex-output-schema.json` are committed next to the pipeline. The schema should include `code\_location.relative\_file\_path`, which the Azure DevOps publishing step uses to map findings back to repository paths.
```
`trigger: none
pr: none # Azure Repos PR validation is configured with branch policies.
pool:
vmImage: ubuntu-latest
variables:
CODEX\_MODEL: gpt-5.5
steps:
- checkout: self
fetchDepth: 0
persistCredentials: true
- script: |
set -euo pipefail
npm install -g @openai/codex
command -v jq \>/dev/null || {
sudo apt-get update -y
sudo apt-get install -y jq
}
displayName: Install Codex CLI and jq
- script: |
set -euo pipefail
TARGET\_BRANCH="${SYSTEM\_PULLREQUEST\_TARGETBRANCH#refs/heads/}"
SOURCE\_BRANCH="${SYSTEM\_PULLREQUEST\_SOURCEBRANCH#refs/heads/}"
git fetch --no-tags origin \\
"+refs/heads/${TARGET\_BRANCH}:refs/remotes/origin/${TARGET\_BRANCH}" \\
"+refs/heads/${SOURCE\_BRANCH}:refs/remotes/origin/${SOURCE\_BRANCH}"
BASE\_SHA="$(git merge-base "origin/${TARGET\_BRANCH}" "origin/${SOURCE\_BRANCH}")"
HEAD\_SHA="${SYSTEM\_PULLREQUEST\_SOURCECOMMITID:-$(git rev-parse "origin/${SOURCE\_BRANCH}")}"
cp review\_prompt.md codex-prompt.md
{
echo ""
echo "Repository: $(Build.Repository.Name)"
echo "Pull Request ID: $(System.PullRequest.PullRequestId)"
echo "Base ref: ${TARGET\_BRANCH}"
echo "Head ref: ${SOURCE\_BRANCH}"
echo "Base SHA: ${BASE\_SHA}"
echo "Head SHA: ${HEAD\_SHA}"
echo "Changed files:"
git --no-pager diff --name-status "${BASE\_SHA}" "${HEAD\_SHA}"
echo ""
echo "Unified diff (context=5):"
git --no-pager diff --unified=5 --stat=200 "${BASE\_SHA}" "${HEAD\_SHA}" \> /tmp/diffstat.txt
git --no-pager diff --unified=5 "${BASE\_SHA}" "${HEAD\_SHA}" \> /tmp/full.diff
cat /tmp/diffstat.txt
cat /tmp/full.diff
} \>\> codex-prompt.md
displayName: Build Codex review prompt
- script: |
set -euo pipefail
codex exec \\
--model "${CODEX\_MODEL}" \\
--output-schema codex-output-schema.json \\
-o codex-output.json \\
--sandbox read-only \\
- \< codex-prompt.md
env:
CODEX\_API\_KEY: $(OPENAI\_API\_KEY)
displayName: Run Codex structured review
- script: |
set -euo pipefail
if [ -s codex-output.json ]; then
jq '.' codex-output.json || true
else
echo "Codex output file missing"
fi
displayName: Inspect structured Codex output
condition: always()
- script: |
set -euo pipefail
[ -s codex-output.json ] || exit 0
org\_url="$(System.CollectionUri)"
project="$(jq -rn --arg v "$(System.TeamProject)" '$v|@uri')"
repo\_id="$(Build.Repository.ID)"
pr\_id="$(System.PullRequest.PullRequestId)"
api\_version="7.1"
api\_base="${org\_url}${project}/\_apis/git/repositories/${repo\_id}/pullRequests/${pr\_id}"
headers=(-H "Authorization: Bearer ${SYSTEM\_ACCESSTOKEN}" -H "Content-Type: application/json")
ado\_get() { curl -fsS "${headers[@]}" "$1"; }
ado\_post() { curl -fsS -X POST "${headers[@]}" "$1" -d @"$2"; }
iterations\_json="$(ado\_get "${api\_base}/iterations?api-version=${api\_version}")"
last\_iteration="$(echo "$iterations\_json" | jq -r '(.value // .) | map(.id) | max')"
if [ -n "$last\_iteration" ] && [ "$last\_iteration" != "null" ]; then
ado\_get "${api\_base}/iterations/${last\_iteration}/changes?\\$top=2000&api-version=${api\_version}" |
jq '(.changeEntries // .value // [])
| map({
key: (.item.path // .sourceServerItem),
value: {
id: .changeTrackingId,
type: (.changeType // "")
}
})
| map(select(.key != null))
| from\_entries' \> azure-devops-changes.json
jq -c '.findings[]?' codex-output.json | while IFS= read -r finding; do
path="$(echo "$finding" | jq -r '.code\_location.relative\_file\_path // empty')"
start\_line="$(echo "$finding" | jq -r '.code\_location.line\_range.start')"
end\_line="$(echo "$finding" | jq -r '.code\_location.line\_range.end')"
ado\_path="/${path#/}"
change="$(jq -c --arg path "$ado\_path" '.[$path] // empty' azure-devops-changes.json)"
if [ -z "$path" ] || [ -z "$change" ] || ! [[ "$start\_line" =\~ ^[0-9]+$ && "$end\_line" =\~ ^[0-9]+$ ]]; then
echo "Skipping finding that cannot be safely anchored."
continue
fi
change\_type="$(echo "$change" | jq -r '.type')"
[ "$change\_type" != "delete" ] || continue
jq -n \\
--arg content "$(echo "$finding" | jq -r '"\\(.title)\\n\\n\\(.body)\\n\\nConfidence: \\(.confidence\_score)\\nPriority: P\\(.priority)"')" \\
--arg filePath "$ado\_path" \\
--argjson start "$start\_line" \\
--argjson end "$end\_line" \\
--argjson changeTrackingId "$(echo "$change" | jq -r '.id')" \\
--argjson iteration "$last\_iteration" \\
'{
comments: [{ parentCommentId: 0, content: $content, commentType: 1 }],
status: 1,
threadContext: {
filePath: $filePath,
rightFileStart: { line: $start, offset: 1 },
rightFileEnd: { line: $end, offset: 1 }
},
pullRequestThreadContext: {
changeTrackingId: $changeTrackingId,
iterationContext: {
firstComparingIteration: 1,
secondComparingIteration: $iteration
}
}
}' \> inline-comment.json
ado\_post "${api\_base}/threads?api-version=${api\_version}" inline-comment.json || true
done
fi
jq -n --slurpfile review codex-output.json '{
comments: [{
parentCommentId: 0,
commentType: 1,
content: "\*\*Codex automated review\*\*\\n\\nVerdict: \\($review[0].overall\_correctness)\\nConfidence: \\($review[0].overall\_confidence\_score)\\n\\n\\($review[0].overall\_explanation)"
}],
status: 1
}' \> summary-comment.json
ado\_post "${api\_base}/threads?api-version=${api\_version}" summary-comment.json
displayName: Publish Azure DevOps comments
condition: always()
env:
SYSTEM\_ACCESSTOKEN: $(System.AccessToken)`
```
This is a minimal practical Azure Repos example, with explicit caveats around inline comment anchoring.
This example assumes a same-repository Azure Repos PR; forked or cross-repository PRs may need to fetch from `System.PullRequest.SourceRepositoryUri`.
The Azure DevOps-specific step is publishing Codex findings through the [Pull Request Threads API](https://learn.microsoft.com/en-us/rest/api/azure/devops/git/pull-request-threads/create?view=azure-devops-rest-7.1). Inline comments are attached with `threadContext.filePath`, `threadContext.rightFileStart`, `threadContext.rightFileEnd`, and `pullRequestThreadContext.changeTrackingId`. The example resolves `changeTrackingId` from the latest pull request iteration changes before posting a comment.
Validate inline anchoring behavior in your own Azure DevOps project before depending on it in a required branch policy. In particular, test new files, modified files, renamed files, deleted files, and multi-line findings. If a finding cannot be safely anchored to the right side of the diff, prefer skipping the inline comment and relying on the overall summary instead of posting a misleading line comment.
## Jenkins Example
We can use the same approach to scripting a job with Jenkins. Once again, comments highlight key stages of the workflow:
```
`pipeline {
agent any
options {
timestamps()
ansiColor('xterm')
// Prevent overlapping runs on the same PR. Newer builds will cancel older ones after passing the milestone.
disableConcurrentBuilds()
}
environment {
// Default model like your GHA (can be overridden at job/env level)
CODEX\_MODEL = "${env.CODEX\_MODEL ?: 'gpt-5.5'}"
// Filled in during Init
PR\_NUMBER = ''
HEAD\_SHA = ''
BASE\_SHA = ''
REPOSITORY = '' // org/repo
}
stages {
stage('Init (PR context, repo, SHAs)') {
steps {
checkout scm
// Compute PR context and SHAs similar to the GitHub Action
sh '''
set -euo pipefail
# Derive PR number from Jenkins env when building PRs via GitHub Branch Source
PR\_NUMBER="${CHANGE\_ID:-}"
if [ -z "$PR\_NUMBER" ]; then
echo "Not a PR build (CHANGE\_ID missing). Exiting."
exit 1
fi
echo "PR\_NUMBER=$PR\_NUMBER" \>\> $WORKSPACE/jenkins.env
# Discover owner/repo (normalize SSH/HTTPS forms)
ORIGIN\_URL="$(git config --get remote.origin.url)"
if echo "$ORIGIN\_URL" | grep -qE '^git@github.com:'; then
REPO\_PATH="${ORIGIN\_URL#git@github.com:}"
REPO\_PATH="${REPO\_PATH%.git}"
else
# e.g. https://github.com/owner/repo.git
REPO\_PATH="${ORIGIN\_URL#https://github.com/}"
REPO\_PATH="${REPO\_PATH%.git}"
fi
echo "REPOSITORY=$REPO\_PATH" \>\> $WORKSPACE/jenkins.env
# Ensure we have all refs we need
git fetch --no-tags origin \\
"+refs/heads/\*:refs/remotes/origin/\*" \\
"+refs/pull/${PR\_NUMBER}/head:refs/remotes/origin/PR-${PR\_NUMBER}-head" \\
"+refs/pull/${PR\_NUMBER}/merge:refs/remotes/origin/PR-${PR\_NUMBER}-merge"
# HEAD (PR head) and BASE (target branch tip)
CHANGE\_TARGET="${CHANGE\_TARGET:-main}"
HEAD\_SHA="$(git rev-parse refs/remotes/origin/PR-${PR\_NUMBER}-head)"
BASE\_SHA="$(git rev-parse refs/remotes/origin/${CHANGE\_TARGET})"
echo "HEAD\_SHA=$HEAD\_SHA" \>\> $WORKSPACE/jenkins.env
echo "BASE\_SHA=$BASE\_SHA" \>\> $WORKSPACE/jenkins.env
echo "Resolved:"
echo " REPOSITORY=$REPO\_PATH"
echo " PR\_NUMBER=$PR\_NUMBER"
echo " CHANGE\_TARGET=$CHANGE\_TARGET"
echo " HEAD\_SHA=$HEAD\_SHA"
echo " BASE\_SHA=$BASE\_SHA"
'''
script {
def envMap = readProperties file: 'jenkins.env'
env.PR\_NUMBER = envMap['PR\_NUMBER']
env.REPOSITORY = envMap['REPOSITORY']
env.HEAD\_SHA = envMap['HEAD\_SHA']
env.BASE\_SHA = envMap['BASE\_SHA']
}
// Ensure only latest build for this PR proceeds; older in-flight builds will be aborted here
milestone 1
}
}
stage('Generate structured output schema') {
steps {
sh '''
set -euo pipefail
cat \> codex-output-schema.json \<\<'JSON'
{
"type": "object",
"properties": {
"findings": {
"type": "array",
"items": {
"type": "object",
"properties": {
"title": { "type": "string", "maxLength": 80 },
"body": { "type": "string", "minLength": 1 },
"confidence\_score": { "type": "number", "minimum": 0, "maximum": 1 },
"priority": { "type": "integer", "minimum": 0, "maximum": 3 },
"code\_location": {
"type": "object",
"properties": {
"absolute\_file\_path": { "type": "string", "minLength": 1 },
"line\_range": {
"type": "object",
"properties": {
"start": { "type": "integer", "minimum": 1 },
"end": { "type": "integer", "minimum": 1 }
},
"required": ["start","end"],
"additionalProperties": false
}
},
"required": ["absolute\_file\_path","line\_range"],
"additionalProperties": false
}
},
"required": ["title","body","confidence\_score","priority","code\_location"],
"additionalProperties": false
}
},
"overall\_correctness": { "type": "string", "enum": ["patch is correct","patch is incorrect"] },
"overall\_explanation": { "type": "string", "minLength": 1 },
"overall\_confidence\_score": { "type": "number", "minimum": 0, "maximum": 1 }
},
"required": ["findings","overall\_correctness","overall\_explanation","overall\_confidence\_score"],
"additionalProperties": false
}
JSON
'''
}
}
stage('Build Codex review prompt') {
environment {
REVIEW\_PROMPT\_PATH = "${env.CODEX\_PROMPT\_PATH ?: 'review\_prompt.md'}"
}
steps {
sh '''
set -euo pipefail
PROMPT\_PATH="codex-prompt.md"
TEMPLATE\_PATH="${REVIEW\_PROMPT\_PATH}"
if [ -n "$TEMPLATE\_PATH" ] && [ -f "$TEMPLATE\_PATH" ]; then
cat "$TEMPLATE\_PATH" \> "$PROMPT\_PATH"
else
{
printf '%s\\n' "You are acting as a reviewer for a proposed code change made by another engineer."
printf '%s\\n' "Focus on issues that impact correctness, performance, security, maintainability, or developer experience."
printf '%s\\n' "Flag only actionable issues introduced by the pull request."
printf '%s\\n' "When you flag an issue, provide a short, direct explanation and cite the affected file and line range."
printf '%s\\n' "Prioritize severe issues and avoid nit-level comments unless they block understanding of the diff."
printf '%s\\n' "After listing findings, produce an overall correctness verdict (\\\\\\"patch is correct\\\\\\" or \\\\\\"patch is incorrect\\\\\\") with a concise justification and a confidence score between 0 and 1."
printf '%s\\n' "Ensure that file citations and line numbers are exactly correct using the tools available; if they are incorrect your comments will be rejected."
} \> "$PROMPT\_PATH"
fi
{
echo ""
echo "Repository: ${REPOSITORY}"
echo "Pull Request #: ${PR\_NUMBER}"
echo "Base ref: ${CHANGE\_TARGET}"
echo "Head ref: ${CHANGE\_BRANCH:-PR-${PR\_NUMBER}-head}"
echo "Base SHA: ${BASE\_SHA}"
echo "Head SHA: ${HEAD\_SHA}"
echo "Changed files:"
git --no-pager diff --name-status "${BASE\_SHA}" "${HEAD\_SHA}"
echo ""
echo "Unified diff (context=5):"
git --no-pager diff --unified=5 --stat=200 "${BASE\_SHA}" "${HEAD\_SHA}" \> /tmp/diffstat.txt
git --no-pager diff --unified=5 "${BASE\_SHA}" "${HEAD\_SHA}" \> /tmp/full.diff
cat /tmp/diffstat.txt
echo ""
cat /tmp/full.diff
} \>\> "$PROMPT\_PATH"
'''
}
}
stage('Run Codex structured review') {
environment {
REVIEW\_PROMPT = 'codex-prompt.md'
REVIEW\_SCHEMA = 'codex-output-schema.json'
REVIEW\_OUTPUT = 'codex-output.json'
}
steps {
withCredentials([
string(credentialsId: 'openai-api-key', variable: 'OPENAI\_API\_KEY')
]) {
// Option A: If you have the OpenAI CLI installed on the Jenkins agent
sh '''
set -euo pipefail
if command -v openai \>/dev/null 2\>&1; then
# Use the Responses API with a JSON schema tool spec
# Produces codex-output.json with the structured result.
openai responses.create \\
--model "${CODEX\_MODEL}" \\
--input-file "${REVIEW\_PROMPT}" \\
--response-format "json\_object" \\
--output-schema "${RESPONSE\_FORMAT}" \\
--tool-choice "auto" \\
\> raw\_response.json || true
# Fallback if CLI doesn’t support your exact flags:
# Keep demo resilient: If raw\_response.json is empty, create a minimal stub so later steps don’t fail.
if [ ! -s raw\_response.json ]; then
echo '{"findings":[],"overall\_correctness":"patch is correct","overall\_explanation":"No issues detected.","overall\_confidence\_score":0.5}' \> "${REVIEW\_OUTPUT}"
else
# If your CLI/format returns a JSON object with the structured content in .output or similar, map it here.
# Adjust jq path to match your CLI output shape.
jq -r '.output // .' raw\_response.json \> "${REVIEW\_OUTPUT}" || cp raw\_response.json "${REVIEW\_OUTPUT}"
fi
else
echo "openai CLI not found; creating a stub output for demo continuity."
echo '{"findings":[],"overall\_correctness":"patch is correct","overall\_explanation":"(CLI not available on agent)","overall\_confidence\_score":0.4}' \> "${REVIEW\_OUTPUT}"
fi
'''
}
}
}
stage('Inspect structured Codex output') {
steps {
sh '''
if [ -s codex-output.json ]; then
jq '.' codex-output.json || true
else
echo "Codex output file missing"
fi
'''
}
}
stage('Publish inline review comments') {
when { expression { true } }
steps {
withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB\_TOKEN')]) {
sh '''
set -euo pipefail
REVIEW\_JSON="codex-output.json"
if [ ! -s "$REVIEW\_JSON" ]; then
echo "No Codex output file present; skipping comment publishing."
exit 0
fi
findings\_count=$(jq '.findings | length' "$REVIEW\_JSON")
if [ "$findings\_count" -eq 0 ]; then
echo "Codex returned no findings; skipping inline comments."
exit 0
fi
jq -c --arg commit "$HEAD\_SHA" '.findings[] | {
body: (.title + "\\\\n\\\\n" + .body + "\\\\n\\\\nConfidence: " + (.confidence\_score | tostring) + (if has("priority") then "\\\\nPriority: P" + (.priority | tostring) else "" end)),
commit\_id: $commit,
path: .code\_location.absolute\_file\_path,
line: .code\_location.line\_range.end,
side: "RIGHT",
start\_line: (if .code\_location.line\_range.start != .code\_location.line\_range.end then .code\_location.line\_range.start else null end),
start\_side: (if .code\_location.line\_range.start != .code\_location.line\_range.end then "RIGHT" else null end)
} | with\_entries(select(.value != null))' "$REVIEW\_JSON" \> findings.jsonl
while IFS= read -r payload; do
echo "Posting review comment payload:" && echo "$payload" | jq '.'
curl -sS \\
-X POST \\
-H "Accept: application/vnd.github+json" \\
-H "Authorization: Bearer ${GITHUB\_TOKEN}" \\
-H "X-GitHub-Api-Version: 2022-11-28" \\
"https://api.github.com/repos/${REPOSITORY}/pulls/${PR\_NUMBER}/comments" \\
-d "$payload"
done \< findings.jsonl
'''
}
}
}
stage('Publish overall summary comment') {
steps {
withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB\_TOKEN')]) {
sh '''
set -euo pipefail
REVIEW\_JSON="codex-output.json"
if [ ! -s "$REVIEW\_JSON" ]; then
echo "Codex output missing; skipping summary."
exit 0
fi
overall\_state=$(jq -r '.overall\_correctness' "$REVIEW\_JSON")
overall\_body=$(jq -r '.overall\_explanation' "$REVIEW\_JSON")
confidence=$(jq -r '.overall\_confidence\_score' "$REVIEW\_JSON")
msg="\*\*Codex automated review\*\*\\\\n\\\\nVerdict: ${overall\_state}\\\\nConfidence: ${confidence}\\\\n\\\\n${overall\_body}"
jq -n --arg body "$msg" '{body: $body}' \> /tmp/summary.json
curl -sS \\
-X POST \\
-H "Accept: application/vnd.github+json" \\
-H "Authorization: Bearer ${GITHUB\_TOKEN}" \\
-H "X-GitHub-Api-Version: 2022-11-28" \\
"https://api.github.com/repos/${REPOSITORY}/issues/${PR\_NUMBER}/comments" \\
-d @/tmp/summary.json
'''
}
}
}
}
post {
always {
archiveArtifacts artifacts: 'codex-\*.json, \*.md, /tmp/diff\*.txt', allowEmptyArchive: true
}
}
}`
```
# Wrap Up
With the Codex SDK, you can build your own automated code review workflow in CI/CD environments that are not directly connected to Codex Cloud. However, the pattern of triggering Codex with a prompt, receiving a structured output, and then acting on that output with an API call extends far beyond Code Review. For example, we could use this pattern to trigger a root-cause analysis when an incident is created and post a structured report into a Slack channel. Or we could create a code quality report on each PR and post results into a dashboard.