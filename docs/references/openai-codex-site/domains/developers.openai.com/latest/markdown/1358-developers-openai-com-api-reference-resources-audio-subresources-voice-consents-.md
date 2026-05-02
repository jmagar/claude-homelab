Delete voice consent | OpenAI API Reference
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
# Delete voice consent
DELETE/audio/voice\_consents/{consent\_id}
Deletes a voice consent recording.
##### Path ParametersExpand Collapse
consent\_id: string
[](<#(resource) audio.voice_consents > (method) delete > (params) default > (param) consent_id > (schema)>)
##### ReturnsExpand Collapse
id: string
The consent recording identifier.
[](<#(resource) audio.voice_consents > (model) voice_consent_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) audio.voice_consents > (model) voice_consent_delete_response > (schema) > (property) deleted>)
object: "audio.voice\_consent"
[](<#(resource) audio.voice_consents > (model) voice_consent_delete_response > (schema) > (property) object>)
### Delete voice consent
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
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
```
200 example
```
`{
"id": "cons\_1234",
"deleted": true,
"object": "audio.voice\_consent"
}`
```
##### Returns Examples
200 example
```
`{
"id": "cons\_1234",
"deleted": true,
"object": "audio.voice\_consent"
}`
```