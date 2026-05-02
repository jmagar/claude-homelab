Fine-Tuning for retrieval augmented generation (RAG) with Qdrant
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
Sep 4, 2023
# Fine-Tuning for retrieval augmented generation (RAG) with Qdrant
[ NI ](https://github.com/NirantK)
[ NirantK ](https://github.com/NirantK)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/fine-tuned_qa/ft_retrieval_augmented_generation_qdrant.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/fine-tuned_qa/ft_retrieval_augmented_generation_qdrant.ipynb)
The aim of this notebook is to walk through a comprehensive example of how to fine-tune OpenAI models for Retrieval Augmented Generation (RAG).
We will also be integrating Qdrant and Few-Shot Learning to boost the model’s performance and reduce hallucinations. This could serve as a practical guide for ML practitioners, data scientists, and AI Engineers interested in leveraging the power of OpenAI models for specific use-cases. 🤩
Note: This notebook uses the gpt-3.5-turbo model. Fine-tuning on the SQuAD dataset with this setup yields only minimal gains for more advanced models such as gpt-4o or gpt-4.1. As such, this notebook is primarily intended as a guide for fine-tuning workflows and retrieval-augmented generation (RAG) practices
## Why should you read this blog?
You want to learn how to
* [Fine-tune OpenAI models](https://platform.openai.com/docs/guides/fine-tuning/) for specific use-cases
* Use [Qdrant](https://qdrant.tech/documentation/) to improve the performance of your RAG model
* Use fine-tuning to improve the correctness of your RAG model and reduce hallucinations
To begin, we’ve selected a dataset where we’ve a guarantee that the retrieval is perfect. We’ve selected a subset of the [SQuAD](https://rajpurkar.github.io/SQuAD-explorer/) dataset, which is a collection of questions and answers about Wikipedia articles. We’ve also included samples where the answer is not present in the context, to demonstrate how RAG handles this case.
1. Setting up the Environment
### Section A: Zero-Shot Learning
1. Data Preparation: SQuADv2 Dataset
2. Answering using Base gpt-3.5-turbo-0613 model
3. Fine-tuning and Answering using Fine-tuned model
4. **Evaluation**: How well does the model perform?
### Section B: Few-Shot Learning
1. Using Qdrant to Improve RAG Prompt
2. Fine-Tuning OpenAI Model with Qdrant
3. Evaluation
4. **Conclusion**
* Aggregate Results
* Observations
## Terms, Definitions, and References
**Retrieval Augmented Generation (RAG)?**
The phrase Retrieval Augmented Generation (RAG) comes from a [recent paper](https://arxiv.org/abs/2005.11401) by Lewis et al. from Facebook AI. The idea is to use a pre-trained language model (LM) to generate text, but to use a separate retrieval system to find relevant documents to condition the LM on.
**What is Qdrant?**
Qdrant is an open-source vector search engine that allows you to search for similar vectors in a large dataset. It is built in Rust and here we’ll use the Python client to interact with it. This is the Retrieval part of RAG.
**What is Few-Shot Learning?**
Few-shot learning is a type of machine learning where the model is “improved” via training or fine-tuning on a small amount of data. In this case, we’ll use it to fine-tune the RAG model on a small number of examples from the SQuAD dataset. This is the Augmented part of RAG.
**What is Zero-Shot Learning?**
Zero-shot learning is a type of machine learning where the model is “improved” via training or fine-tuning without any dataset specific information.
**What is Fine-Tuning?**
Fine-tuning is a type of machine learning where the model is “improved” via training or fine-tuning on a small amount of data. In this case, we’ll use it to fine-tune the RAG model on a small number of examples from the SQuAD dataset. The LLM is what makes the Generation part of RAG.
## 1. Setting Up the Environment
### Install and Import Dependencies
```
`!pip install pandas openai tqdm tenacity scikit-learn tiktoken python-dotenv seaborn --upgrade --quiet`
```
```
`import json
import os
import time
import pandas as pd
from openai import OpenAI
import tiktoken
import seaborn as sns
from tenacity import retry, wait\_exponential
from tqdm import tqdm
from collections import defaultdict
import numpy as np
import matplotlib.pyplot as plt
import numpy as np
from sklearn.metrics import confusion\_matrix
import warnings
warnings.filterwarnings('ignore')
tqdm.pandas()
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
### Set your keys
Get your OpenAI keys [here](https://platform.openai.com/account/api-keys) and Qdrant keys after making a free cluster [here](https://cloud.qdrant.io/login).
```
`os.environ["QDRANT\_URL"] = "https://xxx.cloud.qdrant.io:6333"
os.environ["QDRANT\_API\_KEY"] = "xxx"`
```
## Section A
## 2. Data Preparation: SQuADv2 Data Subsets
For the purpose of demonstration, we’ll make small slices from the train and validation splits of the [SQuADv2](https://rajpurkar.github.io/SQuAD-explorer/) dataset. This dataset has questions and contexts where the answer is not present in the context, to help us evaluate how LLM handles this case.
We’ll read the data from the JSON files and create a dataframe with the following columns: `question`, `context`, `answer`, `is\_impossible`.
### Download the Data
```
`# !mkdir -p local\_cache
# !wget https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v2.0.json -O local\_cache/train.json
# !wget https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v2.0.json -O local\_cache/dev.json`
```
### Read JSON to DataFrame
```
`def json\_to\_dataframe\_with\_titles(json\_data):
qas = []
context = []
is\_impossible = []
answers = []
titles = []
for article in json\_data['data']:
title = article['title']
for paragraph in article['paragraphs']:
for qa in paragraph['qas']:
qas.append(qa['question'].strip())
context.append(paragraph['context'])
is\_impossible.append(qa['is\_impossible'])
ans\_list = []
for ans in qa['answers']:
ans\_list.append(ans['text'])
answers.append(ans\_list)
titles.append(title)
df = pd.DataFrame({'title': titles, 'question': qas, 'context': context, 'is\_impossible': is\_impossible, 'answers': answers})
return df
def get\_diverse\_sample(df, sample\_size=100, random\_state=42):
"""
Get a diverse sample of the dataframe by sampling from each title
"""
sample\_df = df.groupby(['title', 'is\_impossible']).apply(lambda x: x.sample(min(len(x), max(1, sample\_size // 50)), random\_state=random\_state)).reset\_index(drop=True)
if len(sample\_df) \< sample\_size:
remaining\_sample\_size = sample\_size - len(sample\_df)
remaining\_df = df.drop(sample\_df.index).sample(remaining\_sample\_size, random\_state=random\_state)
sample\_df = pd.concat([sample\_df, remaining\_df]).sample(frac=1, random\_state=random\_state).reset\_index(drop=True)
return sample\_df.sample(min(sample\_size, len(sample\_df)), random\_state=random\_state).reset\_index(drop=True)
train\_df = json\_to\_dataframe\_with\_titles(json.load(open('local\_cache/train.json')))
val\_df = json\_to\_dataframe\_with\_titles(json.load(open('local\_cache/dev.json')))
df = get\_diverse\_sample(val\_df, sample\_size=100, random\_state=42)`
```
## 3. Answering using Base gpt-3.5-turbo-0613 model
### 3.1 Zero Shot Prompt
Let’s start by using the base gpt-3.5-turbo-0613 model to answer the questions. This prompt is a simple concatenation of the question and context, with a separator token in between: `\\n\\n`. We’ve a simple instruction part of the prompt:
>
> Answer the following Question based on the Context only. Only answer from the Context. If you don’t know the answer, say ‘I don’t know’.
>
Other prompts are possible, but this is a good starting point. We’ll use this prompt to answer the questions in the validation set.
```
`# Function to get prompt messages
def get\_prompt(row):
return [
{"role": "system", "content": "You are a helpful assistant."},
{
"role": "user",
"content": f"""Answer the following Question based on the Context only. Only answer from the Context. If you don't know the answer, say 'I don't know'.
Question: {row.question}\\n\\n
Context: {row.context}\\n\\n
Answer:\\n""",
},
]`
```
### 3.2 Answering using Zero Shot Prompt
Next, you’ll need some re-usable functions which make an OpenAI API Call and return the answer. You’ll use the `ChatCompletion.create` endpoint of the API, which takes a prompt and returns the completed text.
```
`# Function with tenacity for retries
@retry(wait=wait\_exponential(multiplier=1, min=2, max=6))
def api\_call(messages, model):
return client.chat.completions.create(
model=model,
messages=messages,
stop=["\\n\\n"],
max\_tokens=100,
temperature=0.0,
)
# Main function to answer question
def answer\_question(row, prompt\_func=get\_prompt, model="gpt-3.5-turbo"):
messages = prompt\_func(row)
response = api\_call(messages, model)
return response.choices[0].message.content`
```
⏰ **Time to run: \~3 min**, 🛜 Needs Internet Connection
```
`# Use progress\_apply with tqdm for progress bar
df["generated\_answer"] = df.progress\_apply(answer\_question, axis=1)
df.to\_json("local\_cache/100\_val.json", orient="records", lines=True)
df = pd.read\_json("local\_cache/100\_val.json", orient="records", lines=True)`
```
```
`df`
```
||title|question|context|is\_impossible|answers|
|0|Scottish\_Parliament|What consequence of establishing the Scottish ...|A procedural consequence of the establishment ...|False|[able to vote on domestic legislation that app...|
|1|Imperialism|Imperialism is less often associated with whic...|The principles of imperialism are often genera...|True|[]|
|2|Economic\_inequality|What issues can't prevent women from working o...|When a person’s capabilities are lowered, they...|True|[]|
|3|Southern\_California|What county are Los Angeles, Orange, San Diego...|Its counties of Los Angeles, Orange, San Diego...|True|[]|
|4|French\_and\_Indian\_War|When was the deportation of Canadians?|Britain gained control of French Canada and Ac...|True|[]|
|...|...|...|...|...|...|
|95|Geology|In the layered Earth model, what is the inner ...|Seismologists can use the arrival times of sei...|True|[]|
|96|Prime\_number|What type of value would the Basel function ha...|The zeta function is closely related to prime ...|True|[]|
|97|Fresno,\_California|What does the San Joaquin Valley Railroad cros...|Passenger rail service is provided by Amtrak S...|True|[]|
|98|Victoria\_(Australia)|What party rules in Melbourne's inner regions?|The centre-left Australian Labor Party (ALP), ...|False|[The Greens, Australian Greens, Greens]|
|99|Immune\_system|The speed of the killing response of the human...|In humans, this response is activated by compl...|False|[signal amplification, signal amplification, s...|
100 rows × 5 columns
## 4. Fine-tuning and Answering using Fine-tuned model
For the complete fine-tuning process, please refer to the [OpenAI Fine-Tuning Docs](https://platform.openai.com/docs/guides/fine-tuning/use-a-fine-tuned-model).
### 4.1 Prepare the Fine-Tuning Data
We need to prepare the data for fine-tuning. We’ll use a few samples from train split of same dataset as before, but we’ll add the answer to the context. This will help the model learn to retrieve the answer from the context.
Our instruction prompt is the same as before, and so is the system prompt.
```
`def dataframe\_to\_jsonl(df):
def create\_jsonl\_entry(row):
answer = row["answers"][0] if row["answers"] else "I don't know"
messages = [
{"role": "system", "content": "You are a helpful assistant."},
{
"role": "user",
"content": f"""Answer the following Question based on the Context only. Only answer from the Context. If you don't know the answer, say 'I don't know'.
Question: {row.question}\\n\\n
Context: {row.context}\\n\\n
Answer:\\n""",
},
{"role": "assistant", "content": answer},
]
return json.dumps({"messages": messages})
jsonl\_output = df.apply(create\_jsonl\_entry, axis=1)
return "\\n".join(jsonl\_output)
train\_sample = get\_diverse\_sample(train\_df, sample\_size=100, random\_state=42)
with open("local\_cache/100\_train.jsonl", "w") as f:
f.write(dataframe\_to\_jsonl(train\_sample))`
```
**Tip: 💡 Verify the Fine-Tuning Data**
You can see this [cookbook](https://github.com/openai/openai-cookbook/blob/main/examples/Chat_finetuning_data_prep.ipynb) for more details on how to prepare the data for fine-tuning.
### 4.2 Fine-Tune OpenAI Model
If you’re new to OpenAI Model Fine-Tuning, please refer to the [How to finetune Chat models](https://github.com/openai/openai-cookbook/blob/448a0595b84ced3bebc9a1568b625e748f9c1d60/examples/How_to_finetune_chat_models.ipynb) notebook. You can also refer to the [OpenAI Fine-Tuning Docs](platform.openai.com/docs/guides/fine-tuning/use-a-fine-tuned-model) for more details.
```
`class OpenAIFineTuner:
"""
Class to fine tune OpenAI models
"""
def \_\_init\_\_(self, training\_file\_path, model\_name, suffix):
self.training\_file\_path = training\_file\_path
self.model\_name = model\_name
self.suffix = suffix
self.file\_object = None
self.fine\_tuning\_job = None
self.model\_id = None
def create\_openai\_file(self):
self.file\_object = client.files.create(
file=open(self.training\_file\_path, "rb"),
purpose="fine-tune",
)
def wait\_for\_file\_processing(self, sleep\_time=20):
while self.file\_object.status != 'processed':
time.sleep(sleep\_time)
self.file\_object.refresh()
print("File Status: ", self.file\_object.status)
def create\_fine\_tuning\_job(self):
self.fine\_tuning\_job = client.fine\_tuning.jobs.create(
training\_file=self.file\_object.id,
model=self.model\_name,
suffix=self.suffix,
)
def wait\_for\_fine\_tuning(self, sleep\_time=45):
while True:
# Retrieve the latest fine-tuning job status
self.fine\_tuning\_job = client.fine\_tuning.jobs.retrieve(self.fine\_tuning\_job.id)
print("Job Status:", self.fine\_tuning\_job.status)
if self.fine\_tuning\_job.status in {'succeeded', 'failed', 'cancelled'}:
break
time.sleep(sleep\_time)
def retrieve\_fine\_tuned\_model(self):
self.model\_id = client.fine\_tuning.jobs.retrieve(self.fine\_tuning\_job.id).fine\_tuned\_model
return self.model\_id
def fine\_tune\_model(self):
self.create\_openai\_file()
self.wait\_for\_file\_processing()
self.create\_fine\_tuning\_job()
self.wait\_for\_fine\_tuning()
return self.retrieve\_fine\_tuned\_model()
fine\_tuner = OpenAIFineTuner(
training\_file\_path="local\_cache/100\_train.jsonl",
model\_name="gpt-3.5-turbo",
suffix="100trn20230907"
)`
```
⏰ **Time to run: \~10-20 minutes**, 🛜 Needs Internet Connection
```
`model\_id = fine\_tuner.fine\_tune\_model()
model\_id`
```
#### 4.2.1 Try out the Fine-Tuned Model
Let’s try out the fine-tuned model on the same validation set as before. You’ll use the same prompt as before, but you will use the fine-tuned model instead of the base model. Before you do that, you can make a simple call to get a sense of how the fine-tuned model is doing.
```
`completion = client.chat.completions.create(
model=model\_id,
messages=[
{"role": "system", "content": "You are a helpful assistant."},
{"role": "user", "content": "Hello!"},
{"role": "assistant", "content": "Hi, how can I help you today?"},
{
"role": "user",
"content": "Can you answer the following question based on the given context? If not, say, I don't know:\\n\\nQuestion: What is the capital of France?\\n\\nContext: The capital of Mars is Gaia. Answer:",
},
],
)
print(completion.choices[0].message)`
```
### 4.3 Answer Using the Fine-Tuned Model
This is the same as before, but you’ll use the fine-tuned model instead of the base model.
⏰ **Time to run: \~5 min**, 🛜 Needs Internet Connection
```
`df["ft\_generated\_answer"] = df.progress\_apply(answer\_question, model=model\_id, axis=1)`
```
## 5. Evaluation: How well does the model perform?
To evaluate the model’s performance, compare the predicted answer to the actual answers — if any of the actual answers are present in the predicted answer, then it’s a match. We’ve also created error categories to help you understand where the model is struggling.
When we know that a correct answer exists in the context, we can measure the model’s performance, there are 3 possible outcomes:
1. ✅ **Answered Correctly**: The model responded the correct answer. It may have also included other answers that were not in the context.
2. ❎ **Skipped**: The model responded with “I don’t know” (IDK) while the answer was present in the context. It’s better than giving the wrong answer. It’s better for the model say “I don’t know” than giving the wrong answer. In our design, we know that a true answer exists and hence we’re able to measure it — this is not always the case. *This is a model error*. We exclude this from the overall error rate.
3. ❌ **Wrong**: The model responded with an incorrect answer. **This is a model ERROR.**
When we know that a correct answer does not exist in the context, we can measure the model’s performance, there are 2 possible outcomes:
1. ❌ **Hallucination**: The model responded with an answer, when “I don’t know” was expected. **This is a model ERROR.**
2. ✅ **I don’t know**: The model responded with “I don’t know” (IDK) and the answer was not present in the context. **This is a model WIN.**
```
`import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
class Evaluator:
def \_\_init\_\_(self, df):
self.df = df
self.y\_pred = pd.Series() # Initialize as empty Series
self.labels\_answer\_expected = ["✅ Answered Correctly", "❎ Skipped", "❌ Wrong Answer"]
self.labels\_idk\_expected = ["❌ Hallucination", "✅ I don't know"]
def \_evaluate\_answer\_expected(self, row, answers\_column):
generated\_answer = row[answers\_column].lower()
actual\_answers = [ans.lower() for ans in row["answers"]]
return (
"✅ Answered Correctly" if any(ans in generated\_answer for ans in actual\_answers)
else "❎ Skipped" if generated\_answer == "i don't know"
else "❌ Wrong Answer"
)
def \_evaluate\_idk\_expected(self, row, answers\_column):
generated\_answer = row[answers\_column].lower()
return (
"❌ Hallucination" if generated\_answer != "i don't know"
else "✅ I don't know"
)
def \_evaluate\_single\_row(self, row, answers\_column):
is\_impossible = row["is\_impossible"]
return (
self.\_evaluate\_answer\_expected(row, answers\_column) if not is\_impossible
else self.\_evaluate\_idk\_expected(row, answers\_column)
)
def evaluate\_model(self, answers\_column="generated\_answer"):
self.y\_pred = pd.Series(self.df.apply(self.\_evaluate\_single\_row, answers\_column=answers\_column, axis=1))
freq\_series = self.y\_pred.value\_counts()
# Counting rows for each scenario
total\_answer\_expected = len(self.df[self.df['is\_impossible'] == False])
total\_idk\_expected = len(self.df[self.df['is\_impossible'] == True])
freq\_answer\_expected = (freq\_series / total\_answer\_expected \* 100).round(2).reindex(self.labels\_answer\_expected, fill\_value=0)
freq\_idk\_expected = (freq\_series / total\_idk\_expected \* 100).round(2).reindex(self.labels\_idk\_expected, fill\_value=0)
return freq\_answer\_expected.to\_dict(), freq\_idk\_expected.to\_dict()
def print\_eval(self):
answer\_columns=["generated\_answer", "ft\_generated\_answer"]
baseline\_correctness, baseline\_idk = self.evaluate\_model()
ft\_correctness, ft\_idk = self.evaluate\_model(self.df, answer\_columns[1])
print("When the model should answer correctly:")
eval\_df = pd.merge(
baseline\_correctness.rename("Baseline"),
ft\_correctness.rename("Fine-Tuned"),
left\_index=True,
right\_index=True,
)
print(eval\_df)
print("\\n\\n\\nWhen the model should say 'I don't know':")
eval\_df = pd.merge(
baseline\_idk.rename("Baseline"),
ft\_idk.rename("Fine-Tuned"),
left\_index=True,
right\_index=True,
)
print(eval\_df)
def plot\_model\_comparison(self, answer\_columns=["generated\_answer", "ft\_generated\_answer"], scenario="answer\_expected", nice\_names=["Baseline", "Fine-Tuned"]):
results = []
for col in answer\_columns:
answer\_expected, idk\_expected = self.evaluate\_model(col)
if scenario == "answer\_expected":
results.append(answer\_expected)
elif scenario == "idk\_expected":
results.append(idk\_expected)
else:
raise ValueError("Invalid scenario")
results\_df = pd.DataFrame(results, index=nice\_names)
if scenario == "answer\_expected":
results\_df = results\_df.reindex(self.labels\_answer\_expected, axis=1)
elif scenario == "idk\_expected":
results\_df = results\_df.reindex(self.labels\_idk\_expected, axis=1)
melted\_df = results\_df.reset\_index().melt(id\_vars='index', var\_name='Status', value\_name='Frequency')
sns.set\_theme(style="whitegrid", palette="icefire")
g = sns.catplot(data=melted\_df, x='Frequency', y='index', hue='Status', kind='bar', height=5, aspect=2)
# Annotating each bar
for p in g.ax.patches:
g.ax.annotate(f"{p.get\_width():.0f}%", (p.get\_width()+5, p.get\_y() + p.get\_height() / 2),
textcoords="offset points",
xytext=(0, 0),
ha='center', va='center')
plt.ylabel("Model")
plt.xlabel("Percentage")
plt.xlim(0, 100)
plt.tight\_layout()
plt.title(scenario.replace("\_", " ").title())
plt.show()
# Compare the results by merging into one dataframe
evaluator = Evaluator(df)
# evaluator.evaluate\_model(answers\_column="ft\_generated\_answer")
# evaluator.plot\_model\_comparison(["generated\_answer", "ft\_generated\_answer"], scenario="answer\_expected", nice\_names=["Baseline", "Fine-Tuned"])`
```
```
`# Optionally, save the results to a JSON file
df.to\_json("local\_cache/100\_val\_ft.json", orient="records", lines=True)
df = pd.read\_json("local\_cache/100\_val\_ft.json", orient="records", lines=True)`
```
```
`evaluator.plot\_model\_comparison(["generated\_answer", "ft\_generated\_answer"], scenario="answer\_expected", nice\_names=["Baseline", "Fine-Tuned"])`
```
Notice that the fine-tuned model skips questions more often — and makes fewer mistakes. This is because the fine-tuned model is more conservative and skips questions when it’s not sure.
```
`evaluator.plot\_model\_comparison(["generated\_answer", "ft\_generated\_answer"], scenario="idk\_expected", nice\_names=["Baseline", "Fine-Tuned"])`
```
Notice that the fine-tuned model has learnt to say “I don’t know” a lot better than the prompt. Or, the model has gotten good at skipping questions.
### Observations
1. The fine-tuned model is better at saying “I don’t know”
2. Hallucinations drop from 100% to 15% with fine-tuning
3. Wrong answers drop from 17% to 6% with fine-tuning
**Correct answers also drop from 83% to 60% with fine-tuning** - this is because the fine-tuned model is **more conservative** and says “I don’t know” more often. This is a good thing because it’s better to say “I don’t know” than to give a wrong answer.
That said, we want to improve the correctness of the model, even if that increases the hallucinations. We’re looking for a model that is both correct and conservative, striking a balance between the two. We’ll use Qdrant and Few-Shot Learning to achieve this.
**💪 You’re 2/3rds of the way there! Keep reading!**
# Section B: Few Shot Learning
We’ll select a few examples from the dataset, including cases where the answer is not present in the context. We’ll then use these examples to create a prompt that we can use to fine-tune the model. We’ll then measure the performance of the fine-tuned model.
**What is next?**
1. Fine-Tuning OpenAI Model with Qdrant
6.1 Embed the Fine-Tuning Data
6.2 Embedding the Questions
2. Using Qdrant to Improve RAG Prompt
3. Evaluation
## 6. Fine-Tuning OpenAI Model with Qdrant
So far, we’ve been using the OpenAI model to answer questions without using examples of the answer. The previous step made it work better on in-context examples, while this one helps it generalize to unseen data, and attempt to learn when to say “I don’t know” and when to give an answer.
This is where few-shot learning comes in!
Few-shot learning is a type of transfer learning that allows us to answer questions where the answer is not present in the context. We can do this by providing a few examples of the answer we’re looking for, and the model will learn to answer questions where the answer is not present in the context.
### 5.1 Embed the Training Data
Embeddings are a way to represent sentences as an array of floats. We’ll use the embeddings to find the most similar questions to the ones we’re looking for.
```
`import os
from qdrant\_client import QdrantClient
from qdrant\_client.http import models
from qdrant\_client.http.models import PointStruct
from qdrant\_client.http.models import Distance, VectorParams`
```
Now that we’ve the Qdrant imports in place,
```
`qdrant\_client = QdrantClient(
url=os.getenv("QDRANT\_URL"), api\_key=os.getenv("QDRANT\_API\_KEY"), timeout=6000, prefer\_grpc=True
)
collection\_name = "squadv2-cookbook"
# # Create the collection, run this only once
# qdrant\_client.recreate\_collection(
# collection\_name=collection\_name,
# vectors\_config=VectorParams(size=384, distance=Distance.COSINE),
# )`
```
```
`from fastembed.embedding import DefaultEmbedding
from typing import List
import numpy as np
import pandas as pd
from tqdm.notebook import tqdm
tqdm.pandas()
embedding\_model = DefaultEmbedding()`
```
### 5.2 Embedding the Questions
Next, you’ll embed the entire training set questions. You’ll use the question to question similarity to find the most similar questions to the question we’re looking for. This is a workflow which is used in RAG to leverage the OpenAI model ability of incontext learning with more examples. This is what we call Few Shot Learning here.
**❗️⏰ Important Note: This step can take up to 3 hours to complete. Please be patient. If you see Out of Memory errors or Kernel Crashes, please reduce the batch size to 32, restart the kernel and run the notebook again. This code needs to be run only ONCE.**
## Function Breakdown for `generate\_points\_from\_dataframe`
1. **Initialization**: `batch\_size = 512` and `total\_batches` set the stage for how many questions will be processed in one go. This is to prevent memory issues. If your machine can handle more, feel free to increase the batch size. If your kernel crashes, reduce the batch size to 32 and try again.
2. **Progress Bar**: `tqdm` gives you a nice progress bar so you don’t fall asleep.
3. **Batch Loop**: The for-loop iterates through batches. `start\_idx` and `end\_idx` define the slice of the DataFrame to process.
4. **Generate Embeddings**: `batch\_embeddings = embedding\_model.embed(batch, batch\_size=batch\_size)` - This is where the magic happens. Your questions get turned into embeddings.
5. **PointStruct Generation**: Using `.progress\_apply`, it turns each row into a `PointStruct` object. This includes an ID, the embedding vector, and other metadata.
Returns the list of `PointStruct` objects, which can be used to create a collection in Qdrant.
```
`def generate\_points\_from\_dataframe(df: pd.DataFrame) -\> List[PointStruct]:
batch\_size = 512
questions = df["question"].tolist()
total\_batches = len(questions) // batch\_size + 1
pbar = tqdm(total=len(questions), desc="Generating embeddings")
# Generate embeddings in batches to improve performance
embeddings = []
for i in range(total\_batches):
start\_idx = i \* batch\_size
end\_idx = min((i + 1) \* batch\_size, len(questions))
batch = questions[start\_idx:end\_idx]
batch\_embeddings = embedding\_model.embed(batch, batch\_size=batch\_size)
embeddings.extend(batch\_embeddings)
pbar.update(len(batch))
pbar.close()
# Convert embeddings to list of lists
embeddings\_list = [embedding.tolist() for embedding in embeddings]
# Create a temporary DataFrame to hold the embeddings and existing DataFrame columns
temp\_df = df.copy()
temp\_df["embeddings"] = embeddings\_list
temp\_df["id"] = temp\_df.index
# Generate PointStruct objects using DataFrame apply method
points = temp\_df.progress\_apply(
lambda row: PointStruct(
id=row["id"],
vector=row["embeddings"],
payload={
"question": row["question"],
"title": row["title"],
"context": row["context"],
"is\_impossible": row["is\_impossible"],
"answers": row["answers"],
},
),
axis=1,
).tolist()
return points
points = generate\_points\_from\_dataframe(train\_df)`
```
#### Upload the Embeddings to Qdrant
Note that configuring Qdrant is outside the scope of this notebook. Please refer to the [Qdrant](https://qdrant.tech) for more information. We used a timeout of 600 seconds for the upload, and grpc compression to speed up the upload.
```
`operation\_info = qdrant\_client.upsert(
collection\_name=collection\_name, wait=True, points=points
)
print(operation\_info)`
```
## 6. Using Qdrant to Improve RAG Prompt
Now that we’ve uploaded the embeddings to Qdrant, we can use Qdrant to find the most similar questions to the question we’re looking for. We’ll use the top 5 most similar questions to create a prompt that we can use to fine-tune the model. We’ll then measure the performance of the fine-tuned model on the same validation set, but with few shot prompting!
Our main function `get\_few\_shot\_prompt` serves as the workhorse for generating prompts for few-shot learning. It does this by retrieving similar questions from Qdrant - a vector search engine, using an embeddings model. Here is the high-level workflow:
1. Retrieve similar questions from Qdrant where the **answer is present** in the context
2. Retrieve similar questions from Qdrant where the **answer is IMPOSSIBLE** i.e. the expected answer is “I don’t know” to find in the context
3. Create a prompt using the retrieved questions
4. Fine-tune the model using the prompt
5. Evaluate the fine-tuned model on the validation set with the same prompting technique
```
`def get\_few\_shot\_prompt(row):
query, row\_context = row["question"], row["context"]
embeddings = list(embedding\_model.embed([query]))
query\_embedding = embeddings[0].tolist()
num\_of\_qa\_to\_retrieve = 5
# Query Qdrant for similar questions that have an answer
q1 = qdrant\_client.search(
collection\_name=collection\_name,
query\_vector=query\_embedding,
with\_payload=True,
limit=num\_of\_qa\_to\_retrieve,
query\_filter=models.Filter(
must=[
models.FieldCondition(
key="is\_impossible",
match=models.MatchValue(
value=False,
),
),
],
)
)
# Query Qdrant for similar questions that are IMPOSSIBLE to answer
q2 = qdrant\_client.search(
collection\_name=collection\_name,
query\_vector=query\_embedding,
query\_filter=models.Filter(
must=[
models.FieldCondition(
key="is\_impossible",
match=models.MatchValue(
value=True,
),
),
]
),
with\_payload=True,
limit=num\_of\_qa\_to\_retrieve,
)
instruction = """Answer the following Question based on the Context only. Only answer from the Context. If you don't know the answer, say 'I don't know'.\\n\\n"""
# If there is a next best question, add it to the prompt
def q\_to\_prompt(q):
question, context = q.payload["question"], q.payload["context"]
answer = q.payload["answers"][0] if len(q.payload["answers"]) \> 0 else "I don't know"
return [
{
"role": "user",
"content": f"""Question: {question}\\n\\nContext: {context}\\n\\nAnswer:"""
},
{"role": "assistant", "content": answer},
]
rag\_prompt = []
if len(q1) \>= 1:
rag\_prompt += q\_to\_prompt(q1[1])
if len(q2) \>= 1:
rag\_prompt += q\_to\_prompt(q2[1])
if len(q1) \>= 1:
rag\_prompt += q\_to\_prompt(q1[2])
rag\_prompt += [
{
"role": "user",
"content": f"""Question: {query}\\n\\nContext: {row\_context}\\n\\nAnswer:"""
},
]
rag\_prompt = [{"role": "system", "content": instruction}] + rag\_prompt
return rag\_prompt`
```
```
`# ⏰ Time: 2 min
train\_sample["few\_shot\_prompt"] = train\_sample.progress\_apply(get\_few\_shot\_prompt, axis=1)`
```
## 7. Fine-Tuning OpenAI Model with Qdrant
### 7.1 Upload the Fine-Tuning Data to OpenAI
```
`# Prepare the OpenAI File format i.e. JSONL from train\_sample
def dataframe\_to\_jsonl(df):
def create\_jsonl\_entry(row):
messages = row["few\_shot\_prompt"]
return json.dumps({"messages": messages})
jsonl\_output = df.progress\_apply(create\_jsonl\_entry, axis=1)
return "\\n".join(jsonl\_output)
with open("local\_cache/100\_train\_few\_shot.jsonl", "w") as f:
f.write(dataframe\_to\_jsonl(train\_sample))`
```
### 7.2 Fine-Tune the Model
⏰ **Time to run: \~15-30 minutes**
```
`fine\_tuner = OpenAIFineTuner(
training\_file\_path="local\_cache/100\_train\_few\_shot.jsonl",
model\_name="gpt-3.5-turbo",
suffix="trnfewshot20230907"
)
model\_id = fine\_tuner.fine\_tune\_model()
model\_id`
```
```
`# Let's try this out
completion = client.chat.completions.create(
model=model\_id,
messages=[
{"role": "system", "content": "You are a helpful assistant."},
{
"role": "user",
"content": "Can you answer the following question based on the given context? If not, say, I don't know:\\n\\nQuestion: What is the capital of France?\\n\\nContext: The capital of Mars is Gaia. Answer:",
},
{
"role": "assistant",
"content": "I don't know",
},
{
"role": "user",
"content": "Question: Where did Maharana Pratap die?\\n\\nContext: Rana Pratap's defiance of the mighty Mughal empire, almost alone and unaided by the other Rajput states, constitute a glorious saga of Rajput valour and the spirit of self sacrifice for cherished principles. Rana Pratap's methods of guerrilla warfare was later elaborated further by Malik Ambar, the Deccani general, and by Emperor Shivaji.\\nAnswer:",
},
{
"role": "assistant",
"content": "I don't know",
},
{
"role": "user",
"content": "Question: Who did Rana Pratap fight against?\\n\\nContext: In stark contrast to other Rajput rulers who accommodated and formed alliances with the various Muslim dynasties in the subcontinent, by the time Pratap ascended to the throne, Mewar was going through a long standing conflict with the Mughals which started with the defeat of his grandfather Rana Sanga in the Battle of Khanwa in 1527 and continued with the defeat of his father Udai Singh II in Siege of Chittorgarh in 1568. Pratap Singh, gained distinction for his refusal to form any political alliance with the Mughal Empire and his resistance to Muslim domination. The conflicts between Pratap Singh and Akbar led to the Battle of Haldighati. Answer:",
},
{
"role": "assistant",
"content": "Akbar",
},
{
"role": "user",
"content": "Question: Which state is Chittorgarh in?\\n\\nContext: Chittorgarh, located in the southern part of the state of Rajasthan, 233 km (144.8 mi) from Ajmer, midway between Delhi and Mumbai on the National Highway 8 (India) in the road network of Golden Quadrilateral. Chittorgarh is situated where National Highways No. 76 & 79 intersect. Answer:",
},
],
)
print("Correct Answer: Rajasthan\\nModel Answer:")
print(completion.choices[0].message)`
```
⏰ **Time to run: 5-15 min**
```
`df["ft\_generated\_answer\_few\_shot"] = df.progress\_apply(answer\_question, model=model\_id, prompt\_func=get\_few\_shot\_prompt, axis=1)
df.to\_json("local\_cache/100\_val\_ft\_few\_shot.json", orient="records", lines=True)`
```
## 8. Evaluation
But how well does the model perform? Let’s compare the results from the 3 different models we’ve looked at so far:
```
`evaluator = Evaluator(df)
evaluator.plot\_model\_comparison(["generated\_answer", "ft\_generated\_answer", "ft\_generated\_answer\_few\_shot"], scenario="answer\_expected", nice\_names=["Baseline", "Fine-Tuned", "Fine-Tuned with Few-Shot"])`
```
This is quite amazing — we’re able to get the best of both worlds! We’re able to get the model to be both correct and conservative:
1. The model is correct 83% of the time — this is the same as the base model
2. The model gives the wrong answer only 8% of the time — down from 17% with the base model
Next, let’s look at the hallucinations. We want to reduce the hallucinations, but not at the cost of correctness. We want to strike a balance between the two. We’ve struck a good balance here:
1. The model hallucinates 53% of the time — down from 100% with the base model
2. The model says “I don’t know” 47% of the time — up from NEVER with the base model
```
`evaluator.plot\_model\_comparison(["generated\_answer", "ft\_generated\_answer", "ft\_generated\_answer\_few\_shot"], scenario="idk\_expected", nice\_names=["Baseline", "Fine-Tuned", "Fine-Tuned with Few-Shot"])`
```
Few Shot Fine-Tuning with Qdrant is a great way to control and steer the performance of your RAG system. Here, we made the model less conservative compared to zero shot and more confident by using Qdrant to find similar questions.
You can also use Qdrant to make the model more conservative. We did this by giving examples of questions where the answer is not present in the context.
This is biasing the model to say “I don’t know” more often.
Similarly, one can also use Qdrant to make the model more confident by giving examples of questions where the answer is present in the context. This biases the model to give an answer more often. The trade-off is that the model will also hallucinate more often.
You can make this trade off by adjusting the training data: distribution of questions and examples, as well as the kind and number of examples you retrieve from Qdrant.
## 9. Conclusion
In this notebook, we’ve demonstrated how to fine-tune OpenAI models for specific use-cases. We’ve also demonstrated how to use Qdrant and Few-Shot Learning to improve the performance of the model.
### Aggregate Results
So far, we’ve looked at the results for each scenario separately, i.e. each scenario summed to 100. Let’s look at the results as an aggregate to get a broader sense of how the model is performing:
|Category|Base|Fine-Tuned|Fine-Tuned with Qdrant|
|Correct|44%|32%|44%|
|Skipped|0%|18%|5%|
|Wrong|9%|3%|4%|
|Hallucination|47%|7%|25%|
|I don’t know|0%|40%|22%|
### Observations
#### Compared to base model
1. The few shot fine-tuned with Qdrant model is as good as the base model at answering questions where the answer is present in the context.
2. The few shot fine-tuned with Qdrant model is better at saying “I don’t know” when the answer is not present in the context.
3. The few shot fine-tuned with Qdrant model is better at reducing hallucinations.
#### Compared to fine-tuned model
1. The few shot fine-tuned with Qdrant model gets more correct answers than the fine-tuned model: **83% of the questions are answered correctly vs 60%** for the fine-tuned model
2. The few shot fine-tuned with Qdrant model is better at deciding when to say “I don’t know” when the answer is not present in the context. **34% skip rate for the plain fine-tuning mode, vs 9% for the few shot fine-tuned with Qdrant model**
Now, you should be able to:
1. Notice the trade-offs between number of correct answers and hallucinations — and how training dataset choice influences that!
2. Fine-tune OpenAI models for specific use-cases and use Qdrant to improve the performance of your RAG model
3. Get started on how to evaluate the performance of your RAG model