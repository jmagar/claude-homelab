Create a new video generation job by editing a source video or existing generated video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Videos](/api/reference/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new video generation job by editing a source video or existing generated video.
POST/videos/edits
Create a new video generation job by editing a source video or existing generated video.
##### Body ParametersJSONExpand Collapse
prompt: string
Text prompt that describes how to edit the source video.
maxLength32000
minLength1
[](<#(resource) videos > (method) edit > (params) 0 > (param) prompt > (schema)>)
video: object { id }
Reference to the completed video to edit.
id: string
The identifier of the completed video.
[](<#(resource) videos > (method) edit > (params) 0 > (param) video > (schema) > (property) id>)
[](<#(resource) videos > (method) edit > (params) 0 > (param) video > (schema)>)
##### ReturnsExpand Collapse
Video object { id, completed\_at, created\_at, 10 more }
Structured information describing a generated video job.
id: string
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
completed\_at: number
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
created\_at: number
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
error: [VideoCreateError](</api/reference/resources/videos#(resource) videos > (model) video_create_error > (schema)>) { code, message }
Error payload that explains why generation failed, if applicable.
code: string
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) code>)
message: string
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video > (schema) > (property) error>)
expires\_at: number
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
model: [VideoModel](</api/reference/resources/videos#(resource) videos > (model) video_model > (schema)>)
The video generation model that produced the job.
One of the following:
string
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 0>)
"sora-2" or "sora-2-pro" or "sora-2-2025-10-06" or 2 more
One of the following:
"sora-2"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 0>)
"sora-2-pro"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 1>)
"sora-2-2025-10-06"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 2>)
"sora-2-pro-2025-10-06"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 3>)
"sora-2-2025-12-08"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 4>)
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1>)
[](<#(resource) videos > (model) video > (schema) > (property) model>)
object: "video"
The object type, which is always `video`.
[](<#(resource) videos > (model) video > (schema) > (property) object>)
progress: number
Approximate completion percentage for the generation task.
[](<#(resource) videos > (model) video > (schema) > (property) progress>)
prompt: string
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
remixed\_from\_video\_id: string
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
seconds: string
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
size: [VideoSize](</api/reference/resources/videos#(resource) videos > (model) video_size > (schema)>)
The resolution of the generated video.
One of the following:
"720x1280"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 0>)
"1280x720"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 1>)
"1024x1792"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 2>)
"1792x1024"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) size>)
status: "queued" or "in\_progress" or "completed" or "failed"
Current lifecycle status of the video job.
One of the following:
"queued"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) status>)
[](<#(resource) videos > (model) video > (schema)>)
### Create a new video generation job by editing a source video or existing generated video.
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
`curl https://api.openai.com/v1/videos/edits \\
-H 'Content-Type: application/json' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"prompt": "x",
"video": {
"id": "video\_123"
}
}'`
```
200 example
```
`{
"id": "id",
"completed\_at": 0,
"created\_at": 0,
"error": {
"code": "code",
"message": "message"
},
"expires\_at": 0,
"model": "string",
"object": "video",
"progress": 0,
"prompt": "prompt",
"remixed\_from\_video\_id": "remixed\_from\_video\_id",
"seconds": "seconds",
"size": "720x1280",
"status": "queued"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"completed\_at": 0,
"created\_at": 0,
"error": {
"code": "code",
"message": "message"
},
"expires\_at": 0,
"model": "string",
"object": "video",
"progress": 0,
"prompt": "prompt",
"remixed\_from\_video\_id": "remixed\_from\_video\_id",
"seconds": "seconds",
"size": "720x1280",
"status": "queued"
}`
```