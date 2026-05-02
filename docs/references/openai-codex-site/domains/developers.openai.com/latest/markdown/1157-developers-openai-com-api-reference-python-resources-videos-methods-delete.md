Delete video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Videos](/api/reference/python/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete video
videos.delete(strvideo\_id) -\> [VideoDeleteResponse](</api/reference/python/resources/videos#(resource) videos > (model) video_delete_response > (schema)>)
DELETE/videos/{video\_id}
Permanently delete a completed or failed video and its stored assets.
##### ParametersExpand Collapse
video\_id: str
[](<#(resource) videos > (method) delete > (params) default > (param) video_id > (schema)>)
##### ReturnsExpand Collapse
class VideoDeleteResponse: …
Confirmation payload returned after deleting a video.
id: str
Identifier of the deleted video.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) id>)
deleted: bool
Indicates that the video resource was deleted.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) deleted>)
object: Literal["video.deleted"]
The object type that signals the deletion response.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) object>)
[](<#(resource) videos > (model) video_delete_response > (schema)>)
### Delete video
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
`from openai import OpenAI
client = OpenAI()
video = client.videos.delete(
"video\_123",
)
print(video.id)
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