File Upload - FastMCP
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
* [
Approval
NEW
](/apps/providers/approval)
* [
Choice
NEW
](/apps/providers/choice)
* [
File Upload
NEW
](/apps/providers/file-upload)
* [
Form Input
NEW
](/apps/providers/form)
* [
Generative UI
NEW
](/apps/providers/generative)
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
`FileUpload` adds drag-and-drop file upload to any server. Users upload files through an interactive UI, bypassing the LLM context window entirely. The LLM can then list and read uploaded files through model-visible tools.
```
`from fastmcp import FastMCP
from fastmcp.apps.file\_upload import FileUpload
mcp = FastMCP("My Server")
mcp.add\_provider(FileUpload())
`
```
This registers four tools:
|Tool|Visibility|Purpose|
|`file\_manager`|Model|Opens the drag-and-drop upload UI|
|`store\_files`|App only|Called by the UI when the user clicks Upload|
|`list\_files`|Model|Returns metadata for all uploaded files|
|`read\_file`|Model|Returns a file’s contents by name|
The LLM sees `file\_manager`, `list\_files`, and `read\_file`. It calls `file\_manager` to show the upload interface, then uses `list\_files` and `read\_file` to work with whatever the user uploaded. `store\_files` is app-only — the UI calls it directly and the LLM never needs to know about it.
##
[​
](#configuration)
Configuration
```
`FileUpload(
name="Files", # App name (used in tool routing)
max\_file\_size=10 \* 1024 \* 1024, # 10 MB default, enforced server-side
title="File Upload", # Heading shown in the UI
description="Drop files to...", # Description text below the heading
drop\_label="Drop files here", # Label inside the drop zone
)
`
```
The `max\_file\_size` limit is enforced both in the UI (the DropZone rejects oversized files) and on the server (the `store\_files` tool validates before calling `on\_store`).
##
[​
](#storage-scoping)
Storage Scoping
By default, files are stored in memory and scoped by MCP session ID. Each session gets its own isolated file store — files uploaded in one conversation aren’t visible in another.
This works with **stdio**, **SSE**, and **stateful HTTP** transports, where sessions persist across requests.
In **stateless HTTP** mode, each request creates a new session object with a new ID. Files stored during one request (e.g. the UI upload) will be invisible to the next request (e.g. the LLM calling `list\_files`). You **must** override `\_get\_scope\_key` to use a stable identifier like a user ID from your auth token.
For stateless deployments, override `\_get\_scope\_key` to return a stable identifier. For example, to scope files by authenticated user:
```
`from fastmcp.apps.file\_upload import FileUpload
class UserScopedUpload(FileUpload):
def \_get\_scope\_key(self, ctx):
return ctx.access\_token["sub"]
`
```
For process-wide shared storage (all users see all files):
```
`class SharedUpload(FileUpload):
def \_get\_scope\_key(self, ctx):
return "\_\_shared\_\_"
`
```
##
[​
](#custom-storage)
Custom Storage
The default implementation stores files in memory for the lifetime of the server process. For persistent storage, subclass `FileUpload` and override three methods. Each receives the current `Context`, giving you access to session IDs, auth tokens, and request metadata for partitioning and authorization.
```
`import base64
from fastmcp.apps.file\_upload import FileUpload
class S3Upload(FileUpload):
def on\_store(self, files, ctx):
user\_id = ctx.access\_token["sub"]
for f in files:
s3.put\_object(
Bucket="uploads",
Key=f"{user\_id}/{f['name']}",
Body=base64.b64decode(f["data"]),
)
return self.on\_list(ctx)
def on\_list(self, ctx):
user\_id = ctx.access\_token["sub"]
objects = s3.list\_objects(Bucket="uploads", Prefix=f"{user\_id}/")
return [
{
"name": obj["Key"].split("/", 1)[1],
"type": "application/octet-stream",
"size": obj["Size"],
"size\_display": f"{obj['Size']} B",
"uploaded\_at": obj["LastModified"].isoformat(),
}
for obj in objects.get("Contents", [])
]
def on\_read(self, name, ctx):
user\_id = ctx.access\_token["sub"]
obj = s3.get\_object(Bucket="uploads", Key=f"{user\_id}/{name}")
content = obj["Body"].read()
return {
"name": name,
"size": obj["ContentLength"],
"type": obj["ContentType"],
"uploaded\_at": obj["LastModified"].isoformat(),
"content": content.decode("utf-8"),
}
`
```
Each file dict passed to `on\_store` contains `name`, `size`, `type`, and `data` (base64-encoded content). The return value from `on\_store` and `on\_list` should be a list of summary dicts with `name`, `type`, `size`, `size\_display`, and `uploaded\_at` fields — these populate the file list in the UI.
`on\_read` returns a dict with file metadata and either `content` (decoded text) or `content\_base64` (a base64 preview for binary files).