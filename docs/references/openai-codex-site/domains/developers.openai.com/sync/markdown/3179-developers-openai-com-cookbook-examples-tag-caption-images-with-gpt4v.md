Using GPT4o mini to tag and caption images
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
# Using GPT4o mini to tag and caption images
[ KG ](https://katia.gg)
[ Katia Gil Guzman
(OpenAI)
](https://katia.gg)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Tag_caption_images_with_GPT4V.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Tag_caption_images_with_GPT4V.ipynb)
This notebook explores how to leverage the vision capabilities of the GPT-4\* models (for example `gpt-4o`, `gpt-4o-mini` or `gpt-4-turbo`) to tag & caption images.
We can leverage the multimodal capabilities of these models to provide input images along with additional context on what they represent, and prompt the model to output tags or image descriptions. The image descriptions can then be further refined with a language model (in this notebook, we’ll use `gpt-4o-mini`) to generate captions.
Generating text content from images can be useful for multiple use cases, especially use cases involving search.
We will illustrate a search use case in this notebook by using generated keywords and product captions to search for products - both from a text input and an image input.
As an example, we will use a dataset of Amazon furniture items, tag them with relevant keywords and generate short, descriptive captions.
## Setup
```
`# Install dependencies if needed
%pip install openai
%pip install scikit-learn`
```
```
`from IPython.display import Image, display
import pandas as pd
from sklearn.metrics.pairwise import cosine\_similarity
import numpy as np
from openai import OpenAI
# Initializing OpenAI client - see https://platform.openai.com/docs/quickstart?context=python
client = OpenAI()`
```
```
`# Loading dataset
dataset\_path = "data/amazon\_furniture\_dataset.csv"
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
## Tag images
In this section, we’ll use GPT-4o mini to generate relevant tags for our products.
We’ll use a simple zero-shot approach to extract keywords, and deduplicate those keywords using embeddings to avoid having multiple keywords that are too similar.
We will use a combination of an image and the product title to avoid extracting keywords for other items that are depicted in the image - sometimes there are multiple items used in the scene and we want to focus on just the one we want to tag.
### Extract keywords
```
`system\_prompt = '''
You are an agent specialized in tagging images of furniture items, decorative items, or furnishings with relevant keywords that could be used to search for these items on a marketplace.
You will be provided with an image and the title of the item that is depicted in the image, and your goal is to extract keywords for only the item specified.
Keywords should be concise and in lower case.
Keywords can describe things like:
- Item type e.g. 'sofa bed', 'chair', 'desk', 'plant'
- Item material e.g. 'wood', 'metal', 'fabric'
- Item style e.g. 'scandinavian', 'vintage', 'industrial'
- Item color e.g. 'red', 'blue', 'white'
Only deduce material, style or color keywords when it is obvious that they make the item depicted in the image stand out.
Return keywords in the format of an array of strings, like this:
['desk', 'industrial', 'metal']
'''
def analyze\_image(img\_url, title):
response = client.chat.completions.create(
model="gpt-4o-mini",
messages=[
{
"role": "system",
"content": system\_prompt
},
{
"role": "user",
"content": [
{
"type": "image\_url",
"image\_url": {
"url": img\_url,
}
},
],
},
{
"role": "user",
"content": title
}
],
max\_tokens=300,
top\_p=0.1
)
return response.choices[0].message.content`
```
#### Testing with a few examples
```
`examples = df.iloc[:5]`
```
```
`for index, ex in examples.iterrows():
url = ex['primary\_image']
img = Image(url=url)
display(img)
result = analyze\_image(url, ex['title'])
print(result)
print("\\n\\n")`
```
```
`['shoe rack', 'metal', 'white', 'multi-layer', 'hooks']`
```
```
`['dining chair', 'leather', 'black']`
```
```
`['repotting mat', 'waterproof', 'portable', 'foldable', 'green']`
```
```
`['doormat', 'absorbent', 'non-slip', 'coconut fiber', 'welcome', 'pickleball', 'outdoor']`
```
```
`['tv tray', 'foldable', 'metal', 'grey']`
```
### Looking up existing keywords
Using embeddings to avoid duplicates (synonyms) and/or match pre-defined keywords
```
`# Feel free to change the embedding model here
def get\_embedding(value, model="text-embedding-3-large"):
embeddings = client.embeddings.create(
model=model,
input=value,
encoding\_format="float"
)
return embeddings.data[0].embedding`
```
#### Testing with example keywords
```
`# Existing keywords
keywords\_list = ['industrial', 'metal', 'wood', 'vintage', 'bed']`
```
```
`df\_keywords = pd.DataFrame(keywords\_list, columns=['keyword'])
df\_keywords['embedding'] = df\_keywords['keyword'].apply(lambda x: get\_embedding(x))
df\_keywords`
```
||keyword|embedding|
|0|industrial|[-0.026137426, 0.021297162, -0.007273361, -0.0...|
|1|metal|[-0.020492474, 0.0044436487, -0.0110632675, -0...|
|2|wood|[0.013840097, 0.029538965, 0.00064718135, -0.0...|
|3|vintage|[-0.052348174, 0.008181616, -0.015513194, 0.00...|
|4|bed|[-0.011677503, 0.023275835, 0.0026937425, -0.0...|
```
`def compare\_keyword(keyword):
embedded\_value = get\_embedding(keyword)
df\_keywords['similarity'] = df\_keywords['embedding'].apply(lambda x: cosine\_similarity(np.array(x).reshape(1,-1), np.array(embedded\_value).reshape(1, -1)))
most\_similar = df\_keywords.sort\_values('similarity', ascending=False).iloc[0]
return most\_similar
def replace\_keyword(keyword, threshold = 0.6):
most\_similar = compare\_keyword(keyword)
if most\_similar['similarity'] \> threshold:
print(f"Replacing '{keyword}' with existing keyword: '{most\_similar['keyword']}'")
return most\_similar['keyword']
return keyword`
```
```
`# Example keywords to compare to our list of existing keywords
example\_keywords = ['bed frame', 'wooden', 'vintage', 'old school', 'desk', 'table', 'old', 'metal', 'metallic', 'woody']
final\_keywords = []
for k in example\_keywords:
final\_keywords.append(replace\_keyword(k))
final\_keywords = set(final\_keywords)
print(f"Final keywords: {final\_keywords}")`
```
```
`Replacing 'bed frame' with existing keyword: 'bed'
Replacing 'wooden' with existing keyword: 'wood'
Replacing 'vintage' with existing keyword: 'vintage'
Replacing 'metal' with existing keyword: 'metal'
Replacing 'metallic' with existing keyword: 'metal'
Replacing 'woody' with existing keyword: 'wood'
Final keywords: {'vintage', 'desk', 'wood', 'table', 'old', 'bed', 'metal', 'old school'}`
```
## Generate captions
In this section, we’ll use GPT-4o mini to generate an image description and then use a few-shot examples approach with GPT-4-turbo to generate captions from the images.
If few-shot examples are not enough for your use case, consider fine-tuning a model to get the generated captions to match the style & tone you are targeting.
```
`# Cleaning up dataset columns
selected\_columns = ['title', 'primary\_image', 'style', 'material', 'color', 'url']
df = df[selected\_columns].copy()
df.head()`
```
||title|primary\_image|style|material|color|url|
|0|GOYMFK 1pc Free Standing Shoe Rack, Multi-laye...|https://m.media-amazon.com/images/I/416WaLx10j...|Modern|Metal|White|https://www.amazon.com/dp/B0CJHKVG6P|
|1|subrtex Leather ding Room, Dining Chairs Set o...|https://m.media-amazon.com/images/I/31SejUEWY7...|Black Rubber Wood|Sponge|Black|https://www.amazon.com/dp/B0B66QHB23|
|2|Plant Repotting Mat MUYETOL Waterproof Transpl...|https://m.media-amazon.com/images/I/41RgefVq70...|Modern|Polyethylene|Green|https://www.amazon.com/dp/B0BXRTWLYK|
|3|Pickleball Doormat, Welcome Doormat Absorbent ...|https://m.media-amazon.com/images/I/61vz1Igler...|Modern|Rubber|A5589|https://www.amazon.com/dp/B0C1MRB2M8|
|4|JOIN IRON Foldable TV Trays for Eating Set of ...|https://m.media-amazon.com/images/I/41p4d4VJnN...|X Classic Style|Iron|Grey Set of 4|https://www.amazon.com/dp/B0CG1N9QRC|
### Describing images with GPT-4o mini
```
`describe\_system\_prompt = '''
You are a system generating descriptions for furniture items, decorative items, or furnishings on an e-commerce website.
Provided with an image and a title, you will describe the main item that you see in the image, giving details but staying concise.
You can describe unambiguously what the item is and its material, color, and style if clearly identifiable.
If there are multiple items depicted, refer to the title to understand which item you should describe.
'''
def describe\_image(img\_url, title):
response = client.chat.completions.create(
model="gpt-4o-mini",
temperature=0.2,
messages=[
{
"role": "system",
"content": describe\_system\_prompt
},
{
"role": "user",
"content": [
{
"type": "image\_url",
"image\_url": {
"url": img\_url,
}
},
],
},
{
"role": "user",
"content": title
}
],
max\_tokens=300,
)
return response.choices[0].message.content`
```
#### Testing on a few examples
```
`for index, row in examples.iterrows():
print(f"{row['title'][:50]}{'...' if len(row['title']) \> 50 else ''} - {row['url']} :\\n")
img\_description = describe\_image(row['primary\_image'], row['title'])
print(f"{img\_description}\\n--------------------------\\n")`
```
```
`GOYMFK 1pc Free Standing Shoe Rack, Multi-layer Me... - https://www.amazon.com/dp/B0CJHKVG6P :
The item is a free-standing shoe rack designed for versatile use in living rooms, bathrooms, or hallways. It features a multi-layer metal structure with a sleek white finish. The rack includes eight double hooks at the top for hanging accessories like hats, bags, or scarves. Below, there are multiple shelves that provide ample space for organizing shoes, making it both functional and stylish for entryway storage.
--------------------------
subrtex Leather ding Room, Dining Chairs Set of 2,... - https://www.amazon.com/dp/B0B66QHB23 :
The Subrtex Leather Dining Chairs come in a set of two, featuring a sleek black design. Each chair is upholstered in durable faux leather, offering a modern and stylish look. The high backrest is accentuated with subtle vertical stitching, while the sturdy wooden legs provide stability and support. These chairs are ideal for enhancing the aesthetic of any dining room.
--------------------------
Plant Repotting Mat MUYETOL Waterproof Transplanti... - https://www.amazon.com/dp/B0BXRTWLYK :
The Plant Repotting Mat is a portable and foldable gardening accessory, measuring 26.8" x 26.8". It features a vibrant green color with black edges, designed to be waterproof for easy cleanup during soil changes. The mat provides a spacious area for repotting plants and comes with tools for transplanting. Ideal for indoor gardening, it helps keep your workspace tidy while you care for your succulents and other plants.
--------------------------
Pickleball Doormat, Welcome Doormat Absorbent Non-... - https://www.amazon.com/dp/B0C1MRB2M8 :
The Pickleball Doormat features a natural coir material with a rectangular shape, measuring 16x24 inches. It showcases a playful design with the phrase "It's a good day to play PICKLEBALL" in bold black lettering, accompanied by graphic illustrations of pickleball paddles. The mat is designed to be absorbent and non-slip, making it suitable for entryways or bathrooms. Its light brown color adds a warm touch to any space.
--------------------------
JOIN IRON Foldable TV Trays for Eating Set of 4 wi... - https://www.amazon.com/dp/B0CG1N9QRC :
The JOIN IRON Foldable TV Trays set includes four sleek, grey snack tables designed for convenience and space-saving. Each tray features a sturdy, flat surface supported by a durable metal frame, allowing for easy folding and storage. The minimalist design makes them ideal for small spaces, perfect for enjoying meals or snacks while watching TV. The set also comes with a stand for organized storage when not in use.
--------------------------`
```
### Turning descriptions into captions
Using a few-shot examples approach to turn a long description into a short image caption
```
`caption\_system\_prompt = '''
Your goal is to generate short, descriptive captions for images of furniture items, decorative items, or furnishings based on an image description.
You will be provided with a description of an item image and you will output a caption that captures the most important information about the item.
Your generated caption should be short (1 sentence), and include the most relevant information about the item.
The most important information could be: the type of the item, the style (if mentioned), the material if especially relevant and any distinctive features.
'''
few\_shot\_examples = [
{
"description": "This is a multi-layer metal shoe rack featuring a free-standing design. It has a clean, white finish that gives it a modern and versatile look, suitable for various home decors. The rack includes several horizontal shelves dedicated to organizing shoes, providing ample space for multiple pairs. Above the shoe storage area, there are 8 double hooks arranged in two rows, offering additional functionality for hanging items such as hats, scarves, or bags. The overall structure is sleek and space-saving, making it an ideal choice for placement in living rooms, bathrooms, hallways, or entryways where efficient use of space is essential.",
"caption": "White metal free-standing shoe rack"
},
{
"description": "The image shows a set of two dining chairs in black. These chairs are upholstered in a leather-like material, giving them a sleek and sophisticated appearance. The design features straight lines with a slight curve at the top of the high backrest, which adds a touch of elegance. The chairs have a simple, vertical stitching detail on the backrest, providing a subtle decorative element. The legs are also black, creating a uniform look that would complement a contemporary dining room setting. The chairs appear to be designed for comfort and style, suitable for both casual and formal dining environments.",
"caption": "Set of 2 modern black leather dining chairs"
},
{
"description": "This is a square plant repotting mat designed for indoor gardening tasks such as transplanting and changing soil for plants. It measures 26.8 inches by 26.8 inches and is made from a waterproof material, which appears to be a durable, easy-to-clean fabric in a vibrant green color. The edges of the mat are raised with integrated corner loops, likely to keep soil and water contained during gardening activities. The mat is foldable, enhancing its portability, and can be used as a protective surface for various gardening projects, including working with succulents. It's a practical accessory for garden enthusiasts and makes for a thoughtful gift for those who enjoy indoor plant care.",
"caption": "Waterproof square plant repotting mat"
}
]
formatted\_examples = [[{
"role": "user",
"content": ex['description']
},
{
"role": "assistant",
"content": ex['caption']
}]
for ex in few\_shot\_examples
]
formatted\_examples = [i for ex in formatted\_examples for i in ex]`
```
```
`def caption\_image(description, model="gpt-4o-mini"):
messages = formatted\_examples
messages.insert(0,
{
"role": "system",
"content": caption\_system\_prompt
})
messages.append(
{
"role": "user",
"content": description
})
response = client.chat.completions.create(
model=model,
temperature=0.2,
messages=messages
)
return response.choices[0].message.content`
```
#### Testing on a few examples
```
`examples = df.iloc[5:8]`
```
```
`for index, row in examples.iterrows():
print(f"{row['title'][:50]}{'...' if len(row['title']) \> 50 else ''} - {row['url']} :\\n")
img\_description = describe\_image(row['primary\_image'], row['title'])
print(f"{img\_description}\\n--------------------------\\n")
img\_caption = caption\_image(img\_description)
print(f"{img\_caption}\\n--------------------------\\n")`
```
```
`LOVMOR 30'' Bathroom Vanity Sink Base Cabine, Stor... - https://www.amazon.com/dp/B0C9WYYFLB :
The LOVMOR 30'' Bathroom Vanity Sink Base Cabinet features a classic design with a rich brown finish. It includes three drawers on the left side for ample storage, complemented by a spacious cabinet door on the right. The cabinet is constructed with detailed paneling, adding a touch of elegance, making it suitable for bathrooms, kitchens, laundry rooms, and more. Its versatile style allows it to blend seamlessly into various decor themes.
--------------------------
Classic 30'' brown bathroom vanity sink base cabinet with storage drawers.
--------------------------
Folews Bathroom Organizer Over The Toilet Storage,... - https://www.amazon.com/dp/B09NZY3R1T :
The Folews Bathroom Organizer is a freestanding, 4-tier storage rack designed to fit over a toilet. It features a sleek black metal frame with adjustable shelves, allowing for customizable storage options. The shelves are made of wire, providing a modern look while ensuring durability. This organizer includes baskets for additional storage and is ideal for maximizing bathroom space by holding toiletries, towels, and other essentials. Its design is both functional and stylish, making it a great addition to any bathroom.
--------------------------
Freestanding 4-tier black metal bathroom organizer with adjustable wire shelves and baskets.
--------------------------
GOYMFK 1pc Free Standing Shoe Rack, Multi-layer Me... - https://www.amazon.com/dp/B0CJHKVG6P :
The GOYMFK Free Standing Shoe Rack is a versatile storage solution designed for various spaces like living rooms, bathrooms, or hallways. It features a multi-layer metal construction with a sleek white finish. The rack includes eight double hooks at the top for hanging items such as hats, bags, or scarves. Below, there are multiple shelves for organizing shoes, accommodating various styles and sizes. Its modern design combines functionality with a clean aesthetic, making it a practical addition to any home.
--------------------------
Versatile white metal free-standing shoe rack with hooks and multiple shelves.
--------------------------`
```
## Image search
In this section, we will use generated keywords and captions to search items that match a given input, either text or image.
We will leverage our embeddings model to generate embeddings for the keywords and captions and compare them to either input text or the generated caption from an input image.
```
`# Df we'll use to compare keywords
df\_keywords = pd.DataFrame(columns=['keyword', 'embedding'])
df['keywords'] = ''
df['img\_description'] = ''
df['caption'] = ''`
```
```
`# Function to replace a keyword with an existing keyword if it's too similar
def get\_keyword(keyword, df\_keywords, threshold = 0.6):
embedded\_value = get\_embedding(keyword)
df\_keywords['similarity'] = df\_keywords['embedding'].apply(lambda x: cosine\_similarity(np.array(x).reshape(1,-1), np.array(embedded\_value).reshape(1, -1)))
sorted\_keywords = df\_keywords.copy().sort\_values('similarity', ascending=False)
if len(sorted\_keywords) \> 0 :
most\_similar = sorted\_keywords.iloc[0]
if most\_similar['similarity'] \> threshold:
print(f"Replacing '{keyword}' with existing keyword: '{most\_similar['keyword']}'")
return most\_similar['keyword']
new\_keyword = {
'keyword': keyword,
'embedding': embedded\_value
}
df\_keywords = pd.concat([df\_keywords, pd.DataFrame([new\_keyword])], ignore\_index=True)
return keyword`
```
### Preparing the dataset
```
`import ast
def tag\_and\_caption(row):
keywords = analyze\_image(row['primary\_image'], row['title'])
try:
keywords = ast.literal\_eval(keywords)
mapped\_keywords = [get\_keyword(k, df\_keywords) for k in keywords]
except Exception as e:
print(f"Error parsing keywords: {keywords}")
mapped\_keywords = []
img\_description = describe\_image(row['primary\_image'], row['title'])
caption = caption\_image(img\_description)
return {
'keywords': mapped\_keywords,
'img\_description': img\_description,
'caption': caption
}`
```
```
`df.shape`
```
```
`(312, 9)`
```
Processing all 312 lines of the dataset will take a while.
To test out the idea, we will only run it on the first 50 lines: this takes \~20 mins.
Feel free to skip this step and load the already processed dataset (see below).
```
`# Running on first 50 lines
for index, row in df[:50].iterrows():
print(f"{index} - {row['title'][:50]}{'...' if len(row['title']) \> 50 else ''}")
updates = tag\_and\_caption(row)
df.loc[index, updates.keys()] = updates.values()`
```
```
`0 - GOYMFK 1pc Free Standing Shoe Rack, Multi-layer Me...
1 - subrtex Leather ding Room, Dining Chairs Set of 2,...
2 - Plant Repotting Mat MUYETOL Waterproof Transplanti...
3 - Pickleball Doormat, Welcome Doormat Absorbent Non-...
4 - JOIN IRON Foldable TV Trays for Eating Set of 4 wi...
5 - LOVMOR 30'' Bathroom Vanity Sink Base Cabine, Stor...
6 - Folews Bathroom Organizer Over The Toilet Storage,...
7 - GOYMFK 1pc Free Standing Shoe Rack, Multi-layer Me...
8 - subrtex Leather ding Room, Dining Chairs Set of 2,...
9 - Plant Repotting Mat MUYETOL Waterproof Transplanti...
10 - Pickleball Doormat, Welcome Doormat Absorbent Non-...
11 - JOIN IRON Foldable TV Trays for Eating Set of 4 wi...
12 - LOVMOR 30'' Bathroom Vanity Sink Base Cabine, Stor...
13 - Folews Bathroom Organizer Over The Toilet Storage,...
14 - Lerliuo Nightstand, Side Table, Industrial Bedside...
15 - Boss Office Products Any Task Mid-Back Task Chair ...
16 - Kingston Brass BA1752BB Heritage 18-Inch Towel-Bar...
17 - Chief Mfg.Swing-Arm Wall Mount Hardware Mount Blac...
18 - DOMYDEVM Black End Table, Nightstand with Charging...
19 - LASCO 35-5019 Hallmack Style 24-Inch Towel Bar Acc...
20 - Table-Mate II PRO TV Tray Table - Folding Table wi...
21 - EGFheal White Dress Up Storage
22 - Caroline's Treasures PPD3013JMAT Enchanted Garden ...
23 - Leick Home 70007-WTGD Mixed Metal and Wood Stepped...
24 - Caroline's Treasures CK3435MAT Bichon Frise Doorma...
25 - Wildkin Kids Canvas Sling Bookshelf with Storage f...
26 - Gbuzozie 38L Round Laundry Hamper Cute Mermaid Gir...
27 - Tiita Comfy Saucer Chair, Soft Faux Fur Oversized ...
28 - Summer Desk Decor,Welcome Summer Wood Block Sign D...
29 - Homebeez 39.1" Length Bedroom Storage Bench, End B...
30 - Flash Furniture Webb Commercial Grade 24" Round Bl...
31 - Mellow 2 Inch Ventilated Memory Foam Mattress Topp...
32 - CangLong Mid Century Modern Side Chair with Wood L...
33 - HomePop Metal Accent Table Triangle Base Round Mir...
34 - MAEPA RV Shoe Storage for Bedside - 8 Extra Large ...
35 - NearMoon Hand Towel Holder/Towel Ring - Bathroom T...
36 - FLYJOE Narrow Side Table with PU Leather Magazine ...
37 - HomePop Home Decor | K2380-YDQY-2 | Luxury Large F...
38 - Moroccan Leather Pouf Ottoman for Living Room - Ro...
39 - AnyDesign Christmas Welcome Doormat Decorative Xma...
40 - GXFC ZHAO Welcome Funny Door Mat Shoes and Bras Of...
41 - LEASYLIFE Black Metal Trash can,10L/2.6GAL,Open To...
42 - Solid Wood Wine Cabinet, bar Rack - Home Wood Furn...
43 - Black Leather Office Chair Mid Back Leather Desk C...
44 - Convenience Concepts Tucson Flip Top End Table wit...
45 - 3-Tier Kitchen Storage Cart with Handle, Multifunc...
46 - Mimoglad Office Chair, High Back Ergonomic Desk Ch...
47 - Let the Adventure Begin Door Mat 17"x30" Decorativ...
48 - 1 Pack Adjustable Height Center Support Leg for Be...
49 - Stylo Culture Traditional Cotton Patchwork Embroid...`
```
```
`df.head()`
```
||title|primary\_image|style|material|color|url|keywords|img\_description|caption|
|0|GOYMFK 1pc Free Standing Shoe Rack, Multi-laye...|https://m.media-amazon.com/images/I/416WaLx10j...|Modern|Metal|White|https://www.amazon.com/dp/B0CJHKVG6P|[shoe rack, metal, white, multi-layer, hooks]|The GOYMFK Free Standing Shoe Rack is a versat...|Sleek white multi-layer metal free-standing sh...|
|1|subrtex Leather ding Room, Dining Chairs Set o...|https://m.media-amazon.com/images/I/31SejUEWY7...|Black Rubber Wood|Sponge|Black|https://www.amazon.com/dp/B0B66QHB23|[dining chair, leather, black]|The Subrtex Leather Dining Chairs come in a se...|Set of 2 modern black faux leather dining chai...|
|2|Plant Repotting Mat MUYETOL Waterproof Transpl...|https://m.media-amazon.com/images/I/41RgefVq70...|Modern|Polyethylene|Green|https://www.amazon.com/dp/B0BXRTWLYK|[repotting mat, waterproof, portable, foldable...|The Plant Repotting Mat is a portable and fold...|Vibrant green waterproof plant repotting mat|
|3|Pickleball Doormat, Welcome Doormat Absorbent ...|https://m.media-amazon.com/images/I/61vz1Igler...|Modern|Rubber|A5589|https://www.amazon.com/dp/B0C1MRB2M8|[doormat, absorbent, non-slip, coconut fiber, ...|The Pickleball Doormat is a charming welcome m...|Coir welcome mat featuring a playful "It's a g...|
|4|JOIN IRON Foldable TV Trays for Eating Set of ...|https://m.media-amazon.com/images/I/41p4d4VJnN...|X Classic Style|Iron|Grey Set of 4|https://www.amazon.com/dp/B0CG1N9QRC|[tv tray, foldable, metal, grey]|The JOIN IRON Foldable TV Tray Set includes fo...|Set of 4 foldable grey TV trays with durable b...|
```
`data\_path = "data/items\_tagged\_and\_captioned.csv"`
```
```
`# Saving locally for later - optional: do not execute if you prefer to use the provided file
df.to\_csv(data\_path, index=False)`
```
```
`# Optional: load data from saved file if you haven't processed the whole dataset
df = pd.read\_csv(data\_path)`
```
### Embedding captions and keywords
We can now use the generated captions and keywords to match relevant content to an input text query or caption.
To do this, we will embed a combination of keywords + captions.
Note: creating the embeddings will take \~3 mins to run. Feel free to load the pre-processed dataset (see below).
```
`df\_search = df.copy()`
```
```
`def embed\_tags\_caption(x):
if x['caption'] != '':
try:
keywords\_string = ",".join(k for k in x['keywords']) + '\\n'
content = keywords\_string + x['caption']
embedding = get\_embedding(content)
return embedding
except Exception as e:
print(f"Error creating embedding for {x}: {e}")`
```
```
`df\_search['embedding'] = df\_search.apply(lambda x: embed\_tags\_caption(x), axis=1)`
```
```
`Error creating embedding for title Suptsifira Shoe storage box, 24 Packs Shoe Box...
primary\_image https://m.media-amazon.com/images/I/51enKGSxK8...
style NaN
material Porcelain
color White
url https://www.amazon.com/dp/B0BZ85JVBN
keywords NaN
img\_description NaN
caption NaN
Name: 50, dtype: object: 'float' object is not iterable
Error creating embedding for title Wellynap Computer Desk,31.5 inches Folding Tab...
primary\_image https://m.media-amazon.com/images/I/51pO-N48te...
style Modern
material Wood
color Teak & Black
url https://www.amazon.com/dp/B0CFL2G31X
keywords NaN
img\_description NaN
caption NaN
Name: 51, dtype: object: 'float' object is not iterable
Error creating embedding for title Smlttel Gold Clothing Rack With Shelves, Gold ...
primary\_image https://m.media-amazon.com/images/I/41aRwocdfA...
style Modern
material Metal
color C gold
url https://www.amazon.com/dp/B0B93TC1Z8
keywords NaN
img\_description NaN
caption NaN
Name: 52, dtype: object: 'float' object is not iterable
Error creating embedding for title Franklin Sports NFL Storage Ottoman + Containe...
primary\_image https://m.media-amazon.com/images/I/31ptZB+wS-...
style Team Licensed Storage Ottoman with Detachable Lid
material Fabric
color Team Color
url https://www.amazon.com/dp/B0787KRJ8S
keywords NaN
img\_description NaN
caption NaN
Name: 53, dtype: object: 'float' object is not iterable
Error creating embedding for title Honey-Can-Do 3-Tier Nesting Bamboo Shoe Rack S...
primary\_image https://m.media-amazon.com/images/I/51GnnjKaVs...
style Shoe
material NaN
color NaN
url https://www.amazon.com/dp/B08WRLKR7T
keywords NaN
img\_description NaN
caption NaN
Name: 54, dtype: object: 'float' object is not iterable
Error creating embedding for title Furnistar 15.9 inch Modern Round Velvet Storag...
primary\_image https://m.media-amazon.com/images/I/31IBS5mzYS...
style Modern
material Wood
color Grey
url https://www.amazon.com/dp/B0C4NT8N8C
keywords NaN
img\_description NaN
caption NaN
Name: 55, dtype: object: 'float' object is not iterable
Error creating embedding for title AMHANCIBLE C Shaped Side Table, End Tables Set...
primary\_image https://m.media-amazon.com/images/I/41qDAGoNCr...
style Straight Leg
material Engineered Wood
color Black
url https://www.amazon.com/dp/B0BT9SVN1V
keywords NaN
img\_description NaN
caption NaN
Name: 56, dtype: object: 'float' object is not iterable
Error creating embedding for title LONGWIN Black Hanging Wall Round Mirror Decor ...
primary\_image https://m.media-amazon.com/images/I/41kC6cU5HX...
style Modern
material Glass, Metal
color Black
url https://www.amazon.com/dp/B094F897P3
keywords NaN
img\_description NaN
caption NaN
Name: 57, dtype: object: 'float' object is not iterable
Error creating embedding for title Need Fold Wall Mounted Workbench Folding Wall ...
primary\_image https://m.media-amazon.com/images/I/31SqvdFCut...
style Modern
material Metal
color Teak Color Desktop & Warm White Folding Brackets
url https://www.amazon.com/dp/B00UV7B29A
keywords NaN
img\_description NaN
caption NaN
Name: 58, dtype: object: 'float' object is not iterable
Error creating embedding for title Big Joe Fuf XL Cover Only Machine Washable, Gr...
primary\_image https://m.media-amazon.com/images/I/21ysztDdCY...
style Plush
material NaN
color Grey
url https://www.amazon.com/dp/B08T7JP8ZN
keywords NaN
img\_description NaN
caption NaN
Name: 59, dtype: object: 'float' object is not iterable
Error creating embedding for title Plymor Rectangle 5mm Beveled Glass Mirror, 6 i...
primary\_image https://m.media-amazon.com/images/I/31wigA5chu...
style NaN
material Glass
color Silver
url https://www.amazon.com/dp/B09F3SGZ8Y
keywords NaN
img\_description NaN
caption NaN
Name: 60, dtype: object: 'float' object is not iterable
Error creating embedding for title TIMCORR CD Case DVD Holder Storage: 144 Capaci...
primary\_image https://m.media-amazon.com/images/I/411Q2ETwel...
style Portable
material EVA + PVC + PP + Non-woven fabric
color Black
url https://www.amazon.com/dp/B0B19ZGGXC
keywords NaN
img\_description NaN
caption NaN
Name: 61, dtype: object: 'float' object is not iterable
Error creating embedding for title Ginger Cayden Closed Towel Ring - 4905/SN - Sa...
primary\_image https://m.media-amazon.com/images/I/31LNv7QILd...
style NaN
material Brass
color Satin Nickel
url https://www.amazon.com/dp/B00U0ECLG2
keywords NaN
img\_description NaN
caption NaN
Name: 62, dtype: object: 'float' object is not iterable
Error creating embedding for title Brightify Black Bathroom Mirrors for Wall, 24 ...
primary\_image https://m.media-amazon.com/images/I/510A0nIdGZ...
style Modern
material Aluminum
color Black
url https://www.amazon.com/dp/B0C2HNGCRX
keywords NaN
img\_description NaN
caption NaN
Name: 63, dtype: object: 'float' object is not iterable
Error creating embedding for title SogesHome Wood Corner Cabinet Wall Corner Stor...
primary\_image https://m.media-amazon.com/images/I/41BTUFVwm+...
style Open Frame
material NaN
color White&teak
url https://www.amazon.com/dp/B0C3B4D4RH
keywords NaN
img\_description NaN
caption NaN
Name: 64, dtype: object: 'float' object is not iterable
Error creating embedding for title Toy Storage for Lego Play Mat Bag - Duplo Toy ...
primary\_image https://m.media-amazon.com/images/I/51KKvmDCqB...
style NaN
material Nylon
color Orange
url https://www.amazon.com/dp/B0B4CL1M1M
keywords NaN
img\_description NaN
caption NaN
Name: 65, dtype: object: 'float' object is not iterable
Error creating embedding for title Flash Furniture Jefferson 2 Pk. Contemporary B...
primary\_image https://m.media-amazon.com/images/I/41GYYVLfGj...
style Contemporary
material NaN
color Brown
url https://www.amazon.com/dp/B00FEAN1SY
keywords NaN
img\_description NaN
caption NaN
Name: 66, dtype: object: 'float' object is not iterable
Error creating embedding for title Hong Art- Metal Mirror-Matt Black,Glass Panel ...
primary\_image https://m.media-amazon.com/images/I/31XytAHobH...
style Classic
material Metal
color Black
url https://www.amazon.com/dp/B08GSH4KVM
keywords NaN
img\_description NaN
caption NaN
Name: 67, dtype: object: 'float' object is not iterable
Error creating embedding for title Convenience Concepts American Heritage Round E...
primary\_image https://m.media-amazon.com/images/I/311rmB9BDW...
style Round End Table
material Solid + Manufactured Wood,Particle Board/Chipb...
color Pink
url https://www.amazon.com/dp/B01B65BYYI
keywords NaN
img\_description NaN
caption NaN
Name: 68, dtype: object: 'float' object is not iterable
Error creating embedding for title Flash Furniture Diamond Black Vinyl Luxurious ...
primary\_image https://m.media-amazon.com/images/I/41LYsAMww6...
style Fixed
material Foam
color Black Vinyl
url https://www.amazon.com/dp/B000TMHWGO
keywords NaN
img\_description NaN
caption NaN
Name: 69, dtype: object: 'float' object is not iterable
Error creating embedding for title Gatco 1918, Modern Rectangle Waste Basket, Mat...
primary\_image https://m.media-amazon.com/images/I/31dnAVaEmv...
style Rectangle
material Stainless Steel
color Matte Black
url https://www.amazon.com/dp/B07TXMJ5FQ
keywords NaN
img\_description NaN
caption NaN
Name: 70, dtype: object: 'float' object is not iterable
Error creating embedding for title Winrise Office Chair Ergonomic Desk Chair, Hig...
primary\_image https://m.media-amazon.com/images/I/41hCFaVIC+...
style Straight
material Sponge
color S-black
url https://www.amazon.com/dp/B0CGQZBCZP
keywords NaN
img\_description NaN
caption NaN
Name: 71, dtype: object: 'float' object is not iterable
Error creating embedding for title Adeco Euro Style Fabric Arm Bench Chair Footst...
primary\_image https://m.media-amazon.com/images/I/41hUc8c+DC...
style Modern
material Engineered Wood
color Brown
url https://www.amazon.com/dp/B017TNJR72
keywords NaN
img\_description NaN
caption NaN
Name: 72, dtype: object: 'float' object is not iterable
Error creating embedding for title Motiv 0202/PC Sine 18-In Towel Bar, Polished C...
primary\_image https://m.media-amazon.com/images/I/31a6GfenW0...
style NaN
material Brass
color 18" Towel Bar
url https://www.amazon.com/dp/B001AS8D82
keywords NaN
img\_description NaN
caption NaN
Name: 73, dtype: object: 'float' object is not iterable
Error creating embedding for title Imports Décor PVC Backed Coir Doormat, Eighth ...
primary\_image https://m.media-amazon.com/images/I/51H9lDOICr...
style Art Deco
material Vinyl
color Black and Beige
url https://www.amazon.com/dp/B08WF83LMF
keywords NaN
img\_description NaN
caption NaN
Name: 74, dtype: object: 'float' object is not iterable
Error creating embedding for title Croydex Chester Square Flexi-Fix Wall Mounted ...
primary\_image https://m.media-amazon.com/images/I/41sDO1HW2c...
style NaN
material NaN
color Silver
url https://www.amazon.com/dp/B09DGFRM4B
keywords NaN
img\_description NaN
caption NaN
Name: 75, dtype: object: 'float' object is not iterable
Error creating embedding for title itbe Easy Fit Ready-to-Assemble Multipurpose O...
primary\_image https://m.media-amazon.com/images/I/21NWASZgUV...
style Flat Panel
material Alloy Steel
color Blue
url https://www.amazon.com/dp/B09FR4XSCT
keywords NaN
img\_description NaN
caption NaN
Name: 76, dtype: object: 'float' object is not iterable
Error creating embedding for title Delta ARV18-DN Arvo 18-in Wall Mount Towel Bar...
primary\_image https://m.media-amazon.com/images/I/11zzs81fXB...
style 18" Towel Bar with 6" Extender
material Multiple Base Materials
color Spotshield Brushed Nickel
url https://www.amazon.com/dp/B09LVSZRZS
keywords NaN
img\_description NaN
caption NaN
Name: 77, dtype: object: 'float' object is not iterable
Error creating embedding for title Bamboo Waste Basket | Waste Basket for Bathroo...
primary\_image https://m.media-amazon.com/images/I/318RY00VlI...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B08VWTB8CH
keywords NaN
img\_description NaN
caption NaN
Name: 78, dtype: object: 'float' object is not iterable
Error creating embedding for title Way Basics Vinyl Record Storage - 2 Tier Book ...
primary\_image https://m.media-amazon.com/images/I/41YMttt7a5...
style Modern
material Recycled Material
color White
url https://www.amazon.com/dp/B075M1PKSW
keywords NaN
img\_description NaN
caption NaN
Name: 79, dtype: object: 'float' object is not iterable
Error creating embedding for title TocTen Double Bath Towel Bar - Thicken SUS304 ...
primary\_image https://m.media-amazon.com/images/I/41cFJKXyA5...
style NaN
material Stainless Steel
color Matte Black
url https://www.amazon.com/dp/B0BWRVGQRM
keywords NaN
img\_description NaN
caption NaN
Name: 80, dtype: object: 'float' object is not iterable
Error creating embedding for title MoNiBloom Adjustable Bar Stools Set of 2, 360°...
primary\_image https://m.media-amazon.com/images/I/41jD28iN4b...
style Straight
material NaN
color Dark Grey
url https://www.amazon.com/dp/B0CB7SG59J
keywords NaN
img\_description NaN
caption NaN
Name: 81, dtype: object: 'float' object is not iterable
Error creating embedding for title LANTEFUL Shoe Rack Organizer Shoe Storage Cabi...
primary\_image https://m.media-amazon.com/images/I/51e8SrHHW3...
style free standing shoe racks
material NaN
color Black
url https://www.amazon.com/dp/B0C3QDL2XW
keywords NaN
img\_description NaN
caption NaN
Name: 82, dtype: object: 'float' object is not iterable
Error creating embedding for title ANDY STAR 24x32 INCH Brushed Nickel Mirror, Ro...
primary\_image https://m.media-amazon.com/images/I/41MQWfATgg...
style NaN
material Stainless Steel
color Brushed Nickel
url https://www.amazon.com/dp/B0CBRGS5D7
keywords NaN
img\_description NaN
caption NaN
Name: 83, dtype: object: 'float' object is not iterable
Error creating embedding for title MJL Furniture Designs Upholstered Cubed/Square...
primary\_image https://m.media-amazon.com/images/I/410tv-zDYX...
style Contemporary
material Wood
color Smoke Grey
url https://www.amazon.com/dp/B01D378FYE
keywords NaN
img\_description NaN
caption NaN
Name: 84, dtype: object: 'float' object is not iterable
Error creating embedding for title Cpintltr Small Foot Stool Ottoman Modern Accen...
primary\_image https://m.media-amazon.com/images/I/51CjfUJVuL...
style NaN
material Pine
color Green
url https://www.amazon.com/dp/B0CKPFKDZY
keywords NaN
img\_description NaN
caption NaN
Name: 85, dtype: object: 'float' object is not iterable
Error creating embedding for title YuiHome Extendable Round, Farmhouse 16" Leaf T...
primary\_image https://m.media-amazon.com/images/I/5175Qzg03L...
style Farmhouse
material Rubber Wood, Engineered Wood
color Natural Wood Wash
url https://www.amazon.com/dp/B0CHVQ6BC5
keywords NaN
img\_description NaN
caption NaN
Name: 86, dtype: object: 'float' object is not iterable
Error creating embedding for title Ergonomic Office Chair,Office Chair, with Lumb...
primary\_image https://m.media-amazon.com/images/I/51vnoZERmP...
style With arms
material Foam
color All Black
url https://www.amazon.com/dp/B0CBBV4S1P
keywords NaN
img\_description NaN
caption NaN
Name: 87, dtype: object: 'float' object is not iterable
Error creating embedding for title Kate and Laurel Celia Round Metal Foldable Acc...
primary\_image https://m.media-amazon.com/images/I/31ZMqrgDD8...
style Modern
material Iron
color Black
url https://www.amazon.com/dp/B084WLY61H
keywords NaN
img\_description NaN
caption NaN
Name: 88, dtype: object: 'float' object is not iterable
Error creating embedding for title Lizipai Floating Bedside Table, No Assembly Re...
primary\_image https://m.media-amazon.com/images/I/41HBX6be98...
style no
material Wood
color White
url https://www.amazon.com/dp/B09NBWCTDS
keywords NaN
img\_description NaN
caption NaN
Name: 89, dtype: object: 'float' object is not iterable
Error creating embedding for title CordaRoy's Chenille Bean Bag Ottoman Footstool...
primary\_image https://m.media-amazon.com/images/I/51HpCirQNA...
style Modern
material Engineered Wood
color Rainforest
url https://www.amazon.com/dp/B0BSZ96YG7
keywords NaN
img\_description NaN
caption NaN
Name: 90, dtype: object: 'float' object is not iterable
Error creating embedding for title Plebs Home Solid Desktop Store Cart, with Rubb...
primary\_image https://m.media-amazon.com/images/I/51WFQwBEqj...
style Slab
material Wood
color Dark Blue
url https://www.amazon.com/dp/B0CD7FSWMK
keywords NaN
img\_description NaN
caption NaN
Name: 91, dtype: object: 'float' object is not iterable
Error creating embedding for title ErGear Ergonomic Desk Chair, Office Chair with...
primary\_image https://m.media-amazon.com/images/I/41C4FUmS-h...
style With arms
material Memory Foam
color Black
url https://www.amazon.com/dp/B0C99D3V15
keywords NaN
img\_description NaN
caption NaN
Name: 92, dtype: object: 'float' object is not iterable
Error creating embedding for title Kingston Brass Millennium Towel-Ring, 7.63", O...
primary\_image https://m.media-amazon.com/images/I/31+kzwXTjx...
style NaN
material Brass
color Oil Rubbed Bronze
url https://www.amazon.com/dp/B00FM0WG7I
keywords NaN
img\_description NaN
caption NaN
Name: 93, dtype: object: 'float' object is not iterable
Error creating embedding for title Homebeez 18.9" Round Velvet Storage Ottoman Mu...
primary\_image https://m.media-amazon.com/images/I/51vTxE-9lH...
style Modern
material Wood
color Orange
url https://www.amazon.com/dp/B09DKG6JDN
keywords NaN
img\_description NaN
caption NaN
Name: 94, dtype: object: 'float' object is not iterable
Error creating embedding for title Mickey and Friends Collapsible Nylon Basket Bu...
primary\_image https://m.media-amazon.com/images/I/410mEc5bbl...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0B7Q5LB2C
keywords NaN
img\_description NaN
caption NaN
Name: 95, dtype: object: 'float' object is not iterable
Error creating embedding for title Homepop Home Decor | Backless Nailhead Trim Co...
primary\_image https://m.media-amazon.com/images/I/41HPIScA4s...
style Contemporary
material NaN
color Blue
url https://www.amazon.com/dp/B01LWPSVUW
keywords NaN
img\_description NaN
caption NaN
Name: 96, dtype: object: 'float' object is not iterable
Error creating embedding for title Camco Life Is Better at The Campsite Outdoor &...
primary\_image https://m.media-amazon.com/images/I/51DN2is3Zj...
style Outdoor & Indoor
material Rubber
color Blue
url https://www.amazon.com/dp/B07D7RQNJV
keywords NaN
img\_description NaN
caption NaN
Name: 97, dtype: object: 'float' object is not iterable
Error creating embedding for title MoNiBloom Round Folding Faux Fur Saucer Chair ...
primary\_image https://m.media-amazon.com/images/I/41eoFKL3gK...
style Modern
material Polyester
color Burgundy
url https://www.amazon.com/dp/B0CD7TH3BF
keywords NaN
img\_description NaN
caption NaN
Name: 98, dtype: object: 'float' object is not iterable
Error creating embedding for title YMYNY Vanity Stool Chair with Storage, Square ...
primary\_image https://m.media-amazon.com/images/I/519Am3LPMv...
style Modern
material NaN
color Dusty Blue
url https://www.amazon.com/dp/B0C1NSNDW2
keywords NaN
img\_description NaN
caption NaN
Name: 99, dtype: object: 'float' object is not iterable
Error creating embedding for title Casual Home 5 Piece Tray Table Set, Espresso
primary\_image https://m.media-amazon.com/images/I/41WweDJqgZ...
style Tray Table Set
material Wood
color Espresso
url https://www.amazon.com/dp/B0069H9BYO
keywords NaN
img\_description NaN
caption NaN
Name: 100, dtype: object: 'float' object is not iterable
Error creating embedding for title Simplify Hanging Grey 20-Pocket Shoe Boho Clos...
primary\_image https://m.media-amazon.com/images/I/41eYiOqsld...
style NaN
material 80% Linen printed nonwoven +20% solid nonwoven...
color Grey
url https://www.amazon.com/dp/B09J1RM23P
keywords NaN
img\_description NaN
caption NaN
Name: 101, dtype: object: 'float' object is not iterable
Error creating embedding for title Get Set Style Black Glass Side Table, Square G...
primary\_image https://m.media-amazon.com/images/I/51gG6ukN1n...
style Modern and Elegant
material Tempered Glass
color Shiny Black
url https://www.amazon.com/dp/B0C5DH6ZY6
keywords NaN
img\_description NaN
caption NaN
Name: 102, dtype: object: 'float' object is not iterable
Error creating embedding for title Watson & Whitely Swivel Bar Stools Set of 2, F...
primary\_image https://m.media-amazon.com/images/I/41nDc6aFKo...
style Modern
material NaN
color Black
url https://www.amazon.com/dp/B0CKQTTZ5V
keywords NaN
img\_description NaN
caption NaN
Name: 103, dtype: object: 'float' object is not iterable
Error creating embedding for title Sweet Jojo Designs Boho Rainbow Girl Ottoman P...
primary\_image https://m.media-amazon.com/images/I/31nn4NwuKf...
style Shabby Chic
material Engineered Wood
color Multi Color
url https://www.amazon.com/dp/B0BZJYM4Q6
keywords NaN
img\_description NaN
caption NaN
Name: 104, dtype: object: 'float' object is not iterable
Error creating embedding for title Pekokavo Sofa Arm Clip Tray, Side Table for Re...
primary\_image https://m.media-amazon.com/images/I/51yz-83kj+...
style Modern
material Bamboo
color Bamboo
url https://www.amazon.com/dp/B08SL4GH7G
keywords NaN
img\_description NaN
caption NaN
Name: 105, dtype: object: 'float' object is not iterable
Error creating embedding for title Caroline's Treasures JMA2013HRM2858 Seaweed Sa...
primary\_image https://m.media-amazon.com/images/I/514qJ5aPtb...
style Modern
material Rubber
color Multicolored
url https://www.amazon.com/dp/B07SPYM4M5
keywords NaN
img\_description NaN
caption NaN
Name: 106, dtype: object: 'float' object is not iterable
Error creating embedding for title Xchouxer Side Tables Natural Bamboo Sofa Armre...
primary\_image https://m.media-amazon.com/images/I/511LXRAxI+...
style Modern
material Bamboo
color Beige
url https://www.amazon.com/dp/B08FC5HPBS
keywords NaN
img\_description NaN
caption NaN
Name: 107, dtype: object: 'float' object is not iterable
Error creating embedding for title Montessori Learning Toddler Tower, Foldable To...
primary\_image https://m.media-amazon.com/images/I/51n9ojprZE...
style Modern
material Wood
color Wood
url https://www.amazon.com/dp/B0CKMRJ1H9
keywords NaN
img\_description NaN
caption NaN
Name: 108, dtype: object: 'float' object is not iterable
Error creating embedding for title PAK HOME Set of 2 High Gloss Brown Marble Look...
primary\_image https://m.media-amazon.com/images/I/51u3oxvEiS...
style Tripod
material Wood
color Brown Marble High Gloss / Gold Legs
url https://www.amazon.com/dp/B09K3MYL91
keywords NaN
img\_description NaN
caption NaN
Name: 109, dtype: object: 'float' object is not iterable
Error creating embedding for title kukli kitchen Spring Door Mat 30 X 17 Inch - S...
primary\_image https://m.media-amazon.com/images/I/61rRHgR+aE...
style Classic
material Rubber
color Color-33
url https://www.amazon.com/dp/B0BNL8CC5X
keywords NaN
img\_description NaN
caption NaN
Name: 110, dtype: object: 'float' object is not iterable
Error creating embedding for title Dewhut Oversized Pumpkin Couch Accent Chair, M...
primary\_image https://m.media-amazon.com/images/I/519KoH2aW4...
style Modern
material Sponge
color Navy
url https://www.amazon.com/dp/B0CF8HTCS4
keywords NaN
img\_description NaN
caption NaN
Name: 111, dtype: object: 'float' object is not iterable
Error creating embedding for title Toland Home Garden 800009 Gypsy Garden Flower ...
primary\_image https://m.media-amazon.com/images/I/61gTdPHg5Q...
style Outdoor & Indoor
material Rubber
color NaN
url https://www.amazon.com/dp/B00PNJAACG
keywords NaN
img\_description NaN
caption NaN
Name: 112, dtype: object: 'float' object is not iterable
Error creating embedding for title Sintosin Vintage Oval Mirrors for Wall Decor 1...
primary\_image https://m.media-amazon.com/images/I/41NiOP0+4j...
style Shabby Chic
material Wood
color Oval
url https://www.amazon.com/dp/B0BWJLZF5G
keywords NaN
img\_description NaN
caption NaN
Name: 113, dtype: object: 'float' object is not iterable
Error creating embedding for title BEWISHOME Vanity Stool, Bedroom Vanity Chair w...
primary\_image https://m.media-amazon.com/images/I/410emoPl2k...
style Modern
material NaN
color Black
url https://www.amazon.com/dp/B0B6FML1VS
keywords NaN
img\_description NaN
caption NaN
Name: 114, dtype: object: 'float' object is not iterable
Error creating embedding for title Children's Factory School Age High Back Lounge...
primary\_image https://m.media-amazon.com/images/I/51ORnRyifR...
style Single Seat
material NaN
color Blue-red
url https://www.amazon.com/dp/B00740P05Y
keywords NaN
img\_description NaN
caption NaN
Name: 115, dtype: object: 'float' object is not iterable
Error creating embedding for title FLYJOE Shoe Rack Bench, 3-Tier Freestanding Wo...
primary\_image https://m.media-amazon.com/images/I/51WQiiIyuS...
style NaN
material NaN
color Rustic Walnut
url https://www.amazon.com/dp/B0CN8NXR1Q
keywords NaN
img\_description NaN
caption NaN
Name: 116, dtype: object: 'float' object is not iterable
Error creating embedding for title FLYZC Counter Height Bar Stools Set of 4, Stoo...
primary\_image https://m.media-amazon.com/images/I/51jw0SXQMW...
style Straight
material NaN
color Grey & Black
url https://www.amazon.com/dp/B0CH862BV2
keywords NaN
img\_description NaN
caption NaN
Name: 117, dtype: object: 'float' object is not iterable
Error creating embedding for title SITMOD Gaming Chairs for Adults with Footrest-...
primary\_image https://m.media-amazon.com/images/I/41bntfm39U...
style With arms
material Memory Foam
color Grey
url https://www.amazon.com/dp/B0B3HM3FTZ
keywords NaN
img\_description NaN
caption NaN
Name: 118, dtype: object: 'float' object is not iterable
Error creating embedding for title CM Cosmos Stuffed Animal Storage Bean Bag Chai...
primary\_image https://m.media-amazon.com/images/I/41XEtwrKqo...
style NaN
material NaN
color Grey & White
url https://www.amazon.com/dp/B07JCPZDSL
keywords NaN
img\_description NaN
caption NaN
Name: 119, dtype: object: 'float' object is not iterable
Error creating embedding for title Cionyce 4 Pcs Sectional Couch Connectors, Pin ...
primary\_image https://m.media-amazon.com/images/I/41sejv2mO6...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B09V6RSWSR
keywords NaN
img\_description NaN
caption NaN
Name: 120, dtype: object: 'float' object is not iterable
Error creating embedding for title Tiita Saucer Chair with Ottoman, Soft Faux Fur...
primary\_image https://m.media-amazon.com/images/I/51C5YkDdUy...
style Garden
material NaN
color Beige With Ottoman
url https://www.amazon.com/dp/B0BWDJ8NSM
keywords NaN
img\_description NaN
caption NaN
Name: 121, dtype: object: 'float' object is not iterable
Error creating embedding for title Grandmother Birthday Gifts Compact Makeup Mirr...
primary\_image https://m.media-amazon.com/images/I/417J95lDDa...
style NaN
material Stainless Steel
color For Grandmother
url https://www.amazon.com/dp/B0C289KQNK
keywords NaN
img\_description NaN
caption NaN
Name: 122, dtype: object: 'float' object is not iterable
Error creating embedding for title GIA 24-Inch Counter Height Square Backless Met...
primary\_image https://m.media-amazon.com/images/I/414M2Vz5Yj...
style Straight
material NaN
color Black
url https://www.amazon.com/dp/B0B75Z1T2H
keywords NaN
img\_description NaN
caption NaN
Name: 123, dtype: object: 'float' object is not iterable
Error creating embedding for title Vintage Desktop Apothecary Cabinet with 3 Draw...
primary\_image https://m.media-amazon.com/images/I/41yz4PMNd0...
style drawer,wood
material Wood
color Mahogany Wood Brown
url https://www.amazon.com/dp/B0B24KQJS9
keywords NaN
img\_description NaN
caption NaN
Name: 124, dtype: object: 'float' object is not iterable
Error creating embedding for title WAYTRIM Dresser Storage Tower, 4 Fabric Organi...
primary\_image https://m.media-amazon.com/images/I/41DfHAtQUK...
style Modern
material NaN
color Camel
url https://www.amazon.com/dp/B07W56HHX5
keywords NaN
img\_description NaN
caption NaN
Name: 125, dtype: object: 'float' object is not iterable
Error creating embedding for title Power Recliner Power Supply Kit-4-Piece Univer...
primary\_image https://m.media-amazon.com/images/I/51N6Zq4kxx...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0BHVLGGYL
keywords NaN
img\_description NaN
caption NaN
Name: 126, dtype: object: 'float' object is not iterable
Error creating embedding for title Anna Stay Wine Rack Wall Mounted - Decorative ...
primary\_image https://m.media-amazon.com/images/I/51K1wX04DX...
style Modern
material NaN
color Wine Gold
url https://www.amazon.com/dp/B09ZQM2FX3
keywords NaN
img\_description NaN
caption NaN
Name: 127, dtype: object: 'float' object is not iterable
Error creating embedding for title Lufeiya Small Computer Desk with 2 Drawers for...
primary\_image https://m.media-amazon.com/images/I/41zNNJV-QU...
style Country Rustic
material Engineered Wood
color Rustic Brown
url https://www.amazon.com/dp/B0CB5G1BHX
keywords NaN
img\_description NaN
caption NaN
Name: 128, dtype: object: 'float' object is not iterable
Error creating embedding for title Watson & Whitely Swivel Bar Stools Set of 2, F...
primary\_image https://m.media-amazon.com/images/I/41IWqaJGuW...
style Modern
material NaN
color White (Multi-colored)
url https://www.amazon.com/dp/B0BV6KR1T7
keywords NaN
img\_description NaN
caption NaN
Name: 129, dtype: object: 'float' object is not iterable
Error creating embedding for title Adeco Large Square Storage Ottoman Bench, Tuft...
primary\_image https://m.media-amazon.com/images/I/31HEdjZpCb...
style Mid-Century Modern
material Wood
color Orange Brown
url https://www.amazon.com/dp/B0C6XNNL9M
keywords NaN
img\_description NaN
caption NaN
Name: 130, dtype: object: 'float' object is not iterable
Error creating embedding for title New Classic Furniture Evander Wood End Table w...
primary\_image https://m.media-amazon.com/images/I/51TJVV3sRq...
style Contemporary
material Wood
color Two Tone Cream/Brown
url https://www.amazon.com/dp/B0B6YR22H1
keywords NaN
img\_description NaN
caption NaN
Name: 131, dtype: object: 'float' object is not iterable
Error creating embedding for title Lipper International Wooden Storage Crate, whi...
primary\_image https://m.media-amazon.com/images/I/31MZPtCF0R...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B07MZRYQ2X
keywords NaN
img\_description NaN
caption NaN
Name: 132, dtype: object: 'float' object is not iterable
Error creating embedding for title Amazon Basics Kids Adjustable Mesh Low-Back Sw...
primary\_image https://m.media-amazon.com/images/I/41bsjzUI6N...
style Mesh
material NaN
color Red
url https://www.amazon.com/dp/B0BHF9PPJC
keywords NaN
img\_description NaN
caption NaN
Name: 133, dtype: object: 'float' object is not iterable
Error creating embedding for title Joovy Coo Bassinet, Portable Bassinet with Sto...
primary\_image https://m.media-amazon.com/images/I/41UOfS3Jmk...
style NaN
material fabric
color NaN
url https://www.amazon.com/dp/B07NFSLLCG
keywords NaN
img\_description NaN
caption NaN
Name: 134, dtype: object: 'float' object is not iterable
Error creating embedding for title Halatua 6ftlarge Fur Bean Bag Cover Lazy Sofa ...
primary\_image https://m.media-amazon.com/images/I/51-utQ4pnb...
style NaN
material Polyester
color Snowblue
url https://www.amazon.com/dp/B0C7L8GGJF
keywords NaN
img\_description NaN
caption NaN
Name: 135, dtype: object: 'float' object is not iterable
Error creating embedding for title Flash Furniture Walker Small Rustic Natural Ho...
primary\_image https://m.media-amazon.com/images/I/31QOFqtaHJ...
style Sled
material Engineered Wood
color Rustic
url https://www.amazon.com/dp/B08JWJTZ1Y
keywords NaN
img\_description NaN
caption NaN
Name: 136, dtype: object: 'float' object is not iterable
Error creating embedding for title BOKKOLIK Vintage Bar Stools Swivel PU Seat 29-...
primary\_image https://m.media-amazon.com/images/I/41PjcPoHTL...
style Soft PU Seat
material NaN
color Dark Brown
url https://www.amazon.com/dp/B0BG7MX77T
keywords NaN
img\_description NaN
caption NaN
Name: 137, dtype: object: 'float' object is not iterable
Error creating embedding for title Nalupatio Storage Ottoman, Bedroom End Bench，U...
primary\_image https://m.media-amazon.com/images/I/31+6K0Tbdp...
style Modern
material Wood
color Light Green
url https://www.amazon.com/dp/B0C48X7JQB
keywords NaN
img\_description NaN
caption NaN
Name: 138, dtype: object: 'float' object is not iterable
Error creating embedding for title Homevany Bamboo Wine Rack,4 Tier, Wine Bottle ...
primary\_image https://m.media-amazon.com/images/I/51DO5hfgdK...
style Modern
material NaN
color Brown
url https://www.amazon.com/dp/B08T8ZRZ1F
keywords NaN
img\_description NaN
caption NaN
Name: 139, dtype: object: 'float' object is not iterable
Error creating embedding for title Armen Living Julius 30" Cream Faux Leather and...
primary\_image https://m.media-amazon.com/images/I/31v34T0kgn...
style Straight
material NaN
color Cream/Walnut
url https://www.amazon.com/dp/B0961N94SZ
keywords NaN
img\_description NaN
caption NaN
Name: 140, dtype: object: 'float' object is not iterable
Error creating embedding for title WONSTART Vanity Mirror with Lights, 50 x 41cm ...
primary\_image https://m.media-amazon.com/images/I/41k7g8oo6b...
style Modern
material Aluminum, Glass
color Silver
url https://www.amazon.com/dp/B0C2VF2S6R
keywords NaN
img\_description NaN
caption NaN
Name: 141, dtype: object: 'float' object is not iterable
Error creating embedding for title Cpintltr Velvet Foot Rest Stool Multipurpose D...
primary\_image https://m.media-amazon.com/images/I/51K84REZCG...
style Modern
material Wood
color Dusty Pink
url https://www.amazon.com/dp/B0CH34CCLV
keywords NaN
img\_description NaN
caption NaN
Name: 142, dtype: object: 'float' object is not iterable
Error creating embedding for title uxcell Shredded Memory Foam Filling, 10 Pounds...
primary\_image https://m.media-amazon.com/images/I/51i6LeHlc9...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0C4DWRF3M
keywords NaN
img\_description NaN
caption NaN
Name: 143, dtype: object: 'float' object is not iterable
Error creating embedding for title FAMSINGO Ergonomic Mesh Office Chair, High Bac...
primary\_image https://m.media-amazon.com/images/I/41Jm-GtY+5...
style With arms
material Memory Foam
color Black
url https://www.amazon.com/dp/B0CBBMQPVC
keywords NaN
img\_description NaN
caption NaN
Name: 144, dtype: object: 'float' object is not iterable
Error creating embedding for title Serta Style Hannah II Office Chair, Harvard Pi...
primary\_image https://m.media-amazon.com/images/I/41XQ7R6j7l...
style with-arms
material Foam
color Harvard Pink
url https://www.amazon.com/dp/B07667648L
keywords NaN
img\_description NaN
caption NaN
Name: 145, dtype: object: 'float' object is not iterable
Error creating embedding for title Christmas 3D Illusion Doormat, Non-Slip Visual...
primary\_image https://m.media-amazon.com/images/I/51uOa02x4H...
style Classic
material 棉质
color Red
url https://www.amazon.com/dp/B0CC28VDSV
keywords NaN
img\_description NaN
caption NaN
Name: 146, dtype: object: 'float' object is not iterable
Error creating embedding for title Narrow Console Table with Power Strips, Sofa T...
primary\_image https://m.media-amazon.com/images/I/51FRxl-qgF...
style Sofa Table with Outlets
material MDF Board and Metal
color Black
url https://www.amazon.com/dp/B0BSHFVY3J
keywords NaN
img\_description NaN
caption NaN
Name: 147, dtype: object: 'float' object is not iterable
Error creating embedding for title AnRui Folding Floor Chair with Adjustable Back...
primary\_image https://m.media-amazon.com/images/I/51iuIrMVq+...
style Solid Back
material Foam
color Stripe
url https://www.amazon.com/dp/B08QRF4TTL
keywords NaN
img\_description NaN
caption NaN
Name: 148, dtype: object: 'float' object is not iterable
Error creating embedding for title sogesfurniture 5 Tier Free Standing Wooden Sho...
primary\_image https://m.media-amazon.com/images/I/51j2v3ij2u...
style Modern
material Engineered Wood
color NaN
url https://www.amazon.com/dp/B07WLK9TNS
keywords NaN
img\_description NaN
caption NaN
Name: 149, dtype: object: 'float' object is not iterable
Error creating embedding for title fengxiaomin-Plastic Bed Slat End Caps Holders ...
primary\_image https://m.media-amazon.com/images/I/41gvi7RjrZ...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CNVJ24YF
keywords NaN
img\_description NaN
caption NaN
Name: 150, dtype: object: 'float' object is not iterable
Error creating embedding for title MoNiBloom Massage Gaming Recliner Chair with S...
primary\_image https://m.media-amazon.com/images/I/41Md8gR4YY...
style Modern
material NaN
color Green
url https://www.amazon.com/dp/B0BZKMYST2
keywords NaN
img\_description NaN
caption NaN
Name: 151, dtype: object: 'float' object is not iterable
Error creating embedding for title SUNSLASH Wall Mounted Mirror, Arched Wall Mirr...
primary\_image https://m.media-amazon.com/images/I/41nGiqXS+5...
style NaN
material Aluminum
color Black（arched）
url https://www.amazon.com/dp/B0BP9QYFTL
keywords NaN
img\_description NaN
caption NaN
Name: 152, dtype: object: 'float' object is not iterable
Error creating embedding for title Allied Brass Carolina Crystal Collection Frame...
primary\_image https://m.media-amazon.com/images/I/21+UCtQ6p9...
style Antique
material Brass
color Antique Brass
url https://www.amazon.com/dp/B07ZSF42WD
keywords NaN
img\_description NaN
caption NaN
Name: 153, dtype: object: 'float' object is not iterable
Error creating embedding for title Home Source 40.7' Elegance Bar Server and Wine...
primary\_image https://m.media-amazon.com/images/I/41nYPK8Xbr...
style Fluted shape
material Walnut Wood
color Walnut
url https://www.amazon.com/dp/B0CN1LGXNP
keywords NaN
img\_description NaN
caption NaN
Name: 154, dtype: object: 'float' object is not iterable
Error creating embedding for title Shintenchi 60" Small Loveseat, 3 in 1 Cute Con...
primary\_image https://m.media-amazon.com/images/I/41SkpIbGdQ...
style Pillow-Top
material Wood
color Dark Gray
url https://www.amazon.com/dp/B0CMTHD198
keywords NaN
img\_description NaN
caption NaN
Name: 155, dtype: object: 'float' object is not iterable
Error creating embedding for title King Mattresses Bag for Moving Storage Protect...
primary\_image https://m.media-amazon.com/images/I/41ye8pFDZ9...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CN44TTFJ
keywords NaN
img\_description NaN
caption NaN
Name: 156, dtype: object: 'float' object is not iterable
Error creating embedding for title sawsile Asymmetrical Wall Mirror,Unique Gold V...
primary\_image https://m.media-amazon.com/images/I/41G-NEOXwf...
style NaN
material Wood, Iron
color Gold
url https://www.amazon.com/dp/B0CDWH5PQP
keywords NaN
img\_description NaN
caption NaN
Name: 157, dtype: object: 'float' object is not iterable
Error creating embedding for title Leather At Home, Decorative 13 Inch Rounded Pi...
primary\_image https://m.media-amazon.com/images/I/51ePbFDPNR...
style Classic
material Leather
color Bourbon Brown
url https://www.amazon.com/dp/B0BBKQ3XW9
keywords NaN
img\_description NaN
caption NaN
Name: 158, dtype: object: 'float' object is not iterable
Error creating embedding for title Hzuaneri Blanket Ladder Shelf for Living Room,...
primary\_image https://m.media-amazon.com/images/I/31XETwaX0W...
style Farmhouse
material NaN
color NaN
url https://www.amazon.com/dp/B0BSKY28M7
keywords NaN
img\_description NaN
caption NaN
Name: 159, dtype: object: 'float' object is not iterable
Error creating embedding for title 9 Inch lighted magnifying mirror with Adjustab...
primary\_image https://m.media-amazon.com/images/I/41j2FBzCCJ...
style Modern
material Alloy Steel
color Brushed Nickel
url https://www.amazon.com/dp/B0CMJCCT9C
keywords NaN
img\_description NaN
caption NaN
Name: 160, dtype: object: 'float' object is not iterable
Error creating embedding for title shopperals Large Black Fogless Handheld Shavin...
primary\_image https://m.media-amazon.com/images/I/413+UE2HxQ...
style NaN
material Plastic
color Black
url https://www.amazon.com/dp/B0CJCRFZCG
keywords NaN
img\_description NaN
caption NaN
Name: 161, dtype: object: 'float' object is not iterable
Error creating embedding for title Convenience Concepts French Country Desk, Drif...
primary\_image https://m.media-amazon.com/images/I/21Xa4sH6hP...
style French Country
material Engineered Wood
color Driftwood/White
url https://www.amazon.com/dp/B07D6TS5MR
keywords NaN
img\_description NaN
caption NaN
Name: 162, dtype: object: 'float' object is not iterable
Error creating embedding for title FurnitureR 27''H Round Drawer 2 Tiers Endtable...
primary\_image https://m.media-amazon.com/images/I/51VXthftc3...
style Mid-Century Modern
material Engineered Wood
color Green and Brown
url https://www.amazon.com/dp/B0BVYQTMNX
keywords NaN
img\_description NaN
caption NaN
Name: 163, dtype: object: 'float' object is not iterable
Error creating embedding for title Flash Furniture Contemporary Red Vinyl Rounded...
primary\_image https://m.media-amazon.com/images/I/41OOyTZhTz...
style Contemporary
material NaN
color Red
url https://www.amazon.com/dp/B00EAY2HTY
keywords NaN
img\_description NaN
caption NaN
Name: 164, dtype: object: 'float' object is not iterable
Error creating embedding for title Stylish Camping Ming's Mark RC4 Reversible Cla...
primary\_image https://m.media-amazon.com/images/I/515xhjtnk0...
style Modern
material Polypropylene
color Green/Beige
url https://www.amazon.com/dp/B0044G9M2S
keywords NaN
img\_description NaN
caption NaN
Name: 165, dtype: object: 'float' object is not iterable
Error creating embedding for title Christopher Knight Home Adelina Fabric Occaisi...
primary\_image https://m.media-amazon.com/images/I/41FESwmeXb...
style Wing Back
material NaN
color Light Lavender
url https://www.amazon.com/dp/B073GLR1DG
keywords NaN
img\_description NaN
caption NaN
Name: 166, dtype: object: 'float' object is not iterable
Error creating embedding for title ODK Small Computer Desk, 27.5 inch Desk for Sm...
primary\_image https://m.media-amazon.com/images/I/41meqsf8aq...
style Modern
material Engineered Wood
color Pure White
url https://www.amazon.com/dp/B092HVNQQ4
keywords NaN
img\_description NaN
caption NaN
Name: 167, dtype: object: 'float' object is not iterable
Error creating embedding for title GOmaize Cute Wall Mirror with 4 Layers of Colo...
primary\_image https://m.media-amazon.com/images/I/417WwDOB5X...
style Bohemian
material Plastic
color Blue
url https://www.amazon.com/dp/B0CB6HZR7Z
keywords NaN
img\_description NaN
caption NaN
Name: 168, dtype: object: 'float' object is not iterable
Error creating embedding for title huester What are You Doing in My Swamp Door Ma...
primary\_image https://m.media-amazon.com/images/I/51L59TyllJ...
style Farmhouse
material Rubber
color NaN
url https://www.amazon.com/dp/B0C8SGN73S
keywords NaN
img\_description NaN
caption NaN
Name: 169, dtype: object: 'float' object is not iterable
Error creating embedding for title Bedstory 3 Inch Queen Size Memory Foam Mattres...
primary\_image https://m.media-amazon.com/images/I/516PONoRDr...
style NaN
material Memory Foam
color White
url https://www.amazon.com/dp/B0B31DB3LN
keywords NaN
img\_description NaN
caption NaN
Name: 170, dtype: object: 'float' object is not iterable
Error creating embedding for title Toland Home Garden 800252 Birthday Bash Party ...
primary\_image https://m.media-amazon.com/images/I/51rfyHppFm...
style Modern
material Rubber
color Balloon Outdoor Doormat for Entryway Indoor En...
url https://www.amazon.com/dp/B01AA0SO7A
keywords NaN
img\_description NaN
caption NaN
Name: 171, dtype: object: 'float' object is not iterable
Error creating embedding for title Asense Small Footstool Ottoman Set of 2, Faux ...
primary\_image https://m.media-amazon.com/images/I/31mK9NtBNH...
style Modern
material NaN
color 2 Pack Faux Leather Celadon
url https://www.amazon.com/dp/B0CPLSTFW5
keywords NaN
img\_description NaN
caption NaN
Name: 172, dtype: object: 'float' object is not iterable
Error creating embedding for title PINGEUI 2 Packs 13 Inches Bamboo Step Stool, N...
primary\_image https://m.media-amazon.com/images/I/41Y0vrrtp7...
style Modern
material Bamboo
color Brown
url https://www.amazon.com/dp/B099VZPTWT
keywords NaN
img\_description NaN
caption NaN
Name: 173, dtype: object: 'float' object is not iterable
Error creating embedding for title Poundex Y1553 Two Piece PU Round Shape Barstoo...
primary\_image https://m.media-amazon.com/images/I/31XVd1lG-z...
style Modern
material NaN
color Black
url https://www.amazon.com/dp/B0183K9SMO
keywords NaN
img\_description NaN
caption NaN
Name: 174, dtype: object: 'float' object is not iterable
Error creating embedding for title SP-AU-Era Mirror cabinet storage box, cosmetic...
primary\_image https://m.media-amazon.com/images/I/61zDAVHDAf...
style Wall-mounted Perforated Home Bathroom Sink, Co...
material PET
color blackish green
url https://www.amazon.com/dp/B0C99SY5W2
keywords NaN
img\_description NaN
caption NaN
Name: 175, dtype: object: 'float' object is not iterable
Error creating embedding for title Kavonty Storage Chest, Storage Bench, Retro To...
primary\_image https://m.media-amazon.com/images/I/41YpXf+0X2...
style NaN
material NaN
color Rustic Brown
url https://www.amazon.com/dp/B0BB9RZ19N
keywords NaN
img\_description NaN
caption NaN
Name: 176, dtype: object: 'float' object is not iterable
Error creating embedding for title Barkan TV Wall Mount, 32-70 inch Full Motion A...
primary\_image https://m.media-amazon.com/images/I/41NgcrmTA7...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B01L0YHBB0
keywords NaN
img\_description NaN
caption NaN
Name: 177, dtype: object: 'float' object is not iterable
Error creating embedding for title danpinera Side Table Round Metal, Outdoor Side...
primary\_image https://m.media-amazon.com/images/I/41fuboxDT3...
style Modern
material Iron
color Light Green
url https://www.amazon.com/dp/B09FXM34DV
keywords NaN
img\_description NaN
caption NaN
Name: 178, dtype: object: 'float' object is not iterable
Error creating embedding for title Dscabomlg Foldable Shoe Storage Plastic Vertic...
primary\_image https://m.media-amazon.com/images/I/41bq4r8uj5...
style Modern
material NaN
color Grey&white
url https://www.amazon.com/dp/B0CG5SJN86
keywords NaN
img\_description NaN
caption NaN
Name: 179, dtype: object: 'float' object is not iterable
Error creating embedding for title ACCHAR Ergonomic Office Chair, Reclining Mesh ...
primary\_image https://m.media-amazon.com/images/I/413qdlao4p...
style With arms
material Foam
color White
url https://www.amazon.com/dp/B0C2C9S1R6
keywords NaN
img\_description NaN
caption NaN
Name: 180, dtype: object: 'float' object is not iterable
Error creating embedding for title ODK Small Computer Desk, 27.5 Inch, Compact Ti...
primary\_image https://m.media-amazon.com/images/I/41NmfAngKl...
style Modern
material Engineered Wood
color Black
url https://www.amazon.com/dp/B08CB925CT
keywords NaN
img\_description NaN
caption NaN
Name: 181, dtype: object: 'float' object is not iterable
Error creating embedding for title Front Door Mats by ZULINE,Entry and Back Yard ...
primary\_image https://m.media-amazon.com/images/I/51+qRIvl1F...
style Outdoor & Indoor
material Rubber
color Brown-diamond
url https://www.amazon.com/dp/B09PBH963M
keywords NaN
img\_description NaN
caption NaN
Name: 182, dtype: object: 'float' object is not iterable
Error creating embedding for title MyGift Modern Over The Door Towel Rack in Shab...
primary\_image https://m.media-amazon.com/images/I/515aoZQHoA...
style NaN
material Metal
color Whitewashed Wood & Black Metal
url https://www.amazon.com/dp/B0C5BBYRDN
keywords NaN
img\_description NaN
caption NaN
Name: 183, dtype: object: 'float' object is not iterable
Error creating embedding for title WEENFON Storage Cabinet with Doors and Shelves...
primary\_image https://m.media-amazon.com/images/I/51F9Edov14...
style Shaker
material Engineered Wood
color Grey
url https://www.amazon.com/dp/B0BF8KWBR2
keywords NaN
img\_description NaN
caption NaN
Name: 184, dtype: object: 'float' object is not iterable
Error creating embedding for title SOOWERY End Tables with Charging Station, Set ...
primary\_image https://m.media-amazon.com/images/I/41x2Yzpw5a...
style Retro
material Iron
color Brown
url https://www.amazon.com/dp/B0BRFX55TJ
keywords NaN
img\_description NaN
caption NaN
Name: 185, dtype: object: 'float' object is not iterable
Error creating embedding for title Bednowitz Twin Box Spring，5 Inch Low Profile M...
primary\_image https://m.media-amazon.com/images/I/51rTEhx3EA...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CJR8KM2D
keywords NaN
img\_description NaN
caption NaN
Name: 186, dtype: object: 'float' object is not iterable
Error creating embedding for title BOKKOLIK Industrial Bar Stools (Set of 2) Coun...
primary\_image https://m.media-amazon.com/images/I/41r1PM96rV...
style industrial/retro/rustic/vintage/farmhouse/chic
material NaN
color NaN
url https://www.amazon.com/dp/B0BJZPV117
keywords NaN
img\_description NaN
caption NaN
Name: 187, dtype: object: 'float' object is not iterable
Error creating embedding for title HOOBRO Over The Toilet Storage Cabinet, Mass-S...
primary\_image https://m.media-amazon.com/images/I/41i8ryTI4h...
style louver
material Engineered Wood, Metal
color Rustic Brown
url https://www.amazon.com/dp/B0B31G7LBC
keywords NaN
img\_description NaN
caption NaN
Name: 188, dtype: object: 'float' object is not iterable
Error creating embedding for title Hanover Swivel Counter Height Bar Stool, White...
primary\_image https://m.media-amazon.com/images/I/31039iD-Mp...
style Classic
material NaN
color White and Gray
url https://www.amazon.com/dp/B0B97PJ94P
keywords NaN
img\_description NaN
caption NaN
Name: 189, dtype: object: 'float' object is not iterable
Error creating embedding for title VECELO Modern Industrial Style 3-Piece Dining ...
primary\_image https://m.media-amazon.com/images/I/41rj5r2UFS...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B09MS5RJTT
keywords NaN
img\_description NaN
caption NaN
Name: 190, dtype: object: 'float' object is not iterable
Error creating embedding for title Tenkovic Metal Coat Rack Stand with Quartz Bas...
primary\_image https://m.media-amazon.com/images/I/31N5mQxbhB...
style NaN
material Metal, Wood
color tree gold
url https://www.amazon.com/dp/B0BZCMCJDY
keywords NaN
img\_description NaN
caption NaN
Name: 191, dtype: object: 'float' object is not iterable
Error creating embedding for title FANYE Oversized 6 Seaters Modular Storage Sect...
primary\_image https://m.media-amazon.com/images/I/41MTr4ynO3...
style Track
material Wood
color Navy Blue
url https://www.amazon.com/dp/B0CP7YFXD2
keywords NaN
img\_description NaN
caption NaN
Name: 192, dtype: object: 'float' object is not iterable
Error creating embedding for title HOMSHO 2-Tier Storage Bench,Shoe Bench with Pa...
primary\_image https://m.media-amazon.com/images/I/41Sq7pT7XM...
style NaN
material NaN
color White
url https://www.amazon.com/dp/B0BY23W1J9
keywords NaN
img\_description NaN
caption NaN
Name: 193, dtype: object: 'float' object is not iterable
Error creating embedding for title Realhotan 18 Inch Twin Bed Frame 3500 Pounds H...
primary\_image https://m.media-amazon.com/images/I/51+pTJO13K...
style NaN
material NaN
color Black
url https://www.amazon.com/dp/B0CCCS3RB9
keywords NaN
img\_description NaN
caption NaN
Name: 194, dtype: object: 'float' object is not iterable
Error creating embedding for title Kwikset BTBNC1C Pfister Bath Hardware, 18", Po...
primary\_image https://m.media-amazon.com/images/I/31A+awsgcP...
style Contemporary
material Zinc
color Polished Chrome
url https://www.amazon.com/dp/B00JMTNK0W
keywords NaN
img\_description NaN
caption NaN
Name: 195, dtype: object: 'float' object is not iterable
Error creating embedding for title MAHANCRIS End Table Set of 2, Side Table with ...
primary\_image https://m.media-amazon.com/images/I/41wsItqcjU...
style Straight Leg
material Engineered Wood
color Rustic Brown + Black
url https://www.amazon.com/dp/B0CJNJMY5H
keywords NaN
img\_description NaN
caption NaN
Name: 196, dtype: object: 'float' object is not iterable
Error creating embedding for title Moen MY3786CH Idora Single Post Bathroom Hand ...
primary\_image https://m.media-amazon.com/images/I/41LVA3Tody...
style NaN
material Zinc
color Chrome
url https://www.amazon.com/dp/B0882HQRJX
keywords NaN
img\_description NaN
caption NaN
Name: 197, dtype: object: 'float' object is not iterable
Error creating embedding for title Roundhill Furniture Swivel Black Bonded Leathe...
primary\_image https://m.media-amazon.com/images/I/31VM2JhRDZ...
style Modern
material NaN
color Black
url https://www.amazon.com/dp/B00D93AT24
keywords NaN
img\_description NaN
caption NaN
Name: 198, dtype: object: 'float' object is not iterable
Error creating embedding for title PINPLUS Storage Ottoman Bench, Linen Coffee Ta...
primary\_image https://m.media-amazon.com/images/I/41gj8mVGFG...
style Modern
material Engineered Wood
color White
url https://www.amazon.com/dp/B0BZ3RYRNY
keywords NaN
img\_description NaN
caption NaN
Name: 199, dtype: object: 'float' object is not iterable
Error creating embedding for title Red Co. 14 x 18 inch Large Decorative Frameles...
primary\_image https://m.media-amazon.com/images/I/21M6+MAnWp...
style Modern
material Glass
color Silver
url https://www.amazon.com/dp/B087Z3RXLN
keywords NaN
img\_description NaN
caption NaN
Name: 200, dtype: object: 'float' object is not iterable
Error creating embedding for title PONTMENT Foot Stool Leather Footstool Solid Wo...
primary\_image https://m.media-amazon.com/images/I/51ElPbhgU7...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0C38VPJ15
keywords NaN
img\_description NaN
caption NaN
Name: 201, dtype: object: 'float' object is not iterable
Error creating embedding for title Kingston Brass BA2714C Milano Towel-Ring, 6-In...
primary\_image https://m.media-amazon.com/images/I/41X7yXWQ+P...
style Contemporary
material Brass
color Polished Chrome
url https://www.amazon.com/dp/B0003SDM18
keywords NaN
img\_description NaN
caption NaN
Name: 202, dtype: object: 'float' object is not iterable
Error creating embedding for title Lazy Chair with Ottoman, Modern Lounge Accent ...
primary\_image https://m.media-amazon.com/images/I/415U1ul6gp...
style NaN
material NaN
color Grey
url https://www.amazon.com/dp/B0CCRXWDF1
keywords NaN
img\_description NaN
caption NaN
Name: 203, dtype: object: 'float' object is not iterable
Error creating embedding for title latifolia Shoe Cabinet, Vintage Shoe Storage C...
primary\_image https://m.media-amazon.com/images/I/41Mst-29Zd...
style Modern
material Bamboo
color Brown
url https://www.amazon.com/dp/B0CGX7Y9HQ
keywords NaN
img\_description NaN
caption NaN
Name: 204, dtype: object: 'float' object is not iterable
Error creating embedding for title Jumweo Towel Racks for Bathroom, Metal Towel R...
primary\_image https://m.media-amazon.com/images/I/411VfNriJE...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CM6PR2ZB
keywords NaN
img\_description NaN
caption NaN
Name: 205, dtype: object: 'float' object is not iterable
Error creating embedding for title Christopher Knight Home Gentry Bonded Leather ...
primary\_image https://m.media-amazon.com/images/I/412PrvRCw-...
style Leather
material Foam
color Black
url https://www.amazon.com/dp/B005FFA3LQ
keywords NaN
img\_description NaN
caption NaN
Name: 206, dtype: object: 'float' object is not iterable
Error creating embedding for title BokWin 4 Sets No Mortise Bed Rail Fittings Woo...
primary\_image https://m.media-amazon.com/images/I/41ocbpXWJg...
style NaN
material Iron
color NaN
url https://www.amazon.com/dp/B09CGPQT1L
keywords NaN
img\_description NaN
caption NaN
Name: 207, dtype: object: 'float' object is not iterable
Error creating embedding for title Simple Deluxe Gaming Chair, Big and Tall Gamer...
primary\_image https://m.media-amazon.com/images/I/41ZTMbqu1J...
style With arms
material NaN
color Black
url https://www.amazon.com/dp/B0B51LYB8T
keywords NaN
img\_description NaN
caption NaN
Name: 208, dtype: object: 'float' object is not iterable
Error creating embedding for title OIGUMR Shield Wall Mirror Mirror Wall Decor Vi...
primary\_image https://m.media-amazon.com/images/I/41LSP7xb2q...
style NaN
material Resin
color Gold
url https://www.amazon.com/dp/B0BMXD3D6J
keywords NaN
img\_description NaN
caption NaN
Name: 209, dtype: object: 'float' object is not iterable
Error creating embedding for title ChooChoo Farmhouse End Table, Modern End Table...
primary\_image https://m.media-amazon.com/images/I/41P7V9O6ga...
style Modern
material Engineered Wood
color White and Brown
url https://www.amazon.com/dp/B0CJHT9KH6
keywords NaN
img\_description NaN
caption NaN
Name: 210, dtype: object: 'float' object is not iterable
Error creating embedding for title ZIYOO Twin Bed Frame 14 Inch High 3 Inches Wid...
primary\_image https://m.media-amazon.com/images/I/31dZ6tsbHO...
style NaN
material NaN
color Black
url https://www.amazon.com/dp/B07RY46G23
keywords NaN
img\_description NaN
caption NaN
Name: 211, dtype: object: 'float' object is not iterable
Error creating embedding for title MoNiBloom Set of 2 Plastic Barstools with PU C...
primary\_image https://m.media-amazon.com/images/I/31fCq+IIEu...
style Modern
material NaN
color White
url https://www.amazon.com/dp/B0CB7SM7MM
keywords NaN
img\_description NaN
caption NaN
Name: 212, dtype: object: 'float' object is not iterable
Error creating embedding for title KingCamp Stable Folding Camping Table Bamboo O...
primary\_image https://m.media-amazon.com/images/I/41Sc-GGZBe...
style YELLOW
material Aluminum,Bamboo
color Yellow-27.6"d X 47.2"w X 27.56"h
url https://www.amazon.com/dp/B08ZHPDZX5
keywords NaN
img\_description NaN
caption NaN
Name: 213, dtype: object: 'float' object is not iterable
Error creating embedding for title Artistic Weavers Berma Knitted Jute Round Pouf...
primary\_image https://m.media-amazon.com/images/I/51wZvzlzMD...
style Natural
material Engineered Wood
color Slate
url https://www.amazon.com/dp/B00JVZEZE2
keywords NaN
img\_description NaN
caption NaN
Name: 214, dtype: object: 'float' object is not iterable
Error creating embedding for title Dwellicity Hello Welcome Mat Black and Gray St...
primary\_image https://m.media-amazon.com/images/I/51nGbm-6b-...
style Modern
material Polyvinyl Chloride
color NaN
url https://www.amazon.com/dp/B099NTP2SZ
keywords NaN
img\_description NaN
caption NaN
Name: 215, dtype: object: 'float' object is not iterable
Error creating embedding for title Lifewit 70.9" Narrow Long Console Sofa Table w...
primary\_image https://m.media-amazon.com/images/I/417XCOhUDg...
style Modern
material Engineered Wood
color Rustic Brown
url https://www.amazon.com/dp/B0BZYWTH2D
keywords NaN
img\_description NaN
caption NaN
Name: 216, dtype: object: 'float' object is not iterable
Error creating embedding for title Henn&Hart 20" Wide Round Side Table with Mirro...
primary\_image https://m.media-amazon.com/images/I/41+Mg7qmpY...
style Side Table
material Glass
color Antique Brass/Mirror
url https://www.amazon.com/dp/B07WK22XDX
keywords NaN
img\_description NaN
caption NaN
Name: 217, dtype: object: 'float' object is not iterable
Error creating embedding for title klotski Kids Table and 2 Chair Set, Wood Activ...
primary\_image https://m.media-amazon.com/images/I/41QhFgJUCg...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CGZW945K
keywords NaN
img\_description NaN
caption NaN
Name: 218, dtype: object: 'float' object is not iterable
Error creating embedding for title Kraftware Grant Signature Home San Remo Pineco...
primary\_image https://m.media-amazon.com/images/I/419nFYjmvG...
style NaN
material Vinyl
color Brown
url https://www.amazon.com/dp/B0751KYGV4
keywords NaN
img\_description NaN
caption NaN
Name: 219, dtype: object: 'float' object is not iterable
Error creating embedding for title Alise Bath 3 Towel Bars,Towel Holder Towel Rac...
primary\_image https://m.media-amazon.com/images/I/41frWw+ttR...
style NaN
material Stainless Steel, Metal
color Matte Black
url https://www.amazon.com/dp/B0BGN333H4
keywords NaN
img\_description NaN
caption NaN
Name: 220, dtype: object: 'float' object is not iterable
Error creating embedding for title Round Mirror, Black Round Mirror 24 Inch, Roun...
primary\_image https://m.media-amazon.com/images/I/41igYIRb2f...
style Modern
material Metal
color Black
url https://www.amazon.com/dp/B08TTKV6LY
keywords NaN
img\_description NaN
caption NaN
Name: 221, dtype: object: 'float' object is not iterable
Error creating embedding for title Gexpusm Wood Coffee Table, Natural Wood Coffee...
primary\_image https://m.media-amazon.com/images/I/51xwMLJtrt...
style 4 independent iron legs
material Wood
color Octagonal Coffee Table
url https://www.amazon.com/dp/B0BWXB7C1B
keywords NaN
img\_description NaN
caption NaN
Name: 222, dtype: object: 'float' object is not iterable
Error creating embedding for title Karl home Accent Chair Mid-Century Modern Chai...
primary\_image https://m.media-amazon.com/images/I/51+a05Mxh+...
style Mid-Century Modern
material NaN
color Beige
url https://www.amazon.com/dp/B0BLP4W97Y
keywords NaN
img\_description NaN
caption NaN
Name: 223, dtype: object: 'float' object is not iterable
Error creating embedding for title Kottova Vanity Mirror with Lights,Makeup Mirro...
primary\_image https://m.media-amazon.com/images/I/41Z2VFHxc2...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0BJ1Y5TDN
keywords NaN
img\_description NaN
caption NaN
Name: 224, dtype: object: 'float' object is not iterable
Error creating embedding for title L.R. Resources Corcovado Metallic Braided Pouf...
primary\_image https://m.media-amazon.com/images/I/51QokReEa1...
style Bohemian
material Cotton
color Grey / White
url https://www.amazon.com/dp/B078YDGBM8
keywords NaN
img\_description NaN
caption NaN
Name: 225, dtype: object: 'float' object is not iterable
Error creating embedding for title GREENSTELL Coat Rack, Wooden Coat Rack Freesta...
primary\_image https://m.media-amazon.com/images/I/31lWN-XSfC...
style Rustic
material Wood
color Black
url https://www.amazon.com/dp/B09M8M4P9L
keywords NaN
img\_description NaN
caption NaN
Name: 226, dtype: object: 'float' object is not iterable
Error creating embedding for title COLLECTIVE HOME Mail Organizer with Mirror, Wa...
primary\_image https://m.media-amazon.com/images/I/510ciQYiY4...
style Rustic
material Black
color White
url https://www.amazon.com/dp/B0BWY1HPMB
keywords NaN
img\_description NaN
caption NaN
Name: 227, dtype: object: 'float' object is not iterable
Error creating embedding for title Nightstand with Charging Station and LED Light...
primary\_image https://m.media-amazon.com/images/I/41Co0zmXyy...
style With power outlet
material Glass, Engineered Wood
color Black
url https://www.amazon.com/dp/B0C6K8LMG8
keywords NaN
img\_description NaN
caption NaN
Name: 228, dtype: object: 'float' object is not iterable
Error creating embedding for title Kmitmuk 2 Pack Cabinet Towel Holder, White Kit...
primary\_image https://m.media-amazon.com/images/I/21b4+99Ox0...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CGXJ3VR7
keywords NaN
img\_description NaN
caption NaN
Name: 229, dtype: object: 'float' object is not iterable
Error creating embedding for title GIA Toolix Backless Stool with Metal Seat, Gun...
primary\_image https://m.media-amazon.com/images/I/41mgAYeNEx...
style Tapered
material NaN
color Gunmetal
url https://www.amazon.com/dp/B01FL46UD0
keywords NaN
img\_description NaN
caption NaN
Name: 230, dtype: object: 'float' object is not iterable
Error creating embedding for title It's\_Organized Gaming Desk 55 inch PC Computer...
primary\_image https://m.media-amazon.com/images/I/41oiXo1q4w...
style Gaming
material Alloy Steel
color Black
url https://www.amazon.com/dp/B08CR34X1X
keywords NaN
img\_description NaN
caption NaN
Name: 231, dtype: object: 'float' object is not iterable
Error creating embedding for title Serta Executive Office Padded Arms, Adjustable...
primary\_image https://m.media-amazon.com/images/I/41ZBS1hvHz...
style with-arms
material Foam
color Black/Blue
url https://www.amazon.com/dp/B07644FZVS
keywords NaN
img\_description NaN
caption NaN
Name: 232, dtype: object: 'float' object is not iterable
Error creating embedding for title KoiHome Wooden Daybed with 2 Storage Drawers, ...
primary\_image https://m.media-amazon.com/images/I/511irNkgaw...
style NaN
material NaN
color Espresso
url https://www.amazon.com/dp/B0CHMQC63H
keywords NaN
img\_description NaN
caption NaN
Name: 233, dtype: object: 'float' object is not iterable
Error creating embedding for title Soerreo Shoe Slot Storage Box Adjustable Shoe ...
primary\_image https://m.media-amazon.com/images/I/4127YVIANk...
style Modern
material Plastic
color 10 Piece Set
url https://www.amazon.com/dp/B07X5VSLV1
keywords NaN
img\_description NaN
caption NaN
Name: 234, dtype: object: 'float' object is not iterable
Error creating embedding for title Arch Window Wall Mirror for Living Room,White ...
primary\_image https://m.media-amazon.com/images/I/419YPa-PWh...
style French Country
material Wood
color Black
url https://www.amazon.com/dp/B0CJV7SF48
keywords NaN
img\_description NaN
caption NaN
Name: 235, dtype: object: 'float' object is not iterable
Error creating embedding for title Jennifer Taylor Home Jacob 18" Storage Cube Ot...
primary\_image https://m.media-amazon.com/images/I/51KOhS-ZWZ...
style Contemporary
material Engineered Wood
color Tan Floral Jacquard
url https://www.amazon.com/dp/B0C9FWFGRP
keywords NaN
img\_description NaN
caption NaN
Name: 236, dtype: object: 'float' object is not iterable
Error creating embedding for title C COMFORTLAND Unstuffed Faux Leather Ottoman P...
primary\_image https://m.media-amazon.com/images/I/51qAukZMUD...
style Modern
material This is an empty shell that you have to stuff.
color Grey3
url https://www.amazon.com/dp/B0BWY5RPD1
keywords NaN
img\_description NaN
caption NaN
Name: 237, dtype: object: 'float' object is not iterable
Error creating embedding for title ZZQXTC Over Toilet Storage Cabinet, Bathroom S...
primary\_image https://m.media-amazon.com/images/I/31cXPz4r76...
style wood
material Wood
color Over the Toilet Storage Cabinet White
url https://www.amazon.com/dp/B0CBDLJ32L
keywords NaN
img\_description NaN
caption NaN
Name: 238, dtype: object: 'float' object is not iterable
Error creating embedding for title 40ft Upholstery Elastic Webbing,Two Inch (2") ...
primary\_image https://m.media-amazon.com/images/I/51oKu+lxwz...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CG9CDKQ7
keywords NaN
img\_description NaN
caption NaN
Name: 239, dtype: object: 'float' object is not iterable
Error creating embedding for title Kujielan Oval Wall Mirror with Leaf Decorative...
primary\_image https://m.media-amazon.com/images/I/419muJNV1J...
style Contemporary
material Metal
color Black
url https://www.amazon.com/dp/B0CF9W6WW2
keywords NaN
img\_description NaN
caption NaN
Name: 240, dtype: object: 'float' object is not iterable
Error creating embedding for title RRG Coat Rack Stand, Metal Coat Tree with Heav...
primary\_image https://m.media-amazon.com/images/I/214BED2RP6...
style 8 T-shaped Hooks
material Metal
color Gold - T 67"/170cm
url https://www.amazon.com/dp/B09VBPNY7P
keywords NaN
img\_description NaN
caption NaN
Name: 241, dtype: object: 'float' object is not iterable
Error creating embedding for title Mirrors for Wall Decor, Golden Hanging Mirror ...
primary\_image https://m.media-amazon.com/images/I/31TgX2crLU...
style NaN
material Iron
color Gold
url https://www.amazon.com/dp/B097R4M5Y5
keywords NaN
img\_description NaN
caption NaN
Name: 242, dtype: object: 'float' object is not iterable
Error creating embedding for title Mokoze Wavy Mirror Irregular Border 10.24"x6.3...
primary\_image https://m.media-amazon.com/images/I/319OzJXVrx...
style NaN
material Plastic
color White
url https://www.amazon.com/dp/B0C9QHJ611
keywords NaN
img\_description NaN
caption NaN
Name: 243, dtype: object: 'float' object is not iterable
Error creating embedding for title (100) 12" Record Outer Sleeves - Outer Reseala...
primary\_image https://m.media-amazon.com/images/I/41uJZW57cB...
style NaN
material Vinyl, Plastic, Polypropylene (PP)
color NaN
url https://www.amazon.com/dp/B07B8VT4DC
keywords NaN
img\_description NaN
caption NaN
Name: 244, dtype: object: 'float' object is not iterable
Error creating embedding for title Christopher Knight Home Munro Recliner, Navy B...
primary\_image https://m.media-amazon.com/images/I/31exiSJMk8...
style Contemporary
material Foam
color Navy Blue + Teak
url https://www.amazon.com/dp/B09DS1VPFS
keywords NaN
img\_description NaN
caption NaN
Name: 245, dtype: object: 'float' object is not iterable
Error creating embedding for title 3-Tier Side Table,Narrow End Table with Storag...
primary\_image https://m.media-amazon.com/images/I/41tzKL1XIP...
style Modern
material Engineered Wood
color White
url https://www.amazon.com/dp/B0CP732ZN8
keywords NaN
img\_description NaN
caption NaN
Name: 246, dtype: object: 'float' object is not iterable
Error creating embedding for title DBTHTSK Sofa Latch,Bed Replacement Parts,Heavy...
primary\_image https://m.media-amazon.com/images/I/41gQlYHLvc...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0C2GQK6ZD
keywords NaN
img\_description NaN
caption NaN
Name: 247, dtype: object: 'float' object is not iterable
Error creating embedding for title Boraam Sonoma Bench, Storm Gray Wire-Brush
primary\_image https://m.media-amazon.com/images/I/316Y4ewyCL...
style NaN
material NaN
color Storm Gray Wire-brush
url https://www.amazon.com/dp/B07T9M8Y88
keywords NaN
img\_description NaN
caption NaN
Name: 248, dtype: object: 'float' object is not iterable
Error creating embedding for title Kwikset BTBCB2Y, Tuscan Bronze
primary\_image https://m.media-amazon.com/images/I/21lfjygKja...
style Transitional
material Metal
color Tuscan Bronze
url https://www.amazon.com/dp/B001AHXWQ6
keywords NaN
img\_description NaN
caption NaN
Name: 249, dtype: object: 'float' object is not iterable
Error creating embedding for title Ilyapa 2-Tier Gold Metal Record Player Stand w...
primary\_image https://m.media-amazon.com/images/I/4107MgspWh...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0BT6FF83T
keywords NaN
img\_description NaN
caption NaN
Name: 250, dtype: object: 'float' object is not iterable
Error creating embedding for title GZsenwo (2 Pieces) 3-5/8" Stainless Steel Repl...
primary\_image https://m.media-amazon.com/images/I/41GvGSllzM...
style NaN
material Stainless Steel
color 2pcs
url https://www.amazon.com/dp/B0C6SYFYZN
keywords NaN
img\_description NaN
caption NaN
Name: 251, dtype: object: 'float' object is not iterable
Error creating embedding for title HomePop by Kinfine Fabric Upholstered Round St...
primary\_image https://m.media-amazon.com/images/I/51x3kXXPgx...
style Glam,Farmhouse,Traditional
material Engineered Wood
color Tan Woven
url https://www.amazon.com/dp/B0BG6BJ3DL
keywords NaN
img\_description NaN
caption NaN
Name: 252, dtype: object: 'float' object is not iterable
Error creating embedding for title EFTILE HOME 2 Foot Stool Handmade Wooden 3 Leg...
primary\_image https://m.media-amazon.com/images/I/41-mDeiQw+...
style NaN
material Wood
color Kiwi
url https://www.amazon.com/dp/B0CKJ4YZC9
keywords NaN
img\_description NaN
caption NaN
Name: 253, dtype: object: 'float' object is not iterable
Error creating embedding for title Soft Foot Stool Ottoman Footrest Vanity Stool ...
primary\_image https://m.media-amazon.com/images/I/41oTGNme97...
style NaN
material Iron
color Black
url https://www.amazon.com/dp/B0CKW44X29
keywords NaN
img\_description NaN
caption NaN
Name: 254, dtype: object: 'float' object is not iterable
Error creating embedding for title GAOMON Black 4 Drawer Dresser for Bedroom, Woo...
primary\_image https://m.media-amazon.com/images/I/41GkzVqoNy...
style NaN
material NaN
color Black
url https://www.amazon.com/dp/B0CM1B86CJ
keywords NaN
img\_description NaN
caption NaN
Name: 255, dtype: object: 'float' object is not iterable
Error creating embedding for title Alise 24-Inch Bathroom Lavatory Towel Rack Tow...
primary\_image https://m.media-amazon.com/images/I/51FqMNM3yY...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0B6HXHQSW
keywords NaN
img\_description NaN
caption NaN
Name: 256, dtype: object: 'float' object is not iterable
Error creating embedding for title Seventable Nightstand with Charging Station an...
primary\_image https://m.media-amazon.com/images/I/41Wn14U8Ll...
style Modern
material Engineered Wood
color Black
url https://www.amazon.com/dp/B09DLBNY6W
keywords NaN
img\_description NaN
caption NaN
Name: 257, dtype: object: 'float' object is not iterable
Error creating embedding for title Furinno Coffee Table with Bins, Espresso/Brown...
primary\_image https://m.media-amazon.com/images/I/31CY4VJNyx...
style Modern
material Beech,Particle Board
color Espresso/Brown
url https://www.amazon.com/dp/B08C7Y4RB3
keywords NaN
img\_description NaN
caption NaN
Name: 258, dtype: object: 'float' object is not iterable
Error creating embedding for title Mod Made Mid Century Modern Chrome Wire Counte...
primary\_image https://m.media-amazon.com/images/I/41BxXleMgG...
style Straight
material NaN
color Black Pad
url https://www.amazon.com/dp/B09Q1ZHQFR
keywords NaN
img\_description NaN
caption NaN
Name: 259, dtype: object: 'float' object is not iterable
Error creating embedding for title Bloomingville 15 Inches Mango Wood and Metal O...
primary\_image https://m.media-amazon.com/images/I/21-b0yTRSN...
style Rustic
material Metal
color Black
url https://www.amazon.com/dp/B0CFSPXPYF
keywords NaN
img\_description NaN
caption NaN
Name: 260, dtype: object: 'float' object is not iterable
Error creating embedding for title Gnyonat Accent Chair with Ottoman,Living Room ...
primary\_image https://m.media-amazon.com/images/I/41Gau9oSdR...
style NaN
material NaN
color Blue
url https://www.amazon.com/dp/B0C3TYNRJC
keywords NaN
img\_description NaN
caption NaN
Name: 261, dtype: object: 'float' object is not iterable
Error creating embedding for title SLLFLY Water Bottle Organizer,Stackable Water ...
primary\_image https://m.media-amazon.com/images/I/51EAJVwOuL...
style Clear
material NaN
color Clear
url https://www.amazon.com/dp/B0BZNKKCC3
keywords NaN
img\_description NaN
caption NaN
Name: 262, dtype: object: 'float' object is not iterable
Error creating embedding for title jela Kids Couch Large, Floor Sofa Modular Funi...
primary\_image https://m.media-amazon.com/images/I/41Zury7vcH...
style Padded
material Suede
color Charcoal
url https://www.amazon.com/dp/B0BL9CDX29
keywords NaN
img\_description NaN
caption NaN
Name: 263, dtype: object: 'float' object is not iterable
Error creating embedding for title Flexson TV Mount Attachment for Sonos Beam - B...
primary\_image https://m.media-amazon.com/images/I/31vbAI-UxE...
style NaN
material NaN
color Black
url https://www.amazon.com/dp/B07DQ6GPK6
keywords NaN
img\_description NaN
caption NaN
Name: 264, dtype: object: 'float' object is not iterable
Error creating embedding for title Small Collapsible Kids Hamper Fold Office Wast...
primary\_image https://m.media-amazon.com/images/I/41v-ozvbCq...
style 现代
material Polyester
color 11.8"\*19.7" Pink
url https://www.amazon.com/dp/B07K2Q2NRC
keywords NaN
img\_description NaN
caption NaN
Name: 265, dtype: object: 'float' object is not iterable
Error creating embedding for title Diyalor 2.6 Gallon Small Trash Can with Handle...
primary\_image https://m.media-amazon.com/images/I/219EPmkeeJ...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B09QCMCPYC
keywords NaN
img\_description NaN
caption NaN
Name: 266, dtype: object: 'float' object is not iterable
Error creating embedding for title DAYTOYS C Shaped End Table-Movable Sofa Table ...
primary\_image https://m.media-amazon.com/images/I/41pgntXmHr...
style Classic
material Wood
color Black
url https://www.amazon.com/dp/B0C32RWCV7
keywords NaN
img\_description NaN
caption NaN
Name: 267, dtype: object: 'float' object is not iterable
Error creating embedding for title Phantoscope Storage Ottoman Round15 Inch, Velv...
primary\_image https://m.media-amazon.com/images/I/31V7JNrxMg...
style Modern
material Engineered Wood
color Coffee
url https://www.amazon.com/dp/B095HPZ7DD
keywords NaN
img\_description NaN
caption NaN
Name: 268, dtype: object: 'float' object is not iterable
Error creating embedding for title Casual Home Night Owl Nightstand with USB Port...
primary\_image https://m.media-amazon.com/images/I/3142Zp+eYu...
style Night Owl
material Walnut,Solid Wood,MDF
color Espresso
url https://www.amazon.com/dp/B019C4PPTU
keywords NaN
img\_description NaN
caption NaN
Name: 269, dtype: object: 'float' object is not iterable
Error creating embedding for title NOVICA 302212 Handmade Wood and Reverse Painte...
primary\_image https://m.media-amazon.com/images/I/51bKwT153n...
style Colonial
material Wood, Glass
color Burgundy
url https://www.amazon.com/dp/B07N41BVDG
keywords NaN
img\_description NaN
caption NaN
Name: 270, dtype: object: 'float' object is not iterable
Error creating embedding for title Toy Storage Basket and Play Mat for Building B...
primary\_image https://m.media-amazon.com/images/I/61f83XRzyg...
style NaN
material fabric
color Grey
url https://www.amazon.com/dp/B08PMH8F89
keywords NaN
img\_description NaN
caption NaN
Name: 271, dtype: object: 'float' object is not iterable
Error creating embedding for title RICOO SQ4965 No-Gap Wall Mount for Samsung® Q7...
primary\_image https://m.media-amazon.com/images/I/41VNr1xTfE...
style NaN
material NaN
color black
url https://www.amazon.com/dp/B083WKFRRR
keywords NaN
img\_description NaN
caption NaN
Name: 272, dtype: object: 'float' object is not iterable
Error creating embedding for title Hosley Wooden Frame Mirror 20 Inch High. Ideal...
primary\_image https://m.media-amazon.com/images/I/410lp8Rwjv...
style Contemporary
material Wood
color Brown
url https://www.amazon.com/dp/B07BQHWWRW
keywords NaN
img\_description NaN
caption NaN
Name: 273, dtype: object: 'float' object is not iterable
Error creating embedding for title BRIAN & DANY Foldable Storage Ottoman Footrest...
primary\_image https://m.media-amazon.com/images/I/413YS7nQBn...
style Modern
material Wood
color Khaki
url https://www.amazon.com/dp/B08BNDNGHJ
keywords NaN
img\_description NaN
caption NaN
Name: 274, dtype: object: 'float' object is not iterable
Error creating embedding for title ReplacementScrews Bed Frame Rail Screws Compat...
primary\_image https://m.media-amazon.com/images/I/31-vY+TuWO...
style Flat
material Metal
color Multicolored
url https://www.amazon.com/dp/B0CMXYMDH4
keywords NaN
img\_description NaN
caption NaN
Name: 275, dtype: object: 'float' object is not iterable
Error creating embedding for title mDesign Round Metal in-Lay Accent Table with H...
primary\_image https://m.media-amazon.com/images/I/413u0H2o1I...
style Modern
material Steel/Mirror
color Soft Brass/Mirror
url https://www.amazon.com/dp/B08XPR7662
keywords NaN
img\_description NaN
caption NaN
Name: 276, dtype: object: 'float' object is not iterable
Error creating embedding for title NSFRCLHO Round End Table, Tempered Glass End T...
primary\_image https://m.media-amazon.com/images/I/41z8YktAkG...
style Classic
material Tempered Glass
color Black
url https://www.amazon.com/dp/B089YWCTN2
keywords NaN
img\_description NaN
caption NaN
Name: 277, dtype: object: 'float' object is not iterable
Error creating embedding for title pranovo Metal Sofa Handle Cable Recliner Chair...
primary\_image https://m.media-amazon.com/images/I/3144eTNpeE...
style NaN
material Aluminum
color Black
url https://www.amazon.com/dp/B00R5VYYIG
keywords NaN
img\_description NaN
caption NaN
Name: 278, dtype: object: 'float' object is not iterable
Error creating embedding for title Stuffed Animal Storage Bean Bag Chair Cover fo...
primary\_image https://m.media-amazon.com/images/I/41dBlMhHTh...
style NaN
material velvet
color Cover Only
url https://www.amazon.com/dp/B08JLH2PVH
keywords NaN
img\_description NaN
caption NaN
Name: 279, dtype: object: 'float' object is not iterable
Error creating embedding for title Pinkpum Shoe Ogranizer for Closet, 12 Pack Sho...
primary\_image https://m.media-amazon.com/images/I/41huFJxt+F...
style NaN
material Acrylonitrile Butadiene Styrene
color Clear
url https://www.amazon.com/dp/B0B6P65LGH
keywords NaN
img\_description NaN
caption NaN
Name: 280, dtype: object: 'float' object is not iterable
Error creating embedding for title BOOSDEN Padded Folding Chair 2 Pack, Foldable ...
primary\_image https://m.media-amazon.com/images/I/41H64LdIQ8...
style NaN
material NaN
color 2 Pack Thick Chair | Red
url https://www.amazon.com/dp/B0CC4SZBQ9
keywords NaN
img\_description NaN
caption NaN
Name: 281, dtype: object: 'float' object is not iterable
Error creating embedding for title Kingston Brass SCC8247 Edenscape Pedestal Stee...
primary\_image https://m.media-amazon.com/images/I/31FOa-k+Et...
style Modern
material Alloy Steel
color Brushed Brass
url https://www.amazon.com/dp/B0B5VJNZHL
keywords NaN
img\_description NaN
caption NaN
Name: 282, dtype: object: 'float' object is not iterable
Error creating embedding for title Industrial Rolling Bar 3-Tier Kitchen Serving ...
primary\_image https://m.media-amazon.com/images/I/51rjiq645t...
style NaN
material Solid Wood,Iron
color Brown+black
url https://www.amazon.com/dp/B07RGDWW5C
keywords NaN
img\_description NaN
caption NaN
Name: 283, dtype: object: 'float' object is not iterable
Error creating embedding for title Chill Sack Bean Bag Chair: Giant 5' Memory Foa...
primary\_image https://m.media-amazon.com/images/I/51fQFu92ts...
style Furniture Foam
material NaN
color Microsuede - Lime
url https://www.amazon.com/dp/B00P21TM2O
keywords NaN
img\_description NaN
caption NaN
Name: 284, dtype: object: 'float' object is not iterable
Error creating embedding for title Caroline's Treasures BB5130JMAT Day of The Dea...
primary\_image https://m.media-amazon.com/images/I/41Q15C0DMD...
style Day of the Dead Red Flowers Skull
material Rubber
color Day of the Dead Red Flowers Skull
url https://www.amazon.com/dp/B01MR9GSZE
keywords NaN
img\_description NaN
caption NaN
Name: 285, dtype: object: 'float' object is not iterable
Error creating embedding for title glitzhome Adjustable Bar Stool Set of 2 Swivel...
primary\_image https://m.media-amazon.com/images/I/51OPfpn9ov...
style Mid-Century
material NaN
color Begin
url https://www.amazon.com/dp/B08ZC5CYXG
keywords NaN
img\_description NaN
caption NaN
Name: 286, dtype: object: 'float' object is not iterable
Error creating embedding for title Symmons 673TR-STN Identity Wall-Mounted Towel ...
primary\_image https://m.media-amazon.com/images/I/31cLgr4MIB...
style Contemporary
material Brass
color Satin Nickel
url https://www.amazon.com/dp/B01LYD3YB1
keywords NaN
img\_description NaN
caption NaN
Name: 287, dtype: object: 'float' object is not iterable
Error creating embedding for title glitzhome Kitchen Island with Storage Kitchen ...
primary\_image https://m.media-amazon.com/images/I/51wSfraUuh...
style Shaker
material Mdf,Metal,Plastic
color Red
url https://www.amazon.com/dp/B09D2T4GP4
keywords NaN
img\_description NaN
caption NaN
Name: 288, dtype: object: 'float' object is not iterable
Error creating embedding for title Lipper International Child's Toy Chest, 33.25"...
primary\_image https://m.media-amazon.com/images/I/41IWlgQ25-...
style NaN
material Engineered Wood, Beechwood, Metal
color Walnut Finish
url https://www.amazon.com/dp/B005H05TWC
keywords NaN
img\_description NaN
caption NaN
Name: 289, dtype: object: 'float' object is not iterable
Error creating embedding for title dnbss LED Nightstand with Charging Station, Sw...
primary\_image https://m.media-amazon.com/images/I/41CANS+MiT...
style Modern
material Wood
color 1-black
url https://www.amazon.com/dp/B0BNWVLYV1
keywords NaN
img\_description NaN
caption NaN
Name: 290, dtype: object: 'float' object is not iterable
Error creating embedding for title Remote Control Holder,TV Remote Caddy/Box with...
primary\_image https://m.media-amazon.com/images/I/41p58Tdmyo...
style NaN
material Leather
color Orange
url https://www.amazon.com/dp/B0C2GZNDXF
keywords NaN
img\_description NaN
caption NaN
Name: 291, dtype: object: 'float' object is not iterable
Error creating embedding for title MoNiBloom Foldable Storage Free Standing Shoes...
primary\_image https://m.media-amazon.com/images/I/41SpDKbBsl...
style Modern
material Bamboo
color NaN
url https://www.amazon.com/dp/B09JSR3CYZ
keywords NaN
img\_description NaN
caption NaN
Name: 292, dtype: object: 'float' object is not iterable
Error creating embedding for title Walker Edison Furniture Modern Round Nesting C...
primary\_image https://m.media-amazon.com/images/I/51U3y0LRMe...
style Coffee Table
material Manufactured Wood
color Walnut/Gold
url https://www.amazon.com/dp/B072P27BTW
keywords NaN
img\_description NaN
caption NaN
Name: 293, dtype: object: 'float' object is not iterable
Error creating embedding for title Way Basics Book Shelf 4 Cubby Storage (Tool-fr...
primary\_image https://m.media-amazon.com/images/I/31eEZQKN+r...
style Modern
material Recycled Material
color NaN
url https://www.amazon.com/dp/B071HWKHQL
keywords NaN
img\_description NaN
caption NaN
Name: 294, dtype: object: 'float' object is not iterable
Error creating embedding for title Mind Reader Trash Can and Toilet Brush Set, Ba...
primary\_image https://m.media-amazon.com/images/I/31ktspfOC9...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0BJ7PQ9XH
keywords NaN
img\_description NaN
caption NaN
Name: 295, dtype: object: 'float' object is not iterable
Error creating embedding for title #4203 Adjustable 1/4" Threaded Non-Skid Leveli...
primary\_image https://m.media-amazon.com/images/I/31Oas3rE7s...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B01M0S28J1
keywords NaN
img\_description NaN
caption NaN
Name: 296, dtype: object: 'float' object is not iterable
Error creating embedding for title Funny Welcome Doormat for Entryway Front Porch...
primary\_image https://m.media-amazon.com/images/I/415x2v3cW5...
style Farmhouse
material Rubber
color Colorful,Funny,Novelty,Personalized
url https://www.amazon.com/dp/B09VFPFBND
keywords NaN
img\_description NaN
caption NaN
Name: 297, dtype: object: 'float' object is not iterable
Error creating embedding for title KINGYES Folding Adjustable Backrest Adirondack...
primary\_image https://m.media-amazon.com/images/I/41RnRNOgDD...
style With arms
material NaN
color Grey
url https://www.amazon.com/dp/B0B2JRSBL3
keywords NaN
img\_description NaN
caption NaN
Name: 298, dtype: object: 'float' object is not iterable
Error creating embedding for title Leick Home 10109-GR Oval Condo/Apartment Coffe...
primary\_image https://m.media-amazon.com/images/I/31hgF2KPIJ...
style Oval Coffee Table
material Wood
color Smoke Gray
url https://www.amazon.com/dp/B08KLBTL5R
keywords NaN
img\_description NaN
caption NaN
Name: 299, dtype: object: 'float' object is not iterable
Error creating embedding for title Carter's by DaVinci Colby 3-Drawer Dresser in ...
primary\_image https://m.media-amazon.com/images/I/31eTOoDK36...
style NaN
material pine, Wood
color Grey
url https://www.amazon.com/dp/B071DZG655
keywords NaN
img\_description NaN
caption NaN
Name: 300, dtype: object: 'float' object is not iterable
Error creating embedding for title Modway Baronet Button-Tufted Vegan Leather Par...
primary\_image https://m.media-amazon.com/images/I/31Um2-NPw3...
style Contemporary
material Foam
color Grey
url https://www.amazon.com/dp/B0BR8NVGDL
keywords NaN
img\_description NaN
caption NaN
Name: 301, dtype: object: 'float' object is not iterable
Error creating embedding for title MOOACE Small Side Table, Round End Table Night...
primary\_image https://m.media-amazon.com/images/I/419Yb6N5yy...
style Modern
material Wood
color Brown
url https://www.amazon.com/dp/B0BGL3QXKR
keywords NaN
img\_description NaN
caption NaN
Name: 302, dtype: object: 'float' object is not iterable
Error creating embedding for title BYOOTIQUE Makeup Chair Folding Camping Stool C...
primary\_image https://m.media-amazon.com/images/I/511N0PuE9E...
style NaN
material NaN
color NaN
url https://www.amazon.com/dp/B0CC4X9SS3
keywords NaN
img\_description NaN
caption NaN
Name: 303, dtype: object: 'float' object is not iterable
Error creating embedding for title nimboo Kids Couch - Modular Kids Play Couch Se...
primary\_image https://m.media-amazon.com/images/I/51He1KLeOs...
style NaN
material High Density Comfort Foam
color Rainbow Unicorn
url https://www.amazon.com/dp/B0CLC3XWR6
keywords NaN
img\_description NaN
caption NaN
Name: 304, dtype: object: 'float' object is not iterable
Error creating embedding for title LOKKHAN Industrial Bar Table 38.6"-48.4" Heigh...
primary\_image https://m.media-amazon.com/images/I/31uVNZMOnX...
style NaN
material Wood Tabletop,Wooden Tabletop
color Copper
url https://www.amazon.com/dp/B0BVT748HV
keywords NaN
img\_description NaN
caption NaN
Name: 305, dtype: object: 'float' object is not iterable
Error creating embedding for title UTONE Gaming Chair Computer Chair Breathable F...
primary\_image https://m.media-amazon.com/images/I/31dCSKQ14Y...
style Solid Back
material Textile
color Pink
url https://www.amazon.com/dp/B0CF9F4TQD
keywords NaN
img\_description NaN
caption NaN
Name: 306, dtype: object: 'float' object is not iterable
Error creating embedding for title Lexicon Victoria Saddle Wood Bar Stools (Set o...
primary\_image https://m.media-amazon.com/images/I/41CPL03Y-W...
style Contemporary
material Wood
color Black Sand
url https://www.amazon.com/dp/B08SLPBC36
keywords NaN
img\_description NaN
caption NaN
Name: 307, dtype: object: 'float' object is not iterable
Error creating embedding for title ANZORG Behind Door Hanging Kids Shoes Organize...
primary\_image https://m.media-amazon.com/images/I/31qQ2tZPv-...
style NaN
material Non Woven Fabric
color 12 Pockets
url https://www.amazon.com/dp/B09KN5ZTXC
keywords NaN
img\_description NaN
caption NaN
Name: 308, dtype: object: 'float' object is not iterable
Error creating embedding for title Pipishell Full-Motion TV Wall Mount for Most 3...
primary\_image https://m.media-amazon.com/images/I/41TkLI3K2-...
style NaN
material NaN
color Black
url https://www.amazon.com/dp/B0BN7T57NK
keywords NaN
img\_description NaN
caption NaN
Name: 309, dtype: object: 'float' object is not iterable
Error creating embedding for title Noori Rug Home - Lux Collection Modern Ava Rou...
primary\_image https://m.media-amazon.com/images/I/21Uq9uJEE5...
style Glam
material Engineered Wood
color Ivory/Gold Ava
url https://www.amazon.com/dp/B097FC9C27
keywords NaN
img\_description NaN
caption NaN
Name: 310, dtype: object: 'float' object is not iterable
Error creating embedding for title Modway Parcel Upholstered Fabric Parsons Dinin...
primary\_image https://m.media-amazon.com/images/I/41f8WNXejU...
style Modern
material Foam
color Beige
url https://www.amazon.com/dp/B00SMM4H98
keywords NaN
img\_description NaN
caption NaN
Name: 311, dtype: object: 'float' object is not iterable`
```
```
`df\_search.head()`
```
||title|primary\_image|style|material|color|url|keywords|img\_description|caption|embedding|
|0|GOYMFK 1pc Free Standing Shoe Rack, Multi-laye...|https://m.media-amazon.com/images/I/416WaLx10j...|Modern|Metal|White|https://www.amazon.com/dp/B0CJHKVG6P|['shoe rack', 'metal', 'white', 'multi-layer',...|The GOYMFK Free Standing Shoe Rack is a versat...|Sleek white multi-layer metal free-standing sh...|[-0.06301482, -0.038354326, -0.0108071, -0.015...|
|1|subrtex Leather ding Room, Dining Chairs Set o...|https://m.media-amazon.com/images/I/31SejUEWY7...|Black Rubber Wood|Sponge|Black|https://www.amazon.com/dp/B0B66QHB23|['dining chair', 'leather', 'black']|The Subrtex Leather Dining Chairs come in a se...|Set of 2 modern black faux leather dining chai...|[-0.018292552, -0.006216094, -0.009373649, -0....|
|2|Plant Repotting Mat MUYETOL Waterproof Transpl...|https://m.media-amazon.com/images/I/41RgefVq70...|Modern|Polyethylene|Green|https://www.amazon.com/dp/B0BXRTWLYK|['repotting mat', 'waterproof', 'portable', 'f...|The Plant Repotting Mat is a portable and fold...|Vibrant green waterproof plant repotting mat|[-0.010247701, 0.0074028056, -0.00037697714, -...|
|3|Pickleball Doormat, Welcome Doormat Absorbent ...|https://m.media-amazon.com/images/I/61vz1Igler...|Modern|Rubber|A5589|https://www.amazon.com/dp/B0C1MRB2M8|['doormat', 'absorbent', 'non-slip', 'coconut ...|The Pickleball Doormat is a charming welcome m...|Coir welcome mat featuring a playful "It's a g...|[-0.0033125042, -0.02689817, -0.009523449, 0.0...|
|4|JOIN IRON Foldable TV Trays for Eating Set of ...|https://m.media-amazon.com/images/I/41p4d4VJnN...|X Classic Style|Iron|Grey Set of 4|https://www.amazon.com/dp/B0CG1N9QRC|['tv tray', 'foldable', 'metal', 'grey']|The JOIN IRON Foldable TV Tray Set includes fo...|Set of 4 foldable grey TV trays with durable b...|[-0.020860892, -0.0053859027, -0.019131333, -0...|
```
`# Keep only the lines where we have embeddings
df\_search = df\_search.dropna(subset=['embedding'])
print(df\_search.shape)`
```
```
`(50, 10)`
```
```
`data\_embeddings\_path = "data/items\_tagged\_and\_captioned\_embeddings.csv"`
```
```
`# Saving locally for later - optional: do not execute if you prefer to use the provided file
df\_search.to\_csv(data\_embeddings\_path, index=False)`
```
```
`# Optional: load data from saved file if you haven't processed the whole dataset
from ast import literal\_eval
df\_search = pd.read\_csv(data\_embeddings\_path)
df\_search["embedding"] = df\_search.embedding.apply(literal\_eval).apply(np.array)`
```
### Search from input text
We can compare the input text from a user directly to the embeddings we just created.
```
`# Searching for N most similar results
def search\_from\_input\_text(query, n = 2):
embedded\_value = get\_embedding(query)
df\_search['similarity'] = df\_search['embedding'].apply(lambda x: cosine\_similarity(np.array(x).reshape(1,-1), np.array(embedded\_value).reshape(1, -1)))
most\_similar = df\_search.sort\_values('similarity', ascending=False).iloc[:n]
return most\_similar`
```
```
`user\_inputs = ['shoe storage', 'black metal side table', 'doormat', 'step bookshelf', 'ottoman']`
```
```
`for i in user\_inputs:
print(f"Input: {i}\\n")
res = search\_from\_input\_text(i)
for index, row in res.iterrows():
similarity\_score = row['similarity']
if isinstance(similarity\_score, np.ndarray):
similarity\_score = similarity\_score[0][0]
print(f"{row['title'][:50]}{'...' if len(row['title']) \> 50 else ''} ({row['url']}) - Similarity: {similarity\_score:.2f}")
img = Image(url=row['primary\_image'])
display(img)
print("\\n\\n")`
```
```
`Input: shoe storage
GOYMFK 1pc Free Standing Shoe Rack, Multi-layer Me... (https://www.amazon.com/dp/B0CJHKVG6P) - Similarity: 0.57`
```
```
`
MAEPA RV Shoe Storage for Bedside - 8 Extra Large ... (https://www.amazon.com/dp/B0C4PL1R3F) - Similarity: 0.55`
```
```
`
Input: black metal side table
FLYJOE Narrow Side Table with PU Leather Magazine ... (https://www.amazon.com/dp/B0CHYDTQKN) - Similarity: 0.58`
```
```
`
HomePop Metal Accent Table Triangle Base Round Mir... (https://www.amazon.com/dp/B08N5H868H) - Similarity: 0.57`
```
```
`
Input: doormat
GXFC ZHAO Welcome Funny Door Mat Shoes and Bras Of... (https://www.amazon.com/dp/B07X61R7N8) - Similarity: 0.52`
```
```
`
Pickleball Doormat, Welcome Doormat Absorbent Non-... (https://www.amazon.com/dp/B0C1MRB2M8) - Similarity: 0.49`
```
```
`
Input: step bookshelf
Leick Home 70007-WTGD Mixed Metal and Wood Stepped... (https://www.amazon.com/dp/B098KNRNLQ) - Similarity: 0.57`
```
```
`
Wildkin Kids Canvas Sling Bookshelf with Storage f... (https://www.amazon.com/dp/B07GBVFZ1Y) - Similarity: 0.46`
```
```
`
Input: ottoman
Moroccan Leather Pouf Ottoman for Living Room - Ro... (https://www.amazon.com/dp/B0CP45784G) - Similarity: 0.49`
```
```
`
HomePop Home Decor | K2380-YDQY-2 | Luxury Large F... (https://www.amazon.com/dp/B0B94T1TZ1) - Similarity: 0.46`
```
### Search from image
If the input is an image, we can find similar images by first turning images into captions, and embedding those captions to compare them to the already created embeddings.
```
`# We'll take a mix of images: some we haven't seen and some that are already in the dataset
example\_images = df.iloc[306:]['primary\_image'].to\_list() + df.iloc[5:10]['primary\_image'].to\_list()`
```
```
`for i in example\_images:
img\_description = describe\_image(i, '')
caption = caption\_image(img\_description)
img = Image(url=i)
print('Input: \\n')
display(img)
res = search\_from\_input\_text(caption, 1).iloc[0]
similarity\_score = res['similarity']
if isinstance(similarity\_score, np.ndarray):
similarity\_score = similarity\_score[0][0]
print(f"{res['title'][:50]}{'...' if len(res['title']) \> 50 else ''} ({res['url']}) - Similarity: {similarity\_score:.2f}")
img\_res = Image(url=res['primary\_image'])
display(img\_res)
print("\\n\\n")`
```
```
`Input:`
```
```
`Black Leather Office Chair Mid Back Leather Desk C... (https://www.amazon.com/dp/B0BVQSPCCF) - Similarity: 0.54`
```
```
`
Input:`
```
```
`subrtex Leather ding Room, Dining Chairs Set of 2,... (https://www.amazon.com/dp/B0B66QHB23) - Similarity: 0.52`
```
```
`
Input:`
```
```
`MAEPA RV Shoe Storage for Bedside - 8 Extra Large ... (https://www.amazon.com/dp/B0C4PL1R3F) - Similarity: 0.65`
```
```
`
Input:`
```
```
`Chief Mfg.Swing-Arm Wall Mount Hardware Mount Blac... (https://www.amazon.com/dp/B007E40Z5K) - Similarity: 0.66`
```
```
`
Input:`
```
```
`Homebeez 39.1" Length Bedroom Storage Bench, End B... (https://www.amazon.com/dp/B0BWQ8M4Q3) - Similarity: 0.52`
```
```
`
Input:`
```
```
`subrtex Leather ding Room, Dining Chairs Set of 2,... (https://www.amazon.com/dp/B0B66QHB23) - Similarity: 0.51`
```
```
`
Input:`
```
```
`LOVMOR 30'' Bathroom Vanity Sink Base Cabine, Stor... (https://www.amazon.com/dp/B0C9WYYFLB) - Similarity: 0.58`
```
```
`
Input:`
```
```
`Folews Bathroom Organizer Over The Toilet Storage,... (https://www.amazon.com/dp/B09NZY3R1T) - Similarity: 0.73`
```
```
`
Input:`
```
```
`GOYMFK 1pc Free Standing Shoe Rack, Multi-layer Me... (https://www.amazon.com/dp/B0CJHKVG6P) - Similarity: 0.72`
```
```
`
Input:`
```
```
`subrtex Leather ding Room, Dining Chairs Set of 2,... (https://www.amazon.com/dp/B0B66QHB23) - Similarity: 0.77`
```
```
`
Input:`
```
```
`Plant Repotting Mat MUYETOL Waterproof Transplanti... (https://www.amazon.com/dp/B0BXRTWLYK) - Similarity: 0.64`
```
## Wrapping up
In this notebook, we explored how to leverage the multimodal capabilities of `gpt-4o-mini` to tag and caption images. By providing images along with contextual information to the model, we were able to generate tags and descriptions that can be further refined to create captions. This process has practical applications in various scenarios, particularly in enhancing search functionalities.
The search use case illustrated can be directly applied to applications such as recommendation systems, but the techniques covered in this notebook can be extended beyond items search and used in multiple use cases, for example RAG applications leveraging unstructured image data.
As a next step, you could explore using a combination of rule-based filtering with keywords and embeddings search with captions to retrieve more relevant results.