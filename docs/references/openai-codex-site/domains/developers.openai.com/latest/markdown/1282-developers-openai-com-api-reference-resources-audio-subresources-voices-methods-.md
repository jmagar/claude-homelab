Create voice | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Audio](/api/reference/resources/audio)
[Voices](/api/reference/resources/audio/subresources/voices)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create voice
POST/audio/voices
Creates a custom voice.
##### Body ParametersForm DataExpand Collapse
audio\_sample: file
The sample audio recording file. Maximum size is 10 MiB.
Supported MIME types:
`audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.
[](<#(resource) audio.voices > (method) create > (params) 0 > (param) audio_sample > (schema)>)
consent: string
The consent recording ID (for example, `cons\_1234`).
[](<#(resource) audio.voices > (method) create > (params) 0 > (param) consent > (schema)>)
name: string
The name of the new voice.
[](<#(resource) audio.voices > (method) create > (params) 0 > (param) name > (schema)>)
##### ReturnsExpand Collapse
id: string
The voice identifier, which can be referenced in API endpoints.
[](<#(resource) audio.voices > (model) voice_create_response > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the voice was created.
formatunixtime
[](<#(resource) audio.voices > (model) voice_create_response > (schema) > (property) created_at>)
name: string
The name of the voice.
[](<#(resource) audio.voices > (model) voice_create_response > (schema) > (property) name>)
object: "audio.voice"
The object type, which is always `audio.voice`.
[](<#(resource) audio.voices > (model) voice_create_response > (schema) > (property) object>)
### Create voice
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
`curl https://api.openai.com/v1/audio/voices \\
-X POST \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F "name=My new voice" \\
-F "consent=cons\_1234" \\
-F "audio\_sample=@$HOME/audio\_sample.wav;type=audio/x-wav"
`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "audio.voice"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "audio.voice"
}`
```