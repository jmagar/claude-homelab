How to fine-tune chat models
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
Jul 23, 2024
# How to fine-tune chat models
[ SF ](https://twitter.com/simonpfish)[ SA ](https://twitter.com/shyamalanadkat)
[ Simón Fishman
(OpenAI)
, ](https://twitter.com/simonpfish)[ Shyamal Anadkat
(OpenAI)
](https://twitter.com/shyamalanadkat)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_finetune_chat_models.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_finetune_chat_models.ipynb)
Fine-tuning improves the model by training on many more examples than can fit in a prompt, letting you achieve better results on a wide number of tasks. This notebook provides a step-by-step guide for our new GPT-4o mini fine-tuning. We’ll perform entity extraction using the [RecipeNLG dataset](https://github.com/Glorf/recipenlg), which provides various recipes and a list of extracted generic ingredients for each. This is a common dataset for named entity recognition (NER) tasks.
Note: **GPT-4o mini fine-tuning is available to developers in our [Tier 4 and 5 usage tiers](https://platform.openai.com/docs/guides/rate-limits/usage-tiers).** You can start fine-tuning GPT-4o mini by visiting your fine-tuning dashboard, clicking “create”, and selecting “gpt-4o-mini-2024-07-18” from the base model drop-down.
We will go through the following steps:
1. **Setup:** Loading our dataset and filtering down to one domain to fine-tune on.
2. **Data preparation:** Preparing your data for fine-tuning by creating training and validation examples, and uploading them to the `Files` endpoint.
3. **Fine-tuning:** Creating your fine-tuned model.
4. **Inference:** Using your fine-tuned model for inference on new inputs.
By the end of this you should be able to train, evaluate and deploy a fine-tuned `gpt-4o-mini-2024-07-18` model.
For more information on fine-tuning, you can refer to our [documentation guide](https://platform.openai.com/docs/guides/fine-tuning) or [API reference](https://platform.openai.com/docs/api-reference/fine-tuning).
## Setup
```
`# make sure to use the latest version of the openai python package
!pip install --upgrade --quiet openai`
```
```
`import json
import openai
import os
import pandas as pd
from pprint import pprint
client = openai.OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"),
organization="\<org id\>",
project="\<project id\>",
)`
```
Fine-tuning works best when focused on a particular domain. It’s important to make sure your dataset is both focused enough for the model to learn, but general enough that unseen examples won’t be missed. Having this in mind, we have extracted a subset from the RecipesNLG dataset to only contain documents from [cookbooks.com](https://cookbooks.com/).
```
`# Read in the dataset we'll use for this task.
# This will be the RecipesNLG dataset, which we've cleaned to only contain documents from www.cookbooks.com
recipe\_df = pd.read\_csv("data/cookbook\_recipes\_nlg\_10k.csv")
recipe\_df.head()`
```
||title|ingredients|directions|link|source|NER|
|0|No-Bake Nut Cookies|["1 c. firmly packed brown sugar", "1/2 c. eva...|["In a heavy 2-quart saucepan, mix brown sugar...|www.cookbooks.com/Recipe-Details.aspx?id=44874|www.cookbooks.com|["brown sugar", "milk", "vanilla", "nuts", "bu...|
|1|Jewell Ball'S Chicken|["1 small jar chipped beef, cut up", "4 boned ...|["Place chipped beef on bottom of baking dish....|www.cookbooks.com/Recipe-Details.aspx?id=699419|www.cookbooks.com|["beef", "chicken breasts", "cream of mushroom...|
|2|Creamy Corn|["2 (16 oz.) pkg. frozen corn", "1 (8 oz.) pkg...|["In a slow cooker, combine all ingredients. C...|www.cookbooks.com/Recipe-Details.aspx?id=10570|www.cookbooks.com|["frozen corn", "cream cheese", "butter", "gar...|
|3|Chicken Funny|["1 large whole chicken", "2 (10 1/2 oz.) cans...|["Boil and debone chicken.", "Put bite size pi...|www.cookbooks.com/Recipe-Details.aspx?id=897570|www.cookbooks.com|["chicken", "chicken gravy", "cream of mushroo...|
|4|Reeses Cups(Candy)|["1 c. peanut butter", "3/4 c. graham cracker ...|["Combine first four ingredients and press in ...|www.cookbooks.com/Recipe-Details.aspx?id=659239|www.cookbooks.com|["peanut butter", "graham cracker crumbs", "bu...|
## Data preparation
We’ll begin by preparing our data. When fine-tuning with the `ChatCompletion` format, each training example is a simple list of `messages`. For example, an entry could look like:
```
`[{'role': 'system',
'content': 'You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided.'},
{'role': 'user',
'content': 'Title: No-Bake Nut Cookies\\n\\nIngredients: ["1 c. firmly packed brown sugar", "1/2 c. evaporated milk", "1/2 tsp. vanilla", "1/2 c. broken nuts (pecans)", "2 Tbsp. butter or margarine", "3 1/2 c. bite size shredded rice biscuits"]\\n\\nGeneric ingredients: '},
{'role': 'assistant',
'content': '["brown sugar", "milk", "vanilla", "nuts", "butter", "bite size shredded rice biscuits"]'}]`
```
During the training process this conversation will be split, with the final entry being the `completion` that the model will produce, and the remainder of the `messages` acting as the prompt. Consider this when building your training examples - if your model will act on multi-turn conversations, then please provide representative examples so it doesn’t perform poorly when the conversation starts to expand.
Please note that currently there is a 4096 token limit for each training example. Anything longer than this will be truncated at 4096 tokens.
```
`system\_message = "You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided."
def create\_user\_message(row):
return f"Title: {row['title']}\\n\\nIngredients: {row['ingredients']}\\n\\nGeneric ingredients: "
def prepare\_example\_conversation(row):
return {
"messages": [
{"role": "system", "content": system\_message},
{"role": "user", "content": create\_user\_message(row)},
{"role": "assistant", "content": row["NER"]},
]
}
pprint(prepare\_example\_conversation(recipe\_df.iloc[0]))`
```
```
`{'messages': [{'content': 'You are a helpful recipe assistant. You are to '
'extract the generic ingredients from each of the '
'recipes provided.',
'role': 'system'},
{'content': 'Title: No-Bake Nut Cookies\\n'
'\\n'
'Ingredients: ["1 c. firmly packed brown sugar", '
'"1/2 c. evaporated milk", "1/2 tsp. vanilla", "1/2 '
'c. broken nuts (pecans)", "2 Tbsp. butter or '
'margarine", "3 1/2 c. bite size shredded rice '
'biscuits"]\\n'
'\\n'
'Generic ingredients: ',
'role': 'user'},
{'content': '["brown sugar", "milk", "vanilla", "nuts", '
'"butter", "bite size shredded rice biscuits"]',
'role': 'assistant'}]}`
```
Let’s now do this for a subset of the dataset to use as our training data. You can begin with even 30-50 well-pruned examples. You should see performance continue to scale linearly as you increase the size of the training set, but your jobs will also take longer.
```
`# use the first 100 rows of the dataset for training
training\_df = recipe\_df.loc[0:100]
# apply the prepare\_example\_conversation function to each row of the training\_df
training\_data = training\_df.apply(prepare\_example\_conversation, axis=1).tolist()
for example in training\_data[:5]:
print(example)`
```
```
`{'messages': [{'role': 'system', 'content': 'You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided.'}, {'role': 'user', 'content': 'Title: No-Bake Nut Cookies\\n\\nIngredients: ["1 c. firmly packed brown sugar", "1/2 c. evaporated milk", "1/2 tsp. vanilla", "1/2 c. broken nuts (pecans)", "2 Tbsp. butter or margarine", "3 1/2 c. bite size shredded rice biscuits"]\\n\\nGeneric ingredients: '}, {'role': 'assistant', 'content': '["brown sugar", "milk", "vanilla", "nuts", "butter", "bite size shredded rice biscuits"]'}]}
{'messages': [{'role': 'system', 'content': 'You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided.'}, {'role': 'user', 'content': 'Title: Jewell Ball\\'S Chicken\\n\\nIngredients: ["1 small jar chipped beef, cut up", "4 boned chicken breasts", "1 can cream of mushroom soup", "1 carton sour cream"]\\n\\nGeneric ingredients: '}, {'role': 'assistant', 'content': '["beef", "chicken breasts", "cream of mushroom soup", "sour cream"]'}]}
{'messages': [{'role': 'system', 'content': 'You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided.'}, {'role': 'user', 'content': 'Title: Creamy Corn\\n\\nIngredients: ["2 (16 oz.) pkg. frozen corn", "1 (8 oz.) pkg. cream cheese, cubed", "1/3 c. butter, cubed", "1/2 tsp. garlic powder", "1/2 tsp. salt", "1/4 tsp. pepper"]\\n\\nGeneric ingredients: '}, {'role': 'assistant', 'content': '["frozen corn", "cream cheese", "butter", "garlic powder", "salt", "pepper"]'}]}
{'messages': [{'role': 'system', 'content': 'You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided.'}, {'role': 'user', 'content': 'Title: Chicken Funny\\n\\nIngredients: ["1 large whole chicken", "2 (10 1/2 oz.) cans chicken gravy", "1 (10 1/2 oz.) can cream of mushroom soup", "1 (6 oz.) box Stove Top stuffing", "4 oz. shredded cheese"]\\n\\nGeneric ingredients: '}, {'role': 'assistant', 'content': '["chicken", "chicken gravy", "cream of mushroom soup", "shredded cheese"]'}]}
{'messages': [{'role': 'system', 'content': 'You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided.'}, {'role': 'user', 'content': 'Title: Reeses Cups(Candy) \\n\\nIngredients: ["1 c. peanut butter", "3/4 c. graham cracker crumbs", "1 c. melted butter", "1 lb. (3 1/2 c.) powdered sugar", "1 large pkg. chocolate chips"]\\n\\nGeneric ingredients: '}, {'role': 'assistant', 'content': '["peanut butter", "graham cracker crumbs", "butter", "powdered sugar", "chocolate chips"]'}]}`
```
In addition to training data, we can also **optionally** provide validation data, which will be used to make sure that the model does not overfit your training set.
```
`validation\_df = recipe\_df.loc[101:200]
validation\_data = validation\_df.apply(
prepare\_example\_conversation, axis=1).tolist()`
```
We then need to save our data as `.jsonl` files, with each line being one training example conversation.
```
`def write\_jsonl(data\_list: list, filename: str) -\> None:
with open(filename, "w") as out:
for ddict in data\_list:
jout = json.dumps(ddict) + "\\n"
out.write(jout)`
```
```
`training\_file\_name = "tmp\_recipe\_finetune\_training.jsonl"
write\_jsonl(training\_data, training\_file\_name)
validation\_file\_name = "tmp\_recipe\_finetune\_validation.jsonl"
write\_jsonl(validation\_data, validation\_file\_name)`
```
This is what the first 5 lines of our training `.jsonl` file look like:
```
`# print the first 5 lines of the training file
!head -n 5 tmp\_recipe\_finetune\_training.jsonl`
```
```
`{"messages": [{"role": "system", "content": "You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided."}, {"role": "user", "content": "Title: No-Bake Nut Cookies\\n\\nIngredients: [\\"1 c. firmly packed brown sugar\\", \\"1/2 c. evaporated milk\\", \\"1/2 tsp. vanilla\\", \\"1/2 c. broken nuts (pecans)\\", \\"2 Tbsp. butter or margarine\\", \\"3 1/2 c. bite size shredded rice biscuits\\"]\\n\\nGeneric ingredients: "}, {"role": "assistant", "content": "[\\"brown sugar\\", \\"milk\\", \\"vanilla\\", \\"nuts\\", \\"butter\\", \\"bite size shredded rice biscuits\\"]"}]}
{"messages": [{"role": "system", "content": "You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided."}, {"role": "user", "content": "Title: Jewell Ball'S Chicken\\n\\nIngredients: [\\"1 small jar chipped beef, cut up\\", \\"4 boned chicken breasts\\", \\"1 can cream of mushroom soup\\", \\"1 carton sour cream\\"]\\n\\nGeneric ingredients: "}, {"role": "assistant", "content": "[\\"beef\\", \\"chicken breasts\\", \\"cream of mushroom soup\\", \\"sour cream\\"]"}]}
{"messages": [{"role": "system", "content": "You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided."}, {"role": "user", "content": "Title: Creamy Corn\\n\\nIngredients: [\\"2 (16 oz.) pkg. frozen corn\\", \\"1 (8 oz.) pkg. cream cheese, cubed\\", \\"1/3 c. butter, cubed\\", \\"1/2 tsp. garlic powder\\", \\"1/2 tsp. salt\\", \\"1/4 tsp. pepper\\"]\\n\\nGeneric ingredients: "}, {"role": "assistant", "content": "[\\"frozen corn\\", \\"cream cheese\\", \\"butter\\", \\"garlic powder\\", \\"salt\\", \\"pepper\\"]"}]}
{"messages": [{"role": "system", "content": "You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided."}, {"role": "user", "content": "Title: Chicken Funny\\n\\nIngredients: [\\"1 large whole chicken\\", \\"2 (10 1/2 oz.) cans chicken gravy\\", \\"1 (10 1/2 oz.) can cream of mushroom soup\\", \\"1 (6 oz.) box Stove Top stuffing\\", \\"4 oz. shredded cheese\\"]\\n\\nGeneric ingredients: "}, {"role": "assistant", "content": "[\\"chicken\\", \\"chicken gravy\\", \\"cream of mushroom soup\\", \\"shredded cheese\\"]"}]}
{"messages": [{"role": "system", "content": "You are a helpful recipe assistant. You are to extract the generic ingredients from each of the recipes provided."}, {"role": "user", "content": "Title: Reeses Cups(Candy) \\n\\nIngredients: [\\"1 c. peanut butter\\", \\"3/4 c. graham cracker crumbs\\", \\"1 c. melted butter\\", \\"1 lb. (3 1/2 c.) powdered sugar\\", \\"1 large pkg. chocolate chips\\"]\\n\\nGeneric ingredients: "}, {"role": "assistant", "content": "[\\"peanut butter\\", \\"graham cracker crumbs\\", \\"butter\\", \\"powdered sugar\\", \\"chocolate chips\\"]"}]}`
```
### Upload files
You can now upload the files to our `Files` endpoint to be used by the fine-tuned model.
```
`def upload\_file(file\_name: str, purpose: str) -\> str:
with open(file\_name, "rb") as file\_fd:
response = client.files.create(file=file\_fd, purpose=purpose)
return response.id
training\_file\_id = upload\_file(training\_file\_name, "fine-tune")
validation\_file\_id = upload\_file(validation\_file\_name, "fine-tune")
print("Training file ID:", training\_file\_id)
print("Validation file ID:", validation\_file\_id)`
```
```
`Training file ID: file-3wfAfDoYcGrSpaE17qK0vXT0
Validation file ID: file-HhFhnyGJhazYdPcd3wrtvIoX`
```
## Fine-tuning
Now we can create our fine-tuning job with the generated files and an optional suffix to identify the model. The response will contain an `id` which you can use to retrieve updates on the job.
Note: The files have to first be processed by our system, so you might get a `File not ready` error. In that case, simply retry a few minutes later.
```
`MODEL = "gpt-4o-mini-2024-07-18"
response = client.fine\_tuning.jobs.create(
training\_file=training\_file\_id,
validation\_file=validation\_file\_id,
model=MODEL,
suffix="recipe-ner",
)
job\_id = response.id
print("Job ID:", response.id)
print("Status:", response.status)`
```
```
`Job ID: ftjob-UiaiLwGdGBfdLQDBAoQheufN
Status: validating\_files`
```
#### Check job status
You can make a `GET` request to the `https://api.openai.com/v1/alpha/fine-tunes` endpoint to list your alpha fine-tune jobs. In this instance you’ll want to check that the ID you got from the previous step ends up as `status: succeeded`.
Once it is completed, you can use the `result\_files` to sample the results from the validation set (if you uploaded one), and use the ID from the `fine\_tuned\_model` parameter to invoke your trained model.
```
`response = client.fine\_tuning.jobs.retrieve(job\_id)
print("Job ID:", response.id)
print("Status:", response.status)
print("Trained Tokens:", response.trained\_tokens)`
```
```
`Job ID: ftjob-UiaiLwGdGBfdLQDBAoQheufN
Status: running
Trained Tokens: None`
```
We can track the progress of the fine-tune with the events endpoint. You can rerun the cell below a few times until the fine-tune is ready.
```
`response = client.fine\_tuning.jobs.list\_events(job\_id)
events = response.data
events.reverse()
for event in events:
print(event.message)`
```
```
`Step 288/303: training loss=0.00
Step 289/303: training loss=0.01
Step 290/303: training loss=0.00, validation loss=0.31
Step 291/303: training loss=0.00
Step 292/303: training loss=0.00
Step 293/303: training loss=0.00
Step 294/303: training loss=0.00
Step 295/303: training loss=0.00
Step 296/303: training loss=0.00
Step 297/303: training loss=0.00
Step 298/303: training loss=0.01
Step 299/303: training loss=0.00
Step 300/303: training loss=0.00, validation loss=0.04
Step 301/303: training loss=0.16
Step 302/303: training loss=0.00
Step 303/303: training loss=0.00, full validation loss=0.33
Checkpoint created at step 101 with Snapshot ID: ft:gpt-4o-mini-2024-07-18:openai-gtm:recipe-ner:9o1eNlSa:ckpt-step-101
Checkpoint created at step 202 with Snapshot ID: ft:gpt-4o-mini-2024-07-18:openai-gtm:recipe-ner:9o1eNFnj:ckpt-step-202
New fine-tuned model created: ft:gpt-4o-mini-2024-07-18:openai-gtm:recipe-ner:9o1eNNKO
The job has successfully completed`
```
Now that it’s done, we can get a fine-tuned model ID from the job:
```
`response = client.fine\_tuning.jobs.retrieve(job\_id)
fine\_tuned\_model\_id = response.fine\_tuned\_model
if fine\_tuned\_model\_id is None:
raise RuntimeError(
"Fine-tuned model ID not found. Your job has likely not been completed yet."
)
print("Fine-tuned model ID:", fine\_tuned\_model\_id)`
```
```
`Fine-tuned model ID: ft:gpt-4o-mini-2024-07-18:openai-gtm:recipe-ner:9o1eNNKO`
```
## Inference
The last step is to use your fine-tuned model for inference. Similar to the classic `FineTuning`, you simply call `ChatCompletions` with your new fine-tuned model name filling the `model` parameter.
```
`test\_df = recipe\_df.loc[201:300]
test\_row = test\_df.iloc[0]
test\_messages = []
test\_messages.append({"role": "system", "content": system\_message})
user\_message = create\_user\_message(test\_row)
test\_messages.append({"role": "user", "content": user\_message})
pprint(test\_messages)`
```
```
`[{'content': 'You are a helpful recipe assistant. You are to extract the '
'generic ingredients from each of the recipes provided.',
'role': 'system'},
{'content': 'Title: Beef Brisket\\n'
'\\n'
'Ingredients: ["4 lb. beef brisket", "1 c. catsup", "1 c. water", '
'"1/2 onion, minced", "2 Tbsp. cider vinegar", "1 Tbsp. prepared '
'horseradish", "1 Tbsp. prepared mustard", "1 tsp. salt", "1/2 '
'tsp. pepper"]\\n'
'\\n'
'Generic ingredients: ',
'role': 'user'}]`
```
```
`response = client.chat.completions.create(
model=fine\_tuned\_model\_id, messages=test\_messages, temperature=0, max\_tokens=500
)
print(response.choices[0].message.content)`
```
```
`["beef brisket", "catsup", "water", "onion", "cider vinegar", "horseradish", "mustard", "salt", "pepper"]`
```
## Conclusion
Congratulations, you are now ready to fine-tune your own models using the `ChatCompletion` format! We look forward to seeing what you build