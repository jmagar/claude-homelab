Videos | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Videos
##### [Create video](/api/reference/ruby/resources/videos/methods/create)
videos.create(\*\*kwargs) -\> [Video](</api/reference/ruby/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
POST/videos
##### [Create a new video generation job by editing a source video or existing generated video.](/api/reference/ruby/resources/videos/methods/edit)
videos.edit(\*\*kwargs) -\> [Video](</api/reference/ruby/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
POST/videos/edits
##### [Create an extension of a completed video.](/api/reference/ruby/resources/videos/methods/extend)
videos.extend\_(\*\*kwargs) -\> [Video](</api/reference/ruby/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
POST/videos/extensions
##### [Create a character from an uploaded video.](/api/reference/ruby/resources/videos/methods/create_character)
videos.create\_character(\*\*kwargs) -\> [VideoCreateCharacterResponse](</api/reference/ruby/resources/videos#(resource) videos > (model) video_create_character_response > (schema)>) { id, created\_at, name }
POST/videos/characters
##### [Fetch a character.](/api/reference/ruby/resources/videos/methods/get_character)
videos.get\_character(character\_id) -\> [VideoGetCharacterResponse](</api/reference/ruby/resources/videos#(resource) videos > (model) video_get_character_response > (schema)>) { id, created\_at, name }
GET/videos/characters/{character\_id}
##### [List videos](/api/reference/ruby/resources/videos/methods/list)
videos.list(\*\*kwargs) -\> ConversationCursorPage\<[Video](</api/reference/ruby/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more } \>
GET/videos
##### [Retrieve video](/api/reference/ruby/resources/videos/methods/retrieve)
videos.retrieve(video\_id) -\> [Video](</api/reference/ruby/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
GET/videos/{video\_id}
##### [Delete video](/api/reference/ruby/resources/videos/methods/delete)
videos.delete(video\_id) -\> [VideoDeleteResponse](</api/reference/ruby/resources/videos#(resource) videos > (model) video_delete_response > (schema)>) { id, deleted, object }
DELETE/videos/{video\_id}
##### [Remix video](/api/reference/ruby/resources/videos/methods/remix)
videos.remix(video\_id, \*\*kwargs) -\> [Video](</api/reference/ruby/resources/videos#(resource) videos > (model) video > (schema)>) { id, completed\_at, created\_at, 10 more }
POST/videos/{video\_id}/remix
##### [Retrieve video content](/api/reference/ruby/resources/videos/methods/download_content)
videos.download\_content(video\_id, \*\*kwargs) -\> StringIO
GET/videos/{video\_id}/content
##### ModelsExpand Collapse
class ImageInputReferenceParam { file\_id, image\_url }
file\_id: String
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) file_id>)
image\_url: String
A fully qualified URL or base64-encoded data URL.
maxLength20971520
[](<#(resource) videos > (model) image_input_reference_param > (schema) > (property) image_url>)
[](<#(resource) videos > (model) image_input_reference_param > (schema)>)
class Video { id, completed\_at, created\_at, 10 more }
Structured information describing a generated video job.
id: String
Unique identifier for the video job.
[](<#(resource) videos > (model) video > (schema) > (property) id>)
completed\_at: Integer
Unix timestamp (seconds) for when the job completed, if finished.
[](<#(resource) videos > (model) video > (schema) > (property) completed_at>)
created\_at: Integer
Unix timestamp (seconds) for when the job was created.
[](<#(resource) videos > (model) video > (schema) > (property) created_at>)
error: [VideoCreateError](</api/reference/ruby/resources/videos#(resource) videos > (model) video_create_error > (schema)>) { code, message }
Error payload that explains why generation failed, if applicable.
[](<#(resource) videos > (model) video > (schema) > (property) error>)
expires\_at: Integer
Unix timestamp (seconds) for when the downloadable assets expire, if set.
[](<#(resource) videos > (model) video > (schema) > (property) expires_at>)
model: [VideoModel](</api/reference/ruby/resources/videos#(resource) videos > (model) video_model > (schema)>)
The video generation model that produced the job.
[](<#(resource) videos > (model) video > (schema) > (property) model>)
object: :video
The object type, which is always `video`.
[](<#(resource) videos > (model) video > (schema) > (property) object>)
progress: Integer
Approximate completion percentage for the generation task.
[](<#(resource) videos > (model) video > (schema) > (property) progress>)
prompt: String
The prompt that was used to generate the video.
[](<#(resource) videos > (model) video > (schema) > (property) prompt>)
remixed\_from\_video\_id: String
Identifier of the source video if this video is a remix.
[](<#(resource) videos > (model) video > (schema) > (property) remixed_from_video_id>)
seconds: String | [VideoSeconds](</api/reference/ruby/resources/videos#(resource) videos > (model) video_seconds > (schema)>)
Duration of the generated clip in seconds. For extensions, this is the stitched total duration.
One of the following:
String = String
[](<#(resource) videos > (model) video > (schema) > (property) seconds > (variant) 0>)
VideoSeconds = :"4" | :"8" | :"12"
One of the following:
:"4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
:"8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
:"12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
[](<#(resource) videos > (model) video > (schema) > (property) seconds>)
size: [VideoSize](</api/reference/ruby/resources/videos#(resource) videos > (model) video_size > (schema)>)
The resolution of the generated video.
[](<#(resource) videos > (model) video > (schema) > (property) size>)
status: :queued | :in\_progress | :completed | :failed
Current lifecycle status of the video job.
One of the following:
:queued
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 0>)
:in\_progress
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 1>)
:completed
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 2>)
:failed
[](<#(resource) videos > (model) video > (schema) > (property) status > (member) 3>)
[](<#(resource) videos > (model) video > (schema) > (property) status>)
[](<#(resource) videos > (model) video > (schema)>)
class VideoCreateError { code, message }
An error that occurred while generating the response.
code: String
A machine-readable error code that was returned.
[](<#(resource) videos > (model) video_create_error > (schema) > (property) code>)
message: String
A human-readable description of the error that was returned.
[](<#(resource) videos > (model) video_create_error > (schema) > (property) message>)
[](<#(resource) videos > (model) video_create_error > (schema)>)
VideoModel = String | :"sora-2" | :"sora-2-pro" | :"sora-2-2025-10-06" | 2 more
One of the following:
String = String
[](<#(resource) videos > (model) video_model > (schema) > (variant) 0>)
VideoModel = :"sora-2" | :"sora-2-pro" | :"sora-2-2025-10-06" | 2 more
One of the following:
:"sora-2"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 0>)
:"sora-2-pro"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 1>)
:"sora-2-2025-10-06"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 2>)
:"sora-2-pro-2025-10-06"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 3>)
:"sora-2-2025-12-08"
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1 > (member) 4>)
[](<#(resource) videos > (model) video_model > (schema) > (variant) 1>)
[](<#(resource) videos > (model) video_model > (schema)>)
VideoSeconds = :"4" | :"8" | :"12"
One of the following:
:"4"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 0>)
:"8"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 1>)
:"12"
[](<#(resource) videos > (model) video_seconds > (schema) > (member) 2>)
[](<#(resource) videos > (model) video_seconds > (schema)>)
VideoSize = :"720x1280" | :"1280x720" | :"1024x1792" | :"1792x1024"
One of the following:
:"720x1280"
[](<#(resource) videos > (model) video_size > (schema) > (member) 0>)
:"1280x720"
[](<#(resource) videos > (model) video_size > (schema) > (member) 1>)
:"1024x1792"
[](<#(resource) videos > (model) video_size > (schema) > (member) 2>)
:"1792x1024"
[](<#(resource) videos > (model) video_size > (schema) > (member) 3>)
[](<#(resource) videos > (model) video_size > (schema)>)
class VideoCreateCharacterResponse { id, created\_at, name }
id: String
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) created_at>)
name: String
Display name for the character.
[](<#(resource) videos > (model) video_create_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_create_character_response > (schema)>)
class VideoGetCharacterResponse { id, created\_at, name }
id: String
Identifier for the character creation cameo.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the character was created.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) created_at>)
name: String
Display name for the character.
[](<#(resource) videos > (model) video_get_character_response > (schema) > (property) name>)
[](<#(resource) videos > (model) video_get_character_response > (schema)>)
class VideoDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a video.
id: String
Identifier of the deleted video.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) id>)
deleted: bool
Indicates that the video resource was deleted.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) deleted>)
object: :"video.deleted"
The object type that signals the deletion response.
[](<#(resource) videos > (model) video_delete_response > (schema) > (property) object>)
[](<#(resource) videos > (model) video_delete_response > (schema)>)