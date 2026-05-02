Images | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Images
Given a prompt and/or an input image, the model will generate a new image.
#### resource openai\_image
##### required Expand Collapse
image: String
The image(s) to edit. Must be a supported image file or an array of images.
For the GPT image models (`gpt-image-1`, `gpt-image-1-mini`, and `gpt-image-1.5`), each image should be a `png`, `webp`, or `jpg`
file less than 50MB. You can provide up to 16 images.
`chatgpt-image-latest` follows the same input constraints as GPT image models.
For `dall-e-2`, you can only provide one image, and it should be a square
`png` file less than 4MB.
[](<#(resource) images > (terraform resource) > (attribute) image>)
prompt: String
A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2`, and 32000 characters for the GPT image models.
[](<#(resource) images > (terraform resource) > (attribute) prompt>)
##### optional Expand Collapse
input\_fidelity?: String
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
[](<#(resource) images > (terraform resource) > (attribute) input_fidelity>)
mask?: String
An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. If there are multiple images provided, the mask will be applied on the first image. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
[](<#(resource) images > (terraform resource) > (attribute) mask>)
model?: String
The model to use for image generation. Defaults to `gpt-image-1.5`.
[](<#(resource) images > (terraform resource) > (attribute) model>)
response\_format?: String
The format in which the generated images are returned. Must be one of `url` or `b64\_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter is only supported for `dall-e-2` (default is `url` for `dall-e-2`), as GPT image models always return base64-encoded images.
[](<#(resource) images > (terraform resource) > (attribute) response_format>)
stream?: Bool
Edit the image in streaming mode. Defaults to `false`. See the
[Image generation guide](https://platform.openai.com/docs/guides/image-generation) for more information.
[](<#(resource) images > (terraform resource) > (attribute) stream>)
user?: String
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) images > (terraform resource) > (attribute) user>)
background?: String
Allows to set transparency for the background of the generated image(s).
This parameter is only supported for the GPT image models. Must be one of
`transparent`, `opaque` or `auto` (default value). When `auto` is used, the
model will automatically determine the best background for the image.
If `transparent`, the output format needs to support transparency, so it
should be set to either `png` (default value) or `webp`.
[](<#(resource) images > (terraform resource) > (attribute) background>)
n?: Int64
The number of images to generate. Must be between 1 and 10.
[](<#(resource) images > (terraform resource) > (attribute) n>)
output\_compression?: Int64
The compression level (0-100%) for the generated images. This parameter
is only supported for the GPT image models with the `webp` or `jpeg` output
formats, and defaults to 100.
[](<#(resource) images > (terraform resource) > (attribute) output_compression>)
output\_format?: String
The format in which the generated images are returned. This parameter is
only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.
The default value is `png`.
[](<#(resource) images > (terraform resource) > (attribute) output_format>)
partial\_images?: Int64
The number of partial images to generate. This parameter is used for
streaming responses that return partial images. Value must be between 0 and 3.
When set to 0, the response will be a single image sent in one streaming event.
Note that the final image may be sent before the full number of partial images
are generated if the full image is generated more quickly.
[](<#(resource) images > (terraform resource) > (attribute) partial_images>)
quality?: String
The quality of the image that will be generated for GPT image models. Defaults to `auto`.
[](<#(resource) images > (terraform resource) > (attribute) quality>)
size?: String
The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for the GPT image models, and one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`.
[](<#(resource) images > (terraform resource) > (attribute) size>)
##### computed Expand Collapse
created: Int64
The Unix timestamp (in seconds) of when the image was created.
[](<#(resource) images > (terraform resource) > (attribute) created>)
data: List[Attributes]
The list of generated images.
b64\_json: String
The base64-encoded JSON of the generated image. Returned by default for the GPT image models, and only present if `response\_format` is set to `b64\_json` for `dall-e-2` and `dall-e-3`.
[](<#(resource) images > (terraform resource) > (attribute) data > (attribute) b64_json>)
revised\_prompt: String
For `dall-e-3` only, the revised prompt that was used to generate the image.
[](<#(resource) images > (terraform resource) > (attribute) data > (attribute) revised_prompt>)
url: String
When using `dall-e-2` or `dall-e-3`, the URL of the generated image if `response\_format` is set to `url` (default value). Unsupported for the GPT image models.
[](<#(resource) images > (terraform resource) > (attribute) data > (attribute) url>)
[](<#(resource) images > (terraform resource) > (attribute) data>)
usage: Attributes
For `gpt-image-1` only, the token usage information for the image generation.
input\_tokens: Int64
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) input_tokens>)
input\_tokens\_details: Attributes
The input tokens detailed information for the image generation.
image\_tokens: Int64
The number of image tokens in the input prompt.
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) input_tokens_details > (attribute) image_tokens>)
text\_tokens: Int64
The number of text tokens in the input prompt.
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) input_tokens_details > (attribute) text_tokens>)
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) input_tokens_details>)
output\_tokens: Int64
The number of output tokens generated by the model.
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) output_tokens>)
total\_tokens: Int64
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) total_tokens>)
output\_tokens\_details: Attributes
The output token details for the image generation.
image\_tokens: Int64
The number of image output tokens generated by the model.
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) output_tokens_details > (attribute) image_tokens>)
text\_tokens: Int64
The number of text output tokens generated by the model.
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) output_tokens_details > (attribute) text_tokens>)
[](<#(resource) images > (terraform resource) > (attribute) usage > (attribute) output_tokens_details>)
[](<#(resource) images > (terraform resource) > (attribute) usage>)
### openai\_image
Terraform
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
`resource "openai\_image" "example\_image" {
image = "Example data"
prompt = "A cute baby sea otter wearing a beret"
background = "transparent"
input\_fidelity = "high"
mask = "Example data"
model = "string"
n = 1
output\_compression = 100
output\_format = "png"
partial\_images = 1
quality = "high"
response\_format = "url"
size = "1024x1024"
stream = false
user = "user-1234"
}
`
```