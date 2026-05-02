Retrieve video content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Videos](/api/reference/java/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve video content
HttpResponse videos().downloadContent(VideoDownloadContentParamsparams = VideoDownloadContentParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/videos/{video\_id}/content
Download the generated video bytes or a derived preview asset.
Streams the rendered video content for the specified video job.
##### ParametersExpand Collapse
VideoDownloadContentParams params
Optional\<String\> videoId
[](<#(resource) videos > (method) download_content > (params) default > (param) video_id > (schema)>)
Optional\<[Variant](</api/reference/java/resources/videos/methods/download_content#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>)\> variant
Which downloadable asset to return. Defaults to the MP4 video.
VIDEO("video")
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 0>)
THUMBNAIL("thumbnail")
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 1>)
SPRITESHEET("spritesheet")
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema) > (member) 2>)
[](<#(resource) videos > (method) download_content > (params) default > (param) variant > (schema)>)
[](<#(resource) videos > (method) download_content > (params) default>)
### Retrieve video content
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.core.http.HttpResponse;
import com.openai.models.videos.VideoDownloadContentParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
HttpResponse response = client.videos().downloadContent("video\_123");
}
}
`
```
##### Returns Examples