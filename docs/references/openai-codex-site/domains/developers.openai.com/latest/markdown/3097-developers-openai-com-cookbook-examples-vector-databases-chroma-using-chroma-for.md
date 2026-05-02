Using Chroma for embeddings search
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
Jun 28, 2023
# Using Chroma for embeddings search
[ CJ ](https://twitter.com/colintjarvis)[ AT ](https://github.com/atroyn)
[ Colin Jarvis
(OpenAI)
, ](https://twitter.com/colintjarvis)[ atroyn ](https://github.com/atroyn)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/chroma/Using_Chroma_for_embeddings_search.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/chroma/Using_Chroma_for_embeddings_search.ipynb)
This notebook takes you through a simple flow to download some data, embed it, and then index and search it using a selection of vector databases. This is a common requirement for customers who want to store and search our embeddings with their own data in a secure environment to support production use cases such as chatbots, topic modelling and more.
### What is a Vector Database
A vector database is a database made to store, manage and search embedding vectors. The use of embeddings to encode unstructured data (text, audio, video and more) as vectors for consumption by machine-learning models has exploded in recent years, due to the increasing effectiveness of AI in solving use cases involving natural language, image recognition and other unstructured forms of data. Vector databases have emerged as an effective solution for enterprises to deliver and scale these use cases.
### Why use a Vector Database
Vector databases enable enterprises to take many of the embeddings use cases we’ve shared in this repo (question and answering, chatbot and recommendation services, for example), and make use of them in a secure, scalable environment. Many of our customers make embeddings solve their problems at small scale but performance and security hold them back from going into production - we see vector databases as a key component in solving that, and in this guide we’ll walk through the basics of embedding text data, storing it in a vector database and using it for semantic search.
### Demo Flow
The demo flow is:
* **Setup**: Import packages and set any required variables
* **Load data**: Load a dataset and embed it using OpenAI embeddings
* **Chroma**:
* *Setup*: Here we’ll set up the Python client for Chroma. For more details go [here](https://docs.trychroma.com/usage-guide)
* *Index Data*: We’ll create collections with vectors for **titles** and **content**
* *Search Data*: We’ll run a few searches to confirm it works
Once you’ve run through this notebook you should have a basic understanding of how to setup and use vector databases, and can move on to more complex use cases making use of our embeddings.
## Setup
Import the required libraries and set the embedding model that we’d like to use.
```
`# Make sure the OpenAI library is installed
%pip install openai
# We'll need to install the Chroma client
%pip install chromadb
# Install wget to pull zip file
%pip install wget
# Install numpy for data manipulation
%pip install numpy`
```
```
`Collecting openai
Obtaining dependency information for openai from https://files.pythonhosted.org/packages/67/78/7588a047e458cb8075a4089d721d7af5e143ff85a2388d4a28c530be0494/openai-0.27.8-py3-none-any.whl.metadata
Downloading openai-0.27.8-py3-none-any.whl.metadata (13 kB)
Collecting requests\>=2.20 (from openai)
Obtaining dependency information for requests\>=2.20 from https://files.pythonhosted.org/packages/70/8e/0e2d847013cb52cd35b38c009bb167a1a26b2ce6cd6965bf26b47bc0bf44/requests-2.31.0-py3-none-any.whl.metadata
Using cached requests-2.31.0-py3-none-any.whl.metadata (4.6 kB)
Collecting tqdm (from openai)
Using cached tqdm-4.65.0-py3-none-any.whl (77 kB)
Collecting aiohttp (from openai)
Obtaining dependency information for aiohttp from https://files.pythonhosted.org/packages/fa/9e/49002fde2a97d7df0e162e919c31cf13aa9f184537739743d1239edd0e67/aiohttp-3.8.5-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Downloading aiohttp-3.8.5-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (7.7 kB)
Collecting charset-normalizer\<4,\>=2 (from requests\>=2.20-\>openai)
Obtaining dependency information for charset-normalizer\<4,\>=2 from https://files.pythonhosted.org/packages/ec/a7/96835706283d63fefbbbb4f119d52f195af00fc747e67cc54397c56312c8/charset\_normalizer-3.2.0-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Using cached charset\_normalizer-3.2.0-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (31 kB)
Collecting idna\<4,\>=2.5 (from requests\>=2.20-\>openai)
Using cached idna-3.4-py3-none-any.whl (61 kB)
Collecting urllib3\<3,\>=1.21.1 (from requests\>=2.20-\>openai)
Obtaining dependency information for urllib3\<3,\>=1.21.1 from https://files.pythonhosted.org/packages/9b/81/62fd61001fa4b9d0df6e31d47ff49cfa9de4af03adecf339c7bc30656b37/urllib3-2.0.4-py3-none-any.whl.metadata
Downloading urllib3-2.0.4-py3-none-any.whl.metadata (6.6 kB)
Collecting certifi\>=2017.4.17 (from requests\>=2.20-\>openai)
Using cached certifi-2023.5.7-py3-none-any.whl (156 kB)
Collecting attrs\>=17.3.0 (from aiohttp-\>openai)
Using cached attrs-23.1.0-py3-none-any.whl (61 kB)
Collecting multidict\<7.0,\>=4.5 (from aiohttp-\>openai)
Using cached multidict-6.0.4-cp310-cp310-macosx\_11\_0\_arm64.whl (29 kB)
Collecting async-timeout\<5.0,\>=4.0.0a3 (from aiohttp-\>openai)
Using cached async\_timeout-4.0.2-py3-none-any.whl (5.8 kB)
Collecting yarl\<2.0,\>=1.0 (from aiohttp-\>openai)
Using cached yarl-1.9.2-cp310-cp310-macosx\_11\_0\_arm64.whl (62 kB)
Collecting frozenlist\>=1.1.1 (from aiohttp-\>openai)
Obtaining dependency information for frozenlist\>=1.1.1 from https://files.pythonhosted.org/packages/67/6a/55a49da0fa373ac9aa49ccd5b6393ecc183e2a0904d9449ea3ee1163e0b1/frozenlist-1.4.0-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Downloading frozenlist-1.4.0-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (5.2 kB)
Collecting aiosignal\>=1.1.2 (from aiohttp-\>openai)
Using cached aiosignal-1.3.1-py3-none-any.whl (7.6 kB)
Using cached openai-0.27.8-py3-none-any.whl (73 kB)
Using cached requests-2.31.0-py3-none-any.whl (62 kB)
Downloading aiohttp-3.8.5-cp310-cp310-macosx\_11\_0\_arm64.whl (343 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m343.9/343.9 kB[0m [31m11.4 MB/s[0m eta [36m0:00:00[0m
[?25hUsing cached charset\_normalizer-3.2.0-cp310-cp310-macosx\_11\_0\_arm64.whl (124 kB)
Downloading frozenlist-1.4.0-cp310-cp310-macosx\_11\_0\_arm64.whl (46 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m46.0/46.0 kB[0m [31m4.4 MB/s[0m eta [36m0:00:00[0m
[?25hDownloading urllib3-2.0.4-py3-none-any.whl (123 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m123.9/123.9 kB[0m [31m20.0 MB/s[0m eta [36m0:00:00[0m
[?25hInstalling collected packages: urllib3, tqdm, multidict, idna, frozenlist, charset-normalizer, certifi, attrs, async-timeout, yarl, requests, aiosignal, aiohttp, openai
Successfully installed aiohttp-3.8.5 aiosignal-1.3.1 async-timeout-4.0.2 attrs-23.1.0 certifi-2023.5.7 charset-normalizer-3.2.0 frozenlist-1.4.0 idna-3.4 multidict-6.0.4 openai-0.27.8 requests-2.31.0 tqdm-4.65.0 urllib3-2.0.4 yarl-1.9.2
Note: you may need to restart the kernel to use updated packages.
Collecting chromadb
Obtaining dependency information for chromadb from https://files.pythonhosted.org/packages/47/b7/41d975f02818c965cdb8a119cab5a38cfb08e0c1abb18efebe9a373ea97b/chromadb-0.4.2-py3-none-any.whl.metadata
Downloading chromadb-0.4.2-py3-none-any.whl.metadata (6.9 kB)
Collecting pandas\>=1.3 (from chromadb)
Obtaining dependency information for pandas\>=1.3 from https://files.pythonhosted.org/packages/4a/f6/f620ca62365d83e663a255a41b08d2fc2eaf304e0b8b21bb6d62a7390fe3/pandas-2.0.3-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Using cached pandas-2.0.3-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (18 kB)
Requirement already satisfied: requests\>=2.28 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from chromadb) (2.31.0)
Collecting pydantic\<2.0,\>=1.9 (from chromadb)
Obtaining dependency information for pydantic\<2.0,\>=1.9 from https://files.pythonhosted.org/packages/79/3e/6b4d0fb2174beceac9a991ba8e67158b45c35faca9ea4545ae32d47096cd/pydantic-1.10.11-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Using cached pydantic-1.10.11-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (148 kB)
Collecting chroma-hnswlib==0.7.1 (from chromadb)
Obtaining dependency information for chroma-hnswlib==0.7.1 from https://files.pythonhosted.org/packages/a5/d5/54947127f5cb2a1fcef40877fb3e6044495eec0a158ba0956babe4ab2a77/chroma\_hnswlib-0.7.1-cp310-cp310-macosx\_13\_0\_arm64.whl.metadata
Using cached chroma\_hnswlib-0.7.1-cp310-cp310-macosx\_13\_0\_arm64.whl.metadata (252 bytes)
Collecting fastapi\<0.100.0,\>=0.95.2 (from chromadb)
Obtaining dependency information for fastapi\<0.100.0,\>=0.95.2 from https://files.pythonhosted.org/packages/73/eb/03b691afa0b5ffa1e93ed34f97ec1e7855c758efbdcfb16c209af0b0506b/fastapi-0.99.1-py3-none-any.whl.metadata
Using cached fastapi-0.99.1-py3-none-any.whl.metadata (23 kB)
Collecting uvicorn[standard]\>=0.18.3 (from chromadb)
Obtaining dependency information for uvicorn[standard]\>=0.18.3 from https://files.pythonhosted.org/packages/5d/07/b9eac057f7efa56900640a233c1ed63db83568322c6bcbabe98f741d5289/uvicorn-0.23.1-py3-none-any.whl.metadata
Using cached uvicorn-0.23.1-py3-none-any.whl.metadata (6.2 kB)
Collecting numpy\>=1.21.6 (from chromadb)
Obtaining dependency information for numpy\>=1.21.6 from https://files.pythonhosted.org/packages/1b/cd/9e8313ffd849626c836fffd7881296a74f53a7739bd9ce7a6e22b1fc843b/numpy-1.25.1-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Using cached numpy-1.25.1-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (5.6 kB)
Collecting posthog\>=2.4.0 (from chromadb)
Using cached posthog-3.0.1-py2.py3-none-any.whl (37 kB)
Requirement already satisfied: typing-extensions\>=4.5.0 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from chromadb) (4.7.1)
Collecting pulsar-client\>=3.1.0 (from chromadb)
Obtaining dependency information for pulsar-client\>=3.1.0 from https://files.pythonhosted.org/packages/43/85/ab0455008ce3335a1c75a7c500fd8921ab166f34821fa67dc91ae9687a40/pulsar\_client-3.2.0-cp310-cp310-macosx\_10\_15\_universal2.whl.metadata
Using cached pulsar\_client-3.2.0-cp310-cp310-macosx\_10\_15\_universal2.whl.metadata (1.0 kB)
Collecting onnxruntime\>=1.14.1 (from chromadb)
Obtaining dependency information for onnxruntime\>=1.14.1 from https://files.pythonhosted.org/packages/cf/06/0c6e355b9ddbebc34d0e21bc5be1e4bd2c124ebd9030525838fa6e65eaa8/onnxruntime-1.15.1-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Using cached onnxruntime-1.15.1-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (4.0 kB)
Collecting tokenizers\>=0.13.2 (from chromadb)
Using cached tokenizers-0.13.3-cp310-cp310-macosx\_12\_0\_arm64.whl (3.9 MB)
Collecting pypika\>=0.48.9 (from chromadb)
Using cached PyPika-0.48.9-py2.py3-none-any.whl
Requirement already satisfied: tqdm\>=4.65.0 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from chromadb) (4.65.0)
Collecting overrides\>=7.3.1 (from chromadb)
Using cached overrides-7.3.1-py3-none-any.whl (17 kB)
Collecting importlib-resources (from chromadb)
Obtaining dependency information for importlib-resources from https://files.pythonhosted.org/packages/29/d1/bed03eca30aa05aaf6e0873de091f9385c48705c4a607c2dfe3edbe543e8/importlib\_resources-6.0.0-py3-none-any.whl.metadata
Using cached importlib\_resources-6.0.0-py3-none-any.whl.metadata (4.2 kB)
Collecting starlette\<0.28.0,\>=0.27.0 (from fastapi\<0.100.0,\>=0.95.2-\>chromadb)
Obtaining dependency information for starlette\<0.28.0,\>=0.27.0 from https://files.pythonhosted.org/packages/58/f8/e2cca22387965584a409795913b774235752be4176d276714e15e1a58884/starlette-0.27.0-py3-none-any.whl.metadata
Using cached starlette-0.27.0-py3-none-any.whl.metadata (5.8 kB)
Collecting coloredlogs (from onnxruntime\>=1.14.1-\>chromadb)
Using cached coloredlogs-15.0.1-py2.py3-none-any.whl (46 kB)
Collecting flatbuffers (from onnxruntime\>=1.14.1-\>chromadb)
Obtaining dependency information for flatbuffers from https://files.pythonhosted.org/packages/6f/12/d5c79ee252793ffe845d58a913197bfa02ae9a0b5c9bc3dc4b58d477b9e7/flatbuffers-23.5.26-py2.py3-none-any.whl.metadata
Using cached flatbuffers-23.5.26-py2.py3-none-any.whl.metadata (850 bytes)
Requirement already satisfied: packaging in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from onnxruntime\>=1.14.1-\>chromadb) (23.1)
Collecting protobuf (from onnxruntime\>=1.14.1-\>chromadb)
Obtaining dependency information for protobuf from https://files.pythonhosted.org/packages/cb/d3/a164038605494d49acc4f9cda1c0bc200b96382c53edd561387263bb181d/protobuf-4.23.4-cp37-abi3-macosx\_10\_9\_universal2.whl.metadata
Using cached protobuf-4.23.4-cp37-abi3-macosx\_10\_9\_universal2.whl.metadata (540 bytes)
Collecting sympy (from onnxruntime\>=1.14.1-\>chromadb)
Using cached sympy-1.12-py3-none-any.whl (5.7 MB)
Requirement already satisfied: python-dateutil\>=2.8.2 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from pandas\>=1.3-\>chromadb) (2.8.2)
Collecting pytz\>=2020.1 (from pandas\>=1.3-\>chromadb)
Using cached pytz-2023.3-py2.py3-none-any.whl (502 kB)
Collecting tzdata\>=2022.1 (from pandas\>=1.3-\>chromadb)
Using cached tzdata-2023.3-py2.py3-none-any.whl (341 kB)
Requirement already satisfied: six\>=1.5 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from posthog\>=2.4.0-\>chromadb) (1.16.0)
Collecting monotonic\>=1.5 (from posthog\>=2.4.0-\>chromadb)
Using cached monotonic-1.6-py2.py3-none-any.whl (8.2 kB)
Collecting backoff\>=1.10.0 (from posthog\>=2.4.0-\>chromadb)
Using cached backoff-2.2.1-py3-none-any.whl (15 kB)
Requirement already satisfied: certifi in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from pulsar-client\>=3.1.0-\>chromadb) (2023.5.7)
Requirement already satisfied: charset-normalizer\<4,\>=2 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from requests\>=2.28-\>chromadb) (3.2.0)
Requirement already satisfied: idna\<4,\>=2.5 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from requests\>=2.28-\>chromadb) (3.4)
Requirement already satisfied: urllib3\<3,\>=1.21.1 in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (from requests\>=2.28-\>chromadb) (2.0.4)
Collecting click\>=7.0 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Obtaining dependency information for click\>=7.0 from https://files.pythonhosted.org/packages/1a/70/e63223f8116931d365993d4a6b7ef653a4d920b41d03de7c59499962821f/click-8.1.6-py3-none-any.whl.metadata
Using cached click-8.1.6-py3-none-any.whl.metadata (3.0 kB)
Collecting h11\>=0.8 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Using cached h11-0.14.0-py3-none-any.whl (58 kB)
Collecting httptools\>=0.5.0 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Obtaining dependency information for httptools\>=0.5.0 from https://files.pythonhosted.org/packages/8f/71/d535e9f6967958d21b8fe1baeb7efb6304b86e8fcff44d0bda8690e0aec9/httptools-0.6.0-cp310-cp310-macosx\_10\_9\_universal2.whl.metadata
Using cached httptools-0.6.0-cp310-cp310-macosx\_10\_9\_universal2.whl.metadata (3.6 kB)
Collecting python-dotenv\>=0.13 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Using cached python\_dotenv-1.0.0-py3-none-any.whl (19 kB)
Collecting pyyaml\>=5.1 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Obtaining dependency information for pyyaml\>=5.1 from https://files.pythonhosted.org/packages/5b/07/10033a403b23405a8fc48975444463d3d10a5c2736b7eb2550b07b367429/PyYAML-6.0.1-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata
Using cached PyYAML-6.0.1-cp310-cp310-macosx\_11\_0\_arm64.whl.metadata (2.1 kB)
Collecting uvloop!=0.15.0,!=0.15.1,\>=0.14.0 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Using cached uvloop-0.17.0-cp310-cp310-macosx\_10\_9\_universal2.whl (2.1 MB)
Collecting watchfiles\>=0.13 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Using cached watchfiles-0.19.0-cp37-abi3-macosx\_11\_0\_arm64.whl (388 kB)
Collecting websockets\>=10.4 (from uvicorn[standard]\>=0.18.3-\>chromadb)
Using cached websockets-11.0.3-cp310-cp310-macosx\_11\_0\_arm64.whl (121 kB)
Collecting anyio\<5,\>=3.4.0 (from starlette\<0.28.0,\>=0.27.0-\>fastapi\<0.100.0,\>=0.95.2-\>chromadb)
Obtaining dependency information for anyio\<5,\>=3.4.0 from https://files.pythonhosted.org/packages/19/24/44299477fe7dcc9cb58d0a57d5a7588d6af2ff403fdd2d47a246c91a3246/anyio-3.7.1-py3-none-any.whl.metadata
Using cached anyio-3.7.1-py3-none-any.whl.metadata (4.7 kB)
Collecting humanfriendly\>=9.1 (from coloredlogs-\>onnxruntime\>=1.14.1-\>chromadb)
Using cached humanfriendly-10.0-py2.py3-none-any.whl (86 kB)
Collecting mpmath\>=0.19 (from sympy-\>onnxruntime\>=1.14.1-\>chromadb)
Using cached mpmath-1.3.0-py3-none-any.whl (536 kB)
Collecting sniffio\>=1.1 (from anyio\<5,\>=3.4.0-\>starlette\<0.28.0,\>=0.27.0-\>fastapi\<0.100.0,\>=0.95.2-\>chromadb)
Using cached sniffio-1.3.0-py3-none-any.whl (10 kB)
Collecting exceptiongroup (from anyio\<5,\>=3.4.0-\>starlette\<0.28.0,\>=0.27.0-\>fastapi\<0.100.0,\>=0.95.2-\>chromadb)
Obtaining dependency information for exceptiongroup from https://files.pythonhosted.org/packages/fe/17/f43b7c9ccf399d72038042ee72785c305f6c6fdc6231942f8ab99d995742/exceptiongroup-1.1.2-py3-none-any.whl.metadata
Using cached exceptiongroup-1.1.2-py3-none-any.whl.metadata (6.1 kB)
Downloading chromadb-0.4.2-py3-none-any.whl (399 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m399.3/399.3 kB[0m [31m12.8 MB/s[0m eta [36m0:00:00[0m
[?25hUsing cached chroma\_hnswlib-0.7.1-cp310-cp310-macosx\_13\_0\_arm64.whl (195 kB)
Using cached fastapi-0.99.1-py3-none-any.whl (58 kB)
Using cached numpy-1.25.1-cp310-cp310-macosx\_11\_0\_arm64.whl (14.0 MB)
Using cached onnxruntime-1.15.1-cp310-cp310-macosx\_11\_0\_arm64.whl (6.1 MB)
Using cached pandas-2.0.3-cp310-cp310-macosx\_11\_0\_arm64.whl (10.8 MB)
Using cached pulsar\_client-3.2.0-cp310-cp310-macosx\_10\_15\_universal2.whl (10.8 MB)
Using cached pydantic-1.10.11-cp310-cp310-macosx\_11\_0\_arm64.whl (2.5 MB)
Using cached importlib\_resources-6.0.0-py3-none-any.whl (31 kB)
Using cached click-8.1.6-py3-none-any.whl (97 kB)
Using cached httptools-0.6.0-cp310-cp310-macosx\_10\_9\_universal2.whl (237 kB)
Using cached PyYAML-6.0.1-cp310-cp310-macosx\_11\_0\_arm64.whl (169 kB)
Using cached starlette-0.27.0-py3-none-any.whl (66 kB)
Using cached flatbuffers-23.5.26-py2.py3-none-any.whl (26 kB)
Using cached protobuf-4.23.4-cp37-abi3-macosx\_10\_9\_universal2.whl (400 kB)
Using cached uvicorn-0.23.1-py3-none-any.whl (59 kB)
Using cached anyio-3.7.1-py3-none-any.whl (80 kB)
Using cached exceptiongroup-1.1.2-py3-none-any.whl (14 kB)
Installing collected packages: tokenizers, pytz, pypika, mpmath, monotonic, flatbuffers, websockets, uvloop, tzdata, sympy, sniffio, pyyaml, python-dotenv, pydantic, pulsar-client, protobuf, overrides, numpy, importlib-resources, humanfriendly, httptools, h11, exceptiongroup, click, backoff, uvicorn, posthog, pandas, coloredlogs, chroma-hnswlib, anyio, watchfiles, starlette, onnxruntime, fastapi, chromadb
Successfully installed anyio-3.7.1 backoff-2.2.1 chroma-hnswlib-0.7.1 chromadb-0.4.2 click-8.1.6 coloredlogs-15.0.1 exceptiongroup-1.1.2 fastapi-0.99.1 flatbuffers-23.5.26 h11-0.14.0 httptools-0.6.0 humanfriendly-10.0 importlib-resources-6.0.0 monotonic-1.6 mpmath-1.3.0 numpy-1.25.1 onnxruntime-1.15.1 overrides-7.3.1 pandas-2.0.3 posthog-3.0.1 protobuf-4.23.4 pulsar-client-3.2.0 pydantic-1.10.11 pypika-0.48.9 python-dotenv-1.0.0 pytz-2023.3 pyyaml-6.0.1 sniffio-1.3.0 starlette-0.27.0 sympy-1.12 tokenizers-0.13.3 tzdata-2023.3 uvicorn-0.23.1 uvloop-0.17.0 watchfiles-0.19.0 websockets-11.0.3
Note: you may need to restart the kernel to use updated packages.
Collecting wget
Using cached wget-3.2.zip (10 kB)
Preparing metadata (setup.py) ... [?25ldone
[?25hBuilding wheels for collected packages: wget
Building wheel for wget (setup.py) ... [?25ldone
[?25h Created wheel for wget: filename=wget-3.2-py3-none-any.whl size=9657 sha256=b2d83c5fcdeab398d0a4e9808a470bbf725fffea4a6130e731c6097b9561005b
Stored in directory: /Users/antontroynikov/Library/Caches/pip/wheels/8b/f1/7f/5c94f0a7a505ca1c81cd1d9208ae2064675d97582078e6c769
Successfully built wget
Installing collected packages: wget
Successfully installed wget-3.2
Note: you may need to restart the kernel to use updated packages.
Requirement already satisfied: numpy in /Users/antontroynikov/miniforge3/envs/chroma-openai-cookbook/lib/python3.10/site-packages (1.25.1)
Note: you may need to restart the kernel to use updated packages.`
```
```
`import openai
import pandas as pd
import os
import wget
from ast import literal\_eval
# Chroma's client library for Python
import chromadb
# I've set this to our new embeddings model, this can be changed to the embedding model of your choice
EMBEDDING\_MODEL = "text-embedding-3-small"
# Ignore unclosed SSL socket warnings - optional in case you get these errors
import warnings
warnings.filterwarnings(action="ignore", message="unclosed", category=ResourceWarning)
warnings.filterwarnings("ignore", category=DeprecationWarning)`
```
## Load data
In this section we’ll load embedded data that we’ve prepared previous to this session.
```
`embeddings\_url = 'https://cdn.openai.com/API/examples/data/vector\_database\_wikipedia\_articles\_embedded.zip'
# The file is \~700 MB so this will take some time
wget.download(embeddings\_url)`
```
```
`'vector\_database\_wikipedia\_articles\_embedded.zip'`
```
```
`import zipfile
with zipfile.ZipFile("vector\_database\_wikipedia\_articles\_embedded.zip","r") as zip\_ref:
zip\_ref.extractall("../data")`
```
```
`article\_df = pd.read\_csv('../data/vector\_database\_wikipedia\_articles\_embedded.csv')`
```
```
`article\_df.head()`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|
|0|1|https://simple.wikipedia.org/wiki/April|April|April is the fourth month of the year in the J...|[0.001009464613161981, -0.020700545981526375, ...|[-0.011253940872848034, -0.013491976074874401,...|0|
|1|2|https://simple.wikipedia.org/wiki/August|August|August (Aug.) is the eighth month of the year ...|[0.0009286514250561595, 0.000820168002974242, ...|[0.0003609954728744924, 0.007262262050062418, ...|1|
|2|6|https://simple.wikipedia.org/wiki/Art|Art|Art is a creative activity that expresses imag...|[0.003393713850528002, 0.0061537534929811954, ...|[-0.004959689453244209, 0.015772193670272827, ...|2|
|3|8|https://simple.wikipedia.org/wiki/A|A|A or a is the first letter of the English alph...|[0.0153952119871974, -0.013759135268628597, 0....|[0.024894846603274345, -0.022186409682035446, ...|3|
|4|9|https://simple.wikipedia.org/wiki/Air|Air|Air refers to the Earth's atmosphere. Air is a...|[0.02224554680287838, -0.02044147066771984, -0...|[0.021524671465158463, 0.018522677943110466, -...|4|
```
`# Read vectors from strings back into a list
article\_df['title\_vector'] = article\_df.title\_vector.apply(literal\_eval)
article\_df['content\_vector'] = article\_df.content\_vector.apply(literal\_eval)
# Set vector\_id to be a string
article\_df['vector\_id'] = article\_df['vector\_id'].apply(str)`
```
```
`article\_df.info(show\_counts=True)`
```
```
`\<class 'pandas.core.frame.DataFrame'\>
RangeIndex: 25000 entries, 0 to 24999
Data columns (total 7 columns):
# Column Non-Null Count Dtype
--- ------ -------------- -----
0 id 25000 non-null int64
1 url 25000 non-null object
2 title 25000 non-null object
3 text 25000 non-null object
4 title\_vector 25000 non-null object
5 content\_vector 25000 non-null object
6 vector\_id 25000 non-null object
dtypes: int64(1), object(6)
memory usage: 1.3+ MB`
```
# Chroma
We’ll index these embedded documents in a vector database and search them. The first option we’ll look at is **Chroma**, an easy to use open-source self-hosted in-memory vector database, designed for working with embeddings together with LLMs.
In this section, we will:
* Instantiate the Chroma client
* Create collections for each class of embedding
* Query each collection
### Instantiate the Chroma client
Create the Chroma client. By default, Chroma is ephemeral and runs in memory.
However, you can easily set up a persistent configuration which writes to disk.
```
`chroma\_client = chromadb.EphemeralClient() # Equivalent to chromadb.Client(), ephemeral.
# Uncomment for persistent client
# chroma\_client = chromadb.PersistentClient()`
```
### Create collections
Chroma collections allow you to store and filter with arbitrary metadata, making it easy to query subsets of the embedded data.
Chroma is already integrated with OpenAI’s embedding functions. The best way to use them is on construction of a collection, as follows.
Alternatively, you can ‘bring your own embeddings’. More information can be found [here](https://docs.trychroma.com/embeddings)
```
`from chromadb.utils.embedding\_functions import OpenAIEmbeddingFunction
# Test that your OpenAI API key is correctly set as an environment variable
# Note. if you run this notebook locally, you will need to reload your terminal and the notebook for the env variables to be live.
# Note. alternatively you can set a temporary env variable like this:
# os.environ["OPENAI\_API\_KEY"] = 'sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
if os.getenv("OPENAI\_API\_KEY") is not None:
openai.api\_key = os.getenv("OPENAI\_API\_KEY")
print ("OPENAI\_API\_KEY is ready")
else:
print ("OPENAI\_API\_KEY environment variable not found")
embedding\_function = OpenAIEmbeddingFunction(api\_key=os.environ.get('OPENAI\_API\_KEY'), model\_name=EMBEDDING\_MODEL)
wikipedia\_content\_collection = chroma\_client.create\_collection(name='wikipedia\_content', embedding\_function=embedding\_function)
wikipedia\_title\_collection = chroma\_client.create\_collection(name='wikipedia\_titles', embedding\_function=embedding\_function)`
```
```
`OPENAI\_API\_KEY is ready`
```
### Populate the collections
Chroma collections allow you to populate, and filter on, whatever metadata you like. Chroma can also store the text alongside the vectors, and return everything in a single `query` call, when this is more convenient.
For this use-case, we’ll just store the embeddings and IDs, and use these to index the original dataframe.
```
`# Add the content vectors
wikipedia\_content\_collection.add(
ids=article\_df.vector\_id.tolist(),
embeddings=article\_df.content\_vector.tolist(),
)
# Add the title vectors
wikipedia\_title\_collection.add(
ids=article\_df.vector\_id.tolist(),
embeddings=article\_df.title\_vector.tolist(),
)`
```
### Search the collections
Chroma handles embedding queries for you if an embedding function is set, like in this example.
```
`def query\_collection(collection, query, max\_results, dataframe):
results = collection.query(query\_texts=query, n\_results=max\_results, include=['distances'])
df = pd.DataFrame({
'id':results['ids'][0],
'score':results['distances'][0],
'title': dataframe[dataframe.vector\_id.isin(results['ids'][0])]['title'],
'content': dataframe[dataframe.vector\_id.isin(results['ids'][0])]['text'],
})
return df`
```
```
`title\_query\_result = query\_collection(
collection=wikipedia\_title\_collection,
query="modern art in Europe",
max\_results=10,
dataframe=article\_df
)
title\_query\_result.head()`
```
||id|score|title|content|
|2|23266|0.249646|Art|Art is a creative activity that expresses imag...|
|11777|15436|0.271688|Hellenistic art|The art of the Hellenistic time (from 400 B.C....|
|12178|23265|0.279306|Byzantine art|Byzantine art is a form of Christian Greek art...|
|13215|11777|0.294415|Art film|Art films are a type of movie that is very dif...|
|15436|22108|0.305937|Renaissance art|Many of the most famous and best-loved works o...|
```
`content\_query\_result = query\_collection(
collection=wikipedia\_content\_collection,
query="Famous battles in Scottish history",
max\_results=10,
dataframe=article\_df
)
content\_query\_result.head()`
```
||id|score|title|content|
|2923|13135|0.261328|1651|\\n\\nEvents \\n January 1 – Charles II crowned K...|
|3694|13571|0.277058|Stirling|Stirling () is a city in the middle of Scotlan...|
|6248|2923|0.294823|841|\\n\\nEvents \\n June 25: Battle of Fontenay – Lo...|
|6297|13568|0.300756|1746|\\n\\nEvents \\n January 8 – Bonnie Prince Charli...|
|11702|11708|0.307572|William Wallace|William Wallace was a Scottish knight who foug...|
Now that you’ve got a basic embeddings search running, you can [hop over to the Chroma docs](https://docs.trychroma.com/usage-guide#using-where-filters) to learn more about how to add filters to your query, update/delete data in your collections, and deploy Chroma.