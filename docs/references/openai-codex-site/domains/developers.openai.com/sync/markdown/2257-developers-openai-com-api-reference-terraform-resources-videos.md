Videos | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Videos
#### resource openai\_video
##### required Expand Collapse
prompt: String
Text prompt that describes the video to generate.
[](<#(resource) videos > (terraform resource) > (attribute) prompt>)
##### optional Expand Collapse
input\_reference?: String
Optional reference asset upload or reference object that guides generation.
[](<#(resource) videos > (terraform resource) > (attribute) input_reference>)
model?: String
The video generation model to use (allowed values: sora-2, sora-2-pro). Defaults to `sora-2`.
[](<#(resource) videos > (terraform resource) > (attribute) model>)
seconds?: String
Clip duration in seconds (allowed values: 4, 8, 12). Defaults to 4 seconds.
[](<#(resource) videos > (terraform resource) > (attribute) seconds>)
size?: String
Output resolution formatted as width x height (allowed values: 720x1280, 1280x720, 1024x1792, 1792x1024). Defaults to 720x1280.
[](<#(resource) videos > (terraform resource) > (attribute) size>)
video?: String
Reference to the completed video to edit.
[](<#(resource) videos > (terraform resource) > (attribute) video>)
##### computed Expand Collapse
id: String
Unique identifier for the video job.
[](<#(resource) videos > (terraform resource) > (attribute) id>)
completed\_at: Int64
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (terraform resource) > (attribute) completed_at>)
created\_at: Int64
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (terraform resource) > (attribute) created_at>)
expires\_at: Int64
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (terraform resource) > (attribute) expires_at>)
object: String
The object type, which is always `video`.
[](<#(resource) videos > (terraform resource) > (attribute) object>)
progress: Int64
Approximate completion percentage for the generation task.
[](<#(resource) videos > (terraform resource) > (attribute) progress>)
remixed\_from\_video\_id: String
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (terraform resource) > (attribute) remixed_from_video_id>)
status: String
Current lifecycle status of the video job.
[](<#(resource) videos > (terraform resource) > (attribute) status>)
error: Attributes
Error payload that explains why generation failed, if applicable.
code: String
A machine-readable error code that was returned.
[](<#(resource) videos > (terraform resource) > (attribute) error > (attribute) code>)
message: String
A human-readable description of the error that was returned.
[](<#(resource) videos > (terraform resource) > (attribute) error > (attribute) message>)
[](<#(resource) videos > (terraform resource) > (attribute) error>)
### openai\_video
Terraform
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
`resource "openai\_video" "example\_video" {
prompt = "x"
input\_reference = "Example data"
model = "string"
seconds = "4"
size = "720x1280"
}
`
```
#### data openai\_video
##### optional Expand Collapse
video\_id?: String
[](<#(resource) videos > (terraform datasource-single) > (attribute) video_id>)
find\_one\_by?: Attributes
order?: String
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
[](<#(resource) videos > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) videos > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) videos > (terraform datasource-single) > (attribute) id>)
completed\_at: Int64
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (terraform datasource-single) > (attribute) completed_at>)
created\_at: Int64
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (terraform datasource-single) > (attribute) created_at>)
expires\_at: Int64
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (terraform datasource-single) > (attribute) expires_at>)
model: String
The video generation model that produced the job.
[](<#(resource) videos > (terraform datasource-single) > (attribute) model>)
object: String
The object type, which is always `video`.
[](<#(resource) videos > (terraform datasource-single) > (attribute) object>)
progress: Int64
Approximate completion percentage for the generation task.
[](<#(resource) videos > (terraform datasource-single) > (attribute) progress>)
prompt: String
The prompt that was used to generate the video.
[](<#(resource) videos > (terraform datasource-single) > (attribute) prompt>)
remixed\_from\_video\_id: String
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (terraform datasource-single) > (attribute) remixed_from_video_id>)
seconds: String
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
[](<#(resource) videos > (terraform datasource-single) > (attribute) seconds>)
size: String
The resolution of the generated video.
[](<#(resource) videos > (terraform datasource-single) > (attribute) size>)
status: String
Current lifecycle status of the video job.
[](<#(resource) videos > (terraform datasource-single) > (attribute) status>)
error: Attributes
Error payload that explains why generation failed, if applicable.
code: String
A machine-readable error code that was returned.
[](<#(resource) videos > (terraform datasource-single) > (attribute) error > (attribute) code>)
message: String
A human-readable description of the error that was returned.
[](<#(resource) videos > (terraform datasource-single) > (attribute) error > (attribute) message>)
[](<#(resource) videos > (terraform datasource-single) > (attribute) error>)
### openai\_video
Terraform
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
`data "openai\_video" "example\_video" {
video\_id = "video\_123"
}
`
```
#### data openai\_videos
##### optional Expand Collapse
order?: String
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) videos > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the video job.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) id>)
completed\_at: Int64
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) completed_at>)
created\_at: Int64
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
error: Attributes
Error payload that explains why generation failed, if applicable.
code: String
A machine-readable error code that was returned.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) error > (attribute) code>)
message: String
A human-readable description of the error that was returned.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) error > (attribute) message>)
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) error>)
expires\_at: Int64
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) expires_at>)
model: String
The video generation model that produced the job.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) model>)
object: String
The object type, which is always `video`.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) object>)
progress: Int64
Approximate completion percentage for the generation task.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) progress>)
prompt: String
The prompt that was used to generate the video.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) prompt>)
remixed\_from\_video\_id: String
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) remixed_from_video_id>)
seconds: String
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) seconds>)
size: String
The resolution of the generated video.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) size>)
status: String
Current lifecycle status of the video job.
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items > (attribute) status>)
[](<#(resource) videos > (terraform datasource-plural) > (attribute) items>)
### openai\_videos
Terraform
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
`data "openai\_videos" "example\_videos" {
order = "asc"
}
`
```