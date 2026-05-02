API Reference - Memos
[Memos](/)
Search
⌘K
API Reference
Latest
Current main branch schema
[API Reference](/docs/api/latest)
AI Service
Attachment Service
Auth Service
Identity Provider Service
Instance Service
Memo Service
Shortcut Service
User Service
[](https://github.com/usememos/memos)
# API Reference
Memos API Reference (Latest)
## [Overview](#overview)
This reference tracks the latest API schema from the `main` branch.
## [Base URL](#base-url)
The API is served at the `/api/v1` path of your Memos instance.
```
`https://your-memos-instance.com/api/v1`
```
For example, if your instance is hosted at `https://memos.example.com`, the API base URL would be:
```
`https://memos.example.com/api/v1`
```
## [Authentication](#authentication)
The Memos API uses Bearer Token authentication. You can obtain an access token by creating one in your account settings.
Include the token in the `Authorization` header of your requests:
```
`Authorization: Bearer \<YOUR\_ACCESS\_TOKEN\>`
```
List operations support pagination using `pageSize` and `pageToken` parameters.
* `pageSize`: The maximum number of resources to return.
* `pageToken`: A token received from a previous list response to retrieve the next page.
## [Filtering](#filtering)
Some list operations support filtering via the `filter` parameter. The filter syntax follows the [Google AIP-160](https://google.aip.dev/160) standard.
Example: `row\_status == "NORMAL"`
## [Field Masks](#field-masks)
Update operations often require an `updateMask` parameter to specify which fields to update. This prevents accidental overwrites of other fields.
Example: `updateMask=content,visibility`
## [Response Format](#response-format)
All responses are returned in JSON format. Errors are returned with a standard status object:
```
`{
"code": 3,
"message": "Invalid argument",
"details": []
}`
```
## [Example](#example)
Here is an example of how to list memos:
```
`curl -X GET "https://your-memos-instance.com/api/v1/memos?pageSize=10" \\
-H "Authorization: Bearer \<YOUR\_ACCESS\_TOKEN\>"`
```
## [Services](#services)
[
### AI Service
](/docs/api/latest/aiservice/Transcribe)[
### Attachment Service
](/docs/api/latest/attachmentservice/CreateAttachment)[
### Auth Service
](/docs/api/latest/authservice/SignIn)[
### Identity Provider Service
](/docs/api/latest/identityproviderservice/CreateIdentityProvider)[
### Instance Service
](/docs/api/latest/instanceservice/GetInstanceProfile)[
### Memo Service
](/docs/api/latest/memoservice/CreateMemo)[
### Shortcut Service
](/docs/api/latest/shortcutservice/CreateShortcut)[
### User Service
](/docs/api/latest/userservice/CreateUser)
[
Transcribe
Transcribe transcribes an audio file using an instance AI provider.
](/docs/api/latest/aiservice/Transcribe)
### On this page
[Overview](#overview)[Base URL](#base-url)[Authentication](#authentication)[Pagination](#pagination)[Filtering](#filtering)[Field Masks](#field-masks)[Response Format](#response-format)[Example](#example)[Services](#services)