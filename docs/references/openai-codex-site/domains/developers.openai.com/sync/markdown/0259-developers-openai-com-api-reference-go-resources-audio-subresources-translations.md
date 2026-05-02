Create translation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Audio](/api/reference/go/resources/audio)
[Translations](/api/reference/go/resources/audio/subresources/translations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create translation
client.Audio.Translations.New(ctx, body) (\*[Translation](</api/reference/go/resources/audio#(resource) audio.translations > (model) translation > (schema)>), error)
POST/audio/translations
Translates audio into English.
##### ParametersExpand Collapse
body AudioTranslationNewParams
File param.Field[[Reader](</api/reference/go/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) file > (schema)>)]
The audio file object (not file name) translate, in one of these formats: flac, mp3, mp4, mpeg, mpga, m4a, ogg, wav, or webm.
[](<#(resource) audio.translations > (method) create > (params) default > (param) file>)
Model param.Field[[AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>)]
ID of the model to use. Only `whisper-1` (which is powered by our open source Whisper V2 model) is currently available.
string
[](<#(resource) audio.translations > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
type AudioModel string
One of the following:
const AudioModelWhisper1 [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "whisper-1"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 0>)
const AudioModelGPT4oTranscribe [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 1>)
const AudioModelGPT4oMiniTranscribe [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-mini-transcribe"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 2>)
const AudioModelGPT4oMiniTranscribe2025\_12\_15 [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-mini-transcribe-2025-12-15"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 3>)
const AudioModelGPT4oTranscribeDiarize [AudioModel](</api/reference/go/resources/audio#(resource) audio > (model) audio_model > (schema)>) = "gpt-4o-transcribe-diarize"
[](<#(resource) audio > (model) audio_model > (schema) > (member) 4>)
[](<#(resource) audio > (model) audio_model > (schema)>)
[](<#(resource) audio.translations > (method) create > (params) default > (param) model>)
Prompt param.Field[string]Optional
An optional text to guide the model’s style or continue a previous audio segment. The [prompt](https://platform.openai.com/docs/guides/speech-to-text#prompting) should be in English.
[](<#(resource) audio.translations > (method) create > (params) default > (param) prompt>)
ResponseFormat param.Field[[AudioTranslationNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema)>)]Optional
The format of the output, in one of these options: `json`, `text`, `srt`, `verbose\_json`, or `vtt`.
const AudioTranslationNewParamsResponseFormatJSON [AudioTranslationNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema)>) = "json"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 0>)
const AudioTranslationNewParamsResponseFormatText [AudioTranslationNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema)>) = "text"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 1>)
const AudioTranslationNewParamsResponseFormatSRT [AudioTranslationNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema)>) = "srt"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 2>)
const AudioTranslationNewParamsResponseFormatVerboseJSON [AudioTranslationNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema)>) = "verbose\_json"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 3>)
const AudioTranslationNewParamsResponseFormatVTT [AudioTranslationNewParamsResponseFormat](</api/reference/go/resources/audio/subresources/translations/methods/create#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema)>) = "vtt"
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format > (schema) > (member) 4>)
[](<#(resource) audio.translations > (method) create > (params) default > (param) response_format>)
Temperature param.Field[float64]Optional
The sampling temperature, between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use [log probability](https://en.wikipedia.org/wiki/Log_probability) to automatically increase the temperature until certain thresholds are hit.
[](<#(resource) audio.translations > (method) create > (params) default > (param) temperature>)
[](<#(resource) audio.translations > (method) create > (params) default>)
##### ReturnsExpand Collapse
type AudioTranslationNewResponse interface{…}
One of the following:
type Translation struct{…}
Text string
[](<#(resource) audio.translations > (model) translation > (schema) > (property) text>)
[](<#(resource) audio.translations > (model) translation > (schema)>)
[](<#(resource) audio.translations > (method) create > (network schema)>)
### Create translation
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
"bytes"
"context"
"fmt"
"io"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
translation, err := client.Audio.Translations.New(context.TODO(), openai.AudioTranslationNewParams{
File: io.Reader(bytes.NewBuffer([]byte("Example data"))),
Model: openai.AudioModelWhisper1,
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", translation)
}
`
```
```
`{
"text": "Hello, my name is Wolfgang and I come from Germany. Where are you heading today?"
}
`
```
##### Returns Examples
```
`{
"text": "Hello, my name is Wolfgang and I come from Germany. Where are you heading today?"
}
`
```