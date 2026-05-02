Voice Consents | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Audio](/api/reference/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Voice Consents
Turn audio into text or text into audio.
##### [List voice consents](/api/reference/resources/audio/subresources/voice_consents/methods/list)
GET/audio/voice\_consents
##### [Create voice consent](/api/reference/resources/audio/subresources/voice_consents/methods/create)
POST/audio/voice\_consents
##### [Retrieve voice consent](/api/reference/resources/audio/subresources/voice_consents/methods/retrieve)
GET/audio/voice\_consents/{consent\_id}
##### [Update voice consent](/api/reference/resources/audio/subresources/voice_consents/methods/update)
POST/audio/voice\_consents/{consent\_id}
##### [Delete voice consent](/api/reference/resources/audio/subresources/voice_consents/methods/delete)
DELETE/audio/voice\_consents/{consent\_id}
##### ModelsExpand Collapse
VoiceConsentListResponse object { id, created\_at, language, 2 more }
A consent recording used to authorize creation of a custom voice.
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
[](<#(resource) audio.voice_consents > (model) voice_consent_list_response > (schema)>)
VoiceConsentCreateResponse object { id, created\_at, language, 2 more }
A consent recording used to authorize creation of a custom voice.
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
[](<#(resource) audio.voice_consents > (model) voice_consent_create_response > (schema)>)
VoiceConsentRetrieveResponse object { id, created\_at, language, 2 more }
A consent recording used to authorize creation of a custom voice.
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
[](<#(resource) audio.voice_consents > (model) voice_consent_retrieve_response > (schema)>)
VoiceConsentUpdateResponse object { id, created\_at, language, 2 more }
A consent recording used to authorize creation of a custom voice.
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
[](<#(resource) audio.voice_consents > (model) voice_consent_update_response > (schema)>)
VoiceConsentDeleteResponse object { id, deleted, object }
id: string
The consent recording identifier.
[](<#(resource) audio.voice_consents > (model) voice_consent_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) audio.voice_consents > (model) voice_consent_delete_response > (schema) > (property) deleted>)
object: "audio.voice\_consent"
[](<#(resource) audio.voice_consents > (model) voice_consent_delete_response > (schema) > (property) object>)
[](<#(resource) audio.voice_consents > (model) voice_consent_delete_response > (schema)>)