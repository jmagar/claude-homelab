versions - FastMCP
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
](#fastmcp-utilities-versions)
`fastmcp.utilities.versions`
Version comparison utilities for component versioning.
This module provides utilities for comparing component versions. Versions are
strings that are first attempted to be parsed as PEP 440 versions (using the
`packaging` library), falling back to lexicographic string comparison.
Examples:
* “1”, “2”, “10” → parsed as PEP 440, compared semantically (1 \< 2 \< 10)
* “1.0”, “2.0” → parsed as PEP 440
* “v1.0” → ‘v’ prefix stripped, parsed as “1.0”
* “2025-01-15” → not valid PEP 440, compared as strings
* None → sorts lowest (unversioned components)
##
[​
](#functions)
Functions
###
[​
](#parse_version_key)
`parse\_version\_key` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L190)
```
`parse\_version\_key(version: str | None) -\> VersionKey
`
```
Parse a version string into a sortable key.
**Args:**
* `version`: The version string, or None for unversioned.
**Returns:**
* A VersionKey suitable for sorting.
###
[​
](#version_sort_key)
`version\_sort\_key` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L202)
```
`version\_sort\_key(component: FastMCPComponent) -\> VersionKey
`
```
Get a sort key for a component based on its version.
Use with sorted() or max() to order components by version.
**Args:**
* `component`: The component to get a sort key for.
**Returns:**
* A sortable VersionKey.
###
[​
](#compare_versions)
`compare\_versions` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L222)
```
`compare\_versions(a: str | None, b: str | None) -\> int
`
```
Compare two version strings.
**Args:**
* `a`: First version string (or None).
* `b`: Second version string (or None).
**Returns:**
* -1 if a \< b, 0 if a == b, 1 if a \> b.
###
[​
](#is_version_greater)
`is\_version\_greater` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L244)
```
`is\_version\_greater(a: str | None, b: str | None) -\> bool
`
```
Check if version a is greater than version b.
**Args:**
* `a`: First version string (or None).
* `b`: Second version string (or None).
**Returns:**
* True if a \> b, False otherwise.
###
[​
](#max_version)
`max\_version` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L257)
```
`max\_version(a: str | None, b: str | None) -\> str | None
`
```
Return the greater of two versions.
**Args:**
* `a`: First version string (or None).
* `b`: Second version string (or None).
**Returns:**
* The greater version, or None if both are None.
###
[​
](#min_version)
`min\_version` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L274)
```
`min\_version(a: str | None, b: str | None) -\> str | None
`
```
Return the lesser of two versions.
**Args:**
* `a`: First version string (or None).
* `b`: Second version string (or None).
**Returns:**
* The lesser version, or None if both are None.
###
[​
](#dedupe_with_versions)
`dedupe\_with\_versions` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L291)
```
`dedupe\_with\_versions(components: Sequence[C], key\_fn: Callable[[C], str]) -\> list[C]
`
```
Deduplicate components by key, keeping highest version.
Groups components by key, selects the highest version from each group,
and injects available versions into meta if any component is versioned.
**Args:**
* `components`: Sequence of components to deduplicate.
* `key\_fn`: Function to extract the grouping key from a component.
**Returns:**
* Deduplicated list with versions injected into meta.
##
[​
](#classes)
Classes
###
[​
](#versionspec)
`VersionSpec` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L31)
Specification for filtering components by version.
Used by transforms and providers to filter components to a specific
version or version range. Unversioned components (version=None) always
match any spec.
**Args:**
* `gte`: If set, only versions \>= this value match.
* `lt`: If set, only versions \< this value match.
* `eq`: If set, only this exact version matches (gte/lt ignored).
**Methods:**
####
[​
](#matches)
`matches` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L48)
```
`matches(self, version: str | None) -\> bool
`
```
Check if a version matches this spec.
**Args:**
* `version`: The version to check, or None for unversioned.
* `match\_none`: Whether unversioned (None) components match. Defaults to True
for backward compatibility with retrieval operations. Set to False
when filtering (e.g., enable/disable) to exclude unversioned components
from version-specific rules.
**Returns:**
* True if the version matches the spec.
####
[​
](#intersect)
`intersect` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L81)
```
`intersect(self, other: VersionSpec | None) -\> VersionSpec
`
```
Return a spec that satisfies both this spec and other.
Used by transforms to combine caller constraints with filter constraints.
For example, if a VersionFilter has lt=“3.0” and caller requests eq=“1.0”,
the intersection validates “1.0” is in range and returns the exact spec.
**Args:**
* `other`: Another spec to intersect with, or None.
**Returns:**
* A VersionSpec that matches only versions satisfying both specs.
###
[​
](#versionkey)
`VersionKey` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/utilities/versions.py#L117)
A comparable version key that handles None, PEP 440 versions, and strings.
Comparison order:
1. None (unversioned) sorts lowest
2. PEP 440 versions sort by semantic version order
3. Invalid versions (strings) sort lexicographically
4. When comparing PEP 440 vs string, PEP 440 comes first