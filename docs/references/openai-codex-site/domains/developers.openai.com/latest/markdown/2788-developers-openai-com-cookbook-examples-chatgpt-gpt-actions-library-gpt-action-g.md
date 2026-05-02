GPT Actions library - Google Drive
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Showcase Blog Cookbook Learn Community
* [ Home ](/cookbook)
### Topics
* [ Agents ](/cookbook/topic/agents)
* [ Evals ](/cookbook/topic/evals)
* [ Multimodal ](/cookbook/topic/multimodal)
* [ Text ](/cookbook/topic/text)
* [ Guardrails ](/cookbook/topic/guardrails)
* [ Optimization ](/cookbook/topic/optimization)
* [ ChatGPT ](/cookbook/topic/chatgpt)
* [ Codex ](/cookbook/topic/codex)
* [ gpt-oss ](/cookbook/topic/gpt-oss)
### Contribute
* [ Cookbook on GitHub ](https://github.com/openai/openai-cookbook)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Copy Page
Aug 11, 2024
# GPT Actions library - Google Drive
[ LX ](https://www.linkedin.com/in/lukexing/)
[ Luke Xing
(OpenAI)
](https://www.linkedin.com/in/lukexing/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_google_drive.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_google_drive.ipynb)
## **Introduction**
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions/introduction)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This particular GPT Action provides an overview of how to connect to **Google Drive**, Google’s File storage system. This action will allow you to list and query against file names, load the file content into your GPT, and ultimately use that data as context in ChatGPT. This set of actions is extensible by additional methods found via the [Google Drive API](https://developers.google.com/drive/api/guides/about-sdk). This is great if you want a generalist GPT that can read smaller files, such as:
* Meetings minutes
* Product design documents
* Short memos
* Frequently-asked questions
For something that wants to read longer memos such as entire books, complex CSVs with many rows, we suggest building a Google Docs or Google Sheets-specific GPT.
### Value + Example business case
Users can now leverage ChatGPT’s natural language capability to connect directly to files in Google Drive
Example Use Cases:
* A user needs to look up which files relate to a certain topic
* A user needs an answer to a critical question, buried deep in documents
## **Application Information**
### **Application Key Links**
Check out these links from the application before you get started:
* Application Website: [https://www.google.com/drive/](https://www.google.com/drive/)
* Application API Documentation: [https://developers.google.com/drive/api/guides/about-sdk](https://developers.google.com/drive/api/guides/about-sdk)
### **Application Prerequisites**
Before you get started, make sure you have a Google Cloud account and that the Drive API is enabled:
* Set up a Google Cloud project
* Enable Google Drive API from Google API Library
* If application’s “Publishing Status” is “Testing”, ensure users are added to your application
## **ChatGPT Steps**
### **Example Custom GPT Instructions**
Once you’ve created a Custom GPT, to get started, copy the text below in the Instructions panel. You may have to add additional context specific to your use case. In this way, it is worth testing additional instructions you add to optimize for clarity and accuracy. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`\*\*\* Context \*\*\*
You are an office helper who takes a look at files within Google Drive and reads in information. In this way, when asked about something, please take a look at all of the relevant information within the drive. Respect file names, but also take a look at each document and sheet.
\*\*\* Instructions \*\*\*
Use the 'listFiles' function to get a list of files available within docs. In this way, determine out of this list which files make the most sense for you to pull back taking into account name and title. After the output of listFiles is called into context, act like a normal business analyst. Things you could be asked to be are:
- Summaries: what happens in a given file? Please give a consistent, concise answer and read through the entire file before giving an answer.
- Professionalism: Behave professionally, providing clear and concise responses.
- Synthesis, Coding, and Data Analysis: ensure coding blocks are explained.
- When handling dates: make sure that dates are searched using date fields and also if you don't find anything, use titles.
- Clarification: Ask for clarification when needed to ensure accuracy and completeness in fulfilling user requests. Try to make sure you know exactly what is being asked.
- Privacy and Security: Respect user privacy and handle all data securely.
\*\*\* Examples of Documentation \*\*\*
Here is the relevant query documentation from Google for the listFiles function:
What you want to query Example
Files with the name "hello" name = 'hello'
Files with a name containing the words "hello" and "goodbye" name contains 'hello' and name contains 'goodbye'
Files with a name that does not contain the word "hello" not name contains 'hello'
Folders that are Google apps or have the folder MIME type mimeType = 'application/vnd.google-apps.folder'
Files that are not folders mimeType != 'application/vnd.google-apps.folder'
Files that contain the text "important" and in the trash fullText contains 'important' and trashed = true
Files that contain the word "hello" fullText contains 'hello'
Files that do not have the word "hello" not fullText contains 'hello'
Files that contain the exact phrase "hello world" fullText contains '"hello world"'
Files with a query that contains the "\\" character (e.g., "\\authors") fullText contains '\\\\authors'
Files with ID within a collection, e.g. parents collection '1234567' in parents
Files in an application data folder in a collection 'appDataFolder' in parents
Files for which user "test@example.org" has write permission 'test@example.org' in writers
Files for which members of the group "group@example.org" have write permission 'group@example.org' in writers
Files modified after a given date modifiedTime \> '2012-06-04T12:00:00' // default time zone is UTC
Files shared with the authorized user with "hello" in the name sharedWithMe and name contains 'hello'
Files that have not been shared with anyone or domains (only private, or shared with specific users or groups) visibility = 'limited'
Image or video files modified after a specific date modifiedTime \> '2012-06-04T12:00:00' and (mimeType contains 'image/' or mimeType contains 'video/')`
```
### **Example OpenAPI Schema**
Once you’ve created a Custom GPT, copy the text below in the Actions panel. This offers an example of what you could include as functions of your GPT.
Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/getting-started) to see how this step works in more detail. As well, try [ActionsGPT](https://chatgpt.com/g/g-TYEliDU6A-actionsgpt), a CustomGPT OpenAI created to help with Actions. The three examples are:
* **List Files**: this is the core action that lists the files in your drive. Within this are a few parameters, such as `q`, `includeItemsFromAllDrives,supportsAllDrives`
* **Get Metadata**: in case list doesn’t work, this can offer as a backup based on certain results - for example, if users attempt to make a search via “meeting from last week”, etc
* **Export**: exports in a byte content. For more reading, please consult [https://developers.google.com/drive/api/reference/rest/v3/files/export](https://developers.google.com/drive/api/reference/rest/v3/files/export)
Generally, if ‘get’ is used, the model will attempt to download the file, which may be undesirable. Thus, Export is recommended instead.
```
`
{
"openapi": "3.1.0",
"info": {
"title": "Google Drive API",
"description": "API for interacting with Google Drive",
"version": "1.0.0"
},
"servers": [
{
"url": "https://www.googleapis.com/drive/v3"
}
],
"paths": {
"/files": {
"get": {
"operationId": "ListFiles",
"summary": "List files",
"description": "Retrieve a list of files in the user's Google Drive.",
"parameters": [
{
"name": "q",
"in": "query",
"description": "Query string for searching files.",
"required": false,
"schema": {
"type": "string"
}
},
{
"name": "includeItemsFromAllDrives",
"in": "query",
"description": "Whether both My Drive and shared drive items should be included in results.",
"required": false,
"schema": {
"type": "string"
}
},
{
"name": "supportsAllDrives",
"in": "query",
"description": "Whether the requesting application supports both My Drives and shared drives.",
"required": false,
"schema": {
"type": "string"
}
},
{
"name": "pageSize",
"in": "query",
"description": "Maximum number of files to return.",
"required": false,
"schema": {
"type": "integer",
"default": 10
}
},
{
"name": "pageToken",
"in": "query",
"description": "Token for continuing a previous list request.",
"required": false,
"schema": {
"type": "string"
}
},
{
"name": "fields",
"in": "query",
"description": "Comma-separated list of fields to include in the response.",
"required": false,
"schema": {
"type": "string"
}
}
],
"responses": {
"200": {
"description": "A list of files.",
"content": {
"application/json": {
"schema": {
"type": "object",
"properties": {
"kind": {
"type": "string",
"example": "drive#fileList"
},
"nextPageToken": {
"type": "string",
"description": "Token to retrieve the next page of results."
},
"files": {
"type": "array",
"items": {
"type": "object",
"properties": {
"id": {
"type": "string"
},
"name": {
"type": "string"
},
"mimeType": {
"type": "string"
}
}
}
}
}
}
}
}
}
}
}
},
"/files/{fileId}": {
"get": {
"operationId": "getMetadata",
"summary": "Get file metadata",
"description": "Retrieve metadata for a specific file.",
"parameters": [
{
"name": "fileId",
"in": "path",
"description": "ID of the file to retrieve.",
"required": true,
"schema": {
"type": "string"
}
},
{
"name": "fields",
"in": "query",
"description": "Comma-separated list of fields to include in the response.",
"required": false,
"schema": {
"type": "string"
}
}
],
"responses": {
"200": {
"description": "Metadata of the file.",
"content": {
"application/json": {
"schema": {
"type": "object",
"properties": {
"id": {
"type": "string"
},
"name": {
"type": "string"
},
"mimeType": {
"type": "string"
},
"description": {
"type": "string"
},
"createdTime": {
"type": "string",
"format": "date-time"
}
}
}
}
}
}
}
}
},
"/files/{fileId}/export": {
"get": {
"operationId": "export",
"summary": "Export a file",
"description": "Export a Google Doc to the requested MIME type.",
"parameters": [
{
"name": "fileId",
"in": "path",
"description": "ID of the file to export.",
"required": true,
"schema": {
"type": "string"
}
},
{
"name": "mimeType",
"in": "query",
"description": "The MIME type of the format to export to.",
"required": true,
"schema": {
"type": "string",
"enum": [
"application/pdf",
"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
"text/plain"
]
}
}
],
"responses": {
"200": {
"description": "The exported file.",
"content": {
"application/pdf": {
"schema": {
"type": "string",
"format": "binary"
}
},
"application/vnd.openxmlformats-officedocument.wordprocessingml.document": {
"schema": {
"type": "string",
"format": "binary"
}
},
"text/plain": {
"schema": {
"type": "string",
"format": "binary"
}
}
}
},
"400": {
"description": "Invalid MIME type or file ID."
},
"404": {
"description": "File not found."
}
}
}
}
}
}`
```
## **Authentication Instructions**
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
### **Pre-Action Steps**
Before you set up authentication in ChatGPT, please take the following steps in the application.
* Go to the Google Cloud Console
* Navigate to Enabled API & Services and enable Google Drive API
* Within the search bar, search Google Drive API:
* Create new OAuth credentials (or use an existing one). Note that if you haven’t set up an OAuth credentials screen, you will need to do that.
* Within this process, you will need to grant access to the correct permissions, establish the primary tester as a testing email if Testing is enabled, and set up the OAuth rate limit.
* Next, go to credentials and click “+ Create Credentials” and click “Create Credentials”. Below is an example of what this screen looks like when it’s already set up.
* Locate your OAuth Client ID & Client Secret and store both values securely (see screenshot below)
### **In ChatGPT**
In ChatGPT, click on “Authentication” and choose **“OAuth”**. Enter in the information below.
* **Client ID**: use Client ID from steps above
* **Client Secret**: use Client Secret from steps above
* **Authorization URL**: [https://accounts.google.com/o/oauth2/auth](https://accounts.google.com/o/oauth2/auth)
* **Token URL**: [https://oauth2.googleapis.com/token](https://oauth2.googleapis.com/token)
* **Scope**: [https://www.googleapis.com/auth/drive](https://www.googleapis.com/auth/drive.readonly)
* **Note**: for a list of more detailed scopes enabled, please refer to [Google’s OAuth 2.0 guide.](https://developers.google.com/identity/protocols/oauth2/scopes)
* **Token**: Default (POST)
* **Privacy Policy**: [https://policies.google.com/privacy?hl=en-US](https://policies.google.com/privacy?hl=en-US)
### **Post-Action Steps**
Once you’ve set up authentication in ChatGPT, follow the steps below in the application to finalize the Action.
* Copy the callback URL from the GPT Action
* In the “Authorized redirect URIs”, add your callback URL
### **FAQ & Troubleshooting**
* *Callback URL Error:* If you get a callback URL error in ChatGPT, pay close attention to the screenshot above. You need to add the callback URL directly into GCP for the action to authenticate correctly.
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our GitHub, and we’ll take a look.*
gd2md-html: xyzzy Mon Aug 12 2024