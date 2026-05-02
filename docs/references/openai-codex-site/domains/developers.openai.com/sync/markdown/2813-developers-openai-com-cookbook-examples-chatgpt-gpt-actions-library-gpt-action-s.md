GPT Actions library - Snowflake Direct
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
Aug 13, 2024
# GPT Actions library - Snowflake Direct
[ KG ](https://github.com/gladstone-openai)
[ Kevin Gladstone
(OpenAI)
](https://github.com/gladstone-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_snowflake_direct.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_snowflake_direct.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This particular GPT Action provides an overview of how to connect to a Snowflake Data Warehouse. This Action takes a user’s question, scans the relevant tables to gather the data schema, then writes a SQL query to answer the user’s question.
Note: This cookbook returns back a [ResultSet SQL statement](https://docs.snowflake.com/en/developer-guide/sql-api/handling-responses#getting-the-data-from-the-results), rather than the full result that is not limited by GPT Actions application/json payload limit. For production and advanced use-case, a middleware is required to return back a CSV file. You can follow instructions in the [GPT Actions - Snowflake Middleware cookbook](../gpt_actions_library/gpt_action_snowflake_middleware) to implement this flow instead.
### Value + Example Business Use Cases
Value: Users can now leverage ChatGPT’s natural language capability to connect directly to Snowflake’s Data Warehouse.
Example Use Cases:
* Data scientists can connect to tables and run data analyses using ChatGPT’s Data Analysis
* Citizen data users can ask basic questions of their transactional data
* Users gain more visibility into their data & potential anomalies
## Application Information
### Application Key Links
Check out these links from the application before you get started:
* Application Website: [https://app.snowflake.com/](https://app.snowflake.com/)
* Application API Documentation: [https://docs.snowflake.com/en/developer-guide/sql-api/intro](https://docs.snowflake.com/en/developer-guide/sql-api/intro)
### Application Prerequisites
Before you get started, make sure you go through the following steps in your application environment:
* Provision a Snowflake Data Warehouse
* Ensure that the user authenticating into Snowflake via ChatGPT has access to the database, schemas, and tables with the necessary role
## 1. Configure the Custom GPT
### Set GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`\*\*Context\*\*: You are an expert at writing Snowflake SQL queries. A user is going to ask you a question.
\*\*Instructions\*\*:
1. No matter the user's question, start by running `runQuery` operation using this query: "SELECT column\_name, table\_name, data\_type, comment FROM {database}.INFORMATION\_SCHEMA.COLUMNS"
-- Assume warehouse = "\<insert your default warehouse here\>", database = "\<insert your default database here\>", unless the user provides different values
2. Convert the user's question into a SQL statement that leverages the step above and run the `runQuery` operation on that SQL statement to confirm the query works. Add a limit of 100 rows
3. Now remove the limit of 100 rows and return back the query for the user to see
4. Use the \<your\_role\> role when querying Snowflake
5. Run each step in sequence. Explain what you are doing in a few sentences, run the action, and then explain what you learned. This will help the user understand the reason behind your workflow.
\*\*Additional Notes\*\*: If the user says "Let's get started", explain that the user can provide a project or dataset, along with a question they want answered. If the user has no ideas, suggest that we have a sample flights dataset they can query - ask if they want you to query that`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel. Update the servers url to match your Snowflake Account Name url plus `/api/v2` as described [here](https://docs.snowflake.com/en/user-guide/organizations-connect#standard-account-urls). Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
```
`openapi: 3.1.0
info:
title: Snowflake Statements API
version: 1.0.0
description: API for executing statements in Snowflake with specific warehouse and role settings.
servers:
- url: 'https://\<orgname\>-\<account\_name\>.snowflakecomputing.com/api/v2'
paths:
/statements:
post:
summary: Execute a SQL statement in Snowflake
description: This endpoint allows users to execute a SQL statement in Snowflake, specifying the warehouse and roles to use.
operationId: runQuery
tags:
- Statements
requestBody:
required: true
content:
application/json:
schema:
type: object
properties:
warehouse:
type: string
description: The name of the Snowflake warehouse to use for the statement execution.
role:
type: string
description: The Snowflake role to assume for the statement execution.
statement:
type: string
description: The SQL statement to execute.
required:
- warehouse
- role
- statement
responses:
'200':
description: Successful execution of the SQL statement.
content:
application/json:
schema:
type: object
properties:
status:
type: string
data:
type: object
additionalProperties: true
'400':
description: Bad request, e.g., invalid SQL statement or missing parameters.
'401':
description: Authentication error, invalid API credentials.
'500':
description: Internal server error.`
```
## 2. Configure Snowflake Integration
Below are instructions on setting up authentication with this 3rd party application. Have questions? Check out [Getting Started Example](https://platform.openai.com/docs/actions/getting-started) to see how this step works in more detail.
### Configure IP Whitelisting for ChatGPT
Snowflake accounts with network policies that limit connections by IP, may require exceptions to be added for ChatGPT.
* Review the Snowflake documentation on [Network Policies](https://docs.snowflake.com/en/user-guide/network-policies)
* Go to the Snowflake Worksheets
* Create a network rule with the ChatGPT IP egress ranges listed [here](https://platform.openai.com/docs/actions/production/ip-egress-ranges#ip-egress-ranges)
* Create a corresponding Network Policy
```
`## ChatGPT IP ranges available at https://openai.com/chatgpt-actions.json
CREATE NETWORK RULE chatgpt\_network\_rule
MODE = INGRESS
TYPE = IPV4
VALUE\_LIST = ('23.102.140.112/28',...,'40.84.180.128/28');
CREATE NETWORK POLICY chatgpt\_network\_policy
ALLOWED\_NETWORK\_RULE\_LIST = ('chatgpt\_network\_rule');`
```
Network policies can be applied at the account, security integration, and user level. The most specific network policy overrides the more general network policies. Depending on how these policies are applied, you may need to alter the policies for individual users in addition to the security integration. If you face this issue, you may encounter Snowflake’s error code 390422 or a generic “Invalid Client” error.
### Create the Security Integration
* Review the Snowflake OAuth Overview: [https://docs.snowflake.com/en/user-guide/oauth-snowflake-overview](https://docs.snowflake.com/en/user-guide/oauth-snowflake-overview)
* Create new OAuth credentials through a [Security Integration](https://docs.snowflake.com/en/sql-reference/sql/create-security-integration-oauth-snowflake) - you will need a new one for each OAuth app/custom GPT since Snowflake Redirect URIs are 1-1 mapped to Security Integrations
```
`CREATE SECURITY INTEGRATION CHATGPT\_INTEGRATION
TYPE = OAUTH
ENABLED = TRUE
OAUTH\_CLIENT = CUSTOM
OAUTH\_CLIENT\_TYPE = 'CONFIDENTIAL'
OAUTH\_REDIRECT\_URI = 'https://oauth.pstmn.io/v1/callback' --- // this is a temporary value while testing your integration. You will replace this with the value your GPT provides
OAUTH\_ISSUE\_REFRESH\_TOKENS = TRUE
OAUTH\_REFRESH\_TOKEN\_VALIDITY = 7776000
NETWORK\_POLICY = chatgpt\_network\_policy; --- // this line should only be included if you followed step 1 above`
```
Optional: Automate Network Rule Configuration
There are now over 100 egress IP addresses used by ChatGPT. The list updates irregularly and without announcement. To keep up to date with it, we can fetch the list on a daily basis and apply it to our network rule.
### Network rule to allow outbound traffic to OpenAI
```
`CREATE OR REPLACE NETWORK RULE chatgpt\_actions\_rule
MODE = EGRESS -- outbound
TYPE = HOST\_PORT
VALUE\_LIST = ('openai.com:443');`
```
### Access Integration to apply the rule
```
`CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION chatgpt\_actions\_integration
ALLOWED\_NETWORK\_RULES = (chatgpt\_actions\_rule)
ENABLED = TRUE;`
```
### UDF to Fetch the IP ranges
```
`CREATE OR REPLACE FUNCTION getChatGPTActionsAddresses()
RETURNS ARRAY -- array\<varchar\>
LANGUAGE PYTHON
RUNTIME\_VERSION = 3.10
PACKAGES = ('requests')
EXTERNAL\_ACCESS\_INTEGRATIONS = (chatgpt\_actions\_integration)
HANDLER = 'get\_ip\_address\_ranges'
AS
$$
import requests
def get\_ip\_address\_ranges():
resp = requests.get("https://openai.com/chatgpt-actions.json", timeout=10)
resp.raise\_for\_status()
data = [entry["ipv4Prefix"] for entry in resp.json().get("prefixes", []) if "ipv4Prefix" in entry]
return data
$$;`
```
### Procedure to update the network rule
```
`CREATE OR REPLACE PROCEDURE update\_chatgpt\_network\_rule()
RETURNS STRING
LANGUAGE SQL
AS
$$
DECLARE
ip\_list STRING;
BEGIN
-- Properly quote the IPs for use in VALUE\_LIST
ip\_list := '''' || ARRAY\_TO\_STRING(getChatGPTActionsAddresses(), ''',''') || '''';
-- Run the dynamic SQL to update the rule
EXECUTE IMMEDIATE
'ALTER NETWORK RULE chatgpt\_network\_rule SET VALUE\_LIST = (' || ip\_list || ')';
RETURN 'chatgpt\_network\_rule updated with ' || ARRAY\_SIZE(getChatGPTActionsAddresses()) || ' entries';
END;
$$;`
```
### Call the procedure
```
`CALL update\_chatgpt\_network\_rule();`
```
### Run the procedure every day at 6AM Pacific Time
```
`CREATE OR REPLACE TASK auto\_update\_chatgpt\_network\_rule
WAREHOUSE = COMPUTE\_WH
SCHEDULE = 'USING CRON 0 6 \* \* \* America/Los\_Angeles'
AS
CALL update\_chatgpt\_network\_rule();`
```
## 3. Configure GPT Action Authentication
### Gather key information from Snowflake
* Retrieve your OAuth Client ID, Auth URL, and Token URL
```
`DESCRIBE SECURITY INTEGRATION CHATGPT\_INTEGRATION;`
```
You’ll find the required information in these 3 rows:
* Retrieve your OAuth Client Secret using SHOW\_OAUTH\_CLIENT\_SECRETS
```
`SELECT
trim(parse\_json(SYSTEM$SHOW\_OAUTH\_CLIENT\_SECRETS('CHATGPT\_INTEGRATION')):OAUTH\_CLIENT\_ID) AS OAUTH\_CLIENT\_ID
, trim(parse\_json(SYSTEM$SHOW\_OAUTH\_CLIENT\_SECRETS('CHATGPT\_INTEGRATION')):OAUTH\_CLIENT\_SECRET) AS OAUTH\_CLIENT\_SECRET;`
```
Now is a good time to [test your Snowflake integration in Postman](https://community.snowflake.com/s/article/How-to-configure-postman-for-testing-SQL-API-with-OAuth). If you configured a network policy for your security integration, ensure that it includes the IP of the machine you’re using to test.
### Set OAuth Values in GPT Action Authentication
In ChatGPT, click on “Authentication” and choose “OAuth”. Enter in the information below.
|Form Field|Value|
|Authentication Type|OAuth|
|Client ID|OAUTH\_CLIENT\_ID from SHOW\_OAUTH\_CLIENT\_SECRETS|
|Client Secret|OAUTH\_CLIENT\_SECRET from SHOW\_OAUTH\_CLIENT\_SECRETS|
|Authorization URL|OAUTH\_AUTHORIZATION\_ENDPOINT from DESCRIBE SECURITY INTEGRATION|
|Token URL|OAUTH\_TOKEN\_ENDPOINT from DESCRIBE SECURITY INTEGRATION|
|Scope|session:role:CHATGPT\_INTEGRATION\_ROLE\*|
|Token Exchange Method|Default (POST Request)|
\*Snowflake scopes pass the role in the format `session:role:\<your\_role\>` for example `session:role:CHATGPT\_INTEGRATION\_ROLE`. You can optionally leave this field empty and specify the role in the GPT instructions, but by adding it here it becomes included in OAuth Consent Request which can sometimes be more reliable.
### 4. Update the Snowflake Integration Redirect URI
Once you’ve set up authentication in ChatGPT, follow the steps below in the application to finalize the Action.
* Copy the callback URL from the GPT Action
* Update the Redirect URI in your Security Integration to the callback URL provided in ChatGPT.
```
`ALTER SECURITY INTEGRATION CHATGPT\_INTEGRATION SET OAUTH\_REDIRECT\_URI='https://chat.openai.com/aip/\<callback\_id\>/oauth/callback';`
```
### FAQ & Troubleshooting
* This guide is intended to illustrate general concepts and is provided for reference purposes only. We are unable to provide full support for the third party API integration.
* The callback url can change if you update the YAML, double check it is correct when making changes.
* *Callback URL Error:* If you get a callback URL error in ChatGPT, pay close attention to the Post-Action Steps above. You need to add the callback URL directly into your Security Integration for the action to authenticate correctly
* *Schema calls the wrong warehouse or database:* If ChatGPT calls the wrong warehouse or database, consider updating your instructions to make it more explicit either (a) which warehouse / database should be called or (b) to require the user provide those exact details before it runs the query
*Are there integrations that you’d like us to prioritize? Are there errors in our integrations? File a PR or issue in our github, and we’ll take a look.*