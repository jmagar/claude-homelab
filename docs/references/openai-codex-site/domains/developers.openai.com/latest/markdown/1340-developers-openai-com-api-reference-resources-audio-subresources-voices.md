Voices | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Audio](/api/reference/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Voices
Turn audio into text or text into audio.
##### [Create voice](/api/reference/resources/audio/subresources/voices/methods/create)
POST/audio/voices
##### ModelsExpand Collapse
VoiceCreateResponse object { id, created\_at, name, object }
A custom voice that can be used for audio output.
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
[](<#(resource) audio.voices > (model) voice_create_response > (schema)>)