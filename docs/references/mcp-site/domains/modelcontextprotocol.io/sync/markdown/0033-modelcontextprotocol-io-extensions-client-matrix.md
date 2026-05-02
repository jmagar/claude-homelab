Extension Support Matrix - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
This matrix shows which MCP clients support each [official extension](/extensions/overview). Extensions are always opt-in — a client only uses an extension if both client and server declare support during the [initialization handshake](/extensions/overview#negotiation).
This list is maintained by the community. If you notice any inaccuracies or would like to add or update information, please [submit a pull request](https://github.com/modelcontextprotocol/modelcontextprotocol/pulls).
##
[​
](#extension-overview)
Extension overview
|Extension|Identifier|Description|
|[MCP Apps](/extensions/apps/overview)|`io.modelcontextprotocol/ui`|Interactive HTML interfaces rendered inline in the conversation|
|[OAuth Client Credentials](/extensions/auth/oauth-client-credentials)|`io.modelcontextprotocol/oauth-client-credentials`|Machine-to-machine auth without interactive user login|
|[Enterprise-Managed Authorization](/extensions/auth/enterprise-managed-authorization)|`io.modelcontextprotocol/enterprise-managed-authorization`|Centralized access control via enterprise IdP|
##
[​
](#support-matrix)
Support matrix
|Client|[MCP Apps](/extensions/apps/overview)|[OAuth Client Credentials](/extensions/auth/oauth-client-credentials)|[Enterprise Auth](/extensions/auth/enterprise-managed-authorization)|
|[Claude (web)](https://claude.ai)||||
|[Claude Desktop](https://claude.ai/download)||||
|[VS Code GitHub Copilot](https://code.visualstudio.com/)||||
|[Goose](https://block.github.io/goose/)||||
|[Postman](https://postman.com)||||
|[MCPJam](https://www.mcpjam.com/)||||
|[ChatGPT](https://chatgpt.com/)||||
|[Cursor](https://cursor.com/)||||
Auth extension support (OAuth Client Credentials and Enterprise-Managed Authorization) is tracked separately from the core MCP authorization features (DCR, CIMD) shown on the [clients page](/clients). Check each extension’s specification and the [ext-auth repository](https://github.com/modelcontextprotocol/ext-auth) for the latest implementation status.
##
[​
](#adding-extension-support-to-your-client)
Adding extension support to your client
If you’re building an MCP client and want to implement extension support:
1. Review the extension specification (e.g., in the [ext-auth](https://github.com/modelcontextprotocol/ext-auth) or [ext-apps](https://github.com/modelcontextprotocol/ext-apps) repository)
2. Declare support in the `extensions` field of your `initialize` capabilities
3. Implement the extension’s protocol requirements
4. Submit a pull request to update this matrix
See [Extensions Overview](/extensions/overview#negotiation) for details on the capability negotiation mechanism.