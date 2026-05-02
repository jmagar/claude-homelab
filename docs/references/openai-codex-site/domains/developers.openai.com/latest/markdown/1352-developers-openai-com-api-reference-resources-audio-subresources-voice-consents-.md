Create voice consent | OpenAI API Reference
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
# Create voice consent
POST/audio/voice\_consents
Upload a voice consent recording.
##### Body ParametersForm DataExpand Collapse
language: string
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (method) create > (params) 0 > (param) language > (schema)>)
name: string
The label to use for this consent recording.
[](<#(resource) audio.voice_consents > (method) create > (params) 0 > (param) name > (schema)>)
recording: file
The consent audio recording file. Maximum size is 10 MiB.
Supported MIME types:
`audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.
[](<#(resource) audio.voice_consents > (method) create > (params) 0 > (param) recording > (schema)>)
##### ReturnsExpand Collapse
id: string
The consent recording identifier.
[](<#(resource) audio.voice_consents > (model) voice_consent_create_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the consent recording was created.
formatunixtime
[](<#(resource) audio.voice_consents > (model) voice_consent_create_response > (schema) > (property) created_at>)
language: string
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (model) voice_consent_create_response > (schema) > (property) language>)
name: string
The label provided when the consent recording was uploaded.
[](<#(resource) audio.voice_consents > (model) voice_consent_create_response > (schema) > (property) name>)
object: "audio.voice\_consent"
The object type, which is always `audio.voice\_consent`.
[](<#(resource) audio.voice_consents > (model) voice_consent_create_response > (schema) > (property) object>)
### Create voice consent
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
`curl https://api.openai.com/v1/audio/voice\_consents \\
-X POST \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F "name=John Doe" \\
-F "language=en-US" \\
-F "recording=@$HOME/consent\_recording.wav;type=audio/x-wav"
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