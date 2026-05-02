Azure Chat Completion models with your own data (preview)
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
Sep 11, 2023
# Azure Chat Completion models with your own data (preview)
[ KR ](https://github.com/kristapratico)
[ kristapratico ](https://github.com/kristapratico)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/azure/chat_with_your_own_data.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/azure/chat_with_your_own_data.ipynb)
This example shows how to use Azure OpenAI service models with your own data. The feature is currently in preview.
Azure OpenAI on your data enables you to run supported chat models such as GPT-3.5-Turbo and GPT-4 on your data without needing to train or fine-tune models. Running models on your data enables you to chat on top of, and analyze your data with greater accuracy and speed. One of the key benefits of Azure OpenAI on your data is its ability to tailor the content of conversational AI. Because the model has access to, and can reference specific sources to support its responses, answers are not only based on its pretrained knowledge but also on the latest information available in the designated data source. This grounding data also helps the model avoid generating responses based on outdated or incorrect information.
Azure OpenAI on your own data with Azure AI Search (f.k.a. Azure Cognitive Search) provides a customizable, pre-built solution for knowledge retrieval, from which a conversational AI application can be built. To see alternative methods for knowledge retrieval and semantic search, check out the cookbook examples for [vector databases](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases).
## How it works
[Azure OpenAI on your own data](https://learn.microsoft.com/azure/ai-services/openai/concepts/use-your-data) connects the model with your data, giving it the ability to retrieve and utilize data in a way that enhances the model’s output. Together with Azure AI Search, data is retrieved from designated data sources based on the user input and provided conversation history. The data is then augmented and resubmitted as a prompt to the model, giving the model contextual information it can use to generate a response.
See the [Data, privacy, and security for Azure OpenAI Service](https://learn.microsoft.com/legal/cognitive-services/openai/data-privacy?context=/azure/ai-services/openai/context/context) for more information.
## Prerequisites
To get started, we’ll cover a few prerequisites.
To properly access the Azure OpenAI Service, we need to create the proper resources at the [Azure Portal](https://portal.azure.com) (you can check a detailed guide on how to do this in the [Microsoft Docs](https://learn.microsoft.com/azure/cognitive-services/openai/how-to/create-resource?pivots=web-portal))
To use your own data with Azure OpenAI models, you will need:
1. Azure OpenAI access and a resource with a chat model deployed (for example, GPT-3 or GPT-4)
2. Azure AI Search (f.k.a. Azure Cognitive Search) resource
3. Azure Blob Storage resource
4. Your documents to be used as data (See [data source options](https://learn.microsoft.com/azure/ai-services/openai/concepts/use-your-data#data-source-options))
For a full walk-through on how to upload your documents to blob storage and create an index using the Azure AI Studio, see this [Quickstart](https://learn.microsoft.com/azure/ai-services/openai/use-your-data-quickstart?pivots=programming-language-studio&#x26;tabs=command-line).
## Setup
First, we install the necessary dependencies.
```
`! pip install "openai\>=1.0.0,\<2.0.0"
! pip install python-dotenv`
```
In this example, we’ll use `dotenv` to load our environment variables. To connect with Azure OpenAI and the Search index, the following variables should be added to a `.env` file in `KEY=VALUE` format:
* `AZURE\_OPENAI\_ENDPOINT` - the Azure OpenAI endpoint. This can be found under “Keys and Endpoints” for your Azure OpenAI resource in the Azure Portal.
* `AZURE\_OPENAI\_API\_KEY` - the Azure OpenAI API key. This can be found under “Keys and Endpoints” for your Azure OpenAI resource in the Azure Portal. Omit if using Azure Active Directory authentication (see below `Authentication using Microsoft Active Directory`)
* `SEARCH\_ENDPOINT` - the AI Search endpoint. This URL be found on the “Overview” of your Search resource on the Azure Portal.
* `SEARCH\_KEY` - the AI Search API key. Found under “Keys” for your Search resource in the Azure Portal.
* `SEARCH\_INDEX\_NAME` - the name of the index you created with your own data.
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
# set the deployment name for the model we want to use
deployment = "\<deployment-id-of-the-model-to-use\>"
client = openai.AzureOpenAI(
base\_url=f"{endpoint}/openai/deployments/{deployment}/extensions",
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
# set the deployment name for the model we want to use
deployment = "\<deployment-id-of-the-model-to-use\>"
client = openai.AzureOpenAI(
base\_url=f"{endpoint}/openai/deployments/{deployment}/extensions",
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
## Chat completion model with your own data
### Setting the context
In this example, we want our model to base its responses on Azure AI services documentation data. Following the [Quickstart](https://learn.microsoft.com/azure/ai-services/openai/use-your-data-quickstart?tabs=command-line&#x26;pivots=programming-language-studio) shared previously, we have added the [markdown](https://github.com/MicrosoftDocs/azure-docs/blob/main/articles/ai-services/cognitive-services-and-machine-learning.md) file for the [Azure AI services and machine learning](https://learn.microsoft.com/azure/ai-services/cognitive-services-and-machine-learning) documentation page to our search index. The model is now ready to answer questions about Azure AI services and machine learning.
### Code
Now we can use Azure on your own data with Chat Completions. Providing our search endpoint, key, and index name in `dataSources`, any questions posed to the model will now be grounded in our own data. An additional property, `context`, will be provided in the response to show the data the model referenced to answer the question.
```
`completion = client.chat.completions.create(
messages=[{"role": "user", "content": "What are the differences between Azure Machine Learning and Azure AI services?"}],
model=deployment,
extra\_body={
"dataSources": [
{
"type": "AzureCognitiveSearch",
"parameters": {
"endpoint": os.environ["SEARCH\_ENDPOINT"],
"key": os.environ["SEARCH\_KEY"],
"indexName": os.environ["SEARCH\_INDEX\_NAME"],
}
}
]
}
)
print(f"{completion.choices[0].message.role}: {completion.choices[0].message.content}")
# `context` is in the model\_extra for Azure
print(f"\\nContext: {completion.choices[0].message.model\_extra['context']['messages'][0]['content']}")`
```
If you would prefer to stream the response from the model, you can pass the `stream=True` keyword argument:
```
`response = client.chat.completions.create(
messages=[{"role": "user", "content": "What are the differences between Azure Machine Learning and Azure AI services?"}],
model=deployment,
extra\_body={
"dataSources": [
{
"type": "AzureCognitiveSearch",
"parameters": {
"endpoint": os.environ["SEARCH\_ENDPOINT"],
"key": os.environ["SEARCH\_KEY"],
"indexName": os.environ["SEARCH\_INDEX\_NAME"],
}
}
]
},
stream=True,
)
for chunk in response:
delta = chunk.choices[0].delta
if delta.role:
print("\\n"+ delta.role + ": ", end="", flush=True)
if delta.content:
print(delta.content, end="", flush=True)
if delta.model\_extra.get("context"):
print(f"Context: {delta.model\_extra['context']}", end="", flush=True)`
```