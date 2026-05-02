GPT Actions library (Middleware) - Azure Functions
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
# GPT Actions library (Middleware) - Azure Functions
[ MA ](https://github.com/maxreid-openai)
[ maxreid-openai
(OpenAI)
](https://github.com/maxreid-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_middleware_azure_function.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_middleware_azure_function.ipynb)
## Introduction
This page provides an instruction & guide for developers building middleware to connect a GPT Action to a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This particular GPT Action provides an overview of how to build an **Azure Function**, MSFT’s cloud-based function builder. This documentation helps a user set up an OAuth-protected Azure Function to connect to a GPT Action, and to a sample application.
### Value + Example Business Use Cases
**Value**: Users can now leverage ChatGPT’s natural language capability to connect directly to Azure Function. This can in a few ways:
* 100k character limit in GPT Actions: users can use the middleware to pre-process the text response from an API. For example, you can use OpenAI’s API in the middleware to summarize the text before sending it back to ChatGPT.
* Typically for actions, users are relying on the SaaS API to return text. You can convert the response for the vendor API into easily digestible text, and it can handle different data types such as structured and unstructured data.
* It can return files instead of just text. This can be useful to surface CSV files for Data Analysis, or bring back an PDF file and ChatGPT will treat it like an upload.
**Example Use Cases**:
* A user needs to look up files in Sharepoint, but needs a middleware app between ChatGPT and Sharepoint
* A user has built several steps in a row in an Azure function, and needs to be able to kick off that process using ChatGPT
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://learn.microsoft.com/en-us/azure/azure-functions/](https://learn.microsoft.com/en-us/azure/azure-functions/)
* Application API Documentation: [https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference/](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference/)
### Application Prerequisites
Before you get started, make sure you go through the following steps in your application environment:
* Azure Portal with access to create Azure Function Apps and Azure Entra App Registrations
## Application Setup
### Installing the app
You can read more about languages and deployment options for Azure Functions on the left hand side of the documentation [here](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview?pivots=programming-language-csharp).
#### Option 1: Use VSCode
See Microsoft’s documentation [here](https://learn.microsoft.com/en-us/azure/azure-functions/functions-develop-vs-code?tabs=node-v4,python-v2,isolated-process&#x26;pivots=programming-language-javascript) for how to deploy using VSCode. If you have familiarity with this approach, feel free to use it.
#### Option 2: Directly in Azure Portal
See the documentation [here](https://learn.microsoft.com/en-us/azure/azure-functions/functions-create-function-app-portal?pivots=programming-language-javascript) for how to deploy using the Azure portal. We’ll walk through an example here step by step.
##### Part 1: Create Function
1. Create an [Azure Function app](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview?pivots=programming-language-csharp). I used the following settings but you can use anything you are comfortable with. Note that not every language / operating system allows for editing the functions in the console directly - the combination I chose below does. For my walkthrough, I left everything as default and made the selections below. The below settings work out of the box for the SharePoint Node.js solutions [here](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_doc) and [here](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_text).
1. Basics
1. *Do you want to deploy code or container image?:* **Code**
2. *Runtime stack:* **Node.js**
3. *Operating system:* **Windows**
4. Networking
1. *Enable public access*: **on (need this on to connect to the GPT)**
2. After completing the above, you’ll land on the “Deployments” page. Once the deployment completes (which should only take a few minutes) click on **“Go to Resource”** to go back to the Function App
>
> You may get an error the first time you attempt this, click create again and it will likely work.
>
##### Part 2: Set up Auth
1. On the left-hand side menu of the Azure Function App, click on **Authentication** under the **Settings** menu.
1. Add identity provider
2. Select **Microsoft** as identity provider.
3. **Workforce** as tenant type
4. **Create a new application.** The instructions are fairly similar if you are using an existing application, but it is easier to create a new application as it will have the callback URLs and the API exposed automatically using “Easy Auth”. You can read more about that [**here**](https://learn.microsoft.com/en-us/azure/app-service/overview-authentication-authorization).
5. Leave all the other settings on this page as the default, but feel free to change based on your internal guidelines.
6. On the **permissions** tab, click **Add Permission** and add **Files.Read.All** and **Sites.ReadAll**, then **Add.** This allows this application to read files which is important in order to use the Microsoft Graph Search API. If you are not using this for the SharePoint solution [here](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_doc) and [here](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_text) you can skip this.
7. Once it is created, **click on the enterprise application you just created** (so, leave the Function App page and land on the Enterprise Application that you just spun up)**.** We are now going to give it one more permission, to execute the Azure Function by impersonating the user logging into the application. See [here](https://learn.microsoft.com/en-us/azure/app-service/configure-authentication-provider-aad?tabs=workforce-tenant) for more details.
1. On the main page, click “**View API Permissions”**
2. Search for **Microsoft Azure App Service** in the **APIs my organization uses** and find **user\_impersonation**
3. Add it, then you’ll need an Admin on Azure Portal to **Grant Admin Consent.**
1. **Within that enterprise application**, Click on **“Expose an API”** on the left hand menu under **Manage,** then copy the **scope** that was created using the **Copy to Clipboard** button. The scope should look like “api://\<insert-uuid\>/user\_impersonation”. **Save this for later as** `SCOPE`**.**
2. Click on **“Authentication”** on the left hand menu under **Manage**
1. Under the **Web** section, you’ll notice one callback URI was added automatically. Add the Postman redirect URI ([https://oauth.pstmn.io/v1/callback](https://oauth.pstmn.io/v1/callback)) for testing.
2. On the left-hand side, go to **Overview**. Copy the **application (client) ID** and and the **directory (tenant) ID** and **save for later as** `CLIENT\_ID` **and** `TENANT\_ID`**.**
##### Part 3: Set up Test Function
1. Leave the page by going home and then back to your **Function App.**
2. Click on **Create Function.** For this example, I’m going to develop it in the portal, but you can also use VSCode or another IDE.
1. Choose **HTTP trigger**
2. For **Authorization Level,** you can choose any key type you want.
1. Note this may error out the first time, but it is likely the Function did create, do a refresh of the page to check.
2. Click on the function you just created (You may need to click refresh to see it). Click on **Get Function URL** and save it to test in Postman. You will also use this when creating the OpenAPI spec later when you put it into the GPT.
1. Go back to the function app and click on **Configuration.** Show the value for the `MICROSOFT\_PROVIDER\_AUTHENTICATION\_SECRET` variable, copy it (click advanced edit to copy it), and **save it for later.** 
At this point, you should have a test function created, and you should have saved a **client id, tenant id, secret, scope, and function URL**. You are now ready to test out the authentication in Postman
##### Part 4: Test Authentication in Postman
1. Try to hit endpoint you created in Postman using those OAuth settings:
1. **Grant Type:** Authorization Code
2. **Auth URL**: [https://login.microsoftonline.com/`TENANT\_ID`/oauth2/v2.0/authorize](https://login.microsoftonline.com/`TENANT_ID`/oauth2/v2.0/authorize)
3. **Auth Token URL**: [https://login.microsoftonline.com/`TENANT\_ID`/oauth2/v2.0/token](https://login.microsoftonline.com/`TENANT_ID`/oauth2/v2.0/token)
4. **Client ID:** `CLIENT\_ID` from step 7 above
5. **Client secret:** `MICROSOFT\_PROVIDER\_AUTHENTICATION\_SECRET `from step 11 above
6. **Scope**: `SCOPE` from step 5 above
7. **Client credentials**: Send client credentials in body
8. You will need to click **Get New Access Token**, and then hit the endpoint you saved in step 10 above. If it was successful, you should get this response: `”This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.”`
##### Part 5: Set up your Application on an Azure Function
This should be done separately and is specific to your app. See the [Sharepoint Cookbook]((https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_doc)) for an example of that.
##### Part 6: Set up ChatGPT
1. Generate an OpenAPI spec for your endpoint.
2. Paste that into the Actions section of a GPT, and choose OAuth as the authentication type. Fill out the OAuth settings the same way you did for Postman above.
3. Once you save the action, you will see a callback URI at the bottom of the GPT configuration. Copy that URL, then go **back to your Function App in the Azure Portal**.
4. Click on **Authentication** under **Settings**, then click on your Entra application.
5. Once you are there, then click **Authentication** under the **Manage** section.
6. Add a new Redirect URI under the **Web** section of that page, and paste in the Callback URI you got from step 16, then click Save.
7. Test out the GPT and it should work as expected.
## ChatGPT Steps
### Custom GPT Instructions
*This is application specific. See [Sharepoint Cookbook]((https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_action_sharepoint_doc)) for an example*
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
Below is an example of what connecting to this Middlware might look like. You’ll need to insert your application’s & function’s information in this section.
```
`openapi: 3.1.0
info:
title: {insert title}
description: {insert description}
version: 1.0.0
servers:
- url: https://{your\_function\_app\_name}.azurewebsites.net/api
description: {insert description}
paths:
/{your\_function\_name}?code={enter your specific endpoint id here}:
post:
operationId: {insert operationID}
summary: {insert summary}
requestBody:
{the rest of this is specific to your application}`
```
## Authentication Instructions
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
### Pre-Action Steps
Before you set up authentication in ChatGPT, please take the following steps in the application.
*Follow steps 2 & 4 above to setting up authentication*
### In ChatGPT
In ChatGPT, click on “Authentication” and choose **“OAuth”**. Enter in the information below.
* **Client ID**: *see step 12 above*
* **Client Secret**: *ditto*
* **Authorization URL**: *ditto*
* **Token URL**: *ditto*
* **Scope**: *ditto*
* **Token**: *ditto*
### Post-Action Steps
Once you’ve set up authentication in ChatGPT, follow the steps below in the application to finalize the Action.
*See above for testing out this application*
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*