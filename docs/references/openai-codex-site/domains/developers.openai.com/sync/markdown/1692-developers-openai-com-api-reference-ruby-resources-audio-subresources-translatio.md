Translations | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Audio](/api/reference/ruby/resources/audio)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Translations
Turn audio into text or text into audio.
##### [Create translation](/api/reference/ruby/resources/audio/subresources/translations/methods/create)
audio.translations.create(\*\*kwargs) -\> [TranslationCreateResponse](</api/reference/ruby/resources/audio#(resource) audio.translations > (model) translation_create_response > (schema)>)
POST/audio/translations
##### ModelsExpand Collapse
class Translation { text }
text: String
[](<#(resource) audio.translations > (model) translation > (schema) > (property) text>)
[](<#(resource) audio.translations > (model) translation > (schema)>)
class TranslationVerbose { duration, language, text, segments }
duration: Float
The duration of the input audio.
formatdouble
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) duration>)
language: String
The language of the output translation (always `english`).
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) language>)
text: String
The translated text.
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) text>)
segments: Array[[TranscriptionSegment](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>) { id, avg\_logprob, compression\_ratio, 7 more } ]
Segments of the translated text and their corresponding details.
id: Integer
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
avg\_logprob: Float
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
compression\_ratio: Float
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
end\_: Float
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
no\_speech\_prob: Float
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
seek: Integer
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
start: Float
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
temperature: Float
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
text: String
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
tokens: Array[Integer]
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) segments>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema)>)
TranslationCreateResponse = [Translation](</api/reference/ruby/resources/audio#(resource) audio.translations > (model) translation > (schema)>) { text } | [TranslationVerbose](</api/reference/ruby/resources/audio#(resource) audio.translations > (model) translation_verbose > (schema)>) { duration, language, text, segments }
One of the following:
class Translation { text }
text: String
[](<#(resource) audio.translations > (model) translation > (schema) > (property) text>)
[](<#(resource) audio.translations > (model) translation > (schema)>)
class TranslationVerbose { duration, language, text, segments }
duration: Float
The duration of the input audio.
formatdouble
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) duration>)
language: String
The language of the output translation (always `english`).
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) language>)
text: String
The translated text.
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) text>)
segments: Array[[TranscriptionSegment](</api/reference/ruby/resources/audio#(resource) audio.transcriptions > (model) transcription_segment > (schema)>) { id, avg\_logprob, compression\_ratio, 7 more } ]
Segments of the translated text and their corresponding details.
id: Integer
Unique identifier of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) id>)
avg\_logprob: Float
Average logprob of the segment. If the value is lower than -1, consider the logprobs failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) avg_logprob>)
compression\_ratio: Float
Compression ratio of the segment. If the value is greater than 2.4, consider the compression failed.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) compression_ratio>)
end\_: Float
End time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) end>)
no\_speech\_prob: Float
Probability of no speech in the segment. If the value is higher than 1.0 and the `avg\_logprob` is below -1, consider this segment silent.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) no_speech_prob>)
seek: Integer
Seek offset of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) seek>)
start: Float
Start time of the segment in seconds.
formatdouble
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) start>)
temperature: Float
Temperature parameter used for generating the segment.
formatfloat
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) temperature>)
text: String
Text content of the segment.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) text>)
tokens: Array[Integer]
Array of token IDs for the text content.
[](<#(resource) audio.transcriptions > (model) transcription_segment > (schema) > (property) tokens>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema) > (property) segments>)
[](<#(resource) audio.translations > (model) translation_verbose > (schema)>)
[](<#(resource) audio.translations > (model) translation_create_response > (schema)>)