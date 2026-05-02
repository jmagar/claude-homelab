Retrieve video content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Videos](/api/reference/go/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve video content
client.Videos.DownloadContent(ctx, videoID, query) (\*Response, error)
GET/videos/{video\_id}/content
Download the generated video bytes or a derived preview asset.
Streams the rendered video content for the specified video job.
##### ParametersExpand Collapse
videoID string
[](<#(resource) videos > (method) download_content > (params) default > (param) video_id > (schema)>)
query VideoDownloadContentParams
Variant param.Field[[VideoDownloadContentParamsVariant](</api/reference/go/resources/videos/methods/download_content#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>)]Optional
Which downloadable asset to return. Defaults to the MP4 video.
const VideoDownloadContentParamsVariantVideo [VideoDownloadContentParamsVariant](</api/reference/go/resources/videos/methods/download_content#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>) = "video"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 0>)
const VideoDownloadContentParamsVariantThumbnail [VideoDownloadContentParamsVariant](</api/reference/go/resources/videos/methods/download_content#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>) = "thumbnail"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 1>)
const VideoDownloadContentParamsVariantSpritesheet [VideoDownloadContentParamsVariant](</api/reference/go/resources/videos/methods/download_content#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>) = "spritesheet"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 2>)
[](<#(resource) videos > (method) download_content > (params) default > (param) variant>)
[](<#(resource) videos > (method) download_content > (params) default>)
##### ReturnsExpand Collapse
type VideoDownloadContentResponse interface{…}
[](<#(resource) videos > (method) download_content > (network schema)>)
### Retrieve video content
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
"context"
"fmt"
"github.com/openai/openai-go"
)
func main() {
client := openai.NewClient()
response, err := client.Videos.DownloadContent(
context.TODO(),
"video\_123",
openai.VideoDownloadContentParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", response)
}
`
```
##### Returns Examples