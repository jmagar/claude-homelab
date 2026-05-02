Create image variation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Images](/api/reference/python/resources/images)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create image variation
images.create\_variation(ImageCreateVariationParams\*\*kwargs) -\> [ImagesResponse](</api/reference/python/resources/images#(resource) images > (model) images_response > (schema)>)
POST/images/variations
Creates a variation of a given image. This endpoint only supports `dall-e-2`.
##### ParametersExpand Collapse
image: [FileTypes](</api/reference/python/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) image > (schema)>)
The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
[](<#(resource) images > (method) create_variation > (params) default > (param) image > (schema)>)
model: Optional[Union[str, [ImageModel](</api/reference/python/resources/images#(resource) images > (model) image_model > (schema)>), null]]
The model to use for image generation. Only `dall-e-2` is supported at this time.
One of the following:
str
[](<#(resource) images > (method) create_variation > (params) default > (param) model > (schema) > (variant) 0>)
Literal["gpt-image-1.5", "dall-e-2", "dall-e-3", 2 more]
One of the following:
"gpt-image-1.5"
[](<#(resource) images > (model) image_model > (schema) > (member) 0>)
"dall-e-2"
[](<#(resource) images > (model) image_model > (schema) > (member) 1>)
"dall-e-3"
[](<#(resource) images > (model) image_model > (schema) > (member) 2>)
"gpt-image-1"
[](<#(resource) images > (model) image_model > (schema) > (member) 3>)
"gpt-image-1-mini"
[](<#(resource) images > (model) image_model > (schema) > (member) 4>)
[](<#(resource) images > (method) create_variation > (params) default > (param) model > (schema) > (variant) 1>)
[](<#(resource) images > (method) create_variation > (params) default > (param) model > (schema)>)
n: Optional[int]
The number of images to generate. Must be between 1 and 10.
minimum1
maximum10
[](<#(resource) images > (method) create_variation > (params) default > (param) n > (schema)>)
response\_format: Optional[Literal["url", "b64\_json"]]
The format in which the generated images are returned. Must be one of `url` or `b64\_json`. URLs are only valid for 60 minutes after the image has been generated.
One of the following:
"url"
[](<#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema) > (member) 0>)
"b64\_json"
[](<#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema) > (member) 1>)
[](<#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema)>)
size: Optional[Literal["256x256", "512x512", "1024x1024"]]
The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
One of the following:
"256x256"
[](<#(resource) images > (method) create_variation > (params) default > (param) size > (schema) > (member) 0>)
"512x512"
[](<#(resource) images > (method) create_variation > (params) default > (param) size > (schema) > (member) 1>)
"1024x1024"
[](<#(resource) images > (method) create_variation > (params) default > (param) size > (schema) > (member) 2>)
[](<#(resource) images > (method) create_variation > (params) default > (param) size > (schema)>)
user: Optional[str]
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) images > (method) create_variation > (params) default > (param) user > (schema)>)
##### ReturnsExpand Collapse
class ImagesResponse: …
The response from the image generation endpoint.
created: int
The Unix timestamp (in seconds) of when the image was created.
formatunixtime
[](<#(resource) images > (model) images_response > (schema) > (property) created>)
background: Optional[Literal["transparent", "opaque"]]
The background parameter used for the image generation. Either `transparent` or `opaque`.
One of the following:
"transparent"
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 0>)
"opaque"
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 1>)
[](<#(resource) images > (model) images_response > (schema) > (property) background>)
data: Optional[List[[Image](</api/reference/python/resources/images#(resource) images > (model) image > (schema)>)]]
The list of generated images.
b64\_json: Optional[str]
The base64-encoded JSON of the generated image. Returned by default for the GPT image models, and only present if `response\_format` is set to `b64\_json` for `dall-e-2` and `dall-e-3`.
[](<#(resource) images > (model) image > (schema) > (property) b64_json>)
revised\_prompt: Optional[str]
For `dall-e-3` only, the revised prompt that was used to generate the image.
[](<#(resource) images > (model) image > (schema) > (property) revised_prompt>)
url: Optional[str]
When using `dall-e-2` or `dall-e-3`, the URL of the generated image if `response\_format` is set to `url` (default value). Unsupported for the GPT image models.
formaturi
[](<#(resource) images > (model) image > (schema) > (property) url>)
[](<#(resource) images > (model) images_response > (schema) > (property) data>)
output\_format: Optional[Literal["png", "webp", "jpeg"]]
The output format of the image generation. Either `png`, `webp`, or `jpeg`.
One of the following:
"png"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 0>)
"webp"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) output_format>)
quality: Optional[Literal["low", "medium", "high"]]
The quality of the image generated. Either `low`, `medium`, or `high`.
One of the following:
"low"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 0>)
"medium"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 1>)
"high"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) quality>)
size: Optional[Literal["1024x1024", "1024x1536", "1536x1024"]]
The size of the image generated. Either `1024x1024`, `1024x1536`, or `1536x1024`.
One of the following:
"1024x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) size>)
usage: Optional[Usage]
For `gpt-image-1` only, the token usage information for the image generation.
input\_tokens: int
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens>)
input\_tokens\_details: UsageInputTokensDetails
The input tokens detailed information for the image generation.
image\_tokens: int
The number of image tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
text\_tokens: int
The number of text tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details>)
output\_tokens: int
The number of output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens>)
total\_tokens: int
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) total_tokens>)
output\_tokens\_details: Optional[UsageOutputTokensDetails]
The output token details for the image generation.
image\_tokens: int
The number of image output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) image_tokens>)
text\_tokens: int
The number of text output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage>)
[](<#(resource) images > (model) images_response > (schema)>)
### Create image variation
Python
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
`from openai import OpenAI
client = OpenAI()
response = client.images.create\_variation(
image=open("image\_edit\_original.png", "rb"),
n=2,
size="1024x1024"
)
`
```
```
`{
"created": 1589478378,
"data": [
{
"url": "https://..."
},
{
"url": "https://..."
}
]
}
`
```
##### Returns Examples
```
`{
"created": 1589478378,
"data": [
{
"url": "https://..."
},
{
"url": "https://..."
}
]
}
`
```