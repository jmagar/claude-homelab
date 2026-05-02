GPT Actions library - Google Ads via Adzviser
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
Oct 10, 2024
# GPT Actions library - Google Ads via Adzviser
[ ZG ](https://www.linkedin.com/in/goo/)
[ Zeyuan Gu ](https://www.linkedin.com/in/goo/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_googleads_adzviser.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_googleads_adzviser.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This guide explains how to connect **Google Ads** reporting data to ChatGPT to retrieve key performance metrics like impressions, clicks and cost at campaign, ad group or ad level. To simplify this process, you will use [Adzviser](https://adzviser.com) as middleware, which ensures that the data returned from the Google Ads API is properly formatted and ready for analysis in ChatGPT’s [Data Analysis](https://help.openai.com/en/articles/8437071-data-analysis-with-chatgpt) environment.
**How Adzviser works:** First, connect your Google Ads account to [Adzviser](https://adzviser.com/set-up) via [OAuth](https://docs.adzviser.com/getStarted/workspace). When you ask questions like “How much did I spend per campaign last month?” in ChatGPT, Adzviser sends a [Google Ads Query Language](https://developers.google.com/google-ads/api/docs/query/overview) request and transforms the response into a CSV file (under 10MB). This file is then [returned to ChatGPT](https://platform.openai.com/docs/actions/sending-files/returning-files) for analysis. Adzviser enables you to easily review and analyze your campaign performance while brainstorming optimization strategies based on historical data insights.
### Value + Example Business Use Cases
**Value**: Google Ads marketers can now leverage ChatGPT’s natural language capabilities to easily query performance metrics and account settings without navigating the Google Ads UI. No need to upload or download any files in the entire process.
**Example Use Cases**:
* An eCommerce business owner wants to quickly check the Return on Ad Spend (ROAS) for their Google Ads campaigns from the previous month
* A brand marketer aims to conduct keyword and search term analysis using reporting data from the past 3 months to identify which keywords to pause or scale, and which search terms to add as negative keywords.
* An agency marketer needs to generate a monthly report featuring key metrics such as Cost-per-Click (CPC), Cost-per-Conversion (CPA), and Search Impression Share with month-over-month comparisons.
* A freelance marketer needs to audit a new client’s Google Ads account to evaluate performance and find optimization opportunities during the onboarding process.
## Demo/Example
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* How to create a workspace on Adzviser: [https://docs.adzviser.com/getStarted/workspace](https://docs.adzviser.com/getStarted/workspace)
* Adzviser Custom GPT Documentaion: [https://docs.adzviser.com/chatgpt/expert](https://docs.adzviser.com/chatgpt/expert)
* Google Ads prompt library: [https://docs.adzviser.com/chatgpt/googleAdsPromptTemplates](https://docs.adzviser.com/chatgpt/googleAdsPromptTemplates)
### Application Prerequisites
Before you get started, make sure you go through the following steps in your application environment:
* Confirm that you have [Read-only, Standard, or Admin access](https://support.google.com/google-ads/answer/9978556?hl=en) to a Google Ads account.
* [Sign up](https://adzviser.com/signup) for an account on Adzviser and activate a subscription (starting at $0.99).
* Connect your Google Ads account to Adzviser by creating a workspace
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`\*\*\*Context\*\*\*:
You are a Google Ads specialist who audits account health, retrieves real-time reporting data, and optimizes performances for marketers. When asked for an audit on account health, collect the relevant account settings, provide recommendations to adjust account structures. When asked about reporting data insights, gather relevant metrics and breakdowns, thoroughly analyze the reporting data, and then provide tailored recommendations to optimize performance.
\*\*\*Instructions for Retrieval of Reporting Data\*\*\*:
- Workflow to fetch real-time reporting data
Step 1. Calculate the date range with Python and Code Interpreter based on user input, such as "last week", "last month", "yesterday", "last 28 days", "last quarter" or "last year" etc. If no specific timeframe is provided, ask the user to clarify. Adjust for calendar variations. For example, "last week" should cover Monday to Sunday of the previous week.
Step 2. Retrieve workspace information using the 'getWorkspace' function.
Step 3. Fetch the relevant metrics and breakdowns for the inquired data source using functions like 'getGoogleAdsMetricsList' and 'getGoogleAdsBreakdownsList'.
Step 4. Use 'searchQuery' function with the data gathered from the previous steps like available workspace\_name and metrics/breakdowns as well as calculated date range to retrieve real-time reporting data.
- Time Granularity: If the user asks for daily/weekly/quarterly/monthly data, please reflect such info in the field time\_granularity in searchQueryRequest. No need to add time\_granularity if the user did not ask for it explicitly.
- Returned Files: If multiple files are returned, make sure to read all of them. Each file contains data from a segment in a data source or a data source.
- Necessary Breakdowns Only: Add important breakdowns only. Less is more. For example, if the user asks for "which ad is performing the best in Google Ads?", then you only add "Ad Name" in the breakdown list for the google\_ads\_request. No need to add breakdowns such as "Device" or "Campaign Name".
\*\*\*Instruction for Auditing\*\*\*\*:
- Workflow to audit Google Ads account
Step 1. Retrieve workspace information using the 'getWorkspace' function.
Step 2. Use '/google\_ads\_audit/\<specfic\_section\_to\_check\>' function to retrieve account settings.
- Comprehensive Audit: When asked for an comprehensive audit, don't call all the /google\_ads\_audit/\<specfic\_section\_to\_check\> all at once. Show the users what you're planning to do next first. Then audit two sections from the Google Ads Audit GPT Knowledge at a time, then proceed to the next two sections following users consent. For the line items in the tables in the Audit Knowledge doc that don't have automation enabled, it is very normal and expected that no relevant data is seen in the retrieved response. Please highlight what needs to be checked by the user manually because these non-automated steps are important too. For example, when checking connections, adzviser only checks if the google ads account is connected with Google Merchant Center. For other connections such as YT channels, please politely ask the user to check them manually.
\*\*\*Additional Notes\*\*\*:
- Always calculate the date range please with Code Interpreter and Python. It often is the case that you get the date range 1 year before when the user asks for last week, last month, etc.
- If there is an ApiSyntaxError: Could not parse API call kwargs as JSON, please politely tell the user that this is due to the recent update in OpenAI models and it can be solved by starting a new conversation on ChatGPT.
- If the users asks for Google Ads data, for example, and there is only one workspace that has connected to Google Ads, then use this workspace name in the searchQueryRequest or googleAdsAuditRequest.
- During auditing, part of the process is to retrieve the performance metrics at account, campaign, ad group, keyword, and product levels, remember to also run Python to calculate the date range for last month and the previous period. For retrieving performance metrics at these 5 levels, please send 5 distinct requests with different breakdowns list for each level. More can be found in the audit knowledge doc.`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`{
"openapi": "3.1.0",
"info": {
"title": "Adzviser Actions for GPT",
"description": "Equip GPTs with the ability to retrieve real-time reporting data and account settings from Google Ads",
"version": "v0.0.1"
},
"servers": [
{
"url": "https://copter.adzviser.com"
}
],
"paths": {
"/google\_ads/get\_metrics\_list": {
"get": {
"description": "Get the list of seletable Google Ads metrics, such as Cost, Roas, Impressions, etc.",
"operationId": "getGoogleAdsMetricsList",
"parameters": [],
"deprecated": false,
"security": [],
"x-openai-isConsequential": false
}
},
"/google\_ads/get\_breakdowns\_list": {
"get": {
"description": "Get the list of seletable Google Ads breakdowns such as Device, Keyword Text, Campaign Name etc.",
"operationId": "getGoogleAdsBreakdownsList",
"parameters": [],
"deprecated": false,
"security": [],
"x-openai-isConsequential": false
}
},
"/search\_bar": {
"post": {
"description": "Retrieve real-time reporting data such as impressions, cpc, etc. from marketing channels such as Google Ads, Fb Ads, Fb Insights, Bing Ads, etc.",
"operationId": "searchQuery",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/searchQueryRequest"
}
}
},
"required": true
},
"deprecated": false,
"security": [
{
"oauth2": []
}
],
"x-openai-isConsequential": false
}
},
"/workspace/get": {
"get": {
"description": "Retrieve a list of workspaces that have been created by the user and their data sources, such as Google Ads, Facebook Ads accounts connected with each.",
"operationId": "getWorkspace",
"parameters": [],
"deprecated": false,
"security": [
{
"oauth2": []
}
],
"responses": {
"200": {
"description": "OK",
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/getWorkspaceResponse"
}
}
}
}
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_merchant\_center\_connection": {
"post": {
"description": "Retrieve whether the Google Merchant Center is connected to the Google Ads account.",
"operationId": "checkGoogleAdsMerchantCenterConnection",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_account\_settings": {
"post": {
"description": "Retrieve the Google Ads account settings such as whether auto tagging is enabled, inventory type, etc.",
"operationId": "checkGoogleAdsAccountSettings",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_negative\_keywords\_and\_placements": {
"post": {
"description": "Retrieve the negative keywords and placements set in the Google Ads account.",
"operationId": "checkGoogleAdsNegativeKeywordsAndPlacements",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_remarketing\_list": {
"post": {
"description": "Retrieve the remarketing list set in the Google Ads account.",
"operationId": "checkGoogleAdsRemarketingList",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_conversion\_tracking": {
"post": {
"description": "Retrieve the conversion tracking status in the Google Ads account.",
"operationId": "checkGoogleAdsConversionTracking",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_bidding\_strategy": {
"post": {
"description": "Retrieve the bidding strategy set for each active campaigns in the Google Ads account.",
"operationId": "checkGoogleAdsBiddingStrategy",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_search\_campaign\_basic": {
"post": {
"description": "Retrieve the basic information of the search campaigns such as campaign structure, language targeting, country targeting, etc.",
"operationId": "checkSearchCampaignBasic",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_search\_campaign\_detailed": {
"post": {
"description": "Retrieve the detailed information of the search campaigns such as best performing keywords, ad copies, ad extentions, pinned descriptions/headlines etc.",
"operationId": "checkSearchCampaignDetailed",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_dynamic\_search\_ads": {
"post": {
"description": "Retrieve the dynamic search ads information such as dynamic ad targets, negative ad targets, best performing search terms etc.",
"operationId": "checkDynamicSearchAds",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
},
"/google\_ads\_audit/check\_pmax\_campaign": {
"post": {
"description": "Retrieve the performance of the pmax campaigns such as search themes, country/language targeting, final url expansions, excluded urls.",
"operationId": "checkPmaxCampaign",
"parameters": [],
"requestBody": {
"content": {
"application/json": {
"schema": {
"$ref": "#/components/schemas/googleAdsAuditRequest"
}
}
},
"required": true
},
"x-openai-isConsequential": false
}
}
},
"components": {
"schemas": {
"getWorkspaceResponse": {
"title": "getWorkspaceResponse",
"type": "array",
"description": "The list of workspaces created by the user on adzviser.com/main. A workspace can include multiple data sources",
"items": {
"type": "object",
"properties": {
"name": {
"title": "name",
"type": "string",
"description": "The name of a workspace"
},
"data\_connections\_accounts": {
"title": "data\_connections\_accounts",
"type": "array",
"description": "The list of data sources that the workspace is connected. The name can be an account name and type can be Google Ads/Facebook Ads/Bing Ads",
"items": {
"type": "object",
"properties": {
"name": {
"title": "name",
"type": "string",
"description": "The name of a data connection account"
}
}
}
}
}
}
},
"googleAdsAuditRequest": {
"description": "Contains details about the Google Ads account audit request.",
"type": "object",
"required": [
"workspace\_name"
],
"title": "googleAdsAuditRequest",
"properties": {
"workspace\_name": {
"type": "string",
"title": "workspace\_name",
"description": "Call API getWorkspace first to get a list of available workspaces"
}
}
},
"searchQueryRequest": {
"description": "Contains details about queried data source, metrics, breakdowns, time ranges and time granularity, etc.",
"type": "object",
"required": [
"assorted\_requests",
"workspace\_name",
"date\_ranges"
],
"title": "searchQueryRequest",
"properties": {
"assorted\_requests": {
"type": "object",
"title": "assorted\_requests",
"description": "For example, if the user asks for \\"cost on Google ads last month\\", then call getGoogleAdsMetricsList and getGoogleAdsBreakdownsList to retrieve the latest up-to-date info about how to compose a google\_ads\_request. A metric is a quantitative measurement. It represents data that can be measured and expressed in numbers. Metrics are used to track performance or behavior. Examples include clicks, impressions, conversions, revenue, etc. A breakdown is a qualitative attribute or descriptor. It provides context for metrics by categorizing or segmenting them. Breakdowns are text. Examples include country, channel, campaign name, etc. DO NOT include Date, Month, Quarter or Year in the list of breakdowns in any of the requests below. The breakdowns should be NOT mixed up with metrics, meaning that the selected breakdowns should be passed into the property \\"breakdowns\\", not \\"metrics\\", and vice versa.",
"properties": {
"google\_ads\_request": {
"type": "object",
"description": "DO NOT come up with metrics and breakdowns on your own. You MUST call API getGoogleAdsMetricsList and getGoogleAdsBreakdownsList to be better informed prior of composing a googleAdsRequest.",
"required": [
"metrics",
"breakdowns"
],
"properties": {
"breakdowns": {
"type": "array",
"items": {
"type": "string"
},
"description": "Must call API getGoogleAdsBreakdownsList to retrieve a list of selectable breakdowns."
},
"metrics": {
"type": "array",
"items": {
"type": "string"
},
"description": "Must call API getGoogleAdsMetricsList to retrieve a list of selectable metrics."
}
}
}
}
},
"workspace\_name": {
"type": "string",
"title": "workspace\_name",
"description": "Call API getWorkspace first to get a list of available workspaces. Multiple data sources (such as Google ads, Bing ads) can be stored in one workspace. If the user does not specify a workspace name, then use the available workspace name from the retrieved list and see which one has Google Ads. If the user has not yet created one, then ask them to go to adzviser.com/main to create a new workspace."
},
"date\_ranges": {
"type": "array",
"description": "A list of date ranges requested from the user. They needs to be calculated seperately with Code Interpreter and Python every single time for accuracy. For example, if the user requests \\"Google Ads search impression share in May and August\\", then this array should be [[\\"2024-05-01\\", \\"2024-05-31\\"], [\\"2024-08-01\\", \\"2024-08-31\\"]].",
"items": {
"type": "array",
"items": {
"type": "string"
},
"description": "A 2-element array. The first represents the start date and the second the end date. Both are in YYYY-MM-DD format."
}
},
"time\_granularity": {
"type": "string",
"title": "time\_granularity",
"default": "",
"description": "Describes how granularity you wish the date\_ranges to be. For example, If the user asks \\"weekly cost on Google Ads\\" this year, then this value should be \\"Week\\". If the user does not specify, then leave it as empty.",
"enum": [
"Date",
"Week",
"Month",
"Quarter"
]
}
}
}
},
"securitySchemes": {
"oauth2": {
"type": "oauth2"
}
}
}
}`
```
## Authentication Instructions
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
### In ChatGPT
In ChatGPT, click on “Authentication” and choose **“OAuth”**. Enter in the information below.
* **Client ID**: (Leave blank)
* **Client Secret**: (Leave blank)
* **Authorization URL**: [https://adzviser.com/authorize-gpt](https://adzviser.com/authorize-gpt)
* **Token URL**: [https://adzviser.com/api/oauth-exchange-token-gpt](https://adzviser.com/api/oauth-exchange-token-gpt)
* **Scope**: (Leave blank)
* **Token Exchange Method**: Default (POST)
### FAQ & Troubleshooting
* *Empty Google Ads account list*: If you encounter an empty Google Ads accounts list when trying to connect your Google Ads account, it is likely that you have not yet named your Google Ads account yet. To solve it, go to ads.google.com and sign in. Then follow the instructions [here](https://support.google.com/google-ads/answer/7519527?hl=en) to name your Google Ads account.
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*