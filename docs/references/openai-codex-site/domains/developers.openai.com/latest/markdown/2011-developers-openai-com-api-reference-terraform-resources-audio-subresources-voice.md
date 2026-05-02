Voices | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Audio](/api/reference/terraform/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Voices
Turn audio into text or text into audio.
#### resource openai\_audio\_voice
##### required Expand Collapse
audio\_sample: String
The sample audio recording file. Maximum size is 10 MiB.
Supported MIME types:
`audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.
[](<#(resource) audio.voices > (terraform resource) > (attribute) audio_sample>)
consent: String
The consent recording ID (for example, `cons\_1234`).
[](<#(resource) audio.voices > (terraform resource) > (attribute) consent>)
name: String
The name of the new voice.
[](<#(resource) audio.voices > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
The voice identifier, which can be referenced in API endpoints.
[](<#(resource) audio.voices > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the voice was created.
[](<#(resource) audio.voices > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `audio.voice`.
[](<#(resource) audio.voices > (terraform resource) > (attribute) object>)