How to combine GPT4o mini with RAG to create a clothing matchmaker app
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
Jul 18, 2024
# How to combine GPT4o mini with RAG to create a clothing matchmaker app
[ TM ](https://www.linkedin.com/in/teodora-musatoiu/)
[ Teodora Musatoiu
(OpenAI)
](https://www.linkedin.com/in/teodora-musatoiu/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_combine_GPT4o_with_RAG_Outfit_Assistant.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_combine_GPT4o_with_RAG_Outfit_Assistant.ipynb)
Welcome to the Clothing Matchmaker App Jupyter Notebook! This project demonstrates the power of the GPT-4o mini model in analyzing images of clothing items and extracting key features such as color, style, and type. The core of our app relies on this advanced image analysis model developed by OpenAI, which enables us to accurately identify the characteristics of the input clothing item.
GPT-4o mini is a small model that combines natural language processing with image recognition, allowing it to understand and generate responses based on both text and visual inputs with low latency.
Building on the capabilities of the GPT-4o mini model, we employ a custom matching algorithm and the RAG technique to search our knowledge base for items that complement the identified features. This algorithm takes into account factors like color compatibility and style coherence to provide users with suitable recommendations. Through this notebook, we aim to showcase the practical application of these technologies in creating a clothing recommendation system.
Using the combination of GPT-4o mini + RAG (Retrieval-Augmented Generation) offers several advantages:
1. **Contextual Understanding**: GPT-4o mini can analyze input images and understand the context, such as the objects, scenes, and activities depicted. This allows for more accurate and relevant suggestions or information across various domains, whether it’s interior design, cooking, or education.
2. **Rich Knowledge Base**: RAG combines the generative capabilities of GPT-4 with a retrieval component that accesses a large corpus of information across different fields. This means the system can provide suggestions or insights based on a wide range of knowledge, from historical facts to scientific concepts.
3. **Customization**: The approach allows for easy customization to cater to specific user needs or preferences in various applications. Whether it’s tailoring suggestions to a user’s taste in art or providing educational content based on a student’s learning level, the system can be adapted to deliver personalized experiences.
Overall, the GPT-4o mini + RAG approach offers a fast, powerful, and flexible solution for various fashion-related applications, leveraging the strengths of both generative and retrieval-based AI techniques.
### Environment Setup
First we will install the necessary dependencies, then import the libraries and write some utility functions that we will use later on.
```
`%pip install openai --quiet
%pip install tenacity --quiet
%pip install tqdm --quiet
%pip install numpy --quiet
%pip install typing --quiet
%pip install tiktoken --quiet
%pip install concurrent --quiet`
```
```
`import pandas as pd
import numpy as np
import json
import ast
import tiktoken
import concurrent
from openai import OpenAI
from tqdm import tqdm
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt
from IPython.display import Image, display, HTML
from typing import List
client = OpenAI()
GPT\_MODEL = "gpt-4o-mini"
EMBEDDING\_MODEL = "text-embedding-3-large"
EMBEDDING\_COST\_PER\_1K\_TOKENS = 0.00013`
```
### Creating the Embeddings
We will now set up the knowledge base by choosing a database and generating embeddings for it. I am using the `sample\_styles.csv` file for this in the data folder. This is a sample of a bigger dataset that contains `\~44K` items. This step can also be replaced by using an out-of-the-box vector database. For example, you can follow one of [these cookbooks](https://github.com/openai/openai-cookbook/tree/main/examples/vector_databases) to set up your vector database.
```
`styles\_filepath = "data/sample\_clothes/sample\_styles.csv"
styles\_df = pd.read\_csv(styles\_filepath, on\_bad\_lines='skip')
print(styles\_df.head())
print("Opened dataset successfully. Dataset has {} items of clothing.".format(len(styles\_df)))`
```
Now we will generate embeddings for the entire dataset. We can parallelize the execution of these embeddings to ensure that the script scales up for larger datasets. With this logic, the time to create embeddings for the full `44K` entry dataset decreases from \~4h to \~2-3min.
```
`## Batch Embedding Logic
# Simple function to take in a list of text objects and return them as a list of embeddings
@retry(wait=wait\_random\_exponential(min=1, max=40), stop=stop\_after\_attempt(10))
def get\_embeddings(input: List):
response = client.embeddings.create(
input=input,
model=EMBEDDING\_MODEL
).data
return [data.embedding for data in response]
# Splits an iterable into batches of size n.
def batchify(iterable, n=1):
l = len(iterable)
for ndx in range(0, l, n):
yield iterable[ndx : min(ndx + n, l)]
# Function for batching and parallel processing the embeddings
def embed\_corpus(
corpus: List[str],
batch\_size=64,
num\_workers=8,
max\_context\_len=8191,
):
# Encode the corpus, truncating to max\_context\_len
encoding = tiktoken.get\_encoding("cl100k\_base")
encoded\_corpus = [
encoded\_article[:max\_context\_len] for encoded\_article in encoding.encode\_batch(corpus)
]
# Calculate corpus statistics: the number of inputs, the total number of tokens, and the estimated cost to embed
num\_tokens = sum(len(article) for article in encoded\_corpus)
cost\_to\_embed\_tokens = num\_tokens / 1000 \* EMBEDDING\_COST\_PER\_1K\_TOKENS
print(
f"num\_articles={len(encoded\_corpus)}, num\_tokens={num\_tokens}, est\_embedding\_cost={cost\_to\_embed\_tokens:.2f} USD"
)
# Embed the corpus
with concurrent.futures.ThreadPoolExecutor(max\_workers=num\_workers) as executor:
futures = [
executor.submit(get\_embeddings, text\_batch)
for text\_batch in batchify(encoded\_corpus, batch\_size)
]
with tqdm(total=len(encoded\_corpus)) as pbar:
for \_ in concurrent.futures.as\_completed(futures):
pbar.update(batch\_size)
embeddings = []
for future in futures:
data = future.result()
embeddings.extend(data)
return embeddings
# Function to generate embeddings for a given column in a DataFrame
def generate\_embeddings(df, column\_name):
# Initialize an empty list to store embeddings
descriptions = df[column\_name].astype(str).tolist()
embeddings = embed\_corpus(descriptions)
# Add the embeddings as a new column to the DataFrame
df['embeddings'] = embeddings
print("Embeddings created successfully.")`
```
#### Two options for creating the embeddings:
The next line will **create the embeddings** for the sample clothes dataset. This will take around 0.02s to process and another \~30s to write the results to a local .csv file. The process is using our `text\_embedding\_3\_large` model which is priced at `$0.00013/1K` tokens. Given that the dataset has around `1K` entries, the following operation will cost approximately `$0.001`. If you decide to work with the entire dataset of `44K` entries, this operation will take 2-3min to process and it will cost approximately `$0.07`.
**If you would not like to proceed with creating your own embeddings**, we will use a dataset of pre-computed embeddings. You can skip this cell and uncomment the code in the following cell to proceed with loading the pre-computed vectors. This operation takes \~1min to load all the data in memory.
```
`generate\_embeddings(styles\_df, 'productDisplayName')
print("Writing embeddings to file ...")
styles\_df.to\_csv('data/sample\_clothes/sample\_styles\_with\_embeddings.csv', index=False)
print("Embeddings successfully stored in sample\_styles\_with\_embeddings.csv")`
```
```
`# styles\_df = pd.read\_csv('data/sample\_clothes/sample\_styles\_with\_embeddings.csv', on\_bad\_lines='skip')
# # Convert the 'embeddings' column from string representations of lists to actual lists of floats
# styles\_df['embeddings'] = styles\_df['embeddings'].apply(lambda x: ast.literal\_eval(x))
print(styles\_df.head())
print("Opened dataset successfully. Dataset has {} items of clothing along with their embeddings.".format(len(styles\_df)))`
```
### Building the Matching Algorithm
In this section, we’ll develop a cosine similarity retrieval algorithm to find similar items in our dataframe. We’ll utilize our custom cosine similarity function for this purpose. While the `sklearn` library offers a built-in cosine similarity function, recent updates to its SDK have led to compatibility issues, prompting us to implement our own standard cosine similarity calculation.
If you already have a vector database set up, you can skip this step. Most standard databases come with their own search functions, which simplify the subsequent steps outlined in this guide. However, we aim to demonstrate that the matching algorithm can be tailored to meet specific requirements, such as a particular threshold or a specified number of matches returned.
The `find\_similar\_items` function accepts four parameters:
* `embedding`: The embedding for which we want to find a match.
* `embeddings`: A list of embeddings to search through for the best matches.
* `threshold` (optional): This parameter specifies the minimum similarity score for a match to be considered valid. A higher threshold results in closer (better) matches, while a lower threshold allows for more items to be returned, though they may not be as closely matched to the initial `embedding`.
* `top\_k` (optional): This parameter determines the number of items to return that exceed the given threshold. These will be the top-scoring matches for the provided `embedding`.
```
`def cosine\_similarity\_manual(vec1, vec2):
"""Calculate the cosine similarity between two vectors."""
vec1 = np.array(vec1, dtype=float)
vec2 = np.array(vec2, dtype=float)
dot\_product = np.dot(vec1, vec2)
norm\_vec1 = np.linalg.norm(vec1)
norm\_vec2 = np.linalg.norm(vec2)
return dot\_product / (norm\_vec1 \* norm\_vec2)
def find\_similar\_items(input\_embedding, embeddings, threshold=0.5, top\_k=2):
"""Find the most similar items based on cosine similarity."""
# Calculate cosine similarity between the input embedding and all other embeddings
similarities = [(index, cosine\_similarity\_manual(input\_embedding, vec)) for index, vec in enumerate(embeddings)]
# Filter out any similarities below the threshold
filtered\_similarities = [(index, sim) for index, sim in similarities if sim \>= threshold]
# Sort the filtered similarities by similarity score
sorted\_indices = sorted(filtered\_similarities, key=lambda x: x[1], reverse=True)[:top\_k]
# Return the top-k most similar items
return sorted\_indices`
```
```
`def find\_matching\_items\_with\_rag(df\_items, item\_descs):
"""Take the input item descriptions and find the most similar items based on cosine similarity for each description."""
# Select the embeddings from the DataFrame.
embeddings = df\_items['embeddings'].tolist()
similar\_items = []
for desc in item\_descs:
# Generate the embedding for the input item
input\_embedding = get\_embeddings([desc])
# Find the most similar items based on cosine similarity
similar\_indices = find\_similar\_items(input\_embedding, embeddings, threshold=0.6)
similar\_items += [df\_items.iloc[i] for i in similar\_indices]
return similar\_items`
```
### Analysis Module
In this module, we leverage `gpt-4o-mini` to analyze input images and extract important features like detailed descriptions, styles, and types. The analysis is performed through a straightforward API call, where we provide the URL of the image for analysis and request the model to identify relevant features.
To ensure the model returns accurate results, we use specific techniques in our prompt:
1. **Output Format Specification**: We instruct the model to return a JSON block with a predefined structure, consisting of:
* `items` (str[]): A list of strings, each representing a concise title for an item of clothing, including style, color, and gender. These titles closely resemble the `productDisplayName` property in our original database.
* `category` (str): The category that best represents the given item. The model selects from a list of all unique `articleTypes` present in the original styles dataframe.
* `gender` (str): A label indicating the gender the item is intended for. The model chooses from the options `[Men, Women, Boys, Girls, Unisex]`.
* **Clear and Concise Instructions**:
* We provide clear instructions on what the item titles should include and what the output format should be. The output should be in JSON format, but without the `json` tag that the model response normally contains.
* **One Shot Example**:
* To further clarify the expected output, we provide the model with an example input description and a corresponding example output. Although this may increase the number of tokens used (and thus the cost of the call), it helps to guide the model and results in better overall performance.
By following this structured approach, we aim to obtain precise and useful information from the `gpt-4o-mini` model for further analysis and integration into our database.
```
`def analyze\_image(image\_base64, subcategories):
response = client.chat.completions.create(
model=GPT\_MODEL,
messages=[
{
"role": "user",
"content": [
{
"type": "text",
"text": f"""Given an image of an item of clothing, analyze the item and generate a JSON output with the following fields: "items", "category", and "gender".
Use your understanding of fashion trends, styles, and gender preferences to provide accurate and relevant suggestions for how to complete the outfit.
The items field should be a list of items that would go well with the item in the picture. Each item should represent a title of an item of clothing that contains the style, color, and gender of the item.
The category needs to be chosen between the types in this list: {subcategories}.
You have to choose between the genders in this list: [Men, Women, Boys, Girls, Unisex]
Do not include the description of the item in the picture. Do not include the ```json ``` tag in the output.
Example Input: An image representing a black leather jacket.
Example Output: {{"items": ["Fitted White Women's T-shirt", "White Canvas Sneakers", "Women's Black Skinny Jeans"], "category": "Jackets", "gender": "Women"}}
""",
},
{
"type": "image\_url",
"image\_url": {
"url": f"data:image/jpeg;base64,{image\_base64}",
},
}
],
}
]
)
# Extract relevant features from the response
features = response.choices[0].message.content
return features`
```
### Testing the Prompt with Sample Images
To evaluate the effectiveness of our prompt, let’s load and test it with a selection of images from our dataset. We’ll use images from the `"data/sample\_clothes/sample\_images"` folder, ensuring a variety of styles, genders, and types. Here are the chosen samples:
* `2133.jpg`: Men’s shirt
* `7143.jpg`: Women’s shirt
* `4226.jpg`: Casual men’s printed t-shirt
By testing the prompt with these diverse images, we can assess its ability to accurately analyze and extract relevant features from different types of clothing items and accessories.
We need a utility function to encode the .jpg images in base64
```
`import base64
def encode\_image\_to\_base64(image\_path):
with open(image\_path, 'rb') as image\_file:
encoded\_image = base64.b64encode(image\_file.read())
return encoded\_image.decode('utf-8')`
```
```
`# Set the path to the images and select a test image
image\_path = "data/sample\_clothes/sample\_images/"
test\_images = ["2133.jpg", "7143.jpg", "4226.jpg"]
# Encode the test image to base64
reference\_image = image\_path + test\_images[0]
encoded\_image = encode\_image\_to\_base64(reference\_image)`
```
```
`# Select the unique subcategories from the DataFrame
unique\_subcategories = styles\_df['articleType'].unique()
# Analyze the image and return the results
analysis = analyze\_image(encoded\_image, unique\_subcategories)
image\_analysis = json.loads(analysis)
# Display the image and the analysis results
display(Image(filename=reference\_image))
print(image\_analysis)`
```
Next, we process the output from the image analysis and use it to filter and display matching items from our dataset. Here’s a breakdown of the code:
1. **Extracting Image Analysis Results**: We extract the item descriptions, category, and gender from the `image\_analysis` dictionary.
2. **Filtering the Dataset**: We filter the `styles\_df` DataFrame to include only items that match the gender from the image analysis (or are unisex) and exclude items of the same category as the analyzed image.
3. **Finding Matching Items**: We use the `find\_matching\_items\_with\_rag` function to find items in the filtered dataset that match the descriptions extracted from the analyzed image.
4. **Displaying Matching Items**: We create an HTML string to display images of the matching items. We construct the image paths using the item IDs and append each image to the HTML string. Finally, we use `display(HTML(html))` to render the images in the notebook.
This cell effectively demonstrates how to use the results of image analysis to filter a dataset and visually display items that match the analyzed image’s characteristics.
```
`# Extract the relevant features from the analysis
item\_descs = image\_analysis['items']
item\_category = image\_analysis['category']
item\_gender = image\_analysis['gender']
# Filter data such that we only look through the items of the same gender (or unisex) and different category
filtered\_items = styles\_df.loc[styles\_df['gender'].isin([item\_gender, 'Unisex'])]
filtered\_items = filtered\_items[filtered\_items['articleType'] != item\_category]
print(str(len(filtered\_items)) + " Remaining Items")
# Find the most similar items based on the input item descriptions
matching\_items = find\_matching\_items\_with\_rag(filtered\_items, item\_descs)
# Display the matching items (this will display 2 items for each description in the image analysis)
html = ""
paths = []
for i, item in enumerate(matching\_items):
item\_id = item['id']
# Path to the image file
image\_path = f'data/sample\_clothes/sample\_images/{item\_id}.jpg'
paths.append(image\_path)
html += f'\<img src="{image\_path}" style="display:inline;margin:1px"/\>'
# Print the matching item description as a reminder of what we are looking for
print(item\_descs)
# Display the image
display(HTML(html))`
```
### Guardrails
In the context of using Large Language Models (LLMs) like GPT-4o mini, “guardrails” refer to mechanisms or checks put in place to ensure that the model’s output remains within desired parameters or boundaries. These guardrails are crucial for maintaining the quality and relevance of the model’s responses, especially when dealing with complex or nuanced tasks.
Guardrails are useful for several reasons:
1. **Accuracy**: They help ensure that the model’s output is accurate and relevant to the input provided.
2. **Consistency**: They maintain consistency in the model’s responses, especially when dealing with similar or related inputs.
3. **Safety**: They prevent the model from generating harmful, offensive, or inappropriate content.
4. **Contextual Relevance**: They ensure that the model’s output is contextually relevant to the specific task or domain it is being used for.
In our case, we are using GPT-4o mini to analyze fashion images and suggest items that would complement an original outfit. To implement guardrails, we can **refine results**: After obtaining initial suggestions from GPT-4o mini, we can send the original image and the suggested items back to the model. We can then ask GPT-4o mini to evaluate whether each suggested item would indeed be a good fit for the original outfit.
This gives the model the ability to self-correct and adjust its own output based on feedback or additional information. By implementing these guardrails and enabling self-correction, we can enhance the reliability and usefulness of the model’s output in the context of fashion analysis and recommendation.
To facilitate this, we write a prompt that asks the LLM for a simple “yes” or “no” answer to the question of whether the suggested items match the original outfit or not. This binary response helps streamline the refinement process and ensures clear and actionable feedback from the model.
```
`def check\_match(reference\_image\_base64, suggested\_image\_base64):
response = client.chat.completions.create(
model=GPT\_MODEL,
messages=[
{
"role": "user",
"content": [
{
"type": "text",
"text": """ You will be given two images of two different items of clothing.
Your goal is to decide if the items in the images would work in an outfit together.
The first image is the reference item (the item that the user is trying to match with another item).
You need to decide if the second item would work well with the reference item.
Your response must be a JSON output with the following fields: "answer", "reason".
The "answer" field must be either "yes" or "no", depending on whether you think the items would work well together.
The "reason" field must be a short explanation of your reasoning for your decision. Do not include the descriptions of the 2 images.
Do not include the ```json ``` tag in the output.
""",
},
{
"type": "image\_url",
"image\_url": {
"url": f"data:image/jpeg;base64,{reference\_image\_base64}",
},
},
{
"type": "image\_url",
"image\_url": {
"url": f"data:image/jpeg;base64,{suggested\_image\_base64}",
},
}
],
}
],
max\_tokens=300,
)
# Extract relevant features from the response
features = response.choices[0].message.content
return features`
```
Finally, let’s determine which of the items identified above truly complement the outfit.
```
`# Select the unique paths for the generated images
paths = list(set(paths))
for path in paths:
# Encode the test image to base64
suggested\_image = encode\_image\_to\_base64(path)
# Check if the items match
match = json.loads(check\_match(encoded\_image, suggested\_image))
# Display the image and the analysis results
if match["answer"] == 'yes':
display(Image(filename=path))
print("The items match!")
print(match["reason"])`
```
We can observe that the initial list of potential items has been further refined, resulting in a more curated selection that aligns well with the outfit. Additionally, the model provides explanations for why each item is considered a good match, offering valuable insights into the decision-making process.
### Conclusion
In this Jupyter Notebook, we explored the application of GPT-4o mini and other machine learning techniques to the domain of fashion. We demonstrated how to analyze images of clothing items, extract relevant features, and use this information to find matching items that complement an original outfit. Through the implementation of guardrails and self-correction mechanisms, we refined the model’s suggestions to ensure they are accurate and contextually relevant.
This approach has several practical uses in the real world, including:
1. **Personalized Shopping Assistants**: Retailers can use this technology to offer personalized outfit recommendations to customers, enhancing the shopping experience and increasing customer satisfaction.
2. **Virtual Wardrobe Applications**: Users can upload images of their own clothing items to create a virtual wardrobe and receive suggestions for new items that match their existing pieces.
3. **Fashion Design and Styling**: Fashion designers and stylists can use this tool to experiment with different combinations and styles, streamlining the creative process.
However, one of the considerations to keep in mind is **cost**. The use of LLMs and image analysis models can incur costs, especially if used extensively. It’s important to consider the cost-effectiveness of implementing these technologies. `gpt-4o-mini` is priced at `$0.01` per 1000 tokens. This adds up to `$0.00255` for one 256px x 256px image.
Overall, this notebook serves as a foundation for further exploration and development in the intersection of fashion and AI, opening doors to more personalized and intelligent fashion recommendation systems.