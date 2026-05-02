Set up an MCP server | Gemini CLI
[Skip to content](#_top)
# Set up an MCP server
Copy as Markdown Copied!
Connect Gemini CLI to your external databases and services. In this guide,
you’ll learn how to extend Gemini CLI’s capabilities by installing the GitHub
MCP server and using it to manage your repositories.
## Prerequisites
[Section titled “Prerequisites”](#prerequisites)
* Gemini CLI installed.
* **Docker:** Required for this specific example (many MCP servers run as Docker
containers).
* **GitHub token:** A Personal Access Token (PAT) with repo permissions.
## How to prepare your credentials
[Section titled “How to prepare your credentials”](#how-to-prepare-your-credentials)
Most MCP servers require authentication. For GitHub, you need a PAT.
1. Create a [fine-grained PAT](https://github.com/settings/tokens?type=beta).
2. Grant it **Read** access to **Metadata** and **Contents**, and
**Read/Write** access to **Issues** and **Pull Requests**.
3. Store it in your environment:
**macOS/Linux**
Terminal window
```
`
export GITHUB\_PERSONAL\_ACCESS\_TOKEN="github\_pat\_..."
`
```
**Windows (PowerShell)**
Terminal window
```
`
$env:GITHUB\_PERSONAL\_ACCESS\_TOKEN="github\_pat\_..."
`
```
## How to configure Gemini CLI
[Section titled “How to configure Gemini CLI”](#how-to-configure-gemini-cli)
You tell Gemini about new servers by editing your `settings.json`.
1. Open `\~/.gemini/settings.json` (or the project-specific
`.gemini/settings.json`).
2. Add the `mcpServers` block. This tells Gemini: “Run this docker container
and talk to it.”
```
`
{
"mcpServers": {
"github": {
"command": "docker",
"args": [
"run",
"-i",
"--rm",
"-e",
"GITHUB\_PERSONAL\_ACCESS\_TOKEN",
"ghcr.io/github/github-mcp-server:latest"
],
"env": {
"GITHUB\_PERSONAL\_ACCESS\_TOKEN": "${GITHUB\_PERSONAL\_ACCESS\_TOKEN}"
}
}
}
}
`
```
The `command` is `docker`, and the rest are arguments passed to it. We
map the local environment variable into the container so your secret isn’t
hardcoded in the config file.
## How to verify the connection
[Section titled “How to verify the connection”](#how-to-verify-the-connection)
Restart Gemini CLI. It will automatically try to start the defined servers.
**Command:** `/mcp list`
You should see: `✓ github: docker ... - Connected`
If you see `Disconnected` or an error, check that Docker is running and your API
token is valid.
## How to use the new tools
[Section titled “How to use the new tools”](#how-to-use-the-new-tools)
Now that the server is running, the agent has new capabilities (“tools”). You
don’t need to learn special commands; just ask in natural language.
### Scenario: Listing pull requests
[Section titled “Scenario: Listing pull requests”](#scenario-listing-pull-requests)
**Prompt:** `List the open PRs in the google/gemini-cli repository.`
The agent will:
1. Recognize the request matches a GitHub tool.
2. Call `mcp\_github\_list\_pull\_requests`.
3. Present the data to you.
### Scenario: Creating an issue
[Section titled “Scenario: Creating an issue”](#scenario-creating-an-issue)
**Prompt:**
`Create an issue in my repo titled "Bug: Login fails" with the description "See logs".`
## Troubleshooting
[Section titled “Troubleshooting”](#troubleshooting)
* **Server won’t start?** Try running the docker command manually in your
terminal to see if it prints an error (for example, “image not found”).
* **Tools not found?** Run `/mcp reload` to force the CLI to re-query the server
for its capabilities.
## Next steps
[Section titled “Next steps”](#next-steps)
* Explore the [MCP servers reference](/docs/tools/mcp-server) to learn about
SSE and HTTP transports for remote servers.
* Browse the
[official MCP server list](https://github.com/modelcontextprotocol/servers) to
find connectors for Slack, Postgres, Google Drive, and more.
Last updated: Apr 10, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.