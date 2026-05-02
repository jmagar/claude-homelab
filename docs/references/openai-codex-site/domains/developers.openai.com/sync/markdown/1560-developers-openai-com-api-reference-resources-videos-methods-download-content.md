Retrieve video content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Videos](/api/reference/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve video content
GET/videos/{video\_id}/content
Download the generated video bytes or a derived preview asset.
Streams the rendered video content for the specified video job.
##### Path ParametersExpand Collapse
video\_id: string
[](<#(resource) videos > (method) download_content > (params) default > (param) video_id > (schema)>)
##### Query ParametersExpand Collapse
variant: optional "video" or "thumbnail" or "spritesheet"
Which downloadable asset to return. Defaults to the MP4 video.
One of the following:
"video"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 0>)
"thumbnail"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 1>)
"spritesheet"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 2>)
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>)
### Retrieve video content
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
`curl https://api.openai.com/v1/videos/$VIDEO\_ID/content \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
```
##### Returns Examples