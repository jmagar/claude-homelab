GPT Actions library - Notion
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
Jul 25, 2024
# GPT Actions library - Notion
[ DH ](https://www.linkedin.com/in/dhalp/)
[ Daniel Halpern
(OpenAI)
](https://www.linkedin.com/in/dhalp/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_notion.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_notion.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Buliding a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This particular GPT Action provides an overview of how to connect to **Notion**. This Action takes a user’s question, scans the relevant Notion pages using Notions search functionality, and then returns information on the matching pages.
### Value + Example Business Use Cases
**Value**: Users can now harness ChatGPT’s natural language capabilities to directly connect to, query, and synthesize their knowledge within Notion. Administrators can explicitly share pages with the integration to manage access.
**Example Use Cases**:
* A new employee seeks quick how-to information on setting up a new system
* A support agent needs to quickly retrieve information from Notion without reading the entire document
* Users want to synthesize information and create summaries or transformations for use in other aspects of their work
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://www.notion.so/](https://www.notion.so/)
* Application API Documentation: [https://developers.notion.com/reference/intro](https://developers.notion.com/reference/intro)
* Notion Authorization Approach: [https://developers.notion.com/docs/authorization](https://developers.notion.com/docs/authorization)
* NOTE: Notion only allows OAuth with “Public Integrations.” Refer to the linked documentation to determine what is best suited for your needs
### Application Prerequisites
Before you get started, make sure you go through the following steps in your application environment:
* Set up a notion workspace with populated pages
* Sharing pages through notion works best with specific Wikis. Consider organizing your knowledge base into a wiki or set of wikis
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/.gpt_action_getting_started) to see how this step works in more detail.
```
`\*\*Context\*\*: You are a helpful chatbot focussed on retrieving information from a company's Notion. An administrator has given you access to a number of useful Notion pages. You are to act similar to a librarian and be helpful answering and finding answers for users' questions.
\*\*Instructions\*\*:
1. Use the search functionality to find the most relevant page or pages.
- Display the top 3 pages. Include a formatted list containing: Title, Last Edit Date, Author.
- The Title should be a link to that page.
1.a. If there are no relevant pages, reword the search and try again (up to 3x)
1.b. If there are no relevant pages after retries, return "I'm sorry, I cannot find the right info to help you with that question"
2. Open the most relevant article, retrieve and read all of the contents (including any relevant linked pages or databases), and provide a 3 sentence summary. Always provide a quick summary before moving to the next step.
3. Ask the user if they'd like to see more detail. If yes, provide it and offer to explore more relevant pages.
\*\*Additional Notes\*\*:
- If the user says "Let's get started", introduce yourself as a librarian for the Notion workspace, explain that the user can provide a topic or question, and that you will help to look for relevant pages.
- If there is a database on the page. Always read the database when looking at page contents.`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`openapi: 3.1.0
info:
title: Notion API
description: API for interacting with Notion's pages, databases, and users.
version: 1.0.0
servers:
- url: https://api.notion.com/v1
description: Main Notion API server
paths:
/users:
get:
operationId: listAllUsers
summary: List all users
parameters:
- name: Notion-Version
in: header
required: true
schema:
type: string
example: 2022-06-28
constant: 2022-06-28
responses:
'200':
description: Successful response
content:
application/json:
schema:
type: object
properties:
results:
type: array
items:
type: object
properties:
id:
type: string
name:
type: string
avatar\_url:
type: string
type:
type: string
/blocks/{block\_id}/children:
get:
operationId: retrieveBlockChildren
summary: Retrieve block children
parameters:
- name: block\_id
in: path
required: true
schema:
type: string
- name: Notion-Version
in: header
required: true
schema:
type: string
example: 2022-06-28
constant: 2022-06-28
responses:
'200':
description: Successful response
content:
application/json:
schema:
type: object
properties:
object:
type: string
results:
type: array
items:
type: object
properties:
id:
type: string
type:
type: string
has\_children:
type: boolean
/comments:
get:
operationId: retrieveComments
summary: Retrieve comments
parameters:
- name: Notion-Version
in: header
required: true
schema:
type: string
example: 2022-06-28
constant: 2022-06-28
responses:
'200':
description: Successful response
content:
application/json:
schema:
type: object
properties:
results:
type: array
items:
type: object
properties:
id:
type: string
text:
type: string
created\_time:
type: string
format: date-time
created\_by:
type: object
properties:
id:
type: string
name:
type: string
/pages/{page\_id}/properties/{property\_id}:
get:
operationId: retrievePagePropertyItem
summary: Retrieve a page property item
parameters:
- name: page\_id
in: path
required: true
schema:
type: string
- name: property\_id
in: path
required: true
schema:
type: string
- name: Notion-Version
in: header
required: true
schema:
type: string
example: 2022-06-28
constant: 2022-06-28
responses:
'200':
description: Successful response
content:
application/json:
schema:
type: object
properties:
id:
type: string
type:
type: string
title:
type: array
items:
type: object
properties:
type:
type: string
text:
type: object
properties:
content:
type: string
/databases/{database\_id}/query:
post:
operationId: queryDatabase
summary: Query a database
parameters:
- name: database\_id
in: path
required: true
schema:
type: string
- name: Notion-Version
in: header
required: true
schema:
type: string
example: 2022-06-28
constant: 2022-06-28
requestBody:
required: true
content:
application/json:
schema:
type: object
properties:
filter:
type: object
sorts:
type: array
items:
type: object
start\_cursor:
type: string
page\_size:
type: integer
responses:
'200':
description: Successful response
content:
application/json:
schema:
type: object
properties:
object:
type: string
results:
type: array
items:
type: object
next\_cursor:
type: string
has\_more:
type: boolean
/search:
post:
operationId: search
summary: Search
parameters:
- name: Notion-Version
in: header
required: true
schema:
type: string
example: 2022-06-28
constant: 2022-06-28
requestBody:
required: true
content:
application/json:
schema:
type: object
properties:
query:
type: string
filter:
type: object
properties:
value:
type: string
property:
type: string
sort:
type: object
properties:
direction:
type: string
timestamp:
type: string
responses:
'200':
description: Successful response
content:
application/json:
schema:
type: object
properties:
object:
type: string
results:
type: array
items:
type: object
properties:
id:
type: string
title:
type: array
items:
type: object
properties:
type:
type: string
text:
type: object
properties:
content:
type: string`
```
## Authentication Instructions
Below are instructions on setting up authentication with this 3rd party application.
### Pre-Action Steps
Before you set up authentication in ChatGPT, please take the following steps in the Notion.
1. Go to the Notion Settings Page for your workspace
2. Navigate to My Connections \> Develop or Manage Integrations
3. Create new Integration marked as Internal
4. Locate your integration and find the API Key labeled: Internal Integration Secret. This is the bearer token for this integration.
**NOTE!** You need to share specific pages, databases, or wikis with the integration in order to access them in ChatGPT. Do this by selecting the … button on the upper right of a page and select the appropriate connection.
**NOTE!** Notion allows integrations to leverage OAuth if they are marked as “Public.” Review [Notion’s Auth Documentation](https://developers.notion.com/docs/authorization) to determine what integration path is best for your needs.
### In ChatGPT
In ChatGPT, click on “Authentication” and choose **“API Key”**. Enter in the information below.
* **API Key**: Use Internal Integration Secret from steps above
* **Auth Type**: Bearer
### FAQ & Troubleshooting
* *Search returns nothing* If you don’t see any pages returned when running a search, double check that you’ve shared relevant pages with the application from Notion
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*