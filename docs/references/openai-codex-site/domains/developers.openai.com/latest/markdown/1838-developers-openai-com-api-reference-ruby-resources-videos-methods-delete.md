Delete video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Videos](/api/reference/ruby/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete video
videos.delete(video\_id) -\> [VideoDeleteResponse](</api/reference/ruby/resources/videos#(resource) videos > (model) video_delete_response > (schema)>) { id, deleted, object }
DELETE/videos/{video\_id}
Permanently delete a completed or failed video and its stored assets.
##### ParametersExpand Collapse
video\_id: String
[](<#(resource) videos > (method) delete > (params) default > (param) video_id > (schema)>)
##### ReturnsExpand Collapse
class VideoDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a video.
id: String
Identifier of the deleted video.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) id>)
deleted: bool
Indicates that the video resource was deleted.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) deleted>)
object: :"video.deleted"
The object type that signals the deletion response.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) object>)
[](<#(resource) videos > (model) video_delete_response > (schema)>)
### Delete video
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
openai = OpenAI::Client.new
video = openai.videos.delete("video\_123")
puts(video)
`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "video.deleted"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "video.deleted"
}`
```