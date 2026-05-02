Update chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Chat](/api/reference/java/resources/chat)
[Completions](/api/reference/java/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update chat completion
[ChatCompletion](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) chat().completions().update(ChatCompletionUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/chat/completions/{completion\_id}
Modify a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be modified. Currently,
the only supported modification is to update the `metadata` field.
##### ParametersExpand Collapse
ChatCompletionUpdateParams params
Optional\<String\> completionId
[](<#(resource) chat.completions > (method) update > (params) default > (param) completion_id > (schema)>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) chat.completions > (method) update > (params) default > (param) body > (schema) > (property) metadata>)
[](<#(resource) chat.completions > (method) update > (params) default>)
##### ReturnsExpand Collapse
class ChatCompletion:
Represents a chat completion response returned by model, based on the provided input.
String id
A unique identifier for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) id>)
List\<Choice\> choices
A list of chat completion choices. Can be more than one if `n` is greater than 1.
FinishReason finishReason
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
STOP("stop")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
LENGTH("length")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
TOOL\_CALLS("tool\_calls")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
CONTENT\_FILTER("content\_filter")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
FUNCTION\_CALL("function\_call")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason>)
long index
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) index>)
Optional\<Logprobs\> logprobs
Log probability information for the choice.
Optional\<List\<[ChatCompletionTokenLogprob](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)\>\> content
A list of message content tokens with log probability information.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
List\<TopLogprob\> topLogprobs
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
Optional\<List\<[ChatCompletionTokenLogprob](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)\>\> refusal
A list of message refusal tokens with log probability information.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
List\<TopLogprob\> topLogprobs
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs>)
[ChatCompletionMessage](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message > (schema)>) message
A chat completion message generated by the model.
Optional\<String\> content
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
Optional\<String\> refusal
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
JsonValue; role "assistant"constant"assistant"constant
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
Optional\<List\<Annotation\>\> annotations
Annotations for the message, when applicable, as when using the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
JsonValue; type "url\_citation"constant"url\_citation"constant
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
UrlCitation urlCitation
A URL citation when using web search.
long endIndex
The index of the last character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) end_index>)
long startIndex
The index of the first character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) start_index>)
String title
The title of the web resource.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) title>)
String url
The URL of the web resource.
formaturi
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) url>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations>)
Optional\<[ChatCompletionAudio](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>)\> audio
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
String id
Unique identifier for this audio response.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) id>)
String data
Base64 encoded audio bytes generated by the model, in the format
specified in the request.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) data>)
long expiresAt
The Unix timestamp (in seconds) for when this audio response will
no longer be accessible on the server for use in multi-turn
conversations.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) expires_at>)
String transcript
Transcript of the audio generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) transcript>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio>)
DeprecatedOptional\<FunctionCall\> functionCall
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
Optional\<List\<[ChatCompletionMessageToolCall](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)\>\> toolCalls
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall:
A call to a function tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function function
The function that the model called.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall:
A call to a custom tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom custom
The custom tool that the model called.
String input
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices>)
long created
The Unix timestamp (in seconds) of when the chat completion was created.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) created>)
String model
The model used for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) model>)
JsonValue; object\_ "chat.completion"constant"chat.completion"constant
The object type, which is always `chat.completion`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) object>)
Optional\<ServiceTier\> serviceTier
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 0>)
DEFAULT("default")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 1>)
FLEX("flex")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 2>)
SCALE("scale")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 3>)
PRIORITY("priority")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier>)
DeprecatedOptional\<String\> systemFingerprint
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) system_fingerprint>)
Optional\<[CompletionUsage](</api/reference/java/resources/completions#(resource) completions > (model) completion_usage > (schema)>)\> usage
Usage statistics for the completion request.
long completionTokens
Number of tokens in the generated completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
long promptTokens
Number of tokens in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
long totalTokens
Total number of tokens used in the request (prompt + completion).
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
Optional\<CompletionTokensDetails\> completionTokensDetails
Breakdown of tokens used in a completion.
Optional\<Long\> acceptedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
Optional\<Long\> audioTokens
Audio input tokens generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
Optional\<Long\> reasoningTokens
Tokens generated by the model for reasoning.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
Optional\<Long\> rejectedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
Optional\<PromptTokensDetails\> promptTokensDetails
Breakdown of tokens used in the prompt.
Optional\<Long\> audioTokens
Audio input tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
Optional\<Long\> cachedTokens
Cached tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
### Update chat completion
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
import com.openai.core.JsonValue;
import com.openai.models.chat.completions.ChatCompletion;
import com.openai.models.chat.completions.ChatCompletionUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ChatCompletionUpdateParams params = ChatCompletionUpdateParams.builder()
.completionId("completion\_id")
.metadata(ChatCompletionUpdateParams.Metadata.builder()
.putAdditionalProperty("foo", JsonValue.from("string"))
.build())
.build();
ChatCompletion chatCompletion = client.chat().completions().update(params);
}
}`
```
```
`{
"object": "chat.completion",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"model": "gpt-4o-2024-08-06",
"created": 1738960610,
"request\_id": "req\_ded8ab984ec4bf840f37566c1011c417",
"tool\_choice": null,
"usage": {
"total\_tokens": 31,
"completion\_tokens": 18,
"prompt\_tokens": 13
},
"seed": 4944116822809979520,
"top\_p": 1.0,
"temperature": 1.0,
"presence\_penalty": 0.0,
"frequency\_penalty": 0.0,
"system\_fingerprint": "fp\_50cad350e4",
"input\_user": null,
"service\_tier": "default",
"tools": null,
"metadata": {
"foo": "bar"
},
"choices": [
{
"index": 0,
"message": {
"content": "Mind of circuits hum, \\nLearning patterns in silence— \\nFuture's quiet spark.",
"role": "assistant",
"tool\_calls": null,
"function\_call": null
},
"finish\_reason": "stop",
"logprobs": null
}
],
"response\_format": null
}
`
```
##### Returns Examples
```
`{
"object": "chat.completion",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"model": "gpt-4o-2024-08-06",
"created": 1738960610,
"request\_id": "req\_ded8ab984ec4bf840f37566c1011c417",
"tool\_choice": null,
"usage": {
"total\_tokens": 31,
"completion\_tokens": 18,
"prompt\_tokens": 13
},
"seed": 4944116822809979520,
"top\_p": 1.0,
"temperature": 1.0,
"presence\_penalty": 0.0,
"frequency\_penalty": 0.0,
"system\_fingerprint": "fp\_50cad350e4",
"input\_user": null,
"service\_tier": "default",
"tools": null,
"metadata": {
"foo": "bar"
},
"choices": [
{
"index": 0,
"message": {
"content": "Mind of circuits hum, \\nLearning patterns in silence— \\nFuture's quiet spark.",
"role": "assistant",
"tool\_calls": null,
"function\_call": null
},
"finish\_reason": "stop",
"logprobs": null
}
],
"response\_format": null
}
`
```