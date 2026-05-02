Eunomia Authorization 🤝 FastMCP - FastMCP
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
* [
Auth0
](/integrations/auth0)
* [
AuthKit
](/integrations/authkit)
* [
AWS Cognito
](/integrations/aws-cognito)
* [
Azure (Entra ID)
](/integrations/azure)
* [
Descope
](/integrations/descope)
* [
Discord
](/integrations/discord)
* [
Eunomia Auth
](/integrations/eunomia-authorization)
* [
GitHub
](/integrations/github)
* [
Google
](/integrations/google)
* [
Oracle
](/integrations/oci)
* [
Permit.io
](/integrations/permit)
* [
PropelAuth
](/integrations/propelauth)
* [
Scalekit
](/integrations/scalekit)
* [
Supabase
](/integrations/supabase)
* [
WorkOS
](/integrations/workos)
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
Add **policy-based authorization** to your FastMCP servers with one-line code addition with the **[Eunomia](https://github.com/whataboutyou-ai/eunomia) authorization middleware**.
Control which tools, resources and prompts MCP clients can view and execute on your server. Define dynamic JSON-based policies and obtain a comprehensive audit log of all access attempts and violations.
##
[​
](#how-it-works)
How it Works
Exploiting FastMCP’s [Middleware](/servers/middleware), the Eunomia middleware intercepts all MCP requests to your server and automatically maps MCP methods to authorization checks.
###
[​
](#listing-operations)
Listing Operations
The middleware behaves as a filter for listing operations (`tools/list`, `resources/list`, `prompts/list`), hiding to the client components that are not authorized by the defined policies.
###
[​
](#execution-operations)
Execution Operations
The middleware behaves as a firewall for execution operations (`tools/call`, `resources/read`, `prompts/get`), blocking operations that are not authorized by the defined policies.
##
[​
](#add-authorization-to-your-server)
Add Authorization to Your Server
Eunomia is an AI-specific authorization server that handles policy decisions. The server runs embedded within your MCP server by default for a zero-effort configuration, but can alternatively be run remotely for centralized policy decisions.
###
[​
](#create-a-server-with-authorization)
Create a Server with Authorization
First, install the `eunomia-mcp` package:
```
`pip install eunomia-mcp
`
```
Then create a FastMCP server and add the Eunomia middleware in one line:
server.py
```
`from fastmcp import FastMCP
from eunomia\_mcp import create\_eunomia\_middleware
# Create your FastMCP server
mcp = FastMCP("Secure MCP Server 🔒")
@mcp.tool()
def add(a: int, b: int) -\> int:
"""Add two numbers"""
return a + b
# Add middleware to your server
middleware = create\_eunomia\_middleware(policy\_file="mcp\_policies.json")
mcp.add\_middleware(middleware)
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
###
[​
](#configure-access-policies)
Configure Access Policies
Use the `eunomia-mcp` CLI in your terminal to manage your authorization policies:
```
`# Create a default policy file
eunomia-mcp init
# Or create a policy file customized for your FastMCP server
eunomia-mcp init --custom-mcp "app.server:mcp"
`
```
This creates `mcp\_policies.json` file that you can further edit to your access control needs.
```
`# Once edited, validate your policy file
eunomia-mcp validate mcp\_policies.json
`
```
###
[​
](#run-the-server)
Run the Server
Start your FastMCP server normally:
```
`python server.py
`
```
The middleware will now intercept all MCP requests and check them against your policies. Requests include agent identification through headers like `X-Agent-ID`, `X-User-ID`, `User-Agent`, or `Authorization` and an automatic mapping of MCP methods to authorization resources and actions.
For detailed policy configuration, custom authentication, and remote
deployments, visit the [Eunomia MCP Middleware
repository](https://github.com/whataboutyou-ai/eunomia/tree/main/pkgs/extensions/mcp).