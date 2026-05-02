OpenAI Compliance Logs Platform quickstart
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Dec 11, 2025
# OpenAI Compliance Logs Platform quickstart
[ KV ](https://www.linkedin.com/in/kevinverdieck/)
[ Kevin Verdieck ](https://www.linkedin.com/in/kevinverdieck/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/compliance_api/logs_platform.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/compliance_api/logs_platform.ipynb)
Use this notebook to get started using the OpenAI Compliance Logs Platform. The examples focus on downloading log files so you can ingest them into your SIEM or data lake.
* [Help Center Overview](https://help.openai.com/en/articles/9261474-compliance-api-for-chatgpt-enterprise-edu-and-chatgpt-for-teachers)
* [API Reference](https://chatgpt.com/admin/api-reference#tag/Compliance-API-Logs-Platform)
## Prerequisites
* An Enterprise Compliance API key exported as `COMPLIANCE\_API\_KEY`.
* The ChatGPT account ID or the API Platform Org ID for the principal in question.
* Specific requirements for your environment
## Quickstart Scripts
Provided below are functionally identical scripts - one for Unix-based and one for Windows-based environments.
These scripts give an example of how one could build an integration with the Compliance API to retrieve and process
log data for given event types and time ranges.
These scripts handle listing and paging through the available log files and downloading them - writing the output to stdout.
Example invocations of these scripts are embedded in their help blocks - execute them with no arguments to see them.
## Option 1: Unix-based
Prerequisites:
* Save the script locally as `download\_compliance\_files.sh` and mark it executable
* Make sure you have up-to-date `bash`, `curl`, `sed`, and `date` installed.
* Format the date you want to get every log `after` as an ISO 8601 string including timezone.
Run the script akin to `./download\_compliance\_files.sh \<workspace\_or\_org\_id\> \<event\_type\> \<limit\> \<after\>`
```
`#!/usr/bin/env bash
set -euo pipefail
usage() {
echo "Usage: $0 \<workspace\_or\_org\_id\> \<event\_type\> \<limit\> \<after\>" \>&2
echo \>&2
echo 'Examples: ' \>&2
echo 'COMPLIANCE\_API\_KEY=\<KEY\> ./download\_compliance\_files.sh f7f33107-5fb9-4ee1-8922-3eae76b5b5a0 AUTH\_LOG 100 "$(date -u -v-1d +%Y-%m-%dT%H:%M:%SZ)" \> output.jsonl' \>&2
echo 'COMPLIANCE\_API\_KEY=\<KEY\> ./download\_compliance\_files.sh org-p13k3klgno5cqxbf0q8hpgrk AUTH\_LOG 100 "$(date -u -v-1d +%Y-%m-%dT%H:%M:%SZ)" \> output.jsonl' \>&2
}
if [[ $# -ne 4 ]]; then
usage
exit 2
fi
PRINCIPAL\_ID="$1"
EVENT\_TYPE="$2"
LIMIT="$3"
INITIAL\_AFTER="$4"
# Require COMPLIANCE\_API\_KEY to be present and non-empty before using it
if [[ -z "${COMPLIANCE\_API\_KEY:-}" ]]; then
echo "COMPLIANCE\_API\_KEY environment variable is required. e.g.:" \>&2
echo "COMPLIANCE\_API\_KEY=\<KEY\> $0 \<workspace\_or\_org\_id\> \<event\_type\> \<limit\> \<after\>" \>&2
exit 2
fi
API\_BASE="https://api.chatgpt.com/v1/compliance"
AUTH\_HEADER=("-H" "Authorization: Bearer ${COMPLIANCE\_API\_KEY}")
# Determine whether the first arg is a workspace ID or an org ID.
# If it starts with "org-" treat it as an organization ID and switch the path segment accordingly.
SCOPE\_SEGMENT="workspaces"
if [[ "${PRINCIPAL\_ID}" == org-\* ]]; then
SCOPE\_SEGMENT="organizations"
fi
# Perform a curl request and fail fast on HTTP errors, logging context to stderr.
# Usage: perform\_curl "description of action" \<curl args...\>
perform\_curl() {
local description="$1"
shift
# Capture body and HTTP status code, keeping body on stdout-like var
# We append a newline before the status to reliably split even if body has no trailing newline.
local combined
if ! combined=$(curl -sS -w "\\n%{http\_code}" "$@"); then
echo "Network/transport error while ${description}" \>&2
exit 1
fi
local http\_code
http\_code="${combined##\*$'\\n'}"
local body
body="${combined%$'\\n'\*}"
if [[ ! "${http\_code}" =\~ ^2[0-9][0-9]$ ]]; then
echo "HTTP error ${http\_code} while ${description}:" \>&2
if [[ -n "${body}" ]]; then
# Print the body to stderr so it doesn't corrupt stdout stream
echo "${body}" | jq . \>&2
fi
exit 1
fi
# On success, emit body to stdout for callers to consume
echo "${body}"
}
list\_logs() {
local after="$1"
perform\_curl "listing logs (after=${after}, event\_type=${EVENT\_TYPE}, limit=${LIMIT})" \\
-G \\
"${API\_BASE}/${SCOPE\_SEGMENT}/${PRINCIPAL\_ID}/logs" \\
"${AUTH\_HEADER[@]}" \\
--data-urlencode "limit=${LIMIT}" \\
--data-urlencode "event\_type=${EVENT\_TYPE}" \\
--data-urlencode "after=${after}"
}
download\_log() {
local id="$1"
echo "Fetching logs for ID: ${id}" \>&2
perform\_curl "downloading log id=${id}" \\
-G -L \\
"${API\_BASE}/${SCOPE\_SEGMENT}/${PRINCIPAL\_ID}/logs/${id}" \\
"${AUTH\_HEADER[@]}"
}
to\_local\_human() {
local iso="$1"
if [[ -z "${iso}" || "${iso}" == "null" ]]; then
echo ""
return 0
fi
local iso\_norm
iso\_norm=$(echo -n "${iso}" \\
| sed -E 's/\\.[0-9]+(Z|[+-][0-9:]+)$/\\1/' \\
| sed -E 's/([+-]00:00)$/Z/')
# macOS/BSD date: parse UTC to epoch then format in local timezone
local epoch
epoch=$(date -j -u -f "%Y-%m-%dT%H:%M:%SZ" "${iso\_norm}" +%s 2\>/dev/null) || true
if [[ -n "${epoch}" ]]; then
date -r "${epoch}" "+%Y-%m-%d %H:%M:%S %Z" 2\>/dev/null && return 0
fi
# Fallback to original if parsing failed
echo "${iso}"
}
current\_after="${INITIAL\_AFTER}"
page=1
total\_downloaded=0
while true; do
echo "Fetching page ${page} with after='${current\_after}' (local: $(to\_local\_human "${current\_after}"))" \>&2
response\_json="$(list\_logs "${current\_after}")"
# Count and download each ID from the current page (if any)
page\_count="$(echo "${response\_json}" | jq '.data | length')"
if [[ "${page\_count}" -gt 0 ]]; then
echo "${response\_json}" | jq -r '.data[].id' | while read -r id; do
download\_log "${id}"
done
total\_downloaded=$((total\_downloaded + page\_count))
fi
has\_more="$(echo "${response\_json}" | jq -r '.has\_more')"
current\_after="$(echo "${response\_json}" | jq -r '.last\_end\_time')"
if [[ "${has\_more}" == "true" ]]; then
page=$((page + 1))
else
break
fi
done
if [[ "${total\_downloaded}" -eq 0 && ( -z "${current\_after}" || "${current\_after}" == "null" ) ]]; then
echo "No results found for event\_type ${EVENT\_TYPE} after ${INITIAL\_AFTER}" \>&2
else
echo "Completed downloading ${total\_downloaded} log files up to ${current\_after} (local: $(to\_local\_human "${current\_after}"))" \>&2
fi`
```
## Option 2: Windows-based
Prerequisites:
* Save the script locally as `download\_compliance\_files.ps1`
* Open PowerShell (Version 5.1+) and navigate to the directory where the script is saved.
Run the script akin to `.\\download\_compliance\_files.ps1 \<workspace\_or\_org\_id\> \<event\_type\> \<limit\> \<after\>`
```
`#!/usr/bin/env pwsh
#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Web
function Show-Usage {
[Console]::Error.WriteLine(@"
Usage: .\\download\_compliance\_files.ps1 \<workspace\_or\_org\_id\> \<event\_type\> \<limit\> \<after\>
Example:
`$env:COMPLIANCE\_API\_KEY = '\<KEY\>'
.\\download\_compliance\_files.ps1 f7f33107-5fb9-4ee1-8922-3eae76b5b5a0 AUTH\_LOG 100 (Get-Date -AsUTC).AddDays(-1).ToString('yyyy-MM-ddTHH:mm:ssZ') |
Out-File -Encoding utf8 output.jsonl
Example (org id):
`$env:COMPLIANCE\_API\_KEY = '\<KEY\>'
.\\download\_compliance\_files.ps1 org-p13k3klgno5cqxbf0q8hpgrk AUTH\_LOG 100 (Get-Date -AsUTC).AddDays(-1).ToString('yyyy-MM-ddTHH:mm:ssZ') |
Out-File -Encoding utf8 output.jsonl
"@)
}
if ($args.Count -ne 4) {
Show-Usage
exit 2
}
if (-not $env:COMPLIANCE\_API\_KEY) {
[Console]::Error.WriteLine('COMPLIANCE\_API\_KEY environment variable must be set.')
exit 2
}
$PrincipalId = $args[0]
$EventType = $args[1]
$Limit = $args[2]
$InitialAfter = $args[3]
$ApiBase = 'https://api.chatgpt.com/v1/compliance'
if ($PrincipalId.StartsWith('org-')) {
$ScopeSegment = 'organizations'
} else {
$ScopeSegment = 'workspaces'
}
$handler = [System.Net.Http.HttpClientHandler]::new()
$client = [System.Net.Http.HttpClient]::new($handler)
$client.DefaultRequestHeaders.Authorization = New-Object System.Net.Http.Headers.AuthenticationHeaderValue('Bearer', $env:COMPLIANCE\_API\_KEY)
function Invoke-ComplianceRequest {
param(
[Parameter(Mandatory = $true)] [string] $Description,
[Parameter(Mandatory = $true)] [string] $Path,
[hashtable] $Query = @{}
)
$builder = [System.UriBuilder]::new("$ApiBase/$ScopeSegment/$PrincipalId/$Path")
$queryString = [System.Web.HttpUtility]::ParseQueryString($builder.Query)
foreach ($key in $Query.Keys) {
$queryString[$key] = $Query[$key]
}
$builder.Query = $queryString.ToString()
try {
$response = $client.GetAsync($builder.Uri).GetAwaiter().GetResult()
} catch {
[Console]::Error.WriteLine("Network/transport error while $Description")
exit 1
}
$body = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()
if (-not $response.IsSuccessStatusCode) {
[Console]::Error.WriteLine("HTTP error $($response.StatusCode.value\_\_) while ${Description}:")
if ($body) {
try {
$parsed = $body | ConvertFrom-Json
$parsed | ConvertTo-Json -Depth 10 | Write-Error
} catch {
[Console]::Error.WriteLine($body)
}
}
exit 1
}
Write-Output $body
}
function List-Logs {
param(
[Parameter(Mandatory = $true)] [string] $After
)
Invoke-ComplianceRequest -Description "listing logs (after=$After, event\_type=$EventType, limit=$Limit)" -Path 'logs' -Query @{
limit = $Limit
event\_type = $EventType
after = $After
}
}
function Download-Log {
param(
[Parameter(Mandatory = $true)] [string] $Id
)
[Console]::Error.WriteLine("Fetching logs for ID: $Id")
Invoke-ComplianceRequest -Description "downloading log id=$Id" -Path "logs/$Id"
}
function ConvertTo-LocalHuman {
param(
[string] $Iso
)
if (-not $Iso -or $Iso -eq 'null') {
return ''
}
try {
$dt = [datetimeoffset]::Parse($Iso)
return $dt.ToLocalTime().ToString('yyyy-MM-dd HH:mm:ss zzz')
} catch {
return $Iso
}
}
$currentAfter = $InitialAfter
$page = 1
$totalDownloaded = 0
while ($true) {
[Console]::Error.WriteLine("Fetching page $page with after='$currentAfter' (local: $(ConvertTo-LocalHuman -Iso $currentAfter))")
$responseJson = List-Logs -After $currentAfter
$responseObj = $responseJson | ConvertFrom-Json
$pageCount = $responseObj.data.Count
if ($pageCount -gt 0) {
foreach ($entry in $responseObj.data) {
Download-Log -Id $entry.id
}
$totalDownloaded += $pageCount
}
$hasMore = $false
if ($null -ne $responseObj.has\_more) {
$hasMore = [System.Convert]::ToBoolean($responseObj.has\_more)
}
$currentAfter = $responseObj.last\_end\_time
if ($hasMore) {
$page += 1
} else {
break
}
}
if ($totalDownloaded -eq 0 -and ([string]::IsNullOrEmpty($currentAfter) -or $currentAfter -eq 'null')) {
[Console]::Error.WriteLine("No results found for event\_type $EventType after $InitialAfter")
} else {
[Console]::Error.WriteLine("Completed downloading $totalDownloaded log files up to $currentAfter (local: $(ConvertTo-LocalHuman -Iso $currentAfter))")
}
$client.Dispose()
$handler.Dispose()`
```