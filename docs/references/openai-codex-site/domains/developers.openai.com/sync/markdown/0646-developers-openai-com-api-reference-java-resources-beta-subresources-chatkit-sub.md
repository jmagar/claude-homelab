Cancel chat session | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[ChatKit](/api/reference/java/resources/beta/subresources/chatkit)
[Sessions](/api/reference/java/resources/beta/subresources/chatkit/subresources/sessions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Cancel chat session
[ChatSession](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>) beta().chatkit().sessions().cancel(SessionCancelParamsparams = SessionCancelParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/chatkit/sessions/{session\_id}/cancel
Cancel an active ChatKit session and return its most recent metadata.
Cancelling prevents new requests from using the issued client secret.
##### ParametersExpand Collapse
SessionCancelParams params
Optional\<String\> sessionId
[](<#(resource) beta.chatkit.sessions > (method) cancel > (params) default > (param) session_id > (schema)>)
[](<#(resource) beta.chatkit.sessions > (method) cancel > (params) default>)
##### ReturnsExpand Collapse
class ChatSession:
Represents a ChatKit session and its resolved configuration.
String id
Identifier for the ChatKit session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) id>)
[ChatSessionChatKitConfiguration](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema)>) chatkitConfiguration
Resolved ChatKit feature configuration for the session.
[ChatSessionAutomaticThreadTitling](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema)>) automaticThreadTitling
Automatic thread titling preferences.
boolean enabled
Whether automatic thread titling is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling + (resource) beta.chatkit.threads > (model) chat_session_automatic_thread_titling > (schema) > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) automatic_thread_titling>)
[ChatSessionFileUpload](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema)>) fileUpload
Upload settings for the session.
boolean enabled
Indicates if uploads are enabled for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) enabled>)
Optional\<Long\> maxFileSize
Maximum upload size in megabytes.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_file_size>)
Optional\<Long\> maxFiles
Maximum number of uploads allowed during the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload + (resource) beta.chatkit.threads > (model) chat_session_file_upload > (schema) > (property) max_files>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) file_upload>)
[ChatSessionHistory](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_history > (schema)>) history
History retention configuration.
boolean enabled
Indicates if chat history is persisted for the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history + (resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) enabled>)
Optional\<Long\> recentThreads
Number of prior threads surfaced in history views. Defaults to null when all history is retained.
[](<#(resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history + (resource) beta.chatkit.threads > (model) chat_session_history > (schema) > (property) recent_threads>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration + (resource) beta.chatkit.threads > (model) chat_session_chatkit_configuration > (schema) > (property) history>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) chatkit_configuration>)
String clientSecret
Ephemeral client secret that authenticates session requests.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) client_secret>)
long expiresAt
Unix timestamp (in seconds) for when the session expires.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) expires_at>)
long maxRequestsPer1Minute
Convenience copy of the per-minute request limit.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) max_requests_per_1_minute>)
JsonValue; object\_ "chatkit.session"constant"chatkit.session"constant
Type discriminator that is always `chatkit.session`.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) object>)
[ChatSessionRateLimits](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema)>) rateLimits
Resolved rate limit values.
long maxRequestsPer1Minute
Maximum allowed requests per one-minute window.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits + (resource) beta.chatkit.threads > (model) chat_session_rate_limits > (schema) > (property) max_requests_per_1_minute>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) rate_limits>)
[ChatSessionStatus](</api/reference/java/resources/beta#(resource) beta.chatkit.threads > (model) chat_session_status > (schema)>) status
Current lifecycle state of the session.
One of the following:
ACTIVE("active")
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 0>)
EXPIRED("expired")
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 1>)
CANCELLED("cancelled")
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status + (resource) beta.chatkit.threads > (model) chat_session_status > (schema) > (member) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) status>)
String user
User identifier associated with the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) user>)
[ChatKitWorkflow](</api/reference/java/resources/beta#(resource) beta.chatkit > (model) chatkit_workflow > (schema)>) workflow
Workflow metadata for the session.
String id
Identifier of the workflow backing the session.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) id>)
Optional\<StateVariables\> stateVariables
State variable key-value pairs applied when invoking the workflow. Defaults to null when no overrides were provided.
One of the following:
String
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 0>)
boolean
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 1>)
double
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables > (items) > (variant) 2>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) state_variables>)
Tracing tracing
Tracing settings applied to the workflow.
boolean enabled
Indicates whether tracing is enabled.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing > (property) enabled>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) tracing>)
Optional\<String\> version
Specific workflow version used for the session. Defaults to null when using the latest deployment.
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow + (resource) beta.chatkit > (model) chatkit_workflow > (schema) > (property) version>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema) > (property) workflow>)
[](<#(resource) beta.chatkit.threads > (model) chat_session > (schema)>)
### Cancel chat session
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.beta.chatkit.sessions.SessionCancelParams;
import com.openai.models.beta.chatkit.threads.ChatSession;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ChatSession chatSession = client.beta().chatkit().sessions().cancel("cksess\_123");
}
}
`
```
```
`{
"id": "cksess\_123",
"object": "chatkit.session",
"workflow": {
"id": "workflow\_alpha",
"version": "1"
},
"scope": {
"customer\_id": "cust\_456"
},
"max\_requests\_per\_1\_minute": 30,
"ttl\_seconds": 900,
"status": "cancelled",
"cancelled\_at": 1712345678
}
`
```
##### Returns Examples
```
`{
"id": "cksess\_123",
"object": "chatkit.session",
"workflow": {
"id": "workflow\_alpha",
"version": "1"
},
"scope": {
"customer\_id": "cust\_456"
},
"max\_requests\_per\_1\_minute": 30,
"ttl\_seconds": 900,
"status": "cancelled",
"cancelled\_at": 1712345678
}
`
```