Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Containers](/api/reference/go/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
##### [List container files](/api/reference/go/resources/containers/subresources/files/methods/list)
client.Containers.Files.List(ctx, containerID, query) (\*CursorPage[[ContainerFileListResponse](</api/reference/go/resources/containers#(resource) containers.files > (model) ContainerFileListResponse > (schema)>)], error)
GET/containers/{container\_id}/files
##### [Create container file](/api/reference/go/resources/containers/subresources/files/methods/create)
client.Containers.Files.New(ctx, containerID, body) (\*[ContainerFileNewResponse](</api/reference/go/resources/containers#(resource) containers.files > (model) ContainerFileNewResponse > (schema)>), error)
POST/containers/{container\_id}/files
##### [Retrieve container file](/api/reference/go/resources/containers/subresources/files/methods/retrieve)
client.Containers.Files.Get(ctx, containerID, fileID) (\*[ContainerFileGetResponse](</api/reference/go/resources/containers#(resource) containers.files > (model) ContainerFileGetResponse > (schema)>), error)
GET/containers/{container\_id}/files/{file\_id}
##### [Delete a container file](/api/reference/go/resources/containers/subresources/files/methods/delete)
client.Containers.Files.Delete(ctx, containerID, fileID) error
DELETE/containers/{container\_id}/files/{file\_id}
#### FilesContent
##### [Retrieve container file content](/api/reference/go/resources/containers/subresources/files/subresources/content/methods/retrieve)
client.Containers.Files.Content.Get(ctx, containerID, fileID) (\*Response, error)
GET/containers/{container\_id}/files/{file\_id}/content