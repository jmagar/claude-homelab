GPT Actions library - Box
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
Aug 2, 2024
# GPT Actions library - Box
[ KS ](https://www.linkedin.com/in/keelanschule/)
[ Keelan Schule
(OpenAI)
](https://www.linkedin.com/in/keelanschule/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_box.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_box.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Buliding a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This guide provides details on how to connect chatGPT with a Box.com account, the GPT requires two actions to pull data from Box. The GPT will interact with the Box API directly but requires middleware (ie Azure function) to properly format the response from Box to download and read the file contents. The azure function action is transparent to the end user, meaning the user will not need to explicity call the action.
* Action 1 : Box API Action - Leverages the Box API to query data from Box
* Action 2 : Azure function - Formats response from Box enabling chatGPT to download the file directly from Box
### Value + Example Business Use Cases
Existing Box customers can leverage these guidelines to query details about files, contents of files and any metadata related. This enables a OpenAI powered analysis of any content stored in Box such as visualizing data sets and creating summaries across multiple folders and files. This GPT can access folders, files and business process data such as metadata in Box. Additionally Box admins can use this GPT action for visibility into audit trails and health checks.
## Application Information
### Application Key Links
Check out these links from Box and Azure before you get started:
**Box Action**
* Application Website: [https://app.box.com](https://app.box.com)
* Application API Documentation: [https://developer.box.com/reference/](https://developer.box.com/reference/)
**Azure Function**
* Application Website: [https://learn.microsoft.com/en-us/azure/azure-functions/](https://learn.microsoft.com/en-us/azure/azure-functions/)
* Application API Documentation: [https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference/](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference/)
### Application Prerequisites
Before you get started, make sure you go through the following steps in your Box environment:
* This requires a Box developer account to get started : [https://developer.box.com/](https://developer.box.com/)
* Follow the Box Developer site to create a custom app with OAuth 2.0 authentication type : [https://developer.box.com/guides/getting-started/first-application/](https://developer.box.com/guides/getting-started/first-application/)
* Navigate to **Configuration** tab for the following values
* OAuth 2.0 Credentials (**Client ID** / **Client Secret**) You will need both of these values for the chatGPT configuration
* OAuth 2.0 **Redirect URIs** : You will fill this value in from chatGPT action configuration below
* Application scopes (**Read all files and folders in Box**, **Manage Enterprise properties**)
You will want to keep this window open, the Redirct URIs needs to be filled in from the gpt configuration.
### Middleware information : required for Action 2
Make sure you go through the following steps in your Azure environment:
* Azure Portal with access to create Azure Function Apps and Azure Entra App Registrations
* There is a detailed section in this guide related to deploying and designing the function required to wrap the response from Box in order to view the contents of the file. Without the function the GPT will only be able to query data about the file and not the contents. Be sure to read this section after creating the first action.
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`\*\*context\*\*
This GPT will connect to your Box.com account to search files and folders, providing accurate and helpful responses based on the user's queries. It will assist with finding, organizing, and retrieving information stored in Box.com. Ensure secure and private handling of any accessed data. Avoid performing any actions that could modify or delete files unless explicitly instructed. Prioritize clarity and efficiency in responses. Use simple language for ease of understanding. Ask for clarification if a request is ambiguous or if additional details are needed to perform a search. Maintain a professional and friendly tone, ensuring users feel comfortable and supported.
Please use this website for instructions using the box API : https://developer.box.com/reference/ each endpoint can be found from this reference documentation
Users can search with the Box search endpoint or Box metadata search endpoint
\*\*instructions\*\*
When retrieving file information from Box provide as much details as possible and format into a table when more than one file is returned, include the modified date, created date and any other headers you might find valuable
Provide insights to files and suggest patterns for users, gives example queries and suggestions when appropriate
When a user wants to compare files retrieve the file for the user with out asking`
```
### Action 1 : Box API Action
Once you’ve created a Custom GPT, you will need to create 2 actions. Copy the text below in the 1st Actions panel, this will be for the Box action. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`{
"openapi": "3.1.0",
"info": {
"title": "Box.com API",
"description": "API for Box.com services",
"version": "v1.0.0"
},
"servers": [
{
"url": "https://api.box.com/2.0"
}
],
"paths": {
"/folders/{folder\_id}": {
"get": {
"summary": "Get Folder Items",
"operationId": "getFolderItems",
"parameters": [
{
"name": "folder\_id",
"in": "path",
"required": true,
"schema": {
"type": "string"
},
"description": "The ID of the folder"
}
],
"responses": {
"200": {
"description": "A list of items in the folder",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/FolderItems"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:folders"
]
}
]
}
},
"/files/{file\_id}": {
"get": {
"summary": "Get File Information",
"operationId": "getFileInfo",
"parameters": [
{
"name": "file\_id",
"in": "path",
"required": true,
"schema": {
"type": "string"
},
"description": "The ID of the file"
}
],
"responses": {
"200": {
"description": "File information",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/FileInfo"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:files"
]
}
]
}
},
"/folders": {
"get": {
"summary": "List All Folders",
"operationId": "listAllFolders",
"responses": {
"200": {
"description": "A list of all folders",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/FoldersList"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:folders"
]
}
]
}
},
"/events": {
"get": {
"summary": "Get User Events",
"operationId": "getUserEvents",
"parameters": [
{
"name": "stream\_type",
"in": "query",
"required": true,
"schema": {
"type": "string"
},
"description": "The type of stream"
}
],
"responses": {
"200": {
"description": "User events",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/UserEvents"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:events"
]
}
]
}
},
"/admin\_events": {
"get": {
"summary": "Get Admin Events",
"operationId": "getAdminEvents",
"responses": {
"200": {
"description": "Admin events",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/AdminEvents"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:events"
]
}
]
}
},
"/search": {
"get": {
"summary": "Search",
"operationId": "search",
"parameters": [
{
"name": "query",
"in": "query",
"required": true,
"schema": {
"type": "string"
},
"description": "Search query"
}
],
"responses": {
"200": {
"description": "Search results",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/SearchResults"
}
}
}
}
},
"security": [
{
"OAuth2": [
"search:items"
]
}
]
}
},
"/metadata\_templates": {
"get": {
"summary": "Get Metadata Templates",
"operationId": "getMetadataTemplates",
"responses": {
"200": {
"description": "Metadata templates",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/MetadataTemplates"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:metadata\_templates"
]
}
]
}
},
"/metadata\_templates/enterprise": {
"get": {
"summary": "Get Enterprise Metadata Templates",
"operationId": "getEnterpriseMetadataTemplates",
"responses": {
"200": {
"description": "Enterprise metadata templates",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/MetadataTemplates"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:metadata\_templates"
]
}
]
}
},
"/files/{file\_id}/metadata": {
"get": {
"summary": "Get All Metadata for a File",
"operationId": "getAllMetadataForFile",
"parameters": [
{
"name": "file\_id",
"in": "path",
"required": true,
"schema": {
"type": "string"
},
"description": "The ID of the file"
}
],
"responses": {
"200": {
"description": "All metadata instances for the file",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/MetadataInstances"
}
}
}
}
},
"security": [
{
"OAuth2": [
"read:metadata"
]
}
]
}
}
},
"components": {
"schemas": {
"FolderItems": {
"type": "object",
"properties": {
"total\_count": {
"type": "integer",
"description": "The total number of items in the folder"
},
"entries": {
"type": "array",
"items": {
"type": "object",
"properties": {
"type": {
"type": "string",
"description": "The type of the item (e.g., file, folder)"
},
"id": {
"type": "string",
"description": "The ID of the item"
},
"name": {
"type": "string",
"description": "The name of the item"
}
}
}
}
}
},
"FileInfo": {
"type": "object",
"properties": {
"id": {
"type": "string",
"description": "The ID of the file"
},
"name": {
"type": "string",
"description": "The name of the file"
},
"size": {
"type": "integer",
"description": "The size of the file in bytes"
},
"created\_at": {
"type": "string",
"format": "date-time",
"description": "The creation time of the file"
},
"modified\_at": {
"type": "string",
"format": "date-time",
"description": "The last modification time of the file"
}
}
},
"FoldersList": {
"type": "array",
"items": {
"type": "object",
"properties": {
"id": {
"type": "string",
"description": "The ID of the folder"
},
"name": {
"type": "string",
"description": "The name of the folder"
}
}
}
},
"UserEvents": {
"type": "object",
"properties": {
"entries": {
"type": "array",
"items": {
"type": "object",
"properties": {
"event\_id": {
"type": "string",
"description": "The ID of the event"
},
"event\_type": {
"type": "string",
"description": "The type of the event"
},
"created\_at": {
"type": "string",
"format": "date-time",
"description": "The time the event occurred"
}
}
}
}
}
},
"AdminEvents": {
"type": "object",
"properties": {
"entries": {
"type": "array",
"items": {
"type": "object",
"properties": {
"event\_id": {
"type": "string",
"description": "The ID of the event"
},
"event\_type": {
"type": "string",
"description": "The type of the event"
},
"created\_at": {
"type": "string",
"format": "date-time",
"description": "The time the event occurred"
}
}
}
}
}
},
"SearchResults": {
"type": "object",
"properties": {
"total\_count": {
"type": "integer",
"description": "The total number of search results"
},
"entries": {
"type": "array",
"items": {
"type": "object",
"properties": {
"type": {
"type": "string",
"description": "The type of the item (e.g., file, folder)"
},
"id": {
"type": "string",
"description": "The ID of the item"
},
"name": {
"type": "string",
"description": "The name of the item"
}
}
}
}
}
},
"MetadataTemplates": {
"type": "array",
"items": {
"type": "object",
"properties": {
"templateKey": {
"type": "string",
"description": "The key of the metadata template"
},
"displayName": {
"type": "string",
"description": "The display name of the metadata template"
},
"scope": {
"type": "string",
"description": "The scope of the metadata template"
}
}
}
},
"MetadataInstances": {
"type": "array",
"items": {
"type": "object",
"properties": {
"templateKey": {
"type": "string",
"description": "The key of the metadata template"
},
"type": {
"type": "string",
"description": "The type of the metadata instance"
},
"attributes": {
"type": "object",
"additionalProperties": {
"type": "string"
},
"description": "Attributes of the metadata instance"
}
}
}
}
},
"securitySchemes": {
"OAuth2": {
"type": "oauth2",
"flows": {
"authorizationCode": {
"authorizationUrl": "https://account.box.com/api/oauth2/authorize",
"tokenUrl": "https://api.box.com/oauth2/token",
"scopes": {
"read:folders": "Read folders",
"read:files": "Read files",
"search:items": "Search items",
"read:metadata": "Read metadata",
"read:metadata\_templates": "Read metadata templates",
"read:events": "Read events"
}
}
}
}
}
}
}`
```
**Note : this schema above does not contain all possible API endpoints, be sure to edit the schema to produce the appropriate actions from [Box Developer documentation](https://developer.box.com)**
## Authentication Instructions
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
### In ChatGPT
In ChatGPT, click on “Authentication” and choose OAuth
**OAuth Connection**
* Client ID - value from Box custom app you created earlier
* Client Secret - value from Box custom app you created earlier
* Authorization URL - : [https://account.box.com/api/oauth2/authorize?response\_type=code&client\_id=[client](https://account.box.com/api/oauth2/authorize?response_type=code&#x26;client_id=[client) ID from above]&redirect\_uri=[use a placeholder like chat.openai.com/aip//oauth/callback for now, you’ll update this later when you create the Action in ChatGPT]
* Token URL : https:api.box.com/oauth2/token
You need to save the configuration and navigate back to the gpt Configuration tab to copy the Callback URL, edit the configuration for the Box action Authorization URL and format the URL as https://account.box.com/api/oauth2/authorize?response\_type=code&client\_id=[client\_ID]&redirect\_uri=[callBack URL]
### Post-Action Steps
Update the Box.com custom application
* Copy the CallBack URL from the gpt and add a OAuth 2.0 Redirect URIs in Box.com
![gpt\_actions\_box\_boxconfig1.png.png](/cookbook/assets/images/gpt\_actions\_box\_boxconfig1.png)
### Action 2 : Azure Function
Now that we have the GPT created and authenticating against Box.com, we can create the azure function to handle the response formatting enabling the GPT to download the files from Box.
Follow this [Azure Cookbook Guide](https://cookbook.openai.com/examples/azure/functions) for further details deploying an Azure function. Below you will find sample code to add to the function.
This code is meant to be directional - while it should work out of the box, it is designed to be customized to your need.
**Data flow**
Now that you have the azure function created, add the sample code below:
function\_app.py
```
`import azure.functions as func
from boxsdk import Client, JWTAuth
import requests
import base64
import json
import jwt
import logging
app = func.FunctionApp(http\_auth\_level=func.AuthLevel.FUNCTION)
logger = logging.getLogger(\_\_name\_\_)
logger.setLevel(logging.INFO)
@app.route(route="box\_retrieval")
def box\_retrieval(req: func.HttpRequest) -\> func.HttpResponse:
logger.info('Starting box\_retrieval function')
file\_ids = req.params.get('file\_ids')
auth\_header = req.headers.get('Authorization')
if not file\_ids or not auth\_header:
logger.error('Missing file\_ids or Authorization header')
return func.HttpResponse(
"Missing file\_id or Authorization header.",
status\_code=400
)
file\_ids = file\_ids.split(",") # Assuming file\_ids are passed as a comma-separated string
if len(file\_ids) == 0 or len(file\_ids) \> 10:
logger.error('file\_ids list is empty or contains more than 10 IDs')
return func.HttpResponse(
"file\_ids list is empty or contains more than 10 IDs.",
status\_code=400
)
try:
# Decode JWT to extract the email
token = auth\_header.split(" ")[1]
decoded\_token = jwt.decode(token, options={"verify\_signature": False})
upn = decoded\_token['upn']
user\_email = get\_user\_mapping(upn)
logger.info(f'User email extracted: {user\_email}')
config = JWTAuth.from\_settings\_file('jwt\_config.json')
sdk = Client(config)
logger.info('Authenticated with Box API')
# Use the user email to get the user ID
users = sdk.users(filter\_term=user\_email)
user = next(users)
user\_id = user.id
logger.info(f'User ID obtained: {user\_id}')
openai\_file\_responses = []
for file\_id in file\_ids:
# Perform as\_user call to get the file representation
my\_file = sdk.as\_user(user).file(file\_id).get()
file\_url = my\_file.get\_download\_url()
openai\_file\_responses.append(file\_url)
response\_body = json.dumps({'openaiFileResponse': openai\_file\_responses})
return func.HttpResponse(
response\_body,
status\_code=200,
mimetype="application/json"
)
except Exception as e:
return func.HttpResponse(
f"An error occurred: {str(e)}",
status\_code=500
)
def get\_user\_mapping(upn):
# In our case, the user's authentication email into Azure AD is the same as their email in Box
# If that is not the case, map the email in Box to the email in Azure AD
return upn`
```
jwt\_config.json.sample
```
`{
"boxAppSettings": {
"clientID": "12345",
"clientSecret": "abcde",
"appAuth": {
"publicKeyID": "123",
"privateKey": "-----BEGIN ENCRYPTED PRIVATE KEY-----\\nvwxyz==\\n-----END ENCRYPTED PRIVATE KEY-----\\n",
"passphrase": "lmnop"
}
},
"enterpriseID": "09876"
}`
```
requirements.txt
```
`boxsdk[jwt]
azure-functions
requests
pyjwt`
```
Make sure to follow the rest of the Azure guide for post authentication steps and chatGPT configuration : [Azure Cookbook Guide](https://cookbook.openai.com/examples/azure/functions)
### FAQ & Troubleshooting
* *Schema calls the wrong project or dataset:* If ChatGPT calls the wrong project or dataset, consider updating your instructions to make it more explicit either (a) which project / dataset should be called or (b) to require the user provide those exact details before it runs the query
* Box can return a large set of data in the event stream which can cause errors,
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*