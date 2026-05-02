Create a new video generation job by editing a source video or existing generated video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Videos](/api/reference/ruby/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create a new video generation job by editing a source video or existing generated video.
videos.edit(\*\*kwargs) -\> [Video](</api/reference/ruby/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
POST/videos/edits
Create a new video generation job by editing a source video or existing generated video.
##### ParametersExpand Collapse
prompt: String
Text prompt that describes how to edit the source video.
maxLength32000
minLength1
[](<#(resource) videos > (method) edit > (params) default > (param) prompt > (schema)>)
video: String | VideoReferenceInputParam{ id}
Reference to the completed video to edit.
One of the following:
String = String
Reference to the completed video to edit.
[](<#(resource) videos > (method) edit > (params) default > (param) video > (schema) > (variant) 0>)
class VideoReferenceInputParam { id }
Reference to the completed video.
id: String
The identifier of the completed video.
[](<#(resource) videos > (method) edit > (params) default > (param) video > (schema) > (variant) 1 > (property) id>)
[](<#(resource) videos > (method) edit > (params) default > (param) video > (schema) > (variant) 1>)
[](<#(resource) videos > (method) edit > (params) default > (param) video > (schema)>)
##### ReturnsExpand Collapse
class Video { id, completed\_at, created\_at, 10 more }
Structured information describing a generated video job.
id: String
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
completed\_at: Integer
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
created\_at: Integer
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
error: [VideoCreateError](</api/reference/ruby/resources/videos#(resource) videos > (model) video_create_error > (schema)>) { code, message }
Error payload that explains why generation failed, if applicable.
code: String
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) code>)
message: String
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video > (schema) > (property) error>)
expires\_at: Integer
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
model: [VideoModel](</api/reference/ruby/resources/videos#(resource) videos > (model) video_model > (schema)>)
The video generation model that produced the job.
One of the following:
String = String
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 0>)
VideoModel = :"sora-2" | :"sora-2-pro" | :"sora-2-2025-10-06" | 2 more
One of the following:
:"sora-2"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 0>)
:"sora-2-pro"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 1>)
:"sora-2-2025-10-06"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 2>)
:"sora-2-pro-2025-10-06"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 3>)
:"sora-2-2025-12-08"
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 4>)
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1>)
[](<#(resource) videos > (model) video > (schema) > (property) model>)
object: :video
The object type, which is always `video`.
[](<#(resource) videos > (model) video > (schema) > (property) object>)
progress: Integer
Approximate completion percentage for the generation task.
[](<#(resource) videos > (model) video > (schema) > (property) progress>)
prompt: String
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
remixed\_from\_video\_id: String
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
seconds: String | [VideoSeconds](</api/reference/ruby/resources/videos#(resource) videos > (model) video_seconds > (schema)>)
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
One of the following:
String = String
[](<#(resource) videos > (model) video > (schema) > (property) seconds > (variant) 0>)
VideoSeconds = :"4" | :"8" | :"12"
One of the following:
:"4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
:"8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
:"12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
size: [VideoSize](</api/reference/ruby/resources/videos#(resource) videos > (model) video_size > (schema)>)
The resolution of the generated video.
One of the following:
:"720x1280"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 0>)
:"1280x720"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 1>)
:"1024x1792"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 2>)
:"1792x1024"
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) size>)
status: :queued | :in\_progress | :completed | :failed
Current lifecycle status of the video job.
One of the following:
:queued
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 0>)
:in\_progress
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 1>)
:completed
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 2>)
:failed
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) status>)
[](<#(resource) videos > (model) video > (schema)>)
### Create a new video generation job by editing a source video or existing generated video.
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
video = openai.videos.edit(prompt: "x", video: StringIO.new("Example data"))
puts(video)`
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
"seconds": "string",
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
"seconds": "string",
"size": "720x1280",
"status": "queued"
}`
```