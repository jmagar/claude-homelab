Batch processing with the Batch API
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
Apr 24, 2024
# Batch processing with the Batch API
[ KG ](https://katia.gg)
[ Katia Gil Guzman
(OpenAI)
](https://katia.gg)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/batch_processing.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/batch_processing.ipynb)
The new Batch API allows to **create async batch jobs for a lower price and with higher rate limits**.
Batches will be completed within 24h, but may be processed sooner depending on global usage.
Ideal use cases for the Batch API include:
* Tagging, captioning, or enriching content on a marketplace or blog
* Categorizing and suggesting answers for support tickets
* Performing sentiment analysis on large datasets of customer feedback
* Generating summaries or translations for collections of documents or articles
and much more!
This cookbook will walk you through how to use the Batch API with a couple of practical examples.
We will start with an example to categorize movies using `gpt-4o-mini`, and then cover how we can use the vision capabilities of this model to caption images.
Please note that multiple models are available through the Batch API, and that you can use the same parameters in your Batch API calls as with the Chat Completions endpoint.
## Setup
```
`# Make sure you have the latest version of the SDK available to use the Batch API
%pip install openai --upgrade`
```
```
`import json
from openai import OpenAI
import pandas as pd
from IPython.display import Image, display`
```
```
`# Initializing OpenAI client - see https://platform.openai.com/docs/quickstart?context=python
client = OpenAI()`
```
## First example: Categorizing movies
In this example, we will use `gpt-4o-mini` to extract movie categories from a description of the movie. We will also extract a 1-sentence summary from this description.
We will use [JSON mode](https://platform.openai.com/docs/guides/text-generation/json-mode) to extract categories as an array of strings and the 1-sentence summary in a structured format.
For each movie, we want to get a result that looks like this:
```
`{
categories: ['category1', 'category2', 'category3'],
summary: '1-sentence summary'
}`
```
### Loading data
We will use the IMDB top 1000 movies dataset for this example.
```
`dataset\_path = "data/imdb\_top\_1000.csv"
df = pd.read\_csv(dataset\_path)
df.head()`
```
||Poster\_Link|Series\_Title|Released\_Year|Certificate|Runtime|Genre|IMDB\_Rating|Overview|Meta\_score|Director|Star1|Star2|Star3|Star4|No\_of\_Votes|Gross|
|0|https://m.media-amazon.com/images/M/MV5BMDFkYT...|The Shawshank Redemption|1994|A|142 min|Drama|9.3|Two imprisoned men bond over a number of years...|80.0|Frank Darabont|Tim Robbins|Morgan Freeman|Bob Gunton|William Sadler|2343110|28,341,469|
|1|https://m.media-amazon.com/images/M/MV5BM2MyNj...|The Godfather|1972|A|175 min|Crime, Drama|9.2|An organized crime dynasty's aging patriarch t...|100.0|Francis Ford Coppola|Marlon Brando|Al Pacino|James Caan|Diane Keaton|1620367|134,966,411|
|2|https://m.media-amazon.com/images/M/MV5BMTMxNT...|The Dark Knight|2008|UA|152 min|Action, Crime, Drama|9.0|When the menace known as the Joker wreaks havo...|84.0|Christopher Nolan|Christian Bale|Heath Ledger|Aaron Eckhart|Michael Caine|2303232|534,858,444|
|3|https://m.media-amazon.com/images/M/MV5BMWMwMG...|The Godfather: Part II|1974|A|202 min|Crime, Drama|9.0|The early life and career of Vito Corleone in ...|90.0|Francis Ford Coppola|Al Pacino|Robert De Niro|Robert Duvall|Diane Keaton|1129952|57,300,000|
|4|https://m.media-amazon.com/images/M/MV5BMWU4N2...|12 Angry Men|1957|U|96 min|Crime, Drama|9.0|A jury holdout attempts to prevent a miscarria...|96.0|Sidney Lumet|Henry Fonda|Lee J. Cobb|Martin Balsam|John Fiedler|689845|4,360,000|
### Processing step
Here, we will prepare our requests by first trying them out with the Chat Completions endpoint.
Once we’re happy with the results, we can move on to creating the batch file.
```
`categorize\_system\_prompt = '''
Your goal is to extract movie categories from movie descriptions, as well as a 1-sentence summary for these movies.
You will be provided with a movie description, and you will output a json object containing the following information:
{
categories: string[] // Array of categories based on the movie description,
summary: string // 1-sentence summary of the movie based on the movie description
}
Categories refer to the genre or type of the movie, like "action", "romance", "comedy", etc. Keep category names simple and use only lower case letters.
Movies can have several categories, but try to keep it under 3-4. Only mention the categories that are the most obvious based on the description.
'''
def get\_categories(description):
response = client.chat.completions.create(
model="gpt-4o-mini",
temperature=0.1,
# This is to enable JSON mode, making sure responses are valid json objects
response\_format={
"type": "json\_object"
},
messages=[
{
"role": "system",
"content": categorize\_system\_prompt
},
{
"role": "user",
"content": description
}
],
)
return response.choices[0].message.content`
```
```
`# Testing on a few examples
for \_, row in df[:5].iterrows():
description = row['Overview']
title = row['Series\_Title']
result = get\_categories(description)
print(f"TITLE: {title}\\nOVERVIEW: {description}\\n\\nRESULT: {result}")
print("\\n\\n----------------------------\\n\\n")`
```
```
`TITLE: The Shawshank Redemption
OVERVIEW: Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.
RESULT: {
"categories": ["drama"],
"summary": "Two imprisoned men develop a deep bond over the years, ultimately finding redemption through their shared acts of kindness."
}
----------------------------
TITLE: The Godfather
OVERVIEW: An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.
RESULT: {
"categories": ["crime", "drama"],
"summary": "An aging crime lord hands over his empire to his hesitant son."
}
----------------------------
TITLE: The Dark Knight
OVERVIEW: When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.
RESULT: {
"categories": ["action", "thriller", "superhero"],
"summary": "Batman faces a formidable challenge as the Joker unleashes chaos on Gotham City."
}
----------------------------
TITLE: The Godfather: Part II
OVERVIEW: The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.
RESULT: {
"categories": ["crime", "drama"],
"summary": "The film depicts the early life of Vito Corleone and the rise of his son Michael within the family crime syndicate in 1920s New York City."
}
----------------------------
TITLE: 12 Angry Men
OVERVIEW: A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.
RESULT: {
"categories": ["drama", "thriller"],
"summary": "A jury holdout fights to ensure justice is served by challenging his fellow jurors to reevaluate the evidence."
}
----------------------------`
```
### Creating the batch file
The batch file, in the `jsonl` format, should contain one line (json object) per request.
Each request is defined as such:
```
`{
"custom\_id": \<REQUEST\_ID\>,
"method": "POST",
"url": "/v1/chat/completions",
"body": {
"model": \<MODEL\>,
"messages": \<MESSAGES\>,
// other parameters
}
}`
```
Note: the request ID should be unique per batch. This is what you can use to match results to the initial input files, as requests will not be returned in the same order.
```
`# Creating an array of json tasks
tasks = []
for index, row in df.iterrows():
description = row['Overview']
task = {
"custom\_id": f"task-{index}",
"method": "POST",
"url": "/v1/chat/completions",
"body": {
# This is what you would have in your Chat Completions API call
"model": "gpt-4o-mini",
"temperature": 0.1,
"response\_format": {
"type": "json\_object"
},
"messages": [
{
"role": "system",
"content": categorize\_system\_prompt
},
{
"role": "user",
"content": description
}
],
}
}
tasks.append(task)`
```
```
`# Creating the file
file\_name = "data/batch\_tasks\_movies.jsonl"
with open(file\_name, 'w') as file:
for obj in tasks:
file.write(json.dumps(obj) + '\\n')`
```
### Uploading the file
```
`batch\_file = client.files.create(
file=open(file\_name, "rb"),
purpose="batch"
)`
```
```
`print(batch\_file)`
```
```
`FileObject(id='file-lx16f1KyIxQ2UHVvkG3HLfNR', bytes=1127310, created\_at=1721144107, filename='batch\_tasks\_movies.jsonl', object='file', purpose='batch', status='processed', status\_details=None)`
```
### Creating the batch job
```
`batch\_job = client.batches.create(
input\_file\_id=batch\_file.id,
endpoint="/v1/chat/completions",
completion\_window="24h"
)`
```
### Checking batch status
Note: this can take up to 24h, but it will usually be completed faster.
You can continue checking until the status is ‘completed’.
```
`batch\_job = client.batches.retrieve(batch\_job.id)
print(batch\_job)`
```
### Retrieving results
```
`result\_file\_id = batch\_job.output\_file\_id
result = client.files.content(result\_file\_id).content`
```
```
`result\_file\_name = "data/batch\_job\_results\_movies.jsonl"
with open(result\_file\_name, 'wb') as file:
file.write(result)`
```
```
`# Loading data from saved file
results = []
with open(result\_file\_name, 'r') as file:
for line in file:
# Parsing the JSON string into a dict and appending to the list of results
json\_object = json.loads(line.strip())
results.append(json\_object)`
```
### Reading results
Reminder: the results are not in the same order as in the input file.
Make sure to check the custom\_id to match the results against the input requests
```
`# Reading only the first results
for res in results[:5]:
task\_id = res['custom\_id']
# Getting index from task id
index = task\_id.split('-')[-1]
result = res['response']['body']['choices'][0]['message']['content']
movie = df.iloc[int(index)]
description = movie['Overview']
title = movie['Series\_Title']
print(f"TITLE: {title}\\nOVERVIEW: {description}\\n\\nRESULT: {result}")
print("\\n\\n----------------------------\\n\\n")`
```
```
`TITLE: American Psycho
OVERVIEW: A wealthy New York City investment banking executive, Patrick Bateman, hides his alternate psychopathic ego from his co-workers and friends as he delves deeper into his violent, hedonistic fantasies.
RESULT: {
"categories": ["thriller", "psychological", "drama"],
"summary": "A wealthy investment banker in New York City conceals his psychopathic alter ego while indulging in violent and hedonistic fantasies."
}
----------------------------
TITLE: Lethal Weapon
OVERVIEW: Two newly paired cops who are complete opposites must put aside their differences in order to catch a gang of drug smugglers.
RESULT: {
"categories": ["action", "comedy", "crime"],
"summary": "An action-packed comedy about two mismatched cops teaming up to take down a drug smuggling gang."
}
----------------------------
TITLE: A Star Is Born
OVERVIEW: A musician helps a young singer find fame as age and alcoholism send his own career into a downward spiral.
RESULT: {
"categories": ["drama", "music"],
"summary": "A musician's career spirals downward as he helps a young singer find fame amidst struggles with age and alcoholism."
}
----------------------------
TITLE: From Here to Eternity
OVERVIEW: In Hawaii in 1941, a private is cruelly punished for not boxing on his unit's team, while his captain's wife and second-in-command are falling in love.
RESULT: {
"categories": ["drama", "romance", "war"],
"summary": "A drama set in Hawaii in 1941, where a private faces punishment for not boxing on his unit's team, amidst a forbidden love affair between his captain's wife and second-in-command."
}
----------------------------
TITLE: The Jungle Book
OVERVIEW: Bagheera the Panther and Baloo the Bear have a difficult time trying to convince a boy to leave the jungle for human civilization.
RESULT: {
"categories": ["adventure", "animation", "family"],
"summary": "An adventure-filled animated movie about a panther and a bear trying to persuade a boy to leave the jungle for human civilization."
}
----------------------------`
```
## Second example: Captioning images
In this example, we will use `gpt-4-turbo` to caption images of furniture items.
We will use the vision capabilities of the model to analyze the images and generate the captions.
### Loading data
We will use the Amazon furniture dataset for this example.
```
`dataset\_path = "data/amazon\_furniture\_dataset.csv"
df = pd.read\_csv(dataset\_path)
df.head()`
```
||asin|url|title|brand|price|availability|categories|primary\_image|images|upc|...|color|material|style|important\_information|product\_overview|about\_item|description|specifications|uniq\_id|scraped\_at|
|0|B0CJHKVG6P|https://www.amazon.com/dp/B0CJHKVG6P|GOYMFK 1pc Free Standing Shoe Rack, Multi-laye...|GOYMFK|$24.99|Only 13 left in stock - order soon.|['Home & Kitchen', 'Storage & Organization', '...|https://m.media-amazon.com/images/I/416WaLx10j...|['https://m.media-amazon.com/images/I/416WaLx1...|NaN|...|White|Metal|Modern|[]|[{'Brand': ' GOYMFK '}, {'Color': ' White '}, ...|['Multiple layers: Provides ample storage spac...|multiple shoes, coats, hats, and other items E...|['Brand: GOYMFK', 'Color: White', 'Material: M...|02593e81-5c09-5069-8516-b0b29f439ded|2024-02-02 15:15:08|
|1|B0B66QHB23|https://www.amazon.com/dp/B0B66QHB23|subrtex Leather ding Room, Dining Chairs Set o...|subrtex|NaN|NaN|['Home & Kitchen', 'Furniture', 'Dining Room F...|https://m.media-amazon.com/images/I/31SejUEWY7...|['https://m.media-amazon.com/images/I/31SejUEW...|NaN|...|Black|Sponge|Black Rubber Wood|[]|NaN|['【Easy Assembly】: Set of 2 dining room chairs...|subrtex Dining chairs Set of 2|['Brand: subrtex', 'Color: Black', 'Product Di...|5938d217-b8c5-5d3e-b1cf-e28e340f292e|2024-02-02 15:15:09|
|2|B0BXRTWLYK|https://www.amazon.com/dp/B0BXRTWLYK|Plant Repotting Mat MUYETOL Waterproof Transpl...|MUYETOL|$5.98|In Stock|['Patio, Lawn & Garden', 'Outdoor Décor', 'Doo...|https://m.media-amazon.com/images/I/41RgefVq70...|['https://m.media-amazon.com/images/I/41RgefVq...|NaN|...|Green|Polyethylene|Modern|[]|[{'Brand': ' MUYETOL '}, {'Size': ' 26.8\*26.8 ...|['PLANT REPOTTING MAT SIZE: 26.8" x 26.8", squ...|NaN|['Brand: MUYETOL', 'Size: 26.8\*26.8', 'Item We...|b2ede786-3f51-5a45-9a5b-bcf856958cd8|2024-02-02 15:15:09|
|3|B0C1MRB2M8|https://www.amazon.com/dp/B0C1MRB2M8|Pickleball Doormat, Welcome Doormat Absorbent ...|VEWETOL|$13.99|Only 10 left in stock - order soon.|['Patio, Lawn & Garden', 'Outdoor Décor', 'Doo...|https://m.media-amazon.com/images/I/61vz1Igler...|['https://m.media-amazon.com/images/I/61vz1Igl...|NaN|...|A5589|Rubber|Modern|[]|[{'Brand': ' VEWETOL '}, {'Size': ' 16\*24INCH ...|['Specifications: 16x24 Inch ', " High-Quality...|The decorative doormat features a subtle textu...|['Brand: VEWETOL', 'Size: 16\*24INCH', 'Materia...|8fd9377b-cfa6-5f10-835c-6b8eca2816b5|2024-02-02 15:15:10|
|4|B0CG1N9QRC|https://www.amazon.com/dp/B0CG1N9QRC|JOIN IRON Foldable TV Trays for Eating Set of ...|JOIN IRON Store|$89.99|Usually ships within 5 to 6 weeks|['Home & Kitchen', 'Furniture', 'Game & Recrea...|https://m.media-amazon.com/images/I/41p4d4VJnN...|['https://m.media-amazon.com/images/I/41p4d4VJ...|NaN|...|Grey Set of 4|Iron|X Classic Style|[]|NaN|['Includes 4 Folding Tv Tray Tables And one Co...|Set of Four Folding Trays With Matching Storag...|['Brand: JOIN IRON', 'Shape: Rectangular', 'In...|bdc9aa30-9439-50dc-8e89-213ea211d66a|2024-02-02 15:15:11|
5 rows × 25 columns
### Processing step
Again, we will first prepare our requests with the Chat Completions endpoint, and create the batch file afterwards.
```
`caption\_system\_prompt = '''
Your goal is to generate short, descriptive captions for images of items.
You will be provided with an item image and the name of that item and you will output a caption that captures the most important information about the item.
If there are multiple items depicted, refer to the name provided to understand which item you should describe.
Your generated caption should be short (1 sentence), and include only the most important information about the item.
The most important information could be: the type of item, the style (if mentioned), the material or color if especially relevant and/or any distinctive features.
Keep it short and to the point.
'''
def get\_caption(img\_url, title):
response = client.chat.completions.create(
model="gpt-4o-mini",
temperature=0.2,
max\_tokens=300,
messages=[
{
"role": "system",
"content": caption\_system\_prompt
},
{
"role": "user",
"content": [
{
"type": "text",
"text": title
},
# The content type should be "image\_url" to use gpt-4-turbo's vision capabilities
{
"type": "image\_url",
"image\_url": {
"url": img\_url
}
},
],
}
]
)
return response.choices[0].message.content`
```
```
`# Testing on a few images
for \_, row in df[:5].iterrows():
img\_url = row['primary\_image']
caption = get\_caption(img\_url, row['title'])
img = Image(url=img\_url)
display(img)
print(f"CAPTION: {caption}\\n\\n")`
```
```
`CAPTION: A stylish white free-standing shoe rack featuring multiple layers and eight double hooks, perfect for organizing shoes and accessories in living rooms, bathrooms, or hallways.`
```
```
`CAPTION: Set of 2 black leather dining chairs featuring a sleek design with vertical stitching and sturdy wooden legs.`
```
```
`CAPTION: The MUYETOL Plant Repotting Mat is a waterproof, portable, and foldable gardening work mat measuring 26.8" x 26.8", designed for easy soil changing and indoor transplanting.`
```
```
`CAPTION: Absorbent non-slip doormat featuring the phrase "It's a good day to play PICKLEBALL" with paddle graphics, measuring 16x24 inches.`
```
```
`CAPTION: Set of 4 foldable TV trays in grey, featuring a compact design with a stand for easy storage, perfect for small spaces.`
```
### Creating the batch job
As with the first example, we will create an array of json tasks to generate a `jsonl` file and use it to create the batch job.
```
`# Creating an array of json tasks
tasks = []
for index, row in df.iterrows():
title = row['title']
img\_url = row['primary\_image']
task = {
"custom\_id": f"task-{index}",
"method": "POST",
"url": "/v1/chat/completions",
"body": {
# This is what you would have in your Chat Completions API call
"model": "gpt-4o-mini",
"temperature": 0.2,
"max\_tokens": 300,
"messages": [
{
"role": "system",
"content": caption\_system\_prompt
},
{
"role": "user",
"content": [
{
"type": "text",
"text": title
},
{
"type": "image\_url",
"image\_url": {
"url": img\_url
}
},
],
}
]
}
}
tasks.append(task)`
```
```
`# Creating the file
file\_name = "data/batch\_tasks\_furniture.jsonl"
with open(file\_name, 'w') as file:
for obj in tasks:
file.write(json.dumps(obj) + '\\n')`
```
```
`# Uploading the file
batch\_file = client.files.create(
file=open(file\_name, "rb"),
purpose="batch"
)`
```
```
`# Creating the job
batch\_job = client.batches.create(
input\_file\_id=batch\_file.id,
endpoint="/v1/chat/completions",
completion\_window="24h"
)`
```
```
`batch\_job = client.batches.retrieve(batch\_job.id)
print(batch\_job)`
```
### Getting results
As with the first example, we can retrieve results once the batch job is done.
Reminder: the results are not in the same order as in the input file.
Make sure to check the custom\_id to match the results against the input requests
```
`# Retrieving result file
result\_file\_id = batch\_job.output\_file\_id
result = client.files.content(result\_file\_id).content`
```
```
`result\_file\_name = "data/batch\_job\_results\_furniture.jsonl"
with open(result\_file\_name, 'wb') as file:
file.write(result)`
```
```
`# Loading data from saved file
results = []
with open(result\_file\_name, 'r') as file:
for line in file:
# Parsing the JSON string into a dict and appending to the list of results
json\_object = json.loads(line.strip())
results.append(json\_object)`
```
```
`# Reading only the first results
for res in results[:5]:
task\_id = res['custom\_id']
# Getting index from task id
index = task\_id.split('-')[-1]
result = res['response']['body']['choices'][0]['message']['content']
item = df.iloc[int(index)]
img\_url = item['primary\_image']
img = Image(url=img\_url)
display(img)
print(f"CAPTION: {result}\\n\\n")`
```
```
`CAPTION: Brushed brass pedestal towel rack with a sleek, modern design, featuring multiple bars for hanging towels, measuring 25.75 x 14.44 x 32 inches.`
```
```
`CAPTION: Black round end table featuring a tempered glass top and a metal frame, with a lower shelf for additional storage.`
```
```
`CAPTION: Black collapsible and height-adjustable telescoping stool, portable and designed for makeup artists and hairstylists, shown in various stages of folding for easy transport.`
```
```
`CAPTION: Ergonomic pink gaming chair featuring breathable fabric, adjustable height, lumbar support, a footrest, and a swivel recliner function.`
```
```
`CAPTION: A set of two Glitzhome adjustable bar stools featuring a mid-century modern design with swivel seats, PU leather upholstery, and wooden backrests.`
```
## Wrapping up
In this cookbook, we have seen two examples of how to use the new Batch API, but keep in mind that the Batch API works the same way as the Chat Completions endpoint, supporting the same parameters and most of the recent models (gpt-4o, gpt-4o-mini, gpt-4-turbo, gpt-3.5-turbo…).
By using this API, you can significantly reduce costs, so we recommend switching every workload that can happen async to a batch job with this new API.