GPT Actions library - AWS Redshift
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
Aug 9, 2024
# GPT Actions library - AWS Redshift
[ PP ](https://www.linkedin.com/in/portepa/)
[ Pierre-Antoine Porte
(OpenAI)
](https://www.linkedin.com/in/portepa/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_action_redshift.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_action_redshift.ipynb)
## Introduction
This page provides an instruction & guide for developers building a GPT Action for a specific application. Before you proceed, make sure to first familiarize yourself with the following information:
* [Introduction to GPT Actions](https://platform.openai.com/docs/actions)
* [Introduction to GPT Actions Library](https://platform.openai.com/docs/actions/actions-library)
* [Example of Building a GPT Action from Scratch](https://platform.openai.com/docs/actions/getting-started)
This solution enables a GPT action to retrieve data from Redshift and perform data analysis.It uses AWS Functions, performing every action from AWS ecosystem and network. The middleware (AWS function) will perform the SQL query, wait for its completion and return the data as a file. The code is provided for information purpose only and should be modified to your needs.
This solution uses the ability to [retrieve files in Actions](https://platform.openai.com/docs/actions/sending-files) and use them as if you had uploaded them directly to a conversation.
This solution highlight a connection to Redshift serverless, the integration with a provisioned Redshift might differ slighltly to retrieve networks and set-up connection, the overall code and (minimal) integration should be similar.
### Value & Example Business Use Cases
**Value**: Leverage ChatGPT’s natural language capabilities to connect to Redshift’s DWH.
**Example Use Cases**:
* Data scientists can connect to tables and run data analyses using ChatGPT’s Data Analysis
* Citizen data users can ask basic questions of their transactional data
* Users gain more visibility into their data & potential anomalies
## Application Information
### Application Prerequisites
Before you get started, make sure that:
* You have access to a Redshift environment
* You have the rights to deploy AWS function in the same VPC (Virtual Private Network)
* Your AWS CLI is authenticated
## Middleware Information
### Install required libraries
* Install AWS CLI, required for AWS SAM ([docs](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions))
* Install AWS SAM CLI ([docs](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html))
* Install Python
* Install yq [docs](https://github.com/mikefarah/yq?tab=readme-ov-file#install)
### Middleware function
To create a function, follow the steps in the [AWS Middleware Action cookbook](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_middleware_aws_function).
To deploy specifically an application that connects to Redshift, use the following code instead of the “hello-world” GitHub repository referenced in the Middleware AWS Function cookbook. You can either clone the repository or take the code pasted below and modify it to your needs.
>
> This code is meant to be directional - while it should work out of the box, it is designed to be customized to your needs (see examples towards the end of this document).
>
To get the code, you can clone openai-cookbook repository and navigate to the redshift-middleware directory
```
`git clone https://github.com/pap-openai/redshift-middleware
cd redshift-middleware`
```
```
`import json
import psycopg2
import os
import base64
import tempfile
import csv
# Fetch Redshift credentials from environment variables
host = os.environ['REDSHIFT\_HOST']
port = os.environ['REDSHIFT\_PORT']
user = os.environ['REDSHIFT\_USER']
password = os.environ['REDSHIFT\_PASSWORD']
database = os.environ['REDSHIFT\_DB']
def execute\_statement(sql\_statement):
try:
# Establish connection
conn = psycopg2.connect(
host=host,
port=port,
user=user,
password=password,
dbname=database
)
cur = conn.cursor()
cur.execute(sql\_statement)
conn.commit()
# Fetch all results
if cur.description:
columns = [desc[0] for desc in cur.description]
result = cur.fetchall()
else:
columns = []
result = []
cur.close()
conn.close()
return columns, result
except Exception as e:
raise Exception(f"Database query failed: {str(e)}")
def lambda\_handler(event, context):
try:
data = json.loads(event['body'])
sql\_statement = data['sql\_statement']
# Execute the statement and fetch results
columns, result = execute\_statement(sql\_statement)
# Create a temporary file to save the result as CSV
with tempfile.NamedTemporaryFile(delete=False, mode='w', suffix='.csv', newline='') as tmp\_file:
csv\_writer = csv.writer(tmp\_file)
if columns:
csv\_writer.writerow(columns) # Write the header
csv\_writer.writerows(result) # Write all rows
tmp\_file\_path = tmp\_file.name
# Read the file and encode its content to base64
with open(tmp\_file\_path, 'rb') as f:
file\_content = f.read()
encoded\_content = base64.b64encode(file\_content).decode('utf-8')
response = {
'openaiFileResponse': [
{
'name': 'query\_result.csv',
'mime\_type': 'text/csv',
'content': encoded\_content
}
]
}
return {
'statusCode': 200,
'headers': {
'Content-Type': 'application/json'
},
'body': json.dumps(response)
}
except Exception as e:
return {
'statusCode': 500,
'body': json.dumps({'error': str(e)})
}`
```
### Retrieve VPC information
We will need to connnect our function to Redshift, therefore we need to find the network used by Redshift. You can find this on your Redshift interface the AWS console, under Amazon Redshift Serverless \> Workgroup configuration \> `your\_workgroup` \> Data access, or through the CLI:
```
`aws redshift-serverless get-workgroup --workgroup-name default-workgroup --query 'workgroup.{address: endpoint.address, port: endpoint.port, SecurityGroupIds: securityGroupIds, SubnetIds: subnetIds}'`
```
### Set up AWS function
Copy `env.sample.yaml` to `env.yaml` and replace with the values obtained above. You will need a Redshift user with access to your DB/schema.
```
`cp env.sample.yaml env.yaml`
```
Fill in `env.yaml` with the values retrieved by the previous command as well as your credentials to Redshift.
Alternatively, you can create a file named `env.yaml` manually and fill the following variables:
```
`RedshiftHost: default-workgroup.xxxxx.{region}.redshift-serverless.amazonaws.com
RedshiftPort: 5439
RedshiftUser: username
RedshiftPassword: password
RedshiftDb: my-db
SecurityGroupId: sg-xx
SubnetId1: subnet-xx
SubnetId2: subnet-xx
SubnetId3: subnet-xx
SubnetId4: subnet-xx
SubnetId5: subnet-xx
SubnetId6: subnet-xx`
```
This file will be used to deploy your function with parameters, as shown below:
```
`PARAM\_FILE="env.yaml"
PARAMS=$(yq eval -o=json $PARAM\_FILE | jq -r 'to\_entries | map("\\(.key)=\\(.value|tostring)") | join(" ")')
sam deploy --template-file template.yaml --stack-name redshift-middleware --capabilities CAPABILITY\_IAM --parameter-overrides $PARAMS`
```
The template.yaml has the following content:
```
`AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31
Description: \>
redshift-middleware
Middleware to fetch RedShift data and return it through HTTP as files
Globals:
Function:
Timeout: 3
Parameters:
RedshiftHost:
Type: String
RedshiftPort:
Type: String
RedshiftUser:
Type: String
RedshiftPassword:
Type: String
RedshiftDb:
Type: String
SecurityGroupId:
Type: String
SubnetId1:
Type: String
SubnetId2:
Type: String
SubnetId3:
Type: String
SubnetId4:
Type: String
SubnetId5:
Type: String
SubnetId6:
Type: String
CognitoUserPoolName:
Type: String
Default: MyCognitoUserPool
CognitoUserPoolClientName:
Type: String
Default: MyCognitoUserPoolClient
Resources:
MyCognitoUserPool:
Type: AWS::Cognito::UserPool
Properties:
UserPoolName: !Ref CognitoUserPoolName
Policies:
PasswordPolicy:
MinimumLength: 8
UsernameAttributes:
- email
Schema:
- AttributeDataType: String
Name: email
Required: false
MyCognitoUserPoolClient:
Type: AWS::Cognito::UserPoolClient
Properties:
UserPoolId: !Ref MyCognitoUserPool
ClientName: !Ref CognitoUserPoolClientName
GenerateSecret: true
RedshiftMiddlewareApi:
Type: AWS::Serverless::Api
Properties:
StageName: Prod
Cors: "'\*'"
Auth:
DefaultAuthorizer: MyCognitoAuthorizer
Authorizers:
MyCognitoAuthorizer:
AuthorizationScopes:
- openid
- email
- profile
UserPoolArn: !GetAtt MyCognitoUserPool.Arn
RedshiftMiddlewareFunction:
Type: AWS::Serverless::Function
Properties:
CodeUri: redshift-middleware/
Handler: app.lambda\_handler
Runtime: python3.11
Timeout: 45
Architectures:
- x86\_64
Events:
SqlStatement:
Type: Api
Properties:
Path: /sql\_statement
Method: post
RestApiId: !Ref RedshiftMiddlewareApi
Environment:
Variables:
REDSHIFT\_HOST: !Ref RedshiftHost
REDSHIFT\_PORT: !Ref RedshiftPort
REDSHIFT\_USER: !Ref RedshiftUser
REDSHIFT\_PASSWORD: !Ref RedshiftPassword
REDSHIFT\_DB: !Ref RedshiftDb
VpcConfig:
SecurityGroupIds:
- !Ref SecurityGroupId
SubnetIds:
- !Ref SubnetId1
- !Ref SubnetId2
- !Ref SubnetId3
- !Ref SubnetId4
- !Ref SubnetId5
- !Ref SubnetId6
Outputs:
RedshiftMiddlewareApi:
Description: "API Gateway endpoint URL for Prod stage for SQL Statement function"
Value: !Sub "https://${RedshiftMiddlewareApi}.execute-api.${AWS::Region}.amazonaws.com/Prod/sql\_statement/"
RedshiftMiddlewareFunction:
Description: "SQL Statement Lambda Function ARN"
Value: !GetAtt RedshiftMiddlewareFunction.Arn
RedshiftMiddlewareFunctionIamRole:
Description: "Implicit IAM Role created for SQL Statement function"
Value: !GetAtt RedshiftMiddlewareFunctionRole.Arn
CognitoUserPoolArn:
Description: "ARN of the Cognito User Pool"
Value: !GetAtt MyCognitoUserPool.Arn`
```
Retrieve the URL information from the previous command output, you can then run a cURL request, which should return data in a file format:
```
`curl -X POST https://\<your\_url\>/Prod/sql\_statement/ \\
-H "Content-Type: application/json" \\
-d '{ "sql\_statement": "SELECT \* FROM customers LIMIT 10", "workgroup\_name": "default-workgroup", "database\_name": "pap-db" }'`
```
## ChatGPT Steps
### Custom GPT Instructions
Once you’ve created a Custom GPT, copy the text below in the Instructions panel.
```
`\*\*Context\*\*: You are an expert at writing Redshift SQL queries. You will initially retrieve the table schema that you will use thoroughly. Every attributes, table names or data type will be known by you.
\*\*Instructions\*\*:
1. No matter the user's question, start by running `runQuery` operation using this query: "SELECT table\_name, column\_name FROM INFORMATION\_SCHEMA.COLUMNS WHERE table\_schema = 'public' ORDER BY table\_name, ordinal\_position;" It will help you understand how to query the data. A CSV will be returned with all the attributes and their table. Make sure to read it fully and understand all available tables & their attributes before querying. You don't have to show this to the user.
2. Convert the user's question into a SQL statement that leverages the step above and run the `runQuery` operation on that SQL statement to confirm the query works. Let the user know which table you will use/query.
3. Execute the query and show him the data. Show only the first few rows.
\*\*Additional Notes\*\*: If the user says "Let's get started", explain they can ask a question they want answered about data that we have access to. If the user has no ideas, suggest that we have transactions data they can query - ask if they want you to query that.
\*\*Important\*\*: Never make up a table name or table attribute. If you don't know, go back to the data you've retrieved to check what is available. If you think no table or attribute is available, then tell the user you can't perform this query for them.`
```
### OpenAPI Schema
Once you’ve created a Custom GPT, copy the text below in the Actions panel.
This expects a response that matches the file retrieval structure in our doc [here](https://platform.openai.com/docs/actions/sending-files) and passes in a `query` as a parameter to execute.
Make sure to follow the steps in the [AWS Middleware cookbook](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_middleware_aws_function) to set up authentication.
>
> Make sure to switch the function app name based on your function deployment.
>
```
`openapi: 3.1.0
info:
title: SQL Execution API
description: API to execute SQL statements and return results as a file.
version: 1.0.0
servers:
- url: {your\_function\_url}/Prod
description: Production server
paths:
/sql\_statement:
post:
operationId: executeSqlStatement
summary: Executes a SQL statement and returns the result as a file.
requestBody:
required: true
content:
application/json:
schema:
type: object
properties:
sql\_statement:
type: string
description: The SQL statement to execute.
example: SELECT \* FROM customers LIMIT 10
required:
- sql\_statement
responses:
'200':
description: The SQL query result as a JSON file.
content:
application/json:
schema:
type: object
properties:
openaiFileResponse:
type: array
items:
type: object
properties:
name:
type: string
description: The name of the file.
example: query\_result.json
mime\_type:
type: string
description: The MIME type of the file.
example: application/json
content:
type: string
description: The base64 encoded content of the file.
format: byte
example: eyJrZXkiOiJ2YWx1ZSJ9
'500':
description: Error response
content:
application/json:
schema:
type: object
properties:
error:
type: string
description: Error message.
example: Database query failed error details`
```
## Conclusion
You now have deployed a GPT that uses a middleware in AWS, in an authenticated manner, that’s able to connect to Redsfhit. Users with access (that are in Cognito) can now query your databases to perform data analysis task: