Videos | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Videos
##### [Create video](/api/reference/go/resources/videos/methods/create)
client.Videos.New(ctx, body) (\*[Video](</api/reference/go/resources/videos#(resource) videos > (model) video > (schema)>), error)
POST/videos
##### [Create a new video generation job by editing a source video or existing generated video.](/api/reference/go/resources/videos/methods/edit)
client.Videos.Edit(ctx, body) (\*[Video](</api/reference/go/resources/videos#(resource) videos > (model) video > (schema)>), error)
POST/videos/edits
##### [Create an extension of a completed video.](/api/reference/go/resources/videos/methods/extend)
client.Videos.Extend(ctx, body) (\*[Video](</api/reference/go/resources/videos#(resource) videos > (model) video > (schema)>), error)
POST/videos/extensions
##### [Create a character from an uploaded video.](/api/reference/go/resources/videos/methods/create_character)
client.Videos.NewCharacter(ctx, body) (\*[VideoNewCharacterResponse](</api/reference/go/resources/videos#(resource) videos > (model) VideoNewCharacterResponse > (schema)>), error)
POST/videos/characters
##### [Fetch a character.](/api/reference/go/resources/videos/methods/get_character)
client.Videos.GetCharacter(ctx, characterID) (\*[VideoGetCharacterResponse](</api/reference/go/resources/videos#(resource) videos > (model) VideoGetCharacterResponse > (schema)>), error)
GET/videos/characters/{character\_id}
##### [List videos](/api/reference/go/resources/videos/methods/list)
client.Videos.List(ctx, query) (\*ConversationCursorPage[[Video](</api/reference/go/resources/videos#(resource) videos > (model) video > (schema)>)], error)
GET/videos
##### [Retrieve video](/api/reference/go/resources/videos/methods/retrieve)
client.Videos.Get(ctx, videoID) (\*[Video](</api/reference/go/resources/videos#(resource) videos > (model) video > (schema)>), error)
GET/videos/{video\_id}
##### [Delete video](/api/reference/go/resources/videos/methods/delete)
client.Videos.Delete(ctx, videoID) (\*[VideoDeleteResponse](</api/reference/go/resources/videos#(resource) videos > (model) VideoDeleteResponse > (schema)>), error)
DELETE/videos/{video\_id}
##### [Remix video](/api/reference/go/resources/videos/methods/remix)
client.Videos.Remix(ctx, videoID, body) (\*[Video](</api/reference/go/resources/videos#(resource) videos > (model) video > (schema)>), error)
POST/videos/{video\_id}/remix
##### [Retrieve video content](/api/reference/go/resources/videos/methods/download_content)
client.Videos.DownloadContent(ctx, videoID, query) (\*Response, error)
GET/videos/{video\_id}/content
##### ModelsExpand Collapse
type ImageInputReferenceParamResp struct{…}
FileID stringOptional
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) file_id>)
ImageURL stringOptional
A fully qualified URL or base64-encoded data URL.
maxLength20971520
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) image_url>)
[](<#(resource) videos > (model) image_input_reference_param > (schema)>)
type Video struct{…}
Structured information describing a generated video job.
ID string
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
CompletedAt int64
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
CreatedAt int64
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
Error [VideoCreateError](</api/reference/go/resources/videos#(resource) videos > (model) video_create_error > (schema)>)
Error payload that explains why generation failed, if applicable.
[](<#(resource) videos > (model) video > (schema) > (property) error>)
ExpiresAt int64
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
Model VideoModel
The video generation model that produced the job.
[](<#(resource) videos > (model) video > (schema) > (property) model>)
Object Video
The object type, which is always `video`.
[](<#(resource) videos > (model) video > (schema) > (property) object>)
Progress int64
Approximate completion percentage for the generation task.
[](<#(resource) videos > (model) video > (schema) > (property) progress>)
Prompt string
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
RemixedFromVideoID string
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
Seconds [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>)
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
One of the following:
string
[](<#(resource) videos > (model) video > (schema) > (property) seconds > (variant) 0>)
type VideoSeconds string
One of the following:
const VideoSeconds4 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
const VideoSeconds8 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
const VideoSeconds12 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
Size [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>)
The resolution of the generated video.
[](<#(resource) videos > (model) video > (schema) > (property) size>)
Status VideoStatus
Current lifecycle status of the video job.
One of the following:
const VideoStatusQueued VideoStatus = "queued"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 0>)
const VideoStatusInProgress VideoStatus = "in\_progress"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 1>)
const VideoStatusCompleted VideoStatus = "completed"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 2>)
const VideoStatusFailed VideoStatus = "failed"
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) status>)
[](<#(resource) videos > (model) video > (schema)>)
type VideoCreateError struct{…}
An error that occurred while generating the response.
Code string
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video_create_error > (schema) > (property) code>)
Message string
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video_create_error > (schema)>)
type VideoModel interface{…}
One of the following:
string
[](<#(resource) videos > (model) video_model > (schema) > (variant) 0>)
type VideoModel string
One of the following:
const VideoModelSora2 VideoModel = "sora-2"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 0>)
const VideoModelSora2Pro VideoModel = "sora-2-pro"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 1>)
const VideoModelSora2\_2025\_10\_06 VideoModel = "sora-2-2025-10-06"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 2>)
const VideoModelSora2Pro2025\_10\_06 VideoModel = "sora-2-pro-2025-10-06"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 3>)
const VideoModelSora2\_2025\_12\_08 VideoModel = "sora-2-2025-12-08"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 4>)
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1>)
[](<#(resource) videos > (model) video_model > (schema)>)
type VideoSeconds string
One of the following:
const VideoSeconds4 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
const VideoSeconds8 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
const VideoSeconds12 [VideoSeconds](</api/reference/go/resources/videos#(resource) videos > (model) video_seconds > (schema)>) = "12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
type VideoSize string
One of the following:
const VideoSize720x1280 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "720x1280"
[](<#(resource) videos > (model) video_size > (schema) > (member) 0>)
const VideoSize1280x720 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "1280x720"
[](<#(resource) videos > (model) video_size > (schema) > (member) 1>)
const VideoSize1024x1792 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "1024x1792"
[](<#(resource) videos > (model) video_size > (schema) > (member) 2>)
const VideoSize1792x1024 [VideoSize](</api/reference/go/resources/videos#(resource) videos > (model) video_size > (schema)>) = "1792x1024"
[](<#(resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (model) video_size > (schema)>)