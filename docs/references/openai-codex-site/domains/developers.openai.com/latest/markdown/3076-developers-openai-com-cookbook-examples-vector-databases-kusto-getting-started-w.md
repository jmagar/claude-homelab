Kusto as a vector database for embeddings
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
May 10, 2023
# Kusto as a vector database for embeddings
[ AS ](<https://github.com/Anshul Sharma>)
[ Anshul Sharma ](<https://github.com/Anshul Sharma>)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/kusto/Getting_started_with_kusto_and_openai_embeddings.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/kusto/Getting_started_with_kusto_and_openai_embeddings.ipynb)
This Notebook provides step by step instuctions on using Azure Data Explorer (Kusto) as a vector database with OpenAI embeddings.
This notebook presents an end-to-end process of:
1. Using precomputed embeddings created by OpenAI API.
2. Storing the embeddings in Kusto.
3. Converting raw text query to an embedding with OpenAI API.
4. Using Kusto to perform cosine similarity search in the stored embeddings
### Prerequisites
For the purposes of this exercise we need to prepare a couple of things:
1. Azure Data Explorer(Kusto) server instance. [https://azure.microsoft.com/en-us/products/data-explorer](https://azure.microsoft.com/en-us/products/data-explorer)
2. Azure OpenAI credentials or OpenAI API key.
```
`%pip install wget`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, -1, Finished, Available)`
```
```
`Collecting wget
Downloading wget-3.2.zip (10 kB)
Preparing metadata (setup.py) ... [?25ldone
[?25hBuilding wheels for collected packages: wget
Building wheel for wget (setup.py) ... [?25l- done
[?25h Created wheel for wget: filename=wget-3.2-py3-none-any.whl size=9657 sha256=10fd8aa1d20fd49c36389dc888acc721d0578c5a0635fc9fc5dc642c0f49522e
Stored in directory: /home/trusted-service-user/.cache/pip/wheels/8b/f1/7f/5c94f0a7a505ca1c81cd1d9208ae2064675d97582078e6c769
Successfully built wget
Installing collected packages: wget
Successfully installed wget-3.2
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m23.0[0m[39;49m -\> [0m[32;49m23.1.2[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49m/nfs4/pyenv-27214bb4-edfd-4fdd-b888-8a99075a1416/bin/python -m pip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
```
`Warning: PySpark kernel has been restarted to use updated packages.`
```
```
`%pip install openai`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, -1, Finished, Available)`
```
```
`Collecting openai
Downloading openai-0.27.6-py3-none-any.whl (71 kB)
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m71.9/71.9 kB[0m [31m1.7 MB/s[0m eta [36m0:00:00[0m00:01[0m
[?25hRequirement already satisfied: tqdm in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from openai) (4.65.0)
Requirement already satisfied: requests\>=2.20 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from openai) (2.28.2)
Requirement already satisfied: aiohttp in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from openai) (3.8.4)
Requirement already satisfied: urllib3\<1.27,\>=1.21.1 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (1.26.14)
Requirement already satisfied: certifi\>=2017.4.17 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (2022.12.7)
Requirement already satisfied: idna\<4,\>=2.5 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (3.4)
Requirement already satisfied: charset-normalizer\<4,\>=2 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.20-\>openai) (2.1.1)
Requirement already satisfied: attrs\>=17.3.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from aiohttp-\>openai) (22.2.0)
Requirement already satisfied: frozenlist\>=1.1.1 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from aiohttp-\>openai) (1.3.3)
Requirement already satisfied: multidict\<7.0,\>=4.5 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from aiohttp-\>openai) (6.0.4)
Requirement already satisfied: yarl\<2.0,\>=1.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from aiohttp-\>openai) (1.8.2)
Requirement already satisfied: async-timeout\<5.0,\>=4.0.0a3 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from aiohttp-\>openai) (4.0.2)
Requirement already satisfied: aiosignal\>=1.1.2 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from aiohttp-\>openai) (1.3.1)
Installing collected packages: openai
Successfully installed openai-0.27.6
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m23.0[0m[39;49m -\> [0m[32;49m23.1.2[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49m/nfs4/pyenv-27214bb4-edfd-4fdd-b888-8a99075a1416/bin/python -m pip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
```
`Warning: PySpark kernel has been restarted to use updated packages.`
```
```
`%pip install azure-kusto-data`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, -1, Finished, Available)`
```
```
`Requirement already satisfied: azure-kusto-data in /nfs4/pyenv-27214bb4-edfd-4fdd-b888-8a99075a1416/lib/python3.10/site-packages (4.1.4)
Requirement already satisfied: msal\<2,\>=1.9.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-kusto-data) (1.21.0)
Requirement already satisfied: python-dateutil\>=2.8.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-kusto-data) (2.8.2)
Requirement already satisfied: azure-core\<2,\>=1.11.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-kusto-data) (1.26.4)
Requirement already satisfied: requests\>=2.13.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-kusto-data) (2.28.2)
Requirement already satisfied: ijson\~=3.1 in /nfs4/pyenv-27214bb4-edfd-4fdd-b888-8a99075a1416/lib/python3.10/site-packages (from azure-kusto-data) (3.2.0.post0)
Requirement already satisfied: azure-identity\<2,\>=1.5.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-kusto-data) (1.12.0)
Requirement already satisfied: six\>=1.11.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-core\<2,\>=1.11.0-\>azure-kusto-data) (1.16.0)
Requirement already satisfied: typing-extensions\>=4.3.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-core\<2,\>=1.11.0-\>azure-kusto-data) (4.5.0)
Requirement already satisfied: cryptography\>=2.5 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-identity\<2,\>=1.5.0-\>azure-kusto-data) (40.0.1)
Requirement already satisfied: msal-extensions\<2.0.0,\>=0.3.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from azure-identity\<2,\>=1.5.0-\>azure-kusto-data) (1.0.0)
Requirement already satisfied: PyJWT[crypto]\<3,\>=1.0.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from msal\<2,\>=1.9.0-\>azure-kusto-data) (2.6.0)
Requirement already satisfied: urllib3\<1.27,\>=1.21.1 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.13.0-\>azure-kusto-data) (1.26.14)
Requirement already satisfied: charset-normalizer\<4,\>=2 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.13.0-\>azure-kusto-data) (2.1.1)
Requirement already satisfied: idna\<4,\>=2.5 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.13.0-\>azure-kusto-data) (3.4)
Requirement already satisfied: certifi\>=2017.4.17 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from requests\>=2.13.0-\>azure-kusto-data) (2022.12.7)
Requirement already satisfied: cffi\>=1.12 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from cryptography\>=2.5-\>azure-identity\<2,\>=1.5.0-\>azure-kusto-data) (1.15.1)
Requirement already satisfied: portalocker\<3,\>=1.0 in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from msal-extensions\<2.0.0,\>=0.3.0-\>azure-identity\<2,\>=1.5.0-\>azure-kusto-data) (2.7.0)
Requirement already satisfied: pycparser in /home/trusted-service-user/cluster-env/trident\_env/lib/python3.10/site-packages (from cffi\>=1.12-\>cryptography\>=2.5-\>azure-identity\<2,\>=1.5.0-\>azure-kusto-data) (2.21)
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m A new release of pip is available: [0m[31;49m23.0[0m[39;49m -\> [0m[32;49m23.1.2[0m
[1m[[0m[34;49mnotice[0m[1;39;49m][0m[39;49m To update, run: [0m[32;49m/nfs4/pyenv-27214bb4-edfd-4fdd-b888-8a99075a1416/bin/python -m pip install --upgrade pip[0m
Note: you may need to restart the kernel to use updated packages.`
```
```
`Warning: PySpark kernel has been restarted to use updated packages.`
```
### Download precomputed Embeddings
In this section we are going to load prepared embedding data, so you don’t have to recompute the embeddings of Wikipedia articles with your own credits.
```
`import wget
embeddings\_url = "https://cdn.openai.com/API/examples/data/vector\_database\_wikipedia\_articles\_embedded.zip"
# The file is \~700 MB so this will take some time
wget.download(embeddings\_url)`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 17, Finished, Available)`
```
```
`'vector\_database\_wikipedia\_articles\_embedded.zip'`
```
```
`
import zipfile
with zipfile.ZipFile("vector\_database\_wikipedia\_articles\_embedded.zip","r") as zip\_ref:
zip\_ref.extractall("/lakehouse/default/Files/data")`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 18, Finished, Available)`
```
```
`import pandas as pd
from ast import literal\_eval
article\_df = pd.read\_csv('/lakehouse/default/Files/data/vector\_database\_wikipedia\_articles\_embedded.csv')
# Read vectors from strings back into a list
article\_df["title\_vector"] = article\_df.title\_vector.apply(literal\_eval)
article\_df["content\_vector"] = article\_df.content\_vector.apply(literal\_eval)
article\_df.head()`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 19, Finished, Available)`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|
|0|1|https://simple.wikipedia.org/wiki/April|April|April is the fourth month of the year in the J...|[0.001009464613161981, -0.020700545981526375, ...|[-0.011253940872848034, -0.013491976074874401,...|0|
|1|2|https://simple.wikipedia.org/wiki/August|August|August (Aug.) is the eighth month of the year ...|[0.0009286514250561595, 0.000820168002974242, ...|[0.0003609954728744924, 0.007262262050062418, ...|1|
|2|6|https://simple.wikipedia.org/wiki/Art|Art|Art is a creative activity that expresses imag...|[0.003393713850528002, 0.0061537534929811954, ...|[-0.004959689453244209, 0.015772193670272827, ...|2|
|3|8|https://simple.wikipedia.org/wiki/A|A|A or a is the first letter of the English alph...|[0.0153952119871974, -0.013759135268628597, 0....|[0.024894846603274345, -0.022186409682035446, ...|3|
|4|9|https://simple.wikipedia.org/wiki/Air|Air|Air refers to the Earth's atmosphere. Air is a...|[0.02224554680287838, -0.02044147066771984, -0...|[0.021524671465158463, 0.018522677943110466, -...|4|
### Store vectors in a Kusto table
Create a table & load the vectors in Kusto based on the contents in the dataframe. The spark option CreakeIfNotExists will automatically create a table if it doesn’t exist
```
`# replace with your AAD Tenant ID, Kusto Cluster URI, Kusto DB name and Kusto Table
AAD\_TENANT\_ID = ""
KUSTO\_CLUSTER = ""
KUSTO\_DATABASE = "Vector"
KUSTO\_TABLE = "Wiki"`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 37, Finished, Available)`
```
```
`
kustoOptions = {"kustoCluster": KUSTO\_CLUSTER, "kustoDatabase" :KUSTO\_DATABASE, "kustoTable" : KUSTO\_TABLE }
# Replace the auth method based on your desired authentication mechanism - https://github.com/Azure/azure-kusto-spark/blob/master/docs/Authentication.md
access\_token=mssparkutils.credentials.getToken(kustoOptions["kustoCluster"])`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 21, Finished, Available)`
```
```
`#Pandas data frame to spark dataframe
sparkDF=spark.createDataFrame(article\_df)`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 22, Finished, Available)`
```
```
`/opt/spark/python/lib/pyspark.zip/pyspark/sql/pandas/conversion.py:604: FutureWarning: iteritems is deprecated and will be removed in a future version. Use .items instead.`
```
```
`# Write data to a Kusto table
sparkDF.write. \\
format("com.microsoft.kusto.spark.synapse.datasource"). \\
option("kustoCluster",kustoOptions["kustoCluster"]). \\
option("kustoDatabase",kustoOptions["kustoDatabase"]). \\
option("kustoTable", kustoOptions["kustoTable"]). \\
option("accessToken", access\_token). \\
option("tableCreateOptions", "CreateIfNotExist").\\
mode("Append"). \\
save()`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 23, Finished, Available)`
```
### Prepare your OpenAI API key
#
The OpenAI API key is used for vectorization of the documents and queries. You can follow the instructions to create and retrieve your Azure OpenAI key and endpoint. [https://learn.microsoft.com/en-us/azure/cognitive-services/openai/tutorials/embeddings](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/tutorials/embeddings)
Please make sure to use the `text-embedding-3-small` model. Since the precomputed embeddings were created with `text-embedding-3-small` model we also have to use it during search.
```
`import openai`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 43, Finished, Available)`
```
#### If using Azure Open AI
```
`openai.api\_version = '2022-12-01'
openai.api\_base = '' # Please add your endpoint here
openai.api\_type = 'azure'
openai.api\_key = '' # Please add your api key here
def embed(query):
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(
input=query,
deployment\_id="embed", #replace with your deployment id
chunk\_size=1
)["data"][0]["embedding"]
return embedded\_query`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 44, Finished, Available)`
```
#### If using Open AI
Only run this cell if you plan to use Open AI for embedding
```
`openai.api\_key = ""
def embed(query):
# Creates embedding vector from user query
embedded\_query = openai.Embedding.create(
input=query,
model="text-embedding-3-small",
)["data"][0]["embedding"]
return embedded\_query`
```
### Generate embedding for the search term
```
`
searchedEmbedding = embed("places where you worship")
#print(searchedEmbedding)`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 45, Finished, Available)`
```
#### Semantic search in Kusto
We will search the Kusto table for the closest vectors.
We will be using the series-cosine-similarity-fl UDF for similarity search.
Please create the function in your database before proceeding -
[https://learn.microsoft.com/en-us/azure/data-explorer/kusto/functions-library/series-cosine-similarity-fl?tabs=query-defined](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/functions-library/series-cosine-similarity-fl?tabs=query-defined)
```
`from azure.kusto.data import KustoClient, KustoConnectionStringBuilder
from azure.kusto.data.exceptions import KustoServiceError
from azure.kusto.data.helpers import dataframe\_from\_result\_table
import pandas as pd`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 35, Finished, Available)`
```
```
`KCSB = KustoConnectionStringBuilder.with\_aad\_device\_authentication(
KUSTO\_CLUSTER)
KCSB.authority\_id = AAD\_TENANT\_ID`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 38, Finished, Available)`
```
```
`KUSTO\_CLIENT = KustoClient(KCSB)`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 39, Finished, Available)`
```
```
`KUSTO\_QUERY = "Wiki | extend similarity = series\_cosine\_similarity\_fl(dynamic("+str(searchedEmbedding)+"), content\_vector,1,1) | top 10 by similarity desc "
RESPONSE = KUSTO\_CLIENT.execute(KUSTO\_DATABASE, KUSTO\_QUERY)`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 48, Finished, Available)`
```
```
`df = dataframe\_from\_result\_table(RESPONSE.primary\_results[0])
df`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 49, Finished, Available)`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|similarity|
|0|852|https://simple.wikipedia.org/wiki/Temple|Temple|A temple is a building where people go to prac...|[-0.021837441250681877, -0.007722342386841774,...|[-0.0019541378132998943, 0.007151313126087189,...|413|0.834495|
|1|78094|https://simple.wikipedia.org/wiki/Christian%20...|Christian worship|In Christianity, worship has been thought as b...|[0.0017675267299637198, -0.008890199474990368,...|[0.020530683919787407, 0.0024345638230443, -0....|20320|0.832132|
|2|59154|https://simple.wikipedia.org/wiki/Service%20of...|Service of worship|A service of worship is a religious meeting wh...|[-0.007969820871949196, 0.0004240311391185969,...|[0.003784010885283351, -0.0030924836173653603,...|15519|0.831633|
|3|51910|https://simple.wikipedia.org/wiki/Worship|Worship|Worship is a word often used in religion. It ...|[0.0036036288365721703, -0.01276545226573944, ...|[0.007925753481686115, -0.0110504487529397, 0....|14010|0.828185|
|4|29576|https://simple.wikipedia.org/wiki/Altar|Altar|An altar is a place, often a table, where a re...|[0.007887467741966248, -0.02706138789653778, -...|[0.023901859298348427, -0.031175222247838977, ...|8708|0.824124|
|5|92507|https://simple.wikipedia.org/wiki/Shrine|Shrine|A shrine is a holy or sacred place with someth...|[-0.011601685546338558, 0.006366696208715439, ...|[0.016423320397734642, -0.0015560361789539456,...|23945|0.823863|
|6|815|https://simple.wikipedia.org/wiki/Synagogue|Synagogue|A synagogue is a place where Jews meet to wors...|[-0.017317570745944977, 0.0022673190105706453,...|[-0.004515442531555891, 0.003739549545571208, ...|398|0.819942|
|7|68080|https://simple.wikipedia.org/wiki/Shinto%20shrine|Shinto shrine|A Shinto shrine is a sacred place or site wher...|[0.0035740730818361044, 0.0028098472394049168,...|[0.011014971882104874, 0.00042272370774298906,...|18106|0.818475|
|8|57790|https://simple.wikipedia.org/wiki/Chapel|Chapel|A chapel is a place for Christian worship. The...|[-0.01371884811669588, 0.0031672674231231213, ...|[0.002526090247556567, 0.02482965588569641, 0....|15260|0.817608|
|9|142|https://simple.wikipedia.org/wiki/Church%20%28...|Church (building)|A church is a building that was constructed to...|[0.0021336888894438744, 0.0029748091474175453,...|[0.016109377145767212, 0.022908871993422508, 0...|74|0.812636|
```
`searchedEmbedding = embed("unfortunate events in history")`
```
```
`KUSTO\_QUERY = "Wiki | extend similarity = series\_cosine\_similarity\_fl(dynamic("+str(searchedEmbedding)+"), title\_vector,1,1) | top 10 by similarity desc "
RESPONSE = KUSTO\_CLIENT.execute(KUSTO\_DATABASE, KUSTO\_QUERY)
df = dataframe\_from\_result\_table(RESPONSE.primary\_results[0])
df`
```
```
`StatementMeta(, 7e5070d2-4560-4fb8-a3a8-6a594acd58ab, 52, Finished, Available)`
```
||id|url|title|text|title\_vector|content\_vector|vector\_id|similarity|
|0|848|https://simple.wikipedia.org/wiki/Tragedy|Tragedy|In theatre, a tragedy as defined by Aristotle ...|[-0.019502468407154083, -0.010160734876990318,...|[-0.012951433658599854, -0.018836138769984245,...|410|0.851848|
|1|4469|https://simple.wikipedia.org/wiki/The%20Holocaust|The Holocaust|The Holocaust, sometimes called The Shoah (), ...|[-0.030233195051550865, -0.024401605129241943,...|[-0.016398731619119644, -0.013267949223518372,...|1203|0.847222|
|2|64216|https://simple.wikipedia.org/wiki/List%20of%20...|List of historical plagues|This list contains famous or well documented o...|[-0.010667890310287476, -0.0003575817099772393...|[-0.010863155126571655, -0.0012196656316518784...|16859|0.844411|
|3|4397|https://simple.wikipedia.org/wiki/List%20of%20...|List of disasters|This is a list of disasters, both natural and ...|[-0.02713736332952976, -0.005278210621327162, ...|[-0.023679986596107483, -0.006126823835074902,...|1158|0.843063|
|4|23073|https://simple.wikipedia.org/wiki/Disaster|Disaster|A disaster is something very not good that hap...|[-0.018235962837934497, -0.020034968852996823,...|[-0.02504003793001175, 0.007415903266519308, 0...|7251|0.840334|
|5|4382|https://simple.wikipedia.org/wiki/List%20of%20...|List of terrorist incidents|The following is a list by date of acts and fa...|[-0.03989032283425331, -0.012808636762201786, ...|[-0.045838188380002975, -0.01682935282588005, ...|1149|0.836162|
|6|13528|https://simple.wikipedia.org/wiki/A%20Series%2...|A Series of Unfortunate Events|A Series of Unfortunate Events is a series of ...|[0.0010618815431371331, -0.0267023965716362, -...|[0.002801976166665554, -0.02904471382498741, -...|4347|0.835172|
|7|42874|https://simple.wikipedia.org/wiki/History%20of...|History of the world|The history of the world (also called human hi...|[0.0026915925554931164, -0.022206028923392296,...|[0.013645033352077007, -0.005165994167327881, ...|11672|0.830243|
|8|4452|https://simple.wikipedia.org/wiki/Accident|Accident|An accident is when something goes wrong when ...|[-0.004075294826179743, -0.0059883203357458115...|[0.00926120299845934, 0.013705797493457794, 0....|1190|0.826898|
|9|324|https://simple.wikipedia.org/wiki/History|History|History is the study of past events. People kn...|[0.006603690329939127, -0.011856242083013058, ...|[0.0048830462619662285, 0.0032003086525946856,...|170|0.824645|