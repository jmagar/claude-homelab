Webhook | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
The webhook notification agent enables you to send a custom JSON payload to any endpoint for specific notification events.
## Configuration[​](#configuration)
### Webhook URL[​](#webhook-url)
The URL you would like to post notifications to. Your JSON will be sent as the body of the request.
### Authorization Header (optional)[​](#authorization-header-optional)
info
This is typically not needed. Please refer to your webhook provider's documentation for details.
This value will be sent as an `Authorization` HTTP header.
### Custom Headers (optional)[​](#custom-headers-optional)
You can add additional custom HTTP headers to be sent with each webhook request. This is useful for API keys, custom authentication schemes, or any other headers your webhook endpoint requires.
* Click "Add Header" to add a new header
* Enter the header name and value
warning
You cannot configure both the **Authorization Header** field and a custom `Authorization` header in Custom Headers at the same time. You must choose one method.
### JSON Payload[​](#json-payload)
Customize the JSON payload to suit your needs. Seerr provides several [template variables](#template-variables) for use in the payload, which will be replaced with the relevant data when the notifications are triggered.
## Template Variables[​](#template-variables)
### General[​](#general)
|Variable|Value|
|`{{notification\_type}}`|The type of notification (e.g. `MEDIA\_PENDING` or `ISSUE\_COMMENT`)|
|`{{event}}`|A friendly description of the notification event|
|`{{subject}}`|The notification subject (typically the media title)|
|`{{message}}`|The notification message body (the media overview/synopsis for request notifications; the issue description for issue notificatons)|
|`{{image}}`|The notification image (typically the media poster)|
### Notify User[​](#notify-user)
These variables are for the target recipient of the notification.
|Variable|Value|
|`{{notifyuser\_username}}`|The target notification recipient's username|
|`{{notifyuser\_email}}`|The target notification recipient's email address|
|`{{notifyuser\_avatar}}`|The target notification recipient's avatar URL|
|`{{notifyuser\_settings\_discordId}}`|The target notification recipient's Discord ID (if set)|
|`{{notifyuser\_settings\_telegramChatId}}`|The target notification recipient's Telegram Chat ID (if set)|
info
The `notifyuser` variables are not defined for the following request notification types, as they are intended for application administrators rather than end users:
* Request Pending Approval
* Request Automatically Approved
* Request Processing Failed
On the other hand, the `notifyuser` variables *will* be replaced with the requesting user's information for the below notification types:
* Request Approved
* Request Declined
* Request Available
If you would like to use the requesting user's information in your webhook, please instead include the relevant variables from the [Request](#request) section below.
### Special[​](#special)
The following variables must be used as a key in the JSON payload (e.g., `"{{extra}}": []`).
|Variable|Value|
|`{{media}}`|The relevant media object|
|`{{request}}`|The relevant request object|
|`{{issue}}`|The relevant issue object|
|`{{comment}}`|The relevant issue comment object|
|`{{extra}}`|The "extra" array of additional data for certain notifications (e.g., season/episode numbers for series-related notifications)|
#### Media[​](#media)
The `{{media}}` will be `null` if there is no relevant media object for the notification.
These following special variables are only included in media-related notifications, such as requests.
|Variable|Value|
|`{{media\_type}}`|The media type (`movie` or `tv`)|
|`{{media\_imdbid}}`|The media's IMDb ID|
|`{{media\_tmdbid}}`|The media's TMDB ID|
|`{{media\_tvdbid}}`|The media's TheTVDB ID|
|`{{media\_status}}`|The media's availability status (`UNKNOWN`, `PENDING`, `PROCESSING`, `PARTIALLY\_AVAILABLE`, or `AVAILABLE`)|
|`{{media\_status4k}}`|The media's 4K availability status (`UNKNOWN`, `PENDING`, `PROCESSING`, `PARTIALLY\_AVAILABLE`, or `AVAILABLE`)|
|`{{media\_jellyfinMediaId}}`|The media's Jellyfin Media ID|
#### Request[​](#request)
The `{{request}}` will be `null` if there is no relevant media object for the notification.
The following special variables are only included in request-related notifications.
|Variable|Value|
|`{{request\_id}}`|The request ID|
|`{{requestedBy\_username}}`|The requesting user's username|
|`{{requestedBy\_email}}`|The requesting user's email address|
|`{{requestedBy\_avatar}}`|The requesting user's avatar URL|
|`{{requestedBy\_jellyfinUserId}}`|The requesting user's Jellyfin User ID|
|`{{requestedBy\_settings\_discordId}}`|The requesting user's Discord ID (if set)|
|`{{requestedBy\_settings\_telegramChatId}}`|The requesting user's Telegram Chat ID (if set)|
#### Issue[​](#issue)
The `{{issue}}` will be `null` if there is no relevant media object for the notification.
The following special variables are only included in issue-related notifications.
|Variable|Value|
|`{{issue\_id}}`|The issue ID|
|`{{reportedBy\_username}}`|The requesting user's username|
|`{{reportedBy\_email}}`|The requesting user's email address|
|`{{reportedBy\_avatar}}`|The requesting user's avatar URL|
|`{{reportedBy\_settings\_discordId}}`|The requesting user's Discord ID (if set)|
|`{{reportedBy\_settings\_telegramChatId}}`|The requesting user's Telegram Chat ID (if set)|
#### Comment[​](#comment)
The `{{comment}}` will be `null` if there is no relevant media object for the notification.
The following special variables are only included in issue comment-related notifications.
|Variable|Value|
|`{{comment\_message}}`|The comment message|
|`{{commentedBy\_username}}`|The commenting user's username|
|`{{commentedBy\_email}}`|The commenting user's email address|
|`{{commentedBy\_avatar}}`|The commenting user's avatar URL|
|`{{commentedBy\_settings\_discordId}}`|The commenting user's Discord ID (if set)|
|`{{commentedBy\_settings\_telegramChatId}}`|The commenting user's Telegram Chat ID (if set)|
* [Configuration](#configuration)
* [Webhook URL](#webhook-url)
* [Authorization Header (optional)](#authorization-header-optional)
* [Custom Headers (optional)](#custom-headers-optional)
* [JSON Payload](#json-payload)
* [Template Variables](#template-variables)
* [General](#general)
* [Notify User](#notify-user)
* [Special](#special)