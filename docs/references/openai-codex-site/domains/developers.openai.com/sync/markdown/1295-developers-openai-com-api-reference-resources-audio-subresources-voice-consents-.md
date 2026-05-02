Retrieve voice consent | OpenAI API Reference
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
# Retrieve voice consent
GET/audio/voice\_consents/{consent\_id}
Retrieves a voice consent recording.
##### Path ParametersExpand Collapse
consent\_id: string
[](<#(resource) audio.voice_consents > (method) retrieve > (params) default > (param) consent_id > (schema)>)
##### ReturnsExpand Collapse
id: string
The consent recording identifier.
[](<#(resource) audio.voice_consents > (model) voice_consent_retrieve_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the consent recording was created.
formatunixtime
[](<#(resource) audio.voice_consents > (model) voice_consent_retrieve_response > (schema) > (property) created_at>)
language: string
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (model) voice_consent_retrieve_response > (schema) > (property) language>)
name: string
The label provided when the consent recording was uploaded.
[](<#(resource) audio.voice_consents > (model) voice_consent_retrieve_response > (schema) > (property) name>)
object: "audio.voice\_consent"
The object type, which is always `audio.voice\_consent`.
[](<#(resource) audio.voice_consents > (model) voice_consent_retrieve_response > (schema) > (property) object>)
### Retrieve voice consent
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
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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