List voice consents | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Audio](/api/reference/resources/audio)
[Voice Consents](/api/reference/resources/audio/subresources/voice_consents)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List voice consents
GET/audio/voice\_consents
Returns a list of voice consent recordings.
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) audio.voice_consents > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) audio.voice_consents > (method) list > (params) default > (param) limit > (schema)>)
##### ReturnsExpand Collapse
data: array of object { id, created\_at, language, 2 more }
id: string
The consent recording identifier.
[](<#(resource) audio.voice_consents > (model) voice_consent_list_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the consent recording was created.
formatunixtime
[](<#(resource) audio.voice_consents > (model) voice_consent_list_response > (schema) > (property) created_at>)
language: string
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (model) voice_consent_list_response > (schema) > (property) language>)
name: string
The label provided when the consent recording was uploaded.
[](<#(resource) audio.voice_consents > (model) voice_consent_list_response > (schema) > (property) name>)
object: "audio.voice\_consent"
The object type, which is always `audio.voice\_consent`.
[](<#(resource) audio.voice_consents > (model) voice_consent_list_response > (schema) > (property) object>)
[](<#(resource) audio.voice_consents > (method) list > (network schema) > (property) data>)
has\_more: boolean
[](<#(resource) audio.voice_consents > (method) list > (network schema) > (property) has_more>)
object: "list"
[](<#(resource) audio.voice_consents > (method) list > (network schema) > (property) object>)
first\_id: optional string
[](<#(resource) audio.voice_consents > (method) list > (network schema) > (property) first_id>)
last\_id: optional string
[](<#(resource) audio.voice_consents > (method) list > (network schema) > (property) last_id>)
### List voice consents
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
`curl https://api.openai.com/v1/audio/voice\_consents?limit=20 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
```
200 example
```
`{
"data": [
{
"id": "cons\_1234",
"created\_at": 0,
"language": "language",
"name": "name",
"object": "audio.voice\_consent"
}
],
"has\_more": true,
"object": "list",
"first\_id": "first\_id",
"last\_id": "last\_id"
}`
```
##### Returns Examples
200 example
```
`{
"data": [
{
"id": "cons\_1234",
"created\_at": 0,
"language": "language",
"name": "name",
"object": "audio.voice\_consent"
}
],
"has\_more": true,
"object": "list",
"first\_id": "first\_id",
"last\_id": "last\_id"
}`
```