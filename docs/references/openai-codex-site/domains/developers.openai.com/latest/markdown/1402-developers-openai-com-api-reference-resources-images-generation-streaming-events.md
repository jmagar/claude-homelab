Image generation streaming events | OpenAI API Reference
[Skip to content](#_top)
Image generation streaming events
Emitted when a partial image is available during image generation streaming.
b64\_json: string
Base64-encoded partial image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) b64_json>)
background: "transparent" or "opaque" or "auto"
The background setting for the requested image.
One of the following:
"transparent"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) background > (member) 0>)
"opaque"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) background > (member) 1>)
"auto"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) background>)
created\_at: number
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) created_at>)
output\_format: "png" or "webp" or "jpeg"
The output format for the requested image.
One of the following:
"png"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) output_format > (member) 0>)
"webp"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) output_format>)
partial\_image\_index: number
0-based index for the partial image (streaming).
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) partial_image_index>)
quality: "low" or "medium" or "high" or "auto"
The quality setting for the requested image.
One of the following:
"low"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) quality > (member) 0>)
"medium"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) quality > (member) 1>)
"high"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) quality > (member) 2>)
"auto"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) quality>)
size: "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the requested image.
One of the following:
"1024x1024"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) size > (member) 2>)
"auto"
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) size>)
type: "image\_generation.partial\_image"
The type of the event. Always `image\_generation.partial\_image`.
[](<#(resource) images > (model) image_gen_partial_image_event > (schema) > (property) type>)
OBJECT### image\_generation.partial\_image
```
`{
"type": "image\_generation.partial\_image",
"b64\_json": "...",
"created\_at": 1620000000,
"size": "1024x1024",
"quality": "high",
"background": "transparent",
"output\_format": "png",
"partial\_image\_index": 0
}`
```
Emitted when image generation has completed and the final image is available.
b64\_json: string
Base64-encoded image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) b64_json>)
background: "transparent" or "opaque" or "auto"
The background setting for the generated image.
One of the following:
"transparent"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) background > (member) 0>)
"opaque"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) background > (member) 1>)
"auto"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) background>)
created\_at: number
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) created_at>)
output\_format: "png" or "webp" or "jpeg"
The output format for the generated image.
One of the following:
"png"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) output_format > (member) 0>)
"webp"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) output_format>)
quality: "low" or "medium" or "high" or "auto"
The quality setting for the generated image.
One of the following:
"low"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) quality > (member) 0>)
"medium"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) quality > (member) 1>)
"high"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) quality > (member) 2>)
"auto"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) quality>)
size: "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image.
One of the following:
"1024x1024"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) size > (member) 2>)
"auto"
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) size>)
type: "image\_generation.completed"
The type of the event. Always `image\_generation.completed`.
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) type>)
usage: object { input\_tokens, input\_tokens\_details, output\_tokens, total\_tokens }
For the GPT image models only, the token usage information for the image generation.
input\_tokens: number
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) usage > (property) input_tokens>)
input\_tokens\_details: object { image\_tokens, text\_tokens }
The input tokens detailed information for the image generation.
image\_tokens: number
The number of image tokens in the input prompt.
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
text\_tokens: number
The number of text tokens in the input prompt.
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) usage > (property) input_tokens_details>)
output\_tokens: number
The number of image tokens in the output image.
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: number
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) images > (model) image_gen_completed_event > (schema) > (property) usage>)
OBJECT### image\_generation.completed
```
`{
"type": "image\_generation.completed",
"b64\_json": "...",
"created\_at": 1620000000,
"size": "1024x1024",
"quality": "high",
"background": "transparent",
"output\_format": "png",
"usage": {
"total\_tokens": 100,
"input\_tokens": 50,
"output\_tokens": 50,
"input\_tokens\_details": {
"text\_tokens": 10,
"image\_tokens": 40
}
}
}`
```