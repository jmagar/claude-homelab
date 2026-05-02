GPT Actions library - Sharepoint (Return Docs)
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
May 24, 2024
# GPT Actions library - Sharepoint (Return Docs)
[ MA ](https://github.com/maxreid-openai)
[ maxreid-openai
(OpenAI)
](https://github.com/maxreid-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_doc.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_doc.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This solution enables a GPT action to answer a user’s question with the context of files the user can access in SharePoint or Office365, using Microsoft’s Graph API [search capabilities](https://learn.microsoft.com/en-us/graph/api/resources/search-api-overview?view=graph-rest-1.0) and the ability to [retrieve files](https://learn.microsoft.com/en-us/graph/api/driveitem-get?view=graph-rest-1.0&#x26;tabs=http). It uses Azure Functions to process the Graph API response and convert it to a human readable format or structure it in a way ChatGPT understands. This code is meant to be directional, and you should modify it to your requirements.
This solution uses the ability to[ retrieve files in Actions](https://platform.openai.com/docs/actions/sending-files) and use them as if you had uploaded them directly to a conversation. The Azure Function returns a base64 string that ChatGPT converts into a file. This solution can handle both structured and unstructured data, but does have size volume limitations (see docs [here](https://platform.openai.com/docs/actions/sending-files))
### Value + Example Business Use Cases
**Value**: Users can now leverage ChatGPT’s natural language capability to connect directly to files in Sharpeoint
**Example Use Cases**:
* A user needs to look up which files relate to a certain topic
* A user needs an answer to a critical question, buried deep in documents
## Architecture / Example
This solution uses a Node.js Azure Function to, based on the logged in user:
1. Search for a relevant file that the user has access to, based on the user’s initial question.
2. For each file that is found, convert it to a base64 string.
3. Format the data in the structure ChatGPT is expecting [here](https://platform.openai.com/docs/actions/sending-files/inline-option).
4. Return that to ChatGPT. The GPT then can use those files as if you had uploaded it to the conversation.
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://www.microsoft.com/en-us/microsoft-365/sharepoint/collaboration](https://www.microsoft.com/en-us/microsoft-365/sharepoint/collaboration)
* Application API Documentation: [https://learn.microsoft.com/en-us/previous-versions/office/developer/sharepoint-rest-reference/](https://learn.microsoft.com/en-us/previous-versions/office/developer/sharepoint-rest-reference/)
### Application Prerequisites
Before you get started, make sure you go through the following steps in your application environment:
* Access to a Sharepoint environment
* Postman (and knowledge of APIs and OAuth)
## Middleware Information
If you follow the [search concept files guide](https://learn.microsoft.com/en-us/graph/search-concept-files), the [Microsoft Graph Search API](https://learn.microsoft.com/en-us/graph/search-concept-files) returns references to files that fit the criteria, but not the file contents themselves. Therefore, middleware is required, rather than hitting the MSFT endpoints directly.
We need to restructure the response from that API so that it matches the expected structure in `openaiFileResponse` outlined [here](https://platform.openai.com/docs/actions/getting-started/inline-option).
### Additional Steps
#### Set up Azure Function
1. Set up an Azure Function using the steps in the [Azure Function cookbook](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_middleware_azure_function)
#### Add in Function Code
Now that you have an authenticated Azure Function, we can update the function to search SharePoint / O365
1. Go to your test function and paste in the code from [this file](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/sharepoint_azure_function/solution_one_file_retrieval.js). Save the function.
>
**> This code is meant to be directional
**> - while it should work out of the box, it is designed to be customized to your needs (see examples towards the end of this document).
>
1. Set up the following env variables by going to the **Configuration** tab on the left under **Settings.** Note that this may be listed directly in **Environment Variables** depending on your Azure UI.
1. `TENANT\_ID`: copied from previous section
2. `CLIENT\_ID`: copied from previous section
3. Go to the **Console** tab under the **Development Tools**
1. Install the following packages in console
1. `npm install @microsoft/microsoft-graph-client`
2. `npm install axios`
3. Once this is complete, try calling the function (POST call) from Postman again, putting the below into body (using a query and search term you think will generate responses).
```
`{
"searchTerm": "\<choose a search term\>"
}`
```
4. If you get a response, you are ready to set this up with a Custom GPT! See the ChatGPT Section of the Azure Function page for more details on setting this up
## More Detailed Walkthrough
The below walks through setup instructions and walkthrough unique to this solution. You can find the entire code [here](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/sharepoint_azure_function/solution_one_file_retrieval.js).
### Code Walkthrough
The below walks through the different parts of the function. Before you begin, ensure you have the required packages installed and environment variables set up (see the Installation Steps section).
#### Implementing the Authentication
Below we have a few helper functions that we’ll use in the function.
##### Initializing the Microsoft Graph Client
Create a function to initialize the Graph client with an access token. This will be used to search through Office 365 and SharePoint.
```
`const { Client } = require('@microsoft/microsoft-graph-client');
function initGraphClient(accessToken) {
return Client.init({
authProvider: (done) =\> {
done(null, accessToken);
}
});
}`
```
##### Obtaining an On-Behalf-Of (OBO) Token
This function uses an existing bearer token to request an OBO token from Microsoft’s identity platform. This enables passing through the credentials to ensure the search only returns files the logged-in user can access.
```
`const axios = require('axios');
const qs = require('querystring');
async function getOboToken(userAccessToken) {
 const { TENANT\_ID, CLIENT\_ID, MICROSOFT\_PROVIDER\_AUTHENTICATION\_SECRET } = process.env;
 const params = {
 client\_id: CLIENT\_ID,
 client\_secret: MICROSOFT\_PROVIDER\_AUTHENTICATION\_SECRET,
 grant\_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
 assertion: userAccessToken,
 requested\_token\_use: 'on\_behalf\_of',
 scope: 'https://graph.microsoft.com/.default'
 };
 const url = `https\\://login.microsoftonline.com/${TENANT\_ID}/oauth2/v2.0/token`;
 try {
 const response = await axios.post(url, qs.stringify(params), {
 headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
 });
 return response.data.access\\\_token;
 } catch (error) {
 console.error('Error obtaining OBO token:', error.response?.data || error.message);
 throw error;
 }
}`
```
#### Retrieving Content from O365 / SharePoint Items
This function fetches the content of drive items, converts it to a base64 string, and restructures to match the `openaiFileResponse` format.
```
`const getDriveItemContent = async (client, driveId, itemId, name) =\> {
 try
 const filePath = `/drives/${driveId}/items/${itemId}`;
 const downloadPath = filePath + `/content`
 // this is where we get the contents and convert to base64
 const fileStream = await client.api(downloadPath).getStream();
 let chunks = [];
 for await (let chunk of fileStream) {
 chunks.push(chunk);
 }
 const base64String = Buffer.concat(chunks).toString('base64');
 // this is where we get the other metadata to include in response
 const file = await client.api(filePath).get();
 const mime\_type = file.file.mimeType;
 const name = file.name;
 return {"name":name, "mime\_type":mime\_type, "content":base64String}
 } catch (error) {
 console.error('Error fetching drive content:', error);
 throw new Error(`Failed to fetch content for ${name}: ${error.message}`);
 }`
```
#### Creating the Azure Function to Handle Requests
Now that we have all these helper functions, the Azure Function will orchestrate the flow, by authenticating the user, performing the search, and iterating through the search results to extract the text and retrieve the relevant parts of the text to the GPT.
**Handling HTTP Requests:** The function starts by extracting the query and searchTerm from the HTTP request. It checks if the Authorization header is present and extracts the bearer token.
**Authentication:** Using the bearer token, it obtains an OBO token from Microsoft’s identity platform using getOboToken defined above.
**Initializing the Graph Client:** With the OBO token, it initializes the Microsoft Graph client using initGraphClient defined above.
**Document Search:** It constructs a search query and sends it to the Microsoft Graph API to find documents based on the searchTerm.
**Document Processing**: For each document returned by the search:
* It retrieves the document content using getDriveItemContent.
* It converts the document to base64 string and restructures it to match the `openaiFileResponse` structure.
**Response**: The function sends them back in the HTTP response.
```
`module.exports = async function (context, req) {
// const query = req.query.query || (req.body && req.body.query);
const searchTerm = req.query.searchTerm || (req.body && req.body.searchTerm);
if (!req.headers.authorization) {
context.res = {
status: 400,
body: 'Authorization header is missing'
};
return;
}
/// The below takes the token passed to the function, to use to get an OBO token.
const bearerToken = req.headers.authorization.split(' ')[1];
let accessToken;
try {
accessToken = await getOboToken(bearerToken);
} catch (error) {
context.res = {
status: 500,
body: `Failed to obtain OBO token: ${error.message}`
};
return;
}
// Initialize the Graph Client using the initGraphClient function defined above
let client = initGraphClient(accessToken);
// this is the search body to be used in the Microsft Graph Search API: https://learn.microsoft.com/en-us/graph/search-concept-files
const requestBody = {
requests: [
{
entityTypes: ['driveItem'],
query: {
queryString: searchTerm
},
from: 0,
// the below is set to summarize the top 10 search results from the Graph API, but can configure based on your documents.
size: 10
}
]
};
try {
// This is where we are doing the search
const list = await client.api('/search/query').post(requestBody);
const processList = async () =\> {
// This will go through and for each search response, grab the contents of the file and summarize with gpt-3.5-turbo
const results = [];
await Promise.all(list.value[0].hitsContainers.map(async (container) =\> {
for (const hit of container.hits) {
if (hit.resource["@odata.type"] === "#microsoft.graph.driveItem") {
const { name, id } = hit.resource;
// The below is where the file lives
const driveId = hit.resource.parentReference.driveId;
// we use the helper function we defined above to get the contents, convert to base64, and restructure it
const contents = await getDriveItemContent(client, driveId, id, name);
results.push(contents)
}
}));
return results;
};
let results;
if (list.value[0].hitsContainers[0].total == 0) {
// Return no results found to the API if the Microsoft Graph API returns no results
results = 'No results found';
} else {
// If the Microsoft Graph API does return results, then run processList to iterate through.
results = await processList();
// this is where we structure the response so ChatGPT knows they are files
results = {'openaiFileResponse': results}
}
context.res = {
status: 200,
body: results
};
} catch (error) {
context.res = {
status: 500,
body: `Error performing search or processing results: ${error.message}`,
};
}
};`
```
### Customizations
Below are some potential areas to customize.
* You can customize the GPT prompt to search again a certain amount of times if nothing is found.
* You can customize the code to only search through specific SharePoint sites or O365 Drives by customizing the search query. This will help focus the search and improve the retrieval. The function as setup now looks through all files the logged-in user can access.
* You can update the code to only return certain types of files. For example, only return structured data / CSVs.
* You can customize the amount of files it searches through within the call to Microsoft Graph. Note that you should only put a maximum of 10 files based on the documentation [here](https://platform.openai.com/docs/actions/getting-started).
### Considerations
Note that all the same limitations of Actions apply here, with regards to returning 100K characters or less and the [45 second timeout](https://platform.openai.com/docs/actions/production/timeouts).
* Make sure you read the documentation here around [returning files](https://platform.openai.com/docs/actions/sending-files) and [file uploads](https://help.openai.com/en/articles/8555545-file-uploads-faq), as those limitations apply here.
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`You are a Q&A helper that helps answer users questions. You have access to a documents repository through your API action. When a user asks a question, you pass in the "searchTerm" a single keyword or term you think you should use for the search.
\*\*\*\*
Scenario 1: There are answers
If your action returns results, then you take the results from the action and try to answer the users question.
\*\*\*\*
Scenario 2: No results found
If the response you get from the action is "No results found", stop there and let the user know there were no results and that you are going to try a different search term, and explain why. You must always let the user know before conducting another search.
Example:
\*\*\*\*
I found no results for "DEI". I am now going to try [insert term] because [insert explanation]
\*\*\*\*
Then, try a different searchTerm that is similar to the one you tried before, with a single word.
Try this three times. After the third time, then let the user know you did not find any relevant documents to answer the question, and to check SharePoint.
Be sure to be explicit about what you are searching for at each step.
\*\*\*\*
In either scenario, try to answer the user's question. If you cannot answer the user's question based on the knowledge you find, let the user know and ask them to go check the HR Docs in SharePoint.`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
This expects a response that matches the file retrieval structure in our doc [here](https://platform.openai.com/docs/actions/sending-files) and passes in a `searchTerm` parameter to inform the search.
>
> Make sure to switch the function app name, function name and code based on link copied in screenshot above
>
```
`openapi: 3.1.0
info:
title: SharePoint Search API
description: API for searching SharePoint documents.
version: 1.0.0
servers:
- url: https://{your\_function\_app\_name}.azurewebsites.net/api
description: SharePoint Search API server
paths:
/{your\_function\_name}?code={enter your specific endpoint id here}:
post:
operationId: searchSharePoint
summary: Searches SharePoint for documents matching a query and term.
requestBody:
required: true
content:
application/json:
schema:
type: object
properties:
searchTerm:
type: string
description: A specific term to search for within the documents.
responses:
'200':
description: A CSV file of query results encoded in base64.
content:
application/json:
schema:
type: object
properties:
openaiFileResponseData:
type: array
items:
type: object
properties:
name:
type: string
description: The name of the file.
mime\_type:
type: string
description: The MIME type of the file.
content:
type: string
format: byte
description: The base64 encoded contents of the file.
'400':
description: Bad request when the SQL query parameter is missing.
'413':
description: Payload too large if the response exceeds the size limit.
'500':
description: Server error when there are issues executing the query or encoding the results.`
```
## Authentication Instructions
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
*See above and on the [Azure Function cookbook](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_middleware_azure_function) for more detailed instructions on authentication.*
## FAQ & Troubleshooting
* Why are you using the Microsoft Graph API in your code instead of the [SharePoint API](https://learn.microsoft.com/en-us/sharepoint/dev/sp-add-ins/get-to-know-the-sharepoint-rest-service?tabs=csom)?
* The SharePoint API is legacy - per the Microsoft documentation [here](https://learn.microsoft.com/en-us/sharepoint/dev/apis/sharepoint-rest-graph), “For SharePoint Online, innovation using a REST API against SharePoint is driven via the Microsoft Graph REST API’s.” The Graph API gives us more flexibility, and the SharePoint API still runs into the same file issues listed in the [Why is this necessary instead of interacting with the Microsoft Graph API directly?](#why-is-this-necessary-instead-of-interacting-with-the-microsoft-api-directly) section.
* What types of files does this support?
It follows the same guidelines as the documentation [here](https://help.openai.com/en/articles/8555545-file-uploads-faq) about file uploads.
* Why do I need to request an OBO token?
* When you try to use the same token to authenticate to the Graph API as the one you use to authenticate into the Azure Function, you get an “invalid audience” token. This is because the audience for the token can only be user\_impersonation.
* To address this, the function requests a new token scoped to Files.Read.All within the app using the [On Behalf Of flow](https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-on-behalf-of-flow). This will inherit the permissions of the logged in user, meaning this function will only search through files the logged-in user has access to.
* We are purposefully requesting a new On Behalf Of token with each request, because Azure Function Apps are meant to be stateless. You could potentially integrate this with Azure Key Vault to store the secret and retrieve programmatically.
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*