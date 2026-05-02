Azure functions example
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
Jul 21, 2023
# Azure functions example
[ KR ](https://github.com/kristapratico)
[ kristapratico ](https://github.com/kristapratico)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/azure/functions.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/azure/functions.ipynb)
This notebook shows how to use the function calling capability with the Azure OpenAI service. Functions allow a caller of chat completions to define capabilities that the model can use to extend its
functionality into external tools and data sources.
You can read more about chat functions on OpenAI’s blog: [https://openai.com/blog/function-calling-and-other-api-updates](https://openai.com/blog/function-calling-and-other-api-updates)
**NOTE**: Chat functions require model versions beginning with gpt-4 and gpt-35-turbo’s `-0613` labels. They are not supported by older versions of the models.
## Setup
First, we install the necessary dependencies and import the libraries we will be using.
```
`! pip install "openai\>=1.0.0,\<2.0.0"
! pip install python-dotenv`
```
```
`import os
import openai
import dotenv
dotenv.load\_dotenv()`
```
### Authentication
The Azure OpenAI service supports multiple authentication mechanisms that include API keys and Azure Active Directory token credentials.
```
`use\_azure\_active\_directory = False # Set this flag to True if you are using Azure Active Directory`
```
#### Authentication using API key
To set up the OpenAI SDK to use an *Azure API Key*, we need to set `api\_key` to a key associated with your endpoint (you can find this key in *“Keys and Endpoints”* under *“Resource Management”* in the [Azure Portal](https://portal.azure.com)). You’ll also find the endpoint for your resource here.
```
`if not use\_azure\_active\_directory:
endpoint = os.environ["AZURE\_OPENAI\_ENDPOINT"]
api\_key = os.environ["AZURE\_OPENAI\_API\_KEY"]
client = openai.AzureOpenAI(
azure\_endpoint=endpoint,
api\_key=api\_key,
api\_version="2023-09-01-preview"
)`
```
#### Authentication using Azure Active Directory
Let’s now see how we can authenticate via Azure Active Directory. We’ll start by installing the `azure-identity` library. This library will provide the token credentials we need to authenticate and help us build a token credential provider through the `get\_bearer\_token\_provider` helper function. It’s recommended to use `get\_bearer\_token\_provider` over providing a static token to `AzureOpenAI` because this API will automatically cache and refresh tokens for you.
For more information on how to set up Azure Active Directory authentication with Azure OpenAI, see the [documentation](https://learn.microsoft.com/azure/ai-services/openai/how-to/managed-identity).
```
`! pip install "azure-identity\>=1.15.0"`
```
```
`from azure.identity import DefaultAzureCredential, get\_bearer\_token\_provider
if use\_azure\_active\_directory:
endpoint = os.environ["AZURE\_OPENAI\_ENDPOINT"]
api\_key = os.environ["AZURE\_OPENAI\_API\_KEY"]
client = openai.AzureOpenAI(
azure\_endpoint=endpoint,
azure\_ad\_token\_provider=get\_bearer\_token\_provider(DefaultAzureCredential(), "https://cognitiveservices.azure.com/.default"),
api\_version="2023-09-01-preview"
)`
```
>
> Note: the AzureOpenAI infers the following arguments from their corresponding environment variables if they are not provided:
>
* `api\_key` from `AZURE\_OPENAI\_API\_KEY`
* `azure\_ad\_token` from `AZURE\_OPENAI\_AD\_TOKEN`
* `api\_version` from `OPENAI\_API\_VERSION`
* `azure\_endpoint` from `AZURE\_OPENAI\_ENDPOINT`
## Deployments
In this section we are going to create a deployment of a GPT model that we can use to call functions.
### Deployments: Create in the Azure OpenAI Studio
Let’s deploy a model to use with chat completions. Go to [https://portal.azure.com](https://portal.azure.com), find your Azure OpenAI resource, and then navigate to the Azure OpenAI Studio. Click on the “Deployments” tab and then create a deployment for the model you want to use for chat completions. The deployment name that you give the model will be used in the code below.
```
`deployment = "" # Fill in the deployment name from the portal here`
```
## Functions
With setup and authentication complete, you can now use functions with the Azure OpenAI service. This will be split into a few steps:
1. Define the function(s)
2. Pass function definition(s) into chat completions API
3. Call function with arguments from the response
4. Feed function response back into chat completions API
#### 1. Define the function(s)
A list of functions can be defined, each containing the name of the function, an optional description, and the parameters the function accepts (described as a JSON schema).
```
`functions = [
{
"name": "get\_current\_weather",
"description": "Get the current weather",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA",
},
"format": {
"type": "string",
"enum": ["celsius", "fahrenheit"],
"description": "The temperature unit to use. Infer this from the users location.",
},
},
"required": ["location"],
},
}
]`
```
#### 2. Pass function definition(s) into chat completions API
Now we can pass the function into the chat completions API. If the model determines it should call the function, a `finish\_reason` of “tool\_calls” will be populated on the choice and the details of which function to call and its arguments will be present in the `message`. Optionally, you can set the `tool\_choice` keyword argument to force the model to call a particular function (e.g. `{"type": "function", "function": {"name": get\_current\_weather}}`). By default, this is set to `auto`, allowing the model to choose whether to call the function or not.
```
`messages = [
{"role": "system", "content": "Don't make assumptions about what values to plug into functions. Ask for clarification if a user request is ambiguous."},
{"role": "user", "content": "What's the weather like today in Seattle?"}
]
chat\_completion = client.chat.completions.create(
model=deployment,
messages=messages,
tools=functions,
)
print(chat\_completion)`
```
#### 3. Call function with arguments from the response
The name of the function call will be one that was provided initially and the arguments will include JSON matching the schema included in the function definition.
```
`import json
def get\_current\_weather(request):
"""
This function is for illustrative purposes.
The location and unit should be used to determine weather
instead of returning a hardcoded response.
"""
location = request.get("location")
unit = request.get("unit")
return {"temperature": "22", "unit": "celsius", "description": "Sunny"}
function\_call = chat\_completion.choices[0].message.tool\_calls[0].function
print(function\_call.name)
print(function\_call.arguments)
if function\_call.name == "get\_current\_weather":
response = get\_current\_weather(json.loads(function\_call.arguments))`
```
#### 4. Feed function response back into chat completions API
The response from the function should be serialized into a new message with the role set to “function”. Now the model will use the response data to formulate its answer.
```
`messages.append(
{
"role": "function",
"name": "get\_current\_weather",
"content": json.dumps(response)
}
)
function\_completion = client.chat.completions.create(
model=deployment,
messages=messages,
tools=functions,
)
print(function\_completion.choices[0].message.content.strip())`
```