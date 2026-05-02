How to Automate Publishing with GitHub Actions - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The MCP Registry is currently in preview. Breaking changes or data resets may occur before general availability. If you encounter any issues, please report them on [GitHub](https://github.com/modelcontextprotocol/registry/issues).
##
[​
](#step-1-create-a-workflow-file)
Step 1: Create a Workflow File
In your server project directory, create a `.github/workflows/publish-mcp.yml` file. Here is an example for npm-based local server, but the MCP Registry publishing steps are the same for all package types:
OIDC authentication (recommended)
PAT authentication
DNS authentication
```
`name: Publish to MCP Registry
on:
push:
tags: ["v\*"] # Triggers on version tags like v1.0.0
jobs:
publish:
runs-on: ubuntu-latest
permissions:
id-token: write # Required for OIDC authentication
contents: read
steps:
- name: Checkout code
uses: actions/checkout@v5
### Publish underlying npm package:
- name: Set up Node.js
uses: actions/setup-node@v5
with:
node-version: "lts/\*"
- name: Install dependencies
run: npm ci
- name: Run tests
run: npm run test --if-present
- name: Build package
run: npm run build --if-present
- name: Publish package to npm
run: npm publish
env:
NODE\_AUTH\_TOKEN: ${{ secrets.NPM\_TOKEN }}
### Publish MCP server:
- name: Install mcp-publisher
run: |
curl -L "https://github.com/modelcontextprotocol/registry/releases/latest/download/mcp-publisher\_$(uname -s | tr '[:upper:]' '[:lower:]')\_$(uname -m | sed 's/x86\_64/amd64/;s/aarch64/arm64/').tar.gz" | tar xz mcp-publisher
- name: Authenticate to MCP Registry
run: ./mcp-publisher login github-oidc
# Optional:
# - name: Set version in server.json
# run: |
# VERSION=${GITHUB\_REF#refs/tags/v}
# jq --arg v "$VERSION" '.version = $v' server.json \> server.tmp && mv server.tmp server.json
- name: Publish server to MCP Registry
run: ./mcp-publisher publish
`
```
##
[​
](#step-2-add-secrets)
Step 2: Add Secrets
You may need to add a secret to the repository depending on which authentication method you choose:
* **GitHub OIDC Authentication**: No dedicated secret necessary.
* **GitHub PAT Authentication**: Add a `MCP\_GITHUB\_TOKEN` secret with a GitHub Personal Access Token (PAT) that has `read:org` and `read:user` scopes.
* **DNS Authentication**: Add a `MCP\_PRIVATE\_KEY` secret with your Ed25519 private key.
You may also need to add secrets for your package registry. For example, the workflow above needs an `NPM\_TOKEN` secret with your npm token.
For information about how to add secrets to a repository, see [Using secrets in GitHub Actions](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets).
##
[​
](#step-3-tag-and-release)
Step 3: Tag and Release
Create and push a version tag to trigger the workflow:
```
`git tag v1.0.0
git push origin v1.0.0
`
```
The workflow will run tests, build the package, publish the package to npm, and publish the server to the MCP Registry.
##
[​
](#troubleshooting)
Troubleshooting
|Error Message|Action|
|”Authentication failed”|Ensure `id-token: write` permission is set for OIDC, or check secrets.|
|”Package validation failed”|Verify your package successfully published to the package registry (e.g., npm, PyPI), and that your package has the [necessary verification information](./package-types).|