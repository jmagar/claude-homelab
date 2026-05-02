Delete video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Videos](/api/reference/typescript/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete video
client.videos.delete(stringvideoID, RequestOptionsoptions?): [VideoDeleteResponse](</api/reference/typescript/resources/videos#(resource) videos > (model) video_delete_response > (schema)>) { id, deleted, object }
DELETE/videos/{video\_id}
Permanently delete a completed or failed video and its stored assets.
##### ParametersExpand Collapse
videoID: string
[](<#(resource) videos > (method) delete > (params) default > (param) video_id > (schema)>)
##### ReturnsExpand Collapse
VideoDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a video.
id: string
Identifier of the deleted video.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) id>)
deleted: boolean
Indicates that the video resource was deleted.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) deleted>)
object: "video.deleted"
The object type that signals the deletion response.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) object>)
[](<#(resource) videos > (model) video_delete_response > (schema)>)
### Delete video
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
const video = await client.videos.delete('video\_123');
console.log(video.id);
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