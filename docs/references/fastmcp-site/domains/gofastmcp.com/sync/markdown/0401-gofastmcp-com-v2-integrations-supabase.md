Supabase 🤝 FastMCP - FastMCP
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
* [
Auth0
NEW
](/v2/integrations/auth0)
* [
AuthKit
NEW
](/v2/integrations/authkit)
* [
AWS Cognito
NEW
](/v2/integrations/aws-cognito)
* [
Azure (Entra ID)
NEW
](/v2/integrations/azure)
* [
Descope
NEW
](/v2/integrations/descope)
* [
Discord
NEW
](/v2/integrations/discord)
* [
GitHub
NEW
](/v2/integrations/github)
* [
Google
NEW
](/v2/integrations/google)
* [
Oracle
NEW
](/v2/integrations/oci)
* [
Scalekit
NEW
](/v2/integrations/scalekit)
* [
Supabase
NEW
](/v2/integrations/supabase)
* [
WorkOS
NEW
](/v2/integrations/workos)
*
Authorization
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
New in version `2.13.0`
This guide shows you how to secure your FastMCP server using **Supabase Auth**. This integration uses the [**Remote OAuth**](/v2/servers/auth/remote-oauth) pattern, where Supabase handles user authentication and your FastMCP server validates the tokens.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A **[Supabase Account](https://supabase.com/)** with a project or a self-hosted **Supabase Auth** instance
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-get-supabase-project-url)
Step 1: Get Supabase Project URL
In your Supabase Dashboard:
1. Go to **Project Settings**
2. Copy your **Project URL** (e.g., `https://abc123.supabase.co`)
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `SupabaseProvider`:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.supabase import SupabaseProvider
# Configure Supabase Auth
auth = SupabaseProvider(
project\_url="https://abc123.supabase.co",
base\_url="http://localhost:8000",
auth\_route="/my/auth/route" # if self-hosting and using custom routes
)
mcp = FastMCP("Supabase Protected Server", auth=auth)
@mcp.tool
def protected\_tool(message: str) -\> str:
"""This tool requires authentication."""
return f"Authenticated user says: {message}"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http", port=8000)
`
```
##
[​
](#testing)
Testing
###
[​
](#running-the-server)
Running the Server
Start your FastMCP server with HTTP transport to enable OAuth flows:
```
`fastmcp run server.py --transport http --port 8000
`
```
Your server is now running and protected by Supabase authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your Supabase-protected server:
client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle Supabase OAuth
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
# First-time connection will open Supabase login in your browser
print("✓ Authenticated with Supabase!")
# Test the protected tool
result = await client.call\_tool("protected\_tool", {"message": "Hello!"})
print(result)
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to Supabase’s authorization page
2. After you authorize, you’ll be redirected back
3. The client receives the token and can make authenticated requests
##
[​
](#environment-variables)
Environment Variables
For production deployments, use environment variables instead of hardcoding credentials.
###
[​
](#provider-selection)
Provider Selection
Setting this environment variable allows the Supabase provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.supabase.SupabaseProvider` to use Supabase authentication.
###
[​
](#supabase-specific-configuration)
Supabase-Specific Configuration
These environment variables provide default values for the Supabase provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-supabase-project-url)
FASTMCP\_SERVER\_AUTH\_SUPABASE\_PROJECT\_URL
required
Your Supabase project URL (e.g., `https://abc123.supabase.co`)
[​
](#param-fastmcp-server-auth-supabase-base-url)
FASTMCP\_SERVER\_AUTH\_SUPABASE\_BASE\_URL
required
Public URL of your FastMCP server (e.g., `https://your-server.com` or `http://localhost:8000` for development)
[​
](#param-fastmcp-server-auth-supabase-auth-route)
FASTMCP\_SERVER\_AUTH\_SUPABASE\_AUTH\_ROUTE
default:"/auth/v1"
Your Supabase auth route (e.g., `/auth/v1`)
[​
](#param-fastmcp-server-auth-supabase-required-scopes)
FASTMCP\_SERVER\_AUTH\_SUPABASE\_REQUIRED\_SCOPES
default:"[]"
Comma-, space-, or JSON-separated list of required OAuth scopes (e.g., `openid email` or `["openid", "email"]`)
Example `.env` file:
```
`# Use the Supabase provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.supabase.SupabaseProvider
# Supabase configuration
FASTMCP\_SERVER\_AUTH\_SUPABASE\_PROJECT\_URL=https://abc123.supabase.co
FASTMCP\_SERVER\_AUTH\_SUPABASE\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_SUPABASE\_REQUIRED\_SCOPES=openid,email
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
# Authentication is automatically configured from environment
mcp = FastMCP(name="Supabase Protected Server")
`
```