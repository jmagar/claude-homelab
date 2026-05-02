Prefect Horizon - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/getting-started/welcome)
* [
Installation
](/getting-started/installation)
* [
Quickstart
](/getting-started/quickstart)
##### Servers
* [
Overview
](/servers/server)
*
Core Components
*
FeaturesUPDATED
*
Providers
*
Transforms
*
Auth
*
Deployment
* [
Running Your Server
](/deployment/running-server)
* [
HTTP Deployment
](/deployment/http)
* [
Prefect Horizon
](/deployment/prefect-horizon)
* [
Project Configuration
](/deployment/server-configuration)
##### Apps
* [
Overview
NEW
](/apps/overview)
* [
Quickstart
NEW
](/apps/quickstart)
* [
Examples
NEW
](/apps/examples)
*
Building AppsNEW
*
ProvidersNEW
*
AdvancedNEW
##### Clients
* [
Overview
](/clients/client)
* [
Transports
](/clients/transports)
*
Core Operations
*
HandlersUPDATED
*
AuthenticationUPDATED
##### Integrations
*
Auth
*
Web Frameworks
*
AI Assistants
*
AI SDKs
* [
MCP.json
](/integrations/mcp-json-configuration)
##### CLI
* [
Overview
](/cli/overview)
* [
Running
](/cli/running)
* [
Install MCPs
](/cli/install-mcp)
* [
Inspecting
](/cli/inspecting)
* [
Client
](/cli/client)
* [
Generate CLI
](/cli/generate-cli)
* [
Auth
](/cli/auth)
##### More
* [
Settings
](/more/settings)
*
Upgrading
*
Development
*
What's New
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
[Prefect Horizon](https://www.prefect.io/horizon) is a platform for deploying and managing MCP servers. Built by the FastMCP team at [Prefect](https://www.prefect.io), Horizon provides managed hosting, authentication, access control, and a registry of MCP capabilities.
Horizon includes a **free personal tier for FastMCP users**, making it the fastest way to get a secure, production-ready server URL with built-in OAuth authentication.
Horizon is free for personal projects. Enterprise governance features are available for teams deploying to thousands of users.
##
[​
](#the-platform)
The Platform
Horizon is organized into four integrated pillars:
* **Deploy**: Managed hosting with CI/CD, scaling, monitoring, and rollbacks. Push code and get a live, governed endpoint in 60 seconds.
* **Registry**: A central catalog of MCP servers across your organization—first-party, third-party, and curated remix servers composed from multiple sources.
* **Gateway**: Role-based access control, authentication, and audit logs. Define what agents can see and do at the tool level.
* **Agents**: A permissioned chat interface for interacting with any MCP server or curated combination of servers.
This guide focuses on **Horizon Deploy**, the managed hosting layer that gives you the fastest path from a FastMCP server to a production URL.
##
[​
](#prerequisites)
Prerequisites
To use Horizon, you’ll need a [GitHub](https://github.com) account and a GitHub repo containing a FastMCP server. If you don’t have one yet, Horizon can create a starter repo for you during onboarding.
Your repo can be public or private, but must include at least a Python file containing a FastMCP server instance.
To verify your file is compatible with Horizon, run `fastmcp inspect \<file.py:server\_object\>` to see what Horizon will see when it runs your server.
If you have a `requirements.txt` or `pyproject.toml` in the repo, Horizon will automatically detect your server’s dependencies and install them. Your file *can* have an `if \_\_name\_\_ == "\_\_main\_\_"` block, but it will be ignored by Horizon.
For example, a minimal server file might look like:
```
`from fastmcp import FastMCP
mcp = FastMCP("MyServer")
@mcp.tool
def hello(name: str) -\> str:
return f"Hello, {name}!"
`
```
##
[​
](#getting-started)
Getting Started
There are just three steps to deploying a server to Horizon:
###
[​
](#step-1-select-a-repository)
Step 1: Select a Repository
Visit [horizon.prefect.io](https://horizon.prefect.io) and sign in with your GitHub account. Connect your GitHub account to grant Horizon access to your repositories, then select the repo you want to deploy.
###
[​
](#step-2-configure-your-server)
Step 2: Configure Your Server
Next, you’ll configure how Horizon should build and deploy your server.
The configuration screen lets you specify:
* **Server name**: A unique name for your server. This determines your server’s URL.
* **Description**: A brief description of what your server does.
* **Entrypoint**: The Python file containing your FastMCP server (e.g., `main.py`). This field has the same syntax as the `fastmcp run` command—use `main.py:mcp` to specify a specific object in the file.
* **Authentication**: When enabled, only authenticated users in your organization can connect. Horizon handles all the OAuth complexity for you.
Horizon will automatically detect your server’s Python dependencies from either a `requirements.txt` or `pyproject.toml` file.
###
[​
](#step-3-deploy-and-connect)
Step 3: Deploy and Connect
Click **Deploy Server** and Horizon will clone your repository, build your server, and deploy it to a unique URL—typically in under 60 seconds.
Once deployed, your server is accessible at a URL like:
```
`https://your-server-name.fastmcp.app/mcp
`
```
Horizon monitors your repo and redeploys automatically whenever you push to `main`. It also builds preview deployments for every PR, so you can test changes before they go live.
##
[​
](#testing-your-server)
Testing Your Server
Horizon provides two ways to verify your server is working before connecting external clients.
###
[​
](#inspector)
Inspector
The Inspector gives you a structured view of everything your server exposes—tools, resources, and prompts. You can click any tool, fill in the inputs, execute it, and see the output. This is useful for systematically validating each capability and debugging specific behaviors.
###
[​
](#chatmcp)
ChatMCP
For quick end-to-end testing, ChatMCP lets you interact with your server conversationally. It uses a fast model optimized for rapid iteration—you can verify the server works, test tool calls in context, and confirm the overall behavior before sharing it with others.
ChatMCP is designed for testing, not as a daily work environment. Once you’ve confirmed your server works, you can copy connection snippets for Claude Desktop, Cursor, Claude Code, and other MCP clients—or use the FastMCP client library to connect programmatically.
##
[​
](#horizon-agents)
Horizon Agents
Beyond testing individual servers, Horizon lets you create **Agents**—chat interfaces backed by one or more MCP servers. While ChatMCP tests a single server, Agents let you compose capabilities from multiple servers into a unified experience.
To create an agent:
1. Navigate to **Agents** in the sidebar
2. Click **Create Agent** and give it a name and description
3. Add MCP servers to the agent—these can be servers you’ve deployed to Horizon or external servers in the registry
Once configured, you can chat with your agent directly in Horizon:
Agents are useful for creating purpose-built interfaces that combine tools from different servers. For example, you might create an agent that has access to both your company’s internal data server and a general-purpose utilities server.