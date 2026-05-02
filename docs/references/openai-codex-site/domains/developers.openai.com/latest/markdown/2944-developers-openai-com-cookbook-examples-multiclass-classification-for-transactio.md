Multiclass Classification for Transactions
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
Oct 20, 2022
# Multiclass Classification for Transactions
This recipe is archived and may reference outdated models or APIs.
[ CJ ](https://twitter.com/colintjarvis)[ VC ](https://www.linkedin.com/in/vishnu-chopra/)
[ Colin Jarvis
(OpenAI)
, ](https://twitter.com/colintjarvis)[ Vishnu Chopra
(OpenAI)
](https://www.linkedin.com/in/vishnu-chopra/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Multiclass_classification_for_transactions.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Multiclass_classification_for_transactions.ipynb)
For this notebook we will be looking to classify a public dataset of transactions into a number of categories that we have predefined. These approaches should be replicable to any multiclass classification use case where we are trying to fit transactional data into predefined categories, and by the end of running through this you should have a few approaches for dealing with both labelled and unlabelled datasets.
The different approaches we’ll be taking in this notebook are:
* **Zero-shot Classification:** First we’ll do zero shot classification to put transactions in one of five named buckets using only a prompt for guidance
* **Classification with Embeddings:** Following this we’ll create embeddings on a labelled dataset, and then use a traditional classification model to test their effectiveness at identifying our categories
* **Fine-tuned Classification:** Lastly we’ll produce a fine-tuned model trained on our labelled dataset to see how this compares to the zero-shot and few-shot classification approaches
## Setup
```
`%load\_ext autoreload
%autoreload
%pip install openai 'openai[datalib]' 'openai[embeddings]' transformers scikit-learn matplotlib plotly pandas scipy`
```
```
`import openai
import pandas as pd
import numpy as np
import json
import os
COMPLETIONS\_MODEL = "gpt-4"
os.environ["OPENAI\_API\_KEY"] = "\<your-api-key\>"
client = openai.OpenAI()`
```
### Load dataset
We’re using a public transaction dataset of transactions over £25k for the Library of Scotland. The dataset has three features that we’ll be using:
* Supplier: The name of the supplier
* Description: A text description of the transaction
* Value: The value of the transaction in GBP
**Source**:
[https://data.nls.uk/data/organisational-data/transactions-over-25k/](https://data.nls.uk/data/organisational-data/transactions-over-25k/)
```
`transactions = pd.read\_csv('./data/25000\_spend\_dataset\_current.csv', encoding= 'unicode\_escape')
print(f"Number of transactions: {len(transactions)}")
print(transactions.head())`
```
```
`Number of transactions: 359
Date Supplier Description \\
0 21/04/2016 M & J Ballantyne Ltd George IV Bridge Work
1 26/04/2016 Private Sale Literary & Archival Items
2 30/04/2016 City Of Edinburgh Council Non Domestic Rates
3 09/05/2016 Computacenter Uk Kelvin Hall
4 09/05/2016 John Graham Construction Ltd Causewayside Refurbishment
Transaction value (£)
0 35098.0
1 30000.0
2 40800.0
3 72835.0
4 64361.0`
```
## Zero-shot Classification
We’ll first assess the performance of the base models at classifying these transactions using a simple prompt. We’ll provide the model with 5 categories and a catch-all of “Could not classify” for ones that it cannot place.
```
`zero\_shot\_prompt = '''You are a data expert working for the National Library of Scotland.
You are analysing all transactions over £25,000 in value and classifying them into one of five categories.
The five categories are Building Improvement, Literature & Archive, Utility Bills, Professional Services and Software/IT.
If you can't tell what it is, say Could not classify
Transaction:
Supplier: {}
Description: {}
Value: {}
The classification is:'''
def format\_prompt(transaction):
return zero\_shot\_prompt.format(transaction['Supplier'], transaction['Description'], transaction['Transaction value (£)'])
def classify\_transaction(transaction):
prompt = format\_prompt(transaction)
messages = [
{"role": "system", "content": prompt},
]
completion\_response = openai.chat.completions.create(
messages=messages,
temperature=0,
max\_tokens=5,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0,
model=COMPLETIONS\_MODEL)
label = completion\_response.choices[0].message.content.replace('\\n','')
return label`
```
```
`# Get a test transaction
transaction = transactions.iloc[0]
# Use our completion function to return a prediction
print(f"Transaction: {transaction['Supplier']} {transaction['Description']} {transaction['Transaction value (£)']}")
print(f"Classification: {classify\_transaction(transaction)}")`
```
```
`Transaction: M & J Ballantyne Ltd George IV Bridge Work 35098.0
Classification: Building Improvement`
```
Our first attempt is correct, M & J Ballantyne Ltd are a house builder and the work they performed is indeed Building Improvement.
Lets expand the sample size to 25 and see how it performs, again with just a simple prompt to guide it
```
`test\_transactions = transactions.iloc[:25]
test\_transactions['Classification'] = test\_transactions.apply(lambda x: classify\_transaction(x),axis=1)`
```
```
`/var/folders/3n/79rgh27s6l7\_l91b9shw0\_nr0000gp/T/ipykernel\_81921/2775604370.py:2: SettingWithCopyWarning:
A value is trying to be set on a copy of a slice from a DataFrame.
Try using .loc[row\_indexer,col\_indexer] = value instead
See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user\_guide/indexing.html#returning-a-view-versus-a-copy
test\_transactions['Classification'] = test\_transactions.apply(lambda x: classify\_transaction(x),axis=1)`
```
```
`test\_transactions['Classification'].value\_counts()`
```
```
`Classification
Building Improvement 17
Literature & Archive 3
Software/IT 2
Could not classify 2
Utility Bills 1
Name: count, dtype: int64`
```
```
`test\_transactions.head(25)`
```
||Date|Supplier|Description|Transaction value (£)|Classification|
|0|21/04/2016|M & J Ballantyne Ltd|George IV Bridge Work|35098.0|Building Improvement|
|1|26/04/2016|Private Sale|Literary & Archival Items|30000.0|Literature & Archive|
|2|30/04/2016|City Of Edinburgh Council|Non Domestic Rates|40800.0|Utility Bills|
|3|09/05/2016|Computacenter Uk|Kelvin Hall|72835.0|Software/IT|
|4|09/05/2016|John Graham Construction Ltd|Causewayside Refurbishment|64361.0|Building Improvement|
|5|09/05/2016|A McGillivray|Causewayside Refurbishment|53690.0|Building Improvement|
|6|16/05/2016|John Graham Construction Ltd|Causewayside Refurbishment|365344.0|Building Improvement|
|7|23/05/2016|Computacenter Uk|Kelvin Hall|26506.0|Software/IT|
|8|23/05/2016|ECG Facilities Service|Facilities Management Charge|32777.0|Building Improvement|
|9|23/05/2016|ECG Facilities Service|Facilities Management Charge|32777.0|Building Improvement|
|10|30/05/2016|ALDL|ALDL Charges|32317.0|Could not classify|
|11|10/06/2016|Wavetek Ltd|Kelvin Hall|87589.0|Building Improvement|
|12|10/06/2016|John Graham Construction Ltd|Causewayside Refurbishment|381803.0|Building Improvement|
|13|28/06/2016|ECG Facilities Service|Facilities Management Charge|32832.0|Building Improvement|
|14|30/06/2016|Glasgow City Council|Kelvin Hall|1700000.0|Building Improvement|
|15|11/07/2016|Wavetek Ltd|Kelvin Hall|65692.0|Building Improvement|
|16|11/07/2016|John Graham Construction Ltd|Causewayside Refurbishment|139845.0|Building Improvement|
|17|15/07/2016|Sotheby'S|Literary & Archival Items|28500.0|Literature & Archive|
|18|18/07/2016|Christies|Literary & Archival Items|33800.0|Literature & Archive|
|19|25/07/2016|A McGillivray|Causewayside Refurbishment|30113.0|Building Improvement|
|20|31/07/2016|ALDL|ALDL Charges|32317.0|Could not classify|
|21|08/08/2016|ECG Facilities Service|Facilities Management Charge|32795.0|Building Improvement|
|22|15/08/2016|Creative Video Productions Ltd|Kelvin Hall|26866.0|Building Improvement|
|23|15/08/2016|John Graham Construction Ltd|Causewayside Refurbishment|196807.0|Building Improvement|
|24|24/08/2016|ECG Facilities Service|Facilities Management Charge|32795.0|Building Improvement|
Initial results are pretty good even with no labelled examples! The ones that it could not classify were tougher cases with few clues as to their topic, but maybe if we clean up the labelled dataset to give more examples we can get better performance.
## Classification with Embeddings
Lets create embeddings from the small set that we’ve classified so far - we’ve made a set of labelled examples by running the zero-shot classifier on 101 transactions from our dataset and manually correcting the 15 **Could not classify** results that we got
### Create embeddings
This initial section reuses the approach from the [Get\_embeddings\_from\_dataset Notebook](Get_embeddings_from_dataset.ipynb) to create embeddings from a combined field concatenating all of our features
```
`df = pd.read\_csv('./data/labelled\_transactions.csv')
df.head()`
```
||Date|Supplier|Description|Transaction value (£)|Classification|
|0|15/08/2016|Creative Video Productions Ltd|Kelvin Hall|26866|Other|
|1|29/05/2017|John Graham Construction Ltd|Causewayside Refurbishment|74806|Building Improvement|
|2|29/05/2017|Morris & Spottiswood Ltd|George IV Bridge Work|56448|Building Improvement|
|3|31/05/2017|John Graham Construction Ltd|Causewayside Refurbishment|164691|Building Improvement|
|4|24/07/2017|John Graham Construction Ltd|Causewayside Refurbishment|27926|Building Improvement|
```
`df['combined'] = "Supplier: " + df['Supplier'].str.strip() + "; Description: " + df['Description'].str.strip() + "; Value: " + str(df['Transaction value (£)']).strip()
df.head(2)`
```
||Date|Supplier|Description|Transaction value (£)|Classification|combined|
|0|15/08/2016|Creative Video Productions Ltd|Kelvin Hall|26866|Other|Supplier: Creative Video Productions Ltd; Desc...|
|1|29/05/2017|John Graham Construction Ltd|Causewayside Refurbishment|74806|Building Improvement|Supplier: John Graham Construction Ltd; Descri...|
```
`from transformers import GPT2TokenizerFast
tokenizer = GPT2TokenizerFast.from\_pretrained("gpt2")
df['n\_tokens'] = df.combined.apply(lambda x: len(tokenizer.encode(x)))
len(df)`
```
```
`101`
```
```
`embedding\_path = './data/transactions\_with\_embeddings\_100.csv'`
```
```
`from utils.embeddings\_utils import get\_embedding
df['babbage\_similarity'] = df.combined.apply(lambda x: get\_embedding(x))
df['babbage\_search'] = df.combined.apply(lambda x: get\_embedding(x))
df.to\_csv(embedding\_path)`
```
### Use embeddings for classification
Now that we have our embeddings, let see if classifying these into the categories we’ve named gives us any more success.
For this we’ll use a template from the [Classification\_using\_embeddings](Classification_using_embeddings.ipynb) notebook
```
`from sklearn.ensemble import RandomForestClassifier
from sklearn.model\_selection import train\_test\_split
from sklearn.metrics import classification\_report
from ast import literal\_eval
fs\_df = pd.read\_csv(embedding\_path)
fs\_df["babbage\_similarity"] = fs\_df.babbage\_similarity.apply(literal\_eval).apply(np.array)
fs\_df.head()`
```
||Unnamed: 0|Date|Supplier|Description|Transaction value (£)|Classification|combined|n\_tokens|babbage\_similarity|babbage\_search|
|0|0|15/08/2016|Creative Video Productions Ltd|Kelvin Hall|26866|Other|Supplier: Creative Video Productions Ltd; Desc...|136|[-0.02898375503718853, -0.02881557121872902, 0...|[-0.02879939414560795, -0.02867320366203785, 0...|
|1|1|29/05/2017|John Graham Construction Ltd|Causewayside Refurbishment|74806|Building Improvement|Supplier: John Graham Construction Ltd; Descri...|140|[-0.024112487211823463, -0.02881261520087719, ...|[-0.024112487211823463, -0.02881261520087719, ...|
|2|2|29/05/2017|Morris & Spottiswood Ltd|George IV Bridge Work|56448|Building Improvement|Supplier: Morris & Spottiswood Ltd; Descriptio...|141|[0.013581369072198868, -0.003978211898356676, ...|[0.013593776151537895, -0.0037341134157031775,...|
|3|3|31/05/2017|John Graham Construction Ltd|Causewayside Refurbishment|164691|Building Improvement|Supplier: John Graham Construction Ltd; Descri...|140|[-0.024112487211823463, -0.02881261520087719, ...|[-0.024112487211823463, -0.02881261520087719, ...|
|4|4|24/07/2017|John Graham Construction Ltd|Causewayside Refurbishment|27926|Building Improvement|Supplier: John Graham Construction Ltd; Descri...|140|[-0.02408558875322342, -0.02881370671093464, 0...|[-0.024109570309519768, -0.02880912832915783, ...|
```
`X\_train, X\_test, y\_train, y\_test = train\_test\_split(
list(fs\_df.babbage\_similarity.values), fs\_df.Classification, test\_size=0.2, random\_state=42
)
clf = RandomForestClassifier(n\_estimators=100)
clf.fit(X\_train, y\_train)
preds = clf.predict(X\_test)
probas = clf.predict\_proba(X\_test)
report = classification\_report(y\_test, preds)
print(report)`
```
```
` precision recall f1-score support
Building Improvement 0.92 1.00 0.96 11
Literature & Archive 1.00 1.00 1.00 3
Other 0.00 0.00 0.00 1
Software/IT 1.00 1.00 1.00 1
Utility Bills 1.00 1.00 1.00 5
accuracy 0.95 21
macro avg 0.78 0.80 0.79 21
weighted avg 0.91 0.95 0.93 21`
```
```
`/Users/vishnu/code/openai-cookbook/cookbook\_env/lib/python3.11/site-packages/sklearn/metrics/\_classification.py:1565: UndefinedMetricWarning: Precision is ill-defined and being set to 0.0 in labels with no predicted samples. Use `zero\_division` parameter to control this behavior.
\_warn\_prf(average, modifier, f"{metric.capitalize()} is", len(result))
/Users/vishnu/code/openai-cookbook/cookbook\_env/lib/python3.11/site-packages/sklearn/metrics/\_classification.py:1565: UndefinedMetricWarning: Precision is ill-defined and being set to 0.0 in labels with no predicted samples. Use `zero\_division` parameter to control this behavior.
\_warn\_prf(average, modifier, f"{metric.capitalize()} is", len(result))
/Users/vishnu/code/openai-cookbook/cookbook\_env/lib/python3.11/site-packages/sklearn/metrics/\_classification.py:1565: UndefinedMetricWarning: Precision is ill-defined and being set to 0.0 in labels with no predicted samples. Use `zero\_division` parameter to control this behavior.
\_warn\_prf(average, modifier, f"{metric.capitalize()} is", len(result))`
```
Performance for this model is pretty strong, so creating embeddings and using even a simpler classifier looks like an effective approach as well, with the zero-shot classifier helping us do the initial classification of the unlabelled dataset.
Lets take it one step further and see if a fine-tuned model trained on this same labelled datasets gives us comparable results
## Fine-tuned Transaction Classification
For this use case we’re going to try to improve on the few-shot classification from above by training a fine-tuned model on the same labelled set of 101 transactions and applying this fine-tuned model on group of unseen transactions
### Building Fine-tuned Classifier
We’ll need to do some data prep first to get our data ready. This will take the following steps:
* To prepare our training and validation sets, we’ll create a set of message sequences. The first message for each will be the user prompt formatted with the details of the transaction, and the final message will be the expected classification response from the model
* Our test set will contain the initial user prompt for each transaction, along with the corresponding expected class label. We will then use the fine-tuned model to generate the actual classification for each transaction.
```
`ft\_prep\_df = fs\_df.copy()
len(ft\_prep\_df)`
```
```
`101`
```
```
`ft\_prep\_df.head()`
```
||Unnamed: 0|Date|Supplier|Description|Transaction value (£)|Classification|combined|n\_tokens|babbage\_similarity|babbage\_search|
|0|0|15/08/2016|Creative Video Productions Ltd|Kelvin Hall|26866|Other|Supplier: Creative Video Productions Ltd; Desc...|136|[-0.028885245323181152, -0.028660893440246582,...|[-0.02879939414560795, -0.02867320366203785, 0...|
|1|1|29/05/2017|John Graham Construction Ltd|Causewayside Refurbishment|74806|Building Improvement|Supplier: John Graham Construction Ltd; Descri...|140|[-0.024112487211823463, -0.02881261520087719, ...|[-0.02414606139063835, -0.02883070334792137, 0...|
|2|2|29/05/2017|Morris & Spottiswood Ltd|George IV Bridge Work|56448|Building Improvement|Supplier: Morris & Spottiswood Ltd; Descriptio...|141|[0.013593776151537895, -0.0037341134157031775,...|[0.013561442494392395, -0.004199974238872528, ...|
|3|3|31/05/2017|John Graham Construction Ltd|Causewayside Refurbishment|164691|Building Improvement|Supplier: John Graham Construction Ltd; Descri...|140|[-0.024112487211823463, -0.02881261520087719, ...|[-0.024112487211823463, -0.02881261520087719, ...|
|4|4|24/07/2017|John Graham Construction Ltd|Causewayside Refurbishment|27926|Building Improvement|Supplier: John Graham Construction Ltd; Descri...|140|[-0.024112487211823463, -0.02881261520087719, ...|[-0.024112487211823463, -0.02881261520087719, ...|
```
`classes = list(set(ft\_prep\_df['Classification']))
class\_df = pd.DataFrame(classes).reset\_index()
class\_df.columns = ['class\_id','class']
class\_df , len(class\_df)`
```
```
`( class\_id class
0 0 Other
1 1 Literature & Archive
2 2 Software/IT
3 3 Utility Bills
4 4 Building Improvement,
5)`
```
```
`ft\_df\_with\_class = ft\_prep\_df.merge(class\_df,left\_on='Classification',right\_on='class',how='inner')
# Creating a list of messages for the fine-tuning job. The user message is the prompt, and the assistant message is the response from the model
ft\_df\_with\_class['messages'] = ft\_df\_with\_class.apply(lambda x: [{"role": "user", "content": format\_prompt(x)}, {"role": "assistant", "content": x['class']}],axis=1)
ft\_df\_with\_class[['messages', 'class']].head()`
```
||messages|class|
|0|[{'role': 'user', 'content': 'You are a data e...|Other|
|1|[{'role': 'user', 'content': 'You are a data e...|Building Improvement|
|2|[{'role': 'user', 'content': 'You are a data e...|Building Improvement|
|3|[{'role': 'user', 'content': 'You are a data e...|Building Improvement|
|4|[{'role': 'user', 'content': 'You are a data e...|Building Improvement|
```
`# Create train/validation split
samples = ft\_df\_with\_class["messages"].tolist()
train\_df, valid\_df = train\_test\_split(samples, test\_size=0.2, random\_state=42)
def write\_to\_jsonl(list\_of\_messages, filename):
with open(filename, "w+") as f:
for messages in list\_of\_messages:
object = {
"messages": messages
}
f.write(json.dumps(object) + "\\n")`
```
```
`# Write the train/validation split to jsonl files
train\_file\_name, valid\_file\_name = "transactions\_grouped\_train.jsonl", "transactions\_grouped\_valid.jsonl"
write\_to\_jsonl(train\_df, train\_file\_name)
write\_to\_jsonl(valid\_df, valid\_file\_name)`
```
```
`# Upload the files to OpenAI
train\_file = client.files.create(file=open(train\_file\_name, "rb"), purpose="fine-tune")
valid\_file = client.files.create(file=open(valid\_file\_name, "rb"), purpose="fine-tune")`
```
```
`# Create the fine-tuning job
fine\_tuning\_job = client.fine\_tuning.jobs.create(training\_file=train\_file.id, validation\_file=valid\_file.id, model="gpt-4o-2024-08-06")
# Get the fine-tuning job status and model name
status = client.fine\_tuning.jobs.retrieve(fine\_tuning\_job.id)`
```
```
`# Once the fine-tuning job is complete, you can retrieve the model name from the job status
fine\_tuned\_model = client.fine\_tuning.jobs.retrieve(fine\_tuning\_job.id).fine\_tuned\_model
print(f"Fine tuned model id: {fine\_tuned\_model}")`
```
```
`Fine tuned model id: ft:gpt-4o-2024-08-06:openai::BKr3Xy8U`
```
### Applying Fine-tuned Classifier
Now we’ll apply our classifier to see how it performs. We only had 31 unique observations in our training set and 8 in our validation set, so lets see how the performance is
```
`# Create a test set with the expected class labels
test\_set = pd.read\_json(valid\_file\_name, lines=True)
test\_set['expected\_class'] = test\_set.apply(lambda x: x['messages'][-1]['content'], axis=1)
test\_set.head()`
```
||messages|expected\_class|
|0|[{'role': 'user', 'content': 'You are a data e...|Utility Bills|
|1|[{'role': 'user', 'content': 'You are a data e...|Literature & Archive|
|2|[{'role': 'user', 'content': 'You are a data e...|Literature & Archive|
|3|[{'role': 'user', 'content': 'You are a data e...|Literature & Archive|
|4|[{'role': 'user', 'content': 'You are a data e...|Building Improvement|
```
`# Apply the fine-tuned model to the test set
test\_set['response'] = test\_set.apply(lambda x: openai.chat.completions.create(model=fine\_tuned\_model, messages=x['messages'][:-1], temperature=0),axis=1)
test\_set['predicted\_class'] = test\_set.apply(lambda x: x['response'].choices[0].message.content, axis=1)
test\_set.head()`
```
||messages|expected\_class|response|predicted\_class|
|0|[{'role': 'user', 'content': 'You are a data e...|Utility Bills|ChatCompletion(id='chatcmpl-BKrC0S1wQSfM9ZQfcC...|Utility Bills|
|1|[{'role': 'user', 'content': 'You are a data e...|Literature & Archive|ChatCompletion(id='chatcmpl-BKrC1BTr0DagbDkC2s...|Literature & Archive|
|2|[{'role': 'user', 'content': 'You are a data e...|Literature & Archive|ChatCompletion(id='chatcmpl-BKrC1H3ZeIW5cz2Owr...|Literature & Archive|
|3|[{'role': 'user', 'content': 'You are a data e...|Literature & Archive|ChatCompletion(id='chatcmpl-BKrC1wdhaMP0Q7YmYx...|Literature & Archive|
|4|[{'role': 'user', 'content': 'You are a data e...|Building Improvement|ChatCompletion(id='chatcmpl-BKrC20c5pkpngy1xDu...|Building Improvement|
```
`# Calculate the accuracy of the predictions
from sklearn.metrics import f1\_score
test\_set['result'] = test\_set.apply(lambda x: str(x['predicted\_class']).strip() == str(x['expected\_class']).strip(), axis = 1)
test\_set['result'].value\_counts()
print(test\_set['result'].value\_counts())
print("F1 Score: ", f1\_score(test\_set['expected\_class'], test\_set['predicted\_class'], average="weighted"))
print("Raw Accuracy: ", test\_set['result'].value\_counts()[True] / len(test\_set))`
```
```
`result
True 20
False 1
Name: count, dtype: int64
F1 Score: 0.9296066252587991
Raw Accuracy: 0.9523809523809523`
```