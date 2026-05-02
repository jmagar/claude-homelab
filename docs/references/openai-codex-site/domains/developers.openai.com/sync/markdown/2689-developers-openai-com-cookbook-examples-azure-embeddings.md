Azure embeddings example
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
Jul 12, 2022
# Azure embeddings example
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)[ CM ](https://github.com/cmurtz-msft)[ GL ](https://github.com/glecaros)[ KR ](https://github.com/kristapratico)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ cmurtz-msft , ](https://github.com/cmurtz-msft)[ glecaros , ](https://github.com/glecaros)[ kristapratico ](https://github.com/kristapratico)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/azure/embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/azure/embeddings.ipynb)
This example will cover embeddings using the Azure OpenAI service.
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
In this section we are going to create a deployment of a model that we can use to create embeddings.
### Deployments: Create in the Azure OpenAI Studio
Let’s deploy a model to use with embeddings. Go to [https://portal.azure.com](https://portal.azure.com), find your Azure OpenAI resource, and then navigate to the Azure OpenAI Studio. Click on the “Deployments” tab and then create a deployment for the model you want to use for embeddings. The deployment name that you give the model will be used in the code below.
```
`deployment = "" # Fill in the deployment name from the portal here`
```
## Embeddings
Now let’s create embeddings using the client we built.
```
`embeddings = client.embeddings.create(
model=deployment,
input="The food was delicious and the waiter..."
)
print(embeddings)`
```