Image Understanding with RAG
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
May 16, 2025
# Image Understanding with RAG
[ RT ](https://www.linkedin.com/in/robert-tinn/)
[ Robert Tinn ](https://www.linkedin.com/in/robert-tinn/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/multimodal/image_understanding_with_rag.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/multimodal/image_understanding_with_rag.ipynb)
Welcome! This notebook demonstrates how to build a Retrieval-Augmented Generation (RAG) system using OpenAI’s Vision and Responses APIs. It focuses on multimodal data, combining image and text inputs to analyze customer experiences. The system leverages GPT-5 and integrates image understanding with file search to provide context-aware responses.
Multimodal datasets are increasingly common, particularly in domains like healthcare, where records often contain both visual data (e.g. radiology scans) and accompanying text (e.g. clinical notes). Real-world datasets also tend to be noisy, with incomplete or missing information, making it critical to analyze multiple modalities in tandem.
This guide focuses on a customer service use case: evaluating customer feedback that may include photos, and written reviews. You’ll learn how to synthetically generate both image and text inputs, use file search for context retrieval, and apply the Evals API to assess how incorporating image understanding impacts overall performance.
## Overview
1. [Setup & Dependencies](#setup-and-dependencies)
2. [Example Generations](#example-generations)
3. [Data Processing](#data-processing)
* Load synthetic datasets
* Merge data
* [Populating Vector Store](#populating-vector-store)
* Upload data for file search
* Set up attribute filters
* [Retrieval and Filtering](#retrieval-and-filtering)
* Test retrieval performance
* Apply attribute-based filters
* [Evaluation and Analysis](#evaluation-and-analysis)
* Compare predictions to ground truth
* Analyze performance metrics
## Setup and Dependencies
```
`%pip install openai evals pandas numpy matplotlib tqdm ipython --upgrade --quiet`
```
```
`import base64
from io import BytesIO
import os
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from openai import OpenAI
from IPython.display import display, Image
from tqdm.notebook import tqdm
cache\_dir = Path('.local\_cache')
cache\_dir.mkdir(parents=True, exist\_ok=True)
client = OpenAI()`
```
## Example Generations
Generating high-quality training and evaluation data for machine learning tasks can be costly and time-consuming. Synthetic data offers a practical and scalable alternative. In this notebook, the OpenAI Image API is used to generate synthetic images, while the Responses API is employed to create synthetic text, enabling efficient prototyping and experimentation across multimodal tasks.
```
`
prompt = ("Gourmet pasta neatly plated with garnish and sides on a white ceramic plate, "
"photographed from above on a restaurant table. Soft shadows and vibrant colors.")
cache\_path = f".local\_cache/{hash(prompt)}.png"
if not os.path.exists(cache\_path):
response = client.images.generate(
model="gpt-image-1",
prompt=prompt,
size="1024x1024"
)
with open(cache\_path, "wb") as f:
f.write(base64.b64decode(response.data[0].b64\_json))
print(f"Generated and cached: {cache\_path}")
else:
print(f"Loading from cache: {cache\_path}")
display(Image(filename=cache\_path))`
```
```
`def generate\_food\_delivery\_review(sentiment: str = 'positive') -\> str:
"""
Generate a synthetic food delivery review with the specified sentiment.
Args:
sentiment: An adjective such as 'positive' or 'negative'.
Returns:
Generated review text
"""
prompt = "Write a very concise, realistic customer review for a recent food delivery."
prompt += f" The review should reflect a {sentiment} experience."
response = client.responses.create(
model="gpt-5",
reasoning={"effort": "minimal"},
input=[{"role": "user", "content": prompt}]
)
return response.output\_text
review = generate\_food\_delivery\_review()
print(review)`
```
```
`Order arrived 10 minutes early, food was hot and packaged securely. Tacos were fresh, well-seasoned, and the salsa tasted homemade. Driver was friendly, followed instructions, and left it at the door. Will definitely order again.`
```
## Data Processing
In this example, we’ll work with a pre-generated synthetic dataset of customer feedback that includes short text snippets, images from customer reviews, and occasionally combined multimodal entries. You can also generate your own synthetic dataset using the examples provided above to tailor the data to your specific use case.
```
`# Download the dataset
! mkdir -p .local\_cache/images
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/df.csv -O .local\_cache/df.csv
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/images/1.png -O .local\_cache/images/1.png
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/images/2.png -O .local\_cache/images/2.png
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/images/3.png -O .local\_cache/images/3.png
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/images/4.png -O .local\_cache/images/4.png
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/images/5.png -O .local\_cache/images/5.png
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/images/6.png -O .local\_cache/images/6.png
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/data/images/7.png -O .local\_cache/images/7.png`
```
```
`def encode\_image(image\_path: str) -\> str:
"""Encode image file to base64 string."""
with open(image\_path, "rb") as f:
return base64.b64encode(f.read()).decode("utf-8")
def analyze\_image\_sentiment(image\_path: str) -\> str:
"""Analyze food delivery image and return sentiment analysis."""
base64\_image = encode\_image(image\_path)
response = client.responses.create(
model="gpt-5",
reasoning={"effort": "minimal"},
input=[{
"role": "user",
"content": [
{
"type": "input\_text",
"text": "Analyze this food delivery image. Respond with a brief description and sentiment (positive/negative) in one line."
},
{
"type": "input\_image",
"image\_url": f"data:image/jpeg;base64,{base64\_image}",
},
],
}],
)
return response.output\_text.strip()`
```
```
`df = pd.read\_csv(".local\_cache/df.csv")
cache\_dir = Path(".local\_cache")
for idx, row in df[\~df['image\_path'].isna()].iterrows():
image\_path = cache\_dir / 'images' / row['image\_path']
sentiment = analyze\_image\_sentiment(str(image\_path))
df.at[idx, 'full\_sentiment'] = f"{row['text']} {sentiment}" if pd.notna(row['text']) else sentiment
print(f"Processed {row['image\_path']}")
df['full\_sentiment'] = df['full\_sentiment'].fillna(df['text'])
output\_path = cache\_dir / "df\_full\_sentiment.csv"
df.to\_csv(output\_path, index=False)
print(f"\\nSaved results to {output\_path}")`
```
```
`pd.set\_option('display.max\_colwidth', 100) # Increase from default (50) to view full sentiment
display(df.head())`
```
||id|month|text|image\_path|label|full\_sentiment|
|0|1|june|Absolutely delicious! The sushi was fresh, beautifully packed, and arrived right on time. Will d...|NaN|positive|Absolutely delicious! The sushi was fresh, beautifully packed, and arrived right on time. Will d...|
|1|2|july|Half my order was missing and the burger looked thrown together. Not worth the money.|NaN|negative|Half my order was missing and the burger looked thrown together. Not worth the money.|
|2|3|july|Packaging was leaking sauce everywhere. Presentation was a mess. Tasted like leftovers.|NaN|negative|Packaging was leaking sauce everywhere. Presentation was a mess. Tasted like leftovers.|
|3|4|july|Burger was hot, fries were still crispy, and the milkshake wasn’t melted at all. Fantastic deliv...|3.png|positive|Burger was hot, fries were still crispy, and the milkshake wasn’t melted at all. Fantastic deliv...|
|4|5|june|Received the wrong items. I ordered vegetarian and got meat. Totally unacceptable.|NaN|negative|Received the wrong items. I ordered vegetarian and got meat. Totally unacceptable.|
## Populating Vector Store
This example uses OpenAI’s built-in vector store and file search capabilities to build a RAG system that can analyse customer experiences from their feedback, which can be both visual and text-based. We create two vector stores for comparisons, one with image understanding and one without.
```
`text\_vector\_store = client.vector\_stores.create(
name="food\_delivery\_reviews\_text",
metadata={
"purpose": "text\_understanding",
"created\_by": "notebook",
"version": "1.0"
}
)
text\_vector\_store\_id = text\_vector\_store.id
text\_image\_vector\_store = client.vector\_stores.create(
name="food\_delivery\_reviews\_text\_image",
metadata={
"purpose": "text\_image\_understanding",
"created\_by": "notebook",
"version": "1.0"
}
)
text\_image\_vector\_store\_id = text\_image\_vector\_store.id
print("Vector Store IDs:")
print(f" Text: {text\_vector\_store\_id}")
print(f" Text+Image: {text\_image\_vector\_store\_id}")`
```
```
`# upload files to vector database and set metadata
def upload\_files\_to\_vector\_store(vector\_store\_id, df, column\_name="full\_sentiment"):
file\_ids = []
for i, row in tqdm(df.iterrows(), total=len(df), desc="Uploading context files"):
if pd.isna(row[column\_name]):
file\_stream = BytesIO('No information available.'.encode('utf-8'))
else:
file\_stream = BytesIO(row[column\_name].encode('utf-8'))
file\_stream.name = f"context\_{row.get('id', i)}\_{row.get('month', '')}.txt"
file = client.vector\_stores.files.upload(
vector\_store\_id=vector\_store\_id,
file=file\_stream
)
file\_ids.append(file.id)
for i, row in tqdm(df.iterrows(), total=len(df), desc="Updating file attributes"):
client.vector\_stores.files.update(
vector\_store\_id=vector\_store\_id,
file\_id=file\_ids[i],
attributes={"month": row["month"]}
)`
```
```
`upload\_files\_to\_vector\_store(text\_image\_vector\_store\_id, df)
upload\_files\_to\_vector\_store(text\_vector\_store\_id, df, column\_name="text")`
```
# Retrieval and Filtering
We can analyse our dataset with natural language queries with the help of File Search. For the text-only dataset, we see that information is missing that could inform our analysis.
The only positive review for spaghetti in July has visual feedback and we can see the RAG system with only text based context available is uncertain about positive details. However with image context provided the second RAG system is able to provide a more accurate response.
```
`# Query the vector store for spaghetti reviews in July
query = "Where there any comments about the 'spaghetti'?"
print(f"🔍 Query: {query}\\n")
# Execute the search with filtering
response = client.responses.create(
model="gpt-5",
input=query,
tools=[{
"type": "file\_search",
"vector\_store\_ids": [text\_vector\_store\_id],
"filters": {
"type": "eq",
"key": "month",
"value": "july"
}
}]
)
# Display the results
print("📝 Response:")
print("-" \* 40)
print(response.output\_text)`
```
```
`🔍 Query: Where there any comments about the 'spaghetti'?
📝 Response:
----------------------------------------
I couldn’t find any comments that explicitly mention “spaghetti.” The closest related note says “Pasta was overcooked” in context\_9\_july.txt . If you have a specific date or file in mind, I can check that directly.`
```
```
`query = "Where there any comments about the 'spaghetti'?"
print(f"🔍 Query: {query}\\n")
response = client.responses.create(
model="gpt-5",
input=query,
tools=[{
"type": "file\_search",
"vector\_store\_ids": [text\_image\_vector\_store\_id],
"filters": {
"type": "eq",
"key": "month",
"value": "july"
}
}]
)
print("📝 Response:")
print("-" \* 40)
print(response.output\_text)`
```
```
`🔍 Query: Where there any comments about the 'spaghetti'?
📝 Response:
----------------------------------------
Yes. There’s a positive note describing “a neatly plated spaghetti in tomato sauce with parsley, served alongside arugula, garlic bread, and grated cheese.”`
```
We can confirm if this is correct by checking the retrieved images.
```
`IMAGE\_ID\_MAPPING = {
f"context\_{row['id']}\_{row['month']}.txt": row["image\_path"]
for \_, row in df[\~df['image\_path'].isna()].iterrows()
}
def display\_retrieved\_images(
response,
cache\_dir: str = ".local\_cache"
):
"""
Display images from the retrieved search results.
Args:
response: The response object from the search query
cache\_dir: Directory where images are stored
Returns:
Dict mapping filenames to image paths for the displayed images
"""
# Get the annotations from the response
try:
annotations = response.output[3].content[0].annotations
retrieved\_files = {result.filename for result in annotations}
except (AttributeError, IndexError):
print("No search results found in the response.")
return {}
# Display matching images
displayed\_images = {}
for file in retrieved\_files:
if file in IMAGE\_ID\_MAPPING and IMAGE\_ID\_MAPPING[file]:
image\_path = Path(cache\_dir) / 'images' / IMAGE\_ID\_MAPPING[file]
print(f"Displaying image for {file}:")
display(Image(str(image\_path)))
displayed\_images[file] = str(image\_path)
return displayed\_images
displayed = display\_retrieved\_images(response)
print(f"Displayed {len(displayed)} images")`
```
Likewise we can test this for negative reviews in June concerning any burnt pizza.
```
`query = "Were there any negative reviews for pizza, and if so, was the pizza burnt?"
print(f"🔍 Query: {query}\\n")
response = client.responses.create(
model="gpt-5",
input=query,
tools=[{
"type": "file\_search",
"vector\_store\_ids": [text\_image\_vector\_store\_id],
"filters": {
"type": "eq",
"key": "month",
"value": "june"
}
}]
)
print("📝 Response:")
print("-" \* 40)
print(response.output\_text)`
```
```
`🔍 Query: Were there any negative reviews for pizza, and if so, was the pizza burnt?
📝 Response:
----------------------------------------
Yes. One review explicitly describes a “burnt pepperoni pizza with charred crust and grease stains in the box” and is marked as negative sentiment .`
```
We can confirm if this is correct by checking the retrieved images.
```
`displayed = display\_retrieved\_images(response)
print(f"Displayed {len(displayed)} images")`
```
## Evaluation and Analysis
As our dataset likely evolves over time and we want to evaluate new models, we can use the OpenAI Evaluation API to evaluate the performance of our system for sentiment analysis. In this simple example, using the string\_check criteria we checked if the output was one of the three possible values: positive, negative, or unclear.
```
`def prepare\_evaluation\_data(
df: pd.DataFrame,
text\_col: str = "full\_sentiment",
label\_col: str = "label"
) -\> list:
"""
Prepare evaluation data items from a DataFrame.
Args:
df: Input pandas DataFrame.
text\_col: Column containing the input text.
label\_col: Column containing the ground truth label.
Returns:
List of dicts formatted for evaluation.
"""
return [
{"item": {"input": str(row[text\_col]), "ground\_truth": row[label\_col]}}
for \_, row in df.iterrows()
]
def create\_eval\_run(evaluation\_data: list, eval\_id: str) -\> str:
"""
Create and launch an evaluation run.
Args:
evaluation\_data: List of evaluation items.
eval\_id: The evaluation object ID.
Returns:
The run ID as a string.
"""
eval\_config = {
"type": "completions",
"model": "gpt-5",
"input\_messages": {
"type": "template",
"template": [
{
"type": "message",
"role": "user",
"content": {
"type": "input\_text",
"text": (
"Classify the sentiment of this food delivery review: {{ item.input }}. "
"Categorize the request into one of \\"positive\\", \\"negative\\" or \\"unclear\\". "
"Respond with only one of those words."
)
}
}
]
},
"source": {
"type": "file\_content",
"content": evaluation\_data
}
}
run = client.evals.runs.create(
eval\_id=eval\_id,
data\_source=eval\_config
)
print("✅ Evaluation run created successfully")
print(f"Run ID: {run.id}")
return run.id`
```
```
`eval\_obj = client.evals.create(
name="food-categorization-eval",
data\_source\_config={
"type": "custom",
"item\_schema": {
"type": "object",
"properties": {
"input": {"type": "string"},
"ground\_truth": {"type": "string"}
},
"required": ["input", "ground\_truth"]
},
"include\_sample\_schema": True
},
testing\_criteria=[
{
"type": "string\_check",
"name": "Match output to human label",
"input": "{{sample.output\_text}}",
"reference": "{{item.ground\_truth}}",
"operation": "eq"
}
]
)
eval\_id = eval\_obj.id
eval\_id`
```
```
`# create evaluation runs
evaluation\_data = prepare\_evaluation\_data(df, text\_col="text")
text\_only\_run\_id = create\_eval\_run(evaluation\_data, eval\_id)
evaluation\_data = prepare\_evaluation\_data(df)
text\_image\_run\_id = create\_eval\_run(evaluation\_data, eval\_id)
# retrieve both run urls
text\_only\_run = client.evals.runs.retrieve(eval\_id=eval\_id, run\_id=text\_only\_run\_id)
print(text\_only\_run.to\_dict()['report\_url'])
text\_image\_run = client.evals.runs.retrieve(eval\_id=eval\_obj.id, run\_id=text\_image\_run\_id)
print(text\_image\_run.to\_dict()['report\_url'])`
```
```
`# you may need to wait a few seconds before running this cell for the eval runs to finish up
text\_only\_run\_output\_items = client.evals.runs.output\_items.list(eval\_id=eval\_id, run\_id=text\_only\_run\_id)
text\_image\_run\_output\_items = client.evals.runs.output\_items.list(eval\_id=eval\_id, run\_id=text\_image\_run\_id)`
```
We can retrieve the results of these evaluation runs and perform some local analysis. In this case, we will compare the performance of the text-only and text+image runs and evaluate how increasing the number of total tokens (through the addition of image context) affects the accuracy of the model. We can also do some basic error analysis by analysing the model input of the failed examples.
```
`# Calculate passed and total for text\_only\_run
text\_only\_data = text\_only\_run\_output\_items.to\_dict()['data']
text\_only\_passed = sum(1 for output\_item in text\_only\_data if output\_item['results'][0]['passed'])
text\_only\_total = len(text\_only\_data)
# Calculate passed and total for text\_image\_run
text\_image\_data = text\_image\_run\_output\_items.to\_dict()['data']
text\_image\_passed = sum(1 for output\_item in text\_image\_data if output\_item['results'][0]['passed'])
text\_image\_total = len(text\_image\_data)
# Calculate average total\_tokens for each run
def avg\_total\_tokens(data):
tokens = [item['sample']['usage']['total\_tokens'] for item in data if 'usage' in item['sample']]
return sum(tokens) / len(tokens) if tokens else 0
text\_only\_avg\_tokens = avg\_total\_tokens(text\_only\_data)
text\_image\_avg\_tokens = avg\_total\_tokens(text\_image\_data)
# Plotting
labels = ['Text Only', 'Text + Image']
passed = [text\_only\_passed, text\_image\_passed]
avg\_tokens = [text\_only\_avg\_tokens, text\_image\_avg\_tokens]
x = np.arange(len(labels))
width = 0.35
fig, ax1 = plt.subplots()
# Bar for passed only
bars1 = ax1.bar(x - width/2, passed, width, label='Passed', color='green')
ax1.set\_ylabel('Accuracy')
ax1.set\_xticks(x)
ax1.set\_xticklabels(labels)
ax1.set\_title('Accuracy and Avg Total Tokens')
ax1.legend(loc='upper left')
# Second y-axis for avg total tokens
ax2 = ax1.twinx()
bars2 = ax2.bar(x + width/2, avg\_tokens, width, label='Avg Total Tokens', color='blue', alpha=0.5)
ax2.set\_ylabel('Avg Total Tokens')
ax2.legend(loc='upper right')
plt.show()`
```
```
`failed\_samples = [
{
"Input": sample['sample']['input'],
"Model Output": sample['sample']['output']
}
for sample in text\_only\_run\_output\_items.to\_dict()['data']
if not sample['results'][0]['passed']
]
pd.set\_option('display.max\_colwidth', 150) # Adjust as needed
failed\_df = pd.DataFrame(failed\_samples)
display(failed\_df.style.set\_properties(\*\*{'text-align': 'left'}))`
```
| |Input|Model Output|
|0|[{'content': 'Classify the sentiment of this food delivery review: The food came looking like this... Categorize the request into one of "positive", "negative" or "unclear". Respond with only one of those words.', 'role': 'user'}]|[{'content': 'negative', 'role': 'assistant'}]|
|1|[{'content': 'Classify the sentiment of this food delivery review: nan. Categorize the request into one of "positive", "negative" or "unclear". Respond with only one of those words.', 'role': 'user'}]|[{'content': 'unclear', 'role': 'assistant'}]|
|2|[{'content': 'Classify the sentiment of this food delivery review: nan. Categorize the request into one of "positive", "negative" or "unclear". Respond with only one of those words.', 'role': 'user'}]|[{'content': 'unclear', 'role': 'assistant'}]|
|3|[{'content': 'Classify the sentiment of this food delivery review: nan. Categorize the request into one of "positive", "negative" or "unclear". Respond with only one of those words.', 'role': 'user'}]|[{'content': 'unclear', 'role': 'assistant'}]|
|4|[{'content': 'Classify the sentiment of this food delivery review: Wow look at this pizza!. Categorize the request into one of "positive", "negative" or "unclear". Respond with only one of those words.', 'role': 'user'}]|[{'content': 'positive', 'role': 'assistant'}]|
Finally, let’s clean up some of the resources we created.
```
`# delete vector stores
deleted\_vector\_store = client.vector\_stores.delete(
vector\_store\_id=text\_vector\_store\_id
)
print(deleted\_vector\_store)
deleted\_vector\_store = client.vector\_stores.delete(
vector\_store\_id=text\_image\_vector\_store\_id
)
print(deleted\_vector\_store)`
```