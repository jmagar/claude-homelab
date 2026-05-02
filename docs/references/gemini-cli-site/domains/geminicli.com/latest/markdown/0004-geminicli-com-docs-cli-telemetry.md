Observability with OpenTelemetry | Gemini CLI
[Skip to content](#_top)
# Observability with OpenTelemetry
Copy as Markdown Copied!
Observability is the key to turning experimental AI into reliable software.
Gemini CLI provides built-in support for OpenTelemetry, transforming every agent
interaction into a rich stream of logs, metrics, and traces. This three-pillar
approach gives you the high-fidelity visibility needed to understand agent
behavior, optimize performance, and ensure reliability across your entire
workflow.
Whether you are debugging a complex tool interaction locally or monitoring
enterprise-wide usage in the cloud, Gemini CLI’s observability system provides
the actionable intelligence needed to move from “black box” AI to predictable,
high-performance systems.
## OpenTelemetry integration
[Section titled “OpenTelemetry integration”](#opentelemetry-integration)
Gemini CLI integrates with **[OpenTelemetry](https://opentelemetry.io/)**, a vendor-neutral,
industry-standard observability framework.
The observability system provides:
* Universal compatibility: Export to any OpenTelemetry backend (Google Cloud,
Jaeger, Prometheus, Datadog, etc.).
* Standardized data: Use consistent formats and collection methods across your
toolchain.
* Future-proof integration: Connect with existing and future observability
infrastructure.
* No vendor lock-in: Switch between backends without changing your
instrumentation.
## Configuration
[Section titled “Configuration”](#configuration)
You control telemetry behavior through the `.gemini/settings.json` file.
Environment variables can override these settings.
|Setting|Environment Variable|Description|Values|Default|
|`enabled`|`GEMINI\_TELEMETRY\_ENABLED`|Enable or disable telemetry|`true`/`false`|`false`|
|`traces`|`GEMINI\_TELEMETRY\_TRACES\_ENABLED`|Enable detailed attribute tracing|`true`/`false`|`false`|
|`target`|`GEMINI\_TELEMETRY\_TARGET`|Where to send telemetry data|`"gcp"`/`"local"`|`"local"`|
|`otlpEndpoint`|`GEMINI\_TELEMETRY\_OTLP\_ENDPOINT`|OTLP collector endpoint|URL string|`http://localhost:4317`|
|`otlpProtocol`|`GEMINI\_TELEMETRY\_OTLP\_PROTOCOL`|OTLP transport protocol|`"grpc"`/`"http"`|`"grpc"`|
|`outfile`|`GEMINI\_TELEMETRY\_OUTFILE`|Save telemetry to file (overrides `otlpEndpoint`)|file path|-|
|`logPrompts`|`GEMINI\_TELEMETRY\_LOG\_PROMPTS`|Include prompts in telemetry logs|`true`/`false`|`true`|
|`useCollector`|`GEMINI\_TELEMETRY\_USE\_COLLECTOR`|Use external OTLP collector (advanced)|`true`/`false`|`false`|
|`useCliAuth`|`GEMINI\_TELEMETRY\_USE\_CLI\_AUTH`|Use CLI credentials for telemetry (GCP target only)|`true`/`false`|`false`|
|-|`GEMINI\_CLI\_SURFACE`|Optional custom label for traffic reporting|string|-|
**Note on boolean environment variables:** For boolean settings like `enabled`,
setting the environment variable to `true` or `1` enables the feature.
For detailed configuration information, see the
[Configuration guide](/docs/reference/configuration).
## Google Cloud telemetry
[Section titled “Google Cloud telemetry”](#google-cloud-telemetry)
You can export telemetry data directly to Google Cloud Trace, Cloud Monitoring,
and Cloud Logging.
### Prerequisites
[Section titled “Prerequisites”](#prerequisites)
You must complete several setup steps before enabling Google Cloud telemetry.
1. Set your Google Cloud project ID:
* To send telemetry to a separate project:
**macOS/Linux**
Terminal window
```
`
export OTLP\_GOOGLE\_CLOUD\_PROJECT="your-telemetry-project-id"
`
```
**Windows (PowerShell)**
Terminal window
```
`
$env:OTLP\_GOOGLE\_CLOUD\_PROJECT="your-telemetry-project-id"
`
```
* To send telemetry to the same project as inference:
**macOS/Linux**
Terminal window
```
`
export GOOGLE\_CLOUD\_PROJECT="your-project-id"
`
```
**Windows (PowerShell)**
Terminal window
```
`
$env:GOOGLE\_CLOUD\_PROJECT="your-project-id"
`
```
* Authenticate with Google Cloud using one of these methods:
* **Method A: Application Default Credentials (ADC)**: Use this method for
service accounts or standard `gcloud` authentication.
* For user accounts:
Terminal window
```
`
gcloud auth application-default login
`
```
* For service accounts:
**macOS/Linux**
Terminal window
```
`
export GOOGLE\_APPLICATION\_CREDENTIALS="/path/to/your/service-account.json"
`
```
**Windows (PowerShell)**
Terminal window
```
`
$env:GOOGLE\_APPLICATION\_CREDENTIALS="C:\\path\\to\\your\\service-account.json"
`
```
* **Method B: CLI Auth** (Direct export only): Simplest method for local
users. Gemini CLI uses the same OAuth credentials you used for login. To
enable this, set `useCliAuth: true` in your `.gemini/settings.json`:
```
`
{
"telemetry": {
"enabled": true,
"target": "gcp",
"useCliAuth": true
}
}
`
```
This setting requires **Direct export** (in-process exporters)
and cannot be used when `useCollector` is `true`. If both are enabled,
telemetry will be disabled.
1. Ensure your account or service account has these IAM roles:
* Cloud Trace Agent
* Monitoring Metric Writer
* Logs Writer
* Enable the required Google Cloud APIs:
Terminal window
```
`
gcloud services enable \\
cloudtrace.googleapis.com \\
monitoring.googleapis.com \\
logging.googleapis.com \\
--project="$OTLP\_GOOGLE\_CLOUD\_PROJECT"
`
```
### Direct export
[Section titled “Direct export”](#direct-export)
We recommend using direct export to send telemetry directly to Google Cloud
services.
1. Enable telemetry in `.gemini/settings.json`:
```
`
{
"telemetry": {
"enabled": true,
"target": "gcp"
}
}
`
```
2. Run Gemini CLI and send prompts.
3. View logs, metrics, and traces in the Google Cloud Console. See
[View Google Cloud telemetry](#view-google-cloud-telemetry) for details.
### View Google Cloud telemetry
[Section titled “View Google Cloud telemetry”](#view-google-cloud-telemetry)
After you enable telemetry and run Gemini CLI, you can view your data in the
Google Cloud Console.
* **Logs:** [Logs Explorer](https://console.cloud.google.com/logs/)
* **Metrics:**
[Metrics Explorer](https://console.cloud.google.com/monitoring/metrics-explorer)
* **Traces:** [Trace Explorer](https://console.cloud.google.com/traces/list)
For detailed information on how to use these tools, see the following official
Google Cloud documentation:
* [View and analyze logs with Logs Explorer](https://cloud.google.com/logging/docs/view/logs-explorer-interface)
* [Create charts with Metrics Explorer](https://cloud.google.com/monitoring/charts/metrics-explorer)
* [Find and explore traces](https://cloud.google.com/trace/docs/finding-traces)
#### Monitoring dashboards
[Section titled “Monitoring dashboards”](#monitoring-dashboards)
Gemini CLI provides a pre-configured
[Google Cloud Monitoring](https://cloud.google.com/monitoring) dashboard to
visualize your telemetry.
Find this dashboard under **Google Cloud Monitoring Dashboard Templates** as
“**Gemini CLI Monitoring**”.
To learn more, see
[Instant insights: Gemini CLI’s pre-configured monitoring dashboards](https://cloud.google.com/blog/topics/developers-practitioners/instant-insights-gemini-clis-new-pre-configured-monitoring-dashboards/).
## Local telemetry
[Section titled “Local telemetry”](#local-telemetry)
You can capture telemetry data locally for development and debugging. We
recommend using file-based output for local development.
1. Enable telemetry in `.gemini/settings.json`:
```
`
{
"telemetry": {
"enabled": true,
"target": "local",
"outfile": ".gemini/telemetry.log"
}
}
`
```
2. Run Gemini CLI and send prompts.
3. View logs and metrics in `.gemini/telemetry.log`.
For advanced local telemetry setups (such as Jaeger or Genkit), see the
[Local development guide](/docs/local-development#viewing-traces).
## Client identification
[Section titled “Client identification”](#client-identification)
Gemini CLI includes identifiers in its `User-Agent` header to help you
differentiate and report on API traffic from different environments (for
example, identifying calls from Gemini Code Assist versus a standard terminal).
### Automatic identification
[Section titled “Automatic identification”](#automatic-identification)
Most integrated environments are identified automatically without additional
configuration. The identifier is included as a prefix to the `User-Agent` and as
a “surface” tag in the parenthetical metadata.
|Environment|User-Agent Prefix|Surface Tag|
|**Gemini Code Assist (Agent Mode)**|`GeminiCLI-a2a-server`|`vscode`|
|**Zed (via ACP)**|`GeminiCLI-acp-zed`|`zed`|
|**XCode (via ACP)**|`GeminiCLI-acp-xcode`|`xcode`|
|**IntelliJ IDEA (via ACP)**|`GeminiCLI-acp-intellijidea`|`jetbrains`|
|**Standard Terminal**|`GeminiCLI`|`terminal`|
**Example User-Agent:**
`GeminiCLI-a2a-server/0.34.0/gemini-pro (linux; x64; vscode)`
### Custom identification
[Section titled “Custom identification”](#custom-identification)
You can provide a custom identifier for your own scripts or automation by
setting the `GEMINI\_CLI\_SURFACE` environment variable. This is useful for
tracking specific internal tools or distribution channels in your GCP logs.
**macOS/Linux**
Terminal window
```
`
export GEMINI\_CLI\_SURFACE="my-custom-tool"
`
```
**Windows (PowerShell)**
Terminal window
```
`
$env:GEMINI\_CLI\_SURFACE="my-custom-tool"
`
```
When set, the value appears at the end of the `User-Agent` parenthetical:
`GeminiCLI/0.34.0/gemini-pro (linux; x64; my-custom-tool)`
## Logs, metrics, and traces
[Section titled “Logs, metrics, and traces”](#logs-metrics-and-traces)
This section describes the structure of logs, metrics, and traces generated by
Gemini CLI.
Gemini CLI includes `session.id`, `installation.id`, `active\_approval\_mode`, and
`user.email` (when authenticated) as common attributes on all data.
### Logs
[Section titled “Logs”](#logs)
Logs provide timestamped records of specific events. Gemini CLI logs events
across several categories.
#### Sessions
[Section titled “Sessions”](#sessions)
Session logs capture startup configuration and prompt submissions.
##### `gemini\_cli.config`
[Section titled “gemini\_cli.config”](#gemini_cliconfig)
Emitted at startup with the CLI configuration.
Attributes
* `model` (string)
* `embedding\_model` (string)
* `sandbox\_enabled` (boolean)
* `core\_tools\_enabled` (string)
* `approval\_mode` (string)
* `api\_key\_enabled` (boolean)
* `vertex\_ai\_enabled` (boolean)
* `log\_user\_prompts\_enabled` (boolean)
* `file\_filtering\_respect\_git\_ignore` (boolean)
* `debug\_mode` (boolean)
* `mcp\_servers` (string)
* `mcp\_servers\_count` (int)
* `mcp\_tools` (string)
* `mcp\_tools\_count` (int)
* `output\_format` (string)
* `extensions` (string)
* `extension\_ids` (string)
* `extensions\_count` (int)
* `auth\_type` (string)
* `worktree\_active` (boolean)
* `github\_workflow\_name` (string, optional)
* `github\_repository\_hash` (string, optional)
* `github\_event\_name` (string, optional)
* `github\_pr\_number` (string, optional)
* `github\_issue\_number` (string, optional)
* `github\_custom\_tracking\_id` (string, optional)
##### `gemini\_cli.user\_prompt`
[Section titled “gemini\_cli.user\_prompt”](#gemini_cliuser_prompt)
Emitted when you submit a prompt.
Attributes
* `prompt\_length` (int)
* `prompt\_id` (string)
* `prompt` (string; excluded if `telemetry.logPrompts` is `false`)
* `auth\_type` (string)
#### Approval mode
[Section titled “Approval mode”](#approval-mode)
These logs track changes to and usage of different approval modes.
##### Lifecycle
[Section titled “Lifecycle”](#lifecycle)
##### `approval\_mode\_switch`
[Section titled “approval\_mode\_switch”](#approval_mode_switch)
Logs when you change the approval mode.
Attributes
* `from\_mode` (string)
* `to\_mode` (string)
##### `approval\_mode\_duration`
[Section titled “approval\_mode\_duration”](#approval_mode_duration)
Records time spent in an approval mode.
Attributes
* `mode` (string)
* `duration\_ms` (int)
##### Execution
[Section titled “Execution”](#execution)
##### `plan\_execution`
[Section titled “plan\_execution”](#plan_execution)
Logs when you execute a plan and switch from plan mode to active execution.
Attributes
* `approval\_mode` (string)
#### Tools
[Section titled “Tools”](#tools)
Tool logs capture executions, truncation, and edit behavior.
##### `gemini\_cli.tool\_call`
[Section titled “gemini\_cli.tool\_call”](#gemini_clitool_call)
Emitted for each tool (function) call.
Attributes
* `function\_name` (string)
* `function\_args` (string)
* `duration\_ms` (int)
* `success` (boolean)
* `decision` (string: “accept”, “reject”, “auto\_accept”, or “modify”)
* `error` (string, optional)
* `error\_type` (string, optional)
* `prompt\_id` (string)
* `tool\_type` (string: “native” or “mcp”)
* `mcp\_server\_name` (string, optional)
* `extension\_name` (string, optional)
* `extension\_id` (string, optional)
* `content\_length` (int, optional)
* `start\_time` (number, optional)
* `end\_time` (number, optional)
* `metadata` (object, optional), which may include:
* `model\_added\_lines` (number)
* `model\_removed\_lines` (number)
* `user\_added\_lines` (number)
* `user\_removed\_lines` (number)
* `ask\_user` (object)
##### `gemini\_cli.tool\_output\_truncated`
[Section titled “gemini\_cli.tool\_output\_truncated”](#gemini_clitool_output_truncated)
Logs when tool output is truncated.
Attributes
* `tool\_name` (string)
* `original\_content\_length` (int)
* `truncated\_content\_length` (int)
* `threshold` (int)
* `lines` (int)
* `prompt\_id` (string)
##### `gemini\_cli.edit\_strategy`
[Section titled “gemini\_cli.edit\_strategy”](#gemini_cliedit_strategy)
Records the chosen edit strategy.
Attributes
* `strategy` (string)
##### `gemini\_cli.edit\_correction`
[Section titled “gemini\_cli.edit\_correction”](#gemini_cliedit_correction)
Records the result of an edit correction.
Attributes
* `correction` (string: “success” or “failure”)
##### `gen\_ai.client.inference.operation.details`
[Section titled “gen\_ai.client.inference.operation.details”](#gen_aiclientinferenceoperationdetails)
Provides detailed GenAI operation data aligned with OpenTelemetry conventions.
Attributes
* `gen\_ai.request.model` (string)
* `gen\_ai.provider.name` (string)
* `gen\_ai.operation.name` (string)
* `gen\_ai.input.messages` (json string)
* `gen\_ai.output.messages` (json string)
* `gen\_ai.response.finish\_reasons` (array of strings)
* `gen\_ai.usage.input\_tokens` (int)
* `gen\_ai.usage.output\_tokens` (int)
* `gen\_ai.request.temperature` (float)
* `gen\_ai.request.top\_p` (float)
* `gen\_ai.request.top\_k` (int)
* `gen\_ai.request.max\_tokens` (int)
* `gen\_ai.system\_instructions` (json string)
* `server.address` (string)
* `server.port` (int)
#### Files
[Section titled “Files”](#files)
File logs track operations performed by tools.
##### `gemini\_cli.file\_operation`
[Section titled “gemini\_cli.file\_operation”](#gemini_clifile_operation)
Emitted for each file creation, read, or update.
Attributes
* `tool\_name` (string)
* `operation` (string: “create”, “read”, or “update”)
* `lines` (int, optional)
* `mimetype` (string, optional)
* `extension` (string, optional)
* `programming\_language` (string, optional)
#### API
[Section titled “API”](#api)
API logs capture requests, responses, and errors from Gemini API.
##### `gemini\_cli.api\_request`
[Section titled “gemini\_cli.api\_request”](#gemini_cliapi_request)
Request sent to Gemini API.
Attributes
* `model` (string)
* `prompt\_id` (string)
* `role` (string: “user”, “model”, or “system”)
* `request\_text` (string, optional)
##### `gemini\_cli.api\_response`
[Section titled “gemini\_cli.api\_response”](#gemini_cliapi_response)
Response received from Gemini API.
Attributes
* `model` (string)
* `status\_code` (int or string)
* `duration\_ms` (int)
* `input\_token\_count` (int)
* `output\_token\_count` (int)
* `cached\_content\_token\_count` (int)
* `thoughts\_token\_count` (int)
* `tool\_token\_count` (int)
* `total\_token\_count` (int)
* `prompt\_id` (string)
* `auth\_type` (string)
* `finish\_reasons` (array of strings)
* `response\_text` (string, optional)
##### `gemini\_cli.api\_error`
[Section titled “gemini\_cli.api\_error”](#gemini_cliapi_error)
Logs when an API request fails.
Attributes
* `error.message` (string)
* `model\_name` (string)
* `duration` (int)
* `prompt\_id` (string)
* `auth\_type` (string)
* `error\_type` (string, optional)
* `status\_code` (int or string, optional)
* `role` (string, optional)
##### `gemini\_cli.malformed\_json\_response`
[Section titled “gemini\_cli.malformed\_json\_response”](#gemini_climalformed_json_response)
Logs when a JSON response cannot be parsed.
Attributes
* `model` (string)
#### Model routing
[Section titled “Model routing”](#model-routing)
These logs track how Gemini CLI selects and routes requests to models.
##### `gemini\_cli.slash\_command`
[Section titled “gemini\_cli.slash\_command”](#gemini_clislash_command)
Logs slash command execution.
Attributes
* `command` (string)
* `subcommand` (string, optional)
* `status` (string: “success” or “error”)
##### `gemini\_cli.slash\_command.model`
[Section titled “gemini\_cli.slash\_command.model”](#gemini_clislash_commandmodel)
Logs model selection via slash command.
Attributes
* `model\_name` (string)
##### `gemini\_cli.model\_routing`
[Section titled “gemini\_cli.model\_routing”](#gemini_climodel_routing)
Records model router decisions and reasoning.
Attributes
* `decision\_model` (string)
* `decision\_source` (string)
* `routing\_latency\_ms` (int)
* `reasoning` (string, optional)
* `failed` (boolean)
* `error\_message` (string, optional)
* `approval\_mode` (string)
#### Chat and streaming
[Section titled “Chat and streaming”](#chat-and-streaming)
These logs track chat context compression and streaming chunk errors.
##### `gemini\_cli.chat\_compression`
[Section titled “gemini\_cli.chat\_compression”](#gemini_clichat_compression)
Logs chat context compression events.
Attributes
* `tokens\_before` (int)
* `tokens\_after` (int)
##### `gemini\_cli.chat.invalid\_chunk`
[Section titled “gemini\_cli.chat.invalid\_chunk”](#gemini_clichatinvalid_chunk)
Logs invalid chunks received in a stream.
Attributes
* `error\_message` (string, optional)
##### `gemini\_cli.chat.content\_retry`
[Section titled “gemini\_cli.chat.content\_retry”](#gemini_clichatcontent_retry)
Logs retries due to content errors.
Attributes
* `attempt\_number` (int)
* `error\_type` (string)
* `retry\_delay\_ms` (int)
* `model` (string)
##### `gemini\_cli.chat.content\_retry\_failure`
[Section titled “gemini\_cli.chat.content\_retry\_failure”](#gemini_clichatcontent_retry_failure)
Logs when all content retries fail.
Attributes
* `total\_attempts` (int)
* `final\_error\_type` (string)
* `total\_duration\_ms` (int, optional)
* `model` (string)
##### `gemini\_cli.conversation\_finished`
[Section titled “gemini\_cli.conversation\_finished”](#gemini_cliconversation_finished)
Logs when a conversation session ends.
Attributes
* `approvalMode` (string)
* `turnCount` (int)
#### Resilience
[Section titled “Resilience”](#resilience)
Resilience logs record fallback mechanisms and recovery attempts.
##### `gemini\_cli.flash\_fallback`
[Section titled “gemini\_cli.flash\_fallback”](#gemini_cliflash_fallback)
Logs switch to a flash model fallback.
Attributes
* `auth\_type` (string)
##### `gemini\_cli.ripgrep\_fallback`
[Section titled “gemini\_cli.ripgrep\_fallback”](#gemini_cliripgrep_fallback)
Logs fallback to standard grep.
Attributes
* `error` (string, optional)
##### `gemini\_cli.web\_fetch\_fallback\_attempt`
[Section titled “gemini\_cli.web\_fetch\_fallback\_attempt”](#gemini_cliweb_fetch_fallback_attempt)
Logs web-fetch fallback attempts.
Attributes
* `reason` (string: “private\_ip” or “primary\_failed”)
##### `gemini\_cli.agent.recovery\_attempt`
[Section titled “gemini\_cli.agent.recovery\_attempt”](#gemini_cliagentrecovery_attempt)
Logs attempts to recover from agent errors.
Attributes
* `agent\_name` (string)
* `attempt\_number` (int)
* `success` (boolean)
* `error\_type` (string, optional)
#### Extensions
[Section titled “Extensions”](#extensions)
Extension logs track lifecycle events and settings changes.
##### `gemini\_cli.extension\_install`
[Section titled “gemini\_cli.extension\_install”](#gemini_cliextension_install)
Logs when you install an extension.
Attributes
* `extension\_name` (string)
* `extension\_version` (string)
* `extension\_source` (string)
* `status` (string)
##### `gemini\_cli.extension\_uninstall`
[Section titled “gemini\_cli.extension\_uninstall”](#gemini_cliextension_uninstall)
Logs when you uninstall an extension.
Attributes
* `extension\_name` (string)
* `status` (string)
##### `gemini\_cli.extension\_enable`
[Section titled “gemini\_cli.extension\_enable”](#gemini_cliextension_enable)
Logs when you enable an extension.
Attributes
* `extension\_name` (string)
* `setting\_scope` (string)
##### `gemini\_cli.extension\_disable`
[Section titled “gemini\_cli.extension\_disable”](#gemini_cliextension_disable)
Logs when you disable an extension.
Attributes
* `extension\_name` (string)
* `setting\_scope` (string)
#### Agent runs
[Section titled “Agent runs”](#agent-runs)
Agent logs track the lifecycle of agent executions.
##### `gemini\_cli.agent.start`
[Section titled “gemini\_cli.agent.start”](#gemini_cliagentstart)
Logs when an agent run begins.
Attributes
* `agent\_id` (string)
* `agent\_name` (string)
##### `gemini\_cli.agent.finish`
[Section titled “gemini\_cli.agent.finish”](#gemini_cliagentfinish)
Logs when an agent run completes.
Attributes
* `agent\_id` (string)
* `agent\_name` (string)
* `duration\_ms` (int)
* `turn\_count` (int)
* `terminate\_reason` (string)
#### IDE
[Section titled “IDE”](#ide)
IDE logs capture connectivity events for the IDE companion.
##### `gemini\_cli.ide\_connection`
[Section titled “gemini\_cli.ide\_connection”](#gemini_cliide_connection)
Logs IDE companion connections.
Attributes
* `connection\_type` (string)
#### UI
[Section titled “UI”](#ui)
UI logs track terminal rendering issues.
##### `kitty\_sequence\_overflow`
[Section titled “kitty\_sequence\_overflow”](#kitty_sequence_overflow)
Logs terminal control sequence overflows.
Attributes
* `sequence\_length` (int)
* `truncated\_sequence` (string)
#### Miscellaneous
[Section titled “Miscellaneous”](#miscellaneous)
##### `gemini\_cli.rewind`
[Section titled “gemini\_cli.rewind”](#gemini_clirewind)
Logs when the conversation state is rewound.
Attributes
* `outcome` (string)
##### `gemini\_cli.conseca.verdict`
[Section titled “gemini\_cli.conseca.verdict”](#gemini_cliconsecaverdict)
Logs security verdicts from ConSeca.
Attributes
* `verdict` (string)
* `decision` (string: “accept”, “reject”, or “modify”)
* `reason` (string, optional)
* `tool\_name` (string, optional)
##### `gemini\_cli.hook\_call`
[Section titled “gemini\_cli.hook\_call”](#gemini_clihook_call)
Logs execution of lifecycle hooks.
Attributes
* `hook\_name` (string)
* `hook\_type` (string)
* `duration\_ms` (int)
* `success` (boolean)
##### `gemini\_cli.tool\_output\_masking`
[Section titled “gemini\_cli.tool\_output\_masking”](#gemini_clitool_output_masking)
Logs when tool output is masked for privacy.
Attributes
* `tokens\_before` (int)
* `tokens\_after` (int)
* `masked\_count` (int)
* `total\_prunable\_tokens` (int)
##### `gemini\_cli.keychain.availability`
[Section titled “gemini\_cli.keychain.availability”](#gemini_clikeychainavailability)
Logs keychain availability checks.
Attributes
* `available` (boolean)
##### `gemini\_cli.startup\_stats`
[Section titled “gemini\_cli.startup\_stats”](#gemini_clistartup_stats)
Logs detailed startup performance statistics.
Attributes
* `phases` (json array of startup phases)
* `os\_platform` (string)
* `os\_release` (string)
* `is\_docker` (boolean)
### Metrics
[Section titled “Metrics”](#metrics)
Metrics provide numerical measurements of behavior over time.
#### Custom metrics
[Section titled “Custom metrics”](#custom-metrics)
Gemini CLI exports several custom metrics.
##### Sessions
[Section titled “Sessions”](#sessions-1)
##### `gemini\_cli.session.count`
[Section titled “gemini\_cli.session.count”](#gemini_clisessioncount)
Incremented once per CLI startup.
##### Onboarding
[Section titled “Onboarding”](#onboarding)
Tracks onboarding flow from authentication to the user
* `gemini\_cli.onboarding.start` (Counter, Int): Incremented when the
authentication flow begins.
* `gemini\_cli.onboarding.success` (Counter, Int): Incremented when the user
onboarding flow completes successfully.
Attributes (Success)
* `user\_tier` (string)
##### Tools
[Section titled “Tools”](#tools-1)
##### `gemini\_cli.tool.call.count`
[Section titled “gemini\_cli.tool.call.count”](#gemini_clitoolcallcount)
Counts tool calls.
Attributes
* `function\_name` (string)
* `success` (boolean)
* `decision` (string: “accept”, “reject”, “modify”, or “auto\_accept”)
* `tool\_type` (string: “mcp” or “native”)
##### `gemini\_cli.tool.call.latency`
[Section titled “gemini\_cli.tool.call.latency”](#gemini_clitoolcalllatency)
Measures tool call latency (in ms).
Attributes
* `function\_name` (string)
##### API
[Section titled “API”](#api-1)
##### `gemini\_cli.api.request.count`
[Section titled “gemini\_cli.api.request.count”](#gemini_cliapirequestcount)
Counts all API requests.
Attributes
* `model` (string)
* `status\_code` (int or string)
* `error\_type` (string, optional)
##### `gemini\_cli.api.request.latency`
[Section titled “gemini\_cli.api.request.latency”](#gemini_cliapirequestlatency)
Measures API request latency (in ms).
Attributes
* `model` (string)
##### Token usage
[Section titled “Token usage”](#token-usage)
##### `gemini\_cli.token.usage`
[Section titled “gemini\_cli.token.usage”](#gemini_clitokenusage)
Counts input, output, thought, cache, and tool tokens.
Attributes
* `model` (string)
* `type` (string: “input”, “output”, “thought”, “cache”, or “tool”)
##### Files
[Section titled “Files”](#files-1)
##### `gemini\_cli.file.operation.count`
[Section titled “gemini\_cli.file.operation.count”](#gemini_clifileoperationcount)
Counts file operations.
Attributes
* `operation` (string: “create”, “read”, or “update”)
* `lines` (int, optional)
* `mimetype` (string, optional)
* `extension` (string, optional)
* `programming\_language` (string, optional)
##### `gemini\_cli.lines.changed`
[Section titled “gemini\_cli.lines.changed”](#gemini_clilineschanged)
Counts added or removed lines.
Attributes
* `function\_name` (string, optional)
* `type` (string: “added” or “removed”)
##### Chat and streaming
[Section titled “Chat and streaming”](#chat-and-streaming-1)
##### `gemini\_cli.chat\_compression`
[Section titled “gemini\_cli.chat\_compression”](#gemini_clichat_compression-1)
Counts compression operations.
Attributes
* `tokens\_before` (int)
* `tokens\_after` (int)
##### `gemini\_cli.chat.invalid\_chunk.count`
[Section titled “gemini\_cli.chat.invalid\_chunk.count”](#gemini_clichatinvalid_chunkcount)
Counts invalid stream chunks.
##### `gemini\_cli.chat.content\_retry.count`
[Section titled “gemini\_cli.chat.content\_retry.count”](#gemini_clichatcontent_retrycount)
Counts content error retries.
##### `gemini\_cli.chat.content\_retry\_failure.count`
[Section titled “gemini\_cli.chat.content\_retry\_failure.count”](#gemini_clichatcontent_retry_failurecount)
Counts requests where all retries failed.
##### Model routing
[Section titled “Model routing”](#model-routing-1)
##### `gemini\_cli.slash\_command.model.call\_count`
[Section titled “gemini\_cli.slash\_command.model.call\_count”](#gemini_clislash_commandmodelcall_count)
Counts model selections.
Attributes
* `slash\_command.model.model\_name` (string)
##### `gemini\_cli.model\_routing.latency`
[Section titled “gemini\_cli.model\_routing.latency”](#gemini_climodel_routinglatency)
Measures routing decision latency.
Attributes
* `routing.decision\_model` (string)
* `routing.decision\_source` (string)
* `routing.approval\_mode` (string)
##### `gemini\_cli.model\_routing.failure.count`
[Section titled “gemini\_cli.model\_routing.failure.count”](#gemini_climodel_routingfailurecount)
Counts routing failures.
Attributes
* `routing.decision\_source` (string)
* `routing.error\_message` (string)
* `routing.approval\_mode` (string)
##### Agent runs
[Section titled “Agent runs”](#agent-runs-1)
##### `gemini\_cli.agent.run.count`
[Section titled “gemini\_cli.agent.run.count”](#gemini_cliagentruncount)
Counts agent runs.
Attributes
* `agent\_name` (string)
* `terminate\_reason` (string)
##### `gemini\_cli.agent.duration`
[Section titled “gemini\_cli.agent.duration”](#gemini_cliagentduration)
Measures agent run duration.
Attributes
* `agent\_name` (string)
##### `gemini\_cli.agent.turns`
[Section titled “gemini\_cli.agent.turns”](#gemini_cliagentturns)
Counts turns per agent run.
Attributes
* `agent\_name` (string)
##### Approval mode
[Section titled “Approval mode”](#approval-mode-1)
##### `gemini\_cli.plan.execution.count`
[Section titled “gemini\_cli.plan.execution.count”](#gemini_cliplanexecutioncount)
Counts plan executions.
Attributes
* `approval\_mode` (string)
##### UI
[Section titled “UI”](#ui-1)
##### `gemini\_cli.ui.flicker.count`
[Section titled “gemini\_cli.ui.flicker.count”](#gemini_cliuiflickercount)
Counts terminal flicker events.
##### Performance
[Section titled “Performance”](#performance)
Gemini CLI provides detailed performance metrics for advanced monitoring.
##### `gemini\_cli.startup.duration`
[Section titled “gemini\_cli.startup.duration”](#gemini_clistartupduration)
Measures startup time by phase.
Attributes
* `phase` (string)
* `details` (map, optional)
##### `gemini\_cli.memory.usage`
[Section titled “gemini\_cli.memory.usage”](#gemini_climemoryusage)
Measures heap and RSS memory.
Attributes
* `memory\_type` (string: “heap\_used”, “heap\_total”, “external”, “rss”)
* `component` (string, optional)
##### `gemini\_cli.cpu.usage`
[Section titled “gemini\_cli.cpu.usage”](#gemini_clicpuusage)
Measures CPU usage percentage.
Attributes
* `component` (string, optional)
##### `gemini\_cli.tool.queue.depth`
[Section titled “gemini\_cli.tool.queue.depth”](#gemini_clitoolqueuedepth)
Measures tool execution queue depth.
##### `gemini\_cli.tool.execution.breakdown`
[Section titled “gemini\_cli.tool.execution.breakdown”](#gemini_clitoolexecutionbreakdown)
Breaks down tool time by phase.
Attributes
* `function\_name` (string)
* `phase` (string: “validation”, “preparation”, “execution”,
“result\_processing”)
#### GenAI semantic convention
[Section titled “GenAI semantic convention”](#genai-semantic-convention)
These metrics follow standard [OpenTelemetry GenAI semantic conventions](https://github.com/open-telemetry/semantic-conventions/blob/main/docs/gen-ai/gen-ai-metrics.md).
* `gen\_ai.client.token.usage`: Counts tokens used per operation.
* `gen\_ai.client.operation.duration`: Measures operation duration in seconds.
### Traces
[Section titled “Traces”](#traces)
Traces provide an “under-the-hood” view of agent and backend operations. Use
traces to debug tool interactions and optimize performance.
Detailed trace attributes (like full prompts and tool outputs) are disabled by default
to minimize overhead. You must explicitly set `telemetry.traces` to `true` (or set
`GEMINI\_TELEMETRY\_TRACES\_ENABLED=true`) to capture them.
Every trace captures rich metadata via standard span attributes.
Standard span attributes
* `gen\_ai.operation.name`: High-level operation (for example, `tool\_call`,
`llm\_call`, `user\_prompt`, `system\_prompt`, `agent\_call`, or
`schedule\_tool\_calls`).
* `gen\_ai.agent.name`: Set to `gemini-cli`.
* `gen\_ai.agent.description`: The service agent description.
* `gen\_ai.input.messages`: Input data or metadata.
* `gen\_ai.output.messages`: Output data or results.
* `gen\_ai.request.model`: Request model name.
* `gen\_ai.response.model`: Response model name.
* `gen\_ai.prompt.name`: The prompt name.
* `gen\_ai.tool.name`: Executed tool name.
* `gen\_ai.tool.call\_id`: Unique ID for the tool call.
* `gen\_ai.tool.description`: Tool description.
* `gen\_ai.tool.definitions`: Tool definitions in JSON format.
* `gen\_ai.usage.input\_tokens`: Number of input tokens.
* `gen\_ai.usage.output\_tokens`: Number of output tokens.
* `gen\_ai.system\_instructions`: System instructions in JSON format.
* `gen\_ai.conversation.id`: The CLI session ID.
For more details on semantic conventions for events, see the
[OpenTelemetry documentation](https://github.com/open-telemetry/semantic-conventions/blob/8b4f210f43136e57c1f6f47292eb6d38e3bf30bb/docs/gen-ai/gen-ai-events.md).
Last updated: Apr 21, 2026
This website uses [cookies](https://policies.google.com/technologies/cookies) from Google to deliver and enhance the quality of its services and to analyze
traffic.
I understand.