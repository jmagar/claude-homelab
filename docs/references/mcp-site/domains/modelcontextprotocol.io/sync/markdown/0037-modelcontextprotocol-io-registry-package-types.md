MCP Registry Supported Package Types - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The MCP Registry is currently in preview. Breaking changes or data resets may occur before general availability. If you encounter any issues, please report them on [GitHub](https://github.com/modelcontextprotocol/registry/issues).
#
[​
](#package-types)
Package Types
The MCP Registry supports several different package types, and each package type has its own verification method.
##
[​
](#npm-packages)
npm Packages
For npm packages, the MCP Registry currently supports the npm public registry (`https://registry.npmjs.org`) only.
npm packages use `"registryType": "npm"` in `server.json`. For example:
server.json
```
`{
"$schema": "https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json",
"name": "io.github.username/email-integration-mcp",
"title": "Email Integration",
"description": "Send emails and manage email accounts",
"version": "1.0.0",
"packages": [
{
"registryType": "npm",
"identifier": "@username/email-integration-mcp",
"version": "1.0.0",
"transport": {
"type": "stdio"
}
}
]
}
`
```
###
[​
](#ownership-verification)
Ownership Verification
The MCP Registry verifies ownership of npm packages by checking `mcpName` in `package.json`. The `mcpName` property **MUST** match the server name from `server.json`. For example:
package.json
```
`{
"name": "@username/email-integration-mcp",
"version": "1.0.0",
"mcpName": "io.github.username/email-integration-mcp"
}
`
```
##
[​
](#pypi-packages)
PyPI Packages
For PyPI packages, the MCP Registry currently supports the official PyPI registry (`https://pypi.org`) only.
PyPI packages use `"registryType": "pypi"` in `server.json`. For example:
server.json
```
`{
"$schema": "https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json",
"name": "io.github.username/database-query-mcp",
"title": "Database Query",
"description": "Execute SQL queries and manage database connections",
"version": "1.0.0",
"packages": [
{
"registryType": "pypi",
"identifier": "database-query-mcp",
"version": "1.0.0",
"transport": {
"type": "stdio"
}
}
]
}
`
```
###
[​
](#ownership-verification-2)
Ownership Verification
The MCP Registry verifies ownership of PyPI packages by checking for the existence of an `mcp-name: $SERVER\_NAME` string in the package README (which becomes the package description on PyPI). The string may be hidden in a comment, but the `$SERVER\_NAME` portion **MUST** match the server name from `server.json`. For example:
README.md
```
`# Database Query MCP Server
This MCP server executes SQL queries and manages database connections.
\<!-- mcp-name: io.github.username/database-query-mcp --\>
`
```
##
[​
](#nuget-packages)
NuGet Packages
For NuGet packages, the MCP Registry currently supports the official NuGet registry (`https://api.nuget.org/v3/index.json`) only.
NuGet packages use `"registryType": "nuget"` in `server.json`. For example:
server.json
```
`{
"$schema": "https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json",
"name": "io.github.username/azure-devops-mcp",
"title": "Azure DevOps",
"description": "Manage Azure DevOps work items and pipelines",
"version": "1.0.0",
"packages": [
{
"registryType": "nuget",
"identifier": "Username.AzureDevOpsMcp",
"version": "1.0.0",
"transport": {
"type": "stdio"
}
}
]
}
`
```
###
[​
](#ownership-verification-3)
Ownership Verification
The MCP Registry verifies ownership of NuGet packages by checking for the existence of an `mcp-name: $SERVER\_NAME` string in the package README. The string may be hidden in a comment, but the `$SERVER\_NAME` portion **MUST** match the server name from `server.json`. For example:
README.md
```
`# Azure DevOps MCP Server
This MCP server manages Azure DevOps work items and pipelines.
\<!-- mcp-name: io.github.username/azure-devops-mcp --\>
`
```
##
[​
](#docker/oci-images)
Docker/OCI Images
For Docker/OCI images, the MCP Registry currently supports:
* Docker Hub (`docker.io`)
* GitHub Container Registry (`ghcr.io`)
* Google Artifact Registry (any `\*.pkg.dev` domain)
* Azure Container Registry (`\*.azurecr.io`)
* Microsoft Container Registry (`mcr.microsoft.com`)
Docker/OCI images use `"registryType": "oci"` in `server.json`. For example:
server.json
```
`{
"$schema": "https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json",
"name": "io.github.username/kubernetes-manager-mcp",
"title": "Kubernetes Manager",
"description": "Deploy and manage Kubernetes resources",
"version": "1.0.0",
"packages": [
{
"registryType": "oci",
"identifier": "docker.io/yourusername/kubernetes-manager-mcp:1.0.0",
"transport": {
"type": "stdio"
}
}
]
}
`
```
The format of `identifier` is `registry/namespace/repository:tag`. For example, `docker.io/user/app:1.0.0` or `ghcr.io/user/app:1.0.0`. The tag can also be specified as a digest.
###
[​
](#ownership-verification-4)
Ownership Verification
The MCP Registry verifies ownership of Docker/OCI images by checking for an `io.modelcontextprotocol.server.name` annotation. The value of the `io.modelcontextprotocol.server.name` annotation **MUST** match the server name from `server.json`. For example:
Dockerfile
```
`LABEL io.modelcontextprotocol.server.name="io.github.username/kubernetes-manager-mcp"
`
```
##
[​
](#mcpb-packages)
MCPB Packages
For MCPB packages, the MCP Registry currently supports MCPB artifacts hosted via GitHub or GitLab releases.
MCPB packages use `"registryType": "mcpb"` in `server.json`. For example:
server.json
```
`{
"$schema": "https://static.modelcontextprotocol.io/schemas/2025-12-11/server.schema.json",
"name": "io.github.username/image-processor-mcp",
"title": "Image Processor",
"description": "Process and transform images with various filters",
"version": "1.0.0",
"packages": [
{
"registryType": "mcpb",
"identifier": "https://github.com/username/image-processor-mcp/releases/download/v1.0.0/image-processor.mcpb",
"fileSha256": "fe333e598595000ae021bd27117db32ec69af6987f507ba7a63c90638ff633ce",
"transport": {
"type": "stdio"
}
}
]
}
`
```
###
[​
](#verification)
Verification
The MCPB package URL (`identifier` in `server.json`) **MUST** contain the string “mcp”. That can be as part of the `.mcpb` file extension or in the name of the repository.
The package metadata in `server.json` **MUST** include a `fileSha256` property with a SHA-256 hash of the MCPB artifact, which can be computed using the `openssl` command:
```
`openssl dgst -sha256 image-processor.mcpb
`
```
The MCP Registry does not validate this hash; however, MCP clients **do** validate the hash before installation to ensure file integrity. Downstream registries may also implement their own validation.