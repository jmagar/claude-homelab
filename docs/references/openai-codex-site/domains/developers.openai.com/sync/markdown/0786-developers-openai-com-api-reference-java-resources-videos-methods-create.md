Create video | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Videos](/api/reference/java/resources/videos)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create video
[Video](</api/reference/java/resources/videos#(resource) videos > (model) video > (schema)>) videos().create(VideoCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/videos
Create a new video generation job from a prompt and optional reference assets.
##### ParametersExpand Collapse
VideoCreateParams params
String prompt
Text prompt that describes the video to generate.
maxLength32000
minLength1
[](<#(resource) videos > (method) create > (params) default > (param) body > (schema) > (property) prompt>)
Optional\<InputReference\> inputReference
Optional reference asset upload or reference object that guides generation.
String
[](<#(resource) videos > (method) create > (params) default > (param) body > (schema) > (property) input_reference > (variant) 0>)
class ImageInputReferenceParam:
Optional\<String\> fileId
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) file_id>)
Optional\<String\> imageUrl
A fully qualified URL or base64-encoded data URL.
maxLength20971520
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) image_url>)
[](<#(resource) videos > (model) image_input_reference_param > (schema)>)
[](<#(resource) videos > (method) create > (params) default > (param) body > (schema) > (property) input_reference>)
Optional\<VideoModel\> model
The video generation model to use (allowed values: sora-2, sora-2-pro). Defaults to `sora-2`.
[](<#(resource) videos > (method) create > (params) default > (param) body > (schema) > (property) model>)
Optional\<[VideoSeconds](</api/reference/java/resources/videos#(resource) videos > (model) video_seconds > (schema)>)\> seconds
Clip duration in seconds (allowed values: 4, 8, 12). Defaults to 4 seconds.
[](<#(resource) videos > (method) create > (params) default > (param) body > (schema) > (property) seconds>)
Optional\<[VideoSize](</api/reference/java/resources/videos#(resource) videos > (model) video_size > (schema)>)\> size
Output resolution formatted as width x height (allowed values: 720x1280, 1280x720, 1024x1792, 1792x1024). Defaults to 720x1280.
[](<#(resource) videos > (method) create > (params) default > (param) body > (schema) > (property) size>)
[](<#(resource) videos > (method) create > (params) default>)
##### ReturnsExpand Collapse
class Video:
Structured information describing a generated video job.
String id
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
Optional\<Long\> completedAt
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
long createdAt
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
Optional\<[VideoCreateError](</api/reference/java/resources/videos#(resource) videos > (model) video_create_error > (schema)>)\> error
Error payload that explains why generation failed, if applicable.
String code
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) code>)
String message
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video > (schema) > (property) error + (resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video > (schema) > (property) error>)
Optional\<Long\> expiresAt
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
VideoModel model
The video generation model that produced the job.
One of the following:
SORA\_2("sora-2")
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 0>)
SORA\_2\_PRO("sora-2-pro")
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 1>)
SORA\_2\_2025\_10\_06("sora-2-2025-10-06")
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 2>)
SORA\_2\_PRO\_2025\_10\_06("sora-2-pro-2025-10-06")
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 3>)
SORA\_2\_2025\_12\_08("sora-2-2025-12-08")
[](<#(resource) videos > (model) video > (schema) > (property) model + (resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 4>)
[](<#(resource) videos > (model) video > (schema) > (property) model>)
JsonValue; object\_ "video"constant"video"constant
The object type, which is always `video`.
[](<#(resource) videos > (model) video > (schema) > (property) object>)
long progress
Approximate completion percentage for the generation task.
[](<#(resource) videos > (model) video > (schema) > (property) progress>)
Optional\<String\> prompt
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
Optional\<String\> remixedFromVideoId
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
[VideoSeconds](</api/reference/java/resources/videos#(resource) videos > (model) video_seconds > (schema)>) seconds
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
One of the following:
\_4("4")
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
\_8("8")
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
\_12("12")
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
[VideoSize](</api/reference/java/resources/videos#(resource) videos > (model) video_size > (schema)>) size
The resolution of the generated video.
One of the following:
\_720X1280("720x1280")
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 0>)
\_1280X720("1280x720")
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 1>)
\_1024X1792("1024x1792")
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 2>)
\_1792X1024("1792x1024")
[](<#(resource) videos > (model) video > (schema) > (property) size + (resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) size>)
Status status
Current lifecycle status of the video job.
One of the following:
QUEUED("queued")
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 0>)
IN\_PROGRESS("in\_progress")
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 1>)
COMPLETED("completed")
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 2>)
FAILED("failed")
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) status>)
[](<#(resource) videos > (model) video > (schema)>)
### Create video
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
import com.openai.models.videos.Video;
import com.openai.models.videos.VideoCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VideoCreateParams params = VideoCreateParams.builder()
.prompt("A calico cat playing a piano on stage")
.build();
Video video = client.videos().create(params);
}
}
`
```
```
`{
"id": "video\_123",
"object": "video",
"model": "sora-2",
"status": "queued",
"progress": 0,
"created\_at": 1712697600,
"size": "1024x1792",
"seconds": "8",
"quality": "standard"
}
`
```
##### Returns Examples
```
`{
"id": "video\_123",
"object": "video",
"model": "sora-2",
"status": "queued",
"progress": 0,
"created\_at": 1712697600,
"size": "1024x1792",
"seconds": "8",
"quality": "standard"
}
`
```