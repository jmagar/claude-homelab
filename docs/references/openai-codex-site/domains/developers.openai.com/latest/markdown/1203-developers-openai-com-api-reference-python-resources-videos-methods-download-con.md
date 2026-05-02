Retrieve video content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Videos](/api/reference/python/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve video content
videos.download\_content(strvideo\_id, VideoDownloadContentParams\*\*kwargs) -\> BinaryResponseContent
GET/videos/{video\_id}/content
Download the generated video bytes or a derived preview asset.
Streams the rendered video content for the specified video job.
##### ParametersExpand Collapse
video\_id: str
[](<#(resource) videos > (method) download_content > (params) default > (param) video_id > (schema)>)
variant: Optional[Literal["video", "thumbnail", "spritesheet"]]
Which downloadable asset to return. Defaults to the MP4 video.
One of the following:
"video"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 0>)
"thumbnail"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 1>)
"spritesheet"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 2>)
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>)
##### ReturnsExpand Collapse
BinaryResponseContent
[](<#(resource) videos > (method) download_content > (network schema)>)
### Retrieve video content
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
response = client.videos.download\_content(
video\_id="video\_123",
)
print(response)
content = response.read()
print(content)
`
```
##### Returns Examples