Create an extension of a completed video. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Videos](/api/reference/python/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create an extension of a completed video.
videos.extend(VideoExtendParams\*\*kwargs) -\> [Video](</api/reference/python/resources/videos#(resource) videos > (model) video > (schema)>)
POST/videos/extensions
Create an extension of a completed video.
##### ParametersExpand Collapse
prompt: str
Updated text prompt that directs the extension generation.
maxLength32000
minLength1
[](<#(resource) videos > (method) extend > (params) default > (param) prompt > (schema)>)
seconds: [VideoSeconds](</api/reference/python/resources/videos#(resource) videos > (model) video_seconds > (schema)>)
Length of the newly generated extension segment in seconds (allowed values: 4, 8, 12, 16, 20).
One of the following:
"4"
[](<#(resource) videos > (method) extend > (params) default > (param) seconds > (schema) + (resource) videos > (model) video_seconds > (schema) > (member) 0>)
"8"
[](<#(resource) videos > (method) extend > (params) default > (param) seconds > (schema) + (resource) videos > (model) video_seconds > (schema) > (member) 1>)
"12"
[](<#(resource) videos > (method) extend > (params) default > (param) seconds > (schema) + (resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (method) extend > (params) default > (param) seconds > (schema)>)
video: [Video](</api/reference/python/resources/videos/methods/extend#(resource) videos > (method) extend > (params) default > (param) video > (schema)>)
Reference to the completed video to extend.
One of the following:
FileTypes
Reference to the completed video to extend.
[](<#(resource) videos > (method) extend > (params) default > (param) video > (schema) > (variant) 0>)
class VideoVideoReferenceInputParam: …
Reference to the completed video.
id: str
The identifier of the completed video.
[](<#(resource) videos > (method) extend > (params) default > (param) video > (schema) > (variant) 1 > (property) id>)
[](<#(resource) videos > (method) extend > (params) default > (param) video > (schema) > (variant) 1>)
[](<#(resource) videos > (method) extend > (params) default > (param) video > (schema)>)
##### ReturnsExpand Collapse
class Video: …
Structured information describing a generated video job.
id: str
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
completed\_at: Optional[int]
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
created\_at: int
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
error: Optional[VideoCreateError]
Error payload that explains why generation failed, if applicable.
code: str
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) code>)
message: str
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video > (schema) > (property) error>)
expires\_at: Optional[int]
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
model: [VideoModel](</api/reference/python/resources/videos#(resource) videos > (model) video_model > (schema)>)
The video generation model that produced the job.
One of the following:
str
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 0>)
Literal["sora-2", "sora-2-pro", "sora-2-2025-10-06", 2 more]
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
object: Literal["video"]
The object type, which is always `video`.
[](<#(resource) videos > (model) video > (schema) > (property) object>)
progress: int
Approximate completion percentage for the generation task.
[](<#(resource) videos > (model) video > (schema) > (property) progress>)
prompt: Optional[str]
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
remixed\_from\_video\_id: Optional[str]
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
seconds: Union[str, [VideoSeconds](</api/reference/python/resources/videos#(resource) videos > (model) video_seconds > (schema)>)]
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
One of the following:
str
[](<#(resource) videos > (model) video > (schema) > (property) seconds > (variant) 0>)
Literal["4", "8", "12"]
One of the following:
"4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
"8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
"12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds > (variant) 1>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
size: [VideoSize](</api/reference/python/resources/videos#(resource) videos > (model) video_size > (schema)>)
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
status: Literal["queued", "in\_progress", "completed", "failed"]
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
### Create an extension of a completed video.
Python
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
`import os
from openai import OpenAI
client = OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
)
video = client.videos.extend(
prompt="x",
seconds="4",
video=b"Example data",
)
print(video.id)`
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