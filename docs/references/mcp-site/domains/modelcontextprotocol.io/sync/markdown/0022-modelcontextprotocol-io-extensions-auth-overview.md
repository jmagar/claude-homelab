Authorization Extensions - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The [ext-auth repository](https://github.com/modelcontextprotocol/ext-auth) contains official MCP extensions that add authorization capabilities beyond the core MCP specification. These extensions address specific real-world scenarios where the standard OAuth 2.0 authorization code flow isn’t the right fit.
## modelcontextprotocol/ext-auth
Source code, specifications, and reference implementations for MCP
authorization extensions.
##
[​
](#why-authorization-extensions)
Why authorization extensions?
The core MCP specification includes a robust [authorization framework](/specification/latest/basic/authorization) built on OAuth 2.0. That framework handles the common case well: a user interactively grants an MCP client permission to access a server on their behalf.
But not every MCP deployment fits this pattern:
* **Machine-to-machine integrations** don’t have a human in the loop. Background services, CI pipelines, and automated workflows need to authenticate without interactive user consent flows.
* **Enterprise environments** often have centralized identity providers (IdPs) that enforce policy across all applications. Requiring employees to authorize each MCP server individually creates friction and bypasses existing security controls.
The ext-auth extensions address these gaps.
##
[​
](#available-extensions)
Available extensions
## OAuth Client Credentials
Machine-to-machine authentication using the OAuth 2.0 client credentials
flow. No user interaction required.
## Enterprise-Managed Authorization
Centralized access control via enterprise identity providers. Employees
access MCP servers through their organization’s IdP.
##
[​
](#choosing-the-right-extension)
Choosing the right extension
|Scenario|Recommended extension|
|Background service or daemon accessing an MCP server|[OAuth Client Credentials](/extensions/auth/oauth-client-credentials)|
|CI/CD pipeline calling MCP tools|[OAuth Client Credentials](/extensions/auth/oauth-client-credentials)|
|Server-to-server API integration|[OAuth Client Credentials](/extensions/auth/oauth-client-credentials)|
|Enterprise employees accessing MCP servers at work|[Enterprise-Managed Authorization](/extensions/auth/enterprise-managed-authorization)|
|Organization-wide MCP access policy enforcement|[Enterprise-Managed Authorization](/extensions/auth/enterprise-managed-authorization)|
|Standard interactive user authorization|Core MCP spec (no extension needed)|
##
[​
](#client-support)
Client support
Authorization extension support varies by client. See the [client matrix](/extensions/client-matrix) for a full breakdown. Both extensions require explicit support from the MCP client — they are never active by default.
##
[​
](#specification)
Specification
Both extensions are specified in the [ext-auth repository](https://github.com/modelcontextprotocol/ext-auth/tree/main/specification/draft). They use the standard MCP [extension negotiation](/extensions/overview#negotiation) mechanism: clients and servers declare support in the `extensions` field of their capabilities during initialization.