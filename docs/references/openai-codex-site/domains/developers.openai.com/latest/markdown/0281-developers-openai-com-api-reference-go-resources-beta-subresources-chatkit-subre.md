Create ChatKit session | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[ChatKit](/api/reference/go/resources/beta/subresources/chatkit)
[Sessions](/api/reference/go/resources/beta/subresources/chatkit/subresources/sessions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create ChatKit session
client.Beta.ChatKit.Sessions.New(ctx, body) (\*[ChatSession](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>), error)
POST/chatkit/sessions
Create a ChatKit session.
##### ParametersExpand Collapse
body BetaChatKitSessionNewParams
User param.Field[string]
A free-form string that identifies your end user; ensures this Session can access other objects that have the same `user` scope.
minLength1
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) user>)
Workflow param.Field[[ChatSessionWorkflowParamResp](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_workflow_param > (schema)>)]
Workflow that powers the session.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) workflow>)
ChatKitConfiguration param.Field[[ChatSessionChatKitConfigurationParamResp](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration_param > (schema)>)]Optional
Optional overrides for ChatKit runtime configuration features
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) chatkit_configuration>)
ExpiresAfter param.Field[[ChatSessionExpiresAfterParamResp](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_expires_after_param > (schema)>)]Optional
Optional override for session expiration timing in seconds from creation. Defaults to 10 minutes.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) expires_after>)
RateLimits param.Field[[ChatSessionRateLimitsParamResp](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits_param > (schema)>)]Optional
Optional override for per-minute request limits. When omitted, defaults to 10.
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default > (param) rate_limits>)
[](<#(resource) beta.chatkit.sessions > (method) create > (params) default>)
##### ReturnsExpand Collapse
type ChatSession struct{…}
Represents a ChatKit session and its resolved configuration.
ID string
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
ChatKitConfiguration [ChatSessionChatKitConfiguration](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>)
Resolved ChatKit feature configuration for the session.
AutomaticThreadTitling [ChatSessionAutomaticThreadTitling](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>)
Automatic thread titling preferences.
Enabled bool
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling + (resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
FileUpload [ChatSessionFileUpload](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>)
Upload settings for the session.
Enabled bool
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
MaxFileSize int64
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
MaxFiles int64
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
History [ChatSessionHistory](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>)
History retention configuration.
Enabled bool
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history + (resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
RecentThreads int64
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history + (resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration>)
ClientSecret string
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) client_secret>)
ExpiresAt int64
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) expires_at>)
MaxRequestsPer1Minute int64
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) max_requests_per_1_minute>)
Object ChatKitSession
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) object>)
RateLimits [ChatSessionRateLimits](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>)
Resolved rate limit values.
MaxRequestsPer1Minute int64
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits + (resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
Status [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>)
Current lifecycle state of the session.
One of the following:
const ChatSessionStatusActive [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) = "active"
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
const ChatSessionStatusExpired [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) = "expired"
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
const ChatSessionStatusCancelled [ChatSessionStatus](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) = "cancelled"
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
User string
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
Workflow [ChatKitWorkflow](</api/reference/go/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>)
Workflow metadata for the session.
ID string
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
StateVariables map[string, ChatKitWorkflowStateVariableUnion]
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
string
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
bool
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
float64
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
Tracing ChatKitWorkflowTracing
Tracing settings applied to the workflow.
Enabled bool
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
Version string
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
### Create ChatKit session
Go
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient()
chatSession, err := client.Beta.ChatKit.Sessions.New(context.TODO(), openai.BetaChatKitSessionNewParams{
User: "user",
Workflow: openai.ChatSessionWorkflowParam{
ID: "id",
},
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", chatSession.ID)
}
`
```
```
`{
"client\_secret": "chatkit\_token\_123",
"expires\_at": 1735689600,
"workflow": {
"id": "workflow\_alpha",
"version": "2024-10-01"
},
"scope": {
"project": "alpha",
"environment": "staging"
},
"max\_requests\_per\_1\_minute": 60,
"max\_requests\_per\_session": 500,
"status": "active"
}
`
```
##### Returns Examples
```
`{
"client\_secret": "chatkit\_token\_123",
"expires\_at": 1735689600,
"workflow": {
"id": "workflow\_alpha",
"version": "2024-10-01"
},
"scope": {
"project": "alpha",
"environment": "staging"
},
"max\_requests\_per\_1\_minute": 60,
"max\_requests\_per\_session": 500,
"status": "active"
}
`
```