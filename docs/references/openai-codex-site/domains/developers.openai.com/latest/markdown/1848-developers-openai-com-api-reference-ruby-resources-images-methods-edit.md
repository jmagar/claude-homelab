Create image edit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Images](/api/reference/ruby/resources/images)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create image edit
images.edit(\*\*kwargs) -\> [ImagesResponse](</api/reference/ruby/resources/images#(resource) images > (model) images_response > (schema)>) { created, background, data, 4 more }
POST/images/edits
Creates an edited or extended image given one or more source images and a prompt. This endpoint supports GPT Image models (`gpt-image-1.5`, `gpt-image-1`, `gpt-image-1-mini`, and `chatgpt-image-latest`) and `dall-e-2`.
##### ParametersExpand Collapse
image: String | Array[String]
The image(s) to edit. Must be a supported image file or an array of images.
For the GPT image models (`gpt-image-1`, `gpt-image-1-mini`, and `gpt-image-1.5`), each image should be a `png`, `webp`, or `jpg`
file less than 50MB. You can provide up to 16 images.
`chatgpt-image-latest` follows the same input constraints as GPT image models.
For `dall-e-2`, you can only provide one image, and it should be a square
`png` file less than 4MB.
One of the following:
String = String
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) image > (schema) > (variant) 0>)
UnionMember1 = Array[String]
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) image > (schema) > (variant) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) image > (schema)>)
prompt: String
A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2`, and 32000 characters for the GPT image models.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) prompt > (schema)>)
background: :transparent | :opaque | :auto
Allows to set transparency for the background of the generated image(s).
This parameter is only supported for the GPT image models. Must be one of
`transparent`, `opaque` or `auto` (default value). When `auto` is used, the
model will automatically determine the best background for the image.
If `transparent`, the output format needs to support transparency, so it
should be set to either `png` (default value) or `webp`.
One of the following:
:transparent
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema) > (member) 0>)
:opaque
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema) > (member) 1>)
:auto
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema) > (member) 2>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema)>)
input\_fidelity: :high | :low
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
:high
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema) > (member) 0>)
:low
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema) > (member) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema)>)
mask: FileInput
An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. If there are multiple images provided, the mask will be applied on the first image. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) mask > (schema)>)
model: String | [ImageModel](</api/reference/ruby/resources/images#(resource) images > (model) image_model > (schema)>)
The model to use for image generation. Defaults to `gpt-image-1.5`.
One of the following:
String = String
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
ImageModel = :"gpt-image-1.5" | :"dall-e-2" | :"dall-e-3" | 2 more
One of the following:
:"gpt-image-1.5"
[](<#(resource) images > (model) image_model > (schema) > (member) 0>)
:"dall-e-2"
[](<#(resource) images > (model) image_model > (schema) > (member) 1>)
:"dall-e-3"
[](<#(resource) images > (model) image_model > (schema) > (member) 2>)
:"gpt-image-1"
[](<#(resource) images > (model) image_model > (schema) > (member) 3>)
:"gpt-image-1-mini"
[](<#(resource) images > (model) image_model > (schema) > (member) 4>)
[](<#(resource) images > (model) image_model > (schema)>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) model > (schema)>)
n: Integer
The number of images to generate. Must be between 1 and 10.
minimum1
maximum10
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) n > (schema)>)
output\_compression: Integer
The compression level (0-100%) for the generated images. This parameter
is only supported for the GPT image models with the `webp` or `jpeg` output
formats, and defaults to 100.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_compression > (schema)>)
output\_format: :png | :jpeg | :webp
The format in which the generated images are returned. This parameter is
only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.
The default value is `png`.
One of the following:
:png
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema) > (member) 0>)
:jpeg
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema) > (member) 1>)
:webp
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema) > (member) 2>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema)>)
partial\_images: Integer
The number of partial images to generate. This parameter is used for
streaming responses that return partial images. Value must be between 0 and 3.
When set to 0, the response will be a single image sent in one streaming event.
Note that the final image may be sent before the full number of partial images
are generated if the full image is generated more quickly.
maximum3
minimum0
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) partial_images > (schema)>)
quality: :standard | :low | :medium | 2 more
The quality of the image that will be generated for GPT image models. Defaults to `auto`.
One of the following:
:standard
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 0>)
:low
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 1>)
:medium
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 2>)
:high
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 3>)
:auto
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 4>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema)>)
response\_format: :url | :b64\_json
The format in which the generated images are returned. Must be one of `url` or `b64\_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter is only supported for `dall-e-2` (default is `url` for `dall-e-2`), as GPT image models always return base64-encoded images.
One of the following:
:url
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema) > (member) 0>)
:b64\_json
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema) > (member) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema)>)
size: :"256x256" | :"512x512" | :"1024x1024" | 3 more
The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for the GPT image models, and one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`.
One of the following:
:"256x256"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 0>)
:"512x512"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 1>)
:"1024x1024"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 2>)
:"1536x1024"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 3>)
:"1024x1536"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 4>)
:auto
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 5>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>)
stream: bool
Edit the image in streaming mode. Defaults to `false`. See the
[Image generation guide](https://platform.openai.com/docs/guides/image-generation) for more information.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) stream > (schema)>)
user: String
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) user > (schema)>)
##### ReturnsExpand Collapse
class ImagesResponse { created, background, data, 4 more }
The response from the image generation endpoint.
created: Integer
The Unix timestamp (in seconds) of when the image was created.
formatunixtime
[](<#(resource) images > (model) images_response > (schema) > (property) created>)
background: :transparent | :opaque
The background parameter used for the image generation. Either `transparent` or `opaque`.
One of the following:
:transparent
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 0>)
:opaque
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 1>)
[](<#(resource) images > (model) images_response > (schema) > (property) background>)
data: Array[[Image](</api/reference/ruby/resources/images#(resource) images > (model) image > (schema)>) { b64\_json, revised\_prompt, url } ]
The list of generated images.
b64\_json: String
The base64-encoded JSON of the generated image. Returned by default for the GPT image models, and only present if `response\_format` is set to `b64\_json` for `dall-e-2` and `dall-e-3`.
[](<#(resource) images > (model) image > (schema) > (property) b64_json>)
revised\_prompt: String
For `dall-e-3` only, the revised prompt that was used to generate the image.
[](<#(resource) images > (model) image > (schema) > (property) revised_prompt>)
url: String
When using `dall-e-2` or `dall-e-3`, the URL of the generated image if `response\_format` is set to `url` (default value). Unsupported for the GPT image models.
formaturi
[](<#(resource) images > (model) image > (schema) > (property) url>)
[](<#(resource) images > (model) images_response > (schema) > (property) data>)
output\_format: :png | :webp | :jpeg
The output format of the image generation. Either `png`, `webp`, or `jpeg`.
One of the following:
:png
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 0>)
:webp
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 1>)
:jpeg
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) output_format>)
quality: :low | :medium | :high
The quality of the image generated. Either `low`, `medium`, or `high`.
One of the following:
:low
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 0>)
:medium
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 1>)
:high
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) quality>)
size: :"1024x1024" | :"1024x1536" | :"1536x1024"
The size of the image generated. Either `1024x1024`, `1024x1536`, or `1536x1024`.
One of the following:
:"1024x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 0>)
:"1024x1536"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 1>)
:"1536x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) size>)
usage: Usage{ input\_tokens, input\_tokens\_details, output\_tokens, 2 more}
For `gpt-image-1` only, the token usage information for the image generation.
input\_tokens: Integer
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens>)
input\_tokens\_details: InputTokensDetails{ image\_tokens, text\_tokens}
The input tokens detailed information for the image generation.
image\_tokens: Integer
The number of image tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
text\_tokens: Integer
The number of text tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details>)
output\_tokens: Integer
The number of output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: Integer
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) total_tokens>)
output\_tokens\_details: OutputTokensDetails{ image\_tokens, text\_tokens}
The output token details for the image generation.
image\_tokens: Integer
The number of image output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) image_tokens>)
text\_tokens: Integer
The number of text output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage>)
[](<#(resource) images > (model) images_response > (schema)>)
ImageEditStreamEvent = [ImageEditPartialImageEvent](</api/reference/ruby/resources/images#(resource) images > (model) image_edit_partial_image_event > (schema)>) { b64\_json, background, created\_at, 5 more } | [ImageEditCompletedEvent](</api/reference/ruby/resources/images#(resource) images > (model) image_edit_completed_event > (schema)>) { b64\_json, background, created\_at, 5 more }
Emitted when a partial image is available during image editing streaming.
One of the following:
class ImageEditPartialImageEvent { b64\_json, background, created\_at, 5 more }
Emitted when a partial image is available during image editing streaming.
b64\_json: String
Base64-encoded partial image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) b64_json>)
background: :transparent | :opaque | :auto
The background setting for the requested edited image.
One of the following:
:transparent
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 0>)
:opaque
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 1>)
:auto
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background>)
created\_at: Integer
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) created_at>)
output\_format: :png | :webp | :jpeg
The output format for the requested edited image.
One of the following:
:png
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 0>)
:webp
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 1>)
:jpeg
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format>)
partial\_image\_index: Integer
0-based index for the partial image (streaming).
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) partial_image_index>)
quality: :low | :medium | :high | :auto
The quality setting for the requested edited image.
One of the following:
:low
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 0>)
:medium
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 1>)
:high
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 2>)
:auto
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality>)
size: :"1024x1024" | :"1024x1536" | :"1536x1024" | :auto
The size of the requested edited image.
One of the following:
:"1024x1024"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 0>)
:"1024x1536"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 1>)
:"1536x1024"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 2>)
:auto
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size>)
type: :"image\_edit.partial\_image"
The type of the event. Always `image\_edit.partial\_image`.
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) type>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema)>)
class ImageEditCompletedEvent { b64\_json, background, created\_at, 5 more }
Emitted when image editing has completed and the final image is available.
b64\_json: String
Base64-encoded final edited image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) b64_json>)
background: :transparent | :opaque | :auto
The background setting for the edited image.
One of the following:
:transparent
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 0>)
:opaque
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 1>)
:auto
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background>)
created\_at: Integer
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) created_at>)
output\_format: :png | :webp | :jpeg
The output format for the edited image.
One of the following:
:png
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 0>)
:webp
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 1>)
:jpeg
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format>)
quality: :low | :medium | :high | :auto
The quality setting for the edited image.
One of the following:
:low
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 0>)
:medium
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 1>)
:high
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 2>)
:auto
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality>)
size: :"1024x1024" | :"1024x1536" | :"1536x1024" | :auto
The size of the edited image.
One of the following:
:"1024x1024"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 0>)
:"1024x1536"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 1>)
:"1536x1024"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 2>)
:auto
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size>)
type: :"image\_edit.completed"
The type of the event. Always `image\_edit.completed`.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) type>)
usage: Usage{ input\_tokens, input\_tokens\_details, output\_tokens, total\_tokens}
For the GPT image models only, the token usage information for the image generation.
input\_tokens: Integer
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens>)
input\_tokens\_details: InputTokensDetails{ image\_tokens, text\_tokens}
The input tokens detailed information for the image generation.
image\_tokens: Integer
The number of image tokens in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
text\_tokens: Integer
The number of text tokens in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details>)
output\_tokens: Integer
The number of image tokens in the output image.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: Integer
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage>)
[](<#(resource) images > (model) image_edit_completed_event > (schema)>)
[](<#(resource) images > (model) image_edit_stream_event > (schema)>)
### Create image edit
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
images\_response = openai.images.edit(image: StringIO.new("Example data"), prompt: "A cute baby sea otter wearing a beret")
puts(images\_response)`
```
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