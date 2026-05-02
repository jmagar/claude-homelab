How to use functions with a knowledge base
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
Jun 14, 2023
# How to use functions with a knowledge base
[ CJ ](https://twitter.com/colintjarvis)[ SI ](https://www.linkedin.com/in/shuhei-i/)
[ Colin Jarvis
(OpenAI)
, ](https://twitter.com/colintjarvis)[ Shuhei Ishida
(OpenAI)
](https://www.linkedin.com/in/shuhei-i/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_call_functions_for_knowledge_retrieval.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_call_functions_for_knowledge_retrieval.ipynb)
This notebook builds on the concepts in the [argument generation](How_to_call_functions_with_chat_models.ipynb) notebook, by creating an agent with access to a knowledge base and two functions that it can call based on the user requirement.
We’ll create an agent that uses data from arXiv to answer questions about academic subjects. It has two functions at its disposal:
* **get\_articles**: A function that gets arXiv articles on a subject and summarizes them for the user with links.
* **read\_article\_and\_summarize**: This function takes one of the previously searched articles, reads it in its entirety and summarizes the core argument, evidence and conclusions.
This will get you comfortable with a multi-function workflow that can choose from multiple services, and where some of the data from the first function is persisted to be used by the second.
## Walkthrough
This cookbook takes you through the following workflow:
* **Search utilities:** Creating the two functions that access arXiv for answers.
* **Configure Agent:** Building up the Agent behaviour that will assess the need for a function and, if one is required, call that function and present results back to the agent.
* **arXiv conversation:** Put all of this together in live conversation.
```
`!pip install scipy --quiet
!pip install tenacity --quiet
!pip install tiktoken==0.3.3 --quiet
!pip install termcolor --quiet
!pip install openai --quiet
!pip install arxiv --quiet
!pip install pandas --quiet
!pip install PyPDF2 --quiet
!pip install tqdm --quiet`
```
```
`import arxiv
import ast
import concurrent
import json
import os
import pandas as pd
import tiktoken
from csv import writer
from IPython.display import display, Markdown, Latex
from openai import OpenAI
from PyPDF2 import PdfReader
from scipy import spatial
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt
from tqdm import tqdm
from termcolor import colored
GPT\_MODEL = "gpt-4o-mini"
EMBEDDING\_MODEL = "text-embedding-ada-002"
client = OpenAI()`
```
## Search utilities
We’ll first set up some utilities that will underpin our two functions.
Downloaded papers will be stored in a directory (we use `./data/papers` here). We create a file `arxiv\_library.csv` to store the embeddings and details for downloaded papers to retrieve against using `summarize\_text`.
```
`directory = './data/papers'
# Check if the directory already exists
if not os.path.exists(directory):
# If the directory doesn't exist, create it and any necessary intermediate directories
os.makedirs(directory)
print(f"Directory '{directory}' created successfully.")
else:
# If the directory already exists, print a message indicating it
print(f"Directory '{directory}' already exists.")`
```
```
`Directory './data/papers' already exists.`
```
```
`# Set a directory to store downloaded papers
data\_dir = os.path.join(os.curdir, "data", "papers")
paper\_dir\_filepath = "./data/papers/arxiv\_library.csv"
# Generate a blank dataframe where we can store downloaded files
df = pd.DataFrame(list())
df.to\_csv(paper\_dir\_filepath)`
```
```
`@retry(wait=wait\_random\_exponential(min=1, max=40), stop=stop\_after\_attempt(3))
def embedding\_request(text):
response = client.embeddings.create(input=text, model=EMBEDDING\_MODEL)
return response
@retry(wait=wait\_random\_exponential(min=1, max=40), stop=stop\_after\_attempt(3))
def get\_articles(query, library=paper\_dir\_filepath, top\_k=10):
"""This function gets the top\_k articles based on a user's query, sorted by relevance.
It also downloads the files and stores them in arxiv\_library.csv to be retrieved by the read\_article\_and\_summarize.
"""
client = arxiv.Client()
search = arxiv.Search(
query = query,
max\_results = top\_k
)
result\_list = []
for result in client.results(search):
result\_dict = {}
result\_dict.update({"title": result.title})
result\_dict.update({"summary": result.summary})
# Taking the first url provided
result\_dict.update({"article\_url": [x.href for x in result.links][0]})
result\_dict.update({"pdf\_url": [x.href for x in result.links][1]})
result\_list.append(result\_dict)
# Store references in library file
response = embedding\_request(text=result.title)
file\_reference = [
result.title,
result.download\_pdf(data\_dir),
response.data[0].embedding,
]
# Write to file
with open(library, "a") as f\_object:
writer\_object = writer(f\_object)
writer\_object.writerow(file\_reference)
f\_object.close()
return result\_list`
```
```
`# Test that the search is working
result\_output = get\_articles("ppo reinforcement learning")
result\_output[0]`
```
```
`{'title': 'Proximal Policy Optimization and its Dynamic Version for Sequence Generation',
'summary': 'In sequence generation task, many works use policy gradient for model\\noptimization to tackle the intractable backpropagation issue when maximizing\\nthe non-differentiable evaluation metrics or fooling the discriminator in\\nadversarial learning. In this paper, we replace policy gradient with proximal\\npolicy optimization (PPO), which is a proved more efficient reinforcement\\nlearning algorithm, and propose a dynamic approach for PPO (PPO-dynamic). We\\ndemonstrate the efficacy of PPO and PPO-dynamic on conditional sequence\\ngeneration tasks including synthetic experiment and chit-chat chatbot. The\\nresults show that PPO and PPO-dynamic can beat policy gradient by stability and\\nperformance.',
'article\_url': 'http://arxiv.org/abs/1808.07982v1',
'pdf\_url': 'http://arxiv.org/pdf/1808.07982v1'}`
```
```
`def strings\_ranked\_by\_relatedness(
query: str,
df: pd.DataFrame,
relatedness\_fn=lambda x, y: 1 - spatial.distance.cosine(x, y),
top\_n: int = 100,
) -\> list[str]:
"""Returns a list of strings and relatednesses, sorted from most related to least."""
query\_embedding\_response = embedding\_request(query)
query\_embedding = query\_embedding\_response.data[0].embedding
strings\_and\_relatednesses = [
(row["filepath"], relatedness\_fn(query\_embedding, row["embedding"]))
for i, row in df.iterrows()
]
strings\_and\_relatednesses.sort(key=lambda x: x[1], reverse=True)
strings, relatednesses = zip(\*strings\_and\_relatednesses)
return strings[:top\_n]`
```
```
`def read\_pdf(filepath):
"""Takes a filepath to a PDF and returns a string of the PDF's contents"""
# creating a pdf reader object
reader = PdfReader(filepath)
pdf\_text = ""
page\_number = 0
for page in reader.pages:
page\_number += 1
pdf\_text += page.extract\_text() + f"\\nPage Number: {page\_number}"
return pdf\_text
# Split a text into smaller chunks of size n, preferably ending at the end of a sentence
def create\_chunks(text, n, tokenizer):
"""Returns successive n-sized chunks from provided text."""
tokens = tokenizer.encode(text)
i = 0
while i \< len(tokens):
# Find the nearest end of sentence within a range of 0.5 \* n and 1.5 \* n tokens
j = min(i + int(1.5 \* n), len(tokens))
while j \> i + int(0.5 \* n):
# Decode the tokens and check for full stop or newline
chunk = tokenizer.decode(tokens[i:j])
if chunk.endswith(".") or chunk.endswith("\\n"):
break
j -= 1
# If no end of sentence found, use n tokens as the chunk size
if j == i + int(0.5 \* n):
j = min(i + n, len(tokens))
yield tokens[i:j]
i = j
def extract\_chunk(content, template\_prompt):
"""This function applies a prompt to some input content. In this case it returns a summarized chunk of text"""
prompt = template\_prompt + content
response = client.chat.completions.create(
model=GPT\_MODEL, messages=[{"role": "user", "content": prompt}], temperature=0
)
return response.choices[0].message.content
def summarize\_text(query):
"""This function does the following:
- Reads in the arxiv\_library.csv file in including the embeddings
- Finds the closest file to the user's query
- Scrapes the text out of the file and chunks it
- Summarizes each chunk in parallel
- Does one final summary and returns this to the user"""
# A prompt to dictate how the recursive summarizations should approach the input paper
summary\_prompt = """Summarize this text from an academic paper. Extract any key points with reasoning.\\n\\nContent:"""
# If the library is empty (no searches have been performed yet), we perform one and download the results
library\_df = pd.read\_csv(paper\_dir\_filepath).reset\_index()
if len(library\_df) == 0:
print("No papers searched yet, downloading first.")
get\_articles(query)
print("Papers downloaded, continuing")
library\_df = pd.read\_csv(paper\_dir\_filepath).reset\_index()
else:
print("Existing papers found... Articles:", len(library\_df))
library\_df.columns = ["title", "filepath", "embedding"]
library\_df["embedding"] = library\_df["embedding"].apply(ast.literal\_eval)
strings = strings\_ranked\_by\_relatedness(query, library\_df, top\_n=1)
print("Chunking text from paper")
pdf\_text = read\_pdf(strings[0])
# Initialise tokenizer
tokenizer = tiktoken.get\_encoding("cl100k\_base")
results = ""
# Chunk up the document into 1500 token chunks
chunks = create\_chunks(pdf\_text, 1500, tokenizer)
text\_chunks = [tokenizer.decode(chunk) for chunk in chunks]
print("Summarizing each chunk of text")
# Parallel process the summaries
with concurrent.futures.ThreadPoolExecutor(
max\_workers=len(text\_chunks)
) as executor:
futures = [
executor.submit(extract\_chunk, chunk, summary\_prompt)
for chunk in text\_chunks
]
with tqdm(total=len(text\_chunks)) as pbar:
for \_ in concurrent.futures.as\_completed(futures):
pbar.update(1)
for future in futures:
data = future.result()
results += data
# Final summary
print("Summarizing into overall summary")
response = client.chat.completions.create(
model=GPT\_MODEL,
messages=[
{
"role": "user",
"content": f"""Write a summary collated from this collection of key points extracted from an academic paper.
The summary should highlight the core argument, conclusions and evidence, and answer the user's query.
User query: {query}
The summary should be structured in bulleted lists following the headings Core Argument, Evidence, and Conclusions.
Key points:\\n{results}\\nSummary:\\n""",
}
],
temperature=0,
)
return response`
```
```
`# Test the summarize\_text function works
chat\_test\_response = summarize\_text("PPO reinforcement learning sequence generation")`
```
```
`Existing papers found... Articles: 10
Chunking text from paper
Summarizing each chunk of text`
```
```
`100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:05\<00:00, 1.40s/it]`
```
```
`Summarizing into overall summary`
```
```
`display(Markdown(chat\_test\_response.choices[0].message.content))`
```
### Core Argument
* The paper argues that Proximal Policy Optimization (PPO) and its dynamic variant (PPO-dynamic) significantly improve sequence generation tasks, particularly for chit-chat chatbots, by addressing the instability and suboptimal performance associated with traditional policy gradient methods.
### Evidence
* **Challenges with Traditional Methods**: Traditional policy gradient methods, like REINFORCE, suffer from unstable training and poor performance due to large updates and similar action tendencies, especially in non-differentiable evaluation contexts (e.g., BLEU scores).
* **PPO Advantages**: PPO regularizes policy updates, enhancing training stability and enabling the generation of coherent and diverse chatbot responses.
* **Dynamic PPO Approach**: PPO-dynamic introduces adaptive constraints on KL-divergence, allowing for dynamic adjustments based on action probabilities, which leads to improved training performance.
* **Experimental Validation**: The authors conducted experiments on synthetic counting tasks and real-world chit-chat scenarios, demonstrating that PPO and PPO-dynamic outperform traditional methods like REINFORCE and SeqGAN in terms of stability and performance metrics (e.g., BLEU-2 scores).
* **Results**: PPO-dynamic showed faster convergence and higher precision in the counting task, and it achieved the best performance in the chit-chat task, indicating its effectiveness in generating diverse and contextually appropriate responses.
### Conclusions
* The introduction of PPO and PPO-dynamic enhances the training stability and output diversity in sequence generation tasks, making them more suitable for applications like chatbots.
* The dynamic variant of PPO not only improves performance but also accelerates convergence, addressing the limitations of traditional policy gradient methods and providing a robust framework for reinforcement learning in sequence generation.
## Configure Agent
We’ll create our agent in this step, including a `Conversation` class to support multiple turns with the API, and some Python functions to enable interaction between the `ChatCompletion` API and our knowledge base functions.
```
`@retry(wait=wait\_random\_exponential(min=1, max=40), stop=stop\_after\_attempt(3))
def chat\_completion\_request(messages, functions=None, model=GPT\_MODEL):
try:
response = client.chat.completions.create(
model=model,
messages=messages,
functions=functions,
)
return response
except Exception as e:
print("Unable to generate ChatCompletion response")
print(f"Exception: {e}")
return e`
```
```
`class Conversation:
def \_\_init\_\_(self):
self.conversation\_history = []
def add\_message(self, role, content):
message = {"role": role, "content": content}
self.conversation\_history.append(message)
def display\_conversation(self, detailed=False):
role\_to\_color = {
"system": "red",
"user": "green",
"assistant": "blue",
"function": "magenta",
}
for message in self.conversation\_history:
print(
colored(
f"{message['role']}: {message['content']}\\n\\n",
role\_to\_color[message["role"]],
)
)`
```
```
`# Initiate our get\_articles and read\_article\_and\_summarize functions
arxiv\_functions = [
{
"name": "get\_articles",
"description": """Use this function to get academic papers from arXiv to answer user questions.""",
"parameters": {
"type": "object",
"properties": {
"query": {
"type": "string",
"description": f"""
User query in JSON. Responses should be summarized and should include the article URL reference
""",
}
},
"required": ["query"],
},
},
{
"name": "read\_article\_and\_summarize",
"description": """Use this function to read whole papers and provide a summary for users.
You should NEVER call this function before get\_articles has been called in the conversation.""",
"parameters": {
"type": "object",
"properties": {
"query": {
"type": "string",
"description": f"""
Description of the article in plain text based on the user's query
""",
}
},
"required": ["query"],
},
}
]`
```
```
`def chat\_completion\_with\_function\_execution(messages, functions=[None]):
"""This function makes a ChatCompletion API call with the option of adding functions"""
response = chat\_completion\_request(messages, functions)
full\_message = response.choices[0]
if full\_message.finish\_reason == "function\_call":
print(f"Function generation requested, calling function")
return call\_arxiv\_function(messages, full\_message)
else:
print(f"Function not required, responding to user")
return response
def call\_arxiv\_function(messages, full\_message):
"""Function calling function which executes function calls when the model believes it is necessary.
Currently extended by adding clauses to this if statement."""
if full\_message.message.function\_call.name == "get\_articles":
try:
parsed\_output = json.loads(
full\_message.message.function\_call.arguments
)
print("Getting search results")
results = get\_articles(parsed\_output["query"])
except Exception as e:
print(parsed\_output)
print(f"Function execution failed")
print(f"Error message: {e}")
messages.append(
{
"role": "function",
"name": full\_message.message.function\_call.name,
"content": str(results),
}
)
try:
print("Got search results, summarizing content")
response = chat\_completion\_request(messages)
return response
except Exception as e:
print(type(e))
raise Exception("Function chat request failed")
elif (
full\_message.message.function\_call.name == "read\_article\_and\_summarize"
):
parsed\_output = json.loads(
full\_message.message.function\_call.arguments
)
print("Finding and reading paper")
summary = summarize\_text(parsed\_output["query"])
return summary
else:
raise Exception("Function does not exist and cannot be called")`
```
## arXiv conversation
Let’s put this all together by testing our functions out in conversation.
```
`# Start with a system message
paper\_system\_message = """You are arXivGPT, a helpful assistant pulls academic papers to answer user questions.
You summarize the papers clearly so the customer can decide which to read to answer their question.
You always provide the article\_url and title so the user can understand the name of the paper and click through to access it.
Begin!"""
paper\_conversation = Conversation()
paper\_conversation.add\_message("system", paper\_system\_message)`
```
```
`# Add a user message
paper\_conversation.add\_message("user", "Hi, how does PPO reinforcement learning work?")
chat\_response = chat\_completion\_with\_function\_execution(
paper\_conversation.conversation\_history, functions=arxiv\_functions
)
assistant\_message = chat\_response.choices[0].message.content
paper\_conversation.add\_message("assistant", assistant\_message)
display(Markdown(assistant\_message))`
```
```
`Function generation requested, calling function
Getting search results
Got search results, summarizing content`
```
Here are some recent papers that discuss Proximal Policy Optimization (PPO) in reinforcement learning, explaining its mechanics and various enhancements:
1. **[Proximal Policy Optimization and its Dynamic Version for Sequence Generation](http://arxiv.org/abs/1808.07982v1)**
* *Summary:* This paper applies PPO to sequence generation tasks, demonstrating that it outperforms traditional policy gradient methods in terms of stability and performance. It introduces a dynamic version of PPO for these tasks.
* [PDF](http://arxiv.org/pdf/1808.07982v1)
* **[CIM-PPO: Proximal Policy Optimization with Liu-Correntropy Induced Metric](http://arxiv.org/abs/2110.10522v3)**
* *Summary:* This work investigates the asymmetry in KL divergence in PPO-KL and proposes PPO-CIM as an enhanced version with lower computation costs and improved policy updates, validated through experiments on continuous-action tasks.
* [PDF](http://arxiv.org/pdf/2110.10522v3)
* **[A2C is a special case of PPO](http://arxiv.org/abs/2205.09123v1)**
* *Summary:* This paper shows that A2C can be viewed as a special case of PPO, providing theoretical justifications and empirical evidence demonstrating their equivalence under controlled conditions.
* [PDF](http://arxiv.org/pdf/2205.09123v1)
* **[Proximal Policy Optimization via Enhanced Exploration Efficiency](http://arxiv.org/abs/2011.05525v1)**
* *Summary:* This paper enhances the PPO algorithm by improving exploration strategies, proposing IEM-PPO, which shows better sample efficiency and rewards than standard methods in complex environments.
* [PDF](http://arxiv.org/pdf/2011.05525v1)
* **[ReMax: A Simple, Effective, and Efficient Reinforcement Learning Method for Aligning Large Language Models](http://arxiv.org/abs/2310.10505v4)**
* *Summary:* The ReMax method is proposed as an alternative to PPO for training large language models, reducing hyper-parameter tuning complexities and enhancing training efficiency.
* [PDF](http://arxiv.org/pdf/2310.10505v4)
* **[Reward Scale Robustness for Proximal Policy Optimization via DreamerV3 Tricks](http://arxiv.org/abs/2310.17805v1)**
* *Summary:* This work examines the applicability of DreamerV3’s tricks to PPO, revealing mixed outcomes and providing insights into the clipping mechanism in PPO’s performance.
* [PDF](http://arxiv.org/pdf/2310.17805v1)
* **[Neural PPO-Clip Attains Global Optimality: A Hinge Loss Perspective](http://arxiv.org/abs/2110.13799v4)**
* *Summary:* This paper establishes a theoretical grounding for PPO-Clip and introduces new interpretive frameworks for its mechanics, showing improved convergence properties.
* [PDF](http://arxiv.org/pdf/2110.13799v4)
* **[Colored Noise in PPO: Improved Exploration and Performance through Correlated Action Sampling](http://dx.doi.org/10.1609/aaai.v38i11.29139)**
* *Summary:* This study proposes a variant of PPO using correlated noise for improved exploration, demonstrating enhanced performance over traditional approaches.
* [PDF](http://arxiv.org/abs/2312.11091v2)
* **[A dynamical clipping approach with task feedback for Proximal Policy Optimization](http://arxiv.org/abs/2312.07624v3)**
* *Summary:* The paper presents Pb-PPO, which dynamically adjusts the clipping bounds in PPO to enhance returns, showing improved performance across various tasks.
* [PDF](http://arxiv.org/pdf/2312.07624v3)
* **[PPO-UE: Proximal Policy Optimization via Uncertainty-Aware Exploration](http://arxiv.org/abs/2212.06343v1)**
* *Summary:* Introducing PPO-UE, which incorporates uncertainty-aware exploration, this paper shows improvements in convergence speed and performance compared to standard PPO.
* [PDF](http://arxiv.org/pdf/2212.06343v1)
These papers provide a comprehensive view of the developments and enhancements in PPO and how it operates within the reinforcement learning framework. You can click on the titles to access the full articles.
```
`# Add another user message to induce our system to use the second tool
paper\_conversation.add\_message(
"user",
"Can you read the PPO sequence generation paper for me and give me a summary",
)
updated\_response = chat\_completion\_with\_function\_execution(
paper\_conversation.conversation\_history, functions=arxiv\_functions
)
display(Markdown(updated\_response.choices[0].message.content))`
```
```
`Function generation requested, calling function
Finding and reading paper
Existing papers found... Articles: 20
Chunking text from paper
Summarizing each chunk of text`
```
```
`100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:04\<00:00, 1.21s/it]`
```
```
`Summarizing into overall summary`
```
### Core Argument
* The paper argues for the adoption of Proximal Policy Optimization (PPO) and its dynamic variant (PPO-dynamic) as superior methods for sequence generation tasks, particularly in the context of chit-chat chatbots, compared to traditional policy gradient methods.
* It highlights the instability and suboptimal performance of traditional policy gradient methods, such as REINFORCE, and presents PPO as a more stable and efficient alternative.
### Evidence
* **Challenges with Policy Gradient**: Traditional methods lead to unstable training and poor performance due to large updates and similar action tendencies, especially in non-differentiable evaluation metrics like BLEU scores.
* **PPO Advantages**: PPO regularizes policy updates, enhancing stability and coherence in chatbot responses.
* **Dynamic PPO Approach**: PPO-dynamic introduces dynamic adjustments to the KL-divergence bounds, allowing for more flexible and effective training.
* **Experimental Validation**: Experiments on synthetic tasks and real-world chit-chat scenarios demonstrate that PPO and PPO-dynamic outperform REINFORCE and other algorithms (like MIXER and SeqGAN) in terms of stability and performance metrics, including BLEU-2 scores.
* **Results**: PPO-dynamic showed significant improvements in precision on counting tasks and achieved the highest BLEU-2 score for chatbot responses, indicating better performance in generating diverse and accurate outputs.
### Conclusions
* The paper concludes that replacing traditional policy gradient methods with PPO, particularly the dynamic version, leads to more stable training and faster convergence in sequence generation tasks.
* The proposed PPO-dynamic method enhances the training process by dynamically adjusting constraints, resulting in improved performance and efficiency in generating human-like conversational agents.
* Future research directions are suggested to further explore the potential of PPO and its adaptations in natural language processing applications.