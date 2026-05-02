Fine-Tuned Q&A - train
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
Mar 10, 2022
# Fine-Tuned Q&A - train
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)[ BO ](https://github.com/BorisPower)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ BorisPower ](https://github.com/BorisPower)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/fine-tuned_qa/olympics-3-train-qa.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/fine-tuned_qa/olympics-3-train-qa.ipynb)
Note: To answer questions based on text documents, we recommend the procedure in [Question Answering using Embeddings](https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb). Some of the code below may rely on [deprecated API endpoints](https://github.com/openai/openai-cookbook/tree/main/transition_guides_for_deprecated_API_endpoints).
# 3. Train a fine-tuning model specialized for Q&A
This notebook will utilize the dataset of context, question and answer pairs to additionally create adversarial questions and context pairs, where the question was not generated on that context. In those cases the model will be prompted to answer “No sufficient context for answering the question”. We will also train a discriminator model, which predicts whether the question can be answered based on the context or not.
We will add hard adversarial examples as well, which will be based either on semantically similar sections, or neighbouring sections, originating from the same article.
```
`import openai
import pandas as pd
df = pd.read\_csv('olympics-data/olympics\_qa.csv')
olympics\_search\_fileid = "file-c3shd8wqF3vSCKaukW4Jr1TT"
df.head()`
```
||title|heading|content|tokens|context|questions|answers|
|0|2020 Summer Olympics|Summary|The 2020 Summer Olympics (Japanese: 2020年夏季オリン...|713|2020 Summer Olympics\\nSummary\\n\\nThe 2020 Summ...|1. What is the 2020 Summer Olympics?\\n2. When ...|1. The 2020 Summer Olympics is an internationa...|
|1|2020 Summer Olympics|Host city selection|The International Olympic Committee (IOC) vote...|126|2020 Summer Olympics\\nHost city selection\\n\\nT...|1. \\n2. \\n3. \\n4.|1. What is the International Olympic Committee...|
|2|2020 Summer Olympics|Impact of the COVID-19 pandemic|In January 2020, concerns were raised about th...|369|2020 Summer Olympics\\nImpact of the COVID-19 p...|1. What was the COVID-19 pandemic?\\n2. How did...|1. The COVID-19 pandemic was a pandemic that o...|
|3|2020 Summer Olympics|Qualifying event cancellation and postponement|Concerns about the pandemic began to affect qu...|298|2020 Summer Olympics\\nQualifying event cancell...|1. What was the original location of the Asia ...|1. The original location of the Asia & Oceania...|
|4|2020 Summer Olympics|Effect on doping tests|Mandatory doping tests were being severely res...|163|2020 Summer Olympics\\nEffect on doping tests\\n...|1. What was the COVID-19 pandemic?\\n2. What di...|1. The COVID-19 pandemic was a pandemic that o...|
Split the sections into a training and testing set
```
`from sklearn.model\_selection import train\_test\_split
train\_df, test\_df = train\_test\_split(df, test\_size=0.2, random\_state=42)
len(train\_df), len(test\_df)`
```
```
`(3014, 754)`
```
we check that the separator we intend to use isn’t present within the contexts
```
`df.context.str.contains('-\>').sum()`
```
```
`0`
```
## 3.1 Create the fine-tuning datasets for Q&A and discriminator models
The fine-tuning dataset is created in the following way. For every corresponding question, answer and context pair we create:
* Positive example: correct question, answer, context pair
* Negative examples:
* random negative example, where the random context is paired with the question
* two hard negative examples
* one originating from the same wikipedia article
* another, which is most similar to the correct context
This process is noisy, as sometimes the question might be answerable given a different context, but on average we hope this won’t affect the performance too much.
We apply the same process of dataset creation for both the discriminator, and the Q&A answering model. We apply the process separately for the training and testing set, to ensure that the examples from the training set don’t feature within the test set.
```
`import random
def get\_random\_similar\_contexts(question, context, file\_id=olympics\_search\_fileid, search\_model='ada', max\_rerank=10):
"""
Find similar contexts to the given context using the search file
"""
try:
# TODO: openai.Engine(search\_model) is deprecated
results = openai.Engine(search\_model).search(
search\_model=search\_model,
query=question,
max\_rerank=max\_rerank,
file=file\_id
)
candidates = []
for result in results['data'][:3]:
if result['text'] == context:
continue
candidates.append(result['text'])
random\_candidate = random.choice(candidates)
return random\_candidate
except Exception as e:
print(e)
return ""
def create\_fine\_tuning\_dataset(df, discriminator=False, n\_negative=1, add\_related=False):
"""
Create a dataset for fine tuning the OpenAI model; either for a discriminator model,
or a model specializing in Q&A, where it says if no relevant context is found.
Parameters
----------
df: pd.DataFrame
The dataframe containing the question, answer and context pairs
discriminator: bool
Whether to create a dataset for the discriminator
n\_negative: int
The number of random negative samples to add (using a random context)
add\_related: bool
Whether to add the related contexts to the correct context. These are hard negative examples
Returns
-------
pd.DataFrame
The dataframe containing the prompts and completions, ready for fine-tuning
"""
rows = []
for i, row in df.iterrows():
for q, a in zip(("1." + row.questions).split('\\n'), ("1." + row.answers).split('\\n')):
if len(q) \>10 and len(a) \>10:
if discriminator:
rows.append({"prompt":f"{row.context}\\nQuestion: {q[2:].strip()}\\n Related:", "completion":f" yes"})
else:
rows.append({"prompt":f"{row.context}\\nQuestion: {q[2:].strip()}\\nAnswer:", "completion":f" {a[2:].strip()}"})
for i, row in df.iterrows():
for q in ("1." + row.questions).split('\\n'):
if len(q) \>10:
for j in range(n\_negative + (2 if add\_related else 0)):
random\_context = ""
if j == 0 and add\_related:
# add the related contexts based on originating from the same wikipedia page
subset = df[(df.title == row.title) & (df.context != row.context)]
if len(subset) \< 1:
continue
random\_context = subset.sample(1).iloc[0].context
if j == 1 and add\_related:
# add the related contexts based on the most similar contexts according to the search
random\_context = get\_random\_similar\_contexts(q[2:].strip(), row.context, search\_model='ada', max\_rerank=10)
else:
while True:
# add random context, which isn't the correct context
random\_context = df.sample(1).iloc[0].context
if random\_context != row.context:
break
if discriminator:
rows.append({"prompt":f"{random\_context}\\nQuestion: {q[2:].strip()}\\n Related:", "completion":f" no"})
else:
rows.append({"prompt":f"{random\_context}\\nQuestion: {q[2:].strip()}\\nAnswer:", "completion":f" No appropriate context found to answer the question."})
return pd.DataFrame(rows)`
```
We apply the same process of dataset creation for both the discriminator, and the Q&A answering model. We apply the process separately for the training and testing set, to ensure that the examples from the training set don’t feature within the test set.
```
`for name, is\_disc in [('discriminator', True), ('qa', False)]:
for train\_test, dt in [('train', train\_df), ('test', test\_df)]:
ft = create\_fine\_tuning\_dataset(dt, discriminator=is\_disc, n\_negative=1, add\_related=True)
ft.to\_json(f'{name}\_{train\_test}.jsonl', orient='records', lines=True)`
```
We formatted the data according to the recommendations from the fine-tuning tool, which is available using
>
> openai tools fine_tunes.prepare_data -f qa_train.jsonl
>
We highly recommend that you use this tool, which suggests improvements in your data formatting for fine-tuning.
## 3.2 Submit the datasets for fine-tuning
```
`!openai api fine\_tunes.create -t "olympics-data/discriminator\_train.jsonl" -v "olympics-data/discriminator\_test.jsonl" --batch\_size 16 --compute\_classification\_metrics --classification\_positive\_class " yes" --model ada`
```
```
`!openai api fine\_tunes.create -t "olympics-data/qa\_train.jsonl" -v "olympics-data/qa\_test.jsonl" --batch\_size 16`
```
## 3.3 Using the fine-tuned models
We will now use the fine-tuned discriminator and the fine-tuned Q&A model. By requesting logprobs, we can see how certain the discriminator is in a `yes` vs `no` answer.
```
`ft\_discriminator = "curie:ft-openai-internal-2021-08-23-23-58-57"
ft\_qa = "curie:ft-openai-internal-2021-08-23-17-54-10"
def apply\_ft\_discriminator(context, question, discriminator\_model):
"""
Apply the fine tuned discriminator to a question, to assess whether it can be answered from the context.
"""
prompt = f"{context}\\nQuestion: {question}\\n Related:"
result = openai.chat.completions.create(model=discriminator\_model, prompt=prompt, max\_tokens=1, temperature=0, top\_p=1, n=1, logprobs=2)
return result['choices'][0]['logprobs']['top\_logprobs']
apply\_ft\_discriminator('The first human-made object in space was the Soviet Union satellite Sputnik 1 on 4 October 1957.',
'What was the first human-made object in space?', ft\_discriminator)`
```
```
`[\<OpenAIObject at 0x7fe812e602b0\> JSON: {
" no": -10.819577,
" yes": -2.045765e-05
}]`
```
We can see that the model can generalize well to different contexts and questions.
```
`def apply\_ft\_qa\_answer(context, question, answering\_model):
"""
Apply the fine tuned discriminator to a question
"""
prompt = f"{context}\\nQuestion: {question}\\nAnswer:"
result = openai.chat.completions.create(model=answering\_model, prompt=prompt, max\_tokens=30, temperature=0, top\_p=1, n=1, stop=['.','\\n'])
return result['choices'][0]['text']
apply\_ft\_qa\_answer('The first human-made object in space was the Soviet Union satellite Sputnik 1 on 4 October 1957.',
'What was the first human-made object in space?', ft\_qa)`
```
```
`' The first human-made object in space was the Soviet Union satellite Sputnik 1 on 4 October 1957'`
```
We can see that the model can answer the question, when the context is appropriate.
```
`apply\_ft\_qa\_answer('The first human-made object in space was the Soviet Union satellite Sputnik 1 on 4 October 1957.',
'What is impressive about the Soviet Union?', ft\_qa)`
```
```
`' The Soviet Union was the first country to successfully launch a satellite into space'`
```
```
`apply\_ft\_qa\_answer('The first human-made object in space was the Soviet Union satellite Sputnik 1 on 4 October 1957.',
'How many cars were produced in the Soviet Union in 1970?', ft\_qa)`
```
```
`' No appropriate context found to answer the question'`
```
We can see that the model knows when to answer the question, and when to say that insufficient context is present to answer the question.
We can also combine a discriminator and a base model, or a fine-tuned Q&A model. Discriminator can essentially serve as a decision whether the question can be answered given the context or not.
```
`def answer\_question\_conditionally(answering\_model, discriminator\_model, context, question, discriminator\_logprob\_yes\_modifier=0):
logprobs = apply\_ft\_discriminator(context, question, discriminator\_model)
yes\_logprob = logprobs[' yes'] if ' yes' in logprobs else -100
no\_logprob = logprobs[' no'] if ' no' in logprobs else -100
if yes\_logprob + discriminator\_logprob\_yes\_modifier \< no\_logprob:
return " No appropriate context found to answer the question based on the discriminator."
return apply\_ft\_qa\_answer(context, question, answering\_model)
answer\_question\_conditionally(ft\_qa, ft\_discriminator,
"Crowdless games are a rare although not unheard-of occurrence in sports. \\
When they do occur, it is usually the result of events beyond the control \\
of the teams or fans, such as weather-related concerns, public health concerns, \\
or wider civil disturbances unrelated to the game. For instance, \\
the COVID-19 pandemic caused many sports leagues around the world \\
to be played behind closed doors.",
"Could weather cause a sport event to have no crowd?")`
```
```
`' Weather could cause a sport event to have no crowd'`
```
The above function illustrates how to potentially combine a discriminator and a fine-tuned Q&A model. This gives a more fine-grained control over how certain we want the model to be before it answers the question.
We’ll now take a look on how answers endpoint works - combining search to retrieve the relevant context from a knowledge base, and then using the fine-tuned Q&A model to answer the question.
## 3.4 Answering the question based on a knowledge base
Finally we can use a logic similar to the [/answers](https://beta.openai.com/docs/api-reference/answers) endpoint, where we first search for the relevant context, and then ask a Q&A model to answer the question given that context. If you’d like to see the implementation details, check out the [`answers\_with\_ft.py`](answers_with_ft.py) file.
```
`from answers\_with\_ft import answer\_question
answer\_question(olympics\_search\_fileid, ft\_qa, "Which country won the Women's football tournament at the 2020 Olympic games?")`
```
```
`" Canada won the Women's football tournament at the 2020 Olympic games"`
```