Retrieval augmented generative question answering with Pinecone
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
Feb 7, 2023
# Retrieval augmented generative question answering with Pinecone
This recipe is archived and may reference outdated models or APIs.
[ JA ](https://github.com/jamescalam)
[ jamescalam ](https://github.com/jamescalam)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/pinecone/Gen_QA.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/pinecone/Gen_QA.ipynb)
#### Fixing LLMs that Hallucinate
In this notebook we will learn how to query relevant contexts to our queries from Pinecone, and pass these to a generative OpenAI model to generate an answer backed by real data sources.
A common problem with using GPT-3 to factually answer questions is that GPT-3 can sometimes make things up. The GPT models have a broad range of general knowledge, but this does not necessarily apply to more specific information. For that we use the Pinecone vector database as our *“external knowledge base”* — like *long-term memory* for GPT-3.
Required installs for this notebook are:
```
`!pip install -qU openai pinecone-client datasets`
```
```
`[?25l [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m0.0/55.3 KB[0m [31m?[0m eta [36m-:--:--[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m55.3/55.3 KB[0m [31m1.7 MB/s[0m eta [36m0:00:00[0m
[?25h Installing build dependencies ... [?25l[?25hdone
Getting requirements to build wheel ... [?25l[?25hdone
Preparing metadata (pyproject.toml) ... [?25l[?25hdone
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m170.6/170.6 KB[0m [31m13.7 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m452.9/452.9 KB[0m [31m30.4 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m58.3/58.3 KB[0m [31m6.8 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m213.0/213.0 KB[0m [31m17.3 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m132.0/132.0 KB[0m [31m13.7 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m182.4/182.4 KB[0m [31m18.6 MB/s[0m eta [36m0:00:00[0m
[2K [90m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━[0m [32m140.6/140.6 KB[0m [31m6.7 MB/s[0m eta [36m0:00:00[0m
[?25h Building wheel for openai (pyproject.toml) ... [?25l[?25hdone`
```
```
`import openai
# get API key from top-right dropdown on OpenAI website
openai.api\_key = "OPENAI\_API\_KEY"`
```
For many questions *state-of-the-art (SOTA)* LLMs are more than capable of answering correctly.
```
`query = "who was the 12th person on the moon and when did they land?"
# now query `gpt-3.5-turbo-instruct` WITHOUT context
res = openai.Completion.create(
engine='gpt-3.5-turbo-instruct',
prompt=query,
temperature=0,
max\_tokens=400,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0,
stop=None
)
res['choices'][0]['text'].strip()`
```
```
`'The 12th person on the moon was Harrison Schmitt, and he landed on December 11, 1972.'`
```
However, that isn’t always the case. First let’s first rewrite the above into a simple function so we’re not rewriting this every time.
```
`def complete(prompt):
res = openai.Completion.create(
engine='gpt-3.5-turbo-instruct',
prompt=prompt,
temperature=0,
max\_tokens=400,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0,
stop=None
)
return res['choices'][0]['text'].strip()`
```
Now let’s ask a more specific question about training a type of transformer model called a *sentence transformer*. The ideal answer we’d be looking for is *“Multiple Negatives Ranking (MNR) loss”*.
Don’t worry if this is a new term to you, it isn’t required to understand what we’re doing or demoing here.
```
`query = (
"Which training method should I use for sentence transformers when " +
"I only have pairs of related sentences?"
)
complete(query)`
```
```
`'If you only have pairs of related sentences, then the best training method to use for sentence transformers is the supervised learning approach. This approach involves providing the model with labeled data, such as pairs of related sentences, and then training the model to learn the relationships between the sentences. This approach is often used for tasks such as natural language inference, semantic similarity, and paraphrase identification.'`
```
One of the common answers we get to this is:
```
`The best training method to use for fine-tuning a pre-trained model with sentence transformers is the Masked Language Model (MLM) training. MLM training involves randomly masking some of the words in a sentence and then training the model to predict the masked words. This helps the model to learn the context of the sentence and better understand the relationships between words.`
```
This answer seems pretty convincing right? Yet, it’s wrong. MLM is typically used in the pretraining step of a transformer model but *“cannot”* be used to fine-tune a sentence-transformer, and has nothing to do with having *“pairs of related sentences”*.
An alternative answer we receive (and the one we returned above) is about `supervised learning approach` being the most suitable. This is completely true, but it’s not specific and doesn’t answer the question.
We have two options for enabling our LLM in understanding and correctly answering this question:
1. We fine-tune the LLM on text data covering the topic mentioned, likely on articles and papers talking about sentence transformers, semantic search training methods, etc.
2. We use **R**etrieval **A**ugmented **G**eneration (RAG), a technique that implements an information retrieval component to the generation process. Allowing us to retrieve relevant information and feed this information into the generation model as a *secondary* source of information.
We will demonstrate option **2**.
## Building a Knowledge Base
With option **2** the retrieval of relevant information requires an external *“Knowledge Base”*, a place where we can store and use to efficiently retrieve information. We can think of this as the external *long-term memory* of our LLM.
We will need to retrieve information that is semantically related to our queries, to do this we need to use *“dense vector embeddings”*. These can be thought of as numerical representations of the *meaning* behind our sentences.
To create these dense vectors we use the `text-embedding-3-small` model.
We have already authenticated our OpenAI connection, to create an embedding we just do:
```
`embed\_model = "text-embedding-ada-002"
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
We will apply this same embedding logic to a dataset containing information relevant to our query (and many other queries on the topics of ML and AI).
### Data Preparation
The dataset we will be using is the `jamescalam/youtube-transcriptions` from Hugging Face *Datasets*. It contains transcribed audio from several ML and tech YouTube channels. We download it with:
```
`from datasets import load\_dataset
data = load\_dataset('jamescalam/youtube-transcriptions', split='train')
data`
```
```
`Using custom data configuration jamescalam--youtube-transcriptions-6a482f3df0aedcdb
Reusing dataset json (/Users/jamesbriggs/.cache/huggingface/datasets/jamescalam\_\_\_json/jamescalam--youtube-transcriptions-6a482f3df0aedcdb/0.0.0/ac0ca5f5289a6cf108e706efcf040422dbbfa8e658dee6a819f20d76bb84d26b)`
```
```
`Dataset({
features: ['title', 'published', 'url', 'video\_id', 'channel\_id', 'id', 'text', 'start', 'end'],
num\_rows: 208619
})`
```
```
`data[0]`
```
```
`{'title': 'Training and Testing an Italian BERT - Transformers From Scratch #4',
'published': '2021-07-06 13:00:03 UTC',
'url': 'https://youtu.be/35Pdoyi6ZoQ',
'video\_id': '35Pdoyi6ZoQ',
'channel\_id': 'UCv83tO5cePwHMt1952IVVHw',
'id': '35Pdoyi6ZoQ-t0.0',
'text': 'Hi, welcome to the video.',
'start': 0.0,
'end': 9.36}`
```
The dataset contains many small snippets of text data. We will need to merge many snippets from each video to create more substantial chunks of text that contain more information.
```
`from tqdm.auto import tqdm
new\_data = []
window = 20 # number of sentences to combine
stride = 4 # number of sentences to 'stride' over, used to create overlap
for i in tqdm(range(0, len(data), stride)):
i\_end = min(len(data)-1, i+window)
if data[i]['title'] != data[i\_end]['title']:
# in this case we skip this entry as we have start/end of two videos
continue
text = ' '.join(data[i:i\_end]['text'])
# create the new merged dataset
new\_data.append({
'start': data[i]['start'],
'end': data[i\_end]['end'],
'title': data[i]['title'],
'text': text,
'id': data[i]['id'],
'url': data[i]['url'],
'published': data[i]['published'],
'channel\_id': data[i]['channel\_id']
})`
```
```
` 0%| | 0/52155 [00:00\<?, ?it/s]`
```
```
`new\_data[0]`
```
```
`{'start': 0.0,
'end': 74.12,
'title': 'Training and Testing an Italian BERT - Transformers From Scratch #4',
'text': "Hi, welcome to the video. So this is the fourth video in a Transformers from Scratch mini series. So if you haven't been following along, we've essentially covered what you can see on the screen. So we got some data. We built a tokenizer with it. And then we've set up our input pipeline ready to begin actually training our model, which is what we're going to cover in this video. So let's move over to the code. And we see here that we have essentially everything we've done so far. So we've built our input data, our input pipeline. And we're now at a point where we have a data loader, PyTorch data loader, ready. And we can begin training a model with it. So there are a few things to be aware of. So I mean, first, let's just have a quick look at the structure of our data.",
'id': '35Pdoyi6ZoQ-t0.0',
'url': 'https://youtu.be/35Pdoyi6ZoQ',
'published': '2021-07-06 13:00:03 UTC',
'channel\_id': 'UCv83tO5cePwHMt1952IVVHw'}`
```
Now we need a place to store these embeddings and enable a efficient *vector search* through them all. To do that we use **`Pinecone`**, we can get a [free API key](https://app.pinecone.io) and enter it below where we will initialize our connection to `Pinecone` and create a new index.
```
`import pinecone
index\_name = 'openai-youtube-transcriptions'
# initialize connection to pinecone (get API key at app.pinecone.io)
pinecone.init(
api\_key="PINECONE\_API\_KEY",
environment="us-east1-gcp" # may be different, check at app.pinecone.io
)
# check if index already exists (it shouldn't if this is first time)
if index\_name not in pinecone.list\_indexes():
# if does not exist, create index
pinecone.create\_index(
index\_name,
dimension=len(res['data'][0]['embedding']),
metric='cosine',
metadata\_config={'indexed': ['channel\_id', 'published']}
)
# connect to index
index = pinecone.Index(index\_name)
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
from time import sleep
batch\_size = 100 # how many embeddings we create and insert at once
for i in tqdm(range(0, len(new\_data), batch\_size)):
# find end of batch
i\_end = min(len(new\_data), i+batch\_size)
meta\_batch = new\_data[i:i\_end]
# get ids
ids\_batch = [x['id'] for x in meta\_batch]
# get texts to encode
texts = [x['text'] for x in meta\_batch]
# create embeddings (try-except added to avoid RateLimitError)
done = False
while not done:
try:
res = openai.Embedding.create(input=texts, engine=embed\_model)
done = True
except:
sleep(5)
embeds = [record['embedding'] for record in res['data']]
# cleanup metadata
meta\_batch = [{
'start': x['start'],
'end': x['end'],
'title': x['title'],
'text': x['text'],
'url': x['url'],
'published': x['published'],
'channel\_id': x['channel\_id']
} for x in meta\_batch]
to\_upsert = list(zip(ids\_batch, embeds, meta\_batch))
# upsert to Pinecone
index.upsert(vectors=to\_upsert)`
```
```
` 0%| | 0/487 [00:00\<?, ?it/s]`
```
Now we search, for this we need to create a *query vector* `xq`:
```
`res = openai.Embedding.create(
input=[query],
engine=embed\_model
)
# retrieve from Pinecone
xq = res['data'][0]['embedding']
# get relevant contexts (including the questions)
res = index.query(xq, top\_k=2, include\_metadata=True)`
```
```
`res`
```
```
`{'matches': [{'id': 'pNvujJ1XyeQ-t418.88',
'metadata': {'channel\_id': 'UCv83tO5cePwHMt1952IVVHw',
'end': 568.4,
'published': datetime.date(2021, 11, 24),
'start': 418.88,
'text': 'pairs of related sentences you can go '
'ahead and actually try training or '
'fine-tuning using NLI with multiple '
"negative ranking loss. If you don't have "
'that fine. Another option is that you have '
'a semantic textual similarity data set or '
'STS and what this is is you have so you '
'have sentence A here, sentence B here and '
'then you have a score from from 0 to 1 '
'that tells you the similarity between '
'those two scores and you would train this '
'using something like cosine similarity '
"loss. Now if that's not an option and your "
'focus or use case is on building a '
'sentence transformer for another language '
'where there is no current sentence '
'transformer you can use multilingual '
'parallel data. So what I mean by that is '
'so parallel data just means translation '
'pairs so if you have for example a English '
'sentence and then you have another '
'language here so it can it can be anything '
"I'm just going to put XX and that XX is "
'your target language you can fine-tune a '
'model using something called multilingual '
'knowledge distillation and what that does '
'is takes a monolingual model for example '
'in English and using those translation '
'pairs it distills the knowledge the '
'semantic similarity knowledge from that '
'monolingual English model into a '
'multilingual model which can handle both '
'English and your target language. So '
"they're three options quite popular very "
'common that you can go for and as a '
'supervised methods the chances are that '
'probably going to outperform anything you '
'do with unsupervised training at least for '
'now. So if none of those sound like '
'something',
'title': 'Today Unsupervised Sentence Transformers, '
'Tomorrow Skynet (how TSDAE works)',
'url': 'https://youtu.be/pNvujJ1XyeQ'},
'score': 0.865277052,
'sparseValues': {},
'values': []},
{'id': 'WS1uVMGhlWQ-t737.28',
'metadata': {'channel\_id': 'UCv83tO5cePwHMt1952IVVHw',
'end': 900.72,
'published': datetime.date(2021, 10, 20),
'start': 737.28,
'text': "were actually more accurate. So we can't "
"really do that. We can't use this what is "
'called a mean pooling approach. Or we '
"can't use it in its current form. Now the "
'solution to this problem was introduced by '
'two people in 2019 Nils Reimers and Irenia '
'Gurevich. They introduced what is the '
'first sentence transformer or sentence '
'BERT. And it was found that sentence BERT '
'or S BERT outformed all of the previous '
'Save the Art models on pretty much all '
'benchmarks. Not all of them but most of '
'them. And it did it in a very quick time. '
'So if we compare it to BERT, if we wanted '
'to find the most similar sentence pair '
'from 10,000 sentences in that 2019 paper '
'they found that with BERT that took 65 '
'hours. With S BERT embeddings they could '
'create all the embeddings in just around '
'five seconds. And then they could compare '
'all those with cosine similarity in 0.01 '
"seconds. So it's a lot faster. We go from "
'65 hours to just over five seconds which '
'is I think pretty incredible. Now I think '
"that's pretty much all the context we need "
'behind sentence transformers. And what we '
'do now is dive into a little bit of how '
'they actually work. Now we said before we '
'have the core transform models and what S '
'BERT does is fine tunes on sentence pairs '
'using what is called a Siamese '
'architecture or Siamese network. What we '
'mean by a Siamese network is that we have '
'what we can see, what can view as two BERT '
'models that are identical and the weights '
'between those two models are tied. Now in '
'reality when implementing this we just use '
'a single BERT model. And what we do is we '
'process one sentence, a sentence A through '
'the model and then we process another '
'sentence, sentence B through the model. '
"And that's the sentence pair. So with our "
'cross-linked we were processing the '
'sentence pair together. We were putting '
'them both together, processing them all at '
'once. This time we process them '
'separately. And during training what '
'happens is the weights',
'title': 'Intro to Sentence Embeddings with '
'Transformers',
'url': 'https://youtu.be/WS1uVMGhlWQ'},
'score': 0.85855335,
'sparseValues': {},
'values': []}],
'namespace': ''}`
```
```
`limit = 3750
def retrieve(query):
res = openai.Embedding.create(
input=[query],
engine=embed\_model
)
# retrieve from Pinecone
xq = res['data'][0]['embedding']
# get relevant contexts
res = index.query(xq, top\_k=3, include\_metadata=True)
contexts = [
x['metadata']['text'] for x in res['matches']
]
# build our prompt with the retrieved contexts included
prompt\_start = (
"Answer the question based on the context below.\\n\\n"+
"Context:\\n"
)
prompt\_end = (
f"\\n\\nQuestion: {query}\\nAnswer:"
)
# append contexts until hitting limit
for i in range(1, len(contexts)):
if len("\\n\\n---\\n\\n".join(contexts[:i])) \>= limit:
prompt = (
prompt\_start +
"\\n\\n---\\n\\n".join(contexts[:i-1]) +
prompt\_end
)
break
elif i == len(contexts)-1:
prompt = (
prompt\_start +
"\\n\\n---\\n\\n".join(contexts) +
prompt\_end
)
return prompt`
```
```
`# first we retrieve relevant items from Pinecone
query\_with\_contexts = retrieve(query)
query\_with\_contexts`
```
```
`"Answer the question based on the context below.\\n\\nContext:\\npairs of related sentences you can go ahead and actually try training or fine-tuning using NLI with multiple negative ranking loss. If you don't have that fine. Another option is that you have a semantic textual similarity data set or STS and what this is is you have so you have sentence A here, sentence B here and then you have a score from from 0 to 1 that tells you the similarity between those two scores and you would train this using something like cosine similarity loss. Now if that's not an option and your focus or use case is on building a sentence transformer for another language where there is no current sentence transformer you can use multilingual parallel data. So what I mean by that is so parallel data just means translation pairs so if you have for example a English sentence and then you have another language here so it can it can be anything I'm just going to put XX and that XX is your target language you can fine-tune a model using something called multilingual knowledge distillation and what that does is takes a monolingual model for example in English and using those translation pairs it distills the knowledge the semantic similarity knowledge from that monolingual English model into a multilingual model which can handle both English and your target language. So they're three options quite popular very common that you can go for and as a supervised methods the chances are that probably going to outperform anything you do with unsupervised training at least for now. So if none of those sound like something\\n\\n---\\n\\nwere actually more accurate. So we can't really do that. We can't use this what is called a mean pooling approach. Or we can't use it in its current form. Now the solution to this problem was introduced by two people in 2019 Nils Reimers and Irenia Gurevich. They introduced what is the first sentence transformer or sentence BERT. And it was found that sentence BERT or S BERT outformed all of the previous Save the Art models on pretty much all benchmarks. Not all of them but most of them. And it did it in a very quick time. So if we compare it to BERT, if we wanted to find the most similar sentence pair from 10,000 sentences in that 2019 paper they found that with BERT that took 65 hours. With S BERT embeddings they could create all the embeddings in just around five seconds. And then they could compare all those with cosine similarity in 0.01 seconds. So it's a lot faster. We go from 65 hours to just over five seconds which is I think pretty incredible. Now I think that's pretty much all the context we need behind sentence transformers. And what we do now is dive into a little bit of how they actually work. Now we said before we have the core transform models and what S BERT does is fine tunes on sentence pairs using what is called a Siamese architecture or Siamese network. What we mean by a Siamese network is that we have what we can see, what can view as two BERT models that are identical and the weights between those two models are tied. Now in reality when implementing this we just use a single BERT model. And what we do is we process one sentence, a sentence A through the model and then we process another sentence, sentence B through the model. And that's the sentence pair. So with our cross-linked we were processing the sentence pair together. We were putting them both together, processing them all at once. This time we process them separately. And during training what happens is the weights\\n\\n---\\n\\nTransformer-based Sequential Denoising Autoencoder. So what we'll do is jump straight into it and take a look at where we might want to use this training approach and and how we can actually implement it. So the first question we need to ask is do we really need to resort to unsupervised training? Now what we're going to do here is just have a look at a few of the most popular training approaches and what sort of data we need for that. So the first one we're looking at here is Natural Language Inference or NLI and NLI requires that we have pairs of sentences that are labeled as either contradictory, neutral which means they're not necessarily related or as entailing or as inferring each other. So you have pairs that entail each other so they are both very similar pairs that are neutral and also pairs that are contradictory. And this is the traditional NLI data. Now using another version of fine-tuning with NLI called a multiple negatives ranking loss you can get by with only entailment pairs so pairs that are related to each other or positive pairs and it can also use contradictory pairs to improve the performance of training as well but you don't need it. So if you have positive pairs of related sentences you can go ahead and actually try training or fine-tuning using NLI with multiple negative ranking loss. If you don't have that fine. Another option is that you have a semantic textual similarity data set or STS and what this is is you have so you have sentence A here, sentence B\\n\\nQuestion: Which training method should I use for sentence transformers when I only have pairs of related sentences?\\nAnswer:"`
```
```
`# then we complete the context-infused query
complete(query\_with\_contexts)`
```
```
`'You should use Natural Language Inference (NLI) with multiple negative ranking loss.'`
```
And we get a pretty great answer straight away, specifying to use *multiple-rankings loss* (also called *multiple negatives ranking loss*).