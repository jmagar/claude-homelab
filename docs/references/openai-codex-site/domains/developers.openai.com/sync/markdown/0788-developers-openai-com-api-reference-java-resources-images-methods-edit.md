Create image edit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Images](/api/reference/java/resources/images)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create image edit
[ImagesResponse](</api/reference/java/resources/images#(resource) images > (model) images_response > (schema)>) images().edit(ImageEditParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/images/edits
Creates an edited or extended image given one or more source images and a prompt. This endpoint supports GPT Image models (`gpt-image-1.5`, `gpt-image-1`, `gpt-image-1-mini`, and `chatgpt-image-latest`) and `dall-e-2`.
##### ParametersExpand Collapse
ImageEditParams params
Image image
The image(s) to edit. Must be a supported image file or an array of images.
For the GPT image models (`gpt-image-1`, `gpt-image-1-mini`, and `gpt-image-1.5`), each image should be a `png`, `webp`, or `jpg`
file less than 50MB. You can provide up to 16 images.
`chatgpt-image-latest` follows the same input constraints as GPT image models.
For `dall-e-2`, you can only provide one image, and it should be a square
`png` file less than 4MB.
String
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) image > (variant) 0>)
List\<String\>
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) image > (variant) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) image>)
String prompt
A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2`, and 32000 characters for the GPT image models.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) prompt>)
Optional\<Background\> background
Allows to set transparency for the background of the generated image(s).
This parameter is only supported for the GPT image models. Must be one of
`transparent`, `opaque` or `auto` (default value). When `auto` is used, the
model will automatically determine the best background for the image.
If `transparent`, the output format needs to support transparency, so it
should be set to either `png` (default value) or `webp`.
TRANSPARENT("transparent")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) background > (member) 0>)
OPAQUE("opaque")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) background > (member) 1>)
AUTO("auto")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) background>)
Optional\<InputFidelity\> inputFidelity
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
HIGH("high")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) input_fidelity > (member) 0>)
LOW("low")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) input_fidelity > (member) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) input_fidelity>)
Optional\<InputStream\> mask
An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. If there are multiple images provided, the mask will be applied on the first image. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) mask>)
Optional\<[ImageModel](</api/reference/java/resources/images#(resource) images > (model) image_model > (schema)>)\> model
The model to use for image generation. Defaults to `gpt-image-1.5`.
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
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) model>)
Optional\<Long\> n
The number of images to generate. Must be between 1 and 10.
minimum1
maximum10
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) n>)
Optional\<Long\> outputCompression
The compression level (0-100%) for the generated images. This parameter
is only supported for the GPT image models with the `webp` or `jpeg` output
formats, and defaults to 100.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) output_compression>)
Optional\<OutputFormat\> outputFormat
The format in which the generated images are returned. This parameter is
only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.
The default value is `png`.
PNG("png")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) output_format > (member) 0>)
JPEG("jpeg")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) output_format > (member) 1>)
WEBP("webp")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) output_format>)
Optional\<Long\> partialImages
The number of partial images to generate. This parameter is used for
streaming responses that return partial images. Value must be between 0 and 3.
When set to 0, the response will be a single image sent in one streaming event.
Note that the final image may be sent before the full number of partial images
are generated if the full image is generated more quickly.
maximum3
minimum0
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) partial_images>)
Optional\<Quality\> quality
The quality of the image that will be generated for GPT image models. Defaults to `auto`.
STANDARD("standard")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) quality > (member) 0>)
LOW("low")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) quality > (member) 1>)
MEDIUM("medium")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) quality > (member) 2>)
HIGH("high")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) quality > (member) 3>)
AUTO("auto")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) quality > (member) 4>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) quality>)
Optional\<ResponseFormat\> responseFormat
The format in which the generated images are returned. Must be one of `url` or `b64\_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter is only supported for `dall-e-2` (default is `url` for `dall-e-2`), as GPT image models always return base64-encoded images.
URL("url")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) response_format > (member) 0>)
B64\_JSON("b64\_json")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) response_format > (member) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) response_format>)
Optional\<Size\> size
The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for the GPT image models, and one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`.
\_256X256("256x256")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) size > (member) 0>)
\_512X512("512x512")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) size > (member) 1>)
\_1024X1024("1024x1024")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) size > (member) 2>)
\_1536X1024("1536x1024")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) size > (member) 3>)
\_1024X1536("1024x1536")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) size > (member) 4>)
AUTO("auto")
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) size > (member) 5>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) size>)
Optional\<String\> user
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) body > (schema) > (property) user>)
[](<#(resource) images > (method) edit > (params) default.non_streaming>)
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
class ImageEditStreamEvent: A class that can be one of several variants.union
Emitted when a partial image is available during image editing streaming.
class ImageEditPartialImageEvent:
Emitted when a partial image is available during image editing streaming.
String b64Json
Base64-encoded partial image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) b64_json>)
Background background
The background setting for the requested edited image.
One of the following:
TRANSPARENT("transparent")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 0>)
OPAQUE("opaque")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 1>)
AUTO("auto")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background>)
long createdAt
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) created_at>)
OutputFormat outputFormat
The output format for the requested edited image.
One of the following:
PNG("png")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 0>)
WEBP("webp")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 1>)
JPEG("jpeg")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format>)
long partialImageIndex
0-based index for the partial image (streaming).
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) partial_image_index>)
Quality quality
The quality setting for the requested edited image.
One of the following:
LOW("low")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 0>)
MEDIUM("medium")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 1>)
HIGH("high")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 2>)
AUTO("auto")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality>)
Size size
The size of the requested edited image.
One of the following:
\_1024X1024("1024x1024")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 0>)
\_1024X1536("1024x1536")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 1>)
\_1536X1024("1536x1024")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 2>)
AUTO("auto")
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size>)
JsonValue; type "image\_edit.partial\_image"constant"image\_edit.partial\_image"constant
The type of the event. Always `image\_edit.partial\_image`.
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) type>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema)>)
class ImageEditCompletedEvent:
Emitted when image editing has completed and the final image is available.
String b64Json
Base64-encoded final edited image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) b64_json>)
Background background
The background setting for the edited image.
One of the following:
TRANSPARENT("transparent")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 0>)
OPAQUE("opaque")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 1>)
AUTO("auto")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background>)
long createdAt
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) created_at>)
OutputFormat outputFormat
The output format for the edited image.
One of the following:
PNG("png")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 0>)
WEBP("webp")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 1>)
JPEG("jpeg")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format>)
Quality quality
The quality setting for the edited image.
One of the following:
LOW("low")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 0>)
MEDIUM("medium")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 1>)
HIGH("high")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 2>)
AUTO("auto")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality>)
Size size
The size of the edited image.
One of the following:
\_1024X1024("1024x1024")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 0>)
\_1024X1536("1024x1536")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 1>)
\_1536X1024("1536x1024")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 2>)
AUTO("auto")
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size>)
JsonValue; type "image\_edit.completed"constant"image\_edit.completed"constant
The type of the event. Always `image\_edit.completed`.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) type>)
Usage usage
For the GPT image models only, the token usage information for the image generation.
long inputTokens
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens>)
InputTokensDetails inputTokensDetails
The input tokens detailed information for the image generation.
long imageTokens
The number of image tokens in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
long textTokens
The number of text tokens in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details>)
long outputTokens
The number of image tokens in the output image.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) output_tokens>)
long totalTokens
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage>)
[](<#(resource) images > (model) image_edit_completed_event > (schema)>)
[](<#(resource) images > (model) image_edit_stream_event > (schema)>)
### Create image edit
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
import com.openai.models.images.ImageEditParams;
import com.openai.models.images.ImagesResponse;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ImageEditParams params = ImageEditParams.builder()
.image(new ByteArrayInputStream("Example data".getBytes()))
.prompt("A cute baby sea otter wearing a beret")
.build();
ImagesResponse imagesResponse = client.images().edit(params);
}
}`
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