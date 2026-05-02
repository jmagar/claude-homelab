Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Containers](/api/reference/java/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
##### [List container files](/api/reference/java/resources/containers/subresources/files/methods/list)
FileListPage containers().files().list(FileListParamsparams = FileListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/containers/{container\_id}/files
##### [Create container file](/api/reference/java/resources/containers/subresources/files/methods/create)
[FileCreateResponse](</api/reference/java/resources/containers#(resource) containers.files > (model) FileCreateResponse > (schema)>) containers().files().create(FileCreateParamsparams = FileCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/containers/{container\_id}/files
##### [Retrieve container file](/api/reference/java/resources/containers/subresources/files/methods/retrieve)
[FileRetrieveResponse](</api/reference/java/resources/containers#(resource) containers.files > (model) FileRetrieveResponse > (schema)>) containers().files().retrieve(FileRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/containers/{container\_id}/files/{file\_id}
##### [Delete a container file](/api/reference/java/resources/containers/subresources/files/methods/delete)
containers().files().delete(FileDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/containers/{container\_id}/files/{file\_id}
#### FilesContent
##### [Retrieve container file content](/api/reference/java/resources/containers/subresources/files/subresources/content/methods/retrieve)
HttpResponse containers().files().content().retrieve(ContentRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/containers/{container\_id}/files/{file\_id}/content