Getting Started with Zilliz and OpenAI
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
Mar 28, 2023
# Getting Started with Zilliz and OpenAI
This recipe is archived and may reference outdated models or APIs.
[ FI ](https://github.com/filip-halt)
[ filip-halt ](https://github.com/filip-halt)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/zilliz/Getting_started_with_Zilliz_and_OpenAI.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/zilliz/Getting_started_with_Zilliz_and_OpenAI.ipynb)
### Finding your next book
In this notebook we will be going over generating embeddings of book descriptions with OpenAI and using those embeddings within Zilliz to find relevant books. The dataset in this example is sourced from HuggingFace datasets, and contains a little over 1 million title-description pairs.
Lets begin by first downloading the required libraries for this notebook:
* `openai` is used for communicating with the OpenAI embedding service
* `pymilvus` is used for communicating with the Zilliz instance
* `datasets` is used for downloading the dataset
* `tqdm` is used for the progress bars
```
`! pip install openai pymilvus datasets tqdm`
```
```
`Looking in indexes: https://pypi.org/simple, https://pypi.ngc.nvidia.com
Requirement already satisfied: openai in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (0.27.2)
Requirement already satisfied: pymilvus in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (2.2.2)
Requirement already satisfied: datasets in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (2.10.1)
Requirement already satisfied: tqdm in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (4.64.1)
Requirement already satisfied: requests\>=2.20 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from openai) (2.28.2)
Requirement already satisfied: aiohttp in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from openai) (3.8.4)
Requirement already satisfied: ujson\<=5.4.0,\>=2.0.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from pymilvus) (5.1.0)
Requirement already satisfied: grpcio-tools\<=1.48.0,\>=1.47.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from pymilvus) (1.47.2)
Requirement already satisfied: grpcio\<=1.48.0,\>=1.47.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from pymilvus) (1.47.2)
Requirement already satisfied: mmh3\<=3.0.0,\>=2.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from pymilvus) (3.0.0)
Requirement already satisfied: pandas\>=1.2.4 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from pymilvus) (1.5.3)
Requirement already satisfied: numpy\>=1.17 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (1.23.5)
Requirement already satisfied: xxhash in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (3.2.0)
Requirement already satisfied: responses\<0.19 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (0.18.0)
Requirement already satisfied: dill\<0.3.7,\>=0.3.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (0.3.6)
Requirement already satisfied: huggingface-hub\<1.0.0,\>=0.2.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (0.12.1)
Requirement already satisfied: pyarrow\>=6.0.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (10.0.1)
Requirement already satisfied: multiprocess in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (0.70.14)
Requirement already satisfied: pyyaml\>=5.1 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (5.4.1)
Requirement already satisfied: fsspec[http]\>=2021.11.1 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (2023.1.0)
Requirement already satisfied: packaging in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from datasets) (23.0)
Requirement already satisfied: frozenlist\>=1.1.1 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from aiohttp-\>openai) (1.3.3)
Requirement already satisfied: async-timeout\<5.0,\>=4.0.0a3 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from aiohttp-\>openai) (4.0.2)
Requirement already satisfied: aiosignal\>=1.1.2 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from aiohttp-\>openai) (1.3.1)
Requirement already satisfied: attrs\>=17.3.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from aiohttp-\>openai) (22.2.0)
Requirement already satisfied: charset-normalizer\<4.0,\>=2.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from aiohttp-\>openai) (3.0.1)
Requirement already satisfied: yarl\<2.0,\>=1.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from aiohttp-\>openai) (1.8.2)
Requirement already satisfied: multidict\<7.0,\>=4.5 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from aiohttp-\>openai) (6.0.4)
Requirement already satisfied: six\>=1.5.2 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from grpcio\<=1.48.0,\>=1.47.0-\>pymilvus) (1.16.0)
Requirement already satisfied: protobuf\<4.0dev,\>=3.12.0 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from grpcio-tools\<=1.48.0,\>=1.47.0-\>pymilvus) (3.20.1)
Requirement already satisfied: setuptools in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from grpcio-tools\<=1.48.0,\>=1.47.0-\>pymilvus) (65.6.3)
Requirement already satisfied: typing-extensions\>=3.7.4.3 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from huggingface-hub\<1.0.0,\>=0.2.0-\>datasets) (4.5.0)
Requirement already satisfied: filelock in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from huggingface-hub\<1.0.0,\>=0.2.0-\>datasets) (3.9.0)
Requirement already satisfied: python-dateutil\>=2.8.1 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from pandas\>=1.2.4-\>pymilvus) (2.8.2)
Requirement already satisfied: pytz\>=2020.1 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from pandas\>=1.2.4-\>pymilvus) (2022.7.1)
Requirement already satisfied: urllib3\<1.27,\>=1.21.1 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from requests\>=2.20-\>openai) (1.26.14)
Requirement already satisfied: idna\<4,\>=2.5 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from requests\>=2.20-\>openai) (3.4)
Requirement already satisfied: certifi\>=2017.4.17 in /Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages (from requests\>=2.20-\>openai) (2022.12.7)`
```
To get Zilliz up and running take a look [here](https://zilliz.com/doc/quick_start). With your account and database set up, proceed to set the following values:
* URI: The URI your database is running on
* USER: Your database username
* PASSWORD: Your database password
* COLLECTION\_NAME: What to name the collection within Zilliz
* DIMENSION: The dimension of the embeddings
* OPENAI\_ENGINE: Which embedding model to use
* openai.api\_key: Your OpenAI account key
* INDEX\_PARAM: The index settings to use for the collection
* QUERY\_PARAM: The search parameters to use
* BATCH\_SIZE: How many texts to embed and insert at once
```
`import openai
URI = 'your\_uri'
TOKEN = 'your\_token' # TOKEN == user:password or api\_key
COLLECTION\_NAME = 'book\_search'
DIMENSION = 1536
OPENAI\_ENGINE = 'text-embedding-3-small'
openai.api\_key = 'sk-your-key'
INDEX\_PARAM = {
'metric\_type':'L2',
'index\_type':"AUTOINDEX",
'params':{}
}
QUERY\_PARAM = {
"metric\_type": "L2",
"params": {},
}
BATCH\_SIZE = 1000`
```
## Zilliz
This segment deals with Zilliz and setting up the database for this use case. Within Zilliz we need to setup a collection and index it.
```
`from pymilvus import connections, utility, FieldSchema, Collection, CollectionSchema, DataType
# Connect to Zilliz Database
connections.connect(uri=URI, token=TOKEN)`
```
```
`# Remove collection if it already exists
if utility.has\_collection(COLLECTION\_NAME):
utility.drop\_collection(COLLECTION\_NAME)`
```
```
`# Create collection which includes the id, title, and embedding.
fields = [
FieldSchema(name='id', dtype=DataType.INT64, is\_primary=True, auto\_id=True),
FieldSchema(name='title', dtype=DataType.VARCHAR, max\_length=64000),
FieldSchema(name='description', dtype=DataType.VARCHAR, max\_length=64000),
FieldSchema(name='embedding', dtype=DataType.FLOAT\_VECTOR, dim=DIMENSION)
]
schema = CollectionSchema(fields=fields)
collection = Collection(name=COLLECTION\_NAME, schema=schema)`
```
```
`# Create the index on the collection and load it.
collection.create\_index(field\_name="embedding", index\_params=INDEX\_PARAM)
collection.load()`
```
## Dataset
With Zilliz up and running we can begin grabbing our data. `Hugging Face Datasets` is a hub that holds many different user datasets, and for this example we are using Skelebor’s book dataset. This dataset contains title-description pairs for over 1 million books. We are going to embed each description and store it within Zilliz along with its title.
```
`import datasets
# Download the dataset and only use the `train` portion (file is around 800Mb)
dataset = datasets.load\_dataset('Skelebor/book\_titles\_and\_descriptions\_en\_clean', split='train')`
```
```
`/Users/filiphaltmayer/miniconda3/envs/haystack/lib/python3.9/site-packages/tqdm/auto.py:22: TqdmWarning: IProgress not found. Please update jupyter and ipywidgets. See https://ipywidgets.readthedocs.io/en/stable/user\_install.html
from .autonotebook import tqdm as notebook\_tqdm
Found cached dataset parquet (/Users/filiphaltmayer/.cache/huggingface/datasets/Skelebor\_\_\_parquet/Skelebor--book\_titles\_and\_descriptions\_en\_clean-3596935b1d8a7747/0.0.0/2a3b91fbd88a2c90d1dbbb32b460cf621d31bd5b05b934492fdef7d8d6f236ec)`
```
## Insert the Data
Now that we have our data on our machine we can begin embedding it and inserting it into Zilliz. The embedding function takes in text and returns the embeddings in a list format.
```
`# Simple function that converts the texts to embeddings
def embed(texts):
embeddings = openai.Embedding.create(
input=texts,
engine=OPENAI\_ENGINE
)
return [x['embedding'] for x in embeddings['data']]`
```
This next step does the actual inserting. Due to having so many datapoints, if you want to immediately test it out you can stop the inserting cell block early and move along. Doing this will probably decrease the accuracy of the results due to less datapoints, but it should still be good enough.
```
`from tqdm import tqdm
data = [
[], # title
[], # description
]
# Embed and insert in batches
for i in tqdm(range(0, len(dataset))):
data[0].append(dataset[i]['title'])
data[1].append(dataset[i]['description'])
if len(data[0]) % BATCH\_SIZE == 0:
data.append(embed(data[1]))
collection.insert(data)
data = [[],[]]
# Embed and insert the remainder
if len(data[0]) != 0:
data.append(embed(data[1]))
collection.insert(data)
data = [[],[]]`
```
```
` 0%| | 2999/1032335 [00:19\<1:49:30, 156.66it/s]`
```
```
`KeyboardInterrupt
[0;31m---------------------------------------------------------------------------[0m[0;31mKeyboardInterrupt[0m Traceback (most recent call last)Cell [0;32mIn[10], line 14[0m
[1;32m 12[0m [39mif[39;00m [39mlen[39m(data[[39m0[39m]) [39m%[39m BATCH\_SIZE [39m==[39m [39m0[39m:
[1;32m 13[0m data[39m.[39mappend(embed(data[[39m1[39m]))
[0;32m---\> 14[0m collection[39m.[39;49minsert(data)
[1;32m 15[0m data [39m=[39m [[],[]]
[1;32m 17[0m [39m# Embed and insert the remainder [39;00m
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/pymilvus/orm/collection.py:430[0m, in [0;36mCollection.insert[0;34m(self, data, partition\_name, timeout, \*\*kwargs)[0m
[1;32m 427[0m entities [39m=[39m Prepare[39m.[39mprepare\_insert\_data(data, [39mself[39m[39m.[39m\_schema)
[1;32m 429[0m conn [39m=[39m [39mself[39m[39m.[39m\_get\_connection()
[0;32m--\> 430[0m res [39m=[39m conn[39m.[39;49mbatch\_insert([39mself[39;49m[39m.[39;49m\_name, entities, partition\_name,
[1;32m 431[0m timeout[39m=[39;49mtimeout, schema[39m=[39;49m[39mself[39;49m[39m.[39;49m\_schema\_dict, [39m\*[39;49m[39m\*[39;49mkwargs)
[1;32m 433[0m [39mif[39;00m kwargs[39m.[39mget([39m"[39m[39m\_async[39m[39m"[39m, [39mFalse[39;00m):
[1;32m 434[0m [39mreturn[39;00m MutationFuture(res)
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/pymilvus/decorators.py:105[0m, in [0;36merror\_handler.\<locals\>.wrapper.\<locals\>.handler[0;34m(\*args, \*\*kwargs)[0m
[1;32m 103[0m [39mtry[39;00m:
[1;32m 104[0m record\_dict[[39m"[39m[39mRPC start[39m[39m"[39m] [39m=[39m [39mstr[39m(datetime[39m.[39mdatetime[39m.[39mnow())
[0;32m--\> 105[0m [39mreturn[39;00m func([39m\*[39;49margs, [39m\*[39;49m[39m\*[39;49mkwargs)
[1;32m 106[0m [39mexcept[39;00m MilvusException [39mas[39;00m e:
[1;32m 107[0m record\_dict[[39m"[39m[39mRPC error[39m[39m"[39m] [39m=[39m [39mstr[39m(datetime[39m.[39mdatetime[39m.[39mnow())
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/pymilvus/decorators.py:136[0m, in [0;36mtracing\_request.\<locals\>.wrapper.\<locals\>.handler[0;34m(self, \*args, \*\*kwargs)[0m
[1;32m 134[0m [39mif[39;00m req\_id:
[1;32m 135[0m [39mself[39m[39m.[39mset\_onetime\_request\_id(req\_id)
[0;32m--\> 136[0m ret [39m=[39m func([39mself[39;49m, [39m\*[39;49margs, [39m\*[39;49m[39m\*[39;49mkwargs)
[1;32m 137[0m [39mreturn[39;00m ret
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/pymilvus/decorators.py:50[0m, in [0;36mretry\_on\_rpc\_failure.\<locals\>.wrapper.\<locals\>.handler[0;34m(self, \*args, \*\*kwargs)[0m
[1;32m 48[0m [39mwhile[39;00m [39mTrue[39;00m:
[1;32m 49[0m [39mtry[39;00m:
[0;32m---\> 50[0m [39mreturn[39;00m func([39mself[39;49m, [39m\*[39;49margs, [39m\*[39;49m[39m\*[39;49mkwargs)
[1;32m 51[0m [39mexcept[39;00m grpc[39m.[39mRpcError [39mas[39;00m e:
[1;32m 52[0m [39m# DEADLINE\_EXCEEDED means that the task wat not completed[39;00m
[1;32m 53[0m [39m# UNAVAILABLE means that the service is not reachable currently[39;00m
[1;32m 54[0m [39m# Reference: https://grpc.github.io/grpc/python/grpc.html#grpc-status-code[39;00m
[1;32m 55[0m [39mif[39;00m e[39m.[39mcode() [39m!=[39m grpc[39m.[39mStatusCode[39m.[39mDEADLINE\_EXCEEDED [39mand[39;00m e[39m.[39mcode() [39m!=[39m grpc[39m.[39mStatusCode[39m.[39mUNAVAILABLE:
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/pymilvus/client/grpc\_handler.py:378[0m, in [0;36mGrpcHandler.batch\_insert[0;34m(self, collection\_name, entities, partition\_name, timeout, \*\*kwargs)[0m
[1;32m 375[0m f[39m.[39madd\_callback(ts\_utils[39m.[39mupdate\_ts\_on\_mutation(collection\_name))
[1;32m 376[0m [39mreturn[39;00m f
[0;32m--\> 378[0m response [39m=[39m rf[39m.[39;49mresult()
[1;32m 379[0m [39mif[39;00m response[39m.[39mstatus[39m.[39merror\_code [39m==[39m [39m0[39m:
[1;32m 380[0m m [39m=[39m MutationResult(response)
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/grpc/\_channel.py:733[0m, in [0;36m\_MultiThreadedRendezvous.result[0;34m(self, timeout)[0m
[1;32m 728[0m [39m[39m[39m"""Returns the result of the computation or raises its exception.[39;00m
[1;32m 729[0m
[1;32m 730[0m [39mSee grpc.Future.result for the full API contract.[39;00m
[1;32m 731[0m [39m"""[39;00m
[1;32m 732[0m [39mwith[39;00m [39mself[39m[39m.[39m\_state[39m.[39mcondition:
[0;32m--\> 733[0m timed\_out [39m=[39m \_common[39m.[39;49mwait([39mself[39;49m[39m.[39;49m\_state[39m.[39;49mcondition[39m.[39;49mwait,
[1;32m 734[0m [39mself[39;49m[39m.[39;49m\_is\_complete,
[1;32m 735[0m timeout[39m=[39;49mtimeout)
[1;32m 736[0m [39mif[39;00m timed\_out:
[1;32m 737[0m [39mraise[39;00m grpc[39m.[39mFutureTimeoutError()
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/grpc/\_common.py:141[0m, in [0;36mwait[0;34m(wait\_fn, wait\_complete\_fn, timeout, spin\_cb)[0m
[1;32m 139[0m [39mif[39;00m timeout [39mis[39;00m [39mNone[39;00m:
[1;32m 140[0m [39mwhile[39;00m [39mnot[39;00m wait\_complete\_fn():
[0;32m--\> 141[0m \_wait\_once(wait\_fn, MAXIMUM\_WAIT\_TIMEOUT, spin\_cb)
[1;32m 142[0m [39melse[39;00m:
[1;32m 143[0m end [39m=[39m time[39m.[39mtime() [39m+[39m timeout
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/site-packages/grpc/\_common.py:106[0m, in [0;36m\_wait\_once[0;34m(wait\_fn, timeout, spin\_cb)[0m
[1;32m 105[0m [39mdef[39;00m [39m\_wait\_once[39m(wait\_fn, timeout, spin\_cb):
[0;32m--\> 106[0m wait\_fn(timeout[39m=[39;49mtimeout)
[1;32m 107[0m [39mif[39;00m spin\_cb [39mis[39;00m [39mnot[39;00m [39mNone[39;00m:
[1;32m 108[0m spin\_cb()
File [0;32m\~/miniconda3/envs/haystack/lib/python3.9/threading.py:316[0m, in [0;36mCondition.wait[0;34m(self, timeout)[0m
[1;32m 314[0m [39melse[39;00m:
[1;32m 315[0m [39mif[39;00m timeout [39m\>[39m [39m0[39m:
[0;32m--\> 316[0m gotit [39m=[39m waiter[39m.[39;49macquire([39mTrue[39;49;00m, timeout)
[1;32m 317[0m [39melse[39;00m:
[1;32m 318[0m gotit [39m=[39m waiter[39m.[39macquire([39mFalse[39;00m)
[0;31mKeyboardInterrupt[0m:`
```
## Query the Database
With our data safely inserted in Zilliz, we can now perform a query. The query takes in a string or a list of strings and searches them. The results print out your provided description and the results that include the result score, the result title, and the result book description.
```
`import textwrap
def query(queries, top\_k = 5):
if type(queries) != list:
queries = [queries]
res = collection.search(embed(queries), anns\_field='embedding', param=QUERY\_PARAM, limit = top\_k, output\_fields=['title', 'description'])
for i, hit in enumerate(res):
print('Description:', queries[i])
print('Results:')
for ii, hits in enumerate(hit):
print('\\t' + 'Rank:', ii + 1, 'Score:', hits.score, 'Title:', hits.entity.get('title'))
print(textwrap.fill(hits.entity.get('description'), 88))
print()`
```
```
`query('Book about a k-9 from europe')`
```
```
`Description: Book about a k-9 from europe
Results:
Rank: 1 Score: 0.3047754764556885 Title: Bark M For Murder
Who let the dogs out? Evildoers beware! Four of mystery fiction's top storytellers are
setting the hounds on your trail -- in an incomparable quartet of crime stories with a
canine edge. Man's (and woman's) best friends take the lead in this phenomenal
collection of tales tense and surprising, humorous and thrilling: New York
Timesbestselling author J.A. Jance's spellbinding saga of a scam-busting septuagenarian
and her two golden retrievers; Anthony Award winner Virginia Lanier's pureblood thriller
featuring bloodhounds and bloody murder; Chassie West's suspenseful stunner about a
life-saving German shepherd and a ghastly forgotten crime; rising star Lee Charles
Kelley's edge-of-your-seat yarn that pits an ex-cop/kennel owner and a yappy toy poodle
against a craven killer.
Rank: 2 Score: 0.3283390402793884 Title: Texas K-9 Unit Christmas: Holiday Hero\\Rescuing Christmas
CHRISTMAS COMES WRAPPED IN DANGER Holiday Hero by Shirlee McCoy Emma Fairchild never
expected to find trouble in sleepy Sagebrush, Texas. But when she's attacked and left
for dead in her own diner, her childhood friend turned K-9 cop Lucas Harwood offers a
chance at justice--and love. Rescuing Christmas by Terri Reed She escaped a kidnapper,
but now a killer has set his sights on K-9 dog trainer Lily Anderson. When fellow
officer Jarrod Evans appoints himself her bodyguard, Lily knows more than her life is at
risk--so is her heart. Texas K-9 Unit: These lawmen solve the toughest cases with the
help of their brave canine partners
Rank: 3 Score: 0.33899369835853577 Title: Dogs on Duty: Soldiers' Best Friends on the Battlefield and Beyond
When the news of the raid on Osama Bin Laden's compound broke, the SEAL team member that
stole the show was a highly trained canine companion. Throughout history, dogs have been
key contributors to military units. Dorothy Hinshaw Patent follows man's best friend
onto the battlefield, showing readers why dogs are uniquely qualified for the job at
hand, how they are trained, how they contribute to missions, and what happens when they
retire. With full-color photographs throughout and sidebars featuring heroic canines
throughout history, Dogs on Duty provides a fascinating look at these exceptional
soldiers and companions.
Rank: 4 Score: 0.34207457304000854 Title: Toute Allure: Falling in Love in Rural France
After saying goodbye to life as a successful fashion editor in London, Karen Wheeler is
now happy in her small village house in rural France. Her idyll is complete when she
meets the love of her life - he has shaggy hair, four paws and a wet nose!
Rank: 5 Score: 0.343595951795578 Title: Otherwise Alone (Evan Arden, #1)
Librarian's note: This is an alternate cover edition for ASIN: B00AP5NNWC. Lieutenant
Evan Arden sits in a shack in the middle of nowhere, waiting for orders that will send
him back home - if he ever gets them. Other than his loyal Great Pyrenees, there's no
one around to break up the monotony. The tedium is excruciating, but it is suddenly
interrupted when a young woman stumbles up his path. "It's only 50-something pages, but
in that short amount of time, the author's awesome writing packs in a whole lotta
character detail. And sets the stage for the series, perfectly." -Maryse.net, 4.5 Stars
He has two choices - pick her off from a distance with his trusty sniper-rifle, or dare
let her approach his cabin and enter his life. Why not? It's been ages, and he is
otherwise alone...`
```