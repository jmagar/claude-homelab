Create image edit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Images](/api/reference/resources/images)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create image edit
POST/images/edits
Creates an edited or extended image given one or more source images and a prompt. This endpoint supports GPT Image models (`gpt-image-1.5`, `gpt-image-1`, `gpt-image-1-mini`, and `chatgpt-image-latest`) and `dall-e-2`.
##### Body ParametersJSONExpand Collapse
images: array of object { file\_id, image\_url }
Input image references to edit.
For GPT image models, you can provide up to 16 images.
file\_id: optional string
The File API ID of an uploaded image to use as input.
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) images > (schema) > (items) > (property) file_id>)
image\_url: optional string
A fully qualified URL or base64-encoded data URL.
formaturi
maxLength20971520
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) images > (schema) > (items) > (property) image_url>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) images > (schema)>)
prompt: string
A text description of the desired image edit.
minLength1
maxLength32000
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) prompt > (schema)>)
background: optional "transparent" or "opaque" or "auto"
Background behavior for generated image output.
One of the following:
"transparent"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) background > (schema) > (member) 0>)
"opaque"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) background > (schema) > (member) 1>)
"auto"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) background > (schema) > (member) 2>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) background > (schema)>)
input\_fidelity: optional "high" or "low"
Controls fidelity to the original input image(s).
One of the following:
"high"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) input_fidelity > (schema) > (member) 0>)
"low"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) input_fidelity > (schema) > (member) 1>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) input_fidelity > (schema)>)
mask: optional object { file\_id, image\_url }
Reference an input image by either URL or uploaded file ID.
Provide exactly one of `image\_url` or `file\_id`.
file\_id: optional string
The File API ID of an uploaded image to use as input.
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) mask > (schema) > (property) file_id>)
image\_url: optional string
A fully qualified URL or base64-encoded data URL.
formaturi
maxLength20971520
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) mask > (schema) > (property) image_url>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) mask > (schema)>)
model: optional string or "gpt-image-1.5" or "gpt-image-1" or "gpt-image-1-mini" or "chatgpt-image-latest"
The model to use for image editing.
One of the following:
string
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) model > (schema) > (variant) 0>)
"gpt-image-1.5" or "gpt-image-1" or "gpt-image-1-mini" or "chatgpt-image-latest"
The model to use for image editing.
One of the following:
"gpt-image-1.5"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 0>)
"gpt-image-1"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 1>)
"gpt-image-1-mini"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 2>)
"chatgpt-image-latest"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 3>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) model > (schema) > (variant) 1>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) model > (schema)>)
moderation: optional "low" or "auto"
Moderation level for GPT image models.
One of the following:
"low"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) moderation > (schema) > (member) 0>)
"auto"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) moderation > (schema) > (member) 1>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) moderation > (schema)>)
n: optional number
The number of edited images to generate.
minimum1
maximum10
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) n > (schema)>)
output\_compression: optional number
Compression level for `jpeg` or `webp` output.
minimum0
maximum100
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) output_compression > (schema)>)
output\_format: optional "png" or "jpeg" or "webp"
Output image format. Supported for GPT image models.
One of the following:
"png"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) output_format > (schema) > (member) 0>)
"jpeg"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) output_format > (schema) > (member) 1>)
"webp"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) output_format > (schema) > (member) 2>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) output_format > (schema)>)
partial\_images: optional number
The number of partial images to generate. This parameter is used for
streaming responses that return partial images. Value must be between 0 and 3.
When set to 0, the response will be a single image sent in one streaming event.
Note that the final image may be sent before the full number of partial images
are generated if the full image is generated more quickly.
maximum3
minimum0
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) partial_images > (schema)>)
quality: optional "low" or "medium" or "high" or "auto"
Output quality for GPT image models.
One of the following:
"low"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) quality > (schema) > (member) 0>)
"medium"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) quality > (schema) > (member) 1>)
"high"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) quality > (schema) > (member) 2>)
"auto"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) quality > (schema) > (member) 3>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) quality > (schema)>)
size: optional "auto" or "1024x1024" or "1536x1024" or "1024x1536"
Requested output image size.
One of the following:
"auto"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) size > (schema) > (member) 0>)
"1024x1024"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) size > (schema) > (member) 1>)
"1536x1024"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) size > (schema) > (member) 2>)
"1024x1536"
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) size > (schema) > (member) 3>)
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) size > (schema)>)
stream: optional boolean
Stream partial image results as events.
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) stream > (schema)>)
user: optional string
A unique identifier representing your end-user, which can help OpenAI
monitor and detect abuse.
[](<#(resource) images > (method) edit > (params) 0.non_streaming > (param) user > (schema)>)
##### ReturnsExpand Collapse
ImagesResponse object { created, background, data, 4 more }
The response from the image generation endpoint.
created: number
The Unix timestamp (in seconds) of when the image was created.
formatunixtime
[](<#(resource) images > (model) images_response > (schema) > (property) created>)
background: optional "transparent" or "opaque"
The background parameter used for the image generation. Either `transparent` or `opaque`.
One of the following:
"transparent"
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 0>)
"opaque"
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 1>)
[](<#(resource) images > (model) images_response > (schema) > (property) background>)
data: optional array of [Image](</api/reference/resources/images#(resource) images > (model) image > (schema)>) { b64\_json, revised\_prompt, url }
The list of generated images.
b64\_json: optional string
The base64-encoded JSON of the generated image. Returned by default for the GPT image models, and only present if `response\_format` is set to `b64\_json` for `dall-e-2` and `dall-e-3`.
[](<#(resource) images > (model) image > (schema) > (property) b64_json>)
revised\_prompt: optional string
For `dall-e-3` only, the revised prompt that was used to generate the image.
[](<#(resource) images > (model) image > (schema) > (property) revised_prompt>)
url: optional string
When using `dall-e-2` or `dall-e-3`, the URL of the generated image if `response\_format` is set to `url` (default value). Unsupported for the GPT image models.
formaturi
[](<#(resource) images > (model) image > (schema) > (property) url>)
[](<#(resource) images > (model) images_response > (schema) > (property) data>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the image generation. Either `png`, `webp`, or `jpeg`.
One of the following:
"png"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 0>)
"webp"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) output_format>)
quality: optional "low" or "medium" or "high"
The quality of the image generated. Either `low`, `medium`, or `high`.
One of the following:
"low"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 0>)
"medium"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 1>)
"high"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024"
The size of the image generated. Either `1024x1024`, `1024x1536`, or `1536x1024`.
One of the following:
"1024x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) size>)
usage: optional object { input\_tokens, input\_tokens\_details, output\_tokens, 2 more }
For `gpt-image-1` only, the token usage information for the image generation.
input\_tokens: number
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens>)
input\_tokens\_details: object { image\_tokens, text\_tokens }
The input tokens detailed information for the image generation.
image\_tokens: number
The number of image tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
text\_tokens: number
The number of text tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details>)
output\_tokens: number
The number of output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: number
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) total_tokens>)
output\_tokens\_details: optional object { image\_tokens, text\_tokens }
The output token details for the image generation.
image\_tokens: number
The number of image output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) image_tokens>)
text\_tokens: number
The number of text output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage>)
[](<#(resource) images > (model) images_response > (schema)>)
Edit imageStreaming
### Create image edit
HTTP
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
`curl -s -D \>(grep -i x-request-id \>&2) \\
-o \>(jq -r '.data[0].b64\_json' | base64 --decode \> gift-basket.png) \\
-X POST "https://api.openai.com/v1/images/edits" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F "model=gpt-image-1.5" \\
-F "image[]=@body-lotion.png" \\
-F "image[]=@bath-bomb.png" \\
-F "image[]=@incense-kit.png" \\
-F "image[]=@soap.png" \\
-F 'prompt=Create a lovely gift basket with these four items in it'
`
```
### Create image edit
HTTP
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
`curl -s -N -X POST "https://api.openai.com/v1/images/edits" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F "model=gpt-image-1.5" \\
-F "image[]=@body-lotion.png" \\
-F "image[]=@bath-bomb.png" \\
-F "image[]=@incense-kit.png" \\
-F "image[]=@soap.png" \\
-F 'prompt=Create a lovely gift basket with these four items in it' \\
-F "stream=true"
`
```
```
`event: image\_edit.partial\_image
data: {"type":"image\_edit.partial\_image","b64\_json":"...","partial\_image\_index":0}
event: image\_edit.completed
data: {"type":"image\_edit.completed","b64\_json":"...","usage":{"total\_tokens":100,"input\_tokens":50,"output\_tokens":50,"input\_tokens\_details":{"text\_tokens":10,"image\_tokens":40}}}
`
```
##### Returns Examples
200 example
```
`{
"created": 0,
"background": "transparent",
"data": [
{
"b64\_json": "b64\_json",
"revised\_prompt": "revised\_prompt",
"url": "https://example.com"
}
],
"output\_format": "png",
"quality": "low",
"size": "1024x1024",
"usage": {
"input\_tokens": 0,
"input\_tokens\_details": {
"image\_tokens": 0,
"text\_tokens": 0
},
"output\_tokens": 0,
"total\_tokens": 0,
"output\_tokens\_details": {
"image\_tokens": 0,
"text\_tokens": 0
}
}
}`
```