Voice Consents | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Audio](/api/reference/terraform/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Voice Consents
Turn audio into text or text into audio.
#### resource openai\_audio\_voice\_consent
##### required Expand Collapse
language: String
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (terraform resource) > (attribute) language>)
recording: String
The consent audio recording file. Maximum size is 10 MiB.
Supported MIME types:
`audio/mpeg`, `audio/wav`, `audio/x-wav`, `audio/ogg`, `audio/aac`, `audio/flac`, `audio/webm`, `audio/mp4`.
[](<#(resource) audio.voice_consents > (terraform resource) > (attribute) recording>)
name: String
The label to use for this consent recording.
[](<#(resource) audio.voice_consents > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
The consent recording identifier.
[](<#(resource) audio.voice_consents > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the consent recording was created.
[](<#(resource) audio.voice_consents > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `audio.voice\_consent`.
[](<#(resource) audio.voice_consents > (terraform resource) > (attribute) object>)
#### data openai\_audio\_voice\_consent
##### required Expand Collapse
consent\_id: String
[](<#(resource) audio.voice_consents > (terraform datasource-single) > (attribute) consent_id>)
##### computed Expand Collapse
id: String
[](<#(resource) audio.voice_consents > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the consent recording was created.
[](<#(resource) audio.voice_consents > (terraform datasource-single) > (attribute) created_at>)
language: String
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (terraform datasource-single) > (attribute) language>)
name: String
The label provided when the consent recording was uploaded.
[](<#(resource) audio.voice_consents > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `audio.voice\_consent`.
[](<#(resource) audio.voice_consents > (terraform datasource-single) > (attribute) object>)
#### data openai\_audio\_voice\_consents
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) audio.voice_consents > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The consent recording identifier.
[](<#(resource) audio.voice_consents > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the consent recording was created.
[](<#(resource) audio.voice_consents > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
language: String
The BCP 47 language tag for the consent phrase (for example, `en-US`).
[](<#(resource) audio.voice_consents > (terraform datasource-plural) > (attribute) items > (attribute) language>)
name: String
The label provided when the consent recording was uploaded.
[](<#(resource) audio.voice_consents > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `audio.voice\_consent`.
[](<#(resource) audio.voice_consents > (terraform datasource-plural) > (attribute) items > (attribute) object>)
[](<#(resource) audio.voice_consents > (terraform datasource-plural) > (attribute) items>)