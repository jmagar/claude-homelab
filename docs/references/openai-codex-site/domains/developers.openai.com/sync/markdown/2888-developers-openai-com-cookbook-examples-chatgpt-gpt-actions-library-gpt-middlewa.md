GPT Actions library - AWS Middleware
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
# GPT Actions library - AWS Middleware
[ PP ](https://www.linkedin.com/in/portepa/)
[ Pierre-Antoine Porte
(OpenAI)
](https://www.linkedin.com/in/portepa/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/chatgpt/gpt_actions_library/gpt_middleware_aws_function.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/chatgpt/gpt_actions_library/gpt_middleware_aws_function.ipynb)
## Introduction
This particular GPT Action provides an overview of how to build an **AWS Lambda** function. This documentation helps a user set up an OAuth-protected AWS Function to connect to a GPT Action, and to a sample application. This example uses AWS SAM (Serverless Application Model) in this example to set-up the AWS stack.
### Value + Example Business Use Cases
**Value**: Users can now leverage ChatGPT’s capabilities to connect to an AWS Function. This enables you to connect to any services in AWS and run code/applications on this. This can in a few ways:
* Access 3rd party services such as AWS Redshift, AWS DynamoDB, AWS S3 and even more!
* Allows pre-processing text responses from an API (overcoming context limits, adding context or metadata as examples).
* Enables to return files instead of retrieving text from 3rd party APIs. This can be useful to surface CSV files for Data Analysis, or bring back an PDF file and ChatGPT will treat it like an upload.
**Example Use Cases**:
* A user needs to look up data in Redshift, but needs a middleware app between ChatGPT and Redshift to return files (data analysis data exactitude as well as large number of data)
* A user has built several steps in an AWS function, and needs to be able to kick off that process using ChatGPT.
## Application information & prerequisites
We will leverage AWS Lambda services to create a middleware function. You can get familiar with this stack by visiting the following links:
* Lambda Website: [https://aws.amazon.com/lambda/](https://aws.amazon.com/lambda/)
* Lambda Documentation: [https://docs.aws.amazon.com/lambda/](https://docs.aws.amazon.com/lambda/)
* AWS SAM docs: [https://docs.aws.amazon.com/serverless-application-model/](https://docs.aws.amazon.com/serverless-application-model/)
### Prerequisites
Before you get started, make sure you have an AWS Console with access to create: Lambda Function, S3 Buckets, Application Stack, Cognito User Pool, Cognito User Pool App Clients, API Gateway, Lambda roles, CloudFormation stacks (this feels like a lot but creating those services is automated!).
## Create AWS Lambda Function
To create an AWS Function you can use AWS SAM. An example of a SAM Template can be found [here](https://github.com/pap-openai/redshift-middleware/blob/main/template.yaml) [0].
This template includes:
* A User Pool & User Pool Client, used for OAuth
* A Cognito Authorizer that ensure the function can only be called by authenticated users
* Mapping the Lambda function to an existing VPC (useful to connect to other AWS services)
* Has parameters that can be set-up dynamically (e.g: credentials/variables)
* An API Gateway that maps HTTP routes to the functions
This code is purely informational to help you get started and doesn’t require pre-existing AWS resources. We recommend to map existing user pools if you have any instead of creating new ones, as well as setting up your Lambda in a VPC that has access to other AWS Resources (if you need to leverage those). You can see an example of a set-up like this in the [RedShift cookbook](https://cookbook.openai.com/examples/chatgpt/gpt_actions_library/gpt_middleware_aws_function).
The Cognito Authorizer is key to make sure your function can only be called/accessed by authenticated users so make sure to set this up correctly with your environment.
[0]
```
`AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31
Description: \>
aws-middleware
AWS middleware function
Parameters:
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
MiddlewareApi:
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
MiddlewareFunction:
Type: AWS::Serverless::Function
Properties:
CodeUri: aws-middleware/
Handler: app.lambda\_handler
Runtime: python3.11
Timeout: 45
Architectures:
- x86\_64
Events:
SqlStatement:
Type: Api
Properties:
Path: /my\_route
Method: post
RestApiId: !Ref MiddlewareApi
Outputs:
MiddlewareApi:
Description: "API Gateway endpoint URL for Prod stage for SQL Statement function"
Value: !Sub "https://${MiddlewareApi}.execute-api.${AWS::Region}.amazonaws.com/Prod/my\_route"
MiddlewareFunction:
Description: "SQL Statement Lambda Function ARN"
Value: !GetAtt MiddlewareFunction.Arn
MiddlewareFunctionIamRole:
Description: "Implicit IAM Role created for SQL Statement function"
Value: !GetAtt MiddlewareFunctionRole.Arn
CognitoUserPoolArn:
Description: "ARN of the Cognito User Pool"
Value: !GetAtt MyCognitoUserPool.Arn`
```
You can clone the openai-cookbook repository & take the sample python code & SAM template from the `lambda-middleware` directory:
```
`git clone https://github.com/pap-openai/aws-lambda-middleware
cd lambda-middleware`
```
To build & deploy your function, run the following commands from this directory
```
`sam build
sam deploy --template-file template.yaml --stack-name aws-middleware --capabilities CAPABILITY\_IAM`
```
Once you have this deployed, you can go check out the application on AWS Lambda:
You can confirm that the function is not reachable unless authenticated by running a curl command without any authentication:
```
`curl -d {} \<middleware\_api\_output\_url\_from\_deploy\_command\>`
```
which should return `{"message":"Unauthorized"}`.
## Set up Auth in AWS Cognito
*Optional: do those steps only if you created a user pool and are not using an existing one*
Let’s create a user in the newly user pool. To do that, fetch the output of CognitoUserPoolArn in the deploy command, and get the value after the ”/”, which should be in the format of: `your-region\_xxxxx`.
```
`aws cognito-idp admin-create-user \\
--user-pool-id "your-region\_xxxxx" \\
--username johndoe@example.com \\
--user-attributes Name=email,Value=johndoe@example.com \\
--temporary-password "TempPassword123"`
```
Let’s now make sure we create a webpage/domain on which we can log-in. Go to AWS Cognito, select the newly created user pool & go to App Integration tab:
Create a Cognito Domain by clicking on “Domains” then “Create Cognito Domain”
Scroll down to `App client list` on the App Integration page of your User Pool:
Select your app client and edit the Hosted UI:
And add a callback URL, Authorization Scheme and OAuth scope:
*Note that you’ll come back to this step when ChatGPT will generate a callback URL for the authentication of your action. The postman URL, should be used only for development purpose.*
You can try this connection in Postman, under Authorization for your `\<api\_url\>`, copy/paste the value from AWS for the client\_id, client\_secret and the URL you set up for the auth domain, make sure to add `openid` in the scope to get a valid access\_token:
If you’re now doing the request on Postman, using the access\_token you just retrieve, you’ll get a success JSON returned:
## Create Action in ChatGPT
Now let’s integrate this into ChatGPT.
Create an action and copy paste the following spec:
```
`openapi: 3.1.0
info:
title: Success API
description: API that returns a success message.
version: 1.0.0
servers:
- url: https://3ho5n15aef.execute-api.us-east-1.amazonaws.com/Prod
description: Main production server
paths:
/my\_route:
post:
operationId: postSuccess
summary: Returns a success message.
description: Endpoint to check the success status.
responses:
'200':
description: A JSON object indicating success.
content:
application/json:
schema:
type: object
properties:
success:
type: boolean
example: true`
```
If you try to test the action (you can click the “Test” Button), you’ll see that you have a 401 as you’re not authenticated.
Let’s now add authentication in the action.
Click on Authentication \> OAuth.
We’ll now need to fetch AWS Cognito’s variables. Let’s go on your User Pool \> User Pool App Client. From there you can retrieve your client ID and client Secret.
Copy paste those values in ChatGPT. Now let’s add the Token URLs.
From your User Pool you’ll find the URL you’ve previously created for the hosted domain.
We’ll take this URL and append [AWS routes for OAuth](https://docs.aws.amazon.com/cognito/latest/developerguide/federation-endpoints.html).
* token: `\<your\_url\>/oauth2/token`
* authorization: `\<your\_url\>/oauth2/authorize`
Copy paste those in ChatGPT.
In scope, add openid and click on Save.
## Configure Cognito with ChatGPT URL
Now go back on your GPT (moving out of the action subview), and you’ll see a callback URL provided by ChatGPT for the Authentication:
Get this URL and edit the hosted UI of your User Pool App client & save the changes:
## Testing the function
You can now test this action again:
You will be redirected to AWS Cognito page, which you can log-in in using the credentials previously set-up.
If you now ask the GPT to run the same action, it will answer correctly as you’re now authenticated and able to run this function!
# Conclusion
You’ve now set-up an action in ChatGPT that can talk with your applications in AWS, in an authenticated way! This cookbook shows you how to create the Cognito Pool from scratch using username/password, though, we recommend to set-up Cognito based on your needs (for example by plugging your own IDP into Cognito).
Additionally, the function is not connected to any other services, which is the advantage of being able to communicate to an AWS Lambda function in a safe way. You can therefore tweak the code and AWS SAM template to fit your need. An example of a more complex function is Redshift, that follows those steps to create the function and authentication but has a different code/deployment.