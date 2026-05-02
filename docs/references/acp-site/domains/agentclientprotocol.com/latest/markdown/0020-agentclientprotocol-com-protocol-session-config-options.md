Session Config Options - Agent Client Protocol
[Protocol
](/get-started/introduction)[RFDs
](/rfds/about)[Community
](/community/communication)[Publications
](/publications)[Updates
](/updates)[Brand
](/brand)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://agentclientprotocol.com/llms.txt
](https://agentclientprotocol.com/llms.txt)
> Use this file to discover all available pages before exploring further.
Agents can provide an arbitrary list of configuration options for a session, allowing Clients to offer users customizable selectors for things like models, modes, reasoning levels, and more.
Session Config Options are the preferred way to expose session-level
configuration. If an Agent provides `configOptions`, Clients **SHOULD** use
them instead of the [`modes`](./session-modes) field. Modes will be removed in
a future version of the protocol.
##
[​
](#initial-state)
Initial State
During [Session Setup](./session-setup) the Agent **MAY** return a list of configuration options and their current values:
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"sessionId": "sess\_abc123def456",
"configOptions": [
{
"id": "mode",
"name": "Session Mode",
"description": "Controls how the agent requests permission",
"category": "mode",
"type": "select",
"currentValue": "ask",
"options": [
{
"value": "ask",
"name": "Ask",
"description": "Request permission before making any changes"
},
{
"value": "code",
"name": "Code",
"description": "Write and modify code with full tool access"
}
]
},
{
"id": "model",
"name": "Model",
"category": "model",
"type": "select",
"currentValue": "model-1",
"options": [
{
"value": "model-1",
"name": "Model 1",
"description": "The fastest model"
},
{
"value": "model-2",
"name": "Model 2",
"description": "The most powerful model"
}
]
}
]
}
}
`
```
[​
](#param-config-options)
configOptions
ConfigOption[]
The list of configuration options available for this session. The order of
this array represents the Agent’s preferred priority. Clients **SHOULD**
respect this ordering when displaying options.
###
[​
](#configoption)
ConfigOption
[​
](#param-id)
id
string
required
Unique identifier for this configuration option. Used when setting values.
[​
](#param-name)
name
string
required
Human-readable label for the option
[​
](#param-description)
description
string
Optional description providing more details about what this option controls
[​
](#param-category)
category
ConfigOptionCategory
Optional [semantic category](#option-categories) to help Clients provide
consistent UX.
[​
](#param-type)
type
ConfigOptionType
required
The type of input control. Currently only `select` is supported.
[​
](#param-current-value)
currentValue
string
required
The currently selected value for this option
[​
](#param-options)
options
ConfigOptionValue[]
required
The available values for this option
###
[​
](#configoptionvalue)
ConfigOptionValue
[​
](#param-value)
value
string
required
The value identifier used when setting this option
[​
](#param-name-1)
name
string
required
Human-readable name to display
[​
](#param-description-1)
description
string
Optional description of what this value does
##
[​
](#option-categories)
Option Categories
Each config option **MAY** include a `category` field. Categories are semantic metadata intended to help Clients provide consistent UX, such as attaching keyboard shortcuts, choosing icons, or deciding placement.
Categories are for UX purposes only and **MUST NOT** be required for
correctness. Clients **MUST** handle missing or unknown categories gracefully.
Category names beginning with `\_` are free for custom use (e.g., `\_my\_custom\_category`). Category names that do not begin with `\_` are reserved for the ACP spec.
|Category|Description|
|`mode`|Session mode selector|
|`model`|Model selector|
|`thought\_level`|Thought/reasoning level selector|
When multiple options share the same category, Clients **SHOULD** use the array ordering to resolve ties, preferring earlier options in the list for prominent placement or keyboard shortcuts.
##
[​
](#option-ordering)
Option Ordering
The order of the `configOptions` array is significant. Agents **SHOULD** place higher-priority options first in the list.
Clients **SHOULD**:
* Display options in the order provided by the Agent
* Use ordering to resolve ties when multiple options share the same category
* If displaying a limited number of options, prefer those at the beginning of the list
##
[​
](#default-values-and-graceful-degradation)
Default Values and Graceful Degradation
Agents **MUST** always provide a default value for every configuration option. This ensures the Agent can operate correctly even if:
* The Client doesn’t support configuration options
* The Client chooses not to display certain options
* The Client receives an option type it doesn’t recognize
If a Client receives an option with an unrecognized `type`, it **SHOULD** ignore that option. The Agent will continue using its default value.
##
[​
](#setting-a-config-option)
Setting a Config Option
The current value of a config option can be changed at any point during a session, whether the Agent is idle or generating a response.
###
[​
](#from-the-client)
From the Client
Clients can change a config option value by calling the `session/set\_config\_option` method:
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "session/set\_config\_option",
"params": {
"sessionId": "sess\_abc123def456",
"configId": "mode",
"value": "code"
}
}
`
```
[​
](#param-session-id)
sessionId
SessionId
required
The ID of the session
[​
](#param-config-id)
configId
string
required
The `id` of the configuration option to change
[​
](#param-value-1)
value
string
required
The new value to set. Must be one of the values listed in the option’s
`options` array.
The Agent **MUST** respond with the complete list of all configuration options and their current values:
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {
"configOptions": [
{
"id": "mode",
"name": "Session Mode",
"type": "select",
"currentValue": "code",
"options": [...]
},
{
"id": "model",
"name": "Model",
"type": "select",
"currentValue": "model-1",
"options": [...]
}
]
}
}
`
```
The response always contains the **complete** configuration state. This allows
Agents to reflect dependent changes. For example, if changing the model
affects available reasoning options, or if an option’s available values change
based on another selection.
###
[​
](#from-the-agent)
From the Agent
The Agent can also change configuration options and notify the Client by sending a `config\_option\_update` session notification:
```
`{
"jsonrpc": "2.0",
"method": "session/update",
"params": {
"sessionId": "sess\_abc123def456",
"update": {
"sessionUpdate": "config\_option\_update",
"configOptions": [
{
"id": "mode",
"name": "Session Mode",
"type": "select",
"currentValue": "code",
"options": [...]
},
{
"id": "model",
"name": "Model",
"type": "select",
"currentValue": "model-2",
"options": [...]
}
]
}
}
}
`
```
This notification also contains the complete configuration state. Common reasons an Agent might update configuration options include:
* Switching modes after completing a planning phase
* Falling back to a different model due to rate limits or errors
* Adjusting available options based on context discovered during execution
##
[​
](#relationship-to-session-modes)
Relationship to Session Modes
Session Config Options supersede the older [Session Modes](./session-modes) API. However, during the transition period, Agents that provide mode-like configuration **SHOULD** send both:
* `configOptions` with a `category: "mode"` option for Clients that support config options
* `modes` for Clients that only support the older API
If an Agent provides both `configOptions` and `modes` in the session response:
* Clients that support config options **SHOULD** use `configOptions` exclusively and ignore `modes`
* Clients that don’t support config options **SHOULD** fall back to `modes`
* Agents **SHOULD** keep both in sync to ensure consistent behavior regardless of which field the Client uses
##
Learn about the Session Modes API