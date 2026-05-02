Retrieve video content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Videos](/api/reference/typescript/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve video content
client.videos.downloadContent(stringvideoID, VideoDownloadContentParams { variant } query?, RequestOptionsoptions?): Response
GET/videos/{video\_id}/content
Download the generated video bytes or a derived preview asset.
Streams the rendered video content for the specified video job.
##### ParametersExpand Collapse
videoID: string
[](<#(resource) videos > (method) download_content > (params) default > (param) video_id > (schema)>)
query: VideoDownloadContentParams { variant }
variant?: "video" | "thumbnail" | "spritesheet"
Which downloadable asset to return. Defaults to the MP4 video.
One of the following:
"video"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 0>)
"thumbnail"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 1>)
"spritesheet"
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 2>)
[](<#(resource) videos > (method) download_content > (params) default > (param) variant>)
[](<#(resource) videos > (method) download_content > (params) default>)
##### ReturnsExpand Collapse
unnamed\_schema\_5 = Response
[](<#(resource) videos > (method) download_content > (network schema)>)
### Retrieve video content
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
const response = await client.videos.downloadContent('video\_123');
console.log(response);
const content = await response.blob();
console.log(content);
`
```
##### Returns Examples