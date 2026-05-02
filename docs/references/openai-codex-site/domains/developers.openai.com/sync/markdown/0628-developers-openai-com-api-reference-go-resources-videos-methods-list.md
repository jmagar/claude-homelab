List videos | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Videos](/api/reference/go/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List videos
client.Videos.List(ctx, query) (\*ConversationCursorPage[[Video](</api/reference/go/resources/videos#(resource) videos > (model) video > (schema)>)], error)
GET/videos
List recently generated videos for the current project.
##### ParametersExpand Collapse
query VideoListParams
After param.Field[string]Optional
Identifier for the last item from the previous pagination request
[](<#(resource) videos > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
Number of items to retrieve
minimum0
maximum100
[](<#(resource) videos > (method) list > (params) default > (param) limit>)
Order param.Field[[VideoListParamsOrder](</api/reference/go/resources/videos/methods/list#(resource) videos > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
const VideoListParamsOrderAsc [VideoListParamsOrder](</api/reference/go/resources/videos/methods/list#(resource) videos > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) videos > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const VideoListParamsOrderDesc [VideoListParamsOrder](</api/reference/go/resources/videos/methods/list#(resource) videos > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) videos > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) videos > (method) list > (params) default > (param) order>)
[](<#(resource) videos > (method) list > (params) default>)
##### ReturnsExpand Collapse
type Video struct{…}
Structured information describing a generated video job.
ID string
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
CompletedAt int64
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
CreatedAt int64
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
Error [VideoCreateError](</api/reference/go/resources/videos#(resource) videos > (model) video_create_error > (schema)>)
Error payload that explains why generation failed, if applicable.
Code string
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) code>)
Message string
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video > (schema) > (property) error>)
ExpiresAt int64
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
Model VideoModel
The video generation model that produced the job.
One of the following:
string
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 0>)
type VideoModel string
One of the following:
const VideoModelSora2 VideoModel = "sora-2"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 0>)
const VideoModelSora2Pro VideoModel = "sora-2-pro"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 1>)
const VideoModelSora2\_2025\_10\_06 VideoModel = "sora-2-2025-10-06"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 2>)
const VideoModelSora2Pro2025\_10\_06 VideoModel = "sora-2-pro-2025-10-06"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 3>)
const VideoModelSora2\_2025\_12\_08 VideoModel = "sora-2-2025-12-08"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 4>)
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1>)
[](<#(resource) videos > (model) video > (schema) > (property) model>)
Object Video
The object type, which is always `video`.
[](<#(resource) videos > (model) video > (schema) > (property) object>)
Progress int64
Approximate completion percentage for the generation task.
[](<#(resource) videos > (model) video > (schema) > (property) progress>)
Prompt string
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
RemixedFromVideoID string
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
Seconds [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>)
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
One of the following:
string
[](<#(resource) videos > (model) video > (schema) > (property) seconds > (variant) 0>)
type VideoSeconds string
One of the following:
const VideoSeconds4 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
const VideoSeconds8 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
const VideoSeconds12 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
Size [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>)
The resolution of the generated video.
One of the following:
const VideoSize720x1280 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "720x1280"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 0>)
const VideoSize1280x720 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "1280x720"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 1>)
const VideoSize1024x1792 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "1024x1792"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 2>)
const VideoSize1792x1024 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "1792x1024"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) size>)
Status VideoStatus
Current lifecycle status of the video job.
One of the following:
const VideoStatusQueued VideoStatus = "queued"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 0>)
const VideoStatusInProgress VideoStatus = "in\_progress"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 1>)
const VideoStatusCompleted VideoStatus = "completed"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 2>)
const VideoStatusFailed VideoStatus = "failed"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) status>)
[](<#(resource) videos > (model) video > (schema)>)
### List videos
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
page, err := client.Videos.List(context.TODO(), openai.VideoListParams{
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"data": [
{
"id": "video\_123",
"object": "video",
"model": "sora-2",
"status": "completed"
}
],
"object": "list"
}
`
```
##### Returns Examples
```
`{
"data": [
{
"id": "video\_123",
"object": "video",
"model": "sora-2",
"status": "completed"
}
],
"object": "list"
}
`
```