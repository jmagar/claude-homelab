Question answering with Langchain, AnalyticDB and OpenAI
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
May 5, 2023
# Question answering with Langchain, AnalyticDB and OpenAI
[ WA ](https://github.com/wangxuqi)
[ wangxuqi ](https://github.com/wangxuqi)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/analyticdb/QA_with_Langchain_AnalyticDB_and_OpenAI.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/analyticdb/QA_with_Langchain_AnalyticDB_and_OpenAI.ipynb)
This notebook presents how to implement a Question Answering system with Langchain, AnalyticDB as a knowledge based and OpenAI embeddings. If you are not familiar with AnalyticDB, it’s better to check out the [Getting\_started\_with\_AnalyticDB\_and\_OpenAI.ipynb](Getting_started_with_AnalyticDB_and_OpenAI.ipynb) notebook.
This notebook presents an end-to-end process of:
* Calculating the embeddings with OpenAI API.
* Storing the embeddings in an AnalyticDB instance to build a knowledge base.
* Converting raw text query to an embedding with OpenAI API.
* Using AnalyticDB to perform the nearest neighbour search in the created collection to find some context.
* Asking LLM to find the answer in a given context.
All the steps will be simplified to calling some corresponding Langchain methods.
## Prerequisites
For the purposes of this exercise we need to prepare a couple of things:
[AnalyticDB cloud instance](https://www.alibabacloud.com/help/en/analyticdb-for-postgresql/latest/product-introduction-overview).
[Langchain](https://github.com/hwchase17/langchain) as a framework.
An OpenAI API key.
### Install requirements
This notebook requires the following Python packages: `openai`, `tiktoken`, `langchain` and `psycopg2cffi`.
* `openai` provides convenient access to the OpenAI API.
* `tiktoken` is a fast BPE tokeniser for use with OpenAI’s models.
* `langchain` helps us to build applications with LLM more easily.
* `psycopg2cffi` library is used to interact with the vector database, but any other PostgreSQL client library is also acceptable.
```
`! pip install openai tiktoken langchain psycopg2cffi`
```
```
`! export OPENAI\_API\_KEY="your API key"`
```
```
`# Test that your OpenAI API key is correctly set as an environment variable
# Note. if you run this notebook locally, you will need to reload your terminal and the notebook for the env variables to be live.
import os
# Note. alternatively you can set a temporary env variable like this:
# os.environ["OPENAI\_API\_KEY"] = "sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
if os.getenv("OPENAI\_API\_KEY") is not None:
print("OPENAI\_API\_KEY is ready")
else:
print("OPENAI\_API\_KEY environment variable not found")`
```
```
`OPENAI\_API\_KEY is ready`
```
### Prepare your OpenAI API key
The OpenAI API key is used for vectorization of the documents and queries.
If you don’t have an OpenAI API key, you can get one from [[https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys) ).
Once you get your key, please add it to your environment variables as `OPENAI\_API\_KEY` by running following command:
### Prepare your AnalyticDB connection string
To build the AnalyticDB connection string, you need to have the following parameters: `PG\_HOST`, `PG\_PORT`, `PG\_DATABASE`, `PG\_USER`, and `PG\_PASSWORD`. You need to export them first to set correct connect string. Then build the connection string.
```
`! export PG\_HOST="your AnalyticDB host url"
! export PG\_PORT=5432 # Optional, default value is 5432
! export PG\_DATABASE=postgres # Optional, default value is postgres
! export PG\_USER="your username"
! export PG\_PASSWORD="your password"`
```
```
`import os
from langchain.vectorstores.analyticdb import AnalyticDB
CONNECTION\_STRING = AnalyticDB.connection\_string\_from\_db\_params(
driver=os.environ.get("PG\_DRIVER", "psycopg2cffi"),
host=os.environ.get("PG\_HOST", "localhost"),
port=int(os.environ.get("PG\_PORT", "5432")),
database=os.environ.get("PG\_DATABASE", "postgres"),
user=os.environ.get("PG\_USER", "postgres"),
password=os.environ.get("PG\_PASSWORD", "postgres"),
)`
```
```
`import json
with open("questions.json", "r") as fp:
questions = json.load(fp)
with open("answers.json", "r") as fp:
answers = json.load(fp)`
```
## Load data
In this section we are going to load the data containing some natural questions and answers to them. All the data will be used to create a Langchain application with AnalyticDB being the knowledge base.
```
`print(questions[0])`
```
```
`when is the last episode of season 8 of the walking dead`
```
```
`import wget
# All the examples come from https://ai.google.com/research/NaturalQuestions
# This is a sample of the training set that we download and extract for some
# further processing.
wget.download("https://storage.googleapis.com/dataset-natural-questions/questions.json")
wget.download("https://storage.googleapis.com/dataset-natural-questions/answers.json")`
```
```
`print(answers[0])`
```
```
`No . overall No. in season Title Directed by Written by Original air date U.S. viewers ( millions ) 100 `` Mercy '' Greg Nicotero Scott M. Gimple October 22 , 2017 ( 2017 - 10 - 22 ) 11.44 Rick , Maggie , and Ezekiel rally their communities together to take down Negan . Gregory attempts to have the Hilltop residents side with Negan , but they all firmly stand behind Maggie . The group attacks the Sanctuary , taking down its fences and flooding the compound with walkers . With the Sanctuary defaced , everyone leaves except Gabriel , who reluctantly stays to save Gregory , but is left behind when Gregory abandons him . Surrounded by walkers , Gabriel hides in a trailer , where he is trapped inside with Negan . 101 `` The Damned '' Rosemary Rodriguez Matthew Negrete & Channing Powell October 29 , 2017 ( 2017 - 10 - 29 ) 8.92 Rick 's forces split into separate parties to attack several of the Saviors ' outposts , during which many members of the group are killed ; Eric is critically injured and rushed away by Aaron . Jesus stops Tara and Morgan from executing a group of surrendered Saviors . While clearing an outpost with Daryl , Rick is confronted and held at gunpoint by Morales , a survivor he met in the initial Atlanta camp , who is now with the Saviors . 102 `` Monsters '' Greg Nicotero Matthew Negrete & Channing Powell November 5 , 2017 ( 2017 - 11 - 05 ) 8.52 Daryl finds Morales threatening Rick and kills him ; the duo then pursue a group of Saviors who are transporting weapons to another outpost . Gregory returns to Hilltop , and after a heated argument , Maggie ultimately allows him back in the community . Eric dies from his injuries , leaving Aaron distraught . Despite Tara and Morgan 's objections , Jesus leads the group of surrendered Saviors to Hilltop . Ezekiel 's group attacks another Savior compound , during which several Kingdommers are shot while protecting Ezekiel . 103 `` Some Guy '' Dan Liu David Leslie Johnson November 12 , 2017 ( 2017 - 11 - 12 ) 8.69 Ezekiel 's group is overwhelmed by the Saviors , who kill all of them except for Ezekiel himself and Jerry . Carol clears the inside of the compound , killing all but two Saviors , who almost escape but are eventually caught by Rick and Daryl . En route to the Kingdom , Ezekiel , Jerry , and Carol are surrounded by walkers , but Shiva sacrifices herself to save them . The trio returns to the Kingdom , where Ezekiel 's confidence in himself as a leader has diminished . 104 5 `` The Big Scary U '' Michael E. Satrazemis Story by : Scott M. Gimple & David Leslie Johnson & Angela Kang Teleplay by : David Leslie Johnson & Angela Kang November 19 , 2017 ( 2017 - 11 - 19 ) 7.85 After confessing their sins to each other , Gabriel and Negan manage to escape from the trailer . Simon and the other lieutenants grow suspicious of each other , knowing that Rick 's forces must have inside information . The workers in the Sanctuary become increasingly frustrated with their living conditions , and a riot nearly ensues , until Negan returns and restores order . Gabriel is locked in a cell , where Eugene discovers him sick and suffering . Meanwhile , Rick and Daryl argue over how to take out the Saviors , leading Daryl to abandon Rick . 105 6 `` The King , the Widow , and Rick '' John Polson Angela Kang & Corey Reed November 26 , 2017 ( 2017 - 11 - 26 ) 8.28 Rick visits Jadis in hopes of convincing her to turn against Negan ; Jadis refuses , and locks Rick in a shipping container . Carl encounters Siddiq in the woods and recruits him to Alexandria . Daryl and Tara plot to deviate from Rick 's plans by destroying the Sanctuary . Ezekiel isolates himself at the Kingdom , where Carol tries to encourage him to be the leader his people need . Maggie has the group of captured Saviors placed in a holding area and forces Gregory to join them as punishment for betraying Hilltop . 106 7 `` Time for After '' Larry Teng Matthew Negrete & Corey Reed December 3 , 2017 ( 2017 - 12 - 03 ) 7.47 After learning of Dwight 's association with Rick 's group , Eugene affirms his loyalty to Negan and outlines a plan to get rid of the walkers surrounding the Sanctuary . With help from Morgan and Tara , Daryl drives a truck through the Sanctuary 's walls , flooding its interior with walkers , killing many Saviors . Rick finally convinces Jadis and the Scavengers to align with him , and they plan to force the Saviors to surrender . However , when they arrive at the Sanctuary , Rick is horrified to see the breached walls and no sign of the walker herd . 107 8 `` How It 's Gotta Be '' Michael E. Satrazemis David Leslie Johnson & Angela Kang December 10 , 2017 ( 2017 - 12 - 10 ) 7.89 Eugene 's plan allows the Saviors to escape , and separately , the Saviors waylay the Alexandria , Hilltop , and Kingdom forces . The Scavengers abandon Rick , after which he returns to Alexandria . Ezekiel ensures that the Kingdom residents are able to escape before locking himself in the community with the Saviors . Eugene aids Gabriel and Doctor Carson in escaping the Sanctuary in order to ease his conscience . Negan attacks Alexandria , but Carl devises a plan to allow the Alexandria residents to escape into the sewers . Carl reveals he was bitten by a walker while escorting Siddiq to Alexandria . 108 9 `` Honor '' Greg Nicotero Matthew Negrete & Channing Powell February 25 , 2018 ( 2018 - 02 - 25 ) 8.28 After the Saviors leave Alexandria , the survivors make for the Hilltop while Rick and Michonne stay behind to say their final goodbyes to a dying Carl , who pleads with Rick to build a better future alongside the Saviors before killing himself . In the Kingdom , Morgan and Carol launch a rescue mission for Ezekiel . Although they are successful and retake the Kingdom , the Saviors ' lieutenant Gavin is killed by Benjamin 's vengeful brother Henry . 109 10 `` The Lost and the Plunderers '' TBA TBA March 4 , 2018 ( 2018 - 03 - 04 ) TBD 110 11 `` Dead or Alive Or '' TBA TBA March 11 , 2018 ( 2018 - 03 - 11 ) TBD 111 12 `` The Key '' TBA TBA March 18 , 2018 ( 2018 - 03 - 18 ) TBD`
```
## Chain definition
Langchain is already integrated with AnalyticDB and performs all the indexing for given list of documents. In our case we are going to store the set of answers we have.
```
`from langchain.vectorstores import AnalyticDB
from langchain.embeddings import OpenAIEmbeddings
from langchain import VectorDBQA, OpenAI
embeddings = OpenAIEmbeddings()
doc\_store = AnalyticDB.from\_texts(
texts=answers, embedding=embeddings, connection\_string=CONNECTION\_STRING,
pre\_delete\_collection=True,
)`
```
At this stage all the possible answers are already stored in AnalyticDB, so we can define the whole QA chain.
```
`from langchain.chains import RetrievalQA
llm = OpenAI()
qa = VectorDBQA.from\_chain\_type(
llm=llm,
chain\_type="stuff",
vectorstore=doc\_store,
return\_source\_documents=False,
)`
```
## Search data
Once the data is put into AnalyticDB we can start asking some questions. A question will be automatically vectorized by OpenAI model, and the created vector will be used to find some possibly matching answers in AnalyticDB. Once retrieved, the most similar answers will be incorporated into the prompt sent to OpenAI Large Language Model.
```
`import random
random.seed(52)
selected\_questions = random.choices(questions, k=5)`
```
```
`for question in selected\_questions:
print("\>", question)
print(qa.run(question), end="\\n\\n")`
```
```
`\> where do frankenstein and the monster first meet
Victor retreats into the mountains, and that is where the Creature finds him and pleads for Victor to hear his tale.
\> who are the actors in fast and furious
The main cast of Fast & Furious includes Vin Diesel as Dominic Toretto, Paul Walker as Brian O'Conner, Michelle Rodriguez as Letty Ortiz, Jordana Brewster as Mia Toretto, Tyrese Gibson as Roman Pearce, and Ludacris as Tej Parker.
\> properties of red black tree in data structure
The properties of a red-black tree in data structure are that each node is either red or black, the root is black, all leaves (NIL) are black, and if a node is red, then both its children are black. Additionally, every path from a given node to any of its descendant NIL nodes contains the same number of black nodes.
\> who designed the national coat of arms of south africa
Iaan Bekker
\> caravaggio's death of the virgin pamela askew
I don't know.`
```
### Custom prompt templates
The `stuff` chain type in Langchain uses a specific prompt with question and context documents incorporated. This is what the default prompt looks like:
```
`Use the following pieces of context to answer the question at the end. If you don't know the answer, just say that you don't know, don't try to make up an answer.
{context}
Question: {question}
Helpful Answer:`
```
We can, however, provide our prompt template and change the behaviour of the OpenAI LLM, while still using the `stuff` chain type. It is important to keep `{context}` and `{question}` as placeholders.
#### Experimenting with custom prompts
We can try using a different prompt template, so the model:
1. Responds with a single-sentence answer if it knows it.
2. Suggests a random song title if it doesn’t know the answer to our question.
```
`from langchain.prompts import PromptTemplate
custom\_prompt = """
Use the following pieces of context to answer the question at the end. Please provide
a short single-sentence summary answer only. If you don't know the answer or if it's
not present in given context, don't try to make up an answer, but suggest me a random
unrelated song title I could listen to.
Context: {context}
Question: {question}
Helpful Answer:
"""
custom\_prompt\_template = PromptTemplate(
template=custom\_prompt, input\_variables=["context", "question"]
)`
```
```
`custom\_qa = VectorDBQA.from\_chain\_type(
llm=llm,
chain\_type="stuff",
vectorstore=doc\_store,
return\_source\_documents=False,
chain\_type\_kwargs={"prompt": custom\_prompt\_template},
)`
```
```
`random.seed(41)
for question in random.choices(questions, k=5):
print("\>", question)
print(custom\_qa.run(question), end="\\n\\n")`
```
```
`\> what was uncle jesse's original last name on full house
Uncle Jesse's original last name on Full House was Cochran.
\> when did the volcano erupt in indonesia 2018
No information about a volcano erupting in Indonesia in 2018 is present in the given context. Suggested song title: "Volcano" by U2.
\> what does a dualist way of thinking mean
A dualist way of thinking means believing that humans possess a non-physical mind or soul which is distinct from their physical body.
\> the first civil service commission in india was set up on the basis of recommendation of
The first Civil Service Commission in India was not set up on the basis of a recommendation.
\> how old do you have to be to get a tattoo in utah
In Utah, you must be at least 18 years old to get a tattoo.`
```