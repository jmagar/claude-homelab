GPT Actions library - Gmail
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
Jul 24, 2024
# GPT Actions library - Gmail
[ AW ](https://www.linkedin.com/in/westmorelandanthony/)
[ Anthony Westmoreland
(OpenAI)
](https://www.linkedin.com/in/westmorelandanthony/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_gmail.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_gmail.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This GPT Action provides an overview of how to connect to Google Gmail, Google’s Private & Secure Email for Personal or Business. This Action is connected to the Google Gmail APIs that can read, send, list, and draft emails in the authorized account.
### Value + Example Business Use Cases
**Value**: The Gmail GPT will serve as a powerful tool to streamline communication processes, improve customer engagement, and optimize resource allocation.
**Example Use Cases**:
* Manage internal communications by summarizing lengthy emails and drafting responses based on previous email threads.
* Support agents can provide customers with instant responses adhering to a company’s communication guidelines, tone, and style.
* Reference other GPTs , such as a data analsys GPT, and then ask for a draft/send of the consolidated analysis through email communication.
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://mail.google.com/mail/u/0/#inbox](https://mail.google.com/mail/u/0/#inbox)
* Application API Documentation: [https://developers.google.com/gmail/api/guides](https://developers.google.com/gmail/api/guides)
### Application Prerequisites
Before you get started, make sure you’ve a Google Cloud account and that the Gmail API is enabled:
* Set up a Google Cloud project
* Enable Gmail API from Google API Library
* If application’s “Publishing Status” is “Testing”, ensure users are added to your application
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`\*\*Context\*\*
Act as an email assistant designed to enhance user interaction with emails in various ways. This GPT can assist with productivity by summarizing emails/threads, identifying next steps/follow-ups, drafting or sending pre-written responses, and programmatically interacting with third-party tools (e.g., Notion to-dos, Slack channel summaries, data extraction for responses). This GPT has full scope access to the GMAIL OAuth 2.0 API, capable of reading, composing, sending, and permanently deleting emails from Gmail.
\*\*Instructions\*\*
- Always conclude an email by signing off with logged in user's name, unless otherwise stated.
- Verify that the email data is correctly encoded in the required format (e.g., base64 for the message body).
- Email Encoding Process: 1\\ Construct the email message in RFC 2822 format. 2\\ Base64 encode the email message. 3\\Send the encoded message using the API.
- If not specified, sign all emails with the user name.
- API Usage: After answering the user's question, do not call the Google API again until another question is asked.
- All emails created, draft or sent, should be in plain text.
- Ensure that the email format is clean and is formatted as if someone sent the email from their own inbox. Once a draft is created or email sent, display a message to the user confirming that the draft is ready or the email is sent.
- Check that the "to" email address is valid and in the correct format. It should be in the format "recipient@example.com".
- Only provide summaries of existing emails; do not fabricate email content.
- Professionalism: Behave professionally, providing clear and concise responses.
- Clarification: Ask for clarification when needed to ensure accuracy and completeness in fulfilling user requests.
- Privacy and Security: Respect user privacy and handle all data securely.`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`openapi: 3.1.0
info:
title: Gmail Email API
version: 1.0.0
description: API to read, write, and send emails in a Gmail account.
servers:
- url: https://gmail.googleapis.com
paths:
/gmail/v1/users/{userId}/messages:
get:
summary: List All Emails
description: Lists all the emails in the user's mailbox.
operationId: listAllEmails
parameters:
- name: userId
in: path
required: true
schema:
type: string
description: The user's email address. Use "me" to indicate the authenticated user.
- name: q
in: query
schema:
type: string
description: Query string to filter messages (optional).
- name: pageToken
in: query
schema:
type: string
description: Token to retrieve a specific page of results in the list.
- name: maxResults
in: query
schema:
type: integer
format: int32
description: Maximum number of messages to return.
responses:
'200':
description: Successful response
content:
application/json:
schema:
$ref: '#/components/schemas/MessageList'
'400':
description: Bad Request
'401':
description: Unauthorized
'403':
description: Forbidden
'404':
description: Not Found
'500':
description: Internal Server Error
/gmail/v1/users/{userId}/messages/send:
post:
summary: Send Email
description: Sends a new email.
operationId: sendEmail
parameters:
- name: userId
in: path
required: true
schema:
type: string
description: The user's email address. Use "me" to indicate the authenticated user.
requestBody:
required: true
content:
application/json:
schema:
$ref: '#/components/schemas/Message'
responses:
'200':
description: Email sent successfully
content:
application/json:
schema:
$ref: '#/components/schemas/Message'
'400':
description: Bad Request
'401':
description: Unauthorized
'403':
description: Forbidden
'500':
description: Internal Server Error
/gmail/v1/users/{userId}/messages/{id}:
get:
summary: Read Email
description: Gets the full email content including headers and body.
operationId: readEmail
parameters:
- name: userId
in: path
required: true
schema:
type: string
description: The user's email address. Use "me" to indicate the authenticated user.
- name: id
in: path
required: true
schema:
type: string
description: The ID of the email to retrieve.
responses:
'200':
description: Successful response
content:
application/json:
schema:
$ref: '#/components/schemas/FullMessage'
'400':
description: Bad Request
'401':
description: Unauthorized
'403':
description: Forbidden
'404':
description: Not Found
'500':
description: Internal Server Error
/gmail/v1/users/{userId}/messages/{id}/modify:
post:
summary: Modify Label
description: Modify labels of an email.
operationId: modifyLabels
parameters:
- name: userId
in: path
required: true
schema:
type: string
description: The user's email address. Use "me" to indicate the authenticated user.
- name: id
in: path
required: true
schema:
type: string
description: The ID of the email to change labels.
requestBody:
required: true
content:
application/json:
schema:
$ref: '#/components/schemas/LabelModification'
responses:
'200':
description: Labels modified successfully
content:
application/json:
schema:
$ref: '#/components/schemas/Message'
'400':
description: Bad Request
'401':
description: Unauthorized
'403':
description: Forbidden
'500':
description: Internal Server Error
/gmail/v1/users/{userId}/drafts:
post:
summary: Create Draft
description: Creates a new email draft.
operationId: createDraft
parameters:
- name: userId
in: path
required: true
schema:
type: string
description: The user's email address. Use "me" to indicate the authenticated user.
requestBody:
required: true
content:
application/json:
schema:
$ref: '#/components/schemas/Draft'
responses:
'200':
description: Draft created successfully
content:
application/json:
schema:
$ref: '#/components/schemas/Draft'
'400':
description: Bad Request
'401':
description: Unauthorized
'403':
description: Forbidden
'500':
description: Internal Server Error
/gmail/v1/users/{userId}/drafts/send:
post:
summary: Send Draft
description: Sends an existing email draft.
operationId: sendDraft
parameters:
- name: userId
in: path
required: true
schema:
type: string
description: The user's email address. Use "me" to indicate the authenticated user.
requestBody:
required: true
content:
application/json:
schema:
$ref: '#/components/schemas/SendDraftRequest'
responses:
'200':
description: Draft sent successfully
content:
application/json:
schema:
$ref: '#/components/schemas/Message'
'400':
description: Bad Request
'401':
description: Unauthorized
'403':
description: Forbidden
'500':
description: Internal Server Error
components:
schemas:
MessageList:
type: object
properties:
messages:
type: array
items:
$ref: '#/components/schemas/Message'
nextPageToken:
type: string
Message:
type: object
properties:
id:
type: string
threadId:
type: string
labelIds:
type: array
items:
type: string
addLabelIds:
type: array
items:
type: string
removeLabelIds:
type: array
items:
type: string
snippet:
type: string
raw:
type: string
format: byte
description: The entire email message in an RFC 2822 formatted and base64url encoded string.
FullMessage:
type: object
properties:
id:
type: string
threadId:
type: string
labelIds:
type: array
items:
type: string
snippet:
type: string
payload:
type: object
properties:
headers:
type: array
items:
type: object
properties:
name:
type: string
value:
type: string
parts:
type: array
items:
type: object
properties:
mimeType:
type: string
body:
type: object
properties:
data:
type: string
LabelModification:
type: object
properties:
addLabelIds:
type: array
items:
type: string
removeLabelIds:
type: array
items:
type: string
Label:
type: object
properties:
addLabelIds:
type: array
items:
type: string
removeLabelIds:
type: array
items:
type: string
EmailDraft:
type: object
properties:
to:
type: array
items:
type: string
cc:
type: array
items:
type: string
bcc:
type: array
items:
type: string
subject:
type: string
body:
type: object
properties:
mimeType:
type: string
enum: [text/plain, text/html]
content:
type: string
Draft:
type: object
properties:
id:
type: string
message:
$ref: '#/components/schemas/Message'
SendDraftRequest:
type: object
properties:
draftId:
type: string
description: The ID of the draft to send.
userId:
type: string
description: The user's email address. Use "me" to indicate the authenticated user.`
```
## Authentication Instructions
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
### Pre-Action Steps
Before you set up authentication in ChatGPT, please take the following steps in the application.
* Go to the Google Cloud Console
* Navigate to API & Services \> Credentials
* Create new OAuth credentials (or use an existing one)
* Locate your OAuth Client ID & Client Secret and store both values securely (see screenshot below)
### In ChatGPT
In ChatGPT, click on “Authentication” and choose **“OAuth”**. Enter in the information below.
* **Client ID**: use Client ID from steps above
* **Client Secret**: use Client Secret from steps above
* **Authorization URL**: [https://accounts.google.com/o/oauth2/auth](https://accounts.google.com/o/oauth2/auth)
* **Token URL**: [https://oauth2.googleapis.com/token](https://oauth2.googleapis.com/token)
* **Scope**: [https://mail.google.com/](https://mail.google.com/)
* **Token**: Default (POST)
### Post-Action Steps
Once you’ve set up authentication in ChatGPT, follow the steps below in the application to finalize the Action.
* Copy the callback URL from the GPT Action
* In the “Authorized redirect URIs” (see screenshot above), add your callback URL
### FAQ & Troubleshooting
* *Callback URL Error:* If you get a callback URL error in ChatGPT, pay close attention to the screenshot above. You need to add the callback URL directly into GCP for the action to authenticate correctly
* *Schema calls the wrong project or dataset:* If ChatGPT calls the wrong project or dataset, consider updating your instructions to make it more explicit either (a) which project / dataset should be called or (b) to require the user provide those exact details before it runs the query
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*