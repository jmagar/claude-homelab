Create image variation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Images](/api/reference/java/resources/images)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create image variation
[ImagesResponse](</api/reference/java/resources/images#(resource) images > (model) images_response > (schema)>) images().createVariation(ImageCreateVariationParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/images/variations
Creates a variation of a given image. This endpoint only supports `dall-e-2`.
##### ParametersExpand Collapse
ImageCreateVariationParams params
InputStream image
The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) image>)
Optional\<[ImageModel](</api/reference/java/resources/images#(resource) images > (model) image_model > (schema)>)\> model
The model to use for image generation. Only `dall-e-2` is supported at this time.
GPT\_IMAGE\_1\_5("gpt-image-1.5")
[](<#(resource) images > (model) image_model > (schema) > (member) 0>)
DALL\_E\_2("dall-e-2")
[](<#(resource) images > (model) image_model > (schema) > (member) 1>)
DALL\_E\_3("dall-e-3")
[](<#(resource) images > (model) image_model > (schema) > (member) 2>)
GPT\_IMAGE\_1("gpt-image-1")
[](<#(resource) images > (model) image_model > (schema) > (member) 3>)
GPT\_IMAGE\_1\_MINI("gpt-image-1-mini")
[](<#(resource) images > (model) image_model > (schema) > (member) 4>)
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) model>)
Optional\<Long\> n
The number of images to generate. Must be between 1 and 10.
minimum1
maximum10
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) n>)
Optional\<ResponseFormat\> responseFormat
The format in which the generated images are returned. Must be one of `url` or `b64\_json`. URLs are only valid for 60 minutes after the image has been generated.
URL("url")
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) response_format > (member) 0>)
B64\_JSON("b64\_json")
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) response_format > (member) 1>)
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) response_format>)
Optional\<Size\> size
The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
\_256X256("256x256")
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) size > (member) 0>)
\_512X512("512x512")
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) size > (member) 1>)
\_1024X1024("1024x1024")
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) size > (member) 2>)
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) size>)
Optional\<String\> user
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) images > (method) create_variation > (params) default > (param) body > (schema) > (property) user>)
[](<#(resource) images > (method) create_variation > (params) default>)
##### ReturnsExpand Collapse
class ImagesResponse:
The response from the image generation endpoint.
long created
The Unix timestamp (in seconds) of when the image was created.
formatunixtime
[](<#(resource) images > (model) images_response > (schema) > (property) created>)
Optional\<Background\> background
The background parameter used for the image generation. Either `transparent` or `opaque`.
One of the following:
TRANSPARENT("transparent")
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 0>)
OPAQUE("opaque")
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 1>)
[](<#(resource) images > (model) images_response > (schema) > (property) background>)
Optional\<List\<[Image](</api/reference/java/resources/images#(resource) images > (model) image > (schema)>)\>\> data
The list of generated images.
Optional\<String\> b64Json
The base64-encoded JSON of the generated image. Returned by default for the GPT image models, and only present if `response\_format` is set to `b64\_json` for `dall-e-2` and `dall-e-3`.
[](<#(resource) images > (model) image > (schema) > (property) b64_json>)
Optional\<String\> revisedPrompt
For `dall-e-3` only, the revised prompt that was used to generate the image.
[](<#(resource) images > (model) image > (schema) > (property) revised_prompt>)
Optional\<String\> url
When using `dall-e-2` or `dall-e-3`, the URL of the generated image if `response\_format` is set to `url` (default value). Unsupported for the GPT image models.
formaturi
[](<#(resource) images > (model) image > (schema) > (property) url>)
[](<#(resource) images > (model) images_response > (schema) > (property) data>)
Optional\<OutputFormat\> outputFormat
The output format of the image generation. Either `png`, `webp`, or `jpeg`.
One of the following:
PNG("png")
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 0>)
WEBP("webp")
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 1>)
JPEG("jpeg")
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) output_format>)
Optional\<Quality\> quality
The quality of the image generated. Either `low`, `medium`, or `high`.
One of the following:
LOW("low")
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 0>)
MEDIUM("medium")
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 1>)
HIGH("high")
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) quality>)
Optional\<Size\> size
The size of the image generated. Either `1024x1024`, `1024x1536`, or `1536x1024`.
One of the following:
\_1024X1024("1024x1024")
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 0>)
\_1024X1536("1024x1536")
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 1>)
\_1536X1024("1536x1024")
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) size>)
Optional\<Usage\> usage
For `gpt-image-1` only, the token usage information for the image generation.
long inputTokens
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens>)
InputTokensDetails inputTokensDetails
The input tokens detailed information for the image generation.
long imageTokens
The number of image tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
long textTokens
The number of text tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details>)
long outputTokens
The number of output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens>)
long totalTokens
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) total_tokens>)
Optional\<OutputTokensDetails\> outputTokensDetails
The output token details for the image generation.
long imageTokens
The number of image output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) image_tokens>)
long textTokens
The number of text output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage>)
[](<#(resource) images > (model) images_response > (schema)>)
### Create image variation
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.images.ImageCreateVariationParams;
import com.openai.models.images.ImagesResponse;
import java.io.ByteArrayInputStream;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ImageCreateVariationParams params = ImageCreateVariationParams.builder()
.image(new ByteArrayInputStream("Example data".getBytes()))
.build();
ImagesResponse imagesResponse = client.images().createVariation(params);
}
}`
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