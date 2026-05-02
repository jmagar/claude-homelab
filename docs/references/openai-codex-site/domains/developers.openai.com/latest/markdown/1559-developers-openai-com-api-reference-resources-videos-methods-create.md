Create video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Videos](/api/reference/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create video
POST/videos
Create a new video generation job from a prompt and optional reference assets.
##### Body ParametersJSONExpand Collapse
prompt: string
Text prompt that describes the video to generate.
maxLength32000
minLength1
[](<#(resource) videos > (method) create > (params) 0 > (param) prompt > (schema)>)
input\_reference: optional [ImageInputReferenceParam](</api/reference/resources/videos#(resource) videos > (model) image_input_reference_param > (schema)>) { file\_id, image\_url }
Optional reference object that guides generation. Provide exactly one of `image\_url` or `file\_id`.
file\_id: optional string
[](<#(resource) videos > (method) create > (params) 0 > (param) input_reference > (schema) + (resource) videos > (model) image_input_reference_param > (schema) > (property) file_id>)
image\_url: optional string
A fully qualified URL or base64-encoded data URL.
maxLength20971520
[](<#(resource) videos > (method) create > (params) 0 > (param) input_reference > (schema) + (resource) videos > (model) image_input_reference_param > (schema) > (property) image_url>)
[](<#(resource) videos > (method) create > (params) 0 > (param) input_reference > (schema)>)
model: optional [VideoModel](</api/reference/resources/videos#(resource) videos > (model) video_model > (schema)>)
The video generation model to use (allowed values: sora-2, sora-2-pro). Defaults to `sora-2`.
One of the following:
string
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema) + (resource) videos > (model) video_model > (schema) > (variant) 0>)
"sora-2" or "sora-2-pro" or "sora-2-2025-10-06" or 2 more
One of the following:
"sora-2"
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema) + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 0>)
"sora-2-pro"
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema) + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 1>)
"sora-2-2025-10-06"
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema) + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 2>)
"sora-2-pro-2025-10-06"
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema) + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 3>)
"sora-2-2025-12-08"
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema) + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 4>)
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema) + (resource) videos > (model) video_model > (schema) > (variant) 1>)
[](<#(resource) videos > (method) create > (params) 0 > (param) model > (schema)>)
seconds: optional [VideoSeconds](</api/reference/resources/videos#(resource) videos > (model) video_seconds > (schema)>)
Clip duration in seconds (allowed values: 4, 8, 12). Defaults to 4 seconds.
One of the following:
"4"
[](<#(resource) videos > (method) create > (params) 0 > (param) seconds > (schema) + (resource) videos > (model) video_seconds > (schema) > (member) 0>)
"8"
[](<#(resource) videos > (method) create > (params) 0 > (param) seconds > (schema) + (resource) videos > (model) video_seconds > (schema) > (member) 1>)
"12"
[](<#(resource) videos > (method) create > (params) 0 > (param) seconds > (schema) + (resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (method) create > (params) 0 > (param) seconds > (schema)>)
size: optional [VideoSize](</api/reference/resources/videos#(resource) videos > (model) video_size > (schema)>)
Output resolution formatted as width x height (allowed values: 720x1280, 1280x720, 1024x1792, 1792x1024). Defaults to 720x1280.
One of the following:
"720x1280"
[](<#(resource) videos > (method) create > (params) 0 > (param) size > (schema) + (resource) videos > (model) video_size > (schema) > (member) 0>)
"1280x720"
[](<#(resource) videos > (method) create > (params) 0 > (param) size > (schema) + (resource) videos > (model) video_size > (schema) > (member) 1>)
"1024x1792"
[](<#(resource) videos > (method) create > (params) 0 > (param) size > (schema) + (resource) videos > (model) video_size > (schema) > (member) 2>)
"1792x1024"
[](<#(resource) videos > (method) create > (params) 0 > (param) size > (schema) + (resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (method) create > (params) 0 > (param) size > (schema)>)
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
### Create video
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
`curl https://api.openai.com/v1/videos \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F "model=sora-2" \\
-F "prompt=A calico cat playing a piano on stage"
`
```
```
`{
"id": "video\_123",
"object": "video",
"model": "sora-2",
"status": "queued",
"progress": 0,
"created\_at": 1712697600,
"size": "1024x1792",
"seconds": "8",
"quality": "standard"
}
`
```
##### Returns Examples
```
`{
"id": "video\_123",
"object": "video",
"model": "sora-2",
"status": "queued",
"progress": 0,
"created\_at": 1712697600,
"size": "1024x1792",
"seconds": "8",
"quality": "standard"
}
`
```