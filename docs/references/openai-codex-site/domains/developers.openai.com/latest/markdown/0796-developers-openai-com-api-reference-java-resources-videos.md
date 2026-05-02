Videos | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Videos
##### [Create video](/api/reference/java/resources/videos/methods/create)
[Video](</api/reference/java/resources/videos#(resource) videos > (model) video > (schema)>) videos().create(VideoCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/videos
##### [Create a new video generation job by editing a source video or existing generated video.](/api/reference/java/resources/videos/methods/edit)
[Video](</api/reference/java/resources/videos#(resource) videos > (model) video > (schema)>) videos().edit(VideoEditParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/videos/edits
##### [Create an extension of a completed video.](/api/reference/java/resources/videos/methods/extend)
[Video](</api/reference/java/resources/videos#(resource) videos > (model) video > (schema)>) videos().extend(VideoExtendParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/videos/extensions
##### [Create a character from an uploaded video.](/api/reference/java/resources/videos/methods/create_character)
[VideoCreateCharacterResponse](</api/reference/java/resources/videos#(resource) videos > (model) VideoCreateCharacterResponse > (schema)>) videos().createCharacter(VideoCreateCharacterParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/videos/characters
##### [Fetch a character.](/api/reference/java/resources/videos/methods/get_character)
[VideoGetCharacterResponse](</api/reference/java/resources/videos#(resource) videos > (model) VideoGetCharacterResponse > (schema)>) videos().getCharacter(VideoGetCharacterParamsparams = VideoGetCharacterParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/videos/characters/{character\_id}
##### [List videos](/api/reference/java/resources/videos/methods/list)
VideoListPage videos().list(VideoListParamsparams = VideoListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/videos
##### [Retrieve video](/api/reference/java/resources/videos/methods/retrieve)
[Video](</api/reference/java/resources/videos#(resource) videos > (model) video > (schema)>) videos().retrieve(VideoRetrieveParamsparams = VideoRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/videos/{video\_id}
##### [Delete video](/api/reference/java/resources/videos/methods/delete)
[VideoDeleteResponse](</api/reference/java/resources/videos#(resource) videos > (model) VideoDeleteResponse > (schema)>) videos().delete(VideoDeleteParamsparams = VideoDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/videos/{video\_id}
##### [Remix video](/api/reference/java/resources/videos/methods/remix)
[Video](</api/reference/java/resources/videos#(resource) videos > (model) video > (schema)>) videos().remix(VideoRemixParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/videos/{video\_id}/remix
##### [Retrieve video content](/api/reference/java/resources/videos/methods/download_content)
HttpResponse videos().downloadContent(VideoDownloadContentParamsparams = VideoDownloadContentParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/videos/{video\_id}/content
##### ModelsExpand Collapse
class ImageInputReferenceParam:
Optional\<String\> fileId
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) file_id>)
Optional\<String\> imageUrl
A fully qualified URL or base64-encoded data URL.
maxLength20971520
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) image_url>)
[](<#(resource) videos > (model) image_input_reference_param > (schema)>)
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
[](<#(resource) videos > (model) video > (schema) > (property) error>)
Optional\<Long\> expiresAt
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
VideoModel model
The video generation model that produced the job.
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
class VideoCreateError:
An error that occurred while generating the response.
String code
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video_create_error > (schema) > (property) code>)
String message
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video_create_error > (schema)>)
enum VideoSeconds:
\_4("4")
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
\_8("8")
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
\_12("12")
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
enum VideoSize:
\_720X1280("720x1280")
[](<#(resource) videos > (model) video_size > (schema) > (member) 0>)
\_1280X720("1280x720")
[](<#(resource) videos > (model) video_size > (schema) > (member) 1>)
\_1024X1792("1024x1792")
[](<#(resource) videos > (model) video_size > (schema) > (member) 2>)
\_1792X1024("1792x1024")
[](<#(resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (model) video_size > (schema)>)