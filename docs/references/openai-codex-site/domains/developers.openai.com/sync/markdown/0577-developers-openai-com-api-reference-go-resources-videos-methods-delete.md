Delete video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Videos](/api/reference/go/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete video
client.Videos.Delete(ctx, videoID) (\*[VideoDeleteResponse](</api/reference/go/resources/videos#(resource) videos > (model) VideoDeleteResponse > (schema)>), error)
DELETE/videos/{video\_id}
Permanently delete a completed or failed video and its stored assets.
##### ParametersExpand Collapse
videoID string
[](<#(resource) videos > (method) delete > (params) default > (param) video_id > (schema)>)
##### ReturnsExpand Collapse
type VideoDeleteResponse struct{…}
Confirmation payload returned after deleting a video.
ID string
Identifier of the deleted video.
[](<#(resource) videos > (model) VideoDeleteResponse > (schema) > (property) id>)
Deleted bool
Indicates that the video resource was deleted.
[](<#(resource) videos > (model) VideoDeleteResponse > (schema) > (property) deleted>)
Object VideoDeleted
The object type that signals the deletion response.
[](<#(resource) videos > (model) VideoDeleteResponse > (schema) > (property) object>)
[](<#(resource) videos > (model) VideoDeleteResponse > (schema)>)
### Delete video
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
)
func main() {
client := openai.NewClient()
video, err := client.Videos.Delete(context.TODO(), "video\_123")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", video.ID)
}
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