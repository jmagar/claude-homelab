Create image variation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Images](/api/reference/go/resources/images)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create image variation
client.Images.NewVariation(ctx, body) (\*[ImagesResponse](</api/reference/go/resources/images#(resource) images > (model) images_response > (schema)>), error)
POST/images/variations
Creates a variation of a given image. This endpoint only supports `dall-e-2`.
##### ParametersExpand Collapse
body ImageNewVariationParams
Image param.Field[[Reader](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) image > (schema)>)]
The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
[](<#(resource) images > (method) create_variation > (params) default > (param) image>)
Model param.Field[[ImageModel](</api/reference/go/resources/images#(resource) images > (model) image_model > (schema)>)]Optional
The model to use for image generation. Only `dall-e-2` is supported at this time.
string
[](<#(resource) images > (method) create_variation > (params) default > (param) model > (schema) > (variant) 0>)
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
[](<#(resource) images > (method) create_variation > (params) default > (param) model>)
N param.Field[int64]Optional
The number of images to generate. Must be between 1 and 10.
minimum1
maximum10
[](<#(resource) images > (method) create_variation > (params) default > (param) n>)
ResponseFormat param.Field[[ImageNewVariationParamsResponseFormat](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema)>)]Optional
The format in which the generated images are returned. Must be one of `url` or `b64\_json`. URLs are only valid for 60 minutes after the image has been generated.
const ImageNewVariationParamsResponseFormatURL [ImageNewVariationParamsResponseFormat](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema)>) = "url"
[](<#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema) > (member) 0>)
const ImageNewVariationParamsResponseFormatB64JSON [ImageNewVariationParamsResponseFormat](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema)>) = "b64\_json"
[](<#(resource) images > (method) create_variation > (params) default > (param) response_format > (schema) > (member) 1>)
[](<#(resource) images > (method) create_variation > (params) default > (param) response_format>)
Size param.Field[[ImageNewVariationParamsSize](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) size > (schema)>)]Optional
The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
const ImageNewVariationParamsSize256x256 [ImageNewVariationParamsSize](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) size > (schema)>) = "256x256"
[](<#(resource) images > (method) create_variation > (params) default > (param) size > (schema) > (member) 0>)
const ImageNewVariationParamsSize512x512 [ImageNewVariationParamsSize](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) size > (schema)>) = "512x512"
[](<#(resource) images > (method) create_variation > (params) default > (param) size > (schema) > (member) 1>)
const ImageNewVariationParamsSize1024x1024 [ImageNewVariationParamsSize](</api/reference/go/resources/images/methods/create_variation#(resource) images > (method) create_variation > (params) default > (param) size > (schema)>) = "1024x1024"
[](<#(resource) images > (method) create_variation > (params) default > (param) size > (schema) > (member) 2>)
[](<#(resource) images > (method) create_variation > (params) default > (param) size>)
User param.Field[string]Optional
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) images > (method) create_variation > (params) default > (param) user>)
[](<#(resource) images > (method) create_variation > (params) default>)
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
### Create image variation
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
imagesResponse, err := client.Images.NewVariation(context.TODO(), openai.ImageNewVariationParams{
Image: io.Reader(bytes.NewBuffer([]byte("Example data"))),
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", imagesResponse.Created)
}
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