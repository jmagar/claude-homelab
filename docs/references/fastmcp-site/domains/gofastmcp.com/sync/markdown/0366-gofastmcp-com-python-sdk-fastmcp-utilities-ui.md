ui - FastMCP
SDK Reference
* [Python SDK](/python-sdk/fastmcp-decorators)
* [
decorators
](/python-sdk/fastmcp-decorators)
* [
dependencies
](/python-sdk/fastmcp-dependencies)
* [
exceptions
](/python-sdk/fastmcp-exceptions)
* [
mcp\_config
](/python-sdk/fastmcp-mcp_config)
* [
settings
](/python-sdk/fastmcp-settings)
* [
telemetry
](/python-sdk/fastmcp-telemetry)
* [
types
](/python-sdk/fastmcp-types)
##### fastmcp.apps
* [
\_\_init\_\_
](/python-sdk/fastmcp-apps-__init__)
* [
app
](/python-sdk/fastmcp-apps-app)
* [
approval
](/python-sdk/fastmcp-apps-approval)
* [
choice
](/python-sdk/fastmcp-apps-choice)
* [
config
](/python-sdk/fastmcp-apps-config)
* [
file\_upload
](/python-sdk/fastmcp-apps-file_upload)
* [
form
](/python-sdk/fastmcp-apps-form)
* [
generative
](/python-sdk/fastmcp-apps-generative)
##### fastmcp.cli
* [
\_\_init\_\_
](/python-sdk/fastmcp-cli-__init__)
* [
apps\_dev
](/python-sdk/fastmcp-cli-apps_dev)
* [
auth
](/python-sdk/fastmcp-cli-auth)
* [
cimd
](/python-sdk/fastmcp-cli-cimd)
* [
cli
](/python-sdk/fastmcp-cli-cli)
* [
client
](/python-sdk/fastmcp-cli-client)
* [
discovery
](/python-sdk/fastmcp-cli-discovery)
* [
generate
](/python-sdk/fastmcp-cli-generate)
*
install
* [
run
](/python-sdk/fastmcp-cli-run)
* [
tasks
](/python-sdk/fastmcp-cli-tasks)
##### fastmcp.client
* [
\_\_init\_\_
](/python-sdk/fastmcp-client-__init__)
*
auth
* [
client
](/python-sdk/fastmcp-client-client)
* [
elicitation
](/python-sdk/fastmcp-client-elicitation)
* [
logging
](/python-sdk/fastmcp-client-logging)
* [
messages
](/python-sdk/fastmcp-client-messages)
*
mixins
* [
oauth\_callback
](/python-sdk/fastmcp-client-oauth_callback)
* [
progress
](/python-sdk/fastmcp-client-progress)
* [
roots
](/python-sdk/fastmcp-client-roots)
*
sampling
* [
tasks
](/python-sdk/fastmcp-client-tasks)
* [
telemetry
](/python-sdk/fastmcp-client-telemetry)
*
transports
##### fastmcp.experimental
* [
\_\_init\_\_
](/python-sdk/fastmcp-experimental-__init__)
*
sampling
*
transforms
##### fastmcp.prompts
* [
\_\_init\_\_
](/python-sdk/fastmcp-prompts-__init__)
* [
base
](/python-sdk/fastmcp-prompts-base)
* [
function\_prompt
](/python-sdk/fastmcp-prompts-function_prompt)
##### fastmcp.resources
* [
\_\_init\_\_
](/python-sdk/fastmcp-resources-__init__)
* [
base
](/python-sdk/fastmcp-resources-base)
* [
function\_resource
](/python-sdk/fastmcp-resources-function_resource)
* [
template
](/python-sdk/fastmcp-resources-template)
* [
types
](/python-sdk/fastmcp-resources-types)
##### fastmcp.server
* [
\_\_init\_\_
](/python-sdk/fastmcp-server-__init__)
* [
app
](/python-sdk/fastmcp-server-app)
* [
apps
](/python-sdk/fastmcp-server-apps)
*
auth
* [
context
](/python-sdk/fastmcp-server-context)
* [
dependencies
](/python-sdk/fastmcp-server-dependencies)
* [
elicitation
](/python-sdk/fastmcp-server-elicitation)
* [
event\_store
](/python-sdk/fastmcp-server-event_store)
* [
http
](/python-sdk/fastmcp-server-http)
* [
lifespan
](/python-sdk/fastmcp-server-lifespan)
* [
low\_level
](/python-sdk/fastmcp-server-low_level)
*
middleware
*
mixins
*
openapi
*
providers
* [
proxy
](/python-sdk/fastmcp-server-proxy)
*
sampling
* [
server
](/python-sdk/fastmcp-server-server)
*
tasks
* [
telemetry
](/python-sdk/fastmcp-server-telemetry)
*
transforms
##### fastmcp.tools
* [
\_\_init\_\_
](/python-sdk/fastmcp-tools-__init__)
* [
base
](/python-sdk/fastmcp-tools-base)
* [
function\_parsing
](/python-sdk/fastmcp-tools-function_parsing)
* [
function\_tool
](/python-sdk/fastmcp-tools-function_tool)
* [
tool\_transform
](/python-sdk/fastmcp-tools-tool_transform)
##### fastmcp.utilities
* [
\_\_init\_\_
](/python-sdk/fastmcp-utilities-__init__)
* [
async\_utils
](/python-sdk/fastmcp-utilities-async_utils)
* [
auth
](/python-sdk/fastmcp-utilities-auth)
* [
cli
](/python-sdk/fastmcp-utilities-cli)
* [
components
](/python-sdk/fastmcp-utilities-components)
* [
exceptions
](/python-sdk/fastmcp-utilities-exceptions)
* [
http
](/python-sdk/fastmcp-utilities-http)
* [
inspect
](/python-sdk/fastmcp-utilities-inspect)
* [
json\_schema
](/python-sdk/fastmcp-utilities-json_schema)
* [
json\_schema\_type
](/python-sdk/fastmcp-utilities-json_schema_type)
* [
lifespan
](/python-sdk/fastmcp-utilities-lifespan)
* [
logging
](/python-sdk/fastmcp-utilities-logging)
*
mcp\_server\_config
* [
mime
](/python-sdk/fastmcp-utilities-mime)
*
openapi
* [
pagination
](/python-sdk/fastmcp-utilities-pagination)
* [
skills
](/python-sdk/fastmcp-utilities-skills)
* [
tests
](/python-sdk/fastmcp-utilities-tests)
* [
timeout
](/python-sdk/fastmcp-utilities-timeout)
* [
token\_cache
](/python-sdk/fastmcp-utilities-token_cache)
* [
types
](/python-sdk/fastmcp-utilities-types)
* [
ui
](/python-sdk/fastmcp-utilities-ui)
* [
version\_check
](/python-sdk/fastmcp-utilities-version_check)
* [
versions
](/python-sdk/fastmcp-utilities-versions)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
#
[​
](#fastmcp-utilities-ui)
`fastmcp.utilities.ui`
Shared UI utilities for FastMCP HTML pages.
This module provides reusable HTML/CSS components for OAuth callbacks,
consent pages, and other user-facing interfaces.
##
[​
](#functions)
Functions
###
[​
](#create_page)
`create\_page` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/ui.py#L453)
```
`create\_page(content: str, title: str = 'FastMCP', additional\_styles: str = '', csp\_policy: str = "default-src 'none'; style-src 'unsafe-inline'; img-src https: data:; base-uri 'none'") -\> str
`
```
Create a complete HTML page with FastMCP styling.
**Args:**
* `content`: HTML content to place inside the page
* `title`: Page title
* `additional\_styles`: Extra CSS to include
* `csp\_policy`: Content Security Policy header value.
If empty string "", the CSP meta tag is omitted entirely.
**Returns:**
* Complete HTML page as string
###
[​
](#create_logo)
`create\_logo` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/ui.py#L501)
```
`create\_logo(icon\_url: str | None = None, alt\_text: str = 'FastMCP') -\> str
`
```
Create logo HTML.
**Args:**
* `icon\_url`: Optional custom icon URL. If not provided, uses the FastMCP logo.
* `alt\_text`: Alt text for the logo image.
**Returns:**
* HTML for logo image tag.
###
[​
](#create_status_message)
`create\_status\_message` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/ui.py#L516)
```
`create\_status\_message(message: str, is\_success: bool = True) -\> str
`
```
Create a status message with icon.
**Args:**
* `message`: Status message text
* `is\_success`: True for success (✓), False for error (✕)
**Returns:**
* HTML for status message
###
[​
](#create_info_box)
`create\_info\_box` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/ui.py#L539)
```
`create\_info\_box(content: str, is\_error: bool = False, centered: bool = False, monospace: bool = False) -\> str
`
```
Create an info box.
**Args:**
* `content`: HTML content for the info box
* `is\_error`: True for error styling, False for normal
* `centered`: True to center the text, False for left-aligned
* `monospace`: True to use gray monospace font styling instead of blue
**Returns:**
* HTML for info box
###
[​
](#create_detail_box)
`create\_detail\_box` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/ui.py#L568)
```
`create\_detail\_box(rows: list[tuple[str, str]]) -\> str
`
```
Create a detail box with key-value pairs.
**Args:**
* `rows`: List of (label, value) tuples
**Returns:**
* HTML for detail box
###
[​
](#create_button_group)
`create\_button\_group` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/ui.py#L591)
```
`create\_button\_group(buttons: list[tuple[str, str, str]]) -\> str
`
```
Create a group of buttons.
**Args:**
* `buttons`: List of (text, value, css\_class) tuples
**Returns:**
* HTML for button group
###
[​
](#create_secure_html_response)
`create\_secure\_html\_response` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/ui.py#L609)
```
`create\_secure\_html\_response(html: str, status\_code: int = 200) -\> HTMLResponse
`
```
Create an HTMLResponse with security headers.
Adds X-Frame-Options: DENY to prevent clickjacking attacks per MCP security best practices.
**Args:**
* `html`: HTML content to return
* `status\_code`: HTTP status code
**Returns:**
* HTMLResponse with security headers