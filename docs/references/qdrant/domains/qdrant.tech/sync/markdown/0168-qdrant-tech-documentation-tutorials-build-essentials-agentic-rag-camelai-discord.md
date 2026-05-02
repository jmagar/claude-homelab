Discord RAG Bot - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Essential Examples](https://qdrant.tech/documentation/tutorials-build-essentials/)
*
* Discord RAG Bot# Qdrant Agentic RAG Discord Bot with CAMEL-AI and OpenAI
|Time: 45 min|Level: Intermediate|[](https://colab.research.google.com/drive/1Ymqzm6ySoyVOekY7fteQBCFCXYiYyHxw#scrollTo=QQZXwzqmNfaS)||
Unlike traditional RAG techniques, which passively retrieve context and generate responses, **agentic RAG** involves active decision-making and multi-step reasoning by the chatbot. Instead of just fetching data, the chatbot makes decisions, dynamically interacts with various data sources, and adapts based on context, giving it a much more dynamic and intelligent approach.
In this tutorial, we’ll develop a fully functional chatbot using Qdrant, [CAMEL-AI](https://www.camel-ai.org/), and [OpenAI](https://openai.com/).
Let’s get started!
## Workflow Overview
Below is a high-level look at our Agentic RAG workflow:
|Step|Description|
|**1. Environment Setup**|Install required libraries (`camel-ai`, `qdrant-client`, `discord.py`) and set up the Python environment.|
|**2. Set Up the OpenAI Embedding Instance**|Create an OpenAI account, generate an API key, and configure the embedding model.|
|**3. Configure the Qdrant Client**|Sign up for Qdrant Cloud, create a cluster, configure `QdrantStorage`, and set up the API connection.|
|**4. Scrape and Process Data**|Use `VectorRetriever` to scrape Qdrant documentation, chunk text, and store embeddings in Qdrant.|
|**5. Set Up the CAMEL-AI ChatAgent**|Instantiate a CAMEL-AI `ChatAgent` with OpenAI models for multi-step reasoning and context-aware responses.|
|**6. Create and Configure the Discord Bot**|Register a new bot in the Discord Developer Portal, invite it to a server, and enable permissions.|
|**7. Build the Discord Bot**|Integrate Discord.py with CAMEL-AI and Qdrant to retrieve context and generate intelligent responses.|
|**8. Test the Bot**|Run the bot in a live Discord server and verify that it provides relevant, context-rich answers.|
## Architecture Diagram
Below is the architecture diagram representing the workflow and interactions of the chatbot:
The workflow starts by **scraping, chunking, and upserting** content from URLs using the `vector\_retriever.process()` method, which generates embeddings with the **OpenAI embedding instance**. These embeddings, along with their metadata, are then indexed and stored in **Qdrant** via the `QdrantStorage` class.
When a user sends a query through the **Discord bot**, it is processed by `vector\_retriever.query()`, which first embeds the query using **OpenAI Embeddings** and then retrieves the most relevant matches from Qdrant via `QdrantStorage`. The retrieved context (e.g., relevant documentation snippets) is then passed to an **OpenAI-powered Qdrant Agent** under **CAMEL-AI**, which generates a final, context-aware response.
The Qdrant Agent processes the retrieved vectors using the `GPT\_4O\_MINI` language model, producing a response that is contextually relevant to the user&rsquo;s query. This response is then sent back to the user through the **Discord bot**, completing the flow.
## **Step 1: Environment Setup**
Before diving into the implementation, here&rsquo;s a high-level overview of the stack we&rsquo;ll use:
|**Component**|**Purpose**|
|**Qdrant**|Vector database for storing and querying document embeddings.|
|**OpenAI**|Embedding and language model for generating vector representations and chatbot responses.|
|**CAMEL-AI**|Framework for managing dialogue flow, retrieval, and AI agent interactions.|
|**Discord API**|Platform for deploying and interacting with the chatbot.|
### Install Dependencies
We’ll install CAMEL-AI, which includes all necessary dependencies:
```
`!pip install camel-ai[all]==0.2.17
`
```
## **Step 2: Set Up the OpenAI Embedding Instance**
1. **Create an OpenAI Account**: Go to [OpenAI](https://platform.openai.com/signup) and sign up for an account if you don’t already have one.
2. **Generate an API Key**:
* After logging in, click on your profile icon in the top-right corner and select **API keys**.
* Click **Create new secret key**.
* Copy the generated API key and store it securely. You won’t be able to see it again.
Here’s how to set up the OpenAI client in your code:
Create a `.env` file in your project directory and add your API key:
```
`OPENAI\_API\_KEY=\<your\_openai\_api\_key\>
`
```
Make sure to replace `\<your\_openai\_api\_key\>` with your actual API key.
Now, start the OpenAI Client
```
`import openai
import os
from dotenv import load\_dotenv
load\_dotenv()
openai\_client = openai.Client(
api\_key=os.getenv("OPENAI\_API\_KEY")
)
`
```
To set up the embedding instance, we will use text embedding 3 large:
```
`from camel.embeddings import OpenAIEmbedding
from camel.types import EmbeddingModelType
embedding\_instance = OpenAIEmbedding(model\_type=EmbeddingModelType.TEXT\_EMBEDDING\_3\_LARGE)
`
```
## **Step 3: Configure the Qdrant Client**
For this tutorial, we will be using the **Qdrant Cloud Free Tier**. Here&rsquo;s how to set it up:
1. **Create an Account**: Sign up for a Qdrant Cloud account at [Qdrant Cloud](https://cloud.qdrant.io).
2. **Create a Cluster**:
* Navigate to the **Overview** section.
* Follow the onboarding instructions under **Create First Cluster** to set up your cluster.
* When you create the cluster, you will receive an **API Key**. Copy and securely store it, as you will need it later.
* **Wait for the Cluster to Provision**:
* Your new cluster will appear under the **Clusters** section.
After obtaining your Qdrant Cloud details, add to your `.env` file:
```
`QDRANT\_CLOUD\_URL=\<your-qdrant-cloud-url\>
QDRANT\_CLOUD\_API\_KEY=\<your-api-key\>
`
```
### Configure the QdrantStorage
The `QdrantStorage` will deal with connecting with the Qdrant Client for all necessary operations to your collection.
```
`from camel.retrievers import VectorRetriever
# Define collection name
collection\_name = "qdrant-agent"
storage\_instance = QdrantStorage(
vector\_dim=embedding\_instance.get\_output\_dim(),
url\_and\_api\_key=(
qdrant\_cloud\_url,
qdrant\_api\_key,
),
collection\_name=collection\_name,
)
`
```
Make sure to update the `\<your-qdrant-cloud-url\>` and `\<your-api-key\>` fields.
## **Step 4: Scrape and Process Data**
We&rsquo;ll use CamelAI `VectorRetriever` library to help us to It processes content from a file or URL, divides it into chunks, and stores the embeddings in the specified Qdrant collection.
```
`from camel.retrievers import VectorRetriever
vector\_retriever = VectorRetriever(embedding\_model=embedding\_instance,
storage=storage\_instance)
qdrant\_urls = [
"https://qdrant.tech/documentation/overview",
"/documentation/installation",
"/documentation/search/filtering",
"/documentation/manage-data/indexing",
"/documentation/distributed\_deployment",
"/documentation/manage-data/quantization"
# Add more URLs as needed
]
for qdrant\_url in qdrant\_urls:
vector\_retriever.process(
content=qdrant\_url,
)
`
```
## **Step 5: Setup the CAMEL-AI ChatAgent Instance**
Define the OpenAI model and create a CAMEL-AI ChatAgent instance.
```
`from camel.configs import ChatGPTConfig
from camel.models import ModelFactory
from camel.types import ModelPlatformType, ModelType
from camel.agents import ChatAgent
# Create a ChatGPT configuration
config = ChatGPTConfig(temperature=0.2).as\_dict()
# Create an OpenAI model using the configuration
openai\_model = ModelFactory.create(
model\_platform=ModelPlatformType.OPENAI,
model\_type=ModelType.GPT\_4O\_MINI,
model\_config\_dict=config,
)
assistant\_sys\_msg = """You are a helpful assistant to answer question,
I will give you the Original Query and Retrieved Context,
answer the Original Query based on the Retrieved Context,
if you can't answer the question just say I don't know."""
qdrant\_agent = ChatAgent(system\_message=assistant\_sys\_msg, model=openai\_model)
`
```
## **Step 6: Create and Configure the Discord Bot**
Now let&rsquo;s bring the bot to life! It will serve as the interface through which users can interact with the agentic RAG system you’ve built.
### Create a New Discord Bot
1. Go to the [Discord Developer Portal](https://discord.com/developers/applications) and log in with your Discord account.
2. Click on the **New Application** button.
3. Give your application a name and click **Create**.
4. Navigate to the **Bot** tab on the left sidebar and click **Add Bot**.
5. Once the bot is created, click **Reset Token** under the **Token** section to generate a new bot token. Copy this token securely as you will need it later.
### Invite the Bot to Your Server
1. Go to the **OAuth2** tab and then to the **URL Generator** section.
2. Under **Scopes**, select **bot**.
3. Under **Bot Permissions**, select the necessary permissions:
* Send Messages
* Read Message History
* Copy the generated URL and paste it into your browser.
* Select the server where you want to invite the bot and click **Authorize**.
### Grant the Bot Permissions
1. Go back to the **Bot** tab.
2. Enable the following under **Privileged Gateway Intents**:
* Server Members Intent
* Message Content Intent
Now, the bot is ready to be integrated with your code.
## **Step 7: Build the Discord Bot**
Add to your `.env` file:
```
`DISCORD\_BOT\_TOKEN=\<your-discord-bot-token\>
`
```
We&rsquo;ll use `discord.py` to create a simple Discord bot that interacts with users and retrieves context from Qdrant before responding.
```
`from camel.bots import DiscordApp
import nest\_asyncio
import discord
nest\_asyncio.apply()
discord\_q\_bot = DiscordApp(token=os.getenv("DISCORD\_BOT\_TOKEN"))
@discord\_q\_bot.client.event # triggers when a message is sent in the channel
async def on\_message(message: discord.Message):
if message.author == discord\_q\_bot.client.user:
return
if message.type != discord.MessageType.default:
return
if message.author.bot:
return
user\_input = message.content
retrieved\_info = vector\_retriever.query(
query=user\_input, top\_k=10, similarity\_threshold=0.6
)
user\_msg = str(retrieved\_info)
assistant\_response = qdrant\_agent.step(user\_msg)
response\_content = assistant\_response.msgs[0].content
if len(response\_content) \> 2000: # discord message length limit
for chunk in [response\_content[i:i+2000] for i in range(0, len(response\_content), 2000)]:
await message.channel.send(chunk)
else:
await message.channel.send(response\_content)
discord\_q\_bot.run()
`
```
## **Step 9: Test the Bot**
1. Invite your bot to your Discord server using the OAuth2 URL from the Discord Developer Portal.
2. Run the notebook.
3. Start chatting with the bot in your Discord server. It will retrieve context from Qdrant and provide relevant answers based on your queries.
## Conclusion
Nice work! You&rsquo;ve built an agentic RAG-powered Discord bot that retrieves relevant information with Qdrant, generates smart responses with OpenAI, and handles multi-step reasoning using CAMEL-AI. Here’s a quick recap:
* **Smart Knowledge Retrieval:** Your chatbot can now pull relevant info from large datasets using Qdrant’s vector search.
* **Autonomous Reasoning with CAMEL-AI:** Enables multi-step reasoning instead of just regurgitating text.
* **Live Discord Deployment:** You launched the chatbot on Discord, making it interactive and ready to help real users.
One of the biggest advantages of CAMEL-AI is the abstraction it provides, allowing you to focus on designing intelligent interactions rather than worrying about low-level implementation details.
You’re now well-equipped to tackle more complex real-world problems that require scalable, autonomous knowledge systems.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-build-essentials/agentic-rag-camelai-discord.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/tutorials-build-essentials/agentic-rag-camelai-discord/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/tutorials-build-essentials/agentic-rag-camelai-discord.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)