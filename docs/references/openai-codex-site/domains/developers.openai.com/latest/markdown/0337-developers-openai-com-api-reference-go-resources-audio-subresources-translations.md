Translations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Audio](/api/reference/go/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Translations
Turn audio into text or text into audio.
##### [Create translation](/api/reference/go/resources/audio/subresources/translations/methods/create)
client.Audio.Translations.New(ctx, body) (\*[Translation](</api/reference/go/resources/audio#(resource) audio.translations > (model) translation > (schema)>), error)
POST/audio/translations
##### ModelsExpand Collapse
type Translation struct{…}
Text string
[](<#(resource) audio.translations > (model) translation > (schema) > (property) text>)
[](<#(resource) audio.translations > (model) translation > (schema)>)
type TranslationVerbose struct{…}
Duration float64
The duration of the input audio.
formatdouble
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) duration>)
Language string
The language of the output translation (always `english`).
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) language>)
Text string
The translated text.
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) text>)
Segments [][TranscriptionSegment](</api/reference/go/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>)Optional
Segments of the translated text and their corresponding details.
ID int64
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
AvgLogprob float64
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
CompressionRatio float64
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
End float64
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
NoSpeechProb float64
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
Seek int64
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
Start float64
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
Temperature float64
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
Text string
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
Tokens []int64
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) segments>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema)>)