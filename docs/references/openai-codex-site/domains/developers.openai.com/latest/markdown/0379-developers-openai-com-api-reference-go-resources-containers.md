Containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Containers
##### [List containers](/api/reference/go/resources/containers/methods/list)
client.Containers.List(ctx, query) (\*CursorPage[[ContainerListResponse](</api/reference/go/resources/containers#(resource) containers > (model) ContainerListResponse > (schema)>)], error)
GET/containers
##### [Create container](/api/reference/go/resources/containers/methods/create)
client.Containers.New(ctx, body) (\*[ContainerNewResponse](</api/reference/go/resources/containers#(resource) containers > (model) ContainerNewResponse > (schema)>), error)
POST/containers
##### [Retrieve container](/api/reference/go/resources/containers/methods/retrieve)
client.Containers.Get(ctx, containerID) (\*[ContainerGetResponse](</api/reference/go/resources/containers#(resource) containers > (model) ContainerGetResponse > (schema)>), error)
GET/containers/{container\_id}
##### [Delete a container](/api/reference/go/resources/containers/methods/delete)
client.Containers.Delete(ctx, containerID) error
DELETE/containers/{container\_id}
#### ContainersFiles
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
#### ContainersFilesContent
##### [Retrieve container file content](/api/reference/go/resources/containers/subresources/files/subresources/content/methods/retrieve)
client.Containers.Files.Content.Get(ctx, containerID, fileID) (\*Response, error)
GET/containers/{container\_id}/files/{file\_id}/content