Create image edit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Images](/api/reference/go/resources/images)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create image edit
client.Images.Edit(ctx, body) (\*[ImagesResponse](</api/reference/go/resources/images#(resource) images > (model) images_response > (schema)>), error)
POST/images/edits
Creates an edited or extended image given one or more source images and a prompt. This endpoint supports GPT Image models (`gpt-image-1.5`, `gpt-image-1`, `gpt-image-1-mini`, and `chatgpt-image-latest`) and `dall-e-2`.
##### ParametersExpand Collapse
body ImageEditParams
Image param.Field[[ImageEditParamsImageUnion](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) image > (schema)>)]
The image(s) to edit. Must be a supported image file or an array of images.
For the GPT image models (`gpt-image-1`, `gpt-image-1-mini`, and `gpt-image-1.5`), each image should be a `png`, `webp`, or `jpg`
file less than 50MB. You can provide up to 16 images.
`chatgpt-image-latest` follows the same input constraints as GPT image models.
For `dall-e-2`, you can only provide one image, and it should be a square
`png` file less than 4MB.
Reader
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) image > (schema) > (variant) 0>)
[]Reader
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) image > (schema) > (variant) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) image>)
Prompt param.Field[string]
A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2`, and 32000 characters for the GPT image models.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) prompt>)
Background param.Field[[ImageEditParamsBackground](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema)>)]Optional
Allows to set transparency for the background of the generated image(s).
This parameter is only supported for the GPT image models. Must be one of
`transparent`, `opaque` or `auto` (default value). When `auto` is used, the
model will automatically determine the best background for the image.
If `transparent`, the output format needs to support transparency, so it
should be set to either `png` (default value) or `webp`.
const ImageEditParamsBackgroundTransparent [ImageEditParamsBackground](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema)>) = "transparent"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema) > (member) 0>)
const ImageEditParamsBackgroundOpaque [ImageEditParamsBackground](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema)>) = "opaque"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema) > (member) 1>)
const ImageEditParamsBackgroundAuto [ImageEditParamsBackground](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema)>) = "auto"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background > (schema) > (member) 2>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) background>)
InputFidelity param.Field[[ImageEditParamsInputFidelity](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema)>)]Optional
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
const ImageEditParamsInputFidelityHigh [ImageEditParamsInputFidelity](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema)>) = "high"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema) > (member) 0>)
const ImageEditParamsInputFidelityLow [ImageEditParamsInputFidelity](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema)>) = "low"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity > (schema) > (member) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) input_fidelity>)
Mask param.Field[[Reader](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) mask > (schema)>)]Optional
An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. If there are multiple images provided, the mask will be applied on the first image. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) mask>)
Model param.Field[[ImageModel](</api/reference/go/resources/images#(resource) images > (model) image_model > (schema)>)]Optional
The model to use for image generation. Defaults to `gpt-image-1.5`.
string
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
type ImageModel string
One of the following:
const ImageModelGPTImage1\_5 [ImageModel](</api/reference/go/resources/images#(resource) images > (model) image_model > (schema)>) = "gpt-image-1.5"
[](<#(resource) images > (model) image_model > (schema) > (member) 0>)
const ImageModelDallE2 [ImageModel](</api/reference/go/resources/images#(resource) images > (model) image_model > (schema)>) = "dall-e-2"
[](<#(resource) images > (model) image_model > (schema) > (member) 1>)
const ImageModelDallE3 [ImageModel](</api/reference/go/resources/images#(resource) images > (model) image_model > (schema)>) = "dall-e-3"
[](<#(resource) images > (model) image_model > (schema) > (member) 2>)
const ImageModelGPTImage1 [ImageModel](</api/reference/go/resources/images#(resource) images > (model) image_model > (schema)>) = "gpt-image-1"
[](<#(resource) images > (model) image_model > (schema) > (member) 3>)
const ImageModelGPTImage1Mini [ImageModel](</api/reference/go/resources/images#(resource) images > (model) image_model > (schema)>) = "gpt-image-1-mini"
[](<#(resource) images > (model) image_model > (schema) > (member) 4>)
[](<#(resource) images > (model) image_model > (schema)>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) model>)
N param.Field[int64]Optional
The number of images to generate. Must be between 1 and 10.
minimum1
maximum10
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) n>)
OutputCompression param.Field[int64]Optional
The compression level (0-100%) for the generated images. This parameter
is only supported for the GPT image models with the `webp` or `jpeg` output
formats, and defaults to 100.
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_compression>)
OutputFormat param.Field[[ImageEditParamsOutputFormat](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema)>)]Optional
The format in which the generated images are returned. This parameter is
only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.
The default value is `png`.
const ImageEditParamsOutputFormatPNG [ImageEditParamsOutputFormat](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema)>) = "png"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema) > (member) 0>)
const ImageEditParamsOutputFormatJPEG [ImageEditParamsOutputFormat](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema)>) = "jpeg"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema) > (member) 1>)
const ImageEditParamsOutputFormatWebP [ImageEditParamsOutputFormat](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema)>) = "webp"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format > (schema) > (member) 2>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) output_format>)
PartialImages param.Field[int64]Optional
The number of partial images to generate. This parameter is used for
streaming responses that return partial images. Value must be between 0 and 3.
When set to 0, the response will be a single image sent in one streaming event.
Note that the final image may be sent before the full number of partial images
are generated if the full image is generated more quickly.
maximum3
minimum0
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) partial_images>)
Quality param.Field[[ImageEditParamsQuality](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema)>)]Optional
The quality of the image that will be generated for GPT image models. Defaults to `auto`.
const ImageEditParamsQualityStandard [ImageEditParamsQuality](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema)>) = "standard"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 0>)
const ImageEditParamsQualityLow [ImageEditParamsQuality](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema)>) = "low"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 1>)
const ImageEditParamsQualityMedium [ImageEditParamsQuality](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema)>) = "medium"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 2>)
const ImageEditParamsQualityHigh [ImageEditParamsQuality](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema)>) = "high"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 3>)
const ImageEditParamsQualityAuto [ImageEditParamsQuality](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema)>) = "auto"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality > (schema) > (member) 4>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) quality>)
ResponseFormat param.Field[[ImageEditParamsResponseFormat](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema)>)]Optional
The format in which the generated images are returned. Must be one of `url` or `b64\_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter is only supported for `dall-e-2` (default is `url` for `dall-e-2`), as GPT image models always return base64-encoded images.
const ImageEditParamsResponseFormatURL [ImageEditParamsResponseFormat](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema)>) = "url"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema) > (member) 0>)
const ImageEditParamsResponseFormatB64JSON [ImageEditParamsResponseFormat](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema)>) = "b64\_json"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format > (schema) > (member) 1>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) response_format>)
Size param.Field[[ImageEditParamsSize](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>)]Optional
The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for the GPT image models, and one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`.
const ImageEditParamsSize256x256 [ImageEditParamsSize](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>) = "256x256"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 0>)
const ImageEditParamsSize512x512 [ImageEditParamsSize](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>) = "512x512"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 1>)
const ImageEditParamsSize1024x1024 [ImageEditParamsSize](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>) = "1024x1024"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 2>)
const ImageEditParamsSize1536x1024 [ImageEditParamsSize](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>) = "1536x1024"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 3>)
const ImageEditParamsSize1024x1536 [ImageEditParamsSize](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>) = "1024x1536"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 4>)
const ImageEditParamsSizeAuto [ImageEditParamsSize](</api/reference/go/resources/images/methods/edit#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema)>) = "auto"
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size > (schema) > (member) 5>)
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) size>)
User param.Field[string]Optional
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) images > (method) edit > (params) default.non_streaming > (param) user>)
[](<#(resource) images > (method) edit > (params) default.non_streaming>)
##### ReturnsExpand Collapse
type ImagesResponse struct{…}
The response from the image generation endpoint.
Created int64
The Unix timestamp (in seconds) of when the image was created.
formatunixtime
[](<#(resource) images > (model) images_response > (schema) > (property) created>)
Background ImagesResponseBackgroundOptional
The background parameter used for the image generation. Either `transparent` or `opaque`.
One of the following:
const ImagesResponseBackgroundTransparent ImagesResponseBackground = "transparent"
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 0>)
const ImagesResponseBackgroundOpaque ImagesResponseBackground = "opaque"
[](<#(resource) images > (model) images_response > (schema) > (property) background > (member) 1>)
[](<#(resource) images > (model) images_response > (schema) > (property) background>)
Data [][Image](</api/reference/go/resources/images#(resource) images > (model) image > (schema)>)Optional
The list of generated images.
B64JSON stringOptional
The base64-encoded JSON of the generated image. Returned by default for the GPT image models, and only present if `response\_format` is set to `b64\_json` for `dall-e-2` and `dall-e-3`.
[](<#(resource) images > (model) image > (schema) > (property) b64_json>)
RevisedPrompt stringOptional
For `dall-e-3` only, the revised prompt that was used to generate the image.
[](<#(resource) images > (model) image > (schema) > (property) revised_prompt>)
URL stringOptional
When using `dall-e-2` or `dall-e-3`, the URL of the generated image if `response\_format` is set to `url` (default value). Unsupported for the GPT image models.
formaturi
[](<#(resource) images > (model) image > (schema) > (property) url>)
[](<#(resource) images > (model) images_response > (schema) > (property) data>)
OutputFormat ImagesResponseOutputFormatOptional
The output format of the image generation. Either `png`, `webp`, or `jpeg`.
One of the following:
const ImagesResponseOutputFormatPNG ImagesResponseOutputFormat = "png"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 0>)
const ImagesResponseOutputFormatWebP ImagesResponseOutputFormat = "webp"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 1>)
const ImagesResponseOutputFormatJPEG ImagesResponseOutputFormat = "jpeg"
[](<#(resource) images > (model) images_response > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) output_format>)
Quality ImagesResponseQualityOptional
The quality of the image generated. Either `low`, `medium`, or `high`.
One of the following:
const ImagesResponseQualityLow ImagesResponseQuality = "low"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 0>)
const ImagesResponseQualityMedium ImagesResponseQuality = "medium"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 1>)
const ImagesResponseQualityHigh ImagesResponseQuality = "high"
[](<#(resource) images > (model) images_response > (schema) > (property) quality > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) quality>)
Size ImagesResponseSizeOptional
The size of the image generated. Either `1024x1024`, `1024x1536`, or `1536x1024`.
One of the following:
const ImagesResponseSize1024x1024 ImagesResponseSize = "1024x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 0>)
const ImagesResponseSize1024x1536 ImagesResponseSize = "1024x1536"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 1>)
const ImagesResponseSize1536x1024 ImagesResponseSize = "1536x1024"
[](<#(resource) images > (model) images_response > (schema) > (property) size > (member) 2>)
[](<#(resource) images > (model) images_response > (schema) > (property) size>)
Usage ImagesResponseUsageOptional
For `gpt-image-1` only, the token usage information for the image generation.
InputTokens int64
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens>)
InputTokensDetails ImagesResponseUsageInputTokensDetails
The input tokens detailed information for the image generation.
ImageTokens int64
The number of image tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
TextTokens int64
The number of text tokens in the input prompt.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) input_tokens_details>)
OutputTokens int64
The number of output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens>)
TotalTokens int64
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) total_tokens>)
OutputTokensDetails ImagesResponseUsageOutputTokensDetailsOptional
The output token details for the image generation.
ImageTokens int64
The number of image output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) image_tokens>)
TextTokens int64
The number of text output tokens generated by the model.
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage > (property) output_tokens_details>)
[](<#(resource) images > (model) images_response > (schema) > (property) usage>)
[](<#(resource) images > (model) images_response > (schema)>)
type ImageEditStreamEventUnion interface{…}
Emitted when a partial image is available during image editing streaming.
One of the following:
type ImageEditPartialImageEvent struct{…}
Emitted when a partial image is available during image editing streaming.
B64JSON string
Base64-encoded partial image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) b64_json>)
Background ImageEditPartialImageEventBackground
The background setting for the requested edited image.
One of the following:
const ImageEditPartialImageEventBackgroundTransparent ImageEditPartialImageEventBackground = "transparent"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 0>)
const ImageEditPartialImageEventBackgroundOpaque ImageEditPartialImageEventBackground = "opaque"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 1>)
const ImageEditPartialImageEventBackgroundAuto ImageEditPartialImageEventBackground = "auto"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) background>)
CreatedAt int64
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) created_at>)
OutputFormat ImageEditPartialImageEventOutputFormat
The output format for the requested edited image.
One of the following:
const ImageEditPartialImageEventOutputFormatPNG ImageEditPartialImageEventOutputFormat = "png"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 0>)
const ImageEditPartialImageEventOutputFormatWebP ImageEditPartialImageEventOutputFormat = "webp"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 1>)
const ImageEditPartialImageEventOutputFormatJPEG ImageEditPartialImageEventOutputFormat = "jpeg"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) output_format>)
PartialImageIndex int64
0-based index for the partial image (streaming).
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) partial_image_index>)
Quality ImageEditPartialImageEventQuality
The quality setting for the requested edited image.
One of the following:
const ImageEditPartialImageEventQualityLow ImageEditPartialImageEventQuality = "low"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 0>)
const ImageEditPartialImageEventQualityMedium ImageEditPartialImageEventQuality = "medium"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 1>)
const ImageEditPartialImageEventQualityHigh ImageEditPartialImageEventQuality = "high"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 2>)
const ImageEditPartialImageEventQualityAuto ImageEditPartialImageEventQuality = "auto"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) quality>)
Size ImageEditPartialImageEventSize
The size of the requested edited image.
One of the following:
const ImageEditPartialImageEventSize1024x1024 ImageEditPartialImageEventSize = "1024x1024"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 0>)
const ImageEditPartialImageEventSize1024x1536 ImageEditPartialImageEventSize = "1024x1536"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 1>)
const ImageEditPartialImageEventSize1536x1024 ImageEditPartialImageEventSize = "1536x1024"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 2>)
const ImageEditPartialImageEventSizeAuto ImageEditPartialImageEventSize = "auto"
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) size>)
Type ImageEditPartialImage
The type of the event. Always `image\_edit.partial\_image`.
[](<#(resource) images > (model) image_edit_partial_image_event > (schema) > (property) type>)
[](<#(resource) images > (model) image_edit_partial_image_event > (schema)>)
type ImageEditCompletedEvent struct{…}
Emitted when image editing has completed and the final image is available.
B64JSON string
Base64-encoded final edited image data, suitable for rendering as an image.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) b64_json>)
Background ImageEditCompletedEventBackground
The background setting for the edited image.
One of the following:
const ImageEditCompletedEventBackgroundTransparent ImageEditCompletedEventBackground = "transparent"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 0>)
const ImageEditCompletedEventBackgroundOpaque ImageEditCompletedEventBackground = "opaque"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 1>)
const ImageEditCompletedEventBackgroundAuto ImageEditCompletedEventBackground = "auto"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background > (member) 2>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) background>)
CreatedAt int64
The Unix timestamp when the event was created.
formatunixtime
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) created_at>)
OutputFormat ImageEditCompletedEventOutputFormat
The output format for the edited image.
One of the following:
const ImageEditCompletedEventOutputFormatPNG ImageEditCompletedEventOutputFormat = "png"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 0>)
const ImageEditCompletedEventOutputFormatWebP ImageEditCompletedEventOutputFormat = "webp"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 1>)
const ImageEditCompletedEventOutputFormatJPEG ImageEditCompletedEventOutputFormat = "jpeg"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format > (member) 2>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) output_format>)
Quality ImageEditCompletedEventQuality
The quality setting for the edited image.
One of the following:
const ImageEditCompletedEventQualityLow ImageEditCompletedEventQuality = "low"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 0>)
const ImageEditCompletedEventQualityMedium ImageEditCompletedEventQuality = "medium"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 1>)
const ImageEditCompletedEventQualityHigh ImageEditCompletedEventQuality = "high"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 2>)
const ImageEditCompletedEventQualityAuto ImageEditCompletedEventQuality = "auto"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality > (member) 3>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) quality>)
Size ImageEditCompletedEventSize
The size of the edited image.
One of the following:
const ImageEditCompletedEventSize1024x1024 ImageEditCompletedEventSize = "1024x1024"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 0>)
const ImageEditCompletedEventSize1024x1536 ImageEditCompletedEventSize = "1024x1536"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 1>)
const ImageEditCompletedEventSize1536x1024 ImageEditCompletedEventSize = "1536x1024"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 2>)
const ImageEditCompletedEventSizeAuto ImageEditCompletedEventSize = "auto"
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size > (member) 3>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) size>)
Type ImageEditCompleted
The type of the event. Always `image\_edit.completed`.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) type>)
Usage ImageEditCompletedEventUsage
For the GPT image models only, the token usage information for the image generation.
InputTokens int64
The number of tokens (images and text) in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens>)
InputTokensDetails ImageEditCompletedEventUsageInputTokensDetails
The input tokens detailed information for the image generation.
ImageTokens int64
The number of image tokens in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) image_tokens>)
TextTokens int64
The number of text tokens in the input prompt.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details > (property) text_tokens>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) input_tokens_details>)
OutputTokens int64
The number of image tokens in the output image.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) output_tokens>)
TotalTokens int64
The total number of tokens (images and text) used for the image generation.
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) images > (model) image_edit_completed_event > (schema) > (property) usage>)
[](<#(resource) images > (model) image_edit_completed_event > (schema)>)
[](<#(resource) images > (model) image_edit_stream_event > (schema)>)
### Create image edit
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
imagesResponse, err := client.Images.Edit(context.TODO(), openai.ImageEditParams{
Image: openai.ImageEditParamsImageUnion{
OfFile: io.Reader(bytes.NewBuffer([]byte("Example data"))),
},
Prompt: "A cute baby sea otter wearing a beret",
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", imagesResponse)
}
`
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