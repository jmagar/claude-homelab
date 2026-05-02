Vision Fine-tuning on GPT-4o for Visual Question Answering
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
Nov 1, 2024
# Vision Fine-tuning on GPT-4o for Visual Question Answering
[ DM ](https://github.com/danial-openai)
[ Danial Mirza
(OpenAI)
](https://github.com/danial-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/multimodal/Vision_Fine_tuning_on_GPT4o_for_Visual_Question_Answering.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/multimodal/Vision_Fine_tuning_on_GPT4o_for_Visual_Question_Answering.ipynb)
We’re excited to announce the launch of [Vision Fine-Tuning on GPT-4o](https://openai.com/index/introducing-vision-to-the-fine-tuning-api/), a cutting-edge multimodal fine-tuning capability that empowers developers to fine-tune GPT-4o using both **images** and **text**. With this new feature, you can customize models to have stronger image understanding capabilities, unlocking possibilities across various industries and applications.
From **advanced visual search** to **improved object detection** for autonomous vehicles or smart cities, vision fine-tuning enables you to craft solutions tailored to your specific needs. By combining text and image inputs, this product is uniquely positioned for tasks like **visual question answering**, where detailed, context-aware answers are derived from analyzing images. In general, this seems to be most effective when the model is presented with questions and images that resemble the training data as we are able to teach the model how to search and identify relevant parts of the image to answer the question correctly. Similarly to fine-tuning on text inputs, vision fine-tuning is not as useful for teaching the model new information.
In this guide, we’ll walk you through the steps to fine-tune GPT-4o with multimodal inputs. Specifically, we’ll demonstrate how to train a model for answering questions related to **images of books**, but the potential applications span countless domains—from **web design** and **education** to **healthcare** and **research**.
Whether you’re looking to build smarter defect detection models for manufacturing, enhance complex document processing and diagram understanding, or develop applications with better visual comprehension for a variety of other use cases, this guide will show you just how fast and easy it is to get started.
For more information, check out the full [Documentation](https://platform.openai.com/docs/guides/fine-tuning/vision).
```
`from openai import OpenAI, ChatCompletion
import json
import os
client = OpenAI()`
```
### Load Dataset
We will work with a dataset of question-answer pairs on images of books from the [OCR-VQA dataset](https://ocr-vqa.github.io/), accessible through HuggingFace. This dataset contains 207,572 images of books with associated question-answer pairs inquiring about title, author, edition, year and genre of the book. In total, the dataset contains \~1M QA pairs. For the purposes of this guide, we will only use a small subset of the dataset to train, validate and test our model.
We believe that this dataset will be well suited for fine-tuning on multimodal inputs as it requires the model to not only accurately identify relevant bounding boxes to extract key information, but also reason about the content of the image to answer the question correctly.
```
`from datasets import load\_dataset
# load dataset
ds = load\_dataset("howard-hou/OCR-VQA")`
```
We’ll begin by sampling 150 training examples, 50 validation examples and 100 test examples. We will also explode the `questions` and `answers` columns to create a single QA pair for each row. Additionally, since our images are stored as byte strings, we’ll convert them to images for processing.
```
`import pandas as pd
from io import BytesIO
from PIL import Image
# sample 150 training examples, 50 validation examples and 100 test examples
ds\_train = ds['train'].shuffle(seed=42).select(range(150))
ds\_val = ds['validation'].shuffle(seed=42).select(range(50))
ds\_test = ds['test'].shuffle(seed=42).select(range(100))
# convert to pandas dataframe
ds\_train = ds\_train.to\_pandas()
ds\_val = ds\_val.to\_pandas()
ds\_test = ds\_test.to\_pandas()
# convert byte strings to images
ds\_train['image'] = ds\_train['image'].apply(lambda x: Image.open(BytesIO(x['bytes'])))
ds\_val['image'] = ds\_val['image'].apply(lambda x: Image.open(BytesIO(x['bytes'])))
ds\_test['image'] = ds\_test['image'].apply(lambda x: Image.open(BytesIO(x['bytes'])))
# explode the 'questions' and 'answers' columns
ds\_train = ds\_train.explode(['questions', 'answers'])
ds\_val = ds\_val.explode(['questions', 'answers'])
ds\_test = ds\_test.explode(['questions', 'answers'])
# rename columns
ds\_train = ds\_train.rename(columns={'questions': 'question', 'answers': 'answer'})
ds\_val = ds\_val.rename(columns={'questions': 'question', 'answers': 'answer'})
ds\_test = ds\_test.rename(columns={'questions': 'question', 'answers': 'answer'})
# create unique ids for each example
ds\_train = ds\_train.reset\_index(drop=True)
ds\_val = ds\_val.reset\_index(drop=True)
ds\_test = ds\_test.reset\_index(drop=True)
# select columns
ds\_train = ds\_train[['question', 'answer', 'image']]
ds\_val = ds\_val[['question', 'answer', 'image']]
ds\_test = ds\_test[['question', 'answer', 'image']]`
```
Let’s inspect a random sample from the training set.
In this example, the question prompts the model to determine the title of the book. In this case, the answer is quite ambiguous as there is the main title “Patty’s Patterns - Advanced Series Vol. 1 & 2” as well as the subtitle “100 Full-Page Patterns Value Bundle” which are found in different parts of the image. Also, the name of the author here is not an individual, but a group called “Penny Farthing Graphics” which could be mistaken as part of the title.
This type of task is typical in visual question answering, where the model must interpret complex images and provide accurate, context-specific responses. By training on these kinds of questions, we can enhance the model’s ability to perform detailed image analysis across a variety of domains.
```
`from IPython.display import display
# display a random training example
print('QUESTION:', ds\_train.iloc[198]['question'])
display(ds\_train.iloc[198]['image'])
print('ANSWER:', ds\_train.iloc[198]['answer'])`
```
```
`QUESTION: What is the title of this book?`
```
```
`ANSWER: Patty's Patterns - Advanced Series Vol. 1 & 2: 100 Full-Page Patterns Value Bundle`
```
### Data Preparation
To ensure successful fine-tuning of our model, it’s crucial to properly structure the training data. Correctly formatting the data helps avoid validation errors during training and ensures the model can effectively learn from both text and image inputs. The good news is, this process is quite straightforward.
Each example in the training dataset should be a conversation in the same format as the **Chat Completions API**. Specifically, this means structuring the data as a series of **messages**, where each message includes a `role` (such as “user” or “assistant”) and the `content` of the message.
Since we are working with both text and images for vision fine-tuning, we’ll construct these messages to include both content types. For each training sample, the question about the image is presented as a user message, and the corresponding answer is provided as an assistant message.
Images can be included in one of two ways:
* As **HTTP URLs**, referencing the location of the image.
* As **data URLs** containing the image encoded in **base64**.
Here’s an example of how the message format should look:
```
`{
"messages":
[
{
"role": "system",
"content": "Use the image to answer the question."
},
{
"role": "user",
"content": [
{"type": "text", "text": "What is the title of this book?"},
{"type": "image\_url", "image\_url": {"url": "data:image/jpeg;base64,\<encoded\_image\>"}}
]
}
]
}`
```
Let’s start by defining the **system instructions** for our model. These instructions provide the model with important context, guiding how it should behave when processing the training data. Clear and concise system instructions are particularly useful to make sure the model reasons well on both text and images.
```
`SYSTEM\_PROMPT = """
Generate an answer to the question based on the image of the book provided.
Questions will include both open-ended questions and binary "yes/no" questions.
The questions will inquire about the title, author, edition, year and genre of the book in the image.
You will read the question and examine the corresponding image to provide an accurate answer.
# Steps
1. \*\*Read the Question:\*\* Carefully analyze the question to understand what information is being asked.
2. \*\*Examine the Image:\*\*
- \*\*Identify Relevant Bounding Boxes (if applicable):\*\* For questions requiring specific details like the title or author, focus on the relevant areas or bounding boxes within the image to extract the necessary text. There may be multiple relevant bounding boxes in the image, so be sure to consider all relevant areas.
- \*\*Analyze the Whole Image:\*\* For questions that need general reasoning (e.g., "Is this book related to Children's Books?"), consider the entire image, including title, graphics, colors, and overall design elements.
3. \*\*Formulate a Reasoned Answer:\*\*
- For binary questions (yes/no), use evidence from the image to support your answer.
- For open-ended questions, provide the exact text from the image or a concise phrase that best describes the requested information.
# Output Format
- Provide your answer in a concise and clear manner. Always return the final conclusion only, no additional text or reasoning.
- If the question is binary, answer with "Yes" or "No."
- For open-ended questions requesting specific details (e.g., title, author), return the exact text from the image.
- For questions about general attributes like "genre," return a single word or phrase that best describes it.
# Notes
- Always prioritize accuracy and clarity in your responses.
- If multiple authors are listed, return the first author listed.
- If the information is not present in the image, try to reason about the question using the information you can gather from the image e.g. if the author is not listed, use the title and genre to find the author.
- Ensure reasoning steps logically lead to the conclusions before stating your final answer.
# Examples
You will be provided with examples of questions and corresponding images of book covers, along with the reasoning and conclusion for each example. Use these examples to guide your reasoning process."""`
```
To ensure our images are properly formatted for vision fine-tuning, they must be in **base64 format** and either **RGB or RGBA**. This ensures the model can accurately process the images during training. Below is a function that handles the encoding of images, while also converting them to the correct format if necessary.
This function allows us to control the quality of the image encoding, which can be useful if we want to reduce the size of the file. 100 is the highest quality, and 1 is the lowest. The maximum file size for a fine-tuning job is 1GB, but we are unlikely to see improvements with a very large amount of training data. Nevertheless, we can use the `quality` parameter to reduce the size of the file if needed to accomodate file size limits.
```
`import base64
def encode\_image(image, quality=100):
if image.mode != 'RGB':
image = image.convert('RGB') # Convert to RGB
buffered = BytesIO()
image.save(buffered, format="JPEG", quality=quality)
return base64.b64encode(buffered.getvalue()).decode("utf-8")`
```
We will also include **Few-Shot examples** from the training set as user and assistant messages to help guide the model’s reasoning process.
```
`FEW\_SHOT\_EXAMPLES = [
{
"role": "user",
"content": [
{"type": "text", "text": "\*\*Example 1:\*\*\\n\\n\*\*Question:\*\* Who wrote this book?"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(ds\_train.iloc[286]['image'], quality=50)}"}}
]
},
{
"role": "assistant",
"content": [
{"type": "text", "text": "\*\*Reasoning:\*\* The cover clearly displays two authors' names, 'Evelyn M. Thomson' and 'Orlen N. Johnson,' at the bottom of the cover, with Evelyn M. Thomson listed first. Typically, the first-listed author is considered the primary author or main contributor.\\n\\n\*\*Conclusion:\*\* Evelyn Thomson"}
]
},
{
"role": "user",
"content": [
{"type": "text", "text": "\*\*Example 2:\*\*\\n\\n\*\*Question:\*\* What is the title of this book?"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(ds\_train.iloc[22]['image'], quality=50)}"}}
]
},
{
"role": "assistant",
"content": [
{"type": "text", "text": "\*\*Answer:\*\*\\n\\n\*\*Reasoning:\*\* The cover prominently displays the title across the top and center of the image. The full title reads, 'Computer Systems: An Integrated Approach to Architecture and Operating Systems,' with each component of the title clearly separated and formatted to stand out.\\n\\n\*\*Conclusion:\*\* Computer Systems: An Integrated Approach to Architecture and Operating Systems"}
]
},
{
"role": "user",
"content": [
{"type": "text", "text": "\*\*Example 3:\*\*\\n\\n\*\*Question:\*\* Is this book related to Children's Books?"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(ds\_train.iloc[492]['image'], quality=50)}"}}
]
},
{
"role": "assistant",
"content": [
{"type": "text", "text": "\*\*Answer:\*\*\\n\\n\*\*Reasoning:\*\* The cover illustration features a whimsical mermaid holding a red shoe, with gentle, child-friendly artwork that suggests it is targeted toward a young audience. Additionally, the style and imagery are typical of children's literature.\\n\\n\*\*Conclusion:\*\* Yes"}
]
},
{
"role": "user",
"content": [
{"type": "text", "text": "\*\*Example 4:\*\*\\n\\n\*\*Question:\*\* Is this book related to History?"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(ds\_train.iloc[68]['image'], quality=50)}"}}
]
},
{
"role": "assistant",
"content": [
{"type": "text", "text": "\*\*Answer:\*\*\\n\\n\*\*Reasoning:\*\* The title 'Oliver Wendell Holmes, Jr.: Civil War Soldier, Supreme Court Justice' clearly indicates that this book focuses on the life of Oliver Wendell Holmes, Jr., providing a biographical account rather than a general historical analysis. Although it references historical elements (Civil War, Supreme Court), the primary focus is on the individual rather than historical events as a whole.\\n\\n\*\*Conclusion:\*\* No"}
]
},
{
"role": "user",
"content": [
{"type": "text", "text": "\*\*Example 5:\*\*\\n\\n\*\*Question:\*\* What is the genre of this book?"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(ds\_train.iloc[42]['image'], quality=50)}"}}
]
},
{
"role": "assistant",
"content": [
{"type": "text", "text": "\*\*Answer:\*\*\\n\\n\*\*Reasoning:\*\* The cover prominently features an image of a train station and the title 'Railway Depots, Stations & Terminals,' which directly suggests a focus on railway infrastructure. This points to the book being related to topics within Engineering & Transportation.\\n\\n\*\*Conclusion:\*\* Engineering & Transportation"}
]
},
{
"role": "user",
"content": [
{"type": "text", "text": "\*\*Example 6:\*\*\\n\\n\*\*Question:\*\* What type of book is this?"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(ds\_train.iloc[334]['image'], quality=50)}"}}
]
},
{
"role": "assistant",
"content": [
{"type": "text", "text": "\*\*Answer:\*\*\\n\\n\*\*Reasoning:\*\* The title 'Principles and Practice of Modern Chromatographic Methods' suggests a focus on chromatography, a scientific technique used in chemistry and biology. This aligns with the academic and technical nature typical of books in the 'Science & Math' category.\\n\\n\*\*Conclusion:\*\* Science & Math"}
]
}
]`
```
Now that we have our system instructions, few-shot examples, and the image encoding function in place, the next step is to iterate through the training set and construct the messages required for fine-tuning. As a reminder, each training example must be formatted as a conversation and must include both the image (in base64 format) and the corresponding question and answer.
To fine-tune GPT-4o, we recommend providing at least **10 examples**, but you’ll typically see noticeable improvements with **50 to 100** training examples. In this case, we’ll go all-in and fine-tune the model using our larger training sample of **150 images, and 721 QA pairs**.
```
`from tqdm import tqdm
# constructing the training set
json\_data = []
for idx, example in tqdm(ds\_train.iterrows()):
system\_message = {
"role": "system",
"content": [{"type": "text", "text": SYSTEM\_PROMPT}]
}
user\_message = {
"role": "user",
"content": [
{"type": "text", "text": f"Question [{idx}]: {example['question']}"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(example['image'], quality=50)}"}}
]
}
assistant\_message = {
"role": "assistant",
"content": [{"type": "text", "text": example["answer"]}]
}
all\_messages = [system\_message] + FEW\_SHOT\_EXAMPLES + [user\_message, assistant\_message]
json\_data.append({"messages": all\_messages})`
```
```
`721it [00:01, 518.61it/s]`
```
We save our final training set in a `.jsonl` file where each line in the file represents a single example in the training dataset.
```
`# save the JSON data to a file
with open("ocr-vqa-train.jsonl", "w") as f:
for message in json\_data:
json.dump(message, f)
f.write("\\n")`
```
Just like the training set, we need to structure our validation and test sets in the same message format. However, for the test set, there’s a key difference: since the test set is used for evaluation, we do not include the assistant’s message (i.e., the answer). This ensures the model generates its own answers, which we can later compare to the ground truth for performance evaluation.
```
`# constructing the validation set
json\_data = []
for idx, example in tqdm(ds\_val.iterrows()):
system\_message = {
"role": "system",
"content": [{"type": "text", "text": SYSTEM\_PROMPT}]
}
user\_message = {
"role": "user",
"content": [
{"type": "text", "text": f"Question [{idx}]: {example['question']}"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(example['image'], quality=50)}"}}
]
}
assistant\_message = {
"role": "assistant",
"content": [{"type": "text", "text": example["answer"]}]
}
all\_messages = [system\_message] + FEW\_SHOT\_EXAMPLES + [user\_message, assistant\_message]
json\_data.append({"messages": all\_messages})
# save the JSON data to a file
with open("ocr-vqa-validation.jsonl", "w") as f:
for message in json\_data:
json.dump(message, f)
f.write("\\n")`
```
```
`239it [00:00, 474.76it/s]`
```
```
`# constructing the test set
json\_data = []
for idx, example in tqdm(ds\_test.iterrows()):
system\_message = {
"role": "system",
"content": [{"type": "text", "text": SYSTEM\_PROMPT}]
}
user\_message = {
"role": "user",
"content": [
{"type": "text", "text": f"Question [{idx}]: {example['question']}"},
{"type": "image\_url", "image\_url": {"url": f"data:image/jpeg;base64,{encode\_image(example['image'], quality=50)}"}}
]
}
all\_messages = [system\_message] + FEW\_SHOT\_EXAMPLES + [user\_message]
json\_data.append({"messages": all\_messages})
# save the JSON data to a file
with open("ocr-vqa-test.jsonl", "w") as f:
for message in json\_data:
json.dump(message, f)
f.write("\\n")`
```
```
`485it [00:00, 490.79it/s]`
```
### Fine-tuning
Now that we have prepared our training and validation datasets in the right format, we can upload them using the [Files API](https://platform.openai.com/docs/api-reference/files/create) for fine-tuning.
```
`# upload training file
train\_file = client.files.create(
file=open("ocr-vqa-train.jsonl", "rb"),
purpose="fine-tune"
)
# upload validation file
val\_file = client.files.create(
file=open("ocr-vqa-validation.jsonl", "rb"),
purpose="fine-tune"
)`
```
Once the files are uploaded, we’re ready to proceed to the next step: starting the fine-tuning job.
To create a fine-tuning job, we use the fine-tuning API. This may take some time to complete, but you can track the progress of the fine-tuning job in the [Platform UI](https://platform.openai.com/finetune/).
```
`# create fine tuning job
file\_train = train\_file.id
file\_val = val\_file.id
client.fine\_tuning.jobs.create(
training\_file=file\_train,
# note: validation file is optional
validation\_file=file\_val,
model="gpt-4o-2024-08-06"
)`
```
```
`FineTuningJob(id='ftjob-I1GKWTvusx0900L4ggohrGCP', created\_at=1730479789, error=Error(code=None, message=None, param=None), fine\_tuned\_model=None, finished\_at=None, hyperparameters=Hyperparameters(n\_epochs='auto', batch\_size='auto', learning\_rate\_multiplier='auto'), model='gpt-4o-2024-08-06', object='fine\_tuning.job', organization\_id='org-l89177bnhkme4a44292n5r3j', result\_files=[], seed=662273734, status='validating\_files', trained\_tokens=None, training\_file='file-UzGnMr4kYPgcFeuq121UBifQ', validation\_file='file-LoWiW0fCIa3eirRZExRU3pKB', estimated\_finish=None, integrations=[], user\_provided\_suffix=None, method=None)`
```
### Evaluation
Once the fine-tuning job is complete, it’s time to evaluate the performance of our model by running inference on the test set. This step involves using the fine-tuned model to generate responses to the questions in the test set and comparing its predictions to the ground truth answers for evaluation. We will also run inference on the test set using the non-fine-tuned GPT-4o model for comparison.
```
`from concurrent.futures import ThreadPoolExecutor, as\_completed
import re
# load the test data from JSONL file
test\_data = []
with open("ocr-vqa-test.jsonl", "r") as f:
for line in f:
test\_data.append(json.loads(line))
def process\_example(example, model):
response = client.chat.completions.create(
model=model,
messages=example["messages"],
store=True,
metadata={'dataset': 'ocr-vqa-test'}
)
predicted\_answer = response.choices[0].message.content.strip()
# regex to get the question ID
match = re.search(r'\\[(\\d+)\\]', example["messages"][-1]["content"][0]["text"])
if match:
example\_id = int(match.group(1))
else:
example\_id = -1
actual\_answer = ds\_test.iloc[example\_id]['answer']
return {
"example\_id": example\_id,
"predicted\_answer": predicted\_answer,
"actual\_answer": actual\_answer
}
# run the prompts through the finetuned model and store the results
model = "ft:gpt-4o-2024-08-06:openai::AOY1M8VG"
results = []
with ThreadPoolExecutor() as executor:
futures = {executor.submit(process\_example, example, model): example for example in test\_data}
for future in tqdm(as\_completed(futures), total=len(futures)):
results.append(future.result())
# save the results to a file
with open("ocr-vqa-ft-results.jsonl", "w") as f:
for result in results:
json.dump(result, f)
f.write("\\n")
# run the prompts through the non-fine-tuned model and store the results
model = "gpt-4o"
results = []
with ThreadPoolExecutor() as executor:
futures = {executor.submit(process\_example, example, model): example for example in test\_data}
for future in tqdm(as\_completed(futures), total=len(futures)):
results.append(future.result())
# save the results to a file
with open("ocr-vqa-4o-results.jsonl", "w") as f:
for result in results:
json.dump(result, f)
f.write("\\n")`
```
```
`100%|██████████| 485/485 [02:03\<00:00, 3.93it/s]
100%|██████████| 485/485 [01:35\<00:00, 5.09it/s]`
```
Now that we’ve run inference using our fine-tuned model, let’s inspect a few specific examples to understand how well the model performed compared to the actual answers.
```
`# Q: What is the title of this book?
{"example\_id": 6, "predicted\_answer": "A Wrinkle in Time", "actual\_answer": "A Wrinkle in Time (Time Quintet)"}
# Q: Who wrote this book?
{"example\_id": 10, "predicted\_answer": "DK Travel", "actual\_answer": "DK Publishing"}
# Q: What is the title of this book?
{"example\_id": 11, "predicted\_answer": "DK Eyewitness Travel Guide: Peru", "actual\_answer": "DK Eyewitness Travel Guide: Peru"}
# Q: What type of book is this?
{"example\_id": 12, "predicted\_answer": "Travel", "actual\_answer": "Travel"}
# Q: Who wrote this book?
{"example\_id": 437, "predicted\_answer": "Cookshack, Inc.", "actual\_answer": "Cookshack"}
# Q: What type of book is this?
{"example\_id": 482, "predicted\_answer": "Christian Books & Bibles", "actual\_answer": "Religion & Spirituality"}`
```
As we can see, the fine-tuned model does a great job at answering the questions, with many responses being exactly correct.
However, there are also cases where the model’s **predicted answers** are close to the **ground truth**, while not matching exactly, particularly in open-ended questions where phrasing or details may differ. To assess the quality of these predictions, we will use GPT-4o to evaluate the similarity between the predicted responses and the ground truth labels from the dataset.
In order to evaluate our model responses, we will use GPT-4o to determine the similarity between the ground truth and our predicted responses. We will rank our predicted answers based on the following criteria:
* **Very Similar**: The predicted answer exactly matches the ground truth and there is no important information omitted, although there may be some minor ommissions or discrepancies in punctuation.
* **Mostly Similar**: The predicted answer closely aligns with the ground truth, perhaps with some missing words or phrases.
* **Somewhat Similar**: Although the predicted answer has noticeable differences to the ground truth, the core content is accurate and semantically similar, perhaps with some missing information.
* **Incorrect**: The predicted answer is completely incorrect, irrelevant, or contains critical errors or omissions from the ground truth.
```
`from pydantic import BaseModel, Field
# define output schema
class Result(BaseModel):
example\_id: int = Field(description="The unique ID of the question")
rating: str = Field(description="The assigned similarity rating. One of [Very Similar | Mostly Similar | Somewhat Similar | Incorrect]")
type: str = Field(description="The type of question. Open if the question is binary yes/no, otherwise Closed. One of [Open | Closed]")
EVAL\_PROMPT = """
Evaluate the closeness between the predicted answer and the ground truth for each provided result.
Rank the predicted answer based on the following criteria:
1. \*\*Very Similar\*\*: The predicted answer exactly matches the ground truth and there is no important information omitted, although there may be some minor ommissions or discrepancies in punctuation.
2. \*\*Mostly Similar\*\*: The predicted answer closely aligns with the ground truth, perhaps with some missing words or phrases.
3. \*\*Somewhat Similar\*\*: Although the predicted answer has noticeable differences to the ground truth, the core content is accurate and semantically similar, perhaps with some missing information.
4. \*\*Incorrect\*\*: The predicted answer is completely incorrect, irrelevant, or contains critical errors or omissions from the ground truth.
Ensure to consider both open-ended and yes/no questions.
# Steps
1. \*\*Analyze the Answers\*\*: Read the predicted answer, and ground truth carefully.
2. \*\*Evaluate Similarity\*\*:
- Check if the predicted answer contains the same core information and correctness as the ground truth.
- Determine if there are any important omissions or errors.
3. \*\*Assign a Rating\*\*: Based on your evaluation, assign the appropriate rating: Very Similar, Mostly Similar, Somewhat Similar, or Incorrect.
# Output Format
```json
[
{
"example\_id": [example\_id],
"rating": "[Very Similar | Mostly Similar | Somewhat Similar | Incorrect]",
"type": "[Open | Closed]
}
]
```
# Examples
\*\*Input:\*\*
```json
{"example\_id": 6, "predicted\_answer": "A Wrinkle in Time", "actual\_answer": "A Wrinkle in Time (Time Quintet)"}
```
\*\*Reasoning:\*\*
The predicted answer "A Wrinkle in Time" is a very close match to the ground truth "A Wrinkle in Time (Time Quintet)" with a missing tagline or subtitle.
\*\*Output:\*\*
```json
{ "example\_id": 6, "rating": "Mostly Similar", "type": "Open" }
```
\*\*Input:\*\*
```json
{"example\_id": 437, "predicted\_answer": "Cookshack, Inc.", "actual\_answer": "Cookshack"}
```
\*\*Reasoning:\*\*
The predicted answer "Cookshack, Inc." is exactly the same as the ground truth "Cookshack", with only a difference in punctuation.
\*\*Output:\*\*
```json
{ "example\_id": 437, "rating": "Very Similar", "type": "Open" }
```
\*\*Input:\*\*
```json
{"example\_id": 482, "predicted\_answer": "Christian Books & Bibles", "actual\_answer": "Religion & Spirituality"}
```
\*\*Reasoning:\*\*
The predicted answer "Christian Books & Bibles" is semantically similar to the ground truth "Religion & Spirituality", however there is a key difference in the predicted answer.
\*\*Output:\*\*
```json
{ "example\_id": 482, "rating": "Somewhat Similar", "type": "Open" }
```
\*\*Input:\*\*
```json
{ "example\_id": 417, "predicted\_answer": "yes", "actual\_answer": "no" }
```
\*\*Reasoning:\*\*
The predicted answer "yes" is completely incorrect compared to the actual answer "no."
\*\*Output:\*\*
```json
{ "example\_id": 417, "rating": "Incorrect", "type": "Closed" }
```
"""
def process\_result(result):
messages = [
{
"role": "system",
"content": EVAL\_PROMPT
},
{
"role": "user",
"content": str(result)
}
]
response = client.beta.chat.completions.parse(
model='gpt-4o',
messages=messages,
temperature=0,
response\_format=Result
)
return json.loads(response.choices[0].message.content)
# fine-tuned model results with scores
results = []
with open("ocr-vqa-ft-results.jsonl", "r") as f:
for line in f:
results.append(json.loads(line))
results\_w\_scores = []
with ThreadPoolExecutor() as executor:
futures = {executor.submit(process\_result, result): result for result in results}
for future in tqdm(as\_completed(futures), total=len(futures)):
results\_w\_scores.append(future.result())
# Save the results to a file
with open("ocr-vqa-ft-similarity.jsonl", "w") as f:
for score in results\_w\_scores:
json.dump(score, f)
f.write("\\n")
# non-fine-tuned model results with scores
results = []
with open("ocr-vqa-4o-results.jsonl", "r") as f:
for line in f:
results.append(json.loads(line))
results\_w\_scores\_4o = []
with ThreadPoolExecutor() as executor:
futures = {executor.submit(process\_result, result): result for result in results}
for future in tqdm(as\_completed(futures), total=len(futures)):
results\_w\_scores\_4o.append(future.result())
# Save the results to a file
with open("ocr-vqa-4o-similarity.jsonl", "w") as f:
for score in results\_w\_scores\_4o:
json.dump(score, f)
f.write("\\n")`
```
```
`100%|██████████| 485/485 [00:18\<00:00, 25.58it/s]
100%|██████████| 485/485 [00:17\<00:00, 27.09it/s]`
```
To fully understand the impact of fine-tuning, we also evaluated the same set of test questions using the **non-fine-tuned GPT-4o** model.
Let’s start by comparing the performance of the fine-tuned model vs the non-fine-tuned model for **Closed** form (Yes/No) questions.
Note that with the fine-tuned model, we can check for exact matches between the predicted and actual answers because the model has learned to produce consistent answers that follow the response format specified in the system prompt. However, for the non-fine-tuned model, we need to account for variations in phrasing and wording in the predicted answers. Below is an example of a non-fine-tuned model output. As we can see, the final answer is correct but the response format is inconsistent and outputs reasoning in the response.
```
`# example of non-fine-tuned model output
{"example\_id": 14, "predicted\_answer": "\*\*Answer:\*\*\\n\\nNo. \\n\\n\*\*Reasoning:\*\* The cover shows \\"Eyewitness Travel\\" and \\"Peru,\\" indicating it is a travel guide focused on the country, rather than a pharmaceutical book.", "actual\_answer": "No"}`
```
```
`# read in results
results\_ft = []
with open("ocr-vqa-ft-results.jsonl", "r") as f:
for line in f:
results\_ft.append(json.loads(line))
results\_4o = []
with open("ocr-vqa-4o-results.jsonl", "r") as f:
for line in f:
results\_4o.append(json.loads(line))
# filter results for yes/no questions
results\_ft\_closed = [result for result in results\_ft if result['actual\_answer'] in ['Yes', 'No']]
results\_4o\_closed = [result for result in results\_4o if result['actual\_answer'] in ['Yes', 'No']]
# check for correct predictions
correct\_ft\_closed = [result for result in results\_ft\_closed if result['predicted\_answer'] == result['actual\_answer']]
correct\_4o\_closed = [
result for result in results\_4o\_closed
if result['predicted\_answer'].lower() == result['actual\_answer'].lower()
or result['actual\_answer'].lower() in result['predicted\_answer'].lower()
]
print(f"Fine-tuned model accuracy: {round(100\*len(correct\_ft\_closed) / len(results\_ft\_closed), 2)}%")
print(f"Non-fine-tuned model accuracy: {round(100\*len(correct\_4o\_closed) / len(results\_4o\_closed), 2)}%")`
```
```
`Fine-tuned model accuracy: 90.53%
Non-fine-tuned model accuracy: 87.89%`
```
With a generous allowance for variations in phrasing and wording for the non-fine-tuned model including ignoring case and allowing for partial matches, the fine-tuned model still outperforms the non-fine-tuned model by a margin of **2.64%** on this set of questions.
Now, let’s compare the performance of the fine-tuned model vs the non-fine-tuned model over all the open-ended questions. First, we’ll check for exact matches between the predicted and actual answers, again allowing for general variations in phrasing and wording for the non-fine-tuned model, but maintaining a strict standard for the fine-tuned model.
```
`# filter results for open-ended questions
results\_ft\_open = [result for result in results\_ft if result['actual\_answer'] not in ['Yes', 'No']]
results\_4o\_open = [result for result in results\_4o if result['actual\_answer'] not in ['Yes', 'No']]
# check for correct predictions
correct\_ft\_open = [result for result in results\_ft\_open if result['predicted\_answer'] == result['actual\_answer']]
correct\_4o\_open = [
result for result in results\_4o\_open
if result['predicted\_answer'].lower() == result['actual\_answer'].lower()
or result['actual\_answer'].lower() in result['predicted\_answer'].lower()
]
print(f"Fine-tuned model accuracy: {round(100\*len(correct\_ft\_open) / len(results\_ft\_open), 2)}%")
print(f"Non-fine-tuned model accuracy: {round(100\*len(correct\_4o\_open) / len(results\_4o\_open), 2)}%")`
```
```
`Fine-tuned model accuracy: 64.07%
Non-fine-tuned model accuracy: 46.1%`
```
The improvement in accuracy here is much more pronounced, with the fine-tuned model outperforming the non-fine-tuned model by a substantial margin of **17.97%**, even with very generous allowances for variations in phrasing and wording for the non-fine-tuned model!
If we were to afford the same leniency to the fine-tuned model, we would see an additional 4.1% increase in accuracy, bringing the total margin of improvement to **22.07%**.
To dig a little deeper, we can also look at the accuracy by question type.
```
`import matplotlib.pyplot as plt
# seperate by question type
def get\_question\_type(question):
if question in ["What is the title of this book?"]:
return "Title"
elif question in ["What is the genre of this book?", "What type of book is this?"]:
return "Genre"
elif question in ["Who wrote this book?", "Who is the author of this book?"]:
return "Author"
else:
return "Other"
# get index numbers for each question type
question\_type\_indexes = {
"Title": [],
"Genre": [],
"Author": [],
"Other": []
}
for idx, row in ds\_test.iterrows():
question\_type = get\_question\_type(row['question'])
question\_type\_indexes[question\_type].append(idx)
# plot accuracy by question type]
accuracy\_by\_type\_ft = {}
accuracy\_by\_type\_4o = {}
for question\_type, indexes in question\_type\_indexes.items():
correct\_predictions\_ft = [
result for result in results\_ft if result['example\_id'] in indexes and (
result['predicted\_answer'].lower() == result['actual\_answer'].lower() or
result['actual\_answer'].lower() in result['predicted\_answer'].lower()
)
]
correct\_predictions\_4o = [
result for result in results\_4o if result['example\_id'] in indexes and (
result['predicted\_answer'].lower() == result['actual\_answer'].lower() or
result['actual\_answer'].lower() in result['predicted\_answer'].lower()
)
]
accuracy\_ft = len(correct\_predictions\_ft) / len(indexes) if indexes else 0
accuracy\_4o = len(correct\_predictions\_4o) / len(indexes) if indexes else 0
accuracy\_by\_type\_ft[question\_type] = accuracy\_ft \* 100
accuracy\_by\_type\_4o[question\_type] = accuracy\_4o \* 100
# prepare data for plotting
question\_types = list(accuracy\_by\_type\_ft.keys())
accuracies\_ft = list(accuracy\_by\_type\_ft.values())
accuracies\_4o = list(accuracy\_by\_type\_4o.values())
# plot grouped bar chart
bar\_width = 0.35
index = range(len(question\_types))
plt.figure(figsize=(10, 6))
bar1 = plt.bar(index, accuracies\_ft, bar\_width, label='Fine-tuned GPT-4o', color='skyblue')
bar2 = plt.bar([i + bar\_width for i in index], accuracies\_4o, bar\_width, label='Non-fine-tuned GPT-4o', color='lightcoral')
plt.xlabel('Question Type')
plt.ylabel('Accuracy (%)')
plt.title('Accuracy by Question Type')
plt.ylim(0, 100)
plt.xticks([i + bar\_width / 2 for i in index], question\_types, rotation=45)
plt.legend()
plt.show()`
```
It appears that the largest performance gains for the fine-tuned model are for questions in the **Genre** category e.g. “What type of book is this?” or “What is the genre of this book?”. This might be indicative of the benefits of fine-tuning in general in that we teach the model to classify genres based on the categories present in the training data. However, it also highlights the model’s strong visual undserstanding capabilties, since we are able to identify the genre based on the visual content of the book cover alone.
Additionally, we see significant lift in the **Title** category, which suggests that fine-tuning has boosted the model’s OCR capbilities and its ability to understand the layout and structure of the book cover to extract the relevant information.
Finally, let’s compare the distribution of similarity ratings between the fine-tuned model and the non-fine-tuned model to allow for variations in phrasing and wording.
```
`from collections import Counter
# extract ratings
ratings\_ft = [result['rating'] for result in results\_w\_scores if result['type'] == 'Open']
ratings\_4o = [result['rating'] for result in results\_w\_scores\_4o if result['type'] == 'Open']
# count occurrences of each rating
rating\_counts\_ft = Counter(ratings\_ft)
rating\_counts\_4o = Counter(ratings\_4o)
# define the order of ratings
rating\_order = ["Very Similar", "Mostly Similar", "Somewhat Similar", "Incorrect"]
# create bar chart
bar\_width = 0.35
index = range(len(rating\_order))
fig, ax = plt.subplots()
bar1 = ax.bar(index, [rating\_counts\_ft.get(rating, 0) for rating in rating\_order], bar\_width, label='FT GPT-4o')
bar2 = ax.bar([i + bar\_width for i in index], [rating\_counts\_4o.get(rating, 0) for rating in rating\_order], bar\_width, label='GPT-4o')
ax.set\_xlabel('Ratings')
ax.set\_ylabel('Count')
ax.set\_title('Ratings Distribution')
ax.set\_xticks([i + bar\_width / 2 for i in index])
ax.set\_xticklabels(rating\_order)
ax.legend()
plt.show()`
```
The results provide a clear picture of the benefits gained through fine-tuning, without any other modifications.
Comparing the distribution of ratings between the **fine-tuned GPT-4o** model and **GPT-4o without fine-tuning**, we see that the fine-tuned model gets many more responses exactly correct, with a comparable amount of incorrect responses.
### Key Takeaways
* **Improved Precision**: Fine-tuning helped the model produce more precise answers that matched the ground truth, especially in highly domain-specific tasks like OCR on book covers.
* **Better Generalization**: While the non-fine-tuned GPT-4o was able to get at least somewhat to the ground truth for many questions, it was less consistent. The fine-tuned model exhibited better generalization across a variety of test questions, thanks to the exposure to multimodal data during training.
While the results from vision fine-tuning are promising, there are still opportunities for improvement. Much like fine-tuning on text, the effectiveness of vision fine-tuning depends heavily on the **quality, diversity, and representativeness** of the training data. In particular, models benefit from focusing on cases where errors occur most frequently, allowing for targeted improvements.
Upon reviewing the incorrect results, many of the “Incorrect” responses from the fine-tuned model are in fact due to inconsistencies in the labels from the dataset. For example, some ground truth answers provide only the first and last name of the author, whereas the image actually shows the middle initial as well. Similarly, some ground truth labels for the title include subheadings and taglines, whereas others do not.
Another common theme was miscategorization of genres. Although the model was almost always able to produce a semantically similar genre to the ground truth, the answer sometimes deviated. This is likely due to the lack of presence of these genres in the training data. Providing the model with more diverse training examples to cover these genres, or clearer instructions for dealing with edge cases can help to guide the model’s understanding.
### Next Steps:
* **Expand the Training Dataset**: Adding more varied examples that cover the model’s weaker areas, such as identifying genres, could significantly enhance performance.
* **Expert-Informed Prompts**: Incorporating domain-specific instructions into the training prompts may further refine the model’s ability to accurately interpret and respond in complex cases.
Although there is still some progress to be made on this particular task, the initial results are highly encouraging. With minimal setup and effort, we’ve already observed a substantial uplift in overall accuracy with vision fine-tuning, indicating that this approach holds great potential. Vision fine-tuning opens up possibilities for improvement across a wide range of visual question answering tasks, as well as other tasks that rely on strong visual understanding.