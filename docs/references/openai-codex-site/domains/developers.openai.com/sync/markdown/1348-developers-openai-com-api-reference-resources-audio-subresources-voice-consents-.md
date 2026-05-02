Update voice consent | OpenAI API Reference
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
# Update voice consent
POST/audio/voice\_consents/{consent\_id}
Updates a voice consent recording (metadata only).
##### Path ParametersExpand Collapse
consent\_id: string
[](<#(resource) audio.voice_consents > (method) update > (params) default > (param) consent_id > (schema)>)
##### Body ParametersJSONExpand Collapse
name: string
The updated label for this consent recording.
[](<#(resource) audio.voice_consents > (method) update > (params) 0 > (param) name > (schema)>)
##### ReturnsExpand Collapse
id: string
The consent recording identifier.
[](<#(resource) audio.voice_consents > (model) voice_consent_update_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the consent recording was created.
formatunixtime
[](<#(resource) audio.voice_consents > (model) voice_consent_update_response > (schema) > (property) created_at>)
language: string
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (model) voice_consent_update_response > (schema) > (property) language>)
name: string
The label provided when the consent recording was uploaded.
[](<#(resource) audio.voice_consents > (model) voice_consent_update_response > (schema) > (property) name>)
object: "audio.voice\_consent"
The object type, which is always `audio.voice\_consent`.
[](<#(resource) audio.voice_consents > (model) voice_consent_update_response > (schema) > (property) object>)
### Update voice consent
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
`curl https://api.openai.com/v1/audio/voice\_consents/cons\_1234 \\
-X POST \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"name": "John Doe"
}'
`
```
200 example
```
`{
"id": "cons\_1234",
"created\_at": 0,
"language": "language",
"name": "name",
"object": "audio.voice\_consent"
}`
```
##### Returns Examples
200 example
```
`{
"id": "cons\_1234",
"created\_at": 0,
"language": "language",
"name": "name",
"object": "audio.voice\_consent"
}`
```