Temporal Agents with Knowledge Graphs
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
Jul 22, 2025
# Temporal Agents with Knowledge Graphs
[ DW ](https://www.linkedin.com/in/dannywigg/)[ SK ](https://www.linkedin.com/in/shikharkwatra/)[ AH ](<https://github.com/Alex Heald>)[ DA ](<https://github.com/Douglas Adams>)[ RS ](<https://github.com/Rishabh Sagar>)
[ Danny Wigg
(OpenAI)
, ](https://www.linkedin.com/in/dannywigg/)[ Shikhar Kwatra
(OpenAI)
, ](https://www.linkedin.com/in/shikharkwatra/)[ Alex Heald , ](<https://github.com/Alex Heald>)[ Douglas Adams , ](<https://github.com/Douglas Adams>)[ Rishabh Sagar ](<https://github.com/Rishabh Sagar>)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/partners/temporal_agents_with_knowledge_graphs/temporal_agents.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/partners/temporal_agents_with_knowledge_graphs/temporal_agents.ipynb)
## 1.1. Purpose and Audience
This notebook provides a hands-on guide for building **temporally-aware knowledge graphs** and performing **multi-hop retrieval directly over those graphs**.
It’s designed for engineers, architects, and analysts working on temporally-aware knowledge graphs. Whether you’re prototyping, deploying at scale, or exploring new ways to use structured data, you’ll find practical workflows, best practices, and decision frameworks to accelerate your work.
This cookbook presents two hands-on workflows you can use, extend, and deploy right away:
1. **Temporally-aware knowledge graph (KG) construction**
A key challenge in developing knowledge-driven AI systems is maintaining a database that stays current and relevant. While much attention is given to boosting retrieval accuracy with techniques like semantic similarity and re-ranking, this guide focuses on a fundamental—yet frequently overlooked—aspect: *systematically updating and validating your knowledge base as new data arrives*.
No matter how advanced your retrieval algorithms are, their effectiveness is limited by the quality and freshness of your database. This cookbook demonstrates how to routinely validate and update knowledge graph entries as new data arrives, helping ensure that your knowledge base remains accurate and up to date.
2. **Multi-hop retrieval using knowledge graphs**
Learn how to combine OpenAI models (such as o3, o4-mini, GPT-4.1, and GPT-4.1-mini) with structured graph queries via tool calls, enabling the model to traverse your graph in multiple steps across entities and relationships.
This method lets your system answer complex, multi-faceted questions that require reasoning over several linked facts, going well beyond what single-hop retrieval can accomplish.
Inside, you’ll discover:
* **Practical decision frameworks** for choosing models and prompting techniques at each stage
* **Plug-and-play code examples** for easy integration into your ML and data pipelines
* **Links to in-depth resources** on OpenAI tool use, fine-tuning, graph backend selection, and more
* **A clear path from prototype to production**, with actionable best practices for scaling and reliability
>
**> Note:
**> All benchmarks and recommendations are based on the best available models and practices as of June 2025. As the ecosystem evolves, periodically revisit your approach to stay current with new capabilities and improvements.
>
## 1.2. Key takeaways
### Creating a Temporally-Aware Knowledge Graph with a Temporal Agent
1. **Why make your knowledge graph temporal?**
Traditional knowledge graphs treat facts as static, but real-world information evolves constantly. What was true last quarter may be outdated today, risking errors or misinformed decisions if the graph does not capture change over time. Temporal knowledge graphs allow you to precisely answer questions like “What was true on a given date?” or analyse how facts and relationships have shifted, ensuring decisions are always based on the most relevant context.
2. **What is a Temporal Agent?**
A Temporal Agent is a pipeline component that ingests raw data and produces time-stamped triplets for your knowledge graph. This enables precise time-based querying, timeline construction, trend analysis, and more.
3. **How does the pipeline work?**
The pipeline starts by semantically chunking your raw documents. These chunks are decomposed into statements ready for our Temporal Agent, which then creates time-aware triplets. An Invalidation Agent can then perform temporal validity checks, spotting and handling any statements that are invalidated by new statements that are incident on the graph.
### Multi-Step Retrieval Over a Knowledge Graph
1. **Why use multi-step retrieval?**
Direct, single-hop queries frequently miss salient facts distributed across a graph's topology. Multi-step (multi-hop) retrieval enables iterative traversal, following relationships and aggregating evidence across several hops. This methodology surfaces complex dependencies and latent connections that would remain hidden with one-shot lookups, providing more comprehensive and nuanced answers to sophisticated queries.
2. **Planners**
Planners orchestrate the retrieval process. *Task-orientated* planners decompose queries into concrete, sequential subtasks. *Hypothesis-orientated* planners, by contrast, propose claims to confirm, refute, or evolve. Choosing the optimal strategy depends on where the problem lies on the spectrum from deterministic reporting (well-defined paths) to exploratory research (open-ended inference).
3. **Tool Design Paradigms**
Tool design spans a continuum: *Fixed tools* provide consistent, predictable outputs for specific queries (e.g., a service that always returns today’s weather for San Francisco). At the other end, *Free-form tools* offer broad flexibility, such as code execution or open-ended data retrieval. *Semi-structured tools* fall between these extremes, restricting certain actions while allowing tailored flexibility—specialized sub-agents are a typical example. Selecting the appropriate paradigm is a trade-off between control, adaptability, and complexity.
4. **Evaluating Retrieval Systems**
High-fidelity evaluation hinges on expert-curated "golden" answers, though these are costly and labor-intensive to produce. Automated judgments, such as those from LLMs or tool traces, can be quickly generated to supplement or pre-screen, but may lack the precision of human evaluation. As your system matures, transition towards leveraging real user feedback to measure and optimize retrieval quality in production.
A proven workflow: Start with synthetic tests, benchmark on your curated human-annotated "golden" dataset, and iteratively refine using live user feedback and ratings.
### Prototype to Production
1. **Keep the graph lean**
Established archival policies and assign numeric relevance scores to each edge (e.g., recency x trust x query-frequency). Automate the archival or sparsification of low-value nodes and edges, ensuring only the most critical and frequently accessed facts remain for rapid retrieval.
2. **Parallelize the ingestion pipeline**
Transition from a linear document → chunk → extraction → resolution pipeline to a staged, asynchronous architecture. Assign each processing phase its own queue and dedicated worker pool. Apply clustering or network-based batching for invalidation jobs to maximize efficiency. Batch external API requests (e.g., OpenAI) and database writes wherever possible. This design increases throughput, introduces backpressure for reliability, and allows you to scale each pipeline stage independently.
3. **Integrate Robust Production Safeguards**
Enforce rigorous output validation: standardise temporal fields (e.g., ISO-8601 date formatting), constrain entity types to your controlled vocabulary, and apply lightweight model-based sanity checks for output consistency. Employ structured logging with traceable identifiers and monitor real-time quality and performance metrics in real lime to proactively detect data drift, regressions, or pipeline anomalised before they impact downstream applications.
# 2. How to Use This Cookbook
This cookbook is designed for flexible engagement:
1. Use it as a comprehensive technical guide—read from start to finish for a deep understanding of temporally-aware knowledge graph systems.
2. Skim for advanced concepts, methodologies, and implementation patterns if you prefer a high-level overview.
3. Jump into any of the three modular sections; each is self-contained and directly applicable to real-world scenarios.
Inside, you’ll find:
1. **Creating a Temporally-Aware Knowledge Graph with a Temporal Agent**
Build a pipeline that extracts entities and relations from unstructured text, resolves temporal conflicts, and keeps your graph up-to-date as new information arrives.
2. **Multi-Step Retrieval Over a Knowledge Graph**
Use structured queries and language model reasoning to chain multiple hops across your graph and answer complex questions.
3. **Prototype to Production**
Move from experimentation to deployment. This section covers architectural tips, integration patterns, and considerations for scaling reliably.
## 2.1. Pre-requisites
Before diving into building temporal agents and knowledge graphs, let’s set up your environment. Install all required dependencies with pip, and set your OpenAI API key as an environment variable. Python 3.12 or later is required.
```
`!python -V
%pip install --upgrade pip
%pip install -qU chonkie datetime ipykernel jinja2 matplotlib networkx numpy openai plotly pydantic rapidfuzz scipy tenacity tiktoken pandas
%pip install -q "datasets\<3.0"`
```
```
`Python 3.12.8
Requirement already satisfied: pip in ./.venv/lib/python3.12/site-packages (25.1.1)
Note: you may need to restart the kernel to use updated packages.
Note: you may need to restart the kernel to use updated packages.
Note: you may need to restart the kernel to use updated packages.`
```
```
`import os
if "OPENAI\_API\_KEY" not in os.environ:
import getpass
os.environ["OPENAI\_API\_KEY"] = getpass.getpass("Paste your OpenAI API key here: ")`
```
# 3. Creating a Temporally-Aware Knowledge Graph with a Temporal Agent
**Accurate data is the foundation of any good business decision.**
OpenAI’s latest models like o3, o4-mini, and the GPT-4.1 family are enabling businesses to build state-of-the-art retrieval systems for their most important workflows. However, information evolves rapidly: facts ingested confidently yesterday may already be outdated today.
Without the ability to track when each fact was valid, retrieval systems risk returning answers that are outdated, non-compliant, or misleading. The consequences of missing temporal context can be severe in any industry, as illustrated by the following examples.
|Industry|Example question|Risk if database is not temporal|
|**Financial Services**|*"How has Moody’s long‑term rating for Bank YY evolved since Feb 2023?"*|Mispricing credit risk by mixing historical & current ratings|
|*"Who was the CFO of Retailer ZZ when the FY‑22 guidance was issued?"*|Governance/insider‑trading analysis may blame the wrong executive|
|*"Was Fund AA sanctioned under Article BB at the time it bought Stock CC in Jan 2024?"*|Compliance report could miss an infraction if rules changed later|
|**Manufacturing / Automotive**|*"Which ECU firmware was deployed in model Q3 cars shipped between 2022‑05 and 2023‑03?"*|Misdiagnosing field failures due to firmware drift|
|*"Which robot‑controller software revision ran on Assembly Line 7 during Lot 8421?"*|Root‑cause analysis may blame the wrong software revision|
|*"What torque specification applied to steering‑column bolts in builds produced in May 2024?"*|Safety recall may miss affected vehicles|
While we’ve called out some specific examples here, this theme is true across many industries including pharmaceuticals, law, consumer goods, and more.
**Looking beyond standard retrieval**
A temporally-aware knowledge graph allows you to go beyond static fact lookup. It enables richer retrieval workflows such as factual Q&A grounded in time, timeline generation, change tracking, counterfactual analysis, and more. We dive into these in more detail in our retrieval section later in the cookbook.
## 3.1. Introducing our Temporal Agent
A **temporal agent** is a specialized pipeline that converts raw, free-form statements into time-aware triplets ready for ingesting into a knowledge graph that can then be queried with the questions of the character *“What was true at time T?”*.
Triplets are the basic building blocks of knowledge graphs. It’s a way to represent a single fact or piece of knowledge using three parts (hence, *“triplet”*):
* **Subject** - the entity you are talking about
* **Predicate** - the type of relationship or property
* **Object** - the value or other entity that the subject is connected to
You can thinking of this like a sentence with a structure `[Subject] - [Predicate] - [Object]`. As a more clear example:
```
`"London" - "isCapitalOf" - "United Kingdom"`
```
The Temporal Agent implemented in this cookbook draws inspiration from [Zep](https://arxiv.org/abs/2501.13956) and [Graphiti](https://github.com/getzep/graphiti), while introducing tighter control over fact invalidation and a more nuanced approach to episodic typing.
### 3.1.1. Key enhancements introduced in this cookbook
1. **Temporal validity extraction**
Builds on Graphiti's prompt design to identify temporal spans and episodic context without requiring auxiliary reference statements.
2. **Fact invalidation logic**
Introduces bidirectionality checks and constrains comparisons by episodic type. This retains Zep's non-lossy approach while reducing unnecessary evaluations.
3. **Temporal & episodic typing**
Differentiates between `Fact`, `Opinion`, `Prediction`, as well as between temporal classes `Static`, `Dynamic`, `Atemporal`.
4. **Multi‑event extraction**
Handles compound sentences and nested date references in a single pass.
This process allows us to update our sources of truth efficiently and reliably:
>
**> Note
**> : While the implementation in this cookbook is focused on a graph-based implementation, this approach is generalizable to other knowledge base structures e.g., pgvector-based systems.
>
### 3.1.2. The Temporal Agent Pipeline
The Temporal Agent processes incoming statements through a three-stage pipeline:
1. **Temporal Classification**
Labels each statement as **Atemporal**, **Static**, or **Dynamic**:
* *Atemporal* statements never change (e.g., “The speed of light in a vaccuum is ≈3×10⁸ m s⁻¹”).
* *Static* statements are valid from a point in time but do not change afterwards (e.g., "Person YY was CEO of Company XX on October 23rd 2014.").
* *Dynamic* statements evolve (e.g., "Person YY is CEO of Company XX.").
* **Temporal Event Extraction**
Identifies relative or partial dates (e.g., “Tuesday”, “three months ago”) and resolves them to an absolute date using the document timestamp or fallback heuristics (e.g., default to the 1st or last of the month if only the month is known).
* **Temporal Validity Check**
Ensures every statement includes a `t\_created` timestamp and, when applicable, a `t\_expired` timestamp. The agent then compares the candidate triplet to existing knowledge graph entries to:
* Detect contradictions and mark outdated entries with `t\_invalid`
* Link newer statements to those they invalidate with `invalidated\_by`
### 3.1.3. Selecting the right model for a Temporal Agent
When building systems with LLMs, it is a good practice to [start with larger models then later look to optimize and shrink](https://platform.openai.com/docs/guides/model-selection).
The GPT-4.1 series is particularly well-suited for building Temporal Agents due to its strong instruction-following ability. On benchmarks like Scale’s MultiChallenge, [GPT-4.1 outperforms GPT-4o by $10.5%\_{abs}$](https://openai.com/index/gpt-4-1/), demonstrating superior ability to maintain context, reason in-conversation, and adhere to instructions - key traits for extracting time-stamped triplets. These capabilities make it an excellent choice for prototyping agents that rely on time-aware data extraction.
#### Recommended development workflow
1. **Prototype with GPT-4.1**
Maximize correctness and reduce prompt-debug time while you build out the core pipeline logic.
2. **Swap to GPT-4.1-mini or GPT-4.1-nano**
Once prompts and logic are stable, switch to smaller variants for lower latency and cost-effective inference.
3. **Distill onto GPT-4.1-mini or GPT-4.1-nano**
Use [OpenAI's Model Distillation](https://platform.openai.com/docs/guides/distillation) to train smaller models with high-quality outputs from a larger 'teacher' model such as GPT-4.1, preserving (or even improving) performance relative to GPT-4.1.
|Model|Relative cost|Relative latency|Intelligence|Ideal Role in Workflow|
|*GPT-4.1*|★★★|★★|★★★ *(highest)*|Ground-truth prototyping, generating data for distillation|
|*GPT-4.1-mini*|★★|★|★★|Balanced cost-performance, mid to large scale production systems|
|*GPT-4.1-nano*|★ *(lowest)*|★ *(fastest)*|★|Cost-sensitive and ultra-large scale bulk processing|
>
> In practice, this looks like: prototype with GPT-4.1 → measure quality → step down the ladder until the trade-offs no longer meet your needs.
>
## 3.2. Building our Temporal Agent Pipeline
Before diving into the implementation details, it’s useful to understand the ingestion pipeline at a high level:
1. **Load transcripts**
2. **Creating a Semantic Chunker**
3. **Laying the Foundations for our Temporal Agent**
4. **Statement Extraction**
5. **Temporal Range Extraction**
6. **Creating our Triplets**
7. **Temporal Events**
8. **Defining our Temporal Agent**
9. **Entity Resolution**
10. **Invalidation Agent**
11. **Building our pipeline**
### Architecture diagram
### 3.2.1. Load transcripts
For the purposes of this cookbook, we have selected the [“Earnings Calls Dataset” (jlh-ibm/earnings\_call)](https://huggingface.co/datasets/jlh-ibm/earnings_call) which is made available under the Creative Commons Zero v1.0 license. This dataset contains a collection of 188 earnings call transcripts originating in the period 2016-2020 in relation to the NASDAQ stock market. We believe this dataset is a good choice for this cookbook as extracting information from - and subsequently querying information from - earnings call transcripts is a common problem in many financial institutions around the world.
Moreover, the often variable character of statements and topics from the same company across multiple earnings calls provides a useful vector through which to demonstrate the temporal knowledge graph concept.
Despite this dataset’s focus on the financial world, we build up the Temporal Agent in a general structure, so it will be quick to adapt to similar problems in other industries such as pharmaceuticals, law, automotive, and more.
For the purposes of this cookbook we are limiting the processing to two companies - AMD and Nvidia - though in practice this pipeline can easily be scaled to any company.
Let’s start by loading the dataset from HuggingFace.
```
`from datasets import load\_dataset
hf\_dataset\_name = "jlh-ibm/earnings\_call"
subset\_options = ["stock\_prices", "transcript-sentiment", "transcripts"]
hf\_dataset = load\_dataset(hf\_dataset\_name, subset\_options[2])
my\_dataset = hf\_dataset["train"]`
```
```
`my\_dataset`
```
```
`Dataset({
features: ['company', 'date', 'transcript'],
num\_rows: 150
})`
```
```
`row = my\_dataset[0]
row["company"], row["date"], row["transcript"][:200]`
```
```
`from collections import Counter
company\_counts = Counter(my\_dataset["company"])
company\_counts`
```
**Database Set-up**
Before we get to processing this data, let’s set up our database.
For convenience within a notebook format, we’ve chosen SQLite as our database for this implementation. In the “Prototype to Production” section, and in [Appendix section A.1 “Storing and Retrieving High-Volume Graph Data”](./Appendix.ipynb) we go into more detail of considerations around different dataset choices in a production environment.
If you are running this cookbook locally, you may chose to set `memory = False` to save the database to storage, the default file path `my\_database.db` will be used to store your database or you may pass your own `db\_path` arg into `make\_connection`.
We will set up several tables to store the following information:
* Transcripts
* Chunks
* Temporal Events
* Triplets
* Entities (including canonical mappings)
This code is abstracted behind a `make\_connection` method which creates the new SQLite database. The details of this method can be found in the `db\_interface.py` script in the GitHub repository for this cookbook.
```
`from db\_interface import make\_connection
sqlite\_conn = make\_connection(memory=False, refresh=True)`
```
### 3.2.2. Creating a Semantic Chunker
Before diving into buidling the `Chunker` class itself, we begin by defining our first data models. As is generally considered good practice when working with Python, [Pydantic](https://docs.pydantic.dev/latest/) is used to ensure type safety and clarity in our model definitions. Pydantic provides a clean, declarative way to define data structures whilst automatically validating and parsing input data, making our data models both robust and easy to work with.
#### Chunk model
This is a core data model that we’ll use to store individual segments of text extracted from transcripts, along with any associated metadata. As we process the transcripts by breaking them into semantically meaningful chunks, each piece will be saved as a separate `Chunk`.
Each `Chunk` contains:
* `id`: A unique identifier automatically generated for each chunk. This helps us identify and track chunks of text throughout
* `text`: A string field that contains the text content of the chunk
* `metadata`: A dictionary to allow for flexible metadata storage
```
`import uuid
from typing import Any
from pydantic import BaseModel, Field
class Chunk(BaseModel):
"""A chunk of text from an earnings call."""
id: uuid.UUID = Field(default\_factory=uuid.uuid4)
text: str
metadata: dict[str, Any]`
```
#### Transcript model
As the name suggests, we will use the `Transcript` model to represent the full content of an earnings call transcript. It captures several key pieces of information:
* `id`: Analogous to `Chunk`, this gives us a unique identifier
* `text`: The full text of the transcript
* `company`: The name of the company that the earnings call was about
* `date`: The date of the earnings call
* `quarter`: The fiscal quarter that the earnings call was in
* `chunks`: A list of `Chunk` objects, each representing a meaningful segment of the full transcript
To ensure the `date` field is handled correctly, the `to\_datetime` validator is used to convert the value to datetime format.
```
`from datetime import datetime
from pydantic import field\_validator
class Transcript(BaseModel):
"""A transcript of a company earnings call."""
id: uuid.UUID = Field(default\_factory=uuid.uuid4)
text: str
company: str
date: datetime
quarter: str | None = None
chunks: list[Chunk] | None = None
@field\_validator("date", mode="before")
@classmethod
def to\_datetime(cls, d: Any) -\> datetime:
"""Convert input to a datetime object."""
if isinstance(d, datetime):
return d
if hasattr(d, "isoformat"):
return datetime.fromisoformat(d.isoformat())
return datetime.fromisoformat(str(d))`
```
#### Chunker class
Now, we define the `Chunker` class to split each transcript into semantically meaningful chunks. Instead of relying on arbitrary rules like character count or line break, we apply semantic chunking to preserve more of the contextual integrity of the original transcript. This ensures that each chunk is a self-contained unit that keeps contextually linked ideas together. This is particularly helpful for downstream tasks like statement extraction, where context heavily influences accuracy.
The chunker class contains two methods:
* `find\_quarter`
This method attempts to extract the fiscal quarter (e.g., “Q1 2023”) directly from the transcript text using a simple regular expression. In this case, this is straightforward as the data format of quarters in the transcripts is consistent and well defined.
However, in real world scenarios, detecting the quarter reliably may require more work. Across multiple sources or document types the detailing of the quarter is likely to be different. LLMs are great tools to help alleviate this issue. Try using GPT-4.1-mini with a prompt specifically to extract the quarter given wider context from the document.
* `generate\_transcripts\_and\_chunks`
This is the core method that takes in a dataset (as an iterable of dictionaries) and returns a list of `Transcript` objects each populated with semantically derived `Chunk`s. It performs the following steps:
1. *Transcript creation*: Initializes `Transcript` objects using the provided text, company, and date fields
2. *Filtering*: Uses the `SemanticChunker` from [chonkie](https://chonkie.ai/) along with OpenAI’s text-embedding-3-small model to split the transcript into logical segments
3. *Chunk assignment*: Wraps each semantic segment into a `Chunk` model, attaching relevant metadata like start and end indices
The chunker falls in to this part of our pipeline:
```
`import re
from concurrent.futures import ThreadPoolExecutor, as\_completed
from typing import Any
from chonkie import OpenAIEmbeddings, SemanticChunker
from tqdm import tqdm
class Chunker:
"""
Takes in transcripts of earnings calls and extracts quarter information and splits
the transcript into semantically meaningful chunks using embedding-based similarity.
"""
def \_\_init\_\_(self, model: str = "text-embedding-3-small"):
self.model = model
def find\_quarter(self, text: str) -\> str | None:
"""Extract the quarter (e.g., 'Q1 2023') from the input text if present, otherwise return None."""
# In this dataset we can just use regex to find the quarter as it is consistently defined
search\_results = re.findall(r"[Q]\\d\\s\\d{4}", text)
if search\_results:
quarter = str(search\_results[0])
return quarter
return None
def generate\_transcripts\_and\_chunks(
self,
dataset: Any,
company: list[str] | None = None,
text\_key: str = "transcript",
company\_key: str = "company",
date\_key: str = "date",
threshold\_value: float = 0.7,
min\_sentences: int = 3,
num\_workers: int = 50,
) -\> list[Transcript]:
"""Populate Transcript objects with semantic chunks."""
# Populate the Transcript objects with the passed data on the transcripts
transcripts = [
Transcript(
text=d[text\_key],
company=d[company\_key],
date=d[date\_key],
quarter=self.find\_quarter(d[text\_key]),
)
for d in dataset
]
if company:
transcripts = [t for t in transcripts if t.company in company]
def \_process(t: Transcript) -\> Transcript:
if not hasattr(\_process, "chunker"):
embed\_model = OpenAIEmbeddings(self.model)
\_process.chunker = SemanticChunker(
embedding\_model=embed\_model,
threshold=threshold\_value,
min\_sentences=max(min\_sentences, 1),
)
semantic\_chunks = \_process.chunker.chunk(t.text)
t.chunks = [
Chunk(
text=c.text,
metadata={
"start\_index": getattr(c, "start\_index", None),
"end\_index": getattr(c, "end\_index", None),
},
)
for c in semantic\_chunks
]
return t
# Create the semantic chunks and add them to their respective Transcript object using a thread pool
with ThreadPoolExecutor(max\_workers=num\_workers) as pool:
futures = [pool.submit(\_process, t) for t in transcripts]
transcripts = [
f.result()
for f in tqdm(
as\_completed(futures),
total=len(futures),
desc="Generating Semantic Chunks",
)
]
return transcripts`
```
```
`raw\_data = list(my\_dataset)
chunker = Chunker()
transcripts = chunker.generate\_transcripts\_and\_chunks(raw\_data)`
```
Alternatively, we can load just the `AMD` and `NVDA` pre-chunked transcripts from pre-processed files in `transcripts/`
```
`import pickle
from pathlib import Path
def load\_transcripts\_from\_pickle(directory\_path: str = "transcripts/") -\> list[Transcript]:
"""Load all pickle files from a directory into a dictionary."""
loaded\_transcripts = []
dir\_path = Path(directory\_path).resolve()
for pkl\_file in sorted(dir\_path.glob("\*.pkl")):
try:
with open(pkl\_file, "rb") as f:
transcript = pickle.load(f)
# Ensure it's a Transcript object
if not isinstance(transcript, Transcript):
transcript = Transcript(\*\*transcript)
loaded\_transcripts.append(transcript)
print(f"✅ Loaded transcript from {pkl\_file.name}")
except Exception as e:
print(f"❌ Error loading {pkl\_file.name}: {e}")
return loaded\_transcripts`
```
```
`# transcripts = load\_transcripts\_from\_pickle()`
```
Now we can inspect a couple of chunks:
```
`chunks = transcripts[0].chunks
if chunks is not None:
for i, chunk in enumerate(chunks[21:23]):
print(f"Chunk {i+21}:")
print(f" ID: {chunk.id}")
print(f" Text: {repr(chunk.text[:200])}{'...' if len(chunk.text) \> 100 else ''}")
print(f" Metadata: {chunk.metadata}")
print()
else:
print("No chunks found for the first transcript.")`
```
With this, we have successfully split our transcripts into semantically sectioned chunks. We can now move onto the next steps in our pipeline.
### 3.2.3. Laying the Foundations for our Temporal Agent
Before we move onto defining the `TemporalAgent` class, we will first define the prompts and data models that are needed for it to function.
#### Formalizing our label definitions
For our temporal agent to be able to accurately extract the statement and temporal types we need to provide it with sufficiently detailed and specific context. For convenience, we define these within a structured format below.
Each label contains three crucial pieces of information that we will later pass to our LLMs in prompts.
* `definition`
Provides a concise description of what the label represents. It establishes the conceptual boundaries of the statement or temporal type and ensures consistency in interpretation across examples.
* `date\_handling\_guidance`
Explains how to interpret the temporal validity of a statement associated with the label. It describes how the `valid\_at` and `invalid\_at` dates should be derived when processing instances of that label.
* `date\_handling\_examples`
Includes illustrative examples of how real-world statements would be labelled and temporally annotated under this label. These will be used as few-shot examples to the LLMs downstream.
```
`LABEL\_DEFINITIONS: dict[str, dict[str, dict[str, str]]] = {
"episode\_labelling": {
"FACT": dict(
definition=(
"Statements that are objective and can be independently "
"verified or falsified through evidence."
),
date\_handling\_guidance=(
"These statements can be made up of multiple static and "
"dynamic temporal events marking for example the start, end, "
"and duration of the fact described statement."
),
date\_handling\_example=(
"'Company A owns Company B in 2022', 'X caused Y to happen', "
"or 'John said X at Event' are verifiable facts which currently "
"hold true unless we have a contradictory fact."
),
),
"OPINION": dict(
definition=(
"Statements that contain personal opinions, feelings, values, "
"or judgments that are not independently verifiable. It also "
"includes hypothetical and speculative statements."
),
date\_handling\_guidance=(
"This statement is always static. It is a record of the date the "
"opinion was made."
),
date\_handling\_example=(
"'I like Company A's strategy', 'X may have caused Y to happen', "
"or 'The event felt like X' are opinions and down to the reporters "
"interpretation."
),
),
"PREDICTION": dict(
definition=(
"Uncertain statements about the future on something that might happen, "
"a hypothetical outcome, unverified claims. It includes interpretations "
"and suggestions. If the tense of the statement changed, the statement "
"would then become a fact."
),
date\_handling\_guidance=(
"This statement is always static. It is a record of the date the "
"prediction was made."
),
date\_handling\_example=(
"'It is rumoured that Dave will resign next month', 'Company A expects "
"X to happen', or 'X suggests Y' are all predictions."
),
),
},
"temporal\_labelling": {
"STATIC": dict(
definition=(
"Often past tense, think -ed verbs, describing single points-in-time. "
"These statements are valid from the day they occurred and are never "
"invalid. Refer to single points in time at which an event occurred, "
"the fact X occurred on that date will always hold true."
),
date\_handling\_guidance=(
"The valid\_at date is the date the event occurred. The invalid\_at date "
"is None."
),
date\_handling\_example=(
"'John was appointed CEO on 4th Jan 2024', 'Company A reported X percent "
"growth from last FY', or 'X resulted in Y to happen' are valid the day "
"they occurred and are never invalid."
),
),
"DYNAMIC": dict(
definition=(
"Often present tense, think -ing verbs, describing a period of time. "
"These statements are valid for a specific period of time and are usually "
"invalidated by a Static fact marking the end of the event or start of a "
"contradictory new one. The statement could already be referring to a "
"discrete time period (invalid) or may be an ongoing relationship (not yet "
"invalid)."
),
date\_handling\_guidance=(
"The valid\_at date is the date the event started. The invalid\_at date is "
"the date the event or relationship ended, for ongoing events this is None."
),
date\_handling\_example=(
"'John is the CEO', 'Company A remains a market leader', or 'X is continuously "
"causing Y to decrease' are valid from when the event started and are invalidated "
"by a new event."
),
),
"ATEMPORAL": dict(
definition=(
"Statements that will always hold true regardless of time therefore have no "
"temporal bounds."
),
date\_handling\_guidance=(
"These statements are assumed to be atemporal and have no temporal bounds. Both "
"their valid\_at and invalid\_at are None."
),
date\_handling\_example=(
"'A stock represents a unit of ownership in a company', 'The earth is round', or "
"'Europe is a continent'. These statements are true regardless of time."
),
),
},
}`
```
### 3.2.4. Statement Extraction
“Statement Extraction” refers to the process of splitting our semantic chunks into the smallest possible “atomic” facts. Within our Temporal Agent, this is achieved by:
1. **Finding every standalone, declarative claim**
Extract statements that can stand on their own as complete subject-predicate-object expressions without relying on surrounding context.
2. **Ensuring atomicity**
Break down complex or compound sentences into minimal, indivisible factual units, each expressing a single relationship.
3. **Resolving references**
Replace pronouns or abstract references (e.g., "he" or "The Company") with specific entities (e.g., "John Smith", "AMD") using the main subject for disambiguation.
4. **Preserving temporal and quantitative precision**
Retain explicit dates, durations, and quantities to anchor each fact precisely in time and scale.
5. **Labelling each extracted statement**
Every statement is annotated with a `StatementType` and a `TemporalType`.
#### Temporal Types
The `TemporalType` enum provides a standardized set of temporal categories that make it easier to classify and work with statements extracted from earnings call transcripts.
Each category captures a different kind of temporal reference:
* **Atemporal**: Statements that are universally true and invariant over time (e.g., “The speed of light in a vacuum is ≈3×10⁸ m s⁻¹.”).
* **Static**: Statements that became true at a specific point in time and remain unchanged thereafter (e.g., “Person YY was CEO of Company XX on October 23rd, 2014.”).
* **Dynamic**: Statements that may change over time and require temporal context to interpret accurately (e.g., “Person YY is CEO of Company XX.”).
```
`from enum import StrEnum
class TemporalType(StrEnum):
"""Enumeration of temporal types of statements."""
ATEMPORAL = "ATEMPORAL"
STATIC = "STATIC"
DYNAMIC = "DYNAMIC"`
```
#### Statement Types
Similarly, the `StatementType` enum classifies the nature of each extracted statement, capturing its epistemic characteristics.
* **Fact**: A statement that asserts a verifiable claim considered true at the time it was made. However, it may later be superseded or contradicted by other facts (e.g., updated information or corrections).
* **Opinion**: A subjective statement reflecting a speaker’s belief, sentiment, or judgment. By nature, opinions are considered temporally true at the moment they are expressed.
* **Prediction**: A forward-looking or hypothetical statement about a potential future event or outcome. Temporally, a prediction is assumed to hold true from the time of utterance until the conclusion of the inferred prediction window.
```
`class StatementType(StrEnum):
"""Enumeration of statement types for statements."""
FACT = "FACT"
OPINION = "OPINION"
PREDICTION = "PREDICTION"`
```
#### Raw Statement
The `RawStatement` model represents an individual statement extracted by an LLM, annotated with both its semantic type (`StatementType`) and temporal classification (`TemporalType`). These raw statements serve as intermediate representations and are intended to be transformed into `TemporalEvent` objects in later processing stages.
Core fields:
* `statement`: The textual content of the extracted statement
* `statement\_type`: The type of statement (Fact, Opinion, Prediction), based on the `StatementType` enum
* `temporal\_type`: The temporal classification of the statement (Static, Dynamic, Atemporal), drawn from the `TemporalType` enum
The model includes field-level validators to ensure that all type annotations conform to their respective enums, providing a layer of robustness against invalid input.
The companion model `RawStatementList` contains the output of the statement extraction step: a list of `RawStatement` instances.
```
`from pydantic import field\_validator
class RawStatement(BaseModel):
"""Model representing a raw statement with type and temporal information."""
statement: str
statement\_type: StatementType
temporal\_type: TemporalType
@field\_validator("temporal\_type", mode="before")
@classmethod
def \_parse\_temporal\_label(cls, value: str | None) -\> TemporalType:
if value is None:
return TemporalType.ATEMPORAL
cleaned\_value = value.strip().upper()
try:
return TemporalType(cleaned\_value)
except ValueError as e:
raise ValueError(f"Invalid temporal type: {value}. Must be one of {[t.value for t in TemporalType]}") from e
@field\_validator("statement\_type", mode="before")
@classmethod
def \_parse\_statement\_label(cls, value: str | None = None) -\> StatementType:
if value is None:
return StatementType.FACT
cleaned\_value = value.strip().upper()
try:
return StatementType(cleaned\_value)
except ValueError as e:
raise ValueError(f"Invalid temporal type: {value}. Must be one of {[t.value for t in StatementType]}") from e
class RawStatementList(BaseModel):
"""Model representing a list of raw statements."""
statements: list[RawStatement]`
```
#### Statement Extraction Prompt
This is the core prompt that powers our Temporal Agent’s ability to extract and label atomic statements. It is written in [Jinja](https://jinja.palletsprojects.com/en/stable/) allowing us to modularly compose dynamic inputs without rewriting the core logic.
##### Anatomy of the prompt
1. **Set up the extraction task**
We instruct the assistant to behave like a domain expert in finance and clearly define the two subtasks: (i) extracting atomic, declarative statements, and (ii) labelling each with a `statement\_type` and a `temporal\_type`.
2. **Enforces strict extraction guidelines**
The rules for extraction help to enforce consistency and clarity. Statements must:
* Be structured as clean subject-predicate-object triplets
* Be self-contained and context-independent
* Resolve co-references (e.g., "he" → "John Smith")
* Include temporal/quantitative qualifiers where present
* Be split when multiple events or temporalities are described
* **Supports plug-and-play definitions**
The `{% if definitions %}` block makes it easy to inject structured definitions such as statement categories, temporal types, and domain-specific terms.
* **Includes few-shot examples**
We provide an annotated example chunk and the corresponding JSON output to demonstrate to the model how it should behave.
```
`statement\_extraction\_prompt = '''
{% macro tidy(name) -%}
{{ name.replace('\_', ' ')}}
{%- endmacro %}
You are an expert finance professional and information-extraction assistant.
===Inputs===
{% if inputs %}
{% for key, val in inputs.items() %}
- {{ key }}: {{val}}
{% endfor %}
{% endif %}
===Tasks===
1. Identify and extract atomic declarative statements from the chunk given the extraction guidelines
2. Label these (1) as Fact, Opinion, or Prediction and (2) temporally as Static or Dynamic
===Extraction Guidelines===
- Structure statements to clearly show subject-predicate-object relationships
- Each statement should express a single, complete relationship (it is better to have multiple smaller statements to achieve this)
- Avoid complex or compound predicates that combine multiple relationships
- Must be understandable without requiring context of the entire document
- Should be minimally modified from the original text
- Must be understandable without requiring context of the entire document,
- resolve co-references and pronouns to extract complete statements, if in doubt use main\_entity for example:
"your nearest competitor" -\> "main\_entity's nearest competitor"
- There should be no reference to abstract entities such as 'the company', resolve to the actual entity name.
- expand abbreviations and acronyms to their full form
- Statements are associated with a single temporal event or relationship
- Include any explicit dates, times, or quantitative qualifiers that make the fact precise
- If a statement refers to more than 1 temporal event, it should be broken into multiple statements describing the different temporalities of the event.
- If there is a static and dynamic version of a relationship described, both versions should be extracted
{%- if definitions %}
{%- for section\_key, section\_dict in definitions.items() %}
==== {{ tidy(section\_key) | upper }} DEFINITIONS & GUIDANCE ====
{%- for category, details in section\_dict.items() %}
{{ loop.index }}. {{ category }}
- Definition: {{ details.get("definition", "") }}
{% endfor -%}
{% endfor -%}
{% endif -%}
===Examples===
Example Chunk: """
TechNova Q1 Transcript (Edited Version)
Attendees:
\* Matt Taylor
ABC Ltd - Analyst
\* Taylor Morgan
BigBank Senior - Coordinator
----
On April 1st, 2024, John Smith was appointed CFO of TechNova Inc. He works alongside the current Senior VP Olivia Doe. He is currently overseeing the company’s global restructuring initiative, which began in May 2024 and is expected to continue into 2025.
Analysts believe this strategy may boost profitability, though others argue it risks employee morale. One investor stated, “I think Jane has the right vision.”
According to TechNova’s Q1 report, the company achieved a 10% increase in revenue compared to Q1 2023. It is expected that TechNova will launch its AI-driven product line in Q3 2025.
Since June 2024, TechNova Inc has been negotiating strategic partnerships in Asia. Meanwhile, it has also been expanding its presence in Europe, starting July 2024. As of September 2025, the company is piloting a remote-first work policy across all departments.
Competitor SkyTech announced last month they have developed a new AI chip and launched their cloud-based learning platform.
"""
Example Output: {
"statements": [
{
"statement": "Matt Taylor works at ABC Ltd.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "Matt Taylor is an Analyst.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "Taylor Morgan works at BigBank.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "Taylor Morgan is a Senior Coordinator.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "John Smith was appointed CFO of TechNova Inc on April 1st, 2024.",
"statement\_type": "FACT",
"temporal\_type": "STATIC"
},
{
"statement": "John Smith has held position CFO of TechNova Inc from April 1st, 2024.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "Olivia Doe is the Senior VP of TechNova Inc.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "John Smith works with Olivia Doe.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "John Smith is overseeing TechNova Inc's global restructuring initiative starting May 2024.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "Analysts believe TechNova Inc's strategy may boost profitability.",
"statement\_type": "OPINION",
"temporal\_type": "STATIC"
},
{
"statement": "Some argue that TechNova Inc's strategy risks employee morale.",
"statement\_type": "OPINION",
"temporal\_type": "STATIC"
},
{
"statement": "An investor stated 'I think John has the right vision' on an unspecified date.",
"statement\_type": "OPINION",
"temporal\_type": "STATIC"
},
{
"statement": "TechNova Inc achieved a 10% increase in revenue in Q1 2024 compared to Q1 2023.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "It is expected that TechNova Inc will launch its AI-driven product line in Q3 2025.",
"statement\_type": "PREDICTION",
"temporal\_type": "DYNAMIC"
},
{
"statement": "TechNova Inc started negotiating strategic partnerships in Asia in June 2024.",
"statement\_type": "FACT",
"temporal\_type": "STATIC"
},
{
"statement": "TechNova Inc has been negotiating strategic partnerships in Asia since June 2024.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "TechNova Inc has been expanding its presence in Europe since July 2024.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "TechNova Inc started expanding its presence in Europe in July 2024.",
"statement\_type": "FACT",
"temporal\_type": "STATIC"
},
{
"statement": "TechNova Inc is going to pilot a remote-first work policy across all departments as of September 2025.",
"statement\_type": "FACT",
"temporal\_type": "STATIC"
},
{
"statement": "SkyTech is a competitor of TechNova.",
"statement\_type": "FACT",
"temporal\_type": "DYNAMIC"
},
{
"statement": "SkyTech developed new AI chip.",
"statement\_type": "FACT",
"temporal\_type": "STATIC"
},
{
"statement": "SkyTech launched cloud-based learning platform.",
"statement\_type": "FACT",
"temporal\_type": "STATIC"
}
]
}
===End of Examples===
\*\*Output format\*\*
Return only a list of extracted labelled statements in the JSON ARRAY of objects that match the schema below:
{{ json\_schema }}
'''`
```
### 3.2.5. Temporal Range Extraction
#### Raw temporal range
The `RawTemporalRange` model holds the raw extraction of `valid\_at` and `invalid\_at` date strings for a statement. These both use the date-time [supported string property](https://platform.openai.com/docs/guides/structured-outputs?api-mode=responses).
* `valid\_at` represents the start of the validity period for a statement
* `invalid\_at` represents the end of the validity period for a statement
```
`class RawTemporalRange(BaseModel):
"""Model representing the raw temporal validity range as strings."""
valid\_at: str | None = Field(..., json\_schema\_extra={"format": "date-time"})
invalid\_at: str | None = Field(..., json\_schema\_extra={"format": "date-time"})`
```
#### Temporal validity range
While the `RawTemporalRange` model preserves the originally extracted date strings, the `TemporalValidityRange` model transforms these into standardized `datetime` objects for downstream processing.
It parses the raw `valid\_at` and `invalid\_at` values, converting them from strings into timezone-aware `datetime` instances. This is handled through a field-level validator.
```
`from utils import parse\_date\_str
class TemporalValidityRange(BaseModel):
"""Model representing the parsed temporal validity range as datetimes."""
valid\_at: datetime | None = None
invalid\_at: datetime | None = None
@field\_validator("valid\_at", "invalid\_at", mode="before")
@classmethod
def \_parse\_date\_string(cls, value: str | datetime | None) -\> datetime | None:
if isinstance(value, datetime) or value is None:
return value
return parse\_date\_str(value)`
```
#### Date extraction prompt
Let’s now create the prompt that guides our Temporal Agent in accurately determining the temporal validity of statements.
##### Anatomy of the prompt
This prompt helps the Temporal Agent precisely understand and extract temporal validity ranges.
1. **Clearly Defines the Extraction Task**
The prompt instructs our model to determine when a statement became true (`valid\_at`) and optionally when it stopped being true (`invalid\_at`).
2. **Uses Contextual Guidance**
By dynamically incorporating `{{ inputs.temporal\_type }}` and `{{ inputs.statement\_type }}`, the prompt guides the model in interpreting temporal nuances based on the nature of each statement (like distinguishing facts from predictions or static from dynamic contexts).
3. **Ensures Consistency with Clear Formatting Rules**
To maintain clarity and consistency, the prompt requires all dates to be converted into standardized ISO 8601 date-time formats, normalized to UTC. It explicitly anchors relative expressions (like "last quarter") to known publication dates, making temporal information precise and reliable.
4. **Aligns with Business Reporting Cycles**
Recognizing the practical need for quarter-based reasoning common in business and financial contexts, the prompt can interpret and calculate temporal ranges based on business quarters, minimizing ambiguity.
5. **Adapts to Statement Types for Semantic Accuracy**
Specific rules ensure the semantic integrity of statements—for example, opinions might only have a start date (`valid\_at`) reflecting the moment they were expressed, while predictions will clearly define their forecast window using an end date (`invalid\_at`).
```
`date\_extraction\_prompt = """
{#
This prompt (template) is adapted from [getzep/graphiti]
Licensed under the Apache License, Version 2.0
Original work:
https://github.com/getzep/graphiti/blob/main/graphiti\_core/prompts/extract\_edge\_dates.py
Modifications made by Tomoro on 2025-04-14
See the LICENSE file for the full Apache 2.0 license text.
#}
{% macro tidy(name) -%}
{{ name.replace('\_', ' ')}}
{%- endmacro %}
INPUTS:
{% if inputs %}
{% for key, val in inputs.items() %}
- {{ key }}: {{val}}
{% endfor %}
{% endif %}
TASK:
- Analyze the statement and determine the temporal validity range as dates for the temporal event or relationship described.
- Use the temporal information you extracted, guidelines below, and date of when the statement was made or published. Do not use any external knowledge to determine validity ranges.
- Only set dates if they explicitly relate to the validity of the relationship described in the statement. Otherwise ignore the time mentioned.
- If the relationship is not of spanning nature and represents a single point in time, but you are still able to determine the date of occurrence, set the valid\_at only.
{{ inputs.get("temporal\_type") | upper }} Temporal Type Specific Guidance:
{% for key, guide in temporal\_guide.items() %}
- {{ tidy(key) | capitalize }}: {{ guide }}
{% endfor %}
{{ inputs.get("statement\_type") | upper }} Statement Type Specific Guidance:
{%for key, guide in statement\_guide.items() %}
- {{ tidy(key) | capitalize }}: {{ guide }}
{% endfor %}
Validity Range Definitions:
- `valid\_at` is the date and time when the relationship described by the statement became true or was established.
- `invalid\_at` is the date and time when the relationship described by the statement stopped being true or ended. This may be None if the event is ongoing.
General Guidelines:
1. Use ISO 8601 format (YYYY-MM-DDTHH:MM:SS.SSSSSSZ) for datetimes.
2. Use the reference or publication date as the current time when determining the valid\_at and invalid\_at dates.
3. If the fact is written in the present tense without containing temporal information, use the reference or publication date for the valid\_at date
4. Do not infer dates from related events or external knowledge. Only use dates that are directly stated to establish or change the relationship.
5. Convert relative times (e.g., “two weeks ago”) into absolute ISO 8601 datetimes based on the reference or publication timestamp.
6. If only a date is mentioned without a specific time, use 00:00:00 (midnight) for that date.
7. If only year or month is mentioned, use the start or end as appropriate at 00:00:00 e.g. do not select a random date if only the year is mentioned, use YYYY-01-01 or YYYY-12-31.
8. Always include the time zone offset (use Z for UTC if no specific time zone is mentioned).
{% if inputs.get('quarter') and inputs.get('publication\_date') %}
9. Assume that {{ inputs.quarter }} ends on {{ inputs.publication\_date }} and infer dates for any Qx references from there.
{% endif %}
Statement Specific Rules:
- when `statement\_type` is \*\*opinion\*\* only valid\_at must be set
- when `statement\_type` is \*\*prediction\*\* set its `invalid\_at` to the \*\*end of the prediction window\*\* explicitly mentioned in the text.
Never invent dates from outside knowledge.
\*\*Output format\*\*
Return only the validity range in the JSON ARRAY of objects that match the schema below:
{{ json\_schema }}
"""`
```
### 3.2.6. Creating our Triplets
We will now build up the definitions and prompts to create the our triplets. As discussed above, these are a combination of:
* **Subject** - the entity you are talking about
* **Predicate** - the type of relationship or property
* **Object** - the value or other entity that the subject is connected to
Let’s start with our predicate.
#### Predicate
The `Predicate` enum provides a standard set of predicates that clearly describe relationships extracted from text.
We’ve defined the set of predicates below to be appropriate for earnings call transcripts. Here are some examples for how each of these predicates could fit into a triplet in our knowledge graph:
Here are more anonymized, generalized examples following your template:
* `IS\_A`: [Company ABC]-[IS\_A]-[Software Provider]
* `HAS\_A`: [Corporation XYZ]-[HAS\_A]-[Innovation Division]
* `LOCATED\_IN`: [Factory 123]-[LOCATED\_IN]-[Germany]
* `HOLDS\_ROLE`: [Jane Doe]-[HOLDS\_ROLE]-[CEO at Company LMN]
* `PRODUCES`: [Company DEF]-[PRODUCES]-[Smartphone Model X]
* `SELLS`: [Retailer 789]-[SELLS]-[Furniture]
* `LAUNCHED`: [Company UVW]-[LAUNCHED]-[New Subscription Service]
* `DEVELOPED`: [Startup GHI]-[DEVELOPED]-[Cloud-Based Tool]
* `ADOPTED\_BY`: [New Technology]-[ADOPTED\_BY]-[Industry ABC]
* `INVESTS\_IN`: [Investment Firm JKL]-[INVESTS\_IN]-[Clean Energy Startups]
* `COLLABORATES\_WITH`: [Company PQR]-[COLLABORATES\_WITH]-[University XYZ]
* `SUPPLIES`: [Manufacturer STU]-[SUPPLIES]-[Auto Components to Company VWX]
* `HAS\_REVENUE`: [Corporation LMN]-[HAS\_REVENUE]-[€500 Million]
* `INCREASED`: [Company YZA]-[INCREASED]-[Market Share]
* `DECREASED`: [Firm BCD]-[DECREASED]-[Operating Expenses]
* `RESULTED\_IN`: [Cost Reduction Initiative]-[RESULTED\_IN]-[Improved Profit Margins]
* `TARGETS`: [Product Launch Campaign]-[TARGETS]-[Millennial Consumers]
* `PART\_OF`: [Subsidiary EFG]-[PART\_OF]-[Parent Corporation HIJ]
* `DISCONTINUED`: [Company KLM]-[DISCONTINUED]-[Legacy Product Line]
* `SECURED`: [Startup NOP]-[SECURED]-[Series B Funding]
```
`class Predicate(StrEnum):
"""Enumeration of normalised predicates."""
IS\_A = "IS\_A"
HAS\_A = "HAS\_A"
LOCATED\_IN = "LOCATED\_IN"
HOLDS\_ROLE = "HOLDS\_ROLE"
PRODUCES = "PRODUCES"
SELLS = "SELLS"
LAUNCHED = "LAUNCHED"
DEVELOPED = "DEVELOPED"
ADOPTED\_BY = "ADOPTED\_BY"
INVESTS\_IN = "INVESTS\_IN"
COLLABORATES\_WITH = "COLLABORATES\_WITH"
SUPPLIES = "SUPPLIES"
HAS\_REVENUE = "HAS\_REVENUE"
INCREASED = "INCREASED"
DECREASED = "DECREASED"
RESULTED\_IN = "RESULTED\_IN"
TARGETS = "TARGETS"
PART\_OF = "PART\_OF"
DISCONTINUED = "DISCONTINUED"
SECURED = "SECURED"`
```
We also assign a definition to each predicate, which we will then pass to the extraction prompt downstream.
```
`PREDICATE\_DEFINITIONS = {
"IS\_A": "Denotes a class-or-type relationship between two entities (e.g., 'Model Y IS\_A electric-SUV'). Includes 'is' and 'was'.",
"HAS\_A": "Denotes a part-whole relationship between two entities (e.g., 'Model Y HAS\_A electric-engine'). Includes 'has' and 'had'.",
"LOCATED\_IN": "Specifies geographic or organisational containment or proximity (e.g., headquarters LOCATED\_IN Berlin).",
"HOLDS\_ROLE": "Connects a person to a formal office or title within an organisation (CEO, Chair, Director, etc.).",
"PRODUCES": "Indicates that an entity manufactures, builds, or creates a product, service, or infrastructure (includes scale-ups and component inclusion).",
"SELLS": "Marks a commercial seller-to-customer relationship for a product or service (markets, distributes, sells).",
"LAUNCHED": "Captures the official first release, shipment, or public start of a product, service, or initiative.",
"DEVELOPED": "Shows design, R&D, or innovation origin of a technology, product, or capability. Includes 'researched' or 'created'.",
"ADOPTED\_BY": "Indicates that a technology or product has been taken up, deployed, or implemented by another entity.",
"INVESTS\_IN": "Represents the flow of capital or resources from one entity into another (equity, funding rounds, strategic investment).",
"COLLABORATES\_WITH": "Generic partnership, alliance, joint venture, or licensing relationship between entities.",
"SUPPLIES": "Captures vendor–client supply-chain links or dependencies (provides to, sources from).",
"HAS\_REVENUE": "Associates an entity with a revenue amount or metric—actual, reported, or projected.",
"INCREASED": "Expresses an upward change in a metric (revenue, market share, output) relative to a prior period or baseline.",
"DECREASED": "Expresses a downward change in a metric relative to a prior period or baseline.",
"RESULTED\_IN": "Captures a causal relationship where one event or factor leads to a specific outcome (positive or negative).",
"TARGETS": "Denotes a strategic objective, market segment, or customer group that an entity seeks to reach.",
"PART\_OF": "Expresses hierarchical membership or subset relationships (division, subsidiary, managed by, belongs to).",
"DISCONTINUED": "Indicates official end-of-life, shutdown, or termination of a product, service, or relationship.",
"SECURED": "Marks the successful acquisition of funding, contracts, assets, or rights by an entity.",
}`
```
#### Defining your own predicates
When working with different data sources, you’ll want to define your own predicates that are specific to your use case.
To define your own predicates:
1. First, run your pipeline with `PREDICATE\_DEFINITIONS = {}` on a representative sample of your documents. This initial run will derive a noisy graph with many non-standardized and overlapping predicates
2. Next, drop some of your intial results into [ChatGPT](https://chatgpt.com/) or manually review them to merge similar predicate classes. This process helps to eliminate duplicates such as `IS\_CEO` and `IS\_CEO\_OF`
3. Finally, carefully review and refine this list of predicates to ensure clarity and precision. These finalized predicate definitions will then guide your extraction process and ensure a consistent extraction pipeline
#### Raw triplet
With predicates now well-defined, we can begin building up the data models for our triplets.
The `RawTriplet` model represents a basic subject-predicate-object relationship that is extracted directly from textual data. This serves as a precursor for the more detailed triplet representation in `Triplet` which we introduce later.
Core fields:
* `subject\_name`: The textual representation of the subject entity
* `subject\_id`: Numeric identifier for the subject entity
* `predicate`: The relationship type, specified by the `Predicate` enum
* `object\_name`: The textual representation of the object entity
* `object\_id`: Numeric identifier for the object entity
* `value`: Numeric value associated to relationship, may be None e.g. `Company` -\> `HAS\_A` -\> `Revenue` with `value='$100 mill'`
```
`class RawTriplet(BaseModel):
"""Model representing a subject-predicate-object triplet."""
subject\_name: str
subject\_id: int
predicate: Predicate
object\_name: str
object\_id: int
value: str | None = None`
```
#### Triplet
The `Triplet` model extends the `RawTriplet` by incorporating unique identifiers and optionally linking each triplet to a specific event. These identifiers help with integration into structured knowledge bases like our temporal knowledge graph.
```
`class Triplet(BaseModel):
"""Model representing a subject-predicate-object triplet."""
id: uuid.UUID = Field(default\_factory=uuid.uuid4)
event\_id: uuid.UUID | None = None
subject\_name: str
subject\_id: int | uuid.UUID
predicate: Predicate
object\_name: str
object\_id: int | uuid.UUID
value: str | None = None
@classmethod
def from\_raw(cls, raw\_triplet: "RawTriplet", event\_id: uuid.UUID | None = None) -\> "Triplet":
"""Create a Triplet instance from a RawTriplet, optionally associating it with an event\_id."""
return cls(
id=uuid.uuid4(),
event\_id=event\_id,
subject\_name=raw\_triplet.subject\_name,
subject\_id=raw\_triplet.subject\_id,
predicate=raw\_triplet.predicate,
object\_name=raw\_triplet.object\_name,
object\_id=raw\_triplet.object\_id,
value=raw\_triplet.value,
)`
```
#### RawEntity
The `RawEntity` model represents an Entity as extracted from the `Statement`. This serves as a precursor for the more detailed triplet representation in `Entity` which we introduce next.
Core fields:
* `entity\_idx`: An integer to differentiate extracted entites from the statement (links to `RawTriplet`)
* `name`: The name of the entity extracted e.g. `AMD`
* `type`: The type of entity extracted e.g. `Company`
* `description`: The textual description of the entity e.g. `Technology company know for manufacturing semiconductors`
```
`class RawEntity(BaseModel):
"""Model representing an entity (for entity resolution)."""
entity\_idx: int
name: str
type: str = ""
description: str = ""`
```
#### Entity
The `Entity` model extends the `RawEntity` by incorporating unique identifiers and optionally linking each entity to a specific event.
Additionally, it contains `resolved\_id` which will be populated during entity resolution with the canonical entity’s id to remove duplicate naming of entities in the database.
These updated identifiers help with integration and linking of entities to events and triplets .
```
`class Entity(BaseModel):
"""
Model representing an entity (for entity resolution).
'id' is the canonical entity id if this is a canonical entity.
'resolved\_id' is set to the canonical id if this is an alias.
"""
id: uuid.UUID = Field(default\_factory=uuid.uuid4)
event\_id: uuid.UUID | None = None
name: str
type: str
description: str
resolved\_id: uuid.UUID | None = None
@classmethod
def from\_raw(cls, raw\_entity: "RawEntity", event\_id: uuid.UUID | None = None) -\> "Entity":
"""Create an Entity instance from a RawEntity, optionally associating it with an event\_id."""
return cls(
id=uuid.uuid4(),
event\_id=event\_id,
name=raw\_entity.name,
type=raw\_entity.type,
description=raw\_entity.description,
resolved\_id=None,
)`
```
#### Raw extraction
Both `RawTriplet` and `RawEntity` are extracted at the same time per `Statement` to reduce LLM calls and to allow easy referencing of Entities through Triplets.
```
`class RawExtraction(BaseModel):
"""Model representing a triplet extraction."""
triplets: list[RawTriplet]
entities: list[RawEntity]`
```
#### Triplet Extraction Prompt
The prompt below guides our Temporal Agent to effectively extract triplets and entities from provided statements.
##### Anatomy of the prompt
* **Avoids temporal details**
The agent is specifically instructed to ignore temporal relationships, as these are captured separately within the `TemporalValidityRange`.
Defined `Predicates` are deliberately designed to be time-neutral—for instance, `HAS\_A` covers both present (`HAS\_A`) and past (`HAD\_A`) contexts.
* **Maintains structured outputs**
The prompt yields structured `RawExtraction` outputs, supported by detailed examples that clearly illustrate:
* How to extract information from a given `Statement`
* How to link `Entities` with corresponding `Triplets`
* How to handle extracted `values`
* How to manage multiple `Triplets` involving the same `Entity`
```
`triplet\_extraction\_prompt = """
You are an information-extraction assistant.
\*\*Task:\*\* You are going to be given a statement. Proceed step by step through the guidelines.
\*\*Statement:\*\* "{{ statement }}"
\*\*Guidelines\*\*
First, NER:
- Identify the entities in the statement, their types, and context independent descriptions.
- Do not include any lengthy quotes from the reports
- Do not include any calendar dates or temporal ranges or temporal expressions
- Numeric values should be extracted as separate entities as an instance\_of \_Numeric\_, where the name is the units as a string and the numeric\_value is the value. e.g: £30 -\> name: 'GBP', numeric\_value: 30, instance\_of: 'Numeric'
Second, Triplet extraction:
- Identify the subject entity of that predicate – the main entity carrying out the action or being described.
- Identify the object entity of that predicate – the entity, value, or concept that the predicate affects or describes.
- Identify a predicate between the entities expressed in the statement, such as 'is', 'works at', 'believes', etc. Follow the schema below if given.
- Extract the corresponding (subject, predicate, object, date) knowledge triplet.
- Exclude all temporal expressions (dates, years, seasons, etc.) from every field.
- Repeat until all predicates contained in the statement have been extracted form the statements.
{%- if predicate\_instructions -%}
-------------------------------------------------------------------------
Predicate Instructions:
Please try to stick to the following predicates, do not deviate unless you can't find a relevant definition.
{%- for pred, instruction in predicate\_instructions.items() -%}
- {{ pred }}: {{ instruction }}
{%- endfor -%}
-------------------------------------------------------------------------
{%- endif -%}
Output:
List the entities and triplets following the JSON schema below. Return ONLY with valid JSON matching this schema.
Do not include any commentary or explanation.
{{ json\_schema }}
===Examples===
Example 1 Statement: "Google's revenue increased by 10% from January through March."
Example 1 Output: {
"triplets": [
{
"subject\_name": "Google",
"subject\_id": 0,
"predicate": "INCREASED",
"object\_name": "Revenue",
"object\_id": 1,
"value": "10%",
}
],
"entities": [
{
"entity\_idx": 0,
"name": "Google",
"type": "Organization",
"description": "Technology Company",
},
{
"entity\_idx": 1,
"name": "Revenue",
"type": "Financial Metric",
"description": "Income of a Company",
}
]
}
Example 2 Statement: "Amazon developed a new AI chip in 2024."
Example 2 Output:
{
"triplets": [
{
"subject\_name": "Amazon",
"subject\_id": 0,
"predicate": "DEVELOPED",
"object\_name": "AI chip",
"object\_id": 1,
"value": None,
},
],
"entities": [
{
"entity\_idx": 0,
"name": "Amazon",
"type": "Organization",
"description": "E-commerce and cloud computing company"
},
{
"entity\_idx": 1,
"name": "AI chip",
"type": "Technology",
"description": "Artificial intelligence accelerator hardware"
}
]
}
Example 3 Statement: "It is expected that TechNova Inc will launch its AI-driven product line in Q3 2025.",
Example 3 Output:{
"triplets": [
{
"subject\_name": "TechNova",
"subject\_id": 0,
"predicate": "LAUNCHED",
"object\_name": "AI-driven Product",
"object\_id": 1,
"value": "None,
}
],
"entities": [
{
"entity\_idx": 0,
"name": "TechNova",
"type": "Organization",
"description": "Technology Company",
},
{
"entity\_idx": 1,
"name": "AI-driven Product",
"type": "Product",
"description": "General AI products",
}
]
}
Example 4 Statement: "The SVP, CFO and Treasurer of AMD spoke during the earnings call."
Example 4 Output: {
"triplets": [],
"entities":[].
}
===End of Examples===
"""`
```
### 3.2.7. Temporal Event
The `TemporalEvent` model brings together the `Statement` and all related information into one handy class. It’s a primary output of the `TemporalAgent` and plays an important role within the `InvalidationAgent`.
Main fields include:
* `id`: A unique identifier for the event
* `chunk\_id`: Points to the specific `Chunk` associated with the event
* `statement`: The specific `RawStatement` extracted from the `Chunk` detailing a relationship or event
* `embedding`: A representation of the `statement` used by the `InvalidationAgent` to gauge event similarity
* `triplets`: Unique identifiers for the individual `Triplets` extracted from the `Statement`
* `valid\_at`: Timestamp indicating when the event becomes valid
* `invalid\_at`: Timestamp indicating when the event becomes invalid
* `temporal\_type`: Describes temporal characteristics from the `RawStatement`
* `statement\_type`: Categorizes the statement according to the original `RawStatement`
* `created\_at`: Date the event was first created.
* `expired\_at`: Date the event was marked invalid (set to `created\_at` if `invalid\_at` is already set when building the `TemporalEvent`)
* `invalidated\_by`: ID of the `TemporalEvent` responsible for invalidating this event, if applicable
```
`import json
from pydantic import model\_validator
class TemporalEvent(BaseModel):
"""Model representing a temporal event with statement, triplet, and validity information."""
id: uuid.UUID = Field(default\_factory=uuid.uuid4)
chunk\_id: uuid.UUID
statement: str
embedding: list[float] = Field(default\_factory=lambda: [0.0] \* 256)
triplets: list[uuid.UUID]
valid\_at: datetime | None = None
invalid\_at: datetime | None = None
temporal\_type: TemporalType
statement\_type: StatementType
created\_at: datetime = Field(default\_factory=datetime.now)
expired\_at: datetime | None = None
invalidated\_by: uuid.UUID | None = None
@property
def triplets\_json(self) -\> str:
"""Convert triplets list to JSON string."""
return json.dumps([str(t) for t in self.triplets]) if self.triplets else "[]"
@classmethod
def parse\_triplets\_json(cls, triplets\_str: str) -\> list[uuid.UUID]:
"""Parse JSON string back into list of UUIDs."""
if not triplets\_str or triplets\_str == "[]":
return []
return [uuid.UUID(t) for t in json.loads(triplets\_str)]
@model\_validator(mode="after")
def set\_expired\_at(self) -\> "TemporalEvent":
"""Set expired\_at if invalid\_at is set and temporal\_type is DYNAMIC."""
self.expired\_at = self.created\_at if (self.invalid\_at is not None) and (self.temporal\_type == TemporalType.DYNAMIC) else None
return self`
```
### 3.2.8. Defining our Temporal Agent
Now we arrive at a central point in our pipeline: The `TemporalAgent` class. This brings together the steps we’ve built up above - chunking, data models, and prompts. Let’s take a closer look at how this works.
The core function, `extract\_transcript\_events`, handles all key processes:
1. It extracts a `RawStatement` from each `Chunk`.
2. From each `RawStatement`, it identifies the `TemporalValidityRange` along with lists of related `Triplet` and `Entity` objects.
3. Finally, it bundles all this information neatly into a `TemporalEvent` for each `RawStatement`.
Here’s what you’ll get:
* `transcript`: The transcript currently being analyzed.
* `all\_events`: A comprehensive list of all generated `TemporalEvent` objects.
* `all\_triplets`: A complete collection of `Triplet` objects extracted across all events.
* `all\_entities`: A detailed list of all `Entity` objects pulled from the events, which will be further refined in subsequent steps.
The diagram below visualizes this portion of our pipeline:
```
`import asyncio
from typing import Any
from jinja2 import DictLoader, Environment
from openai import AsyncOpenAI
from tenacity import retry, stop\_after\_attempt, wait\_random\_exponential
class TemporalAgent:
"""Handles temporal-based operations for extracting and processing temporal events from text."""
def \_\_init\_\_(self) -\> None:
"""Initialize the TemporalAgent with a client."""
self.\_client = AsyncOpenAI()
self.\_model = "gpt-4.1-mini"
self.\_env = Environment(loader=DictLoader({
"statement\_extraction.jinja": statement\_extraction\_prompt,
"date\_extraction.jinja": date\_extraction\_prompt,
"triplet\_extraction.jinja": triplet\_extraction\_prompt,
}))
self.\_env.filters["split\_and\_capitalize"] = self.split\_and\_capitalize
@staticmethod
def split\_and\_capitalize(value: str) -\> str:
"""Split dict key string and reformat for jinja prompt."""
return " ".join(value.split("\_")).capitalize()
async def get\_statement\_embedding(self, statement: str) -\> list[float]:
"""Get the embedding of a statement."""
response = await self.\_client.embeddings.create(
model="text-embedding-3-large",
input=statement,
dimensions=256,
)
return response.data[0].embedding
@retry(wait=wait\_random\_exponential(multiplier=1, min=1, max=30), stop=stop\_after\_attempt(3))
async def extract\_statements(
self,
chunk: Chunk,
inputs: dict[str, Any],
) -\> RawStatementList:
"""Determine initial validity date range for a statement.
Args:
chunk (Chunk): The chunk of text to analyze.
inputs (dict[str, Any]): Additional input parameters for extraction.
Returns:
Statement: Statement with updated temporal range.
"""
inputs["chunk"] = chunk.text
template = self.\_env.get\_template("statement\_extraction.jinja")
prompt = template.render(
inputs=inputs,
definitions=LABEL\_DEFINITIONS,
json\_schema=RawStatementList.model\_fields,
)
response = await self.\_client.responses.parse(
model=self.\_model,
temperature=0,
input=prompt,
text\_format=RawStatementList,
)
raw\_statements = response.output\_parsed
statements = RawStatementList.model\_validate(raw\_statements)
return statements
@retry(wait=wait\_random\_exponential(multiplier=1, min=1, max=30), stop=stop\_after\_attempt(3))
async def extract\_temporal\_range(
self,
statement: RawStatement,
ref\_dates: dict[str, Any],
) -\> TemporalValidityRange:
"""Determine initial validity date range for a statement.
Args:
statement (Statement): Statement to analyze.
ref\_dates (dict[str, Any]): Reference dates for the statement.
Returns:
Statement: Statement with updated temporal range.
"""
if statement.temporal\_type == TemporalType.ATEMPORAL:
return TemporalValidityRange(valid\_at=None, invalid\_at=None)
template = self.\_env.get\_template("date\_extraction.jinja")
inputs = ref\_dates | statement.model\_dump()
prompt = template.render(
inputs=inputs,
temporal\_guide={statement.temporal\_type.value: LABEL\_DEFINITIONS["temporal\_labelling"][statement.temporal\_type.value]},
statement\_guide={statement.statement\_type.value: LABEL\_DEFINITIONS["episode\_labelling"][statement.statement\_type.value]},
json\_schema=RawTemporalRange.model\_fields,
)
response = await self.\_client.responses.parse(
model=self.\_model,
temperature=0,
input=prompt,
text\_format=RawTemporalRange,
)
raw\_validity = response.output\_parsed
temp\_validity = TemporalValidityRange.model\_validate(raw\_validity.model\_dump()) if raw\_validity else TemporalValidityRange()
if temp\_validity.valid\_at is None:
temp\_validity.valid\_at = inputs["publication\_date"]
if statement.temporal\_type == TemporalType.STATIC:
temp\_validity.invalid\_at = None
return temp\_validity
@retry(wait=wait\_random\_exponential(multiplier=1, min=1, max=30), stop=stop\_after\_attempt(3))
async def extract\_triplet(
self,
statement: RawStatement,
max\_retries: int = 3,
) -\> RawExtraction:
"""Extract triplets and entities from a statement as a RawExtraction object."""
template = self.\_env.get\_template("triplet\_extraction.jinja")
prompt = template.render(
statement=statement.statement,
json\_schema=RawExtraction.model\_fields,
predicate\_instructions=PREDICATE\_DEFINITIONS,
)
for attempt in range(max\_retries):
try:
response = await self.\_client.responses.parse(
model=self.\_model,
temperature=0,
input=prompt,
text\_format=RawExtraction,
)
raw\_extraction = response.output\_parsed
extraction = RawExtraction.model\_validate(raw\_extraction)
return extraction
except Exception as e:
if attempt == max\_retries - 1:
raise
print(f"Attempt {attempt + 1} failed with error: {str(e)}. Retrying...")
await asyncio.sleep(1)
raise Exception("All retry attempts failed to extract triplets")
async def extract\_transcript\_events(
self,
transcript: Transcript,
) -\> tuple[Transcript, list[TemporalEvent], list[Triplet], list[Entity]]:
"""
For each chunk in the transcript:
- Extract statements
- For each statement, extract temporal range and Extraction in parallel
- Build TemporalEvent for each statement
- Collect all events, triplets, and entities for later DB insertion
Returns the transcript, all events, all triplets, and all entities.
"""
if not transcript.chunks:
return transcript, [], [], []
doc\_summary = {
"main\_entity": transcript.company or None,
"document\_type": "Earnings Call Transcript",
"publication\_date": transcript.date,
"quarter": transcript.quarter,
"document\_chunk": None,
}
all\_events: list[TemporalEvent] = []
all\_triplets: list[Triplet] = []
all\_entities: list[Entity] = []
async def \_process\_chunk(chunk: Chunk) -\> tuple[Chunk, list[TemporalEvent], list[Triplet], list[Entity]]:
statements\_list = await self.extract\_statements(chunk, doc\_summary)
events: list[TemporalEvent] = []
chunk\_triplets: list[Triplet] = []
chunk\_entities: list[Entity] = []
async def \_process\_statement(statement: RawStatement) -\> tuple[TemporalEvent, list[Triplet], list[Entity]]:
temporal\_range\_task = self.extract\_temporal\_range(statement, doc\_summary)
extraction\_task = self.extract\_triplet(statement)
temporal\_range, raw\_extraction = await asyncio.gather(temporal\_range\_task, extraction\_task)
# Create the event first to get its id
embedding = await self.get\_statement\_embedding(statement.statement)
event = TemporalEvent(
chunk\_id=chunk.id,
statement=statement.statement,
embedding=embedding,
triplets=[],
valid\_at=temporal\_range.valid\_at,
invalid\_at=temporal\_range.invalid\_at,
temporal\_type=statement.temporal\_type,
statement\_type=statement.statement\_type,
)
# Map raw triplets/entities to Triplet/Entity with event\_id
triplets = [Triplet.from\_raw(rt, event.id) for rt in raw\_extraction.triplets]
entities = [Entity.from\_raw(re, event.id) for re in raw\_extraction.entities]
event.triplets = [triplet.id for triplet in triplets]
return event, triplets, entities
if statements\_list.statements:
results = await asyncio.gather(\*(\_process\_statement(stmt) for stmt in statements\_list.statements))
for event, triplets, entities in results:
events.append(event)
chunk\_triplets.extend(triplets)
chunk\_entities.extend(entities)
return chunk, events, chunk\_triplets, chunk\_entities
chunk\_results = await asyncio.gather(\*(\_process\_chunk(chunk) for chunk in transcript.chunks))
transcript.chunks = [chunk for chunk, \_, \_, \_ in chunk\_results]
for \_, events, triplets, entities in chunk\_results:
all\_events.extend(events)
all\_triplets.extend(triplets)
all\_entities.extend(entities)
return transcript, all\_events, all\_triplets, all\_entities`
```
```
`temporal\_agent = TemporalAgent()
# transcripts: list[Transcript] = chunker.generate\_transcripts\_and\_chunks(dataset)
# Process only the first transcript
results = await temporal\_agent.extract\_transcript\_events(transcripts[0])`
```
```
`# Parse and display the results in a nice format
transcript, events, triplets, entities = results
print("=== TRANSCRIPT PROCESSING RESULTS ===\\n")
print(f"📄 Transcript ID: {transcript.id}")
print(f"📊 Total Chunks: {len(transcript.chunks) if transcript.chunks is not None else 0}")
print(f"🎯 Total Events: {len(events)}")
print(f"🔗 Total Triplets: {len(triplets)}")
print(f"🏷️ Total Entities: {len(entities)}")
print("\\n=== SAMPLE EVENTS ===")
for i, event in enumerate(events[:3]): # Show first 3 events
print(f"\\n📝 Event {i+1}:")
print(f" Statement: {event.statement[:100]}...")
print(f" Type: {event.temporal\_type}")
print(f" Valid At: {event.valid\_at}")
print(f" Triplets: {len(event.triplets)}")
print("\\n=== SAMPLE TRIPLETS ===")
for i, triplet in enumerate(triplets[:5]): # Show first 5 triplets
print(f"\\n🔗 Triplet {i+1}:")
print(f" Subject: {triplet.subject\_name} (ID: {triplet.subject\_id})")
print(f" Predicate: {triplet.predicate}")
print(f" Object: {triplet.object\_name} (ID: {triplet.object\_id})")
if triplet.value:
print(f" Value: {triplet.value}")
print("\\n=== SAMPLE ENTITIES ===")
for i, entity in enumerate(entities[:5]): # Show first 5 entities
print(f"\\n🏷️ Entity {i+1}:")
print(f" Name: {entity.name}")
print(f" Type: {entity.type}")
print(f" Description: {entity.description}")
if entity.resolved\_id:
print(f" Resolved ID: {entity.resolved\_id}")`
```
### 3.2.9. Entity Resolution
Before diving into Temporal Invalidation, we need to first tackle entity resolution. This process is crucial to ensure that each real-world entity has a single, authoritative representation, eliminating duplicates and maintaining data consistency. For instance, `AMD` and `Advanced Micro Devices` clearly refer to the same entity, so they should be represented under a unified canonical entity.
Here’s our approach to entity resolution:
* We use the `EntityResolution` class to batch entities by type (`Entity.type`), which helps us make context-specific comparisons—like distinguishing companies from individuals.
* To address noisy data effectively, we leverage [RapidFuzz](https://rapidfuzz.github.io/RapidFuzz/) to cluster entities based on name similarity. This method involves a simple, case-insensitive, punctuation-free comparison using a partial match ratio, allowing tolerance for minor typos and substring matches.
* Within each fuzzy-matched cluster, we select the medoid—the entity most representative of the cluster based on overall similarity. This prevents bias toward the most frequently occurring or earliest listed entity. The medoid then serves as the initial canonical entity, providing a semantically meaningful representation of the group.
* Before adding a new canonical entity, we cross-check the medoid against existing canonicals, considering both fuzzy matching and acronyms. For example, `Advanced Micro Devices Inc.` may yield `AMDI`, closely matching the acronym `AMD`. This step helps prevent unnecessary creation of duplicate canonical entities.
* If a global match isn’t found, the medoid becomes a new canonical entity, with all entities in the cluster linked to it via a resolved ID.
* Finally, we perform an additional safeguard check to resolve potential acronym duplication across all canonical entities, ensuring thorough cleanup.
To further enhance entity resolution, you could consider advanced techniques such as:
* Using embedding-based similarity on `Entity.description` alongside `Entity.name`, improving disambiguation beyond simple text similarity.
* Employing a large language model (LLM) to intelligently group entities under their canonical forms, enhancing accuracy through semantic understanding.
```
`import sqlite3
import string
from rapidfuzz import fuzz
from db\_interface import (
get\_all\_canonical\_entities,
insert\_canonical\_entity,
remove\_entity,
update\_entity\_references,
)
class EntityResolution:
"""
Entity resolution class.
"""
def \_\_init\_\_(self, conn: sqlite3.Connection):
self.conn = conn
self.global\_canonicals: list[Entity] = get\_all\_canonical\_entities(conn)
self.threshold = 80.0
self.acronym\_thresh = 98.0
def resolve\_entities\_batch(
self, batch\_entities: list[Entity],
) -\> None:
"""
Orchestrate the scalable entity resolution workflow for a batch of entities.
"""
type\_groups = {t: [e for e in batch\_entities if e.type == t] for t in set(e.type for e in batch\_entities)}
for entities in type\_groups.values():
clusters = self.group\_entities\_by\_fuzzy\_match(entities)
for group in clusters.values():
if not group:
continue
local\_canon = self.set\_medoid\_as\_canonical\_entity(group)
if local\_canon is None:
continue
match = self.match\_to\_canonical\_entity(local\_canon, self.global\_canonicals)
if " " in local\_canon.name: # Multi-word entity
acronym = "".join(word[0] for word in local\_canon.name.split())
acronym\_match = next(
(c for c in self.global\_canonicals if fuzz.ratio(acronym, c.name) \>= self.acronym\_thresh and " " not in c.name), None
)
if acronym\_match:
match = acronym\_match
if match:
canonical\_id = match.id
else:
insert\_canonical\_entity(
self.conn,
{
"id": str(local\_canon.id),
"name": local\_canon.name,
"type": local\_canon.type,
"description": local\_canon.description,
},
)
canonical\_id = local\_canon.id
self.global\_canonicals.append(local\_canon)
for entity in group:
entity.resolved\_id = canonical\_id
self.conn.execute(
"UPDATE entities SET resolved\_id = ? WHERE id = ?",
(str(canonical\_id), str(entity.id))
)
# Clean up any acronym duplicates after processing all entities
self.merge\_acronym\_canonicals()
def group\_entities\_by\_fuzzy\_match(
self, entities: list[Entity],
) -\> dict[str, list[Entity]]:
"""
Group entities by fuzzy name similarity using rapidfuzz"s partial\_ratio.
Returns a mapping from canonical name to list of grouped entities.
"""
def clean(name: str) -\> str:
return name.lower().strip().translate(str.maketrans("", "", string.punctuation))
name\_to\_entities: dict[str, list[Entity]] = {}
cleaned\_name\_map: dict[str, str] = {}
for entity in entities:
name\_to\_entities.setdefault(entity.name, []).append(entity)
cleaned\_name\_map[entity.name] = clean(entity.name)
unique\_names = list(name\_to\_entities.keys())
clustered: dict[str, list[Entity]] = {}
used = set()
for name in unique\_names:
if name in used:
continue
clustered[name] = []
for other\_name in unique\_names:
if other\_name in used:
continue
score = fuzz.partial\_ratio(cleaned\_name\_map[name], cleaned\_name\_map[other\_name])
if score \>= self.threshold:
clustered[name].extend(name\_to\_entities[other\_name])
used.add(other\_name)
return clustered
def set\_medoid\_as\_canonical\_entity(self, entities: list[Entity]) -\> Entity | None:
"""
Select as canonical the entity in the group with the highest total similarity (sum of partial\_ratio) to all others.
Returns the medoid entity or None if the group is empty.
"""
if not entities:
return None
def clean(name: str) -\> str:
return name.lower().strip().translate(str.maketrans("", "", string.punctuation))
n = len(entities)
scores = [0.0] \* n
for i in range(n):
for j in range(n):
if i != j:
s1 = clean(entities[i].name)
s2 = clean(entities[j].name)
scores[i] += fuzz.partial\_ratio(s1, s2)
max\_idx = max(range(n), key=lambda idx: scores[idx])
return entities[max\_idx]
def match\_to\_canonical\_entity(self, entity: Entity, canonical\_entities: list[Entity]) -\> Entity | None:
"""
Fuzzy match a single entity to a list of canonical entities.
Returns the best matching canonical entity or None if no match above self.threshold.
"""
def clean(name: str) -\> str:
return name.lower().strip().translate(str.maketrans("", "", string.punctuation))
best\_score: float = 0
best\_canon = None
for canon in canonical\_entities:
score = fuzz.partial\_ratio(clean(entity.name), clean(canon.name))
if score \> best\_score:
best\_score = score
best\_canon = canon
if best\_score \>= self.threshold:
return best\_canon
return None
def merge\_acronym\_canonicals(self) -\> None:
"""
Merge canonical entities where one is an acronym of another.
"""
multi\_word = [e for e in self.global\_canonicals if " " in e.name]
single\_word = [e for e in self.global\_canonicals if " " not in e.name]
acronym\_map = {}
for entity in multi\_word:
acronym = "".join(word[0].upper() for word in entity.name.split())
acronym\_map[entity.id] = acronym
for entity in multi\_word:
acronym = acronym\_map[entity.id]
for single\_entity in single\_word:
score = fuzz.ratio(acronym, single\_entity.name)
if score \>= self.threshold:
update\_entity\_references(self.conn, str(entity.id), str(single\_entity.id))
remove\_entity(self.conn, str(entity.id))
self.global\_canonicals.remove(entity)
break`
```
### 3.2.10. Invalidation agent
##### Understanding the Invalidation Process
To effectively invalidate temporal events, the agent performs checks in both directions:
>
>
1. **> Incoming vs. Existing
**> : Are incoming events invalidated by events already present?
>
2. **> Existing vs. Incoming
**> : Are current events invalidated by the new incoming events?
>
>
This bi-directional assessment results in a clear True/False decision.
#### Event Invalidation Prompt
The prompt has three key components:
1. **Task Setup**
Defines two roles—`primary` and `secondary`—for event comparison. The assessment checks if the `primary` event is invalidated by the `secondary` event.
2. **Guidelines**
Provides clear criteria on interpreting temporal metadata. Importantly, invalidation must rely solely on the relationships explicitly stated between events. External information cannot influence the decision.
3. **Event Information**
Both events (`primary` and `secondary`) include timestamp details (`valid\_at` and `invalid\_at`) along with semantic context through either `Statement`, `Triplet`, or both. This context ensures accurate and relevant comparisons.
```
`event\_invalidation\_prompt = """
Task: Analyze the primary event against the secondary event and determine if the primary event is invalidated by the secondary event.
Only set dates if they explicitly relate to the validity of the relationship described in the text.
IMPORTANT: Only invalidate events if they are directly invalidated by the other event given in the context. Do NOT use any external knowledge to determine validity ranges.
Only use dates that are directly stated to invalidate the relationship. The invalid\_at for the invalidated event should be the valid\_at of the event that caused the invalidation.
Invalidation Guidelines:
1. Dates are given in ISO 8601 format (YYYY-MM-DDTHH:MM:SS.SSSSSSZ).
2. Where invalid\_at is null, it means this event is still valid and considered to be ongoing.
3. Where invalid\_at is defined, the event has previously been invalidated by something else and can be considered "finished".
4. An event can refine the invalid\_at of a finished event to an earlier date only.
5. An event cannot invalidate an event that chronologically occurred after it.
6. An event cannot be invalidated by an event that chronologically occurred before it.
7. An event cannot invalidate itself.
---
Primary Event:
{% if primary\_event -%}
Statement: {{primary\_event}}
{%- endif %}
{% if primary\_triplet -%}
Triplet: {{primary\_triplet}}
{%- endif %}
Valid\_at: {{primary\_event.valid\_at}}
Invalid\_at: {{primary\_event.invalid\_at}}
---
Secondary Event:
{% if secondary\_event -%}
Statement: {{secondary\_event}}
{%- endif %}
{% if secondary\_triplet -%}
Triplet: {{secondary\_triplet}}
{%- endif %}
Valid\_at: {{secondary\_event.valid\_at}}
Invalid\_at: {{secondary\_event.invalid\_at}}
---
Return: "True" if the primary event is invalidated or its invalid\_at is refined else "False"
"""`
```
#### Requirements to be compared for Invalidation
We can only invalidate dynamic facts that haven’t been marked invalid yet. These facts serve as our primary events, while potential candidates for invalidation are our secondary events. To streamline the invalidation process, consider these guidelines when evaluating secondary events:
1. Must be a *FACT* type and not *Atemporal*
2. Share at least one canonical entity at the triplet level
3. Belong to the same semantic predicate group at the triplet level (defined below)
4. Temporally overlap and be currently ongoing
5. Have a statement cosine similarity above the threshold (currently set to 0.5)
6. The similarity threshold (0.5) helps us filter noise effectively by selecting only the `top\_k` most relevant results. Low-level semantic similarities are acceptable since our goal is refining the data sent to the LLM for further assessment
When invalidation occurs, we annotate the affected events with `expired\_at` and `invalidated\_by` to clearly indicate cause-and-effect relationships.
```
`PREDICATE\_GROUPS: list[list[str]] = [
["IS\_A", "HAS\_A", "LOCATED\_IN", "HOLDS\_ROLE", "PART\_OF"],
["PRODUCES", "SELLS", "SUPPLIES", "DISCONTINUED", "SECURED"],
["LAUNCHED", "DEVELOPED", "ADOPTED\_BY", "INVESTS\_IN", "COLLABORATES\_WITH"],
["HAS\_REVENUE", "INCREASED", "DECREASED", "RESULTED\_IN", "TARGETS"],
]`
```
When we put all of this together, the workflow for our `InvalidationAgent` looks like this:
1. **Temporal Range Detection**
We start by identifying when events happen with `get\_incoming\_temporal\_bounds()`. This function checks the event's `valid\_at` and, if it's dynamic, its `invalid\_at`. Atemporal events aren't included here.
2. **Temporal Event Selection**
We use `select\_events\_temporally()` to filter events by:
* Checking if they're static or dynamic.
* Determining if their time ranges overlap with our incoming event.
* Handling dynamic events carefully, especially "ongoing" ones without an `invalid\_at`, or events with various overlaps.
* **Embedding Similarity Filtering**
Then, `filter\_by\_embedding\_similarity()` compares events based on semantic similarity:
* It calculates cosine similarity between embeddings.
* Events below a similarity threshold (`\_similarity\_threshold = 0.5`) are filtered out.
* We keep only the top-K most similar events (`\_top\_k = 10`).
* **Combining Temporal and Semantic Filters**
With `select\_temporally\_relevant\_events\_for\_invalidation()`, we:
* Apply temporal filters first.
* Then apply embedding similarity filters.
* This gives us a refined list of events most likely interacting or conflicting with the incoming one.
* **Event Invalidation Decision (LLM-based)**
The LLM-based `invalidation\_step()` (powered by GPT-4.1-mini) determines whether the incoming event invalidates another event:
* If it does, we update:
* `invalid\_at` to match the secondary event's `valid\_at`.
* `expired\_at` with the current timestamp.
* `invalidated\_by` with the ID of the secondary event.
* **Bidirectional Event Check**
We use `bi\_directional\_event\_invalidation()` to check:
* If the incoming event invalidates existing events.
* If existing, later events invalidate the incoming event, especially if the incoming one is dynamic and currently valid.
* **Deduplication Logic**
Lastly, `resolve\_duplicate\_invalidations()` ensures clean invalidation:
* It allows only one invalidation per event.
* Picks the earliest invalidation time to avoid conflicts.
* This helps manage batch processing effectively.
The invalidation below represents this part of our pipeline:
```
`import asyncio
import logging
import pickle
import sqlite3
from collections import Counter, defaultdict
from collections.abc import Coroutine
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime
from typing import Any
from jinja2 import DictLoader, Environment
from openai import AsyncOpenAI
from scipy.spatial.distance import cosine
from tenacity import retry, stop\_after\_attempt, wait\_random\_exponential
class InvalidationAgent:
"""Handles temporal-based operations for extracting and processing temporal events from text."""
def \_\_init\_\_(self, max\_workers: int = 5) -\> None:
"""Initialize the TemporalAgent with a client."""
self.max\_workers = max\_workers
self.\_executor = ThreadPoolExecutor(max\_workers=max\_workers)
self.logger = logging.getLogger(\_\_name\_\_)
self.\_client = AsyncOpenAI()
self.\_model = "gpt-4.1-mini"
self.\_similarity\_threshold = 0.5
self.\_top\_k = 10
self.\_env = Environment(loader=DictLoader({
"event\_invalidation.jinja": event\_invalidation\_prompt,
}))
@staticmethod
def cosine\_similarity(v1: list[float], v2: list[float]) -\> float:
"""Calculate cosine similarity between two vectors."""
return float(1 - cosine(v1, v2))
@staticmethod
def get\_incoming\_temporal\_bounds(
event: TemporalEvent,
) -\> dict[str, datetime] | None:
"""Get temporal bounds of all temporal events associated with a statement."""
if (event.temporal\_type == TemporalType.ATEMPORAL) or (event.valid\_at is None):
return None
temporal\_bounds = {"start": event.valid\_at, "end": event.valid\_at}
if event.temporal\_type == TemporalType.DYNAMIC:
if event.invalid\_at:
temporal\_bounds["end"] = event.invalid\_at
return temporal\_bounds
def select\_events\_temporally(
self,
triplet\_events: list[tuple[Triplet, TemporalEvent]],
temp\_bounds: dict[str, datetime],
dynamic: bool = False,
) -\> list[tuple[Triplet, TemporalEvent]]:
"""Select temporally relevant events (static or dynamic) based on temporal bounds.
Groups events into before, after, and overlapping categories based on their temporal bounds.
Args:
triplet\_events: List of (Triplet, TemporalEvent) tuples to filter
temp\_bounds: Dict with 'start' and 'end' datetime bounds
dynamic: If True, filter dynamic events; if False, filter static events
n\_window: Number of events to include before and after bounds
Returns:
Dict with keys '{type}\_before', '{type}\_after', '{type}\_overlap' where type is 'dynamic' or 'static'
"""
def \_check\_overlaps\_dynamic(event: TemporalEvent, start: datetime, end: datetime) -\> bool:
"""Check if the dynamic event overlaps with the temporal bounds of the incoming event."""
if event.temporal\_type != TemporalType.DYNAMIC:
return False
event\_start = event.valid\_at or datetime.min
event\_end = event.invalid\_at
# 1. Event contains the start
if (event\_end is not None) and (event\_start \<= start \<= event\_end):
return True
# 2. Ongoing event starts before the incoming start
if (event\_end is None) and (event\_start \<= start):
return True
# 3. Event starts within the incoming interval
if start \<= event\_start \<= end:
return True
return False
# Filter by temporal type
target\_type = TemporalType.DYNAMIC if dynamic else TemporalType.STATIC
filtered\_events = [(triplet, event) for triplet, event in triplet\_events if event.temporal\_type == target\_type]
# Sort by valid\_at timestamp
sorted\_events = sorted(filtered\_events, key=lambda te: te[1].valid\_at or datetime.min)
start = temp\_bounds["start"]
end = temp\_bounds["end"]
if dynamic:
overlap: list[tuple[Triplet, TemporalEvent]] = [
(triplet, event) for triplet, event in sorted\_events if \_check\_overlaps\_dynamic(event, start, end)
]
else:
overlap = []
if start != end:
overlap = [(triplet, event) for triplet, event in sorted\_events if event.valid\_at and start \<= event.valid\_at \<= end]
return overlap
def filter\_by\_embedding\_similarity(
self,
reference\_event: TemporalEvent,
candidate\_pairs: list[tuple[Triplet, TemporalEvent]],
) -\> list[tuple[Triplet, TemporalEvent]]:
"""Filter triplet-event pairs by embedding similarity."""
pairs\_with\_similarity = [
(triplet, event, self.cosine\_similarity(reference\_event.embedding, event.embedding)) for triplet, event in candidate\_pairs
]
filtered\_pairs = [
(triplet, event) for triplet, event, similarity in pairs\_with\_similarity if similarity \>= self.\_similarity\_threshold
]
sorted\_pairs = sorted(filtered\_pairs, key=lambda x: self.cosine\_similarity(reference\_event.embedding, x[1].embedding), reverse=True)
return sorted\_pairs[: self.\_top\_k]
def select\_temporally\_relevant\_events\_for\_invalidation(
self,
incoming\_event: TemporalEvent,
candidate\_triplet\_events: list[tuple[Triplet, TemporalEvent]],
) -\> list[tuple[Triplet, TemporalEvent]] | None:
"""Select the temporally relevant events based on temporal range of incoming event."""
temporal\_bounds = self.get\_incoming\_temporal\_bounds(event=incoming\_event)
if not temporal\_bounds:
return None
# First apply temporal filtering - find overlapping events
selected\_statics = self.select\_events\_temporally(
triplet\_events=candidate\_triplet\_events,
temp\_bounds=temporal\_bounds,
)
selected\_dynamics = self.select\_events\_temporally(
triplet\_events=candidate\_triplet\_events,
temp\_bounds=temporal\_bounds,
dynamic=True,
)
# Then filter by semantic similarity
similar\_static = self.filter\_by\_embedding\_similarity(reference\_event=incoming\_event, candidate\_pairs=selected\_statics)
similar\_dynamics = self.filter\_by\_embedding\_similarity(reference\_event=incoming\_event, candidate\_pairs=selected\_dynamics)
return similar\_static + similar\_dynamics
@retry(wait=wait\_random\_exponential(multiplier=1, min=1, max=30), stop=stop\_after\_attempt(3))
async def invalidation\_step(
self,
primary\_event: TemporalEvent,
primary\_triplet: Triplet,
secondary\_event: TemporalEvent,
secondary\_triplet: Triplet,
) -\> TemporalEvent:
"""Check if primary event should be invalidated by secondary event.
Args:
primary\_event: Event to potentially invalidate
primary\_triplet: Triplet associated with primary event
secondary\_event: Event that might cause invalidation
secondary\_triplet: Triplet associated with secondary event
Returns:
TemporalEvent: Updated primary event (may have invalid\_at and invalidated\_by set)
"""
template = self.\_env.get\_template("event\_invalidation.jinja")
prompt = template.render(
primary\_event=primary\_event.statement,
primary\_triplet=f"({primary\_triplet.subject\_name}, {primary\_triplet.predicate}, {primary\_triplet.object\_name})",
primary\_valid\_at=primary\_event.valid\_at,
primary\_invalid\_at=primary\_event.invalid\_at,
secondary\_event=secondary\_event.statement,
secondary\_triplet=f"({secondary\_triplet.subject\_name}, {secondary\_triplet.predicate}, {secondary\_triplet.object\_name})",
secondary\_valid\_at=secondary\_event.valid\_at,
secondary\_invalid\_at=secondary\_event.invalid\_at,
)
response = await self.\_client.responses.parse(
model=self.\_model,
temperature=0,
input=prompt,
)
# Parse boolean response
response\_bool = str(response).strip().lower() == "true" if response else False
if not response\_bool:
return primary\_event
# Create updated event with invalidation info
updated\_event = primary\_event.model\_copy(
update={
"invalid\_at": secondary\_event.valid\_at,
"expired\_at": datetime.now(),
"invalidated\_by": secondary\_event.id,
}
)
return updated\_event
async def bi\_directional\_event\_invalidation(
self,
incoming\_triplet: Triplet,
incoming\_event: TemporalEvent,
existing\_triplet\_events: list[tuple[Triplet, TemporalEvent]],
) -\> tuple[TemporalEvent, list[TemporalEvent]]:
"""Validate and update temporal information for triplet events with full bidirectional invalidation.
Args:
incoming\_triplet: The new triplet
incoming\_event: The new event associated with the triplet
existing\_triplet\_events: List of existing (triplet, event) pairs to validate against
Returns:
tuple[TemporalEvent, list[TemporalEvent]]: (updated\_incoming\_event, list\_of\_changed\_existing\_events)
"""
changed\_existing\_events: list[TemporalEvent] = []
updated\_incoming\_event = incoming\_event
# Filter for dynamic events that can be invalidated
dynamic\_events\_to\_check = [
(triplet, event) for triplet, event in existing\_triplet\_events if event.temporal\_type == TemporalType.DYNAMIC
]
# 1. Check if incoming event invalidates existing dynamic events
if dynamic\_events\_to\_check:
tasks = [
self.invalidation\_step(
primary\_event=existing\_event,
primary\_triplet=existing\_triplet,
secondary\_event=incoming\_event,
secondary\_triplet=incoming\_triplet,
)
for existing\_triplet, existing\_event in dynamic\_events\_to\_check
]
updated\_events = await asyncio.gather(\*tasks)
for original\_pair, updated\_event in zip(dynamic\_events\_to\_check, updated\_events, strict=True):
original\_event = original\_pair[1]
if (updated\_event.invalid\_at != original\_event.invalid\_at) or (
updated\_event.invalidated\_by != original\_event.invalidated\_by
):
changed\_existing\_events.append(updated\_event)
# 2. Check if existing events invalidate the incoming dynamic event
if incoming\_event.temporal\_type == TemporalType.DYNAMIC and incoming\_event.invalid\_at is None:
# Only check events that occur after the incoming event
invalidating\_events = [
(triplet, event)
for triplet, event in existing\_triplet\_events
if (incoming\_event.valid\_at and event.valid\_at and incoming\_event.valid\_at \< event.valid\_at)
]
if invalidating\_events:
tasks = [
self.invalidation\_step(
primary\_event=incoming\_event,
primary\_triplet=incoming\_triplet,
secondary\_event=existing\_event,
secondary\_triplet=existing\_triplet,
)
for existing\_triplet, existing\_event in invalidating\_events
]
updated\_events = await asyncio.gather(\*tasks)
# Find the earliest invalidation
valid\_invalidations = [(e.invalid\_at, e.invalidated\_by) for e in updated\_events if e.invalid\_at is not None]
if valid\_invalidations:
earliest\_invalidation = min(valid\_invalidations, key=lambda x: x[0])
updated\_incoming\_event = incoming\_event.model\_copy(
update={
"invalid\_at": earliest\_invalidation[0],
"invalidated\_by": earliest\_invalidation[1],
"expired\_at": datetime.now(),
}
)
return updated\_incoming\_event, changed\_existing\_events
@staticmethod
def resolve\_duplicate\_invalidations(changed\_events: list[TemporalEvent]) -\> list[TemporalEvent]:
"""Resolve duplicate invalidations by selecting the most restrictive (earliest) invalidation.
When multiple incoming events invalidate the same existing event, we should apply
the invalidation that results in the shortest validity range (earliest invalid\_at).
Args:
changed\_events: List of events that may contain duplicates with different invalidations
Returns:
List of deduplicated events with the most restrictive invalidation applied
"""
if not changed\_events:
return []
# Count occurrences of each event ID
id\_counts = Counter(str(event.id) for event in changed\_events)
resolved\_events = []
# Group events by ID only for those with duplicates
events\_by\_id = defaultdict(list)
for event in changed\_events:
event\_id = str(event.id)
if id\_counts[event\_id] == 1:
resolved\_events.append(event)
else:
events\_by\_id[event\_id].append(event)
# Deduplicate only those with duplicates
for \_id, event\_versions in events\_by\_id.items():
invalidated\_versions = [e for e in event\_versions if e.invalid\_at is not None]
if not invalidated\_versions:
resolved\_events.append(event\_versions[0])
else:
most\_restrictive = min(invalidated\_versions, key=lambda e: (e.invalid\_at if e.invalid\_at is not None else datetime.max))
resolved\_events.append(most\_restrictive)
return resolved\_events
async def \_execute\_task\_pool(
self,
tasks: list[Coroutine[Any, Any, tuple[TemporalEvent, list[TemporalEvent]]]],
batch\_size: int = 10
) -\> list[Any]:
"""Execute tasks in batches using a pool to control concurrency.
Args:
tasks: List of coroutines to execute
batch\_size: Number of tasks to process concurrently
Returns:
List of results from all tasks
"""
all\_results = []
for i in range(0, len(tasks), batch\_size):
batch = tasks[i:i + batch\_size]
batch\_results = await asyncio.gather(\*batch, return\_exceptions=True)
all\_results.extend(batch\_results)
# Small delay between batches to prevent overload
if i + batch\_size \< len(tasks):
await asyncio.sleep(0.1)
return all\_results
async def process\_invalidations\_in\_parallel(
self,
incoming\_triplets: list[Triplet],
incoming\_events: list[TemporalEvent],
existing\_triplets: list[Triplet],
existing\_events: list[TemporalEvent],
) -\> tuple[list[TemporalEvent], list[TemporalEvent]]:
"""Process invalidations for multiple triplets in parallel.
Args:
incoming\_triplets: List of new triplets to process
incoming\_events: List of events associated with incoming triplets
existing\_triplets: List of existing triplets from DB
existing\_events: List of existing events from DB
Returns:
tuple[list[TemporalEvent], list[TemporalEvent]]:
- List of updated incoming events (potentially invalidated)
- List of existing events that were updated (deduplicated)
"""
# Create mappings for faster lookups
event\_map = {str(e.id): e for e in existing\_events}
incoming\_event\_map = {str(t.event\_id): e for t, e in zip(incoming\_triplets, incoming\_events, strict=False)}
# Prepare tasks for parallel processing
tasks = []
for incoming\_triplet in incoming\_triplets:
incoming\_event = incoming\_event\_map[str(incoming\_triplet.event\_id)]
# Get related triplet-event pairs
related\_pairs = [
(t, event\_map[str(t.event\_id)])
for t in existing\_triplets
if (str(t.subject\_id) == str(incoming\_triplet.subject\_id) or str(t.object\_id) == str(incoming\_triplet.object\_id))
and str(t.event\_id) in event\_map
]
# Filter for temporal relevance
all\_relevant\_events = self.select\_temporally\_relevant\_events\_for\_invalidation(
incoming\_event=incoming\_event,
candidate\_triplet\_events=related\_pairs,
)
if not all\_relevant\_events:
continue
# Add task for parallel processing
task = self.bi\_directional\_event\_invalidation(
incoming\_triplet=incoming\_triplet,
incoming\_event=incoming\_event,
existing\_triplet\_events=all\_relevant\_events,
)
tasks.append(task)
# Process all invalidations in parallel with pooling
if not tasks:
return [], []
# Use pool size based on number of workers, but cap it
pool\_size = min(self.max\_workers \* 2, 10) # Adjust these numbers based on your needs
results = await self.\_execute\_task\_pool(tasks, batch\_size=pool\_size)
# Collect all results (may contain duplicates)
updated\_incoming\_events = []
all\_changed\_existing\_events = []
for result in results:
if isinstance(result, Exception):
self.logger.error(f"Task failed with error: {str(result)}")
continue
updated\_event, changed\_events = result
updated\_incoming\_events.append(updated\_event)
all\_changed\_existing\_events.extend(changed\_events)
# Resolve duplicate invalidations for existing events
deduplicated\_existing\_events = self.resolve\_duplicate\_invalidations(all\_changed\_existing\_events)
# Resolve duplicate invalidations for incoming events (in case multiple triplets from same event)
deduplicated\_incoming\_events = self.resolve\_duplicate\_invalidations(updated\_incoming\_events)
return deduplicated\_incoming\_events, deduplicated\_existing\_events
@staticmethod
def batch\_fetch\_related\_triplet\_events(
conn: sqlite3.Connection,
incoming\_triplets: list[Triplet],
) -\> tuple[list[Triplet], list[TemporalEvent]]:
"""
Batch fetch all existing triplets and their events from the DB that are related to any of the incoming triplets.
Related means:
- Share a subject or object entity
- Predicate is in the same group
- Associated event is a FACT
Returns two lists: triplets and events (with mapping via event\_id).
"""
# 1. Build sets of all relevant entity IDs and predicate groups
entity\_ids = set()
predicate\_to\_group = {}
for group in PREDICATE\_GROUPS:
group\_list = list(group)
for pred in group\_list:
predicate\_to\_group[pred] = group\_list
relevant\_predicates = set()
for triplet in incoming\_triplets:
entity\_ids.add(str(triplet.subject\_id))
entity\_ids.add(str(triplet.object\_id))
group = predicate\_to\_group.get(str(triplet.predicate), [])
if group:
relevant\_predicates.update(group)
# 2. Prepare SQL query
entity\_placeholders = ",".join(["?"] \* len(entity\_ids))
predicate\_placeholders = ",".join(["?"] \* len(relevant\_predicates))
query = f"""
SELECT
t.id,
t.subject\_name,
t.subject\_id,
t.predicate,
t.object\_name,
t.object\_id,
t.value,
t.event\_id,
e.chunk\_id,
e.statement,
e.triplets,
e.statement\_type,
e.temporal\_type,
e.valid\_at,
e.invalid\_at,
e.created\_at,
e.expired\_at,
e.invalidated\_by,
e.embedding
FROM triplets t
JOIN events e ON t.event\_id = e.id
WHERE
(t.subject\_id IN ({entity\_placeholders}) OR t.object\_id IN ({entity\_placeholders}))
AND t.predicate IN ({predicate\_placeholders})
AND e.statement\_type = ?
"""
params = list(entity\_ids) + list(entity\_ids) + list(relevant\_predicates) + [StatementType.FACT]
cursor = conn.cursor()
cursor.execute(query, params)
rows = cursor.fetchall()
triplets = []
events = []
events\_by\_id = {}
for row in rows:
triplet = Triplet(
id=row[0],
subject\_name=row[1],
subject\_id=row[2],
predicate=Predicate(row[3]),
object\_name=row[4],
object\_id=row[5],
value=row[6],
event\_id=row[7],
)
event\_id = row[7]
triplets.append(triplet)
if event\_id not in events\_by\_id:
events\_by\_id[event\_id] = TemporalEvent(
id=row[7],
chunk\_id=row[8],
statement=row[9],
triplets=TemporalEvent.parse\_triplets\_json(row[10]),
statement\_type=row[11],
temporal\_type=row[12],
valid\_at=row[13],
invalid\_at=row[14],
created\_at=row[15],
expired\_at=row[16],
invalidated\_by=row[17],
embedding=pickle.loads(row[18]) if row[18] else [0] \* 1536,
)
events = list(events\_by\_id.values())
return triplets, events`
```
We can create a batch processing function for invalidation for a set of Temporal Events. This is where we filter our Statements to type FACT before passing into the invalidation agent to process.
```
`
async def batch\_process\_invalidation(
conn: sqlite3.Connection, all\_events: list[TemporalEvent], all\_triplets: list[Triplet], invalidation\_agent: InvalidationAgent
) -\> tuple[list[TemporalEvent], list[TemporalEvent]]:
"""Process invalidation for all FACT events that are temporal.
Args:
conn: SQLite database connection
all\_events: List of all extracted events
all\_triplets: List of all extracted triplets
invalidation\_agent: The invalidation agent instance
Returns:
tuple[list[TemporalEvent], list[TemporalEvent]]:
- final\_events: All events (updated incoming events)
- events\_to\_update: Existing events that need DB updates
"""
def \_get\_fact\_triplets(
all\_events: list[TemporalEvent],
all\_triplets: list[Triplet],
) -\> list[Triplet]:
"""
Return only those triplets whose associated event is of statement\_type FACT.
"""
fact\_event\_ids = {
event.id for event in all\_events if (event.statement\_type == StatementType.FACT) and (event.temporal\_type != TemporalType.ATEMPORAL)
}
return [triplet for triplet in all\_triplets if triplet.event\_id in fact\_event\_ids]
# Prepare a list of triplets whose associated event is a FACT and not ATEMPORAL
fact\_triplets = \_get\_fact\_triplets(all\_events, all\_triplets)
if not fact\_triplets:
return all\_events, []
# Create event map for quick lookup
all\_events\_map = {event.id: event for event in all\_events}
# Build aligned lists of valid triplets and their corresponding events
fact\_events: list[TemporalEvent] = []
valid\_fact\_triplets: list[Triplet] = []
for triplet in fact\_triplets:
# Handle potential None event\_id and ensure type safety
if triplet.event\_id is not None:
event = all\_events\_map.get(triplet.event\_id)
if event:
fact\_events.append(event)
valid\_fact\_triplets.append(triplet)
else:
print(f"Warning: Could not find event for fact\_triplet with event\_id {triplet.event\_id}")
else:
print(f"Warning: Fact triplet {triplet.id} has no event\_id, skipping invalidation")
if not valid\_fact\_triplets:
return all\_events, []
# Batch fetch all related existing triplets and events
existing\_triplets, existing\_events = invalidation\_agent.batch\_fetch\_related\_triplet\_events(conn, valid\_fact\_triplets)
# Process all invalidations in parallel
updated\_incoming\_fact\_events, changed\_existing\_events = await invalidation\_agent.process\_invalidations\_in\_parallel(
incoming\_triplets=valid\_fact\_triplets,
incoming\_events=fact\_events,
existing\_triplets=existing\_triplets,
existing\_events=existing\_events,
)
# Create mapping for efficient updates
updated\_incoming\_event\_map = {event.id: event for event in updated\_incoming\_fact\_events}
# Reconstruct final events list with updates applied
final\_events = []
for original\_event in all\_events:
if original\_event.id in updated\_incoming\_event\_map:
final\_events.append(updated\_incoming\_event\_map[original\_event.id])
else:
final\_events.append(original\_event)
return final\_events, changed\_existing\_events`
```
### 3.2.11. Putting it all together
Now that we have built out each individual component of the Temporal Knowledge Graph workflow, we can integrate them into a cohesive workflow.
Given a chunked transcript, the Temporal Agent sequentially processes each chunk, initially extracting relevant statements. These statements are then classified and enriched through subsequent extraction phases, resulting in Temporal Events, structured Triplets, and identified Entities.
The extracted Entities are cross-referenced with existing records in the database, ensuring accurate resolution and avoiding redundancy. Following entity resolution, the Dynamic Facts undergo validation via the Invalidation Agent to verify temporal consistency and validity.
After successful processing and validation, the refined data is systematically stored into their respective tables within the SQLite database, maintaining an organized and temporally accurate knowledge graph.
To help visually ground the code presented below, we can look again at the pipeline diagram:
```
`import sqlite3
from db\_interface import (
has\_events,
insert\_chunk,
insert\_entity,
insert\_event,
insert\_transcript,
insert\_triplet,
update\_events\_batch,
)
from utils import safe\_iso
async def ingest\_transcript(
transcript: Transcript,
conn: sqlite3.Connection,
temporal\_agent: TemporalAgent,
invalidation\_agent: InvalidationAgent,
entity\_resolver: EntityResolution) -\> None:
"""
Ingest a Transcript object into the database, extracting and saving all chunks, events, triplets, and entities.
"""
insert\_transcript(
conn,
{
"id": str(transcript.id),
"text": transcript.text,
"company": transcript.company,
"date": transcript.date,
"quarter": transcript.quarter,
},
)
transcript, all\_events, all\_triplets, all\_entities = await temporal\_agent.extract\_transcript\_events(transcript)
entity\_resolver.resolve\_entities\_batch(all\_entities)
name\_to\_canonical = {entity.name: entity.resolved\_id for entity in all\_entities if entity.resolved\_id}
# Update triplets with resolved entity IDs
for triplet in all\_triplets:
if triplet.subject\_name in name\_to\_canonical:
triplet.subject\_id = name\_to\_canonical[triplet.subject\_name]
if triplet.object\_name in name\_to\_canonical:
triplet.object\_id = name\_to\_canonical[triplet.object\_name]
# Invalidation processing with properly resolved triplet IDs
events\_to\_update: list[TemporalEvent] = []
if has\_events(conn):
all\_events, events\_to\_update = await batch\_process\_invalidation(conn, all\_events, all\_triplets, invalidation\_agent)
# ALL DB operations happen in single transaction
with conn:
# Update existing events first (they're already in DB)
if events\_to\_update:
update\_events\_batch(conn, events\_to\_update)
print(f"Updated {len(events\_to\_update)} existing events")
# Insert new data
for chunk in transcript.chunks or []:
chunk\_dict = chunk.model\_dump()
insert\_chunk(
conn,
{
"id": str(chunk\_dict["id"]),
"transcript\_id": str(transcript.id),
"text": chunk\_dict["text"],
"metadata": json.dumps(chunk\_dict["metadata"]),
},
)
for event in all\_events:
event\_dict = {
"id": str(event.id),
"chunk\_id": str(event.chunk\_id),
"statement": event.statement,
"embedding": pickle.dumps(event.embedding) if event.embedding is not None else None,
"triplets": event.triplets\_json,
"statement\_type": event.statement\_type.value if hasattr(event.statement\_type, "value") else event.statement\_type,
"temporal\_type": event.temporal\_type.value if hasattr(event.temporal\_type, "value") else event.temporal\_type,
"created\_at": safe\_iso(event.created\_at),
"valid\_at": safe\_iso(event.valid\_at),
"expired\_at": safe\_iso(event.expired\_at),
"invalid\_at": safe\_iso(event.invalid\_at),
"invalidated\_by": str(event.invalidated\_by) if event.invalidated\_by else None,
}
insert\_event(conn, event\_dict)
for triplet in all\_triplets:
try:
insert\_triplet(
conn,
{
"id": str(triplet.id),
"event\_id": str(triplet.event\_id),
"subject\_name": triplet.subject\_name,
"subject\_id": str(triplet.subject\_id),
"predicate": triplet.predicate,
"object\_name": triplet.object\_name,
"object\_id": str(triplet.object\_id),
"value": triplet.value,
},
)
except KeyError as e:
print(f"KeyError: {triplet.subject\_name} or {triplet.object\_name} not found in name\_to\_canonical")
print(f"Skipping triplet: Entity '{e.args[0]}' is unresolved.")
continue
# Deduplicate entities by id before insert
unique\_entities = {}
for entity in all\_entities:
unique\_entities[str(entity.id)] = entity
for entity in unique\_entities.values():
insert\_entity(conn, {"id": str(entity.id), "name": entity.name, "resolved\_id": str(entity.resolved\_id)})
return None`
```
```
`# Initialize core components
sqlite\_conn = make\_connection(memory=False, refresh=True)
temporal\_agent = TemporalAgent()
invalidation\_agent = InvalidationAgent()
entity\_resolver = EntityResolution(sqlite\_conn)`
```
```
`# Ingest single transcript
await ingest\_transcript(transcripts[0], sqlite\_conn, temporal\_agent, invalidation\_agent, entity\_resolver)`
```
```
`# View what tables have been created and populated
sqlite\_conn.execute("SELECT name FROM sqlite\_master WHERE type='table';").fetchall()`
```
```
`# View triplets table
from db\_interface import view\_db\_table
triplets\_df = view\_db\_table(sqlite\_conn, "triplets", max\_rows=10)
display(triplets\_df)`
```
We can then ingest the rest of the Transcripts. Note that this code has not been optimised to be production ready and on average takes 2-5 mins per Transcript. This bulk ingestion using the data in /transcripts (\~30 files) will take up to 2 hours to run. Optimizing this is a critical step in scaling to production. We outline some methods you can use to approach this in the Appendix in [A.3 “Implementing Concurrency in the Ingestion Pipeline”](./Appendix.ipynb), including batch chunking, entity clustering, and more.
```
`import time
from tqdm import tqdm
async def bulk\_transcript\_ingestion(transcripts: list[Transcript], sqlite\_conn: sqlite3.Connection) -\> None:
"""Handle transcript ingestion with duplicate checking, optional overwriting, and progress tracking.
Args:
transcripts (List[Transcript]): List of transcripts to ingest
sqlite\_conn (sqlite3.Connection): SQLite database connection
overwrite (bool, optional): Whether to overwrite existing transcripts. Defaults to False.
"""
temporal\_agent = TemporalAgent()
invalidation\_agent = InvalidationAgent()
entity\_resolver = EntityResolution(sqlite\_conn)
pbar = tqdm(total=len(transcripts), desc="Ingesting transcripts")
for transcript in transcripts:
start\_time = time.time()
try:
await ingest\_transcript(transcript, sqlite\_conn, temporal\_agent, invalidation\_agent, entity\_resolver)
# Calculate and display ingestion time
end\_time = time.time()
ingestion\_time = end\_time - start\_time
# Update progress bar with completion message
pbar.write(
f"Ingested transcript {transcript.id} "
f"in {ingestion\_time:.2f} seconds"
)
except Exception as e:
pbar.write(f"Error ingesting transcript {transcript.id}: {str(e)}")
finally:
# Update progress bar
pbar.update(1)
pbar.close()`
```
>
> Note: Running the below cell for all transcripts in this dataset can take approximately 1 hour
>
```
`# Bulk ingestion (not recommended)
sqlite\_conn = make\_connection(memory=False, refresh=True, db\_path="my\_database.db")
transcripts = load\_transcripts\_from\_pickle()
# await bulk\_transcript\_ingestion(transcripts, sqlite\_conn)`
```
We recommend loading the pre-processed AMD and NVDA data from file by creating a new SQLite connection using the code below. This will create the database needed for building the graph and retriever.
You can find this data on [HuggingFace](https://huggingface.co/datasets/TomoroAI/temporal_cookbook_db).
```
`from cb\_functions import load\_db\_from\_hf
sqlite\_conn = load\_db\_from\_hf()`
```
```
`Loading transcripts...
Loading chunks...
Loading events...
Loading triplets...
Loading entities...
✅ All tables written to SQLite.`
```
```
`# View transcripts table
from db\_interface import view\_db\_table
transcript\_df = view\_db\_table(sqlite\_conn, "transcripts", max\_rows=None)
display(transcript\_df)`
```
||id|text|company|date|quarter|
|0|f2f5aa4c-ad2b-4ed5-9792-bcbddbc4e207|\\n\\nRefinitiv StreetEvents Event Transcript\\nE...|NVDA|2020-08-19T00:00:00|Q2 2021|
|1|74d42583-b614-4771-80c8-1ddf964a4f1c|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2016-07-21T00:00:00|Q2 2016|
|2|26e523aa-7e15-4741-986a-6ec0be034a33|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2016-11-10T00:00:00|Q3 2017|
|3|74380d19-203a-48f6-a1c8-d8df33aae362|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2018-05-10T00:00:00|Q1 2019|
|4|7d620d30-7b09-4774-bc32-51b00a80badf|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2017-07-25T00:00:00|Q2 2017|
|5|1ba2fc55-a121-43d4-85d7-e221851f2c7f|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2017-01-31T00:00:00|Q4 2016|
|6|db1925df-b5a5-4cb2-862b-df269f53be7e|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2017-11-09T00:00:00|Q3 2018|
|7|fe212bc0-9b3d-44ed-91ca-bfb856b21aa6|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2019-02-14T00:00:00|Q4 2019|
|8|7c0a6f9c-9279-4714-b25e-8be20ae8fb99|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2019-04-30T00:00:00|Q1 2019|
|9|10f95617-e5b2-4525-a207-cec9ae9a3211|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2019-01-29T00:00:00|Q4 2018|
|10|aab926b2-5a23-4b39-a29c-c1e7ceef5a55|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2020-04-28T00:00:00|Q1 2020|
|11|6d45f413-3aa5-4c76-b3cf-d0fdb0a03787|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2019-08-15T00:00:00|Q2 2020|
|12|ad10e284-d209-42f1-8a7c-8c889af0914e|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2019-10-29T00:00:00|Q3 2019|
|13|a30da2d4-3327-432e-9ce0-b57795a0fe26|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2018-04-25T00:00:00|Q1 2018|
|14|038e0986-a689-4374-97d2-651b05bdfae8|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2018-11-15T00:00:00|Q3 2019|
|15|6ff24a98-ad3b-4013-92eb-45ac5b0f214d|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2016-02-17T00:00:00|Q4 2016|
|16|34d010f1-7221-4ed4-92f4-c69c4a3fd779|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2020-02-13T00:00:00|Q4 2020|
|17|e5e31dd4-2587-40af-8f8c-56a772831acd|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2017-10-24T00:00:00|Q3 2017|
|18|60e56971-9ab8-4ebd-ac2a-e9fce301ca33|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2016-08-11T00:00:00|Q2 2017|
|19|1d4b2c13-4bf0-4c0f-90fe-a48c6e03c73a|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2018-08-16T00:00:00|Q2 2019|
|20|b6b5df13-4736-4ecd-9c41-cf62f4639a4a|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2016-04-21T00:00:00|Q1 2016|
|21|43094307-3f8f-40a2-886b-f4f1da64312c|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2017-05-01T00:00:00|Q1 2017|
|22|e6902113-4b71-491d-b7de-8ff347b481cd|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2018-07-25T00:00:00|Q2 2018|
|23|dbaa7a7c-1db2-4b0c-9130-8ca48f10be6f|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2017-02-09T00:00:00|Q4 2017|
|24|6ec75a2d-d449-4f52-bb93-17b1770dbf6c|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2018-02-08T00:00:00|Q4 2018|
|25|bcf360a8-0784-4c31-8a09-ca824a26264f|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2017-05-09T00:00:00|Q1 2018|
|26|01d2252f-10a2-48f7-8350-ffe17bb8e18d|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2016-05-12T00:00:00|Q1 2017|
|27|d4c10451-d7b2-4c13-8f15-695596e49144|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2016-10-20T00:00:00|Q3 2016|
|28|6c832314-d5ef-42cd-9fa0-914c5480d7be|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2016-01-19T00:00:00|Q4 2015|
|29|1207115e-20ed-479c-a903-e28dfda52ebd|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2018-01-30T00:00:00|Q4 2017|
|30|259fe893-9d28-4e4d-bc55-2edf646e150b|\\n\\nRefinitiv StreetEvents Event Transcript\\nE...|AMD|2020-07-28T00:00:00|Q2 2020|
|31|02b1212b-cd3f-4c19-8505-8d1aea6d3ae2|\\n\\nThomson Reuters StreetEvents Event Transcr...|NVDA|2020-05-21T00:00:00|Q1 2021|
|32|fa199b2c-1f58-4663-af8c-29c531fc97d6|\\n\\nThomson Reuters StreetEvents Event Transcr...|AMD|2019-07-30T00:00:00|Q2 2019|
## 3.3. Knowledge Graphs
### 3.3.1 Building our Knowledge Graph with NetworkX
When constructing the knowledge graph, canonical entity identifiers derived from triplets ensure accurate mapping of entity names, allowing storage of detailed temporal metadata directly on edges. Specifically, the implementation utilizes attributes:
* **valid\_at**, **invalid\_at**, and **temporal\_type** for **Temporal Validity**, representing real-world accuracy at specific historical moments—critical for analysis of historical facts.
* Optionally, attributes **created\_at** and **expired\_at** may also be used for **Transactional Validity**, enabling audit trails and source attribution by tracking when information was recorded, updated, or corrected.
Transactional validity is particularly beneficial in scenarios such as:
* **Finance**: Determining the accepted financial facts about Company X’s balance sheet on a specific historical date, based on contemporaneously accepted knowledge.
* **Law**: Identifying applicable legal frameworks as understood at a contract signing date, or compliance obligations recognized at past dates.
* **Journalism**: Assessing if previously reported information has become outdated, ensuring press releases and reporting remain accurate and credible over time.
```
`import numpy
import pandas
import scipy
print("numpy :", numpy.\_\_version\_\_)
print("pandas:", pandas.\_\_version\_\_)
print("scipy :", scipy.\_\_version\_\_)`
```
```
`from cb\_functions import build\_graph, load\_db\_from\_hf
conn = load\_db\_from\_hf()
G = build\_graph(conn)
print(G.number\_of\_nodes(), "nodes,", G.number\_of\_edges(), "edges")`
```
```
`Loading transcripts...
✅ All tables written to SQLite.
Loading chunks...
✅ All tables written to SQLite.
Loading events...
✅ All tables written to SQLite.
Loading triplets...
✅ All tables written to SQLite.
Loading entities...
✅ All tables written to SQLite.
2282 nodes, 13150 edges`
```
```
`import networkx as nx
# Print descriptive notes about the graph
print(f"Graph has {G.number\_of\_nodes()} nodes and {G.number\_of\_edges()} edges")
# Get some basic graph statistics
print(f"Graph density: {G.number\_of\_edges() / (G.number\_of\_nodes() \* (G.number\_of\_nodes() - 1)):.4f}")
# Sample some nodes to see their attributes
sample\_nodes = list(G.nodes(data=True))[:5]
print("\\nSample nodes (first 5):")
for node\_id, attrs in sample\_nodes:
print(f" {node\_id}: {attrs}")
# Sample some edges to see their attributes
sample\_edges = list(G.edges(data=True))[:5]
print("\\nSample edges (first 5):")
for u, v, attrs in sample\_edges:
print(f" {u} -\> {v}: {attrs}")
# Get degree statistics
degrees = [d for \_, d in G.degree()]
print("\\nDegree statistics:")
print(f" Min degree: {min(degrees)}")
print(f" Max degree: {max(degrees)}")
print(f" Average degree: {sum(degrees) / len(degrees):.2f}")
# Check if graph is connected (considering it as undirected for connectivity)
undirected\_G = G.to\_undirected()
print("\\nConnectivity:")
print(f" Number of connected components: {len(list(nx.connected\_components(undirected\_G)))}")
print(f" Is weakly connected: {nx.is\_weakly\_connected(G)}")`
```
```
`# Create a visualization of the knowledge graph
import matplotlib.pyplot as plt
import networkx as nx
import numpy as np
# Create a smaller subgraph for visualization (reduce data for clarity)
# Get nodes with highest degrees for a meaningful visualization
degrees = dict(G.degree())
top\_nodes = sorted(degrees.items(), key=lambda x: x[1], reverse=True)[:20] # Reduced from 30 to 20
visualization\_nodes = [node for node, \_ in top\_nodes]
# Create subgraph with these high-degree nodes
graph = G.subgraph(visualization\_nodes)
print(f"Visualization subgraph: {graph.number\_of\_nodes()} nodes, {graph.number\_of\_edges()} edges")
# Create the plot with better styling
fig, ax = plt.subplots(figsize=(18, 14))
fig.patch.set\_facecolor("white")
# Use hierarchical layout for better structure
try:
# Try hierarchical layout first
pos = nx.nx\_agraph.graphviz\_layout(graph, prog="neato")
except (ImportError, nx.NetworkXException):
# Fall back to spring layout with better parameters
pos = nx.spring\_layout(graph, k=5, iterations=100, seed=42)
# Calculate node properties
node\_degrees = [degrees[node] for node in graph.nodes()]
max\_degree = max(node\_degrees)
min\_degree = min(node\_degrees)
# Create better color scheme
colors = plt.cm.plasma(np.linspace(0.2, 0.9, len(node\_degrees)))
node\_colors = [colors[i] for i in range(len(node\_degrees))]
# Draw nodes with improved styling
node\_sizes = [max(200, min(2000, deg \* 50)) for deg in node\_degrees] # Better size scaling
nx.draw\_networkx\_nodes(graph, pos,
node\_color=node\_colors,
node\_size=node\_sizes,
alpha=0.9,
edgecolors="black",
linewidths=1.5,
ax=ax)
# Draw edges with better styling
edge\_weights = []
for \_, \_, \_ in graph.edges(data=True):
edge\_weights.append(1)
nx.draw\_networkx\_edges(graph, pos,
alpha=0.4,
edge\_color="#666666",
width=1.0,
arrows=True,
arrowsize=15,
arrowstyle="-\>",
ax=ax)
# Add labels for all nodes with better formatting
labels = {}
for node in graph.nodes():
node\_name = graph.nodes[node].get("name", str(node))
# Truncate long names
if len(node\_name) \> 15:
node\_name = node\_name[:12] + "..."
labels[node] = node\_name
nx.draw\_networkx\_labels(graph, pos, labels,
font\_size=9,
font\_weight="bold",
font\_color="black", # changed from 'white' to 'black'
ax=ax)
# Improve title and styling
ax.set\_title("Temporal Knowledge Graph Visualization\\n(Top 20 Most Connected Entities)",
fontsize=18, fontweight="bold", pad=20)
ax.axis("off")
# Add a better colorbar
sm = plt.cm.ScalarMappable(cmap=plt.cm.plasma,
norm=plt.Normalize(vmin=min\_degree, vmax=max\_degree))
sm.set\_array([])
cbar = plt.colorbar(sm, ax=ax, shrink=0.6, aspect=30)
cbar.set\_label("Node Degree (Number of Connections)", rotation=270, labelpad=25, fontsize=12)
cbar.ax.tick\_params(labelsize=10)
# Add margin around the graph
ax.margins(0.1)
plt.tight\_layout()
plt.show()
# Print some information about the visualized nodes
print("\\nTop entities in visualization:")
for i, (node, degree) in enumerate(top\_nodes[:10]):
node\_name = G.nodes[node].get("name", "Unknown")
print(f"{i+1:2d}. {node\_name} (connections: {degree})")
# Create an improved function for easier graph visualization
def visualise\_graph(G, num\_nodes=20, figsize=(16, 12)):
"""
Visualize a NetworkX graph with improved styling and reduced data.
Args:
G: NetworkX graph
num\_nodes: Number of top nodes to include in visualization (default: 20)
figsize: Figure size tuple
"""
degrees = dict(G.degree())
top\_nodes = sorted(degrees.items(), key=lambda x: x[1], reverse=True)[:num\_nodes]
visualization\_nodes = [node for node, \_ in top\_nodes]
# Create subgraph
subgraph = G.subgraph(visualization\_nodes)
# Create the plot
fig, ax = plt.subplots(figsize=figsize)
fig.patch.set\_facecolor("white")
# Layout with better parameters
try:
pos = nx.nx\_agraph.graphviz\_layout(subgraph, prog="neato")
except (ImportError, nx.NetworkXException):
pos = nx.spring\_layout(subgraph, k=4, iterations=100, seed=42)
# Node properties
node\_degrees = [degrees[node] for node in subgraph.nodes()]
max\_degree = max(node\_degrees)
min\_degree = min(node\_degrees)
# Better color scheme
colors = plt.cm.plasma(np.linspace(0.2, 0.9, len(node\_degrees)))
node\_colors = list(colors)
# Draw nodes
node\_sizes = [max(200, min(2000, deg \* 50)) for deg in node\_degrees]
nx.draw\_networkx\_nodes(subgraph, pos,
node\_color=node\_colors,
node\_size=node\_sizes,
alpha=0.9,
edgecolors="black",
linewidths=1.5,
ax=ax)
# Draw edges
nx.draw\_networkx\_edges(subgraph, pos,
alpha=0.4,
edge\_color="#666666",
width=1.0,
arrows=True,
arrowsize=15,
ax=ax)
# Labels
labels = {}
for node in subgraph.nodes():
node\_name = subgraph.nodes[node].get("name", str(node))
if len(node\_name) \> 15:
node\_name = node\_name[:12] + "..."
labels[node] = node\_name
nx.draw\_networkx\_labels(subgraph, pos, labels,
font\_size=9,
font\_weight="bold",
font\_color="black", # changed from 'white' to 'black'
ax=ax)
ax.set\_title(f"Temporal Knowledge Graph\\n(Top {num\_nodes} Most Connected Entities)",
fontsize=16, fontweight="bold", pad=20)
ax.axis("off")
# Colorbar
sm = plt.cm.ScalarMappable(cmap=plt.cm.plasma,
norm=plt.Normalize(vmin=min\_degree, vmax=max\_degree))
sm.set\_array([])
cbar = plt.colorbar(sm, ax=ax, shrink=0.6)
cbar.set\_label("Connections", rotation=270, labelpad=20)
ax.margins(0.1)
plt.tight\_layout()
plt.show()
return subgraph`
```
```
`# Get node information on NVIDIA, filtering for what they have developed
# Find the node key for NVIDIA (case-insensitive match on name)
nvidia\_node = None
for node, data in graph.nodes(data=True):
if "nvidia" in str(data.get("name", "")).lower():
nvidia\_node = node
break
if nvidia\_node is not None:
print(f"Node key for NVIDIA: {nvidia\_node}")
print("Node attributes:")
for k, v in graph.nodes[nvidia\_node].items():
print(f" {k}: {v}")
# Show all edges where NVIDIA is the subject and the predicate is 'DEVELOPED' or 'LAUNCHED' or similar
print("\\nEdges where NVIDIA developed or launched something:")
for \_, v, \_, d in graph.out\_edges(nvidia\_node, data=True, keys=True):
pred = d.get("predicate", "").upper()
if pred in {"LAUNCHED"}:#, "LAUNCHED", "PRODUCES", "CREATED", "INTRODUCED"}:
print(f" {nvidia\_node} -[{pred}]-\> {v} | {d}")
# Optionally, print the statement if available
if "statement" in d:
print(f" Statement: {d['statement']}")
else:
print("NVIDIA node not found in the graph.")`
```
### 3.3.2 NetworkX versus Neo4j in Production
To effectively implement and utilize the knowledge graph we utilise [NetworkX](https://networkx.org/) for the purposes of this cookbook for several reasons.
1. **Python integration**: NetworkX seamlessly integrates with Python, facilitating rapid prototyping and iterative development
2. **Ease of setup**: It requires minimal initial setup, not requiring a client-server setup featured in alternatives. This makes it ideal for users who wish to run this cookbook themselves
3. **Compatibility with In-Memory Databases**: NetworkX can efficiently manage graphs with fewer than c.100,000 nodes, which is appropriate for this cookbook’s data scale
However, it should be noted that NetworkX lacks built-in data persistence and is therefore not typically recommended for production builds.
For production builds, [Neo4j](https://neo4j.com/) emerges as a more optimal choice due to a wider set of production-centric features, including:
* **Native Graph Storage and Processing**: Optimized for graph data with high-performance and efficient handling
* **Optimized Query Engine**: Leverages the Cypher query language, explicitly designed for efficient graph traversal
* **Scalability and Persistence**: Effectively manages extensive graph datasets, ensuring data persistence, reliability, and durability
* **Production Tooling**: Offers integrated tooling such as Neo4j Bloom for vislualization and Neo4j Browser for exploration, enhancing user interaction and analysis
* **Advanced Access Control**: Provides granular security options to control data access
## 3.4. Evaluation and Suggested Feature Additions
The approach presented above offers a foundational implementation of a Temporal Agent for knowledge graph construction. However, it does not fully address complexities or all possible edge cases encountered in real-world applications. Below, we outline several possible enhancements that could be used to further improve the robustness and applicability of this implementation. In the later “Prototype to Production” section, we expand on these enhancements by suggesting additional considerations essential for deploying such agents effectively in production environments. Further details on scaling to production are included in the [Appendix](./Appendix.ipynb).
### 3.4.1. Temporal Agent
#### Statement Extraction and Temporal Events
##### Duplicate Temporal Events
In this cookbook, the Temporal Agent does not identify or merge duplicate Temporal Events arising from statements referring to the same event, especially when originating from different sources. These events are saved separately rather than unified into a single, consolidated event.
##### Static and Dynamic Representation
There’s an opportunity to enrich the dataset by consistently capturing both Static and Dynamic representations of events, even when explicit statements aren’t available.
For Dynamic events without corresponding Static statements, creating explicit Static entries marking the start (`valid\_at`) and end (`invalid\_at`) can enhance temporal clarity, particularly for the purposes of retrieval tasks.
Conversely, Static events lacking Dynamic counterparts can have Dynamic relationships inferred, though this would require careful checks for potential invalidation within statement cohorts.
#### Date Extraction
The implementation in this cookbook does not explictly record assumptions made during date disambiguation.
In the absence of an explicit publication date, the present date is used implicitly as a reference. For some workflows, this assumption may have to be changed to meet the needs of the end users.
Abstract dates (e.g., “until next year”) are resolved into explicit dates, however the vagueness is not represented in the stored data structure. The inclusion of more granular metadata can capture more abstract date ranges:
```
`temporal\_event = {
"summary": "The event ran from April to September",
"label": "dynamic",
"valid\_at": {
"date": "2025-04-01",
"literal": False,
"abstract\_date": "2025-04"
},
"invalid\_at": {
"date": "2025-09-30",
"literal": False,
"abstract\_date": "2025-09"
}
}`
```
This structure permits the explicit representation of both literal and abstract date interpretations.
#### Triplet Extraction
There are several possible avenues for improving the Triplet Extraction presented in this cookbook. These include:
* Utilising a larger model and optimizing the extraction prompts further
* Running the extraction process multiple times and consolidating results via e.g., a modal pooling mechanism to improve the accuracy and confidence in a prediction
* Incorporating entity extraction tools (e.g., [Spacy](https://spacy.io/) and leveraging predefined ontologies tailored to specific use cases for improved consistency and reliability
### 3.4.2. Invalidation Agent
The presented Invalidation Agent does not refine temporal validity ranges, but one could extend its functionality to perform said refinement as well as intra-cohort invalidation checks to identify temporal conflicts among incoming statements.
There are also several opportunities for efficiency enhancements.
* Transitioning from individual (1:1) comparisons to omni-directional (1:many) invalidation checks would reduce the number of LLM calls required
* Applying network analysis techniques to cluster related statements could enable batching of invalidation checks. Clusters can be derived from several properties including semantic similarity, temporal proximity, or more advanced techniques. This would significantly reduce bottlenecks arising from sequential processing, which is particularly important when ingesting large volumes of data
# 4. Multi-Step Retrieval Over a Knowledge Graph
Simple retrieval systems can often handle straightforward “look-up” queries with a single search against a vector store or document index. In practice, though, agents deployed in real-world settings frequently need more. User questions often require LLMs to synthesise information from multiple parts of a knowledge base or across several endpoints.
The temporal knowledge graphs introduced earlier provide a natural foundation for this, explicitly encoding entities (nodes), relationships (edges), and their evolution over time.
Multi-step retrieval allows us to fully harness the capabilities of these graphs. It involves iteratively traversing the graph through a series of targeted queries, enabling the agent to gather all necessary context before forming a response.
We can see the power of multi-step retrieval below:
In this case, the initial query to the knowledge graph returned no information on some competitors’ R&D activities. Rather than failing silently, the system pivoted to an alternative source—the strategy content—and successfully located the missing information. This multi-step approach allowed it to navigate sparse data and deliver a complete response to the user.
## 4.1. Building our Retrieval Agent
At a high level, we will build out the following structure:
1. **User question → Planner → Orchestrator**
A planner utilising GPT 4.1 will decompose the user's question into a small sequence of proposed graph operations. This is then passed to the orchestrator to execute
2. **Tool calls to retrieve information from the Temporal Knowledge Graph**
Considering the user query and the plan, the Orchestrator (o4-mini) makes a series of initial tool calls to retrieve information from the knowledge graph
3. **Loop until done → Generate answer**
The responses to the tool calls are fed back to the Orchestrator which can then decide to either make more queries to the graph or answer the user's question
### 4.1.1. Imports
```
`%pip install --upgrade openai`
```
### 4.1.2. (Re-)Initialise OpenAI Client
```
`from openai import AsyncOpenAI
client = AsyncOpenAI()`
```
### 4.1.3. (Re-)Load our Temporal Knowledge Graph
```
`from cb\_functions import build\_graph, load\_db\_from\_hf
conn = load\_db\_from\_hf()
G = build\_graph(conn)
print(G.number\_of\_nodes(), "nodes,", G.number\_of\_edges(), "edges")`
```
### 4.1.4. Planner
Planning steps are incorporated in many modern LLM applications.
The explicit inclusion of a planning step improves overall performance by having the system consider the full scope of the problem before acting.
In this implementation, the plan remains static. In longer-horizon agentic pipelines, however, it’s common to include mechanisms for replanning or updating the plan as the system progresses.
Broadly, planners take two forms:
1. **Task-orientated (used in this cookbook)**
The planner outlines the concrete subtasks the downstream agentic blocks should execute. The tasks are phrased in an action-orientated sense such as "1. Extract information on R&D activities of Company IJK between 2018–2020." These planners are typically preferred when the goal is mostly deterministic and the primary risk is skipping or duplicating work.
Example tasks where this approach is useful:
* **Law**: *"Extract and tabulate termination-notice periods from every master service agreement executed in FY24"*
* **Finance**: *"Fetch every 10-K filed by S&P 500 banks for FY24, extract tier-1 capital and liquidity coverage ratios, and output a ranked table of institutions by capital adequacy"*
* **Automotive**: *"Compile warranty-claim counts by component for Model XYZ vehicles sold in Europe since the new emissions regulation came into force"*
* **Manufacturing**: *"Analyse downtime logs from each CNC machine for Q1 2025, classify the root-cause codes, and generate a Pareto chart of the top five failure drivers"*
* **Hypothesis-orientated**
The plan is framed as a set of hypotheses the system can confirm, reject, or refine in response to the user's question. Each step represents a testable claim, optionally paired with suggested actions. This approach excels in open-ended research tasks where new information can significantly reshape the solution space.
Example tasks where this approach is useful:
* **Law**: *"Does the supplied evidence satisfy all four prongs of the fair-use doctrine? Evaluate each prong against relevant case law"*
* **Pharmaceuticals**: *"What emerging mRNA delivery methods could be used to target the IRS1 gene to treat obesity?"*
* **Finance**: *"Is Bank Alpha facing a liquidity risk? Compare its LCR trend, interbank borrowing costs, and deposit-outflow and anything else you find that is interesting"*
#### Prompting our planner
We will define two prompts (one `system` and one `user`) for the initial planner.
The most notable characteristic of our system prompt below is the use of ‘persona-based’ prompting. We prompt the LLM giving it a persona of an internal company expert. This helps to frame the tone of the model’s response to the behaviour that we want - a direct, action-orientated task list that is fit for the financial industry.
This is then extended in the user prompt, where we prepend the `user\_question` with information on this specific situation and how the planner should handle it.
In production settings you can super-charge this template by dynamically enriching the prompt before each call. You can inject information on the user’s profile —sector, role, preferred writing style, prior conversation context—so the planner tailors its actions to their environment. You can also perform a quick “question-building” loop: have the assistant propose clarifying questions, gather the answers, and merge them back into the prompt so the planner starts with a well-scoped, information-rich request rather than a vague one.
Another flow that can work well is to allow users to view the plan and optionally edit it before it is executed. This is particularly effective when your AI system is acting in more of an assistant role. Giving domain experts such as lawyers or pharmaceutical researchers the flexibility to steer and incorporate their ideas and research directions deeper into the system often has the dual benefit of improving both system performance and end user satisfaction.
```
`async def initial\_planner(user\_question: str) -\> str:
"""Return an initial plan for answering the user's question."""
initial\_planner\_system\_prompt = (
"You work for the leading financial firm, ABC Incorporated, one of the largest financial firms in the world. "
"Due to your long and esteemed tenure at the firm, various equity research teams will often come to you "
"for guidance on research tasks they are performing. Your expertise is particularly strong in the area of "
"ABC Incorporated's proprietary knowledge base of earnings call transcripts. This contains details that have been "
"extracted from the earnings call transcripts of various companies with labelling for when these statements are, or "
"were, valid. You are an expert at providing instructions to teams on how to use this knowledge graph to answer "
"their research queries. \\n"
"The teams will have access to the following tools to help them retrieve information from the knowledge graph: \\n"
"1. `factual\_qa`: Queries the knowledge graph for time-bounded factual relationships involving a given entity and predicate. \\n"
"2. `trend\_analysis`: Wraps the factual\_qa tool with a specialised agent to perform in-depth trend analysis \\n"
"It shoudld also be noted that the trend\_analysis tool can accept multiple predicate arguments as a list. \\n "
"You may recommend that multiple calls are made to the tools with different e.g., predicates if this is useful. \\n "
"Your recommendation should explain to the team how to retrieve the information from the database through these "
"tools only. "
)
initial\_planner\_user\_prompt = (
"Your top equity research team has came to you with a research question they are trying to find the answer to. "
"You should use your deep financial expertise to succinctly detail a step-by-step plan for retrieving "
"this information from the the company's knowledge base of earnings call transcripts extracts. "
"You should produce a concise set of individual research tasks required to thoroughly address the team's query. "
"These tasks should cover all of the key points of the team's research task without overcomplicating it. \\n\\n"
"The question the team has is: \\n\\n"
f"{user\_question} \\n\\n"
"Return your answer under a heading 'Research tasks' with no filler language, only the plan."
)
input\_messages = [
{"role":"system", "content": initial\_planner\_system\_prompt},
{"role":"user", "content": initial\_planner\_user\_prompt}
]
initial\_plan = await client.responses.create(
model="gpt-4.1",
input=input\_messages
)
return initial\_plan.output\_text`
```
```
`plan = await initial\_planner("How can we find out how AMD's research priorties have changed in the last 4 years?")`
```
```
`print(plan)`
```
### 4.1.5. Function calling
[OpenAI function calling](https://platform.openai.com/docs/guides/function-calling?api-mode=responses) (otherwise known as tools) enable models to perform specific external actions by calling predefined functions. Some of the tools provided on the OpenAI platform include:
* **Code interpreter**: Executes code for data analysis, math, plotting, and file manipulation
* **Web search**: Include data from the internet in model response generation
* **File search**: Search the contents of uploaded files for context
* **Image generation**: Generate or edit images using GPT image
* **Remote MCP servers**: Give the model access to new capabilities via Model Context Protocol (MCP) servers
Other cookbooks cover how to build tools for use with LLMs. In this example, we’ll develop several tools designed to efficiently explore the temporal knowledge graph and help answer the user’s question.
There are several schools of thought on tool design, and the best choice depends on the application at hand.
#### Fixed Tools
In this context, ‘fixed’ tools refer to those with a rigid, well-defined functionality. Typically, these tools accept a limited number of specific arguments and perform clearly outlined tasks. For instance, a fixed tool might execute a simple query such as “Get today’s weather for the user’s location.” Due to their structured nature, these tools excel at performing consistent lookups or monitoring values within structured environments like ERP systems, regulatory frameworks, or dashboards. However, their rigidity limits flexibility, prompting users to often replace them with more dynamic, traditional data pipelines, particularly for continuous data streaming.
Examples of fixed tools in various industries include:
* **Finance**: *“What’s the current exchange rate from USD to EUR?”*
* **Pharmaceuticals**: *“Retrieve the known adverse effects for Drug ABC.”*
* **Manufacturing**: *“What was the defect rate for batch #42?”*
#### Free-form
Free-form tools represent the most flexible end of the tool spectrum. These tools are capable of executing complex, open-ended tasks with minimal constraints on input structure. A common example is a code interpreter, capable of handling diverse analytical tasks. Although their flexibility offers substantial advantages, they can also introduce unpredictability and can be more challenging to optimize for consistent reliability.
In industry applications, free-form tools can look like:
* **Finance**: *“Backtest this momentum trading strategy using ETF price data over the past 10 years, and plot the Sharpe ratio distribution.”*
* **Automotive**: *“Given this raw telemetry log, identify patterns that indicate early brake failure and simulate outcomes under various terrain conditions.”*
* **Pharmaceuticals**: *“Create a pipeline that filters for statistically significant gene upregulation from this dataset, then run gene set enrichment analysis and generate a publication-ready figure.”*
#### Semi-structured Tools (used in this cookbook)
Modern agentic workflows frequently require tools that effectively balance structure and flexibility. Semi-structured tools are designed specifically to manage this middle ground. They accept inputs in moderately complex formats—such as text fragments, JSON-like arguments, or small code snippets—and often embed basic reasoning, retrieval, or decision-making capabilities. These tools are ideal when tasks are well-defined but not entirely uniform, such as when the required dataset or service is known, but the query or expected output varies.
Two common paradigms of semi-structured tools are:
* **Extended Capabilities**: Tools that function as specialized agents themselves, incorporating internal logic and analysis routines
* **Flexible Argument Interfaces**: Tools permitting the LLM to pass expressive yet structured arguments, such as detailed queries, filters, or embedded functions
Semi-structured tools are particularly valuable when:
* Delegating specific yet non-trivial tasks (like searches, transformations, or summarizations) to specialized tools
* The source data or APIs are known, but the results returned can be unpredictable
In production environments, these tools are often preferable to free-form tools, like code interpreters, due to their enhanced reliability and performance. For instance, executing complex, multi-step queries against large Neo4j knowledge graphs is more reliable and efficient using optimized Cypher queries templated within semi-structured tools rather than generating each query from scratch.
Industry applications of semi-structured tools include:
* **Finance**: *“Extract all forward-looking risk factors from company filings for Q2 2023.”*
* **Automotive**: *“Identify recurring electrical faults from maintenance logs across EV models launched after 2020.”*
* **Pharmaceuticals**: *“Locate omics data supporting the hypothesis that a specific mRNA treatment effectively upregulates the IRS1 gene.”*
#### Creating tools for our retriever to use
##### Factual Q&A
The `factual\_qa` tool provides an efficient way for our agent to retrieve information from our temporal knowledge graph pertaining to a particular company, topic, and date range. This will help the agent answer questions about the data such as “What were AMD’s earnings in Q3 2017?”
This tool sits somewhere in the middle of the fixed and semi-structured tools we introduced earlier. This is generally quite a rigid tool in that it restricts the agent to a small number of parameters. However, the degrees of freedom in the input are large and the tool is still flexible in what information it can retrieve from the knowledge graph. This helps avoid the need for the core agent to write new queries for networkx from scratch on each query, improving accuracy and latency.
The tool has the following arguments:
* `entity`: This is the entity (or object with respect to triplet ontology) that the tool should retrieve information for
* `start\_date\_range`: This is the lower bound of the date range that the tool should retrieve over
* `end\_date\_range`: This is the upper bound of the date range that the tool should retrieve over
* `predicate`: This is the name of the predicate that the tool will connect the `entity` to perform a retrieval
We begin by loading the predicate definitions. We will use these to improve error tolerance in the tool, using a GPT-4.1-nano to normalize the predicate passed in the argument to a valid predicate name.
```
`# Redefine the predicate definitions as we will need them here
PREDICATE\_DEFINITIONS = {
"IS\_A": "Denotes a class-or-type relationship between two entities (e.g., 'Model Y IS\_A electric-SUV'). Includes 'is' and 'was'.",
"HAS\_A": "Denotes a part-whole relationship between two entities (e.g., 'Model Y HAS\_A electric-engine'). Includes 'has' and 'had'.",
"LOCATED\_IN": "Specifies geographic or organisational containment or proximity (e.g., headquarters LOCATED\_IN Berlin).",
"HOLDS\_ROLE": "Connects a person to a formal office or title within an organisation (CEO, Chair, Director, etc.).",
"PRODUCES": "Indicates that an entity manufactures, builds, or creates a product, service, or infrastructure (includes scale-ups and component inclusion).",
"SELLS": "Marks a commercial seller-to-customer relationship for a product or service (markets, distributes, sells).",
"LAUNCHED": "Captures the official first release, shipment, or public start of a product, service, or initiative.",
"DEVELOPED": "Shows design, R&D, or innovation origin of a technology, product, or capability. Includes 'researched' or 'created'.",
"ADOPTED\_BY": "Indicates that a technology or product has been taken up, deployed, or implemented by another entity.",
"INVESTS\_IN": "Represents the flow of capital or resources from one entity into another (equity, funding rounds, strategic investment).",
"COLLABORATES\_WITH": "Generic partnership, alliance, joint venture, or licensing relationship between entities.",
"SUPPLIES": "Captures vendor–client supply-chain links or dependencies (provides to, sources from).",
"HAS\_REVENUE": "Associates an entity with a revenue amount or metric—actual, reported, or projected.",
"INCREASED": "Expresses an upward change in a metric (revenue, market share, output) relative to a prior period or baseline.",
"DECREASED": "Expresses a downward change in a metric relative to a prior period or baseline.",
"RESULTED\_IN": "Captures a causal relationship where one event or factor leads to a specific outcome (positive or negative).",
"TARGETS": "Denotes a strategic objective, market segment, or customer group that an entity seeks to reach.",
"PART\_OF": "Expresses hierarchical membership or subset relationships (division, subsidiary, managed by, belongs to).",
"DISCONTINUED": "Indicates official end-of-life, shutdown, or termination of a product, service, or relationship.",
"SECURED": "Marks the successful acquisition of funding, contracts, assets, or rights by an entity.",
}`
```
We define several helper functions for the factual QA tool.
First is `\_as\_datetime`. This tool is used to coerce the arguments that define the date range to the correct datetime format.
Next, we introduce two new data models: `PredicateMatching` and `PredicateMatchValidation`. `PredicateMatching` defines the output format for the GPT-4.1-nano call that matches the predicate in the function arguments to valid predicate names. `PredicateMatchValidation` then performs a secondary validation step to assert that this output from GPT-4.1-nano is a valid predicate name, leveraging a Pydantic field validator. This process helps to ensure that the tool runs smoothly and helps to eliminate some of the rare edge cases which would lead to an unsuccessful graph query.
```
`# Helper functions and models
from datetime import datetime
from pydantic import BaseModel, Field, ValidationError, field\_validator
def \_as\_datetime(ts) -\> datetime | None:
"""Helper function to coerce possible timestamp formats to `datetime`.""" # noqa: D401
if ts is None:
return None
if isinstance(ts, datetime):
return ts
for fmt in ("%Y-%m-%d", "%Y/%m/%d", "%Y-%m-%dT%H:%M:%S"):
try:
return datetime.strptime(ts, fmt)
except ValueError:
continue
return None
class PredicateMatching(BaseModel):
"""Class for structured outputs from model to coerce input to correct predicate format."""
reasoning: str = Field(description="Use this space to reason about the correct predicate to match.")
predicate\_match: str = Field(description="The predicate that aligns with the dictionary.")
class PredicateMatchValidation(BaseModel):
"""Class for validating the outputs from the model that tries to coerce predicate argument to a real predicate."""
predicate: str
@field\_validator("predicate")
@classmethod
def predicate\_in\_definitions(cls, v):
"""Return an error string if the predicate is not in PREDICATE\_DEFINITIONS."""
if v not in PREDICATE\_DEFINITIONS:
return f"Error: '{v}' is not a valid predicate. Must be one of: {list(PREDICATE\_DEFINITIONS.keys())}"
return v`
```
Our factual QA tool can be decomposed into four steps.
1. **Predicate coercion**
If the provided predicate is not found in the `PREDICATE\_DEFINITIONS` dictionary, this step uses GPT-4.1-nano to coerce it into a valid predicate
2. **Entity location**
Performs fuzzy matching to identify the corresponding entity nodes within the networkx graph
3. **Edge collection**
Retrieves both inbound and outbound edges associated with the identified entity nodes
4. **Response formatting**
Structures the collected information into a well-formatted response that is easy for the orchestrator to consume
```
`async def factual\_qa(
entity: str,
start\_date\_range: datetime,
end\_date\_range: datetime,
predicate: str
) -\> str:
"""
Query the knowledge-graph for relationships attached to \*entity\* that match
\*predicate\* and fall within the requested time-window.
The response is rendered as:
Subject – PREDICATE – Object [Valid-From]
Statement: "..."
Type: FACT • Value: 42
If no matches are found (or on error) a human-readable explanation is returned.
"""
# Checks that the date range passed is logical
if start\_date\_range \> end\_date\_range:
return (
"You used the `factual\_qa` tool incorrectly last time. You provided a "
"`start\_date\_range` that was more recent than the `end\_date\_range`. "
"`end\_date\_range` must be ≥ `start\_date\_range`."
)
# ---- (1) predicate coercion / validation -----------------------
if predicate not in PREDICATE\_DEFINITIONS:
try:
predicate\_definitions\_str = "\\n".join(
f"- {k}: {v}" for k, v in PREDICATE\_DEFINITIONS.items()
)
coercion\_prompt = (
"You are a helpful assistant that matches predicates to a dictionary of "
"predicate definitions. Return the best-matching predicate \*\*and\*\* your reasoning.\\n\\n"
f"Dictionary:\\n{predicate\_definitions\_str}\\n\\n"
f"Predicate to match: {predicate}"
)
completion = await client.beta.chat.completions.parse(
model="gpt-4.1-nano",
messages=[{"role": "user", "content": coercion\_prompt}],
response\_format=PredicateMatching,
)
coerced\_predicate = completion.choices[0].message.parsed.predicate\_match
# Validate against the enum / model we expect
\_ = PredicateMatchValidation(predicate=coerced\_predicate)
predicate = coerced\_predicate
except ValidationError:
return (
"You provided an invalid predicate. "
f"Valid predicates are: {list(PREDICATE\_DEFINITIONS.keys())}"
)
except Exception:
# Coercion failed – fall back to original predicate
pass
predicate\_upper = predicate.upper()
entity\_lower = entity.lower()
# ---- (2) locate the entity node by fuzzy match -----------------
try:
target\_node = None
for node, data in G.nodes(data=True):
node\_name = data.get("name", str(node))
if entity\_lower in node\_name.lower() or node\_name.lower() in entity\_lower:
target\_node = node
break
if target\_node is None:
return f"Entity '{entity}' not found in the knowledge graph."
except Exception as e:
return f"Error locating entity '{entity}': {str(e)}"
# ---- (3) collect matching edges (outgoing + incoming) ----------
matching\_edges = []
def \_edge\_ok(edge\_data):
"""Return True if edge is temporally valid in the requested window."""
valid\_at = \_as\_datetime(edge\_data.get("valid\_at"))
invalid\_at = \_as\_datetime(edge\_data.get("invalid\_at"))
if valid\_at and end\_date\_range \< valid\_at:
return False
if invalid\_at and start\_date\_range \>= invalid\_at:
return False
return True
# Outgoing
try:
for \_, tgt, \_, ed in G.out\_edges(target\_node, data=True, keys=True):
pred = ed.get("predicate", "").upper()
if predicate\_upper in pred and \_edge\_ok(ed):
matching\_edges.append(
{
"subject": G.nodes[target\_node].get("name", str(target\_node)),
"predicate": pred,
"object": G.nodes[tgt].get("name", str(tgt)),
\*\*ed,
}
)
except Exception:
pass
# Incoming
try:
for src, \_, \_, ed in G.in\_edges(target\_node, data=True, keys=True):
pred = ed.get("predicate", "").upper()
if predicate\_upper in pred and \_edge\_ok(ed):
matching\_edges.append(
{
"subject": G.nodes[src].get("name", str(src)),
"predicate": pred,
"object": G.nodes[target\_node].get("name", str(target\_node)),
\*\*ed,
}
)
except Exception:
pass
# ---- (4) format the response -----------------------------------
if not matching\_edges:
s = start\_date\_range.strftime("%Y-%m-%d")
e = end\_date\_range.strftime("%Y-%m-%d")
return (
f"No data found for '{entity}' with predicate '{predicate}' "
f"in the specified date range ({s} to {e})."
)
lines = [
f"Found {len(matching\_edges)} relationship"
f"{'s' if len(matching\_edges) != 1 else ''} for "
f"'{entity}' with predicate '{predicate}':",
""
]
for idx, edge in enumerate(matching\_edges, 1):
value = edge.get("value")
statement = edge.get("statement")
statement\_tp = edge.get("statement\_type")
valid\_from = edge.get("valid\_at")
# First line: Subject – PREDICATE – Object
triplet = f"{edge['subject']} – {edge['predicate']} – {edge['object']}"
if valid\_from:
triplet += f" [Valid-from: {valid\_from}]"
if value is not None:
triplet += f" (Value: {value})"
lines.append(f"{idx}. {triplet}")
# Second line: Statement (truncated to 200 chars) + Type
if statement:
snippet = statement if len(statement) \<= 200 else statement[:197] + "…"
lines.append(f' Statement: "{snippet}"')
if statement\_tp:
lines.append(f" Type: {statement\_tp}")
lines.append("") # spacer
return "\\n".join(lines)`
```
```
`result = await factual\_qa(
entity="Amd",
start\_date\_range=datetime(2016, 1, 1),
end\_date\_range=datetime(2020, 1, 1),
predicate="launched"
)
print(result)`
```
```
`factual\_qa\_schema = {
"type": "function",
"name": "factual\_qa",
"description": "Queries the knowledge graph for time-bounded factual relationships involving a given entity and predicate.",
"parameters": {
"type": "object",
"properties": {
"entity": {
"type": "string",
"description": "The name of the entity (e.g., company or organization) whose relationships should be retrieved."
},
"start\_date\_range": {
"type": "string",
"format": "date",
"description": "The start (inclusive) of the date range to filter factual relationships."
},
"end\_date\_range": {
"type": "string",
"format": "date",
"description": "The end (inclusive) of the date range to filter factual relationships."
},
"predicate": {
"type": "string",
"description": "The type of relationship or topic to match against the knowledge graph (e.g., 'invested\_in', 'founded')."
}
},
"required": [
"entity",
"start\_date\_range",
"end\_date\_range",
"predicate"
],
"additionalProperties": False
}
}`
```
##### Trend analysis
The `trend\_analysis` tool is designed to compare how specific metrics or signals evolve over time—often across multiple companies and/or topics. It exposes a structured interface that lets the agent specify the time window, subject set, and target metric, then delegates the comparison logic to a specialised agent for handling this analysis. In this case we utilised o4-mini with high reasoning effort as this is a ‘harder’ anaysis task.
This allows us to build a highly focused and optimised pipeline for dealing with comparison-style tasks. Whilst this could be built into the core orchestrator itself, it’s often more manageable to split this into specialised tools so they can be more easily swapped out or updated later without much concern for impact on the wider system.
```
`import asyncio
from datetime import datetime
async def trend\_analysis(
question: str,
companies: list[str],
start\_date\_range: datetime,
end\_date\_range: datetime,
topic\_filter: list[str],
) -\> str:
"""
Aggregate knowledge-graph facts for multiple companies and topics.
For every (company, topic) pair, this calls `factual\_qa` with the same
date window and returns one concatenated, human-readable string.
Sections are separated by blank lines and prefixed with:
=== \<Company\> · \<Topic\> ===
If `factual\_qa` raises an exception, an ⚠️ line with the error message
is included in place of that section.
"""
# -------- helper ------------------------------------------------------
async def \_fetch(company: str, predicate: str) -\> str:
return await factual\_qa(
entity=company,
start\_date\_range=start\_date\_range,
end\_date\_range=end\_date\_range,
predicate=predicate,
)
# -------- schedule every call (concurrently) --------------------------
pairs = [(c, p) for c in companies for p in topic\_filter]
tasks = [asyncio.create\_task(\_fetch(c, p)) for c, p in pairs]
# -------- gather results ---------------------------------------------
results = await asyncio.gather(\*tasks, return\_exceptions=True)
# -------- assemble final string --------------------------------------
sections: list[str] = []
for (company, predicate), res in zip(pairs, results, strict=True):
header = f"=== {company} · {predicate} ==="
if isinstance(res, Exception):
sections.append(f"{header}\\n⚠️ {type(res).\_\_name\_\_}: {res}")
else:
sections.append(f"{header}\\n{res}")
joined = "\\n\\n".join(sections)
analysis\_user\_prompt = (
"You are a helpful assistant"
"You specialise in providing in-depth analyses of financial data. "
"You are provided with a detailed dump of data from a knowledge graph that contains data that has been "
"extracted from companies' earnings call transcripts. \\n"
"Please summarise the trends from this, comparing how data has evolved over time in as much detail as possible. "
"Your answer should only contain information that is derived from the data provided, do not lean on your internal "
"knowledge. The knowledge graph contains data in the range 2016-2020. "
"The data provided is: \\n"
f"{joined}\\n\\n"
f"The user question you are summarizing for is: {question}"
)
analysis = await client.responses.create(
model="o4-mini",
input=analysis\_user\_prompt,
reasoning={
"effort": "high",
"summary": "auto"
}
)
return analysis.output\_text`
```
```
`result = await trend\_analysis(
question="How have AMD's research priorties changed over time?",
companies=["AMD"],
start\_date\_range=datetime(2016, 1, 1),
end\_date\_range=datetime(2020, 1, 1),
topic\_filter=["launched", "researched", "developed"]
)
print(result)`
```
```
`trend\_analysis\_schema = {
"type": "function",
"name": "trend\_analysis",
"description": "Aggregates and compares knowledge-graph facts for multiple companies and topics over a time range, returning a trend summary.",
"parameters": {
"type": "object",
"properties": {
"question": {
"type": "string",
"description": "A free-text question that guides the trend analysis (e.g., 'How did hiring trends differ between companies?')."
},
"companies": {
"type": "array",
"items": {
"type": "string"
},
"description": "List of companies to compare (e.g., ['Apple', 'Microsoft'])."
},
"start\_date\_range": {
"type": "string",
"format": "date",
"description": "The start (inclusive) of the date range to filter knowledge-graph facts."
},
"end\_date\_range": {
"type": "string",
"format": "date",
"description": "The end (inclusive) of the date range to filter knowledge-graph facts."
},
"topic\_filter": {
"type": "array",
"items": {
"type": "string"
},
"description": "List of predicates (topics) to query for each company (e.g., ['hired\_executive', 'launched\_product'])."
}
},
"required": [
"question",
"companies",
"start\_date\_range",
"end\_date\_range",
"topic\_filter"
],
"additionalProperties": False
}
}`
```
```
`tools = [
factual\_qa\_schema,
trend\_analysis\_schema
]`
```
### 4.1.6. Retriever
We design a simple retriever containing only a run method which encompasses the planning step and a while loop to execute each tool call that the orchestrator makes before returning a final answer.
```
`import json
class MultiStepRetriever:
"""Retrieve information in multiple steps using an OpenAI client."""
def \_\_init\_\_(self, client: AsyncOpenAI):
self.client = client
# This helps us simplify our tool calling functionality in run()
self.function\_map = {
"factual\_qa": factual\_qa,
"trend\_analysis": trend\_analysis
}
async def run(self, user\_question: str) -\> tuple[str, dict]:
"""Run the multi-step retrieval process for a user question."""
# -------------------------------------------------------
# Step 1: Generate initial plan
# -------------------------------------------------------
initial\_plan = await initial\_planner(user\_question=user\_question)
# -------------------------------------------------------
# Step 2: Make initial model call
# -------------------------------------------------------
retriever\_user\_prompt = (
"You are a helpful assistant. "
"You are provided with a user question: \\n\\n"
f"{user\_question} \\n\\n"
"You have access to a set of tools. You may choose to use these tools to retrieve information to "
"help you answer the user's question. These tools allow you to query a knowledge graph that contains "
"information that has been extracted from companies' earnings call transcripts. "
"You should not use your own memory of these companies to answer questions. "
"When returning an answer to the user, all of your content must be derived from the content "
"you have retrieved from the tools used. This is to ensure that is is accurate, as the data in "
"this knowledge graph has been carefully check to ensure its accuracy. The knowledge graph contains "
"data spanning from 2016-2020. \\n\\n"
"You are provided with a plan of action as follows: \\n"
f"{initial\_plan} \\n\\n"
"You should generally stick to this plan to help you answer the question, though you may deviate "
"from it should you deem it suitable. You may make more than one tool call."
)
input\_messages = [
{"role":"user", "content":retriever\_user\_prompt}
]
response = await self.client.responses.create(
model="gpt-4.1",
input=input\_messages,
tools=tools,
parallel\_tool\_calls=False,
)
# -------------------------------------------------------
# Step 3: While loop until no more tool calls are made
# -------------------------------------------------------
tools\_used = {}
while response.output[0].type == "function\_call":
tool\_call = response.output[0]
args = json.loads(tool\_call.arguments)
name = tool\_call.name
if name in self.function\_map:
tool\_func = self.function\_map[name]
tool\_response\_text = await tool\_func(\*\*args)
input\_messages.append(tool\_call)
input\_messages.append({
"type": "function\_call\_output",
"call\_id": tool\_call.call\_id,
"output": tool\_response\_text
})
tools\_used[name] = [args, tool\_response\_text]
response = await self.client.responses.create(
model="gpt-4.1",
input=input\_messages,
tools=tools,
parallel\_tool\_calls=False
)
return response.output\_text, tools\_used`
```
We can now run our MultiStepRetriever.
We observe that the answer returned is detailed, and includes a detailed walkthrough of how AMD’s research priorities evolved from 2016 to 2020, with references to the underlying quotes that were used to derive these answers.
```
`retriever = MultiStepRetriever(client=client)
answer, tools\_used = await retriever.run(user\_question="How have AMD's research & development priorities changed over time?")
print(answer)`
```
We can also inspect the tools used by our MultiStepRetriever to answer this query.
```
`for key, value in tools\_used.items():
if value:
print(f"{key}: {value[0]}")
else:
print(f"{key}: [empty list]")`
```
[Appendix section A.5. “Scaling and Productionizing our Retrieval Agent”](./Appendix.ipynb) outlines some guidelines for how one could take the Retrieval Agent we’ve built up to production.
### 4.1.7. Selecting the right model for Multi-Step Knowledge-Graph Retrieval
Multi-step retrieval agents need strong reasoning to hop through entities and relations, verify answers, and decide what to do next. Latency still matters to users, but usually *less* than raw accuracy. Hence, this is one of the domains where OpenAI’s o3 and o4-mini reasoning models shine.
Once again, for development we recommend a “start big, then specialise” ladder:
1. **Start with o3** – ensure your retrieval logic (chaining, re-ranking, fallback prompts) is sound. o3 may also be the best choice for production if your retrieval system is working with particularly complex data such as pharmaceutical or legal data. You can test this by looking at the severity of performance degradation with smaller models. If the drop off in performance is large, consider sticking with o3
2. **Move to o4-mini**
* **Prompt enhancement** - optimise your prompts to push the performance of the o4-mini system as close to that of the full o3 model
* **Reinforcement fine-tuning (RFT)** - [OpenAI’s Reinforcement Fine-Tuning](https://platform.openai.com/docs/guides/reinforcement-fine-tuning) offering enables you to fine-tune OpenAI’s o-series models to improve their performance on hard reasoning tasks. With as little as \~50 golden answers you can leverage the power of reinforcement learning to fine-tune o4-mini which can help it come close or even exceed the base o3’s performance on the same task
* **Fallback to GPT 4.1 when latency dominates** – for cases when latency is particularly important or you’ve tuned your prompts well enough that performance drop-off is minimal, consider moving to the GPT 4.1 series
|Model|Relative cost|Relative latency|Intelligence|Ideal role in workflow|
|*o3*|★★★|★★|★★★ *(highest)*|Initial prototyping, working with complex data, golden dataset generation|
|*o4-mini*|★★|★|★★|Main production engine, can push performance with RFT|
|*GPT 4.1 series*|★ *(lowest)*|★ *(fastest)*|★|Latency-critical or large-scale background scoring|
#### Why is Reinforcement Fine-Tuning powerful for long horizon, multi-step retrieval tasks?
RFT has a number of benefits over [Supervised Fine-Tuning](https://platform.openai.com/docs/guides/supervised-fine-tuning) or [Direct Preference Optimization](https://platform.openai.com/docs/guides/direct-preference-optimization) for this use case.
Firstly, reinforcement fine-tuning can be performed with a far small number of examples, sometimes requiring as little as 50 training examples.
Additionally, RFT eliminates the necessity of providing labeled step-by-step trajectories. By supplying only the final correct answer, the system learns implicitly how to navigate the knowledge graph effectively. This feature is particularly valuable in real-world contexts where end users typically face time constraints and may struggle to curate the extensive sets of labeled examples (often numbering in the hundreds or thousands) required by traditional SFT methods.
## 4.2 Evaluating your Retrieval System
1. **Human-annotated “Golden Answers”**
The traditional baseline for retrieval evaluation: a curated set of *query → gold answer* pairs,
vetted by domain experts.
Metrics such as precision@k or recall@k are computed by matching retrieved passages
against these gold spans.
**Pros: ** Highest reliability, clear pass/fail thresholds, excellent for regression testing
**Cons: ** Expensive to create, slow to update, narrow coverage (quickly becomes stale
when the knowledge base evolves)
2. **Synthetically generated answers**
Use an LLM to generate reference answers or judgments, enabling rapid, low-cost expansion
of the evaluation set. Three common pathways:
* **LLM-as-judge**: Feed the query, retrieved passages, and candidate answer to a
judge model that outputs a graded score or e.g., “yes / partial / no”
* **Tool-use pathway**: For different question types you can either manually or synthetically generate the 'correct' tool-use pathways and score responses against this
**Pros: ** Fast, infinitely scalable, easier to keep pace with a dynamic application specification
**Cons: ** Judgement quality is typically of lower quality than expert human-annotated solutions
* **Human feedback**
Collect ratings directly from end-users or domain reviewers (thumbs-up/down, five-star scores, pairwise
comparisons). Can be *in-the-loop* (model trains continuously on live feedback) or
*offline* (periodic eval rounds).
**Pros: ** Captures real-world utility, surfaces edge-cases synthetic tests miss
**Cons: ** Noisy and subjective; requires thoughtful aggregation (e.g., ELO
scoring), risk of user biases becoming incorporated in the model
### Which is the best evaluation method?
There is no single best method. However, a workflow that we have found that works well on projects is:
1. Start building and iterate synthetic evaluations
2. Test with your golden human set of evaluations before deployment
3. Make it easy for end-users to annotate good and bad answers, and use this feedback to continue to develop your application over time
# 5. Prototype to Production
Transitioning your knowledge graph system from a proof-of-concept to a robust, production-grade pipeline requires you to address several key points:
* **Storing and retrieving high-volume graph data**
* **Mananging and pruning datasets**
* **Implementing concurrency in the ingestion pipeline**
* **Minimizing token cost**
* **Scaling retrieval agents**
* **Safeguards**
This section serves as a walkthrough of key considerations and best practices to ensure your temporally-aware knowledge graph can operate reliably in a real-world environment. A more detailed [Prototype to Production Appendix section](#a-prototype-to-production) can be found towards the end of this cookbook.
1. **Storing and Retrieving High-Volume Graph Data**
[Appendix section A.1. "Storing and Retrieving High-Volume Graph Data"](#a1-storing-and-retrieving-high-volume-graph-data)
Manage scalability through thoughtful schema design, sharding, and partitioning. Clearly define entities, relationships, and ensure schema flexibility for future evolution. Use high-cardinality fields like timestamps for efficient data partitioning.
2. **Temporal Validity & Versioning**
[Appendix section A.1.2. "Temporal Validity & Versioning"](#a12-temporal-validity-versioning)
Include temporal markers (valid\_from, valid\_to) for each statement. Maintain historical records non-destructively by marking outdated facts as inactive and indexing temporal fields for efficient queries.
3. **Indexing & Semantic Search**
[Appendix section A.1.3. "Indexing & Semantic Search"](#a13-indexing-semantic-search)
Utilize B-tree indexes for efficient temporal querying. Leverage PostgreSQL’s pgvector extension for semantic search with approximate nearest-neighbor algorithms like ivfflat, ivfpq, and hnsw to optimize query speed and memory usage.
4. **Managing and Pruning Datasets**
[Appendix section A.2. "Managing and Pruning Datasets"](#a2-managing-and-pruning-datasets)
Establish TTL and archival policies for data retention based on source reliability and relevance. Implement automated archival tasks and intelligent pruning with relevance scoring to optimize graph size.
5. **Concurrent Ingestion Pipeline**
[Appendix section A.3. "Implementing Concurrency in the Ingestion Pipeline"](#a3-implementing-concurrency-in-the-ingestion-pipeline)
Implement batch processing with separate, scalable pipeline stages for chunking, extraction, invalidation, and entity resolution. Optimize throughput and parallelism to manage ingestion bottlenecks.
6. **Minimizing Token Costs**
[Appendix section A.4. "Minimizing Token Cost"](#a4-minimizing-token-cost)
Use caching strategies to avoid redundant API calls. Adopt service tiers like OpenAI's flex option to reduce costs and replace expensive model queries with efficient embedding and nearest-neighbor search.
7. **Scaling Retrieval Agents**
[Appendix section A.5. "Scaling and Productionizing our Retrieval Agent"](#a5-scaling-and-productionizing-our-retrieval-agent)
Use a controller and traversal workers architecture to handle multi-hop queries. Implement parallel subgraph extraction, dynamic traversal with chained reasoning, caching, and autoscaling for high performance.
8. **Safeguards & Verification**
[Appendix section A.6. "Safeguards"](#a6-safeguards)
Deploy multi-layered output verification, structured logging, and monitoring to ensure data integrity and operational reliability. Track critical metrics and perform regular audits.
9. **Prompt Optimization**
[Appendix section A.7. "Prompt Optimization"](#a7-prompt-optimization)
Optimize LLM interactions with personas, few-shot prompts, chain-of-thought methods, dynamic context management, and automated A/B testing of prompt variations for continuous performance improvement.
## Closing thoughts
This cookbook equips you with foundational techniques and concrete workflows to effectively build and deploy temporally-aware knowledge graphs coupled with powerful multi-hop retrieval capabilities.
Whether you’re starting from a prototype or refining a production system, leveraging structured graph data with OpenAI models can unlock richer, more nuanced interactions with your data. As these technologies evolve rapidly, look out for updates in OpenAI’s model lineup and keep experimenting with indexing methods and retrieval strategies to continuously enhance your knowledge-centric AI solutions.
You can easily adapt the frameworks presented in this cookbook to your respective domain by customizing the provided ontologies and refining the extraction prompts. Swapping in Neo4j as the graph database takes you well on the way to an MVP level application, providing data persistence out of the box. It also opens the door to levelling up your retriever’s tools with Cypher queries.
Iterively develop your solution by making use of synthetic evals, and then test your solution against “golden” expert-human annotated solutions. Once in production, you can quickly iterate from human feedback to push your application to new heights.
## Contributors
This cookbook serves as a joint collaboration between OpenAI and [Tomoro](https://tomoro.ai/).
* [Alex Heald](https://www.linkedin.com/in/alexandra-heald/)
* [Douglas Adams](https://www.linkedin.com/in/douglas-adams99/)
* [Rishabh Sagar](https://www.linkedin.com/in/rish-sagar/)
* [Danny Wigg](https://www.linkedin.com/in/dannywigg/)
* [Shikhar Kwatra](https://www.linkedin.com/in/shikharkwatra/)
# Appendix
Within this appendix, you’ll find a more in-depth *Prototype to Production* section.
## A. Prototype to Production
### A.1. Storing and Retrieving High-Volume Graph Data
#### A.1.1. Data Volume & Schema Complexity
As your dataset scales to millions or even billions of nodes and edges, managing performance and maintainability becomes critical. This requires thoughtful approaches to both schema design and data partitioning:
1. **Schema design for growth and change**
Clearly define core entity types (e.g., `Person`, `Organization`, `Event`) and relationships. Design the schema with versioning and flexibility in mind, enabling future schema evolution with minimal downtime.
2. **Sharding & partitioning**
Use high-cardinality fields (such as timestamps or unique entity IDs) for partitioning to preserve query performance as data volume grows. This is particularly important for temporally-aware data. For example:
```
`CREATE TABLE statements (
statement\_id UUID PRIMARY KEY,
entity\_id UUID NOT NULL,
text TEXT NOT NULL,
valid\_from TIMESTAMP NOT NULL,
valid\_to TIMESTAMP,
status VARCHAR(16) DEFAULT 'active',
embedding VECTOR(1536),
...
) PARTITION BY RANGE (valid\_from);`
```
#### A.1.2. Temporal Validity & Versioning
In our temporal knowledge graph, each statement includes temporal markers (e.g., `valid\_from`, `valid\_to`).
1. **Preserve history non-destructively**
Avoid deleting or overwriting records. Instead mark outdated facts as inactive by setting a `status` (e.g., `inactive`).
2. **Optimize for temporal access**
Index temporal fields (`valid\_from`, `valid\_to`) to support efficient querying of both current and historical states.
#### Example: Non-Destructive Updates
Rather than removing or overwriting a record, update its status and close its validity window:
```
`UPDATE statements
SET status = 'inactive', valid\_to = '2025-03-15T00:00:00Z'
WHERE statement\_id = '...' AND entity\_id = '...';`
```
#### A.1.3. Indexing & Semantic Search
##### Temporal Indexes
To support efficient temporal queries create B-tree indexes on `valid\_from` and `valid\_to`. A ‘B-tree’ index is a tree data structure that keeps data sorted to facilitate fast lookups, range queries, and ordered scans in logarithmic time. It’s the default index type in many relational databases.
```
`CREATE INDEX ON statements (valid\_from);
CREATE INDEX ON statements (valid\_to);`
```
##### Semantic search with pgvector
Storing vector embeddings in PostgreSQL (via the `pgvector` extension) enables similarity-based retrieval via semantic search. This follows a two-step process:
1. Store high-dimensional vectors that represent the semantic meaning of the text. These can be created with embedding models such as OpenAI’s `text-embedding-3-small` and `text-embedding-3-large`
2. Use Approximate Nearest-Neighbour (ANN) for efficient similarity matching at scale
There are several different indexing options available in pgvector, each with different purposes. These indexing options are described in more detail, along with in-depth implementation steps in the [README on the Github repository for pgvector](https://github.com/pgvector/pgvector/blob/master/README.md).
|
Index Type
|
Build Time
|
Query Speed
|
Memory Usage
|
Accuracy
|
Recommended Scale
|Notes|
|
**flat**
|
Minimal
|
Slow
(linear scan)
|
Low
|
100%
(exact)
|
Very small
(\< 100 K vectors)
|No approximate indexing—scans all vectors. Best for exact recall on small collections|
|
**ivfflat**
|
Moderate
|
Fast when tuned
|
Moderate
|
High
(tunable)
|
Small to Medium
(100 K–200 M)
|Uses inverted file indexing. Query-time parameters control trade-offs|
|
**ivfpq**
|
High
|
Very fast
|
Low
(quantized)
|
Slightly lower
than ivfflat
|
Medium to Large
(1 M–500 M)
|Combines inverted files with product quantization for lower memory use|
|
**hnsw**
|
Highest
|
Fastest
(esp. at scale)
|
High
(in-memory)
|
Very high
|
Large to Very Large
(100 M–Billions+)
|Builds a hierarchical navigable graph. Ideal for latency-sensitive, high-scale systems|
##### Tuning parameters for vector indexing
`ivfflat`
* `lists`: Number of partitions (e.g., 100)
* `probes`: Number of partitions to scan at query time (e.g., 10-20), controls recall vs. latency
`ivfpq`
* `subvectors`: Number of blocks to quantize (e.g., 16)
* `bits`: Number of bits per block (e.g., 8)
* `probes`: Same as in `ivfflat`
`hnsw`
* `M`: Max connections per node (e.g., 16)
* `ef\_construction`: Build-time dynamic candidate list size (e.g., 200)
* `ef\_search`: Queyr-time candidate pool (e.g., 64-128)
##### Best practices
* `flat` for debugging or small datasets
* `ivfflat` when you want tunable accuracy with good speed
* `ivfpq` when memory efficieny is critical
* `hnsw` when optimizing for lowest latency on massive collections
##### Other vector database options in the ecosystem
|Vector DB|Key Features|Pros|Cons|
|**Pinecone**|Fully managed, serverless; supports HNSW and SPANN|Auto-scaling, SLA-backed, easy to integrate|Vendor lock-in; cost escalates at scale|
|**Weaviate**|GraphQL API, built-in modules for encoding and vectorization|Hybrid queries (metadata + vector), modular|Production deployment requires Kubernetes|
|**Milvus**|Supports GPU indexing; IVF, HNSW, ANNOY|High performance at scale, dynamic indexing|Operational complexity; separate system|
|**Qdrant**|Lightweight, real-time updates, payload filtering|Simple setup, good hybrid query support|Lacks native relational joins; eventual consistency in clusters|
|**Vectara**|Managed with semantic ranking and re-ranking|Strong relevance features; easy integration|Proprietary; limited index control|
##### Choosing the Right Vector Store
|
Scale
|
Recommendation
|Details|
|
**Small to Medium Scale**
(less than 100M vectors)
|
PostgreSQL + pgvector
with `ivfflat` index
|Often sufficient for moderate workloads. Recommended settings: `lists = 100–200`, `probes = 10–20`.|
|
**Large Scale**
(100M – 1B+ vectors)
|
Milvus or Qdrant
|Suitable for high-throughput workloads, especially when GPU-accelerated indexing or sub-millisecond latency is needed.|
|
**Hybrid Scenarios**
|
PostgreSQL for metadata
+ dedicated vector DB
|Use PostgreSQL for entity metadata storage and a vector DB (e.g., Milvus, Qdrant) for similarity search. Synchronize embeddings using CDC pipelines (e.g., Debezium).|
For more detailed information, check out the [OpenAI cookbook on vector databases](https://cookbook.openai.com/examples/vector_databases/readme).
##### Durable disk storage and backup
For some cases, especially those requiring high availability or state recovery across restarts, it may be worth persisting state to reliable disk storage and implementing a backup strategy.
If durability is a concern, consider using persistent disks with regular backups or syncing state to external storage. While not necessary for all deployments, it can provide a valuable safeguard against data loss or operational disruption in environments where consistency and fault tolerance matter.
### A.2. Managing and Pruning Datasets
#### A.2.1. TTL (Time-to-Live) and Archival Policies
Establish clear policies to determine which facts should be retained indefinitely (e.g., legally required records for regulators) and which can be archived after a defined period (e.g., statements sourced from social media more than one year old).
Key practices to include:
1. **Automated Archival Jobs**
Set up a background task that periodically queries for records with e.g., `valid\_to \< NOW() - INTERVAL 'X days'` and moves them to an archival table for long-term storage.
2. **Source-Specific Retention Policies**
Tailor retention durations by data source or entity type. For example, high-authority sources like government publications may warrant longer retention than less reliable data such as scraped news headlines or user-generated content.
#### A.2.2. Relevance Scoring and Intelligent Pruning
As your knowledge graph grows, the utility of many facts will decline. To keep the graph focused and maximise performance:
1. **Index a Relevance Score**
Introduce a numeric `relevance\_score` column (or columns) that incorporate metrics such as recency, source trustworthiness, and production query frequency.
2. **Automated Pruning Logic**
Schedule a routine job to prune or archive facts falling below a predefined relevance threshold.
#### Advanced Relevance-Based Graph Reduction
Efficiently reducing the size of a knowledge graph is important when scaling. [A 2024 survey](https://arxiv.org/pdf/2402.03358) categorizes techniques into **sparsification**, **coarsening**, and **condensation**—all aimed at shrinking the graph while preserving task-critical semantics. These methods offer substantial runtime and memory gains on large-scale KGs.
Example implementation pattern:
1. **Score Each Triple**
Compute a composite `relevance\_score`, for example:
```
`relevance\_score = β1 \* recency\_score + β2 \* source\_trust\_score + β3 \* retrieval\_count`
```
Where:
* `recency\_score`: exponential decay from `valid\_from`
* `source\_trust\_score`: source-domain trust value
* `retrieval\_count`: production query frequency
* **Apply a Reduction Strategy**
* **Sparsify**: Select and retain only the most relevant edges or nodes based on criteria like centrality, spectral similarity, or embedding preservation
* **Coarsen**: Group low-importance or semantically similar nodes into super-nodes and aggregate their features and connections
* **Condense**: Construct a task-optimized mini-graph from scratch
* **Validate in Shadow Mode**
Log and compare outputs from the pruned vs. original graph before routing production traffic.
* **Re-Score Regularly**
Recompute relevance (e.g., nightly) to ensure new or frequently accessed facts surface back to the top.
### A.3. Implementing Concurrency in the Ingestion Pipeline
Moving from prototype to production often requires you to transform your linear processing pipeline into a concurrent, scalable pipeline. Instead of processing documents sequentially (document → chunking → statement extraction → entity extraction → statement invalidation → entity resolution), implement a staged pipeline where each phase can scale independently.
Design your pipeline with a series of specialized stages, each with its own queue and worker pool. This allows you to scale bottlenecks independently and maintain system reliability under varying loads.
1. **Batch Chunking**
Begin by collecting documents in batches of e.g., 100–500 using a job queue like Redis or Amazon SQS. Process these documents in parallel, splitting each into their respective chunks. The chunking stage should often optimize for I/O parallelization as document reading is often the bottleneck. You can then store the chunks and their respective metadata in your `chunk\_store` table, using bulk insert operations to minimize overhead.
2. **Statement and Entity Extraction**
Pull chunks in batches of e.g., 50–100 and send them to your chosen LLM (e.g., GPT-4.1-mini) using parallel API requests. Implement rate limiting with semaphores or other methods to stay safely within OpenAI's API limits whilst maximizing your throughputs. We've covered rate limiting in more detail in our cookbook on [How to handle rate limits](https://cookbook.openai.com/examples/how_to_handle_rate_limits). Once extracted, you can then write these to the relevant table in your database.
You can then similarly group the statements we've just extracted into batches, and run the entity extraction processes in a similar vein before storing them.
3. **Statement Invalidation**
Group extracted statement IDs by their associated entity clusters (e.g., all statements related to a specific entity like “Acme Corp.”). Send each cluster to your LLM (e.g., GPT-4.1-mini) in parallel to assess which statements are outdated or superseded. Use the model’s output to update the `status` field in your `statements` table—e.g., setting `status = 'inactive'`. Parallelize invalidation jobs for performance and consider scheduling periodic sweeps for consistency.
4. **Entity Resolution**
Take batches of newly extracted entity mentions and compute embeddings using your model’s embedding endpoint. Insert these into your `entity\_registry` table, assigning each a provisional or canonical `entity\_id`. Perform approximate nearest-neighbor (ANN) searches using `pgvector` to identify near-duplicates or aliases. You can then update the `entities` table with resolved canonical IDs, ensuring downstream tasks reference unified representations.
### Advantages of Batch Processing
* Throughput – Batching reduces the overhead of individual API calls and database transactions.
* Parallelism – Each stage can horizontally scale: you can run multiple worker processes for chunking, extraction, invalidation, etc., each reading from a queue.
* Backpressure & Reliability – If one stage becomes slow (e.g., statement invalidation during a sudden data surge), upstream stages can buffer more items in the queue until capacity frees up.
### A.4. Minimizing Token Cost
#### A.4.1. Prompt Caching
Avoid redundant API calls by memoizing responses to brittle sub-prompts.
Implementation Strategy:
* **Cache Frequent Queries**: For example, repeated prompts like “Extract entities from this statement” on identicial statements
* **Use Hash Keys**: Generate a unique cache key using the MD5 hash of the statement text: `md5(statement\_text)`
* **Storage Options**: Redis for scalable persistence or in-memory LRU cache for simplicity and speed
* **Bypass API Calls**: If a statement is found in cache, skip the API call
#### A.4.2. Service Tier: Flex
Utilize the `service\_tier=flex` parameter in the OpenAI Responses SDK to enable partial completions and reduce costs.
API Configuration:
```
`{
"model": "o4-mini",
"prompt": "\<your prompt\>",
"service\_tier": "flex"
}`
```
Cost Benefits:
* Charges only for generated tokens, not prompt tokens
* Can reduce costs by up to 40% for short extractions (e.g., single-sentence entity lists)
You can learn more about the power of Flex processing and how to utilise it in the [API documentation for Flex processing](https://platform.openai.com/docs/guides/flex-processing?api-mode=responses).
#### A.4.3. Minimize “Chattiness”
Replace expensive text-generation calls with more efficient alternatives where possible.
Alternative approach:
* Use embeddings endpoint (cheaper per token) combined with pgvector nearest-neighbor search
* Instead of asking the model “Which existing statement is most similar?”, compute embeddings once and query directly in Postgres
* This approach is particularly effective for semantic similarity tasks
**Benefits:**
* Lower cost per operation
* Faster query response times
* Reduced API dependency for similarity searches
### A.5. Scaling and Productionizing our Retrieval Agent
Once your graph is populated, you need a mechanism to answer multi-hop queries at scale. This requires:
1. **Agent Architecture**
* **Controller Agent (Frontend)**: Receives a user question (e.g., “What events led to Acme Corp.’s IPO?”), then decomposes it into sub-questions or traversal steps.
* **Traversal Worker Agents**: Each worker can perform a local graph traversal (e.g., “Find all facts where Acme Corp. has EventType = Acquisition between 2020–2025”), possibly in parallel on different partitions of the graph.
* **Parallel Subgraph Extraction**
* Partition the graph by entity ID hash (e.g., modulo 16). For a given query, identify which partitions are likely to contain relevant edges, then dispatch traversal tasks in parallel to each worker.
* Workers return partial subgraphs (nodes + edges), and the Controller Agent merges them.
* **Chained LLM Reasoning**
For multi-hop questions, the Controller can prompt a model (e.g., GPT-4.1) with the partial subgraph and ask “Which next edge should I traverse?” This allows dynamic, context-aware traversal rather than blind breadth-first search.
* **Caching and Memoization**
For frequently asked queries or subgraph patterns, cache the results (e.g., in Redis or a Postgres Materialized View) with a TTL equal to the fact’s `valid\_to` date, so that subsequent requests hit the cache instead of re-traversing.
* **Load Balancing & Autoscaling**
Deploy the Traversal Worker Agents in a Kubernetes cluster with Horizontal Pod Autoscalers. Use CPU and memory metrics (and average queue length) to scale out during peak usage.
### A.6. Safeguards
#### A.6.1 Multi-Layered Output Verification
Run a lightweight validation pipeline to ensure outputs are as desired. Some examples of what can be included in this:
* Check that dates conform to `ISO-8601`
* Verify that entity types match your controlled vocabulary (e.g., if the model outputs an unexpected label, flag for manual review)
* Deploy a “sanity-check” function call to a smaller, cheaper model to verify the consistency of outputs (for example, “Does this statement parse correctly as a Fact? Yes/No.”)
#### A.6.2. Audit Logging & Monitoring
* Implement structured logging with configurable verbosity levels (e.g., debug, info, warn, error)
* Store input pre-processing steps, intermediate outputs, and final results with full tracing, such as that offered via [OpenAI’s tracing](https://platform.openai.com/traces)
* Track token throughput, latency, and error rates
* Monitor data quality metrics where possible, such as document or statement coverage, temporal resolution rates, and more
* Measure business-related metrics such as user numbers, average message volume, and user satisfaction
### A.7. Prompt Optimization
1. **Personas**
Introducing a persona to the model is an effective way to drive performance. Once you have narrowed down the specialism of the component you are developing the prompt for, you can create a persona in the system prompt that helps to shape the model's behaviour. We used this in our planner model to create a system prompt like this:
```
`initial\_planner\_system\_prompt = (
"You work for the leading financial firm, ABC Incorporated, one of the largest financial firms in the world. "
"Due to your long and esteemed tenure at the firm, various equity research teams will often come to you "
"for guidance on research tasks they are performing. Your expertise is particularly strong in the area of "
"ABC Incorporated's proprietary knowledge base of earnings call transcripts. This contains details that have been "
"extracted from the earnings call transcripts of various companies with labelling for when these statements are, or "
"were, valid. You are an expert at providing instructions to teams on how to use this knowledge graph to answer "
"their research queries. \\n"
)`
```
Persona prompts can become much more developed and specific than this, but this should provide an insight into what this looks like in practice.
2. **Few-Shot Prompting and Chain-of-Thought**
For extraction-related tasks, such as statement extraction, a concise few-shot prompt (2–5 examples) will typically deliver higher precision than a zero-shot prompt at a marginal increase in cost.
For e.g., temporal reconciliation tasks, chain-of-thought methods where you guide the model through comparison logic are more appropriate. This can look like:
```
`Example 1: [Old fact], [New fact] → Invalidate
Example 2: [Old fact], [New fact] → Coexist
Now: [Old fact], [New fact] →`
```
3. **Dynamic Prompting & Context Management**
You can also lean on other LLMs or more structured methods to prune and prepare material that will be dynamically passed to prompts. We saw an example of this when building the tools for our retriever above, where the `timeline\_generation` tool sorts the retrieved material before passing it back to the central orchestrator.
Steps to clean up the context or compress it mid-run can also be highly effective for longer-running queries.
4. **Template Library & A/B Testing**
Maintain a set of prompt templates in a version-controlled directory (e.g., `prompts/statement\_extraction.json`, `prompts/entity\_extraction.json`) to enable you to audit past changes and revert if necessary. You can utilize OpenAI's reusuable prompts for this. In the OpenAI dashboard, you can develop [reusable prompts](https://platform.openai.com/docs/guides/text#reusable-prompts) to use in API requests. This enables you to build and evaluate your prompts, deploying updated and improved versions without ever changing the code.
Automate A/B testing by periodically sampling extracted facts from the pipeline, re-running them through alternative prompts, and comparing performance scores (you can track this in a separate evaluation harness).
Track key performance indicators (KPIs) such as extraction latency, error rates, and invalidation accuracy.
If any metric drifts beyond a threshold (e.g., invalidation accuracy drops below 90%), trigger an alert and roll back to a previous prompt version.