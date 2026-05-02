List videos | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Videos](/api/reference/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List videos
GET/videos
List recently generated videos for the current project.
##### Query ParametersExpand Collapse
after: optional string
Identifier for the last item from the previous pagination request
[](<#(resource) videos > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
Number of items to retrieve
minimum0
maximum100
[](<#(resource) videos > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
One of the following:
"asc"
[](<#(resource) videos > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) videos > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) videos > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of [Video](</api/reference/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
A list of items
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
[](<#(resource) videos > (method) list > (network schema) > (property) data>)
first\_id: string
The ID of the first item in the list.
[](<#(resource) videos > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
Whether there are more items available.
[](<#(resource) videos > (method) list > (network schema) > (property) has_more>)
last\_id: string
The ID of the last item in the list.
[](<#(resource) videos > (method) list > (network schema) > (property) last_id>)
object: "list"
The type of object returned, must be `list`.
[](<#(resource) videos > (method) list > (network schema) > (property) object>)
### List videos
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
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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