Create speech | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Audio](/api/reference/go/resources/audio)
[Speech](/api/reference/go/resources/audio/subresources/speech)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create speech
client.Audio.Speech.New(ctx, body) (\*Response, error)
POST/audio/speech
Generates audio from the input text.
Returns the audio file content, or a stream of audio events.
##### ParametersExpand Collapse
body AudioSpeechNewParams
Input param.Field[string]
The text to generate audio for. The maximum length is 4096 characters.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) default > (param) input>)
Model param.Field[[SpeechModel](</api/reference/go/resources/audio#(resource) audio.speech > (model) speech_model > (schema)>)]
One of the available [TTS models](https://platform.openai.com/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
string
[](<#(resource) audio.speech > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
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
[](<#(resource) audio.speech > (method) create > (params) default > (param) model>)
Voice param.Field[[AudioSpeechNewParamsVoiceUnion](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema)>)]
The voice to use when generating the audio. Supported built-in voices are `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`, `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice object with an `id`, for example `{ "id": "voice\_1234" }`. Previews of the voices are available in the [Text to speech guide](https://platform.openai.com/docs/guides/text-to-speech#voice-options).
string
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 0>)
type AudioSpeechNewParamsVoiceString string
One of the following:
const AudioSpeechNewParamsVoiceStringAlloy AudioSpeechNewParamsVoiceString = "alloy"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 0>)
const AudioSpeechNewParamsVoiceStringAsh AudioSpeechNewParamsVoiceString = "ash"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 1>)
const AudioSpeechNewParamsVoiceStringBallad AudioSpeechNewParamsVoiceString = "ballad"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 2>)
const AudioSpeechNewParamsVoiceStringCoral AudioSpeechNewParamsVoiceString = "coral"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 3>)
const AudioSpeechNewParamsVoiceStringEcho AudioSpeechNewParamsVoiceString = "echo"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 4>)
const AudioSpeechNewParamsVoiceStringSage AudioSpeechNewParamsVoiceString = "sage"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 5>)
const AudioSpeechNewParamsVoiceStringShimmer AudioSpeechNewParamsVoiceString = "shimmer"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 6>)
const AudioSpeechNewParamsVoiceStringVerse AudioSpeechNewParamsVoiceString = "verse"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 7>)
const AudioSpeechNewParamsVoiceStringMarin AudioSpeechNewParamsVoiceString = "marin"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 8>)
const AudioSpeechNewParamsVoiceStringCedar AudioSpeechNewParamsVoiceString = "cedar"
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1 > (member) 9>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 1>)
type AudioSpeechNewParamsVoiceID struct{…}
Custom voice reference.
ID string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 2 > (property) id>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice > (schema) > (variant) 2>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) voice>)
Instructions param.Field[string]Optional
Control the voice of your generated audio with additional instructions. Does not work with `tts-1` or `tts-1-hd`.
maxLength4096
[](<#(resource) audio.speech > (method) create > (params) default > (param) instructions>)
ResponseFormat param.Field[[AudioSpeechNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema)>)]Optional
The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav`, and `pcm`.
const AudioSpeechNewParamsResponseFormatMP3 [AudioSpeechNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema)>) = "mp3"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 0>)
const AudioSpeechNewParamsResponseFormatOpus [AudioSpeechNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema)>) = "opus"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 1>)
const AudioSpeechNewParamsResponseFormatAAC [AudioSpeechNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema)>) = "aac"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 2>)
const AudioSpeechNewParamsResponseFormatFLAC [AudioSpeechNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema)>) = "flac"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 3>)
const AudioSpeechNewParamsResponseFormatWAV [AudioSpeechNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema)>) = "wav"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 4>)
const AudioSpeechNewParamsResponseFormatPCM [AudioSpeechNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema)>) = "pcm"
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format > (schema) > (member) 5>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) response_format>)
Speed param.Field[float64]Optional
The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is the default.
minimum0.25
maximum4
[](<#(resource) audio.speech > (method) create > (params) default > (param) speed>)
StreamFormat param.Field[[AudioSpeechNewParamsStreamFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) stream_format > (schema)>)]Optional
The format to stream the audio in. Supported formats are `sse` and `audio`. `sse` is not supported for `tts-1` or `tts-1-hd`.
const AudioSpeechNewParamsStreamFormatSSE [AudioSpeechNewParamsStreamFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) stream_format > (schema)>) = "sse"
[](<#(resource) audio.speech > (method) create > (params) default > (param) stream_format > (schema) > (member) 0>)
const AudioSpeechNewParamsStreamFormatAudio [AudioSpeechNewParamsStreamFormat](</api/reference/go/resources/audio/subresources/speech/methods/create#(resource) audio.speech > (method) create > (params) default > (param) stream_format > (schema)>) = "audio"
[](<#(resource) audio.speech > (method) create > (params) default > (param) stream_format > (schema) > (member) 1>)
[](<#(resource) audio.speech > (method) create > (params) default > (param) stream_format>)
[](<#(resource) audio.speech > (method) create > (params) default>)
##### ReturnsExpand Collapse
type AudioSpeechNewResponse interface{…}
[](<#(resource) audio.speech > (method) create > (network schema)>)
### Create speech
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
speech, err := client.Audio.Speech.New(context.TODO(), openai.AudioSpeechNewParams{
Input: "input",
Model: openai.SpeechModelTTS1,
Voice: openai.AudioSpeechNewParamsVoiceUnion{
OfString: openai.String("string"),
},
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", speech)
}
`
```
##### Returns Examples