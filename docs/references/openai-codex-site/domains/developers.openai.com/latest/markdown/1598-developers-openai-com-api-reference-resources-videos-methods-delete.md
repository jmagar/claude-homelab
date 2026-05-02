Delete video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Videos](/api/reference/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete video
DELETE/videos/{video\_id}
Permanently delete a completed or failed video and its stored assets.
##### Path ParametersExpand Collapse
video\_id: string
[](<#(resource) videos > (method) delete > (params) default > (param) video_id > (schema)>)
##### ReturnsExpand Collapse
id: string
Identifier of the deleted video.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) id>)
deleted: boolean
Indicates that the video resource was deleted.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) deleted>)
object: "video.deleted"
The object type that signals the deletion response.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) object>)
### Delete video
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
`curl https://api.openai.com/v1/videos/$VIDEO\_ID \\
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
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