GPT Actions library - Confluence
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
Jul 31, 2024
# GPT Actions library - Confluence
[ ES ](https://www.linkedin.com/in/szuhany/)
[ Eric Szuhany
(OpenAI)
](https://www.linkedin.com/in/szuhany/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_confluence.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_confluence.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This particular GPT Action provides an overview of how to connect to **Confluence**, Atlassian’s collaboration and documentation platform. This Action takes a user’s question, scans the relevant Confluence spaces and pages to gather the necessary information, then formulates a response to answer the user’s question. This cookbook does not address updating content in Confluence directly from ChatGPT, but it is technically feasible to accomplish with additional Actions and scopes.
### Value + Example Business Use Cases
**Value**
Users can now leverage ChatGPT’s natural language capability to connect directly to Confluence, enabling seamless interaction with their organization’s knowledge base.
**Example Use Cases**
* **Knowledge Workers**: Easily retrieve information from Confluence pages and spaces to answer questions or gather details for reports and presentations.
* **Project Managers**: Quickly access project documentation and updates stored in Confluence without manually searching through pages.
* **Customer Support Teams**: Provide accurate and timely responses to customer inquiries by pulling relevant information from the Confluence knowledge base.
* **All Users**: Gain more visibility into company-wide documentation, policies, and procedures, enhancing collaboration and knowledge sharing.
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://developer.atlassian.com/console/myapps/](https://developer.atlassian.com/console/myapps/)
* Application API Documentation: [https://developer.atlassian.com/cloud/confluence/rest/v2/intro/#about](https://developer.atlassian.com/cloud/confluence/rest/v2/intro/#about)
### Application Prerequisites
Before you get started, make sure you go through the following steps in your application environment:
* Ensure you have permissions to create an App in the Atlassian Developer Portal
* Determine what interactions you would like your GPT to take (search, read, edit, etc.)
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`You are a "Confluence Savant", equipped with the ability to search our company's Product Wiki in Confluence to answer product-related questions.
You must ALWAYS perform the "getAccessibleResources" Action first to get the "cloudid" value you will need in subsequent Actions.
Your job is to provide accurate and detailed responses by retrieving information from the Product Wiki. Your responses should be clear, concise, and directly address the question asked. You have the capability to execute an action named "performConfluenceSearch" that allows you to search for content within our Confluence Product Wiki using specific terms or phrases related to the user's question.
- When you receive a query about product information, use the "performConfluenceSearch" action to retrieve relevant content from the Product Wiki. Formulate your search query based on the user's question, using specific keywords or phrases to find the most pertinent information.
- Once you receive the search results, review the content to ensure it matches the user's query. If necessary, refine your search query to retrieve more accurate results.
- Provide a response that synthesizes the information from the Product Wiki, clearly answering the user's question. Your response should be easy to understand and directly related to the query.
- If the query is complex or requires clarification, ask follow-up questions to the user to refine your understanding and improve the accuracy of your search.
- If the information needed to answer the question is not available in the Product Wiki, inform the user and guide them to where they might find the answer, such as contacting a specific department or person in the company.
Here is an example of how you might respond to a query:
User: "What are the latest features of our XYZ product?"
You: "The latest features of the XYZ product, as detailed in our Product Wiki, include [feature 1], [feature 2], and [feature 3]. These features were added in the recent update to enhance [specific functionalities]. For more detailed information, you can refer to the Product Wiki page [link to the specific Confluence page]."
Remember, your goal is to provide helpful, accurate, and relevant information to the user's query by effectively leveraging the Confluence Product Wiki.`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`openapi: 3.1.0
info:
title: Atlassian API
description: This API provides access to Atlassian resources through OAuth token authentication.
version: 1.0.0
servers:
- url: https://api.atlassian.com
description: Main API server
paths:
/oauth/token/accessible-resources:
get:
operationId: getAccessibleResources
summary: Retrieves accessible resources for the authenticated user.
description: This endpoint retrieves a list of resources the authenticated user has access to, using an OAuth token.
security:
- bearerAuth: []
responses:
'200':
description: A JSON array of accessible resources.
content:
application/json:
schema:
$ref: '#/components/schemas/ResourceArray'
/ex/confluence/{cloudid}/wiki/rest/api/search:
get:
operationId: performConfluenceSearch
summary: Performs a search in Confluence based on a query.
description: This endpoint allows searching within Confluence using the CQL (Confluence Query Language).
parameters:
- in: query
name: cql
required: true
description: The Confluence Query Language expression to evaluate.
schema:
type: string
- in: path
name: cloudid
required: true
schema:
type: string
description: The cloudid retrieved from the getAccessibleResources Action
- in: query
name: cqlcontext
description: The context to limit the search, specified as JSON.
schema:
type: string
- in: query
name: expand
description: A comma-separated list of properties to expand on the search result.
schema:
type: string
responses:
'200':
description: A list of search results matching the query.
content:
application/json:
schema:
$ref: '#/components/schemas/SearchResults'
components:
securitySchemes:
bearerAuth:
type: http
scheme: bearer
bearerFormat: JWT
schemas:
ResourceArray:
type: array
items:
$ref: '#/components/schemas/Resource'
Resource:
type: object
required:
- id
- name
- type
properties:
id:
type: string
description: The unique identifier for the resource.
name:
type: string
description: The name of the resource.
type:
type: string
description: The type of the resource.
SearchResults:
type: object
properties:
results:
type: array
items:
$ref: '#/components/schemas/SearchResult'
SearchResult:
type: object
properties:
id:
type: string
description: The unique identifier of the content.
title:
type: string
description: The title of the content.
type:
type: string
description: The type of the content (e.g., page, blog post).
space:
type: object
properties:
id:
type: string
description: The space ID where the content is located.
name:
type: string
description: The name of the space.`
```
## Authentication Instructions
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
### Pre-Action Steps
Before you set up authentication in ChatGPT, make sure you go through the following steps within the Atlassian Developer portal to create your Confluence app:
1. Select the Create drop-down
2. Choose OAuth 2.0 integration
3. Give a name, agree to terms, and click Create
4. Select “Distribution” on the left-hand menu and click “Edit”
5. Change radio button to “Sharing”
6. Fill out required fields and Save Changes
7. Select “Permissions” on the left-hand menu
8. Add in the scopes you would like to include (e.g., User identity API and Confluence API so that the app can know what a user has access to and fetch from Confluence)
9. Select “Authorization” on the left-hand menu
10. Click “Add” under Action in the row for OAuth 2.0
11. Enter the callback URL from your GPT (note: you may need to add a placeholder for now and revisit this once you have created the Action and OAuth in your GPT so that you have the final callback URL)
12. Select “Settings” under the left-hand menu
13. Copy your Client ID and Secret for us in OAuth setup in GPT
### In ChatGPT
In ChatGPT, click on “Authentication” and choose **“OAuth”**. Enter in the information below.
* **Client ID**: use Client ID from steps above
* **Client Secret**: use Client Secret from steps above
* **Authorization URL**: [https://auth.atlassian.com/authorize](https://auth.atlassian.com/authorize)
* **Token URL**: [https://auth.atlassian.com/oauth/token](https://auth.atlassian.com/oauth/token)
* **Scope**: read:confluence-content.all search:confluence
* **Token**: Default (POST)
### Post-Action Steps
Once you’ve set up authentication in ChatGPT, follow the steps below in the application to finalize the Action.
* Copy the callback URL from the GPT Action
* In the “Authorized redirect URIs” (see screenshot above), add your callback URL
### FAQ & Troubleshooting
* *Callback URL Error:* If you get a callback URL error in ChatGPT, pay close attention to the screenshot above. You need to add the callback URL directly into your Confluence app for the action to authenticate correctly
* *Schema calls the wrong project or dataset:* If ChatGPT calls the wrong project or dataset, consider updating your instructions to make it more explicit either (a) which project / dataset should be called or (b) to require the user provide those exact details before it runs the query
* *Looping Actions:* You may not have given the necessary scopes/permissions to your app to accomplish its intended purpose
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*