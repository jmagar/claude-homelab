Retrieval augmentation for GPT-4 using Pinecone
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
Mar 24, 2023
# Retrieval augmentation for GPT-4 using Pinecone
This recipe is archived and may reference outdated models or APIs.
[ JA ](https://github.com/jamescalam)
[ jamescalam ](https://github.com/jamescalam)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/pinecone/GPT4_Retrieval_Augmentation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/pinecone/GPT4_Retrieval_Augmentation.ipynb)
#### Fixing LLMs that Hallucinate
In this notebook we will learn how to query relevant contexts to our queries from Pinecone, and pass these to a GPT-4 model to generate an answer backed by real data sources.
GPT-4 is a big step up from previous OpenAI completion models. It also exclusively uses the `ChatCompletion` endpoint, so we must use it in a slightly different way to usual. However, the power of the model makes the change worthwhile, particularly when augmented with an external knowledge base like the Pinecone vector database.
Required installs for this notebook are:
```
`!pip install -qU bs4 tiktoken openai langchain pinecone-client[grpc]`
```
```
`[?25l [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m0.0/1.7 MB[0m [31m?[0m eta [36m-:--:--[0m
[2K [91m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m[91m╸[0m [32m1.7/1.7 MB[0m [31m71.4 MB/s[0m eta [36m0:00:01[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m1.7/1.7 MB[0m [31m41.5 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m70.1/70.1 KB[0m [31m6.5 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m396.0/396.0 KB[0m [31m28.4 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m177.2/177.2 KB[0m [31m12.1 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m62.8/62.8 KB[0m [31m4.8 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m1.0/1.0 MB[0m [31m4.8 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m58.3/58.3 KB[0m [31m8.0 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m1.1/1.1 MB[0m [31m43.0 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m1.3/1.3 MB[0m [31m77.1 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m158.8/158.8 KB[0m [31m19.6 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m199.2/199.2 KB[0m [31m26.0 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m264.6/264.6 KB[0m [31m35.1 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m114.2/114.2 KB[0m [31m15.6 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m49.1/49.1 KB[0m [31m7.7 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m218.0/218.0 KB[0m [31m27.4 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m218.0/218.0 KB[0m [31m28.7 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m211.7/211.7 KB[0m [31m12.0 MB/s[0m eta [36m0:00:00[0m
[?25h[31mERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
google-cloud-translate 3.8.4 requires protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,\<5.0.0dev,\>=3.19.5, but you have protobuf 3.19.3 which is incompatible.
google-cloud-language 2.6.1 requires protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,\<5.0.0dev,\>=3.19.5, but you have protobuf 3.19.3 which is incompatible.
google-cloud-firestore 2.7.3 requires protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,\<5.0.0dev,\>=3.19.5, but you have protobuf 3.19.3 which is incompatible.
google-cloud-datastore 2.11.1 requires protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,\<5.0.0dev,\>=3.19.5, but you have protobuf 3.19.3 which is incompatible.
google-cloud-bigquery 3.4.2 requires protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,\<5.0.0dev,\>=3.19.5, but you have protobuf 3.19.3 which is incompatible.
google-cloud-bigquery-storage 2.19.0 requires protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,\<5.0.0dev,\>=3.19.5, but you have protobuf 3.19.3 which is incompatible.
google-api-core 2.11.0 requires protobuf!=3.20.0,!=3.20.1,!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,\<5.0.0dev,\>=3.19.5, but you have protobuf 3.19.3 which is incompatible.[0m[31m
[0m`
```
## Preparing the Data
In this example, we will download the LangChain docs from [langchain.readthedocs.io/](https://langchain.readthedocs.io/latest/en/). We get all `.html` files located on the site like so:
```
`!wget -r -A.html -P rtdocs https://python.langchain.com/en/latest/`
```
```
`\<Response [200]\>`
```
This downloads all HTML into the `rtdocs` directory. Now we can use LangChain itself to process these docs. We do this using the `ReadTheDocsLoader` like so:
```
`from langchain.document\_loaders import ReadTheDocsLoader
loader = ReadTheDocsLoader('rtdocs')
docs = loader.load()
len(docs)`
```
```
`.rst .pdf Welcome to LangChain Contents Getting Started Modules Use Cases Reference Docs LangChain Ecosystem Additional Resources Welcome to LangChain# Large language models (LLMs) are emerging as a transformative technology, enabling developers to build applications that they previously could not. But using these LLMs in isolation is often not enough to create a truly powerful app - the real power comes when you are able to combine them with other sources of computation or knowledge. This library is aimed at assisting in the development of those types of applications. Common examples of these types of applications include: ❓ Question Answering over specific documents Documentation End-to-end Example: Question Answering over Notion Database 💬 Chatbots Documentation End-to-end Example: Chat-LangChain 🤖 Agents Documentation End-to-end Example: GPT+WolframAlpha Getting Started# Checkout the below guide for a walkthrough of how to get started using LangChain to create an Language Model application. Getting Started Documentation Modules# There are several main modules that LangChain provides support for. For each module we provide some examples to get started, how-to guides, reference docs, and conceptual guides. These modules are, in increasing order of complexity: Prompts: This includes prompt management, prompt optimization, and prompt serialization. LLMs: This includes a generic interface for all LLMs, and common utilities for working with LLMs. Document Loaders: This includes a standard interface for loading documents, as well as specific integrations to all types of text data sources. Utils: Language models are often more powerful when interacting with other sources of knowledge or computation. This can include Python REPLs, embeddings, search engines, and more. LangChain provides a large collection of common utils to use in your application. Chains: Chains go beyond just a single LLM call, and are sequences of calls (whether to an LLM or a different utility). LangChain provides a standard interface for chains, lots of integrations with other tools, and end-to-end chains for common applications. Indexes: Language models are often more powerful when combined with your own text data - this module covers best practices for doing exactly that. Agents: Agents involve an LLM making decisions about which Actions to take, taking that Action, seeing an Observation, and repeating that until done. LangChain provides a standard interface for agents, a selection of agents to choose from, and examples of end to end agents. Memory: Memory is the concept of persisting state between calls of a chain/agent. LangChain provides a standard interface for memory, a collection of memory implementations, and examples of chains/agents that use memory. Chat: Chat models are a variation on Language Models that expose a different API - rather than working with raw text, they work with messages. LangChain provides a standard interface for working with them and doing all the same things as above. Use Cases# The above modules can be used in a variety of ways. LangChain also provides guidance and assistance in this. Below are some of the common use cases LangChain supports. Agents: Agents are systems that use a language model to interact with other tools. These can be used to do more grounded question/answering, interact with APIs, or even take actions. Chatbots: Since language models are good at producing text, that makes them ideal for creating chatbots. Data Augmented Generation: Data Augmented Generation involves specific types of chains that first interact with an external datasource to fetch data to use in the generation step. Examples of this include summarization of long pieces of text and question/answering over specific data sources. Question Answering: Answering questions over specific documents, only utilizing the information in those documents to construct an answer. A type of Data Augmented Generation. Summarization: Summarizing longer documents into shorter, more condensed chunks of information. A type of Data Augmented Generation. Evaluation: Generative models are notoriously hard to evaluate with traditional metrics. One new way of evaluating them is using language models themselves to do the evaluation. LangChain provides some prompts/chains for assisting in this. Generate similar examples: Generating similar examples to a given input. This is a common use case for many applications, and LangChain provides some prompts/chains for assisting in this. Compare models: Experimenting with different prompts, models, and chains is a big part of developing the best possible application. The ModelLaboratory makes it easy to do so. Reference Docs# All of LangChain’s reference documentation, in one place. Full documentation on all methods, classes, installation methods, and integration setups for LangChain. Reference Documentation LangChain Ecosystem# Guides for how other companies/products can be used with LangChain LangChain Ecosystem Additional Resources# Additional collection of resources we think may be useful as you develop your application! LangChainHub: The LangChainHub is a place to share and explore other prompts, chains, and agents. Glossary: A glossary of all related terms, papers, methods, etc. Whether implemented in LangChain or not! Gallery: A collection of our favorite projects that use LangChain. Useful for finding inspiration or seeing how things were done in other applications. Deployments: A collection of instructions, code snippets, and template repositories for deploying LangChain apps. Discord: Join us on our Discord to discuss all things LangChain! Tracing: A guide on using tracing in LangChain to visualize the execution of chains and agents. Production Support: As you move your LangChains into production, we’d love to offer more comprehensive support. Please fill out this form and we’ll set up a dedicated support Slack channel. next Quickstart Guide Contents Getting Started Modules Use Cases Reference Docs LangChain Ecosystem Additional Resources By Harrison Chase © Copyright 2022, Harrison Chase. Last updated on Mar 15, 2023.`
```
This leaves us with hundreds of processed doc pages. Let’s take a look at the format each one contains:
```
`docs[0]`
```
We access the plaintext page content like so:
```
`print(docs[0].page\_content)`
```
```
`print(docs[5].page\_content)`
```
We can also find the source of each document:
```
`docs[5].metadata['source'].replace('rtdocs/', 'https://')`
```
We can use these to create our `data` list:
```
`data = []
for doc in docs:
data.append({
'url': doc.metadata['source'].replace('rtdocs/', 'https://'),
'text': doc.page\_content
})`
```
```
`data[3]`
```
```
`{'url': 'https://langchain.readthedocs.io/en/latest/modules/memory/types/entity\_summary\_memory.html',
'text': '.ipynb .pdf Entity Memory Contents Using in a chain Inspecting the memory store Entity Memory# This notebook shows how to work with a memory module that remembers things about specific entities. It extracts information on entities (using LLMs) and builds up its knowledge about that entity over time (also using LLMs). Let’s first walk through using this functionality. from langchain.llms import OpenAI from langchain.memory import ConversationEntityMemory llm = OpenAI(temperature=0) memory = ConversationEntityMemory(llm=llm) \_input = {"input": "Deven & Sam are working on a hackathon project"} memory.load\_memory\_variables(\_input) memory.save\_context( \_input, {"ouput": " That sounds like a great project! What kind of project are they working on?"} ) memory.load\_memory\_variables({"input": \\'who is Sam\\'}) {\\'history\\': \\'Human: Deven & Sam are working on a hackathon project\\\\nAI: That sounds like a great project! What kind of project are they working on?\\', \\'entities\\': {\\'Sam\\': \\'Sam is working on a hackathon project with Deven.\\'}} memory = ConversationEntityMemory(llm=llm, return\_messages=True) \_input = {"input": "Deven & Sam are working on a hackathon project"} memory.load\_memory\_variables(\_input) memory.save\_context( \_input, {"ouput": " That sounds like a great project! What kind of project are they working on?"} ) memory.load\_memory\_variables({"input": \\'who is Sam\\'}) {\\'history\\': [HumanMessage(content=\\'Deven & Sam are working on a hackathon project\\', additional\_kwargs={}), AIMessage(content=\\' That sounds like a great project! What kind of project are they working on?\\', additional\_kwargs={})], \\'entities\\': {\\'Sam\\': \\'Sam is working on a hackathon project with Deven.\\'}} Using in a chain# Let’s now use it in a chain! from langchain.chains import ConversationChain from langchain.memory import ConversationEntityMemory from langchain.memory.prompt import ENTITY\_MEMORY\_CONVERSATION\_TEMPLATE from pydantic import BaseModel from typing import List, Dict, Any conversation = ConversationChain( llm=llm, verbose=True, prompt=ENTITY\_MEMORY\_CONVERSATION\_TEMPLATE, memory=ConversationEntityMemory(llm=llm) ) conversation.predict(input="Deven & Sam are working on a hackathon project") \> Entering new ConversationChain chain... Prompt after formatting: You are an assistant to a human, powered by a large language model trained by OpenAI. You are designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, you are able to generate human-like text based on the input you receive, allowing you to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand. You are constantly learning and improving, and your capabilities are constantly evolving. You are able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. You have access to some personalized information provided by the human in the Context section below. Additionally, you are able to generate your own text based on the input you receive, allowing you to engage in discussions and provide explanations and descriptions on a wide range of topics. Overall, you are a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether the human needs help with a specific question or just wants to have a conversation about a particular topic, you are here to assist. Context: {\\'Deven\\': \\'\\', \\'Sam\\': \\'\\'} Current conversation: Last line: Human: Deven & Sam are working on a hackathon project You: \> Finished chain. \\' That sounds like a great project! What kind of project are they working on?\\' conversation.memory.store {\\'Deven\\': \\'Deven is working on a hackathon project with Sam.\\', \\'Sam\\': \\'Sam is working on a hackathon project with Deven.\\'} conversation.predict(input="They are trying to add more complex memory structures to Langchain") \> Entering new ConversationChain chain... Prompt after formatting: You are an assistant to a human, powered by a large language model trained by OpenAI. You are designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, you are able to generate human-like text based on the input you receive, allowing you to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand. You are constantly learning and improving, and your capabilities are constantly evolving. You are able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. You have access to some personalized information provided by the human in the Context section below. Additionally, you are able to generate your own text based on the input you receive, allowing you to engage in discussions and provide explanations and descriptions on a wide range of topics. Overall, you are a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether the human needs help with a specific question or just wants to have a conversation about a particular topic, you are here to assist. Context: {\\'Deven\\': \\'Deven is working on a hackathon project with Sam.\\', \\'Sam\\': \\'Sam is working on a hackathon project with Deven.\\', \\'Langchain\\': \\'\\'} Current conversation: Human: Deven & Sam are working on a hackathon project AI: That sounds like a great project! What kind of project are they working on? Last line: Human: They are trying to add more complex memory structures to Langchain You: \> Finished chain. \\' That sounds like an interesting project! What kind of memory structures are they trying to add?\\' conversation.predict(input="They are adding in a key-value store for entities mentioned so far in the conversation.") \> Entering new ConversationChain chain... Prompt after formatting: You are an assistant to a human, powered by a large language model trained by OpenAI. You are designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, you are able to generate human-like text based on the input you receive, allowing you to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand. You are constantly learning and improving, and your capabilities are constantly evolving. You are able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. You have access to some personalized information provided by the human in the Context section below. Additionally, you are able to generate your own text based on the input you receive, allowing you to engage in discussions and provide explanations and descriptions on a wide range of topics. Overall, you are a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether the human needs help with a specific question or just wants to have a conversation about a particular topic, you are here to assist. Context: {\\'Deven\\': \\'Deven is working on a hackathon project with Sam, attempting to add more complex memory structures to Langchain.\\', \\'Sam\\': \\'Sam is working on a hackathon project with Deven, trying to add more complex memory structures to Langchain.\\', \\'Langchain\\': \\'Langchain is a project that is trying to add more complex memory structures.\\', \\'Key-Value Store\\': \\'\\'} Current conversation: Human: Deven & Sam are working on a hackathon project AI: That sounds like a great project! What kind of project are they working on? Human: They are trying to add more complex memory structures to Langchain AI: That sounds like an interesting project! What kind of memory structures are they trying to add? Last line: Human: They are adding in a key-value store for entities mentioned so far in the conversation. You: \> Finished chain. \\' That sounds like a great idea! How will the key-value store work?\\' conversation.predict(input="What do you know about Deven & Sam?") \> Entering new ConversationChain chain... Prompt after formatting: You are an assistant to a human, powered by a large language model trained by OpenAI. You are designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, you are able to generate human-like text based on the input you receive, allowing you to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand. You are constantly learning and improving, and your capabilities are constantly evolving. You are able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. You have access to some personalized information provided by the human in the Context section below. Additionally, you are able to generate your own text based on the input you receive, allowing you to engage in discussions and provide explanations and descriptions on a wide range of topics. Overall, you are a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether the human needs help with a specific question or just wants to have a conversation about a particular topic, you are here to assist. Context: {\\'Deven\\': \\'Deven is working on a hackathon project with Sam, attempting to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation.\\', \\'Sam\\': \\'Sam is working on a hackathon project with Deven, trying to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation.\\'} Current conversation: Human: Deven & Sam are working on a hackathon project AI: That sounds like a great project! What kind of project are they working on? Human: They are trying to add more complex memory structures to Langchain AI: That sounds like an interesting project! What kind of memory structures are they trying to add? Human: They are adding in a key-value store for entities mentioned so far in the conversation. AI: That sounds like a great idea! How will the key-value store work? Last line: Human: What do you know about Deven & Sam? You: \> Finished chain. \\' Deven and Sam are working on a hackathon project together, attempting to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation.\\' Inspecting the memory store# We can also inspect the memory store directly. In the following examaples, we look at it directly, and then go through some examples of adding information and watch how it changes. from pprint import pprint pprint(conversation.memory.store) {\\'Deven\\': \\'Deven is working on a hackathon project with Sam, attempting to add \\' \\'more complex memory structures to Langchain, including a key-value \\' \\'store for entities mentioned so far in the conversation.\\', \\'Key-Value Store\\': \\'A key-value store that stores entities mentioned in the \\' \\'conversation.\\', \\'Langchain\\': \\'Langchain is a project that is trying to add more complex \\' \\'memory structures, including a key-value store for entities \\' \\'mentioned so far in the conversation.\\', \\'Sam\\': \\'Sam is working on a hackathon project with Deven, attempting to add \\' \\'more complex memory structures to Langchain, including a key-value \\' \\'store for entities mentioned so far in the conversation.\\'} conversation.predict(input="Sam is the founder of a company called Daimon.") \> Entering new ConversationChain chain... Prompt after formatting: You are an assistant to a human, powered by a large language model trained by OpenAI. You are designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, you are able to generate human-like text based on the input you receive, allowing you to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand. You are constantly learning and improving, and your capabilities are constantly evolving. You are able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. You have access to some personalized information provided by the human in the Context section below. Additionally, you are able to generate your own text based on the input you receive, allowing you to engage in discussions and provide explanations and descriptions on a wide range of topics. Overall, you are a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether the human needs help with a specific question or just wants to have a conversation about a particular topic, you are here to assist. Context: {\\'Daimon\\': \\'\\', \\'Sam\\': \\'Sam is working on a hackathon project with Deven to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation.\\'} Current conversation: Human: They are trying to add more complex memory structures to Langchain AI: That sounds like an interesting project! What kind of memory structures are they trying to add? Human: They are adding in a key-value store for entities mentioned so far in the conversation. AI: That sounds like a great idea! How will the key-value store work? Human: What do you know about Deven & Sam? AI: Deven and Sam are working on a hackathon project to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation. They seem to be very motivated and passionate about their project, and are working hard to make it a success. Last line: Human: Sam is the founder of a company called Daimon. You: \> Finished chain. "\\\\nThat\\'s impressive! It sounds like Sam is a very successful entrepreneur. What kind of company is Daimon?" from pprint import pprint pprint(conversation.memory.store) {\\'Daimon\\': \\'Daimon is a company founded by Sam.\\', \\'Deven\\': \\'Deven is working on a hackathon project with Sam to add more \\' \\'complex memory structures to Langchain, including a key-value store \\' \\'for entities mentioned so far in the conversation.\\', \\'Key-Value Store\\': \\'Key-Value Store: A data structure that stores values \\' \\'associated with a unique key, allowing for efficient \\' \\'retrieval of values. Deven and Sam are adding a key-value \\' \\'store for entities mentioned so far in the conversation.\\', \\'Langchain\\': \\'Langchain is a project that seeks to add more complex memory \\' \\'structures, including a key-value store for entities mentioned \\' \\'so far in the conversation.\\', \\'Sam\\': \\'Sam is working on a hackathon project with Deven to add more complex \\' \\'memory structures to Langchain, including a key-value store for \\' \\'entities mentioned so far in the conversation. He is also the founder \\' \\'of a company called Daimon.\\'} conversation.predict(input="What do you know about Sam?") \> Entering new ConversationChain chain... Prompt after formatting: You are an assistant to a human, powered by a large language model trained by OpenAI. You are designed to be able to assist with a wide range of tasks, from answering simple questions to providing in-depth explanations and discussions on a wide range of topics. As a language model, you are able to generate human-like text based on the input you receive, allowing you to engage in natural-sounding conversations and provide responses that are coherent and relevant to the topic at hand. You are constantly learning and improving, and your capabilities are constantly evolving. You are able to process and understand large amounts of text, and can use this knowledge to provide accurate and informative responses to a wide range of questions. You have access to some personalized information provided by the human in the Context section below. Additionally, you are able to generate your own text based on the input you receive, allowing you to engage in discussions and provide explanations and descriptions on a wide range of topics. Overall, you are a powerful tool that can help with a wide range of tasks and provide valuable insights and information on a wide range of topics. Whether the human needs help with a specific question or just wants to have a conversation about a particular topic, you are here to assist. Context: {\\'Sam\\': \\'Sam is working on a hackathon project with Deven to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation. He is also the founder of a company called Daimon.\\', \\'Daimon\\': \\'Daimon is a company founded by Sam.\\'} Current conversation: Human: They are adding in a key-value store for entities mentioned so far in the conversation. AI: That sounds like a great idea! How will the key-value store work? Human: What do you know about Deven & Sam? AI: Deven and Sam are working on a hackathon project to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation. They seem to be very motivated and passionate about their project, and are working hard to make it a success. Human: Sam is the founder of a company called Daimon. AI: That\\'s impressive! It sounds like Sam is a very successful entrepreneur. What kind of company is Daimon? Last line: Human: What do you know about Sam? You: \> Finished chain. \\' Sam is the founder of a company called Daimon. He is also working on a hackathon project with Deven to add more complex memory structures to Langchain, including a key-value store for entities mentioned so far in the conversation. He seems to be very motivated and passionate about his project, and is working hard to make it a success.\\' previous ConversationBufferWindowMemory next Conversation Knowledge Graph Memory Contents Using in a chain Inspecting the memory store By Harrison Chase © Copyright 2022, Harrison Chase. Last updated on Mar 15, 2023.'}`
```
It’s pretty ugly but it’s good enough for now. Let’s see how we can process all of these. We will chunk everything into \~400 token chunks, we can do this easily with `langchain` and `tiktoken`:
```
`import tiktoken
tokenizer = tiktoken.get\_encoding('p50k\_base')
# create the length function
def tiktoken\_len(text):
tokens = tokenizer.encode(
text,
disallowed\_special=()
)
return len(tokens)`
```
```
`from langchain.text\_splitter import RecursiveCharacterTextSplitter
text\_splitter = RecursiveCharacterTextSplitter(
chunk\_size=400,
chunk\_overlap=20,
length\_function=tiktoken\_len,
separators=["\\n\\n", "\\n", " ", ""]
)`
```
Process the `data` into more chunks using this approach.
```
`from uuid import uuid4
from tqdm.auto import tqdm
chunks = []
for idx, record in enumerate(tqdm(data)):
texts = text\_splitter.split\_text(record['text'])
chunks.extend([{
'id': str(uuid4()),
'text': texts[i],
'chunk': i,
'url': record['url']
} for i in range(len(texts))])`
```
```
` 0%| | 0/231 [00:00\<?, ?it/s]`
```
Our chunks are ready so now we move onto embedding and indexing everything.
## Initialize Embedding Model
We use `text-embedding-3-small` as the embedding model. We can embed text like so:
```
`import openai
# initialize openai API key
openai.api\_key = "sk-..."
embed\_model = "text-embedding-3-small"
res = openai.Embedding.create(
input=[
"Sample document text goes here",
"there will be several phrases in each batch"
], engine=embed\_model
)`
```
In the response `res` we will find a JSON-like object containing our new embeddings within the `'data'` field.
```
`res.keys()`
```
```
`dict\_keys(['object', 'data', 'model', 'usage'])`
```
Inside `'data'` we will find two records, one for each of the two sentences we just embedded. Each vector embedding contains `1536` dimensions (the output dimensionality of the `text-embedding-3-small` model.
```
`len(res['data'])`
```
```
`2`
```
```
`len(res['data'][0]['embedding']), len(res['data'][1]['embedding'])`
```
```
`(1536, 1536)`
```
We will apply this same embedding logic to the langchain docs dataset we’ve just scraped. But before doing so we must create a place to store the embeddings.
## Initializing the Index
Now we need a place to store these embeddings and enable a efficient vector search through them all. To do that we use Pinecone, we can get a [free API key](https://app.pinecone.io/) and enter it below where we will initialize our connection to Pinecone and create a new index.
```
`import pinecone
index\_name = 'gpt-4-langchain-docs'
# initialize connection to pinecone
pinecone.init(
api\_key="PINECONE\_API\_KEY", # app.pinecone.io (console)
environment="PINECONE\_ENVIRONMENT" # next to API key in console
)
# check if index already exists (it shouldn't if this is first time)
if index\_name not in pinecone.list\_indexes():
# if does not exist, create index
pinecone.create\_index(
index\_name,
dimension=len(res['data'][0]['embedding']),
metric='dotproduct'
)
# connect to index
index = pinecone.GRPCIndex(index\_name)
# view index stats
index.describe\_index\_stats()`
```
```
`{'dimension': 1536,
'index\_fullness': 0.0,
'namespaces': {},
'total\_vector\_count': 0}`
```
We can see the index is currently empty with a `total\_vector\_count` of `0`. We can begin populating it with OpenAI `text-embedding-3-small` built embeddings like so:
```
`from tqdm.auto import tqdm
import datetime
from time import sleep
batch\_size = 100 # how many embeddings we create and insert at once
for i in tqdm(range(0, len(chunks), batch\_size)):
# find end of batch
i\_end = min(len(chunks), i+batch\_size)
meta\_batch = chunks[i:i\_end]
# get ids
ids\_batch = [x['id'] for x in meta\_batch]
# get texts to encode
texts = [x['text'] for x in meta\_batch]
# create embeddings (try-except added to avoid RateLimitError)
try:
res = openai.Embedding.create(input=texts, engine=embed\_model)
except:
done = False
while not done:
sleep(5)
try:
res = openai.Embedding.create(input=texts, engine=embed\_model)
done = True
except:
pass
embeds = [record['embedding'] for record in res['data']]
# cleanup metadata
meta\_batch = [{
'text': x['text'],
'chunk': x['chunk'],
'url': x['url']
} for x in meta\_batch]
to\_upsert = list(zip(ids\_batch, embeds, meta\_batch))
# upsert to Pinecone
index.upsert(vectors=to\_upsert)`
```
```
` 0%| | 0/12 [00:00\<?, ?it/s]`
```
Now we’ve added all of our langchain docs to the index. With that we can move on to retrieval and then answer generation using GPT-4.
## Retrieval
To search through our documents we first need to create a query vector `xq`. Using `xq` we will retrieve the most relevant chunks from the LangChain docs, like so:
```
`query = "how do I use the LLMChain in LangChain?"
res = openai.Embedding.create(
input=[query],
engine=embed\_model
)
# retrieve from Pinecone
xq = res['data'][0]['embedding']
# get relevant contexts (including the questions)
res = index.query(xq, top\_k=5, include\_metadata=True)`
```
```
`res`
```
```
`{'matches': [{'id': '1fec660b-9937-4f7e-9692-280c8cc7ce0d',
'metadata': {'chunk': 0.0,
'text': '.rst .pdf Chains Chains# Using an LLM in '
'isolation is fine for some simple '
'applications, but many more complex ones '
'require chaining LLMs - either with each '
'other or with other experts. LangChain '
'provides a standard interface for Chains, '
'as well as some common implementations of '
'chains for ease of use. The following '
'sections of documentation are provided: '
'Getting Started: A getting started guide '
'for chains, to get you up and running '
'quickly. Key Concepts: A conceptual guide '
'going over the various concepts related to '
'chains. How-To Guides: A collection of '
'how-to guides. These highlight how to use '
'various types of chains. Reference: API '
'reference documentation for all Chain '
'classes. previous Vector DB Text '
'Generation next Getting Started By '
'Harrison Chase © Copyright 2022, Harrison '
'Chase. Last updated on Mar 15, 2023.',
'url': 'https://langchain.readthedocs.io/en/latest/modules/chains.html'},
'score': 0.8848499,
'sparse\_values': {'indices': [], 'values': []},
'values': []},
{'id': 'fe48438d-228a-4e0e-b41e-5cb5c6ba1482',
'metadata': {'chunk': 0.0,
'text': '.rst .pdf LLMs LLMs# Large Language Models '
'(LLMs) are a core component of LangChain. '
'LangChain is not a provider of LLMs, but '
'rather provides a standard interface '
'through which you can interact with a '
'variety of LLMs. The following sections of '
'documentation are provided: Getting '
'Started: An overview of all the '
'functionality the LangChain LLM class '
'provides. Key Concepts: A conceptual guide '
'going over the various concepts related to '
'LLMs. How-To Guides: A collection of '
'how-to guides. These highlight how to '
'accomplish various objectives with our LLM '
'class, as well as how to integrate with '
'various LLM providers. Reference: API '
'reference documentation for all LLM '
'classes. previous Example Selector next '
'Getting Started By Harrison Chase © '
'Copyright 2022, Harrison Chase. Last '
'updated on Mar 15, 2023.',
'url': 'https://langchain.readthedocs.io/en/latest/modules/llms.html'},
'score': 0.8595519,
'sparse\_values': {'indices': [], 'values': []},
'values': []},
{'id': '60df5bff-5f79-46ee-9456-534d42f6a94e',
'metadata': {'chunk': 0.0,
'text': '.ipynb .pdf Getting Started Contents Why '
'do we need chains? Query an LLM with the '
'LLMChain Combine chains with the '
'SequentialChain Create a custom chain with '
'the Chain class Getting Started# In this '
'tutorial, we will learn about creating '
'simple chains in LangChain. We will learn '
'how to create a chain, add components to '
'it, and run it. In this tutorial, we will '
'cover: Using a simple LLM chain Creating '
'sequential chains Creating a custom chain '
'Why do we need chains?# Chains allow us to '
'combine multiple components together to '
'create a single, coherent application. For '
'example, we can create a chain that takes '
'user input, formats it with a '
'PromptTemplate, and then passes the '
'formatted response to an LLM. We can build '
'more complex chains by combining multiple '
'chains together, or by combining chains '
'with other components. Query an LLM with '
'the LLMChain# The LLMChain is a simple '
'chain that takes in a prompt template, '
'formats it with the user input and returns '
'the response from an LLM. To use the '
'LLMChain, first create a prompt template. '
'from langchain.prompts import '
'PromptTemplate from langchain.llms import '
'OpenAI llm = OpenAI(temperature=0.9) '
'prompt = PromptTemplate( '
'input\_variables=["product"], '
'template="What is a good',
'url': 'https://langchain.readthedocs.io/en/latest/modules/chains/getting\_started.html'},
'score': 0.8462403,
'sparse\_values': {'indices': [], 'values': []},
'values': []},
{'id': '2f11beb1-3935-447e-b565-b20383dc4544',
'metadata': {'chunk': 1.0,
'text': 'chain first uses a LLM to construct the '
'url to hit, then makes that request with '
'the Requests wrapper, and finally runs '
'that result through the language model '
'again in order to product a natural '
'language response. Example Notebook '
'LLMBash Chain Links Used: BashProcess, '
'LLMChain Notes: This chain takes user '
'input (a question), uses an LLM chain to '
'convert it to a bash command to run in the '
'terminal, and then returns that as the '
'result. Example Notebook LLMChecker Chain '
'Links Used: LLMChain Notes: This chain '
'takes user input (a question), uses an LLM '
'chain to answer that question, and then '
'uses other LLMChains to self-check that '
'answer. Example Notebook LLMRequests Chain '
'Links Used: Requests, LLMChain Notes: This '
'chain takes a URL and other inputs, uses '
'Requests to get the data at that URL, and '
'then passes that along with the other '
'inputs into an LLMChain to generate a '
'response. The example included shows how '
'to ask a question to Google - it firsts '
'constructs a Google url, then fetches the '
'data there, then passes that data + the '
'original question into an LLMChain to get '
'an answer. Example Notebook Moderation '
'Chain Links Used: LLMChain, '
'ModerationChain Notes: This chain shows '
'how to use OpenAI’s content',
'url': 'https://langchain.readthedocs.io/en/latest/modules/chains/utility\_how\_to.html'},
'score': 0.8451743,
'sparse\_values': {'indices': [], 'values': []},
'values': []},
{'id': 'f3ed41eb-063c-407f-bdaa-706a8c6a2091',
'metadata': {'chunk': 1.0,
'text': 'Prompts: This includes prompt management, '
'prompt optimization, and prompt '
'serialization. LLMs: This includes a '
'generic interface for all LLMs, and common '
'utilities for working with LLMs. Document '
'Loaders: This includes a standard '
'interface for loading documents, as well '
'as specific integrations to all types of '
'text data sources. Utils: Language models '
'are often more powerful when interacting '
'with other sources of knowledge or '
'computation. This can include Python '
'REPLs, embeddings, search engines, and '
'more. LangChain provides a large '
'collection of common utils to use in your '
'application. Chains: Chains go beyond just '
'a single LLM call, and are sequences of '
'calls (whether to an LLM or a different '
'utility). LangChain provides a standard '
'interface for chains, lots of integrations '
'with other tools, and end-to-end chains '
'for common applications. Indexes: Language '
'models are often more powerful when '
'combined with your own text data - this '
'module covers best practices for doing '
'exactly that. Agents: Agents involve an '
'LLM making decisions about which Actions '
'to take, taking that Action, seeing an '
'Observation, and repeating that until '
'done. LangChain provides a standard '
'interface for agents, a selection of '
'agents to choose from, and examples of end '
'to end agents. Memory: Memory is the',
'url': 'https://langchain.readthedocs.io/en/latest/'},
'score': 0.84271824,
'sparse\_values': {'indices': [], 'values': []},
'values': []}],
'namespace': ''}`
```
With retrieval complete, we move on to feeding these into GPT-4 to produce answers.
## Retrieval Augmented Generation
GPT-4 is currently accessed via the `ChatCompletions` endpoint of OpenAI. To add the information we retrieved into the model, we need to pass it into our user prompts *alongside* our original query. We can do that like so:
```
`# get list of retrieved text
contexts = [item['metadata']['text'] for item in res['matches']]
augmented\_query = "\\n\\n---\\n\\n".join(contexts)+"\\n\\n-----\\n\\n"+query`
```
```
`print(augmented\_query)`
```
```
`.rst .pdf Chains Chains# Using an LLM in isolation is fine for some simple applications, but many more complex ones require chaining LLMs - either with each other or with other experts. LangChain provides a standard interface for Chains, as well as some common implementations of chains for ease of use. The following sections of documentation are provided: Getting Started: A getting started guide for chains, to get you up and running quickly. Key Concepts: A conceptual guide going over the various concepts related to chains. How-To Guides: A collection of how-to guides. These highlight how to use various types of chains. Reference: API reference documentation for all Chain classes. previous Vector DB Text Generation next Getting Started By Harrison Chase © Copyright 2022, Harrison Chase. Last updated on Mar 15, 2023.
---
.rst .pdf LLMs LLMs# Large Language Models (LLMs) are a core component of LangChain. LangChain is not a provider of LLMs, but rather provides a standard interface through which you can interact with a variety of LLMs. The following sections of documentation are provided: Getting Started: An overview of all the functionality the LangChain LLM class provides. Key Concepts: A conceptual guide going over the various concepts related to LLMs. How-To Guides: A collection of how-to guides. These highlight how to accomplish various objectives with our LLM class, as well as how to integrate with various LLM providers. Reference: API reference documentation for all LLM classes. previous Example Selector next Getting Started By Harrison Chase © Copyright 2022, Harrison Chase. Last updated on Mar 15, 2023.
---
.ipynb .pdf Getting Started Contents Why do we need chains? Query an LLM with the LLMChain Combine chains with the SequentialChain Create a custom chain with the Chain class Getting Started# In this tutorial, we will learn about creating simple chains in LangChain. We will learn how to create a chain, add components to it, and run it. In this tutorial, we will cover: Using a simple LLM chain Creating sequential chains Creating a custom chain Why do we need chains?# Chains allow us to combine multiple components together to create a single, coherent application. For example, we can create a chain that takes user input, formats it with a PromptTemplate, and then passes the formatted response to an LLM. We can build more complex chains by combining multiple chains together, or by combining chains with other components. Query an LLM with the LLMChain# The LLMChain is a simple chain that takes in a prompt template, formats it with the user input and returns the response from an LLM. To use the LLMChain, first create a prompt template. from langchain.prompts import PromptTemplate from langchain.llms import OpenAI llm = OpenAI(temperature=0.9) prompt = PromptTemplate( input\_variables=["product"], template="What is a good
---
chain first uses a LLM to construct the url to hit, then makes that request with the Requests wrapper, and finally runs that result through the language model again in order to product a natural language response. Example Notebook LLMBash Chain Links Used: BashProcess, LLMChain Notes: This chain takes user input (a question), uses an LLM chain to convert it to a bash command to run in the terminal, and then returns that as the result. Example Notebook LLMChecker Chain Links Used: LLMChain Notes: This chain takes user input (a question), uses an LLM chain to answer that question, and then uses other LLMChains to self-check that answer. Example Notebook LLMRequests Chain Links Used: Requests, LLMChain Notes: This chain takes a URL and other inputs, uses Requests to get the data at that URL, and then passes that along with the other inputs into an LLMChain to generate a response. The example included shows how to ask a question to Google - it firsts constructs a Google url, then fetches the data there, then passes that data + the original question into an LLMChain to get an answer. Example Notebook Moderation Chain Links Used: LLMChain, ModerationChain Notes: This chain shows how to use OpenAI’s content
---
Prompts: This includes prompt management, prompt optimization, and prompt serialization. LLMs: This includes a generic interface for all LLMs, and common utilities for working with LLMs. Document Loaders: This includes a standard interface for loading documents, as well as specific integrations to all types of text data sources. Utils: Language models are often more powerful when interacting with other sources of knowledge or computation. This can include Python REPLs, embeddings, search engines, and more. LangChain provides a large collection of common utils to use in your application. Chains: Chains go beyond just a single LLM call, and are sequences of calls (whether to an LLM or a different utility). LangChain provides a standard interface for chains, lots of integrations with other tools, and end-to-end chains for common applications. Indexes: Language models are often more powerful when combined with your own text data - this module covers best practices for doing exactly that. Agents: Agents involve an LLM making decisions about which Actions to take, taking that Action, seeing an Observation, and repeating that until done. LangChain provides a standard interface for agents, a selection of agents to choose from, and examples of end to end agents. Memory: Memory is the
-----
how do I use the LLMChain in LangChain?`
```
Now we ask the question:
```
`# system message to 'prime' the model
primer = f"""You are Q&A bot. A highly intelligent system that answers
user questions based on the information provided by the user above
each question. If the information can not be found in the information
provided by the user you truthfully say "I don't know".
"""
res = openai.ChatCompletion.create(
model="gpt-4",
messages=[
{"role": "system", "content": primer},
{"role": "user", "content": augmented\_query}
]
)`
```
To display this response nicely, we will display it in markdown.
```
`from IPython.display import Markdown
display(Markdown(res['choices'][0]['message']['content']))`
```
To use the LLMChain in LangChain, follow these steps:
1. Import the necessary classes:
```
`from langchain.prompts import PromptTemplate
from langchain.llms import OpenAI
from langchain.chains import LLMChain`
```
1. Create an instance of the LLM and set the configuration options:
```
`llm = OpenAI(temperature=0.9)`
```
1. Create a PromptTemplate instance with the input variables and the template:
```
`prompt = PromptTemplate(
input\_variables=["product"],
template="What is a good product for {product}?",
)`
```
1. Create an LLMChain instance by passing the LLM and PromptTemplate instances:
```
`llm\_chain = LLMChain(llm=llm, prompt\_template=prompt)`
```
1. Run the LLMChain with user input:
```
`response = llm\_chain.run({"product": "software development"})`
```
1. Access the generated response:
```
`generated\_text = response["generated\_text"]`
```
In this example, the LLMChain is used to generate a response by passing through the user input and formatting it using the prompt template. The response is then obtained from the LLM instance (in this case, OpenAI), and the generated text can be accessed from the response dictionary.
Let’s compare this to a non-augmented query…
```
`res = openai.ChatCompletion.create(
model="gpt-4",
messages=[
{"role": "system", "content": primer},
{"role": "user", "content": query}
]
)
display(Markdown(res['choices'][0]['message']['content']))`
```
I don’t know.
If we drop the `"I don't know"` part of the `primer`?
```
`res = openai.ChatCompletion.create(
model="gpt-4",
messages=[
{"role": "system", "content": "You are Q&A bot. A highly intelligent system that answers user questions"},
{"role": "user", "content": query}
]
)
display(Markdown(res['choices'][0]['message']['content']))`
```
LangChain hasn’t provided any public documentation on LLMChain, nor is there a known technology called LLMChain in their library. To better assist you, please provide more information or context about LLMChain and LangChain.
Meanwhile, if you are referring to LangChain, a blockchain-based decentralized AI language model, you can start by visiting their official website (if they have one), exploring their available resources, such as documentation and tutorials, and following any instructions on setting up their technology.
If you are looking for help with a specific language chain or model in natural language processing, consider rephrasing your question to provide more accurate information or visit relevant resources like GPT-3 or other NLP-related documentation.