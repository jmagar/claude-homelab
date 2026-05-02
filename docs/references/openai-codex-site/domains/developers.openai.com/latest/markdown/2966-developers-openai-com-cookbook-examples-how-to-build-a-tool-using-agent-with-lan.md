How to build a tool-using agent with LangChain
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
May 2, 2023
# How to build a tool-using agent with LangChain
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_build_a_tool-using_agent_with_Langchain.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_build_a_tool-using_agent_with_Langchain.ipynb)
This notebook takes you through how to use LangChain to augment an OpenAI model with access to external tools. In particular, you’ll be able to create LLM agents that use custom tools to answer user queries.
## What is Langchain?
[LangChain](https://python.langchain.com/en/latest/index.html) is a framework for developing applications powered by language models. Their framework enables you to build layered LLM-powered applications that are context-aware and able to interact dynamically with their environment as agents, leading to simplified code for you and a more dynamic user experience for your customers.
## Why do LLMs need to use Tools?
One of the most common challenges with LLMs is overcoming the lack of recency and specificity in their training data - answers can be out of date, and they are prone to hallucinations given the huge variety in their knowledge base. Tools are a great method of allowing an LLM to answer within a controlled context that draws on your existing knowledge bases and internal APIs - instead of trying to prompt engineer the LLM all the way to your intended answer, you allow it access to tools that it calls on dynamically for info, parses, and serves to customer.
Providing LLMs access to tools can enable them to answer questions with context directly from search engines, APIs or your own databases. Instead of answering directly, an LLM with access to tools can perform intermediate steps to gather relevant information. Tools can also be used in combination. [For example](https://python.langchain.com/en/latest/modules/agents/agents/examples/mrkl_chat.html), a language model can be made to use a search tool to lookup quantitative information and a calculator to execute calculations.
## Notebook Sections
* **Setup:** Import packages and connect to a Pinecone vector database.
* **LLM Agent:** Build an agent that leverages a modified version of the [ReAct](https://react-lm.github.io/) framework to do chain-of-thought reasoning.
* **LLM Agent with History:** Provide the LLM with access to previous steps in the conversation.
* **Knowledge Base:** Create a knowledge base of “Stuff You Should Know” podcast episodes, to be accessed through a tool.
* **LLM Agent with Tools:** Extend the agent with access to multiple tools and test that it uses them to answer questions.
```
`%load\_ext autoreload
%autoreload 2`
```
```
`The autoreload extension is already loaded. To reload it, use:
%reload\_ext autoreload`
```
# Setup
Import libraries and set up a connection to a [Pinecone](https://www.pinecone.io) vector database.
You can substitute Pinecone for any other vectorstore or database - there are a [selection](https://python.langchain.com/en/latest/modules/indexes/vectorstores.html) that are supported by Langchain natively, while other connectors will need to be developed yourself.
```
`!pip install openai
!pip install pinecone-client
!pip install pandas
!pip install typing
!pip install tqdm
!pip install langchain
!pip install wget`
```
```
`import datetime
import json
import openai
import os
import pandas as pd
import pinecone
import re
from tqdm.auto import tqdm
from typing import List, Union
import zipfile
# Langchain imports
from langchain.agents import Tool, AgentExecutor, LLMSingleActionAgent, AgentOutputParser
from langchain.prompts import BaseChatPromptTemplate, ChatPromptTemplate
from langchain import SerpAPIWrapper, LLMChain
from langchain.schema import AgentAction, AgentFinish, HumanMessage, SystemMessage
# LLM wrapper
from langchain.chat\_models import ChatOpenAI
from langchain import OpenAI
# Conversational memory
from langchain.memory import ConversationBufferWindowMemory
# Embeddings and vectorstore
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import Pinecone
# Vectorstore Index
index\_name = 'podcasts'`
```
For acquiring an API key to connect with Pinecone, you can set up a [free account](https://app.pinecone.io/) and store it in the `api\_key` variable below or in your environment variables under `PINECONE\_API\_KEY`
```
`api\_key = os.getenv("PINECONE\_API\_KEY") or "PINECONE\_API\_KEY"
# find environment next to your API key in the Pinecone console
env = os.getenv("PINECONE\_ENVIRONMENT") or "PINECONE\_ENVIRONMENT"
pinecone.init(api\_key=api\_key, environment=env)
pinecone.whoami()`
```
```
`pinecone.list\_indexes()`
```
```
`['podcasts']`
```
Run this code block if you want to clear the index, or if the index doesn’t exist yet
```
`# Check whether the index with the same name already exists - if so, delete it
if index\_name in pinecone.list\_indexes():
pinecone.delete\_index(index\_name)
# Creates new index
pinecone.create\_index(name=index\_name, dimension=1536)
index = pinecone.Index(index\_name=index\_name)
# Confirm our index was created
pinecone.list\_indexes()`
```
## LLM Agent
An [LLM agent](https://python.langchain.com/docs/modules/agents/) in Langchain has many configurable components, which are detailed in the Langchain documentation.
We’ll employ a few of the core concepts to make an agent that talks in the way we want, can use tools to answer questions, and uses the appropriate language model to power the conversation.
* **Prompt Template:** The input template to control the LLM’s behaviour and how it accepts inputs and produces outputs - this is the brain that drives your application ([docs](https://python.langchain.com/en/latest/modules/prompts/prompt_templates.html)).
* **Output Parser:** A method of parsing the output from the prompt. If the LLM produces output using certain headers, you can enable complex interactions where variables are generated by the LLM in their response and passed into the next step of the chain ([docs](https://python.langchain.com/en/latest/modules/prompts/output_parsers.html)).
* **LLM Chain:** A Chain brings together a prompt template with an LLM that will execute it - in this case we’ll be using `gpt-3.5-turbo` but this framework can be used with OpenAI completions models, or other LLMs entirely ([docs](https://python.langchain.com/en/latest/modules/chains.html)).
* **Tool:** An external service that the LLM can use to retrieve information or execute commands should the user require it ([docs](https://python.langchain.com/en/latest/modules/agents/tools.html)).
* **Agent:** The glue that brings all of this together, an agent can call multiple LLM Chains, each with their own tools. Agents can be extended with your own logic to allow retries, error handling and any other methods you choose to add reliability to your application ([docs](https://python.langchain.com/en/latest/modules/agents.html)).
**NB:** Before using this cookbook with the Search tool you’ll need to sign up on [https://serpapi.com/](https://serpapi.com/) and generate an API key. Once you have it, store it in an environment variable named `SERPAPI\_API\_KEY`
```
`# Initiate a Search tool - note you'll need to have set SERPAPI\_API\_KEY as an environment variable as per the above instructions
search = SerpAPIWrapper()
# Define a list of tools
tools = [
Tool(
name = "Search",
func=search.run,
description="useful for when you need to answer questions about current events"
)
]`
```
```
`# Set up the prompt with input variables for tools, user input and a scratchpad for the model to record its workings
template = """Answer the following questions as best you can, but speaking as a pirate might speak. You have access to the following tools:
{tools}
Use the following format:
Question: the input question you must answer
Thought: you should always think about what to do
Action: the action to take, should be one of [{tool\_names}]
Action Input: the input to the action
Observation: the result of the action
... (this Thought/Action/Action Input/Observation can repeat N times)
Thought: I now know the final answer
Final Answer: the final answer to the original input question
Begin! Remember to speak as a pirate when giving your final answer. Use lots of "Arg"s
Question: {input}
{agent\_scratchpad}"""`
```
```
`# Set up a prompt template
class CustomPromptTemplate(BaseChatPromptTemplate):
# The template to use
template: str
# The list of tools available
tools: List[Tool]
def format\_messages(self, \*\*kwargs) -\> str:
# Get the intermediate steps (AgentAction, Observation tuples)
# Format them in a particular way
intermediate\_steps = kwargs.pop("intermediate\_steps")
thoughts = ""
for action, observation in intermediate\_steps:
thoughts += action.log
thoughts += f"\\nObservation: {observation}\\nThought: "
# Set the agent\_scratchpad variable to that value
kwargs["agent\_scratchpad"] = thoughts
# Create a tools variable from the list of tools provided
kwargs["tools"] = "\\n".join([f"{tool.name}: {tool.description}" for tool in self.tools])
# Create a list of tool names for the tools provided
kwargs["tool\_names"] = ", ".join([tool.name for tool in self.tools])
formatted = self.template.format(\*\*kwargs)
return [HumanMessage(content=formatted)]
prompt = CustomPromptTemplate(
template=template,
tools=tools,
# This omits the `agent\_scratchpad`, `tools`, and `tool\_names` variables because those are generated dynamically
# This includes the `intermediate\_steps` variable because that is needed
input\_variables=["input", "intermediate\_steps"]
)`
```
```
`class CustomOutputParser(AgentOutputParser):
def parse(self, llm\_output: str) -\> Union[AgentAction, AgentFinish]:
# Check if agent should finish
if "Final Answer:" in llm\_output:
return AgentFinish(
# Return values is generally always a dictionary with a single `output` key
# It is not recommended to try anything else at the moment :)
return\_values={"output": llm\_output.split("Final Answer:")[-1].strip()},
log=llm\_output,
)
# Parse out the action and action input
regex = r"Action: (.\*?)[\\n]\*Action Input:[\\s]\*(.\*)"
match = re.search(regex, llm\_output, re.DOTALL)
# If it can't parse the output it raises an error
# You can add your own logic here to handle errors in a different way i.e. pass to a human, give a canned response
if not match:
raise ValueError(f"Could not parse LLM output: `{llm\_output}`")
action = match.group(1).strip()
action\_input = match.group(2)
# Return the action and action input
return AgentAction(tool=action, tool\_input=action\_input.strip(" ").strip('"'), log=llm\_output)
output\_parser = CustomOutputParser()`
```
```
`# Initiate our LLM - default is 'gpt-3.5-turbo'
llm = ChatOpenAI(temperature=0)
# LLM chain consisting of the LLM and a prompt
llm\_chain = LLMChain(llm=llm, prompt=prompt)
# Using tools, the LLM chain and output\_parser to make an agent
tool\_names = [tool.name for tool in tools]
agent = LLMSingleActionAgent(
llm\_chain=llm\_chain,
output\_parser=output\_parser,
# We use "Observation" as our stop sequence so it will stop when it receives Tool output
# If you change your prompt template you'll need to adjust this as well
stop=["\\nObservation:"],
allowed\_tools=tool\_names
)`
```
```
`# Initiate the agent that will respond to our queries
# Set verbose=True to share the CoT reasoning the LLM goes through
agent\_executor = AgentExecutor.from\_agent\_and\_tools(agent=agent, tools=tools, verbose=True)`
```
```
`agent\_executor.run("How many people live in canada as of 2023?")`
```
```
`
[1m\> Entering new AgentExecutor chain...[0m
[32;1m[1;3mThought: Hmm, I be not sure of the answer to that one. Let me think.
Action: Search
Action Input: "Canada population 2023"[0m
Observation:[36;1m[1;3m39,566,248[0m[32;1m[1;3mAhoy, that be a lot of people! But I need to make sure this be true.
Action: Search
Action Input: "Canada population 2023 official source"[0m
Observation:[36;1m[1;3mThe current population of Canada is 38,664,637 as of Wednesday, April 19, 2023, based on Worldometer elaboration of the latest United Nations data.[0m[32;1m[1;3mArrr, that be the official number! I be confident in me answer now.
Final Answer: The population of Canada as of 2023 is 38,664,637. Arg![0m
[1m\> Finished chain.[0m`
```
```
`'The population of Canada as of 2023 is 38,664,637. Arg!'`
```
```
`agent\_executor.run("How many in 2022?")`
```
```
`
[1m\> Entering new AgentExecutor chain...[0m
[32;1m[1;3mThought: Hmm, I'm not sure what this question is asking about. I better use the search tool.
Action: Search
Action Input: "2022 events"[0m
Observation:[36;1m[1;3m8. Humanitarian Crises Deepen · 7. Latin America Moves Left. · 6. Iranians Protest. · 5. COVID Eases. · 4. Inflation Returns. · 3. Climate Change ...[0m[32;1m[1;3mAhoy, it looks like this be a question about what be happenin' in 2022. Let me search again.
Action: Search
Action Input: "2022 calendar"[0m
Observation:[36;1m[1;3mUnited States 2022 – Calendar with American holidays. Yearly calendar showing months for the year 2022. Calendars – online and print friendly – for any year ...[0m[32;1m[1;3mShiver me timbers, it looks like this be a question about the year 2022. Let me search one more time.
Action: Search
Action Input: "What be happenin' in 2022?"[0m
Observation:[36;1m[1;3m8. Humanitarian Crises Deepen · 7. Latin America Moves Left. · 6. Iranians Protest. · 5. COVID Eases. · 4. Inflation Returns. · 3. Climate Change ...[0m[32;1m[1;3mAvast ye, it looks like the same results be comin' up. I reckon there be no clear answer to this question.
Final Answer: Arg, I be sorry matey, but I can't give ye a clear answer to that question.[0m
[1m\> Finished chain.[0m`
```
```
`"Arg, I be sorry matey, but I can't give ye a clear answer to that question."`
```
## LLM Agent with History
Extend the LLM Agent with the ability to retain a [memory](https://python.langchain.com/en/latest/modules/agents/agents/custom_llm_agent.html#adding-memory) and use it as context as it continues the conversation.
We use a simple `ConversationBufferWindowMemory` for this example that keeps a rolling window of the last two conversation turns. LangChain has other [memory options](https://python.langchain.com/en/latest/modules/memory.html), with different tradeoffs suitable for different use cases.
```
`# Set up a prompt template which can interpolate the history
template\_with\_history = """You are SearchGPT, a professional search engine who provides informative answers to users. Answer the following questions as best you can. You have access to the following tools:
{tools}
Use the following format:
Question: the input question you must answer
Thought: you should always think about what to do
Action: the action to take, should be one of [{tool\_names}]
Action Input: the input to the action
Observation: the result of the action
... (this Thought/Action/Action Input/Observation can repeat N times)
Thought: I now know the final answer
Final Answer: the final answer to the original input question
Begin! Remember to give detailed, informative answers
Previous conversation history:
{history}
New question: {input}
{agent\_scratchpad}"""`
```
```
`prompt\_with\_history = CustomPromptTemplate(
template=template\_with\_history,
tools=tools,
# The history template includes "history" as an input variable so we can interpolate it into the prompt
input\_variables=["input", "intermediate\_steps", "history"]
)
llm\_chain = LLMChain(llm=llm, prompt=prompt\_with\_history)
tool\_names = [tool.name for tool in tools]
agent = LLMSingleActionAgent(
llm\_chain=llm\_chain,
output\_parser=output\_parser,
stop=["\\nObservation:"],
allowed\_tools=tool\_names
)`
```
```
`# Initiate the memory with k=2 to keep the last two turns
# Provide the memory to the agent
memory = ConversationBufferWindowMemory(k=2)
agent\_executor = AgentExecutor.from\_agent\_and\_tools(agent=agent, tools=tools, verbose=True, memory=memory)`
```
```
`agent\_executor.run("How many people live in canada as of 2023?")`
```
```
`
[1m\> Entering new AgentExecutor chain...[0m
[32;1m[1;3mThought: I need to find the most recent population data for Canada.
Action: Search
Action Input: "Canada population 2023"[0m
Observation:[36;1m[1;3m39,566,248[0m[32;1m[1;3mThis data seems reliable, but I should double-check the source.
Action: Search
Action Input: "Source of Canada population 2023"[0m
Observation:[36;1m[1;3mThe current population of Canada is 38,664,637 as of Wednesday, April 19, 2023, based on Worldometer elaboration of the latest United Nations data. Canada 2020 population is estimated at 37,742,154 people at mid year according to UN data. Canada population is equivalent to 0.48% of the total world population.[0m[32;1m[1;3mI now know the final answer
Final Answer: As of April 19, 2023, the population of Canada is 38,664,637.[0m
[1m\> Finished chain.[0m`
```
```
`'As of April 19, 2023, the population of Canada is 38,664,637.'`
```
```
`agent\_executor.run("how about in mexico?")`
```
```
`
[1m\> Entering new AgentExecutor chain...[0m
[32;1m[1;3mThought: I need to search for the current population of Mexico.
Action: Search
Action Input: "current population of Mexico"[0m
Observation:[36;1m[1;3mMexico, officially the United Mexican States, is a country in the southern portion of North America. It is bordered to the north by the United States; to the south and west by the Pacific Ocean; to the southeast by Guatemala, Belize, and the Caribbean Sea; and to the east by the Gulf of Mexico.[0m[32;1m[1;3mThat's not the answer to the question, I need to refine my search.
Action: Search
Action Input: "population of Mexico 2023"[0m
Observation:[36;1m[1;3m132,709,512[0m[32;1m[1;3mI now know the final answer.
Final Answer: As of 2023, the population of Mexico is 132,709,512.[0m
[1m\> Finished chain.[0m`
```
```
`'As of 2023, the population of Mexico is 132,709,512.'`
```
## Knowledge base
Create a custom vectorstore for the Agent to use as a tool to answer questions with. We’ll store the results in [Pinecone](https://docs.pinecone.io/docs/quickstart), which is supported by LangChain ([Docs](https://python.langchain.com/en/latest/modules/indexes/vectorstores/examples/pinecone.html), [API reference](https://python.langchain.com/en/latest/reference/modules/vectorstore.html)). For help getting started with Pinecone or other vector databases, we have a [cookbook](https://github.com/openai/openai-cookbook/blob/colin/examples/vector_databases/Using_vector_databases_for_embeddings_search.ipynb) to help you get started.
You can check the LangChain documentation to see what other [vectorstores](https://python.langchain.com/en/latest/modules/indexes/vectorstores.html) and [databases](https://python.langchain.com/en/latest/modules/chains/examples/sqlite.html) are available.
For this example we’ll use the transcripts of the Stuff You Should Know podcast, which was provided thanks to OSF DOI [10.17605/OSF.IO/VM9NT](https://doi.org/10.17605/OSF.IO/VM9NT)
```
`import wget
# Here is a URL to a zip archive containing the transcribed podcasts
# Note that this data has already been split into chunks and embeddings from OpenAI's `text-embedding-3-small` embedding model are included
content\_url = 'https://cdn.openai.com/API/examples/data/sysk\_podcast\_transcripts\_embedded.json.zip'
# Download the file (it is \~541 MB so this will take some time)
wget.download(content\_url)`
```
```
`100% [......................................................................] 571275039 / 571275039`
```
```
`'sysk\_podcast\_transcripts\_embedded.json.zip'`
```
```
`# Load podcasts
with zipfile.ZipFile("sysk\_podcast\_transcripts\_embedded.json.zip","r") as zip\_ref:
zip\_ref.extractall("./data")
f = open('./data/sysk\_podcast\_transcripts\_embedded.json')
processed\_podcasts = json.load(f)`
```
```
`# Have a look at the contents
pd.DataFrame(processed\_podcasts).head()`
```
||id|filename|title|url|text\_chunk|embedding|cleaned\_id|
|0|sysk\_with\_transcripts\_SYSK Selects How Crime S...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|\\n\\nSYSK Selects How Crime Scene Cleanup Works|https://chtbl.com/track/5899E/podtrac.com/pts/...|Title: sysk\_with\_transcripts\_SYSK Selects How ...|[0.021279960870742798, -0.005817972123622894, ...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|
|1|sysk\_with\_transcripts\_SYSK Selects How Crime S...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|\\n\\nSYSK Selects How Crime Scene Cleanup Works|https://chtbl.com/track/5899E/podtrac.com/pts/...|Title: sysk\_with\_transcripts\_SYSK Selects How ...|[0.013859338127076626, 0.00857278611510992, 0....|sysk\_with\_transcripts\_SYSK Selects How Crime S...|
|2|sysk\_with\_transcripts\_SYSK Selects How Crime S...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|\\n\\nSYSK Selects How Crime Scene Cleanup Works|https://chtbl.com/track/5899E/podtrac.com/pts/...|Title: sysk\_with\_transcripts\_SYSK Selects How ...|[0.015242221765220165, 0.016030369326472282, 0...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|
|3|sysk\_with\_transcripts\_SYSK Selects How Crime S...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|\\n\\nSYSK Selects How Crime Scene Cleanup Works|https://chtbl.com/track/5899E/podtrac.com/pts/...|Title: sysk\_with\_transcripts\_SYSK Selects How ...|[0.004371842369437218, -0.003036574460566044, ...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|
|4|sysk\_with\_transcripts\_SYSK Selects How Crime S...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|\\n\\nSYSK Selects How Crime Scene Cleanup Works|https://chtbl.com/track/5899E/podtrac.com/pts/...|Title: sysk\_with\_transcripts\_SYSK Selects How ...|[0.017309172078967094, 0.015154214575886726, 0...|sysk\_with\_transcripts\_SYSK Selects How Crime S...|
```
`# Add the text embeddings to Pinecone
batch\_size = 100 # how many embeddings we create and insert at once
for i in tqdm(range(0, len(processed\_podcasts), batch\_size)):
# find end of batch
i\_end = min(len(processed\_podcasts), i+batch\_size)
meta\_batch = processed\_podcasts[i:i\_end]
# get ids
ids\_batch = [x['cleaned\_id'] for x in meta\_batch]
# get texts to encode
texts = [x['text\_chunk'] for x in meta\_batch]
# add embeddings
embeds = [x['embedding'] for x in meta\_batch]
# cleanup metadata
meta\_batch = [{
'filename': x['filename'],
'title': x['title'],
'text\_chunk': x['text\_chunk'],
'url': x['url']
} for x in meta\_batch]
to\_upsert = list(zip(ids\_batch, embeds, meta\_batch))
# upsert to Pinecone
index.upsert(vectors=to\_upsert)`
```
```
`# Configuring the embeddings to be used by our retriever to be OpenAI Embeddings, matching our embedded corpus
embeddings = OpenAIEmbeddings()
# Loads a docsearch object from an existing Pinecone index so we can retrieve from it
docsearch = Pinecone.from\_existing\_index(index\_name,embeddings,text\_key='text\_chunk')`
```
```
`retriever = docsearch.as\_retriever()`
```
```
`query\_docs = retriever.get\_relevant\_documents("can you live without a bank account")`
```
```
`# Print out the title and content for the most relevant retrieved documents
print("\\n".join(['Title: ' + x.metadata['title'].strip() + '\\n\\n' + x.page\_content + '\\n\\n' for x in query\_docs]))`
```
```
`Title: sysk: Can You Live Without a Bank Account?
Title: sysk\_with\_transcripts\_Can you live without a bank account.json; And if you had a life, you didn't necessarily rectify your bank checkbook every day. Oh, wait, what is balancing a checkbook mean? Seriously? Yeah. Thank God for my wife. So another reason you might avoid a bank is philosophically. There may be a longstanding distrust of banks in your family that you don't want to put your money in, or you may just want to be like, you know what? I don't want to take part in this modern society. I want to kind of drop out a bit. And a really good first move is to shut your bank account down. That's a big statement. Oh, yeah, it is. But a lot of people that are underbanked and don't have accounts aren't there on purpose. It's not some philosophical statement. A lot of times it's simply because they are poor and they don't have a lot of alternatives. Yeah. And the other thing about not having a bank account, not only do you not have a bank account, you also are, like, basically just avoiding banks altogether. There's plenty of other things that banks offer, like loans and mortgage, lollipops, stuff like that. Yeah. Maybe some free nasty coffee. So when you don't have a banking account, that's like the most basic unit of the banking world. Right. If you don't have that, you obviously aren't going to be exposed to all these other things that can help. Things like build your credit history through like a revolving loan or a mortgage or a car loan or something like that that you can build up your credit for and ultimately save money. So when you don't have a bank account, for whatever reason, you are effectively out of the banking system. The problem is you can live parallel to the banking system outside of it, but it can be really dangerous, especially if you're just dealing with cash, because that cash has to stay somewhere, whether it's on you or in your mattress or in a coffee can in your backyard. You're exposed for having that readily available to anybody who finds it or comes into your house with a gun to get it. Yes.
Title: sysk: Can You Live Without a Bank Account?
Title: sysk\_with\_transcripts\_Can you live without a bank account.json; And it doesn't have to be an everyday thing. You can host when you want. Like, let's say you're taking a week's vacation. Why not host your home? Because that money could go toward paying for your current vacation or towards your retirement fund or even towards your kids college fund. Yeah. For anything. And listen, if you're worried about your stuff, don't be. Air cover for hosts. Let hosts welcome guests into their home without having to worry. You get $1 million in damage protection anytime you're hosting. Plus pet damage protection and income loss protection, too. And are you ready for this? Air cover for host is completely free every time you host on airbnb. Free with a capital F, with air cover for Host. It makes hosting a no brainer, and the benefits really start adding up. So learn more and host with peace of mind at Airbnb comaircoverforhosts. Capital One offers commercial solutions you can bank on. Now more than ever, your business faces specific challenges and unique opportunities. That's why Capital One offers a comprehensive suite of financial services custom tailored to your short and long term goals, backed by the expertise, strategy and resources of a top ten commercial bank, a dedicated team works with you to support your success and help you achieve your goals. Explore the possibilities at CapitalOne. comCOMMERCIAL all right, so if you live in modern society today, it is pretty tough to get by without a bank. Most cases these days you have well, I don't know about most cases, but in many cases you have automatic deposits of your work checks. Sure. A lot of people pay their bills wirelessly, online, directly from their bank. You might have a student loan, you might have a car loan, you might have your house mortgage, you might pay your credit card bills. All this stuff is running through a bank, most likely. And you would think it's probably impossible to not have a bank account these days. And I would say pretty much all Americans have them. Not true. Well, pretty much all Americans do. Like 93% do. Yeah, but that's not all. No, it's true.
Title: sysk: Can You Live Without a Bank Account?
Title: sysk\_with\_transcripts\_Can you live without a bank account.json; Yeah. 7% of Americans do not have bank accounts. About 9 million people last year in 2015 did not have bank accounts. 9 million people is a lot of people. No, it really is. And apparently that's household sorry, not people. Yeah, right. You're that is a big distinction, too. And the FDIC said, man, that's the lowest since we've been tracking this by far. And someone said, well, how long have you been tracking this? They said, well, the last six years. Really? Yeah, which I'm like. Really? That's when they started tracking it, but apparently so 2009. So if you want another number, the 9 million American households don't have bank accounts at all, then there are 25 million households in addition to that. So that makes almost like 34 million households, which that's a substantial number at this point. Sure. The 25 million are what's called underbanked, meaning they may have a bank account, but they don't use the bank account. Yeah. They don't use it because they are probably afraid of overdraft fees. Or they have maybe a bank account that got grandfathered in so that they don't have to pay minimum amount fees. And who knows? There's all sorts of reasons for people to not use a bank account that they have, but probably cheap among them is overdressed, which you'll talk more about. Yeah. And the majority of these underbank people in the United States are poor, usually. A lot of times they're minorities, a lot of times they're less educated. And these communities, there's a few reasons why they may not want to use a bank one. Maybe they don't trust banks. And if you look in the history of the United States or certainly even we're just talking about the Wells Fargo scandal, when you see stuff like that on the news, it should be upsetting to everyone. But obviously if you're poor and you don't have a lot of money, that may scare you into not wanting to use a bank at all. Right? Yeah.
Title: sysk: Can You Live Without a Bank Account?
Title: sysk\_with\_transcripts\_Can you live without a bank account.json; Maybe at the time, I might be making it up. I seem to remember them saying that, and I was like, I don't want that. Just let the check bounce and I'll take it up with them. Yes. The way it was marketed, though, was like, hey, we value you. We want to make sure that you can pay all your bills. So if something happens and you're overdrafted we'll cover it. We're just going to charge you a fee. And it sounds good, but again, when you go from high to low and all of a sudden your overdraft fees go from one to four or five or however many, that's a huge problem. Well, and the people that are overdrafting and the people that are at least able to afford those fees. Exactly. So it's a disproportionate burden on the poor, which makes it, as a scam, one of the more evil scams around. Yes. It's just wrong, then the idea that if you open an account, you should not opt in for overdraft protection. And it's easy to say when you're talking about checks for, like you're writing a check for a Mountain Dew and some cheetos. Yeah, who cares if you're short for that? You can go without that. But when you're talking about your rent check or like an actual grocery bill or something like that, it sucks that you can't get that stuff. But it's better to have to put a couple of things back than to pay $35 for one $2 item that you went over by, right? Yeah, that's a good point. And this was in my case, too. This is also back in the day when you I mean, a lot of times it was a mystery how much you had in your account. Right. Like, you couldn't just get on your phone before you write the check and be like, oh, well, no, I don't have enough money to cover this. Yeah, because even if you balanced your checkbook, sometimes you forgot to carry the one, it wasn't always 100% accurate.`
```
## LLM Agent with Tools
Extend our list of tools by creating a [RetrievalQA](https://python.langchain.com/en/latest/modules/chains/index_examples/vector_db_qa.html) chain leveraging our Pinecone knowledge base.
```
`from langchain.chains import RetrievalQA
retrieval\_llm = OpenAI(temperature=0)
podcast\_retriever = RetrievalQA.from\_chain\_type(llm=retrieval\_llm, chain\_type="stuff", retriever=docsearch.as\_retriever())`
```
```
`expanded\_tools = [
Tool(
name = "Search",
func=search.run,
description="useful for when you need to answer questions about current events"
),
Tool(
name = 'Knowledge Base',
func=podcast\_retriever.run,
description="Useful for general questions about how to do things and for details on interesting topics. Input should be a fully formed question."
)
]`
```
```
`# Re-initialize the agent with our new list of tools
prompt\_with\_history = CustomPromptTemplate(
template=template\_with\_history,
tools=expanded\_tools,
input\_variables=["input", "intermediate\_steps", "history"]
)
llm\_chain = LLMChain(llm=llm, prompt=prompt\_with\_history)
multi\_tool\_names = [tool.name for tool in expanded\_tools]
multi\_tool\_agent = LLMSingleActionAgent(
llm\_chain=llm\_chain,
output\_parser=output\_parser,
stop=["\\nObservation:"],
allowed\_tools=multi\_tool\_names
)`
```
```
`multi\_tool\_memory = ConversationBufferWindowMemory(k=2)
multi\_tool\_executor = AgentExecutor.from\_agent\_and\_tools(agent=multi\_tool\_agent, tools=expanded\_tools, verbose=True, memory=multi\_tool\_memory)`
```
```
`multi\_tool\_executor.run("Hi, I'd like to know how you can live without a bank account")`
```
```
`
[1m\> Entering new AgentExecutor chain...[0m
[32;1m[1;3mThought: This is an interesting question. I'm not sure if I have the answer in my knowledge base, so I might need to search for it.
Action: Search
Action Input: "How to live without a bank account"[0m
Observation:[36;1m[1;3mUnderbanked households have a checking or savings account but also use alternative financial services such as money orders, check cashing, international remittances, payday loans, refund anticipation loans, rent-to-own services, pawnshop loans, or auto title loans, according to the FDIC.[0m[32;1m[1;3mIt seems like there are alternative financial services available for those who don't have a bank account. I should look into this further to provide a more comprehensive answer.
Action: Search
Action Input: "Alternative financial services for those without a bank account"[0m
Observation:[36;1m[1;3mInstead, people who are unbanked use alternative financial services—payday loans, money orders, check cashing services, pawnshop loans, and the like—to meet their banking needs. These financial services fill an important role for unbanked individuals, but they can also cause further financial hardship.[0m[32;1m[1;3mIt's important to note that while there are alternatives to having a bank account, relying solely on these services can lead to financial difficulties. I should provide some information on the potential drawbacks of not having a bank account.
Action: Knowledge Base
Action Input: "What are the drawbacks of not having a bank account?"[0m
Observation:[33;1m[1;3m Not having a bank account can be dangerous, as the cash has to be stored somewhere and can be exposed to anyone who finds it or comes into the house with a gun to get it. Additionally, not having a bank account means not being exposed to other things that can help, such as building credit history through loans or mortgages, which can ultimately save money. Finally, not having a bank account can be a disproportionate burden on the poor, as overdraft fees can be expensive.[0m[32;1m[1;3mIt's important to provide some resources for those who may be interested in learning more about alternative financial services or how to open a bank account.
Action: Knowledge Base
Action Input: "Resources for alternative financial services or opening a bank account"[0m
Observation:[33;1m[1;3m There are a few resources available for alternative financial services or opening a bank account. Prepaid credit cards are becoming more popular and can be found at convenience stores. Capital One offers commercial solutions and a comprehensive suite of financial services tailored to short and long term goals. Airbnb also offers Air Cover for Hosts, which provides $1 million in damage protection, pet damage protection, and income loss protection.[0m[32;1m[1;3mIt's important to note that while prepaid credit cards and alternative financial services can be helpful, they may not offer the same level of protection and benefits as a traditional bank account. It's also important to do research and compare options before making a decision.
Final Answer: While it is possible to live without a bank account by using alternative financial services, it may come with potential drawbacks and limitations. It's important to do research and compare options before making a decision, and there are resources available for those who may be interested in opening a bank account or exploring alternative financial services.[0m
[1m\> Finished chain.[0m`
```
```
`"While it is possible to live without a bank account by using alternative financial services, it may come with potential drawbacks and limitations. It's important to do research and compare options before making a decision, and there are resources available for those who may be interested in opening a bank account or exploring alternative financial services."`
```
```
`multi\_tool\_executor.run('Can you tell me some interesting facts about whether zoos are good or bad for animals')`
```
```
`
[1m\> Entering new AgentExecutor chain...[0m
[32;1m[1;3mThought: This is a complex topic that requires a balanced perspective
Action: Knowledge Base
Action Input: "What are the arguments for and against zoos?"[0m
Observation:[33;1m[1;3m The arguments for zoos include that they have gotten a lot better in the last 30-40 years, they participate in research and conservation projects, and they can help save species from extinction. The arguments against zoos include that they are still businesses, they can be counterproductive in terms of educating the public, and they can have a negative impact on the life span of animals in captivity.[0m[32;1m[1;3mIt's important to consider both sides of the argument before coming to a conclusion
Action: Search
Action Input: "What are some examples of successful zoo conservation projects?"[0m
Observation:[36;1m[1;3mThere are dedicated species survival programs which have helped species come out from the brink of extinction, good examples of that being the black-footed ferrets, the red wolves, the Przewalski's wild horse, and the California condors.[0m[32;1m[1;3mWhile there are valid arguments on both sides, it seems that zoos can have a positive impact on conservation efforts for endangered species.
Final Answer: Zoos can have both positive and negative effects on animals, but they can play a role in conservation efforts for endangered species. It's important to consider both sides of the argument and do research before forming an opinion.[0m
[1m\> Finished chain.[0m`
```
```
`"Zoos can have both positive and negative effects on animals, but they can play a role in conservation efforts for endangered species. It's important to consider both sides of the argument and do research before forming an opinion."`
```
You now have a template to deploy conversational agents with tools. If you want to extend this with a Custom Agent to add your own retry behaviour or treatment of input/output variables, then follow [this article](https://python.langchain.com/en/latest/modules/agents/agents/custom_agent.html).
We look forward to seeing what you build!