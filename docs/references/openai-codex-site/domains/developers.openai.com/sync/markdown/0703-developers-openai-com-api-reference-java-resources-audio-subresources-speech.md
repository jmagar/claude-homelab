Speech | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Audio](/api/reference/java/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Speech
Turn audio into text or text into audio.
##### [Create speech](/api/reference/java/resources/audio/subresources/speech/methods/create)
HttpResponse audio().speech().create(SpeechCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/audio/speech
##### ModelsExpand Collapse
enum SpeechModel:
TTS\_1("tts-1")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 0>)
TTS\_1\_HD("tts-1-hd")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 1>)
GPT\_4O\_MINI\_TTS("gpt-4o-mini-tts")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 2>)
GPT\_4O\_MINI\_TTS\_2025\_12\_15("gpt-4o-mini-tts-2025-12-15")
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 3>)
[](<#(resource) audio.speech > (model) speech_model > (schema)>)