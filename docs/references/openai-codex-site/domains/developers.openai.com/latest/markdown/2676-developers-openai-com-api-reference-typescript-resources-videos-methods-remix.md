Remix video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Videos](/api/reference/typescript/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Remix video
client.videos.remix(stringvideoID, VideoRemixParams { prompt } body, RequestOptionsoptions?): [Video](</api/reference/typescript/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
POST/videos/{video\_id}/remix
Create a remix of a completed video using a refreshed prompt.
##### ParametersExpand Collapse
videoID: string
[](<#(resource) videos > (method) remix > (params) default > (param) video_id > (schema)>)
body: VideoRemixParams { prompt }
prompt: string
Updated text prompt that directs the remix generation.
maxLength32000
minLength1
[](<#(resource) videos > (method) remix > (params) default > (param) prompt>)
[](<#(resource) videos > (method) remix > (params) default>)
##### ReturnsExpand Collapse
Video { id, completed\_at, created\_at, 10 more }
Structured information describing a generated video job.
id: string
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
completed\_at: number | null
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
created\_at: number
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
error: [VideoCreateError](</api/reference/typescript/resources/videos#(resource) videos > (model) video_create_error > (schema)>) { code, message } | null
Error payload that explains why generation failed, if applicable.
code: string
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) code>)
message: string
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video > (schema) > (property) error>)
expires\_at: number | null
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
model: [VideoModel](</api/reference/typescript/resources/videos#(resource) videos > (model) video_model > (schema)>)
The video generation model that produced the job.
One of the following:
(string & {})
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 0>)
"sora-2" | "sora-2-pro" | "sora-2-2025-10-06" | 2 more
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
prompt: string | null
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
remixed\_from\_video\_id: string | null
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
seconds: (string & {}) | [VideoSeconds](</api/reference/typescript/resources/videos#(resource) videos > (model) video_seconds > (schema)>)
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
One of the following:
(string & {})
[](<#(resource) videos > (model) video > (schema) > (property) seconds > (variant) 0>)
VideoSeconds = "4" | "8" | "12"
One of the following:
"4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
"8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
"12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
size: [VideoSize](</api/reference/typescript/resources/videos#(resource) videos > (model) video_size > (schema)>)
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
status: "queued" | "in\_progress" | "completed" | "failed"
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
### Remix video
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI();
const video = await client.videos.remix('video\_123', { prompt: 'Extend the scene with the cat taking a bow to the cheering audience' });
console.log(video.id);
`
```
```
`{
"id": "video\_456",
"object": "video",
"model": "sora-2",
"status": "queued",
"progress": 0,
"created\_at": 1712698600,
"size": "720x1280",
"seconds": "8",
"remixed\_from\_video\_id": "video\_123"
}
`
```
##### Returns Examples
```
`{
"id": "video\_456",
"object": "video",
"model": "sora-2",
"status": "queued",
"progress": 0,
"created\_at": 1712698600,
"size": "720x1280",
"seconds": "8",
"remixed\_from\_video\_id": "video\_123"
}
`
```