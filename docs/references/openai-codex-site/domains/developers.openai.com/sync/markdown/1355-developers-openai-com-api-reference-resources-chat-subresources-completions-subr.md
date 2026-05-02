Get chat messages | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Chat](/api/reference/resources/chat)
[Completions](/api/reference/resources/chat/subresources/completions)
[Messages](/api/reference/resources/chat/subresources/completions/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get chat messages
GET/chat/completions/{completion\_id}/messages
Get the messages in a stored chat completion. Only Chat Completions that
have been created with the `store` parameter set to `true` will be
returned.
##### Path ParametersExpand Collapse
completion\_id: string
[](<#(resource) chat.completions.messages > (method) list > (params) default > (param) completion_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
Identifier for the last message from the previous pagination request.
[](<#(resource) chat.completions.messages > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
Number of messages to retrieve.
[](<#(resource) chat.completions.messages > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order for messages by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
One of the following:
"asc"
[](<#(resource) chat.completions.messages > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) chat.completions.messages > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) chat.completions.messages > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of [ChatCompletionStoreMessage](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_store_message > (schema)>) { id, content\_parts }
An array of chat completion message objects.
id: string
The identifier of the chat message.
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) id>)
content\_parts: optional array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } or [ChatCompletionContentPartImage](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>) { image\_url, type }
If a content parts array was provided, this is an array of `text` and `image\_url` parts.
Otherwise, null.
One of the following:
ChatCompletionContentPartText object { text, type }
Learn about [text inputs](/docs/guides/text-generation).
text: string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: "text"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
ChatCompletionContentPartImage object { image\_url, type }
Learn about [image inputs](/docs/guides/vision).
image\_url: object { url, detail }
url: string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. Learn more in the [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
"auto"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
"low"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
"high"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) content_parts>)
[](<#(resource) chat.completions.messages > (method) list > (network schema) > (property) data>)
first\_id: string
The identifier of the first chat message in the data array.
[](<#(resource) chat.completions.messages > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
Indicates whether there are more chat messages available.
[](<#(resource) chat.completions.messages > (method) list > (network schema) > (property) has_more>)
last\_id: string
The identifier of the last chat message in the data array.
[](<#(resource) chat.completions.messages > (method) list > (network schema) > (property) last_id>)
object: "list"
The type of this object. It is always set to “list”.
[](<#(resource) chat.completions.messages > (method) list > (network schema) > (property) object>)
### Get chat messages
HTTP
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
`curl https://api.openai.com/v1/chat/completions/chat\_abc123/messages \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "list",
"data": [
{
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2-0",
"role": "user",
"content": "write a haiku about ai",
"name": null,
"content\_parts": null
}
],
"first\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2-0",
"last\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2-0",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2-0",
"role": "user",
"content": "write a haiku about ai",
"name": null,
"content\_parts": null
}
],
"first\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2-0",
"last\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2-0",
"has\_more": false
}
`
```