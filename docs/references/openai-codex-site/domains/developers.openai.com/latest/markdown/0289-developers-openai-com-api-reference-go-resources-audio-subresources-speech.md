Speech | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Audio](/api/reference/go/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Speech
Turn audio into text or text into audio.
##### [Create speech](/api/reference/go/resources/audio/subresources/speech/methods/create)
client.Audio.Speech.New(ctx, body) (\*Response, error)
POST/audio/speech
##### ModelsExpand Collapse
type SpeechModel string
One of the following:
const SpeechModelTTS1 [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "tts-1"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 0>)
const SpeechModelTTS1HD [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "tts-1-hd"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 1>)
const SpeechModelGPT4oMiniTTS [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "gpt-4o-mini-tts"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 2>)
const SpeechModelGPT4oMiniTTS2025\_12\_15 [SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>) = "gpt-4o-mini-tts-2025-12-15"
[](<#(resource) audio.speech > (model) speech_model > (schema) > (member) 3>)
[](<#(resource) audio.speech > (model) speech_model > (schema)>)