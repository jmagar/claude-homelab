Permit.io Authorization 🤝 FastMCP - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/v2/getting-started/welcome)
* [
Installation
](/v2/getting-started/installation)
* [
Quickstart
](/v2/getting-started/quickstart)
* [
Updates
NEW
](/v2/updates)
##### Servers
* [
Overview
](/v2/servers/server)
*
Core Components
*
Advanced Features
*
Authentication
*
Deployment
##### Clients
*
Essentials
*
Core Operations
*
Advanced Features
*
Authentication
##### Integrations
*
Authentication
*
Authorization
* [
Eunomia Auth
](/v2/integrations/eunomia-authorization)
* [
Permit.io
](/v2/integrations/permit)
*
AI Assistants
*
AI SDKs
*
API Integration
##### Patterns
* [
Tool Transformation
](/v2/patterns/tool-transformation)
* [
Decorating Methods
](/v2/patterns/decorating-methods)
* [
CLI
](/v2/patterns/cli)
* [
Contrib Modules
](/v2/patterns/contrib)
* [
Testing
](/v2/patterns/testing)
##### Development
* [
Contributing
](/v2/development/contributing)
* [
Tests
](/v2/development/tests)
* [
Releases
](/v2/development/releases)
* [
Upgrade Guide
NEW
](/v2/development/upgrade-guide)
* [
Changelog
](/v2/changelog)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
Add **policy-based authorization** to your FastMCP servers with one-line code addition with the **[Permit.io](https://github.com/permitio) authorization middleware**.
Control which tools, resources and prompts MCP clients can view and execute on your server. Define dynamic policies using Permit.io’s powerful RBAC, ABAC, and REBAC capabilities, and obtain comprehensive audit logs of all access attempts and violations.
##
[​
](#how-it-works)
How it Works
Leveraging FastMCP’s [Middleware](/servers/middleware), the Permit.io middleware intercepts all MCP requests to your server and automatically maps MCP methods to authorization checks against your Permit.io policies; covering both server methods and tool execution.
###
[​
](#policy-mapping)
Policy Mapping
The middleware automatically maps MCP methods to Permit.io resources and actions:
* **MCP server methods** (e.g., `tools/list`, `resources/read`):
* **Resource**: `{server\_name}\_{component}` (e.g., `myserver\_tools`)
* **Action**: The method verb (e.g., `list`, `read`)
* **Tool execution** (method `tools/call`):
* **Resource**: `{server\_name}` (e.g., `myserver`)
* **Action**: The tool name (e.g., `greet`)
*Example: In Permit.io, the ‘Admin’ role is granted permissions on resources and actions as mapped by the middleware. For example, ‘greet’, ‘greet-jwt’, and ‘login’ are actions on the ‘mcp\_server’ resource, and ‘list’ is an action on the ‘mcp\_server\_tools’ resource.*
>
**> Note:
**> Don’t forget to assign the relevant role (e.g., Admin, User) to the user authenticating to your MCP server (such as the user in the JWT) in the Permit.io Directory. Without the correct role assignment, users will not have access to the resources and actions you’ve configured in your policies.
>
>
*> Example: In Permit.io Directory, both ‘client’ and ‘admin’ users are assigned the ‘Admin’ role, granting them the permissions defined in your policy mapping.
*>
For detailed policy mapping examples and configuration, see [Detailed Policy Mapping](https://github.com/permitio/permit-fastmcp/blob/main/docs/policy-mapping.md).
###
[​
](#listing-operations)
Listing Operations
The middleware behaves as a filter for listing operations (`tools/list`, `resources/list`, `prompts/list`), hiding to the client components that are not authorized by the defined policies.
###
[​
](#execution-operations)
Execution Operations
The middleware behaves as an enforcement point for execution operations (`tools/call`, `resources/read`, `prompts/get`), blocking operations that are not authorized by the defined policies.
##
[​
](#add-authorization-to-your-server)
Add Authorization to Your Server
Permit.io is a cloud-native authorization service. You need a Permit.io account and a running Policy Decision Point (PDP) for the middleware to function. You can run the PDP locally with Docker or use Permit.io’s cloud PDP.
###
[​
](#prerequisites)
Prerequisites
1. **Permit.io Account**: Sign up at [permit.io](https://permit.io)
2. **PDP Setup**: Run the Permit.io PDP locally or use the cloud PDP (RBAC only)
3. **API Key**: Get your Permit.io API key from the dashboard
###
[​
](#run-the-permit-io-pdp)
Run the Permit.io PDP
Run the PDP locally with Docker:
```
`docker run -p 7766:7766 permitio/pdp:latest
`
```
Or use the cloud PDP URL: `https://cloudpdp.api.permit.io`
###
[​
](#create-a-server-with-authorization)
Create a Server with Authorization
First, install the `permit-fastmcp` package:
```
`# Using UV (recommended)
uv add permit-fastmcp
# Using pip
pip install permit-fastmcp
`
```
Then create a FastMCP server and add the Permit.io middleware:
server.py
```
`from fastmcp import FastMCP
from permit\_fastmcp.middleware.middleware import PermitMcpMiddleware
mcp = FastMCP("Secure FastMCP Server 🔒")
@mcp.tool
def greet(name: str) -\> str:
"""Greet a user by name"""
return f"Hello, {name}!"
@mcp.tool
def add(a: int, b: int) -\> int:
"""Add two numbers"""
return a + b
# Add Permit.io authorization middleware
mcp.add\_middleware(PermitMcpMiddleware(
permit\_pdp\_url="http://localhost:7766",
permit\_api\_key="your-permit-api-key"
))
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http")
`
```
###
[​
](#configure-access-policies)
Configure Access Policies
Create your authorization policies in the Permit.io dashboard:
1. **Create Resources**: Define resources like `mcp\_server` and `mcp\_server\_tools`
2. **Define Actions**: Add actions like `greet`, `add`, `list`, `read`
3. **Create Roles**: Define roles like `Admin`, `User`, `Guest`
4. **Assign Permissions**: Grant roles access to specific resources and actions
5. **Assign Users**: Assign roles to users in the Permit.io Directory
For step-by-step setup instructions and troubleshooting, see [Getting Started & FAQ](https://github.com/permitio/permit-fastmcp/blob/main/docs/getting-started.md).
####
[​
](#example-policy-configuration)
Example Policy Configuration
Policies are defined in the Permit.io dashboard, but you can also use the [Permit.io Terraform provider](https://github.com/permitio/terraform-provider-permitio) to define policies in code.
```
`# Resources
resource "permitio\_resource" "mcp\_server" {
name = "mcp\_server"
key = "mcp\_server"
actions = {
"greet" = { name = "greet" }
"add" = { name = "add" }
}
}
resource "permitio\_resource" "mcp\_server\_tools" {
name = "mcp\_server\_tools"
key = "mcp\_server\_tools"
actions = {
"list" = { name = "list" }
}
}
# Roles
resource "permitio\_role" "Admin" {
key = "Admin"
name = "Admin"
permissions = [
"mcp\_server:greet",
"mcp\_server:add",
"mcp\_server\_tools:list"
]
}
`
```
You can also use the [Permit.io CLI](https://github.com/permitio/permit-cli), [API](https://api.permit.io/scalar) or [SDKs](https://github.com/permitio/permit-python) to manage policies, as well as writing policies directly in REGO (Open Policy Agent’s policy language).
For complete policy examples including ABAC and RBAC configurations, see [Example Policies](https://github.com/permitio/permit-fastmcp/tree/main/docs/example_policies).
###
[​
](#identity-management)
Identity Management
The middleware supports multiple identity extraction modes:
* **Fixed Identity**: Use a fixed identity for all requests
* **Header-based**: Extract identity from HTTP headers
* **JWT-based**: Extract and verify JWT tokens
* **Source-based**: Use the MCP context source field
For detailed identity mode configuration and environment variables, see [Identity Modes & Environment Variables](https://github.com/permitio/permit-fastmcp/blob/main/docs/identity-modes.md).
####
[​
](#jwt-authentication-example)
JWT Authentication Example
```
`import os
# Configure JWT identity extraction
os.environ["PERMIT\_MCP\_IDENTITY\_MODE"] = "jwt"
os.environ["PERMIT\_MCP\_IDENTITY\_JWT\_SECRET"] = "your-jwt-secret"
mcp.add\_middleware(PermitMcpMiddleware(
permit\_pdp\_url="http://localhost:7766",
permit\_api\_key="your-permit-api-key"
))
`
```
###
[​
](#abac-policies-with-tool-arguments)
ABAC Policies with Tool Arguments
The middleware supports Attribute-Based Access Control (ABAC) policies that can evaluate tool arguments as attributes. Tool arguments are automatically flattened as individual attributes (e.g., `arg\_name`, `arg\_number`) for granular policy conditions.
*Example: Create dynamic resources with conditions like `resource.arg\_number greater-than 10` to allow the `conditional-greet` tool only when the number argument exceeds 10.*
####
[​
](#example-conditional-access)
Example: Conditional Access
Create a dynamic resource with conditions like `resource.arg\_number greater-than 10` to allow the `conditional-greet` tool only when the number argument exceeds 10.
```
`@mcp.tool
def conditional\_greet(name: str, number: int) -\> str:
"""Greet a user only if number \> 10"""
return f"Hello, {name}! Your number is {number}"
`
```
*Example: The Admin role is granted access to the “conditional-greet” action on the “Big-greets” dynamic resource, while other tools like “greet”, “greet-jwt”, and “login” are granted on the base “mcp\_server” resource.*
For comprehensive ABAC configuration and advanced policy examples, see [ABAC Policies with Tool Arguments](https://github.com/permitio/permit-fastmcp/blob/main/docs/policy-mapping.md#abac-policies-with-tool-arguments).
###
[​
](#run-the-server)
Run the Server
Start your FastMCP server normally:
```
`python server.py
`
```
The middleware will now intercept all MCP requests and check them against your Permit.io policies. Requests include user identification through the configured identity mode and automatic mapping of MCP methods to authorization resources and actions.
##
[​
](#advanced-configuration)
Advanced Configuration
###
[​
](#environment-variables)
Environment Variables
Configure the middleware using environment variables:
```
`# Permit.io configuration
export PERMIT\_MCP\_PERMIT\_PDP\_URL="http://localhost:7766"
export PERMIT\_MCP\_PERMIT\_API\_KEY="your-api-key"
# Identity configuration
export PERMIT\_MCP\_IDENTITY\_MODE="jwt"
export PERMIT\_MCP\_IDENTITY\_JWT\_SECRET="your-jwt-secret"
# Method configuration
export PERMIT\_MCP\_KNOWN\_METHODS='["tools/list","tools/call"]'
export PERMIT\_MCP\_BYPASSED\_METHODS='["initialize","ping"]'
# Logging configuration
export PERMIT\_MCP\_ENABLE\_AUDIT\_LOGGING="true"
`
```
For a complete list of all configuration options and environment variables, see [Configuration Reference](https://github.com/permitio/permit-fastmcp/blob/main/docs/configuration-reference.md).
###
[​
](#custom-middleware-configuration)
Custom Middleware Configuration
```
`from permit\_fastmcp.middleware.middleware import PermitMcpMiddleware
middleware = PermitMcpMiddleware(
permit\_pdp\_url="http://localhost:7766",
permit\_api\_key="your-api-key",
enable\_audit\_logging=True,
bypass\_methods=["initialize", "ping", "health/\*"]
)
mcp.add\_middleware(middleware)
`
```
For advanced configuration options and custom middleware extensions, see [Advanced Configuration](https://github.com/permitio/permit-fastmcp/blob/main/docs/advanced-configuration.md).
##
[​
](#example-complete-jwt-authentication-server)
Example: Complete JWT Authentication Server
See the [example server](https://github.com/permitio/permit-fastmcp/blob/main/permit_fastmcp/example_server/example.py) for a full implementation with JWT-based authentication. For additional examples and usage patterns, see [Example Server](https://github.com/permitio/permit-fastmcp/blob/main/permit_fastmcp/example_server/):
```
`from fastmcp import FastMCP, Context
from permit\_fastmcp.middleware.middleware import PermitMcpMiddleware
import jwt
import datetime
# Configure JWT identity extraction
os.environ["PERMIT\_MCP\_IDENTITY\_MODE"] = "jwt"
os.environ["PERMIT\_MCP\_IDENTITY\_JWT\_SECRET"] = "mysecretkey"
mcp = FastMCP("My MCP Server")
@mcp.tool
def login(username: str, password: str) -\> str:
"""Login to get a JWT token"""
if username == "admin" and password == "password":
token = jwt.encode(
{"sub": username, "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)},
"mysecretkey",
algorithm="HS256"
)
return f"Bearer {token}"
raise Exception("Invalid credentials")
@mcp.tool
def greet\_jwt(ctx: Context) -\> str:
"""Greet a user by extracting their name from JWT"""
# JWT extraction handled by middleware
return "Hello, authenticated user!"
mcp.add\_middleware(PermitMcpMiddleware(
permit\_pdp\_url="http://localhost:7766",
permit\_api\_key="your-permit-api-key"
))
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http")
`
```
For detailed policy configuration, custom authentication, and advanced
deployment patterns, visit the [Permit.io FastMCP Middleware
repository](https://github.com/permitio/permit-fastmcp). For troubleshooting common issues, see [Troubleshooting](https://github.com/permitio/permit-fastmcp/blob/main/docs/troubleshooting.md).