Self-Evolving Agents - A Cookbook for Autonomous Agent Retraining
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
Nov 4, 2025
# Self-Evolving Agents - A Cookbook for Autonomous Agent Retraining
[ SK ](https://www.linkedin.com/in/shikharkwatra/)[ CM ](<https://github.com/Calvin Maguranis>)[ VF ](<https://github.com/Valentina Frenkel>)[ FP ](<https://github.com/Fanny Perraudeau>)[ GS ](<https://github.com/Giorgio Saladino>)
[ Shikhar Kwatra
(OpenAI)
, ](https://www.linkedin.com/in/shikharkwatra/)[ Calvin Maguranis , ](<https://github.com/Calvin Maguranis>)[ Valentina Frenkel , ](<https://github.com/Valentina Frenkel>)[ Fanny Perraudeau , ](<https://github.com/Fanny Perraudeau>)[ Giorgio Saladino ](<https://github.com/Giorgio Saladino>)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/partners/self_evolving_agents/autonomous_agent_retraining.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/partners/self_evolving_agents/autonomous_agent_retraining.ipynb)
## Overview
Agentic systems often reach a plateau after proof-of-concept because they depend on humans to diagnose edge cases and correct failures. This cookbook introduces a repeatable retraining loop that captures those issues, learns from the feedback, and promotes improvements back into production-like workflows. We ground the approach in a regulated healthcare documentation task, but the patterns generalize to any domain that demands accuracy, auditability, and rapid iteration.
### What You Will Learn
* Diagnose why an autonomous agent falls short of production readiness and instrument it with measurable feedback signals.
* Compare three prompt-optimization strategies—from quick manual iteration to fully automated loops—and understand when to reach for each.
* Assemble a self-healing workflow that combines human review, LLM-as-judge evals, and iterative prompt refinement.
### Who This Notebook Is For
* ML/AI engineers and solution architects who need to move beyond toy demos.
* Product and delivery teams looking for executable artifacts they can adapt into internal tooling or production pipelines.
### How to Work Through This Notebook
1. Start with Section 1 to understand the healthcare use case, baseline agent, and system architecture.
2. Use Section 2 to practice prompt optimization within the OpenAI Evals interface and collect structured feedback.
3. Run Section 3 to automate the optimization loop with graders, evals, and retraining logic.
4. Reference the appendix for reusable prompts, configurations, and evaluation templates as you tailor the workflow to your environment.
The notebook is modular—feel free to run sections independently or sequentially as you adapt the retraining loop to your own agents.
## 1. Use Case Overview: Self-Evolving Agents in Healthcare
### Problem Definition
For this cookbook, we focus on a **real-world use case**: drafting regulatory documents for pharmaceutical companies. These organizations must prepare and submit extensive documentation to regulatory authorities (e.g., the U.S. Food and Drug Administration) to obtain approval for new drugs. The accuracy and speed of these submissions are critical, as they directly impact how quickly life-saving treatments can reach patients.
Regulatory document drafting is a highly complex, iterative, and precision-driven process that requires deep scientific, medical, and compliance expertise. Despite the availability of advanced authoring tools, it remains labor-intensive and prone to human error. **Agentic systems offer substantial leverage** by assisting with research synthesis, content generation, and document structuring, yet human experts are still needed to ensure factual accuracy and regulatory compliance.
The key challenge is to design a feedback loop that enables these agentic systems to learn iteratively and refine model behavior over time. Such a system can gradually shift human effort from detailed correction to high-level oversight, improving efficiency while maintaining the rigorous standards required for regulatory submissions.
### Self-evolving Agent
The diagram below illustrates the iterative process for continuously improving an AI agent through feedback, meta prompting, and evaluation. The loop combines human judgment or automated feedback using an LLM-as-a-judge to iteratively enhance performance.
*Figure 1 - Diagram showing the self-evolving loop for automated agent improvement.*
The process consists of the following steps:
1. **Baseline Agent**
The process begins with a baseline agent. In this notebook, we use a deliberately simple example (an agent that summarizes sections of a document) to illustrate the iterative improvement loop. In real-world or enterprise settings, the baseline agent could be much more complex. The summaries it produces serve as the initial benchmark for subsequent evaluation and refinement.
2. **Human Feedback (or LLM-as-judge)**
The baseline agent’s outputs are then evaluated either by human reviewers (e.g., for production environments) and/or by an automated **LLM-as-judge** system. This step gathers both quantitative and qualitative feedback that indicates how well the agent meets its goals — for instance, if we are testing the length of the summary, the feedback might be “the summary is too long” or a numerical score (generally between `0` and `1`) generated by eval when assessing if the summary is under 500 words.
3. **Evals and Aggregated Score**
Based on the collected feedback, new prompts are generated and tested through evaluations (**Evals**). These tests measure performance against predefined criteria, and the outcomes are combined into an aggregated score that reflects the overall performance. The loop continues until the score exceeds a target threshold (e.g., `0.8`) or the maximum number of retries is reached (e.g., `max\_retry = 10`). If the retry limit is hit, engineers are alerted that manual improvements are required.
4. **Updated Baseline Agent**
Once an improved version achieves the target performance, it replaces the original baseline agent. This updated agent becomes the foundation for the next iteration, supporting a continuous cycle of learning, feedback, and optimization.
### Dataset Overview
The dataset used for evaluation comprises \~70 sections extracted from the *Sample CMC Section for Hyperpolarized Pyruvate (13C) Injection*, publicly available [here](https://dctd.cancer.gov/drug-discovery-development/reagents-materials/imaging-ind-resources/documentation/13c-pyruvate-cmc.pdf). This dataset provides realistic, domain-specific content suitable for testing both scientific summarization and regulatory compliance behavior.
### Baseline Agent Overview
To keep this cookbook self-contained and easily reproducible, we simplified the regulatory drafting use case while retaining its essential complexity. In production, a typical regulatory authoring agent comprises multiple specialized sub-agents responsible for tasks such as drafting, data analysis, compliance checking, citation generation, and fact verification.
For this guide, we narrow the scope of the regulatory authoring agent to focus on the self-healing aspect of the system. Our regulatory authoring agent consists of two sub-agents:
* **A summarizer** creating scientific and concise summaries.
* **A compliance checker**: evaluating each summary against key regulatory requirements (e.g., FDA 21 CFR Part 11).
*Figure 2 - The baseline agent as created in the AgentBuilder UI.*
For the remainder of this cookbook, we implemented a simplified version of the Summarizer agent (see the section **Agent Setup** below). Alternatively, you can reuse the code for the agent created with AgentBuilder. If you’d like to reproduce the agent directly from the AgentBuilder UI, here are the key prompts and parameters used:
* **Summarizer agent:** This agent used the file search tool, where the [CMC PDF]("data/c13_pyruvate_sample_CMC_from_UCSF.pdf") was uploaded to the vector store.
>
*> Prompt:
*> “Summarize section {{workflow.input_as_text}} from {{state.cmc_pdf}} uploaded to the vector store.”
>
* **Compliance Checker agent:**
>
*> Prompt:
*> “Verify that the summary below is compliant with FDA 21 CFR Part 11: {{input.output_text}}. If the summary is compliant, return
*> Compliant
*> . Otherwise, return
*> This section needs to be manually summarized
*> .”
>
Both agents were configured with the default parameters - using GPT-5, low reasoning effort, and text as the output format.
### Evaluation Approach
To evaluate the baseline agent, there are two main approaches:
1. **Collecting Human Feedback.** This approach involves gathering feedback from human users through the OpenAI Evals platform (or a custom UI built for a specific application). It is best suited for production settings or when piloting a tool where subject matter experts (SMEs) interact with the tool in real-world scenarios. This method helps uncover edge cases that may not have been identified during development. On the Evals platform, users can provide thumbs-up or thumbs-down ratings and share qualitative feedback about the summaries.
2. **Using an LLM-as-a-Judge.** This option is typically used during the development phase, enabling fast feedback loops without requiring SME’s time. An **LLM-as-a-judge** uses an LLM to automatically evaluate and score the agent’s outputs based on predefined criteria. It can also be used for monitoring model drift (e.g., in production) or validating changes between model and model versions (e.g., switching between `gpt-5` and `gpt-5-mini`).
This cookbook demonstrates both approaches:
* **Section 2** shows the platform UI approach for manual prompt optimization
* **Section 3** implements the fully automated API approach using LLM-as-a-judge
*Note: The Evals platform does not yet provide an API to retrieve user feedback programmatically.*
## 2. Using the OpenAI Evals Platform
The OpenAI Evals platform provides an intuitive interface for prompt optimization and evaluation. This section demonstrates the complete workflow from dataset upload through iterative prompt improvement, showing how you can leverage the platform’s visual interface to optimize your prompts before implementing automated solutions.
### Step 1: Upload Dataset
To begin using the OpenAI Evaluation platform, you’ll first need to upload your dataset:
1. Click the **+ Create** button
2. Define the dataset name
3. Upload a CSV file and select the columns to keep
4. Upload
Your dataset should contain the documents or document sections that need to be summarized. Each row represents one input that will be processed by your system.
### Step 2: Explore Your Data
Once uploaded, you can explore your dataset. Click the dataset name to explore the uploaded data. This allows you to verify that your data is properly formatted and contains the expected content before proceeding with prompt configuration.
### Step 3: Configure Initial Prompt
This is where you define your initial system prompt and configure how data flows through your model.
*Figure 3 - The platform's "New prompt" interface showing model configuration, variables, and system message settings.*
#### Configuration Steps
1. **System Prompt**: Add the system message that defines the model’s task and behavior (this prompt will be optimized)
2. **User Prompt Template**: Add the prompt message template for user messages, using variables such as `{{\<column\_name\>}}` that get replaced with actual data from your dataset
3. **Model Selection**: Choose the model for generation (e.g., gpt-4.1, gpt-5)
4. **Temperature**: Configure creativity vs. determinism
You can start with a very simple prompt to demonstrate the power of the optimization process. For example, beginning with just “summarize” shows how the system can evolve from a minimal starting point.
### Step 4: Generate Outputs
Once your prompt is configured, you’re ready to generate outputs across your dataset. The prompt will run once per row and output will be generated on a new **output** column.
1. Click **“Generate Output”**
2. The platform runs your prompt against all samples
3. Results appear in a new **Output** column
The platform will process each row in your dataset, replacing template variables with actual values and calling the model with your system prompt. This creates a baseline of outputs that you can evaluate.
### Step 5: Review and Evaluate
Evaluation is where you provide structured feedback to guide prompt improvement.
#### Review Outputs
1. **Add Evaluation Columns** if not automatically added - Click “Columns” → “Annotations” → “Add”:
* **Rating** - Binary (good/bad) or numeric ratings
* **Feedback** - Text describing what needs improvement
* **Provide Rating and Feedback** - Add your assessment for each output.
Depending on the quality of the output, you may select a good or bad rating and explain your score based on how you would like the answer to be improved. For example:
>
> (Rating) | Feedback
>
>
* > (Good) Good, but only the answer should be provided. The output should not include headers or any text other than the answer.
>
* > (Bad) The information is good, but it should be presented as bullet points.
>
* > (Good) Good summary; it is clear.
>
* > (Bad) Use bullet points when answering to improve readability. Summarize each sub-section individually.
>
>
* **Save Annotations** - Your feedback is saved with the evaluation run
*Figure 4 - The evaluation interface showing generated outputs with rating and feedback columns for annotation.*
This structured feedback becomes the foundation for automatic prompt optimization.
### Step 6: Optimize Prompt
After collecting feedback, the platform can automatically generate an improved prompt.
1. Click **“Optimize”**
2. A new prompt version is generated in a new tab
3. Click **“View Prompt”** to see the improved version
*Figure 5 - The improved prompt generated by the platform, showing detailed instructions and requirements.*
### Step 7: Iterate and Compare
With your improved prompt ready, start a new iteration to measure improvement.
1. Click **“Generate Output”**
2. Review the new results and provide feedback on any remaining issues
3. Click **“Optimize”** again if needed
4. Repeat until satisfied
The platform’s tab structure allows you to compare performance across iterations. You can easily see how outputs evolved from your initial prompt to the optimized versions.
*Figure 6 - Feedback and evaluation results for the optimized prompt, showing improvements in output quality.*
#### When to Stop Iterating
Continue the optimization cycle until:
* **Quality threshold reached**: \>80% of outputs receive positive feedback
* **Diminishing returns**: New iterations show minimal improvement
* **Specific issues resolved**: All identified failure modes are addressed
This platform-based approach provides an excellent foundation for understanding prompt optimization before moving to automated implementations. The visual interface makes it easy to see the impact of changes and understand the optimization process.
## 3. Self-evolving Loop with LLM-as-a-Judge
This section introduces a fully automated evaluation workflow using an LLM-as-a-Judge through the OpenAI API, eliminating the need for any user interface. This approach enables scalable, programmatic assessment of agent performance, supporting rapid iteration and continuous model monitoring in production.
```
`# gepa and litellm are only required for the Section 4.b (prompt optimization with GEPA)
%pip install --upgrade openai openai-agents pydantic pandas gepa litellm python-dotenv -qqq
%load\_ext dotenv
%dotenv
# Place your API key in a file called .env
# OPENAI\_API\_KEY=sk-...`
```
### Eval Creation
To evaluate the baseline summarization agent, we use four complementary graders that balance deterministic checks with semantic judgment.
|Grader|Type|Pass threshold|What it checks|Why|
|Chemical string name|`python`|0.8|If any exact chemical names in the section appear in the summary.|Forces preservation of critical domain entities so summaries don’t omit chemically meaningful terms.|
|Summarization length|`python`|0.85|Inverse deviation from an expected 100-word length.|Keeps summaries concise and comparable, reducing verbosity that can mask poor content.|
|Cosine similarity|`text\_similarity`|0.85|Cosine similarity between section and summary texts.|Ensures the summary stays anchored to the source content rather than drifting semantically.|
|LLM-as-judge|`score\_model`|0.85|A rubric-driven score from a model acting as an evaluator.|Captures nuanced quality signals that rule-based metrics miss, improving overall robustness.|
**Notes**
* The two Python graders catch domain fidelity and length discipline early, which stabilizes optimization before semantic tuning.
* Text similarity guards against superficial rephrasing that strays from the source.
* The LLM judge provides a holistic failsafe when edge cases slip past deterministic checks.
```
`import os
from openai import OpenAI
client = OpenAI(api\_key=os.getenv("OPENAI\_API\_KEY"))
data\_source\_config = {
"type": "custom",
"item\_schema": {
"type": "object",
"properties": {"section": {"type": "string"}, "summary": {"type": "string"}},
"required": ["section", "summary"],
},
"include\_sample\_schema": False,
}
testing\_criteria = [
{
"type": "python",
"name": "chemical\_name\_grader",
"image\_tag": "2025-05-08",
"pass\_threshold": 0.8,
"source": r"""def grade(sample: dict, item: dict) -\> float:
section = item["section"]
summary = item["summary"]
CHEMICALS\_MASTER = ["[1-¹³C]Pyruvic acid","[1-¹³C]Pyruvate","¹²C Pyruvic acid","Sodium [1-¹³C]pyruvate","Sodium pyruvate (¹²C)","AH111501 (Trityl radical)","Tris{8-carboxyl-2,2,6,6-tetra[2-(1-methoxyethyl)]-benzo(1,2-d:4,5-d’)bis(1,3)dithiole-4-yl}methyl acid","AH111501 sodium salt","Methyl, tris[8-carboxy-2,2,6,6-tetrakis(2-methoxyethyl)benzo[1,2-d:4,5-d’]bis[1,3]dithiol-4-yl]-, trisodium salt","AH111501 trisodium salt","AH111576","2,2′,2″,2‴-(4,8-Dibromobenzo[1,2-d:4,5-d′]bis([1,3]dithiole)-2,2,6,6-tetrayl)tetraethanol","AH111586","4,8-Dibromo-2,2,6,6-tetrakis(2-methoxyethyl)benzo[1,2-d:4,5-d′]bis([1,3]dithiole)","AH111709","AH111743","AH112615","4,4-Bis-hydroxymethyl-2-methyl-oxazolidine-2-carboxylic acid","AH112623","Parapyruvate","2-Hydroxy-2-methyl-4-oxo-pentanedioic acid","AH113127","(4-Hydroxymethyl-oxazolidin-4-yl)-methanol","AH113462/E","Enol lactone","AH113462/K","Keto lactone","Acetyl bromide","Methanol","Dimethyl sulfoxide","DMSO","Tetrahydrofuran","THF","Acetonitrile","ACN","Diethyl ether","Et₂O","N,N-Dimethylacetamide","DMA","1,3-Dimethyl-2-imidazolidinone","DMI","Hydrochloric acid","HCl","Sodium hydroxide","NaOH","Disodium ethylenediaminetetraacetate","Na₂EDTA","Ethylenediaminetetraacetic acid","EDTA","Tris(hydroxymethyl)aminomethane","TRIS","Trometamol","Trifluoroacetic acid","TFA","Toluene","Heptane","Ethyl acetate","Ethanol","Water","H₂O","Sodium chloride","NaCl","Cuprous [1-¹³C]cyanide","Cu¹³CN","Gadolinium","Gd","Tin","Sn","Phosphorus","P","Carbon dioxide","CO₂","Sodium [1-13C]pyruvate","[1-13C]Pyruvic acid","1-13C pyruvate"]
# Identify the chemicals present in the section
present = [chem for chem in CHEMICALS\_MASTER if chem in section]
# If no chemicals present, consider it satisfied
if not present:
return 1.0
correct = 0
for chem in present:
# Only count as correct if the exact chemical string appears in the summary
if chem in summary:
correct += 1
return correct / len(present)""",
},
{
"type": "python",
"name": "word\_length\_deviation\_grader",
"image\_tag": "2025-05-08",
"pass\_threshold": 0.85,
"source": r"""
def grade(sample: dict, item: dict) -\> float:
summary = item["summary"]
word\_count = len(summary.split())
expected\_summary\_length = 100
tolerance = 0.2 # 20% band around target
# relative deviation
deviation = abs(word\_count - expected\_summary\_length) / expected\_summary\_length
# If within tolerance band → full score
if deviation \<= tolerance:
return 1.0
# Outside band → score decays linearly, capped at 0
# e.g., deviation 0.3 → score 0.8, deviation 1.0+ → 0.0
score = 1.0 - (deviation - tolerance)
return max(0.0, score)
""",
},
{
"name": "cosine\_similarity",
"type": "text\_similarity",
"input": "{{ item.summary }}",
"reference": "{{ item.section }}",
"evaluation\_metric": "cosine",
"pass\_threshold": 0.85,
},
{
"name": "llm\_as\_judge",
"type": "score\_model",
"model": "gpt-4.1",
"input": [
{
"role": "system",
"content": (
"You are an expert technical summarization evaluator. "
"Evaluate whether the summary captures and preserves the important technical facts and specific details from the section, allowing for occasional minor rewording or omissions of less important points, but not major technical inaccuracies or information loss.\\n\\n"
"Scoring Guidelines:\\n"
"- Return a numerical score between 0 and 1 (with up to two decimal places).\\n"
"- A score of 1 means the summary is almost flawless: it is comprehensive, highly faithful, and technically accurate, with virtually no important or meaningful details missing, and no significant misstatements or distortions.\\n"
"- 0.75-0.99 indicates excellent work: all main facts are represented, but there may be trivial omissions or very minor rewording that do not materially affect understanding.\\n"
"- 0.5-0.75 indicates good but imperfect: most technical information is retained and correctly presented, some less critical details might be missing or slightly rephrased, but overall fidelity is preserved.\\n"
"- 0.3-0.5 means significant information is missing, or some technical inaccuracies are present, but the summary retains a reasonable portion of key facts.\\n"
"- 0.0-0.3 means there are major omissions, misunderstandings, or a failure to capture the most important technical content.\\n\\n"
"Respond only with a single number between 0 and 1 indicating summary quality by these criteria."
),
},
{
"role": "user",
"content": (
"Section:\\n{{item.section}}\\n"
"Summary:\\n{{sample.output\_text}}"
),
},
],
"range": [0, 1],
"pass\_threshold": 0.85,
},
]
eval = client.evals.create(
name="self\_evolving\_eval",
data\_source\_config=data\_source\_config,
testing\_criteria=testing\_criteria,
)
print(f"Created Eval: {eval.id}")`
```
You should see an eval ID in the output, e.g. `eval\_...`. This is the ID of the eval we just created (as shown below)
*Figure 7 - The platform's Eval interface showing data source configuration, and test criteria settings.*
### Grader Scoring and Parsing
Next we’ll need run the evals on the summarization agent’s output and parse the results for the eval’s grader scores. To do this we’ll use a few helper functions:
* `run\_eval`: Simple runner to call the evals API with proper formatting
* `poll\_eval\_run`: A polling utility to wait for the scheduled eval run to complete
* `parse\_eval\_run\_output`: Parses the eval run and returns a structured output for the feedback loop
```
`import time
import json
def run\_eval(eval\_id: str, section: str, summary: str):
"""Creates a run of the eval with the input section and output summary."""
return client.evals.runs.create(
eval\_id=eval\_id,
name="self-evolving-eval",
data\_source={
"type": "jsonl",
"source": {
"type": "file\_content",
"content": [
{
"item": {
"section": section,
"summary": summary,
}
}
],
},
},
)
def poll\_eval\_run(eval\_id: str, run\_id: str, max\_polls = 10):
"""
Polls the evaluation run until completion or timeout.
This function exists to handle asynchronous behavior in the eval service by
periodically checking run status. It balances responsiveness and resource use by
polling at fixed intervals rather than blocking indefinitely. The retry limit
prevents runaway loops in cases where the service never returns a completed status.
"""
run = None
for attempt in range(1, max\_polls + 1):
run = client.evals.runs.retrieve(eval\_id=eval\_id, run\_id=run\_id)
if run.status == "completed":
break
if attempt == max\_polls:
print("Exceeded retries, aborting")
break
time.sleep(5)
run\_output\_items = client.evals.runs.output\_items.list(
eval\_id=eval\_id, run\_id=run\_id
)
return run\_output\_items
def parse\_eval\_run\_output(items):
"""Extract all grader scores and any available conclusion outputs."""
all\_results = []
for item in items.data:
for result in item.results:
grader\_name\_full = result.name
score = result.score
passed = result.passed
reasoning = None
try:
sample = result.sample
if sample:
content = result.sample["output"][0]["content"]
content\_json = json.loads(content)
steps = content\_json["steps"]
reasoning = " ".join([step["conclusion"] for step in steps])
except Exception:
pass
all\_results.append(
{
"grader\_name": grader\_name\_full,
"score": score,
"passed": passed,
"reasoning": reasoning,
}
)
return all\_results`
```
Now we can use the created eval ID from earlier and run the graders against an arbitrary input section and summary output. This forms the backbone of the feedback loop which will kick off the prompt optimization routine.
### Eval execution run
Let’s test our evals by providing a section and a generated summary directly.
```
`EVAL\_ID = eval.id #Created eval ID from above cell
SECTION = "3.2.S.1 General Information ([1-13C]pyruvic acid) The active ingredient in Hyperpolarized Pyruvate (13C) Injection is hyperpolarized [1-13C]pyruvate. The drug substance is defined as [13C]pyruvic acid, which is neutralized to [1-13C]pyruvate during the compounding process. In several pre-clinical and clinical studies and during evaluation of stability, pyruvic acid has been used instead of [1-13C]pyruvic acid (see Sections 3.2.P.2.2.1 Formulation Development for Hyperpolarized Pyruvate (13C) Injection and Section 8.1 Introduction for Item 8 Pharmacology and Toxicology Info). In the Section 3.2.S Drug Substance, data are presented for both pyruvic acid and for [1-13C]pyruvic acid. For simplicity, the terminology used in headings and captions is [1-13C]pyruvic acid. Batches containing pyruvic acid are specified by footnotes. 3.2.S.1.1 Nomenclature ([1-13C]pyruvic acid) The drug substance used for compounding of Hyperpolarized Pyruvate (13C) Injection is [1-13C]pyruvic acid. Company code: W6578 Chemical name: [1-13C]pyruvic acid CAS registry number: 127-17-3 3.2.S.1.2 Structure ([1-13C]pyruvic acid) Figure 1 Structure of [1-13C]pyruvic acid Molecular formula: C H O 3 4 3 Molecular weight: 89.06 3.2.S.1.3 General Properties ([1-13C]pyruvic acid) Appearance: Colorless to yellow, clear, viscous liquid pKa:Ka:aranWater solubility: Complete The structure of [1-13C]pyruvic acid has been confirmed by spectroscopic analysis (see Section 3.2.S.3.1 Elucidation of Structure and other Characteristics)."
SUMMARY = "The active ingredient in Hyperpolarized Pyruvate (13C) Injection is hyperpolarized [1-13C]pyruvate, derived from [1-13C]pyruvic acid (neutralized during compounding). Both pyruvic acid and [1-13C]pyruvic acid were used in studies and stability evaluations, but the documentation refers to [1-13C]pyruvic acid unless otherwise noted. The drug substance ([1-13C]pyruvic acid, CAS 127-17-3) is a colorless to yellow, clear, viscous liquid with a molecular formula C3H4O3 and molecular weight 89.06. Its structure has been confirmed by spectroscopic analysis, and it is completely soluble in water."
eval\_run = run\_eval(EVAL\_ID, section=SECTION, summary=SUMMARY)
run\_output = poll\_eval\_run(eval\_id=EVAL\_ID, run\_id=eval\_run.id)
grader\_scores = parse\_eval\_run\_output(run\_output)
print(grader\_scores)`
```
You should see a list of grader scores in the output, e.g.
`[{'grader\_name': 'chemical\_name\_grader-\<uuid\>', 'score': 0.5, 'passed': False, 'reasoning': None}, {'grader\_name': 'word\_length\_deviation\_grader-\<uuid\>', 'score': 0.8, 'passed': True, 'reasoning': None}, {'grader\_name': 'cosine\_similarity-\<uuid\>', 'score': 0.9104484223477793, 'passed': True, 'reasoning': None}, {'grader\_name': 'llm\_as\_judge-\<uuid\>', 'score': 0.8, 'passed': True, 'reasoning': 'The summary needs to include specific details from the section. Part of the essential information is captured. Key pieces of information are missing. Not all relevant structural information is included.'}]`
Running this script we can see that most of our graders are passing except the `chemical\_name\_grader`. Next we’ll programmatically recognize this opportunity to improve the summarization agent.
*Note: When you run it locally, graders other than `chemical\_name\_grader` may fail at first. This is normal, as graders can initially fail, but the results should improve through the feedback loop. Early failures simply reflect the model adjusting its responses before converging on more accurate results.*
### Dashboard Observability
Eval runs and results can also be seen in the OpenAI Dashboard:
*Figure 8 - Eval dashboard showing evaluation runs and results.*
We can also drill down into a specific eval run:
*Figure 9 - Detailed eval run results showing grader scores and performance metrics.*
## Agent Setup
Now that we have our evals and graders set up, we can go back to our summarization agent.
For simplicity, we will provide the code for a simple agent below. You could also use `AgentBuilder`, as shown in Figure 2, and export the code from the UI.
We will also need a metaprompt optimization agent, to optimize our prompt, as well as some simple utilities to handle prompt versions:
* `PromptVersionEntry`: A pydantic model used to track the prompt and metadata as it changes in production
* `VersionedPrompt`: A utility class to track prompt versions, this will be important in production when analyzing the evolution of the prompt as well as ensuring there is a fallback history in case of a regression
```
`from datetime import datetime
from typing import Any, Optional
from pydantic import BaseModel, Field, ConfigDict, field\_validator
class PromptVersionEntry(BaseModel):
"""Data model for a prompt and associated data for observability"""
version: int = Field(
..., ge=0, description="Version number of the prompt (increments)"
)
model: str = Field(
"gpt-5",
min\_length=1,
description="The model version to use for this version of the prompt, defaults to gpt-5",
)
prompt: str = Field(
..., min\_length=1, description="The prompt text for this version"
)
timestamp: datetime = Field(
default\_factory=datetime.utcnow,
description="UTC timestamp when this version was created",
)
eval\_id: Optional[str] = Field(
None, description="ID of the evaluation associated with this prompt version"
)
run\_id: Optional[str] = Field(
None, description="ID of the run associated with this prompt version"
)
metadata: Optional[dict[str, Any]] = Field(
None, description="Free-form metadata dict (e.g., section, summary)"
)
model\_config = ConfigDict(
str\_strip\_whitespace=True, validate\_assignment=True, extra="forbid"
)
@field\_validator("prompt")
@classmethod
def prompt\_not\_blank(cls, v: str) -\> str:
if not v.strip():
raise ValueError("prompt must not be blank or only whitespace")
return v
class VersionedPrompt:
"""Manages a collection of prompt versions and provides controlled updates and rollbacks."""
def \_\_init\_\_(
self,
initial\_prompt: str,
model: Optional[str] = "gpt-5",
eval\_id: Optional[str] = None,
run\_id: Optional[str] = None,
metadata: Optional[dict[str, Any]] = None,
):
if not initial\_prompt or not initial\_prompt.strip():
raise ValueError("initial\_prompt must be non-empty")
self.\_versions: list[PromptVersionEntry] = []
first\_entry = PromptVersionEntry(
version=0,
prompt=initial\_prompt,
model=model,
eval\_id=eval\_id,
run\_id=run\_id,
metadata=metadata,
)
self.\_versions.append(first\_entry)
def update(
self,
new\_prompt: str,
model: Optional[str] = "gpt-5",
eval\_id: Optional[str] = None,
run\_id: Optional[str] = None,
metadata: Optional[dict[str, Any]] = None,
) -\> PromptVersionEntry:
if not new\_prompt or not new\_prompt.strip():
raise ValueError("new\_prompt must be non-empty")
version = self.current().version + 1
entry = PromptVersionEntry(
version=version,
prompt=new\_prompt,
model=model,
eval\_id=eval\_id,
run\_id=run\_id,
metadata=metadata,
)
self.\_versions.append(entry)
return entry
def current(self) -\> PromptVersionEntry:
return self.\_versions[-1]
def revert\_to\_version(self, version: int) -\> PromptVersionEntry:
idx = None
for i, entry in enumerate(self.\_versions):
if entry.version == version:
idx = i
break
if idx is None:
raise ValueError(f"No version found with version={version}")
self.\_versions = self.\_versions[: idx + 1]
return self.\_versions[-1]`
```
Next we’ll create the starting summarization and prompt optimization agents.
*Note: We created a wrapper to track prompt changes in the summarization agent since it is expected to evolve in production, the metaprompt agent’s prompt will stay static for the purposes of this cookbook.*
```
`
from agents import Agent
METAPROMPT\_TEMPLATE = """
# Context:
## Original prompt:
{original\_prompt}
## Section:
{section}
## Summary:
{summary}
## Reason to improve the prompt:
{reasoning}
# Task:
Write a new summarization prompt that is significantly improved and more specific than the original.
The new prompt should instruct the model to produce concise yet comprehensive technical summaries that precisely preserve all explicit information from the source text. It should emphasize the inclusion of all named entities, quantities, compounds, and technical terminology without paraphrasing or omission. The resulting prompt should read like a clear, directive system message for a technical summarization assistant—structured, unambiguous, and generalizable across scientific or regulatory document sections.
"""
metaprompt\_agent = Agent(
name="MetapromptAgent", instructions="You are a prompt optimizer."
)
summarization\_prompt = VersionedPrompt(
initial\_prompt="""You are a summarization assistant.
Given a section of text, produce a summary."""
)
def make\_summarization\_agent(prompt\_entry: PromptVersionEntry) -\> Agent:
return Agent(
name="SummarizationAgent",
instructions=prompt\_entry.prompt,
model=prompt\_entry.model,
)
summarization\_agent = make\_summarization\_agent(summarization\_prompt.current())
# Cache eval results by section + summary so repeated attempts do not trigger redundant grader runs.
eval\_cache: dict[tuple[str, str], list[dict[str, Any]]] = {}
# Track the highest-scoring candidate that also passes the lenient score threshold.
best\_candidate: dict[str, Any] = {
"score": float("-inf"),
"prompt": summarization\_prompt.current().prompt,
"model": summarization\_prompt.current().model,
"summary": None,
"metadata": None,
"version": summarization\_prompt.current().version,
"passed\_lenient": False,
"total\_score": float("-inf"),
}
# Aggregate per-version performance so we can pick the strongest total scorer at the end.
aggregate\_prompt\_stats: dict[int, dict[str, Any]] = {}`
```
### Orchestration and Monitoring
This is what we’ve done so far - we’ve created:
* Evals with 4 graders that will assess the outputs and produce a score for each grader
* A summarization agent with a versioned prompt class to track changes to the prompt and model
* A metaprompt optimization agent that will attempt to update the prompt based on a set of reasoning
Now these different functionalities can be composed to orchestrate the self-evolving loop with Agent tracing in the OpenAI dashboard.
Keep in mind that this is a simplified example. In a real-world scenario, you’d want to ensure you have guardrails for optimization attempts and that an alert notifies a human when a guardrail is triggered.
*Note: Due to practical limitations of the cookbook we are simulating a stream of data by feeding in a static dataset and using `print` statements in place of true observability.*
### Orchestration Utilities
As in previous sections we’ll create some utilities to manage the orchestration logic of the feedback loop.
```
`import asyncio
from typing import Any, Optional
from agents import Runner
LENIENT\_PASS\_RATIO = 0.75 # 75% of graders must pass (binary)
LENIENT\_AVERAGE\_THRESHOLD = 0.85 # 85% average score across graders
def reset\_best\_candidate() -\> None:
"""Reset the best candidate tracker for a new optimization run."""
global best\_candidate
current = summarization\_prompt.current()
best\_candidate = {
"score": float("-inf"),
"prompt": current.prompt,
"model": current.model,
"summary": None,
"metadata": None,
"version": current.version,
}
def reset\_best\_trackers() -\> None:
"""Reset both the best-candidate tracker and aggregate stats."""
reset\_best\_candidate()
aggregate\_prompt\_stats.clear()
def update\_best\_candidate(
\*,
average\_score: Optional[float] = None,
prompt\_text: str,
model\_name: str,
summary\_text: str = None,
metadata: dict[str, Any] = None,
lenient\_passed: bool = False,
prompt\_version: int = None,
total\_score: Optional[float] = None,
score: Optional[float] = None,
) -\> None:
"""Persist the best lenient-passing candidate."""
global best\_candidate
if prompt\_version is None:
prompt\_version = summarization\_prompt.current().version
if average\_score is None:
average\_score = score
if average\_score is None:
return
if lenient\_passed:
best\_candidate.update(
{
"score": average\_score,
"prompt": prompt\_text,
"model": model\_name,
"summary": summary\_text,
"metadata": metadata,
"version": prompt\_version,
"total\_score": total\_score if total\_score is not None else average\_score,
}
)
def apply\_best\_candidate\_if\_needed() -\> Agent:
"""Ensure summarization\_prompt reflects the best prompt candidate."""
if best\_candidate["score"] \> float("-inf"):
current = summarization\_prompt.current()
target = best\_candidate
# Only update if different
if (
current.prompt != target["prompt"]
or current.model != target["model"]
or current.version != target.get("version")
):
summarization\_prompt.update(
new\_prompt=target["prompt"],
model=target["model"],
metadata=target.get("metadata"),
)
target["version"] = summarization\_prompt.current().version
return make\_summarization\_agent(summarization\_prompt.current())
return make\_summarization\_agent(summarization\_prompt.current())
def record\_aggregate\_prompt\_score(
\*,
prompt\_version: int,
prompt\_text: str,
model\_name: str,
average\_score: float,
total\_score: Optional[float] = None,
) -\> None:
"""Accumulate per-version grader scores for aggregate selection."""
stats = aggregate\_prompt\_stats.setdefault(
prompt\_version,
{
"version": prompt\_version,
"prompt": prompt\_text,
"model": model\_name,
"total\_score": 0.0,
"total\_average": 0.0,
"count": 0,
},
)
stats["total\_score"] += total\_score if total\_score is not None else average\_score
stats["total\_average"] += average\_score
stats["count"] += 1
stats["prompt"] = prompt\_text
stats["model"] = model\_name
def select\_best\_aggregate\_prompt() -\> Optional[dict[str, Any]]:
"""Return the prompt version with the highest cumulative score."""
if not aggregate\_prompt\_stats:
return None
return max(
aggregate\_prompt\_stats.values(),
key=lambda entry: (
entry.get("total\_score", float("-inf")),
entry.get("version", -1),
),
)
async def get\_eval\_grader\_score(eval\_id: str, section: str, summary: str):
"""Retrieve grader scores for a section-summary pair with caching."""
cache\_key = (section, summary)
if cache\_key in eval\_cache:
return eval\_cache[cache\_key]
eval\_run = run\_eval(eval\_id=eval\_id, section=section, summary=summary)
run\_output = poll\_eval\_run(eval\_id=eval\_id, run\_id=eval\_run.id)
results = parse\_eval\_run\_output(run\_output)
eval\_cache[cache\_key] = results
return results
def calculate\_grader\_score(grader\_scores):
"""Simple average score of all graders from the eval."""
if not grader\_scores:
return 0.0
score\_sum = 0.0
for entry in grader\_scores:
score\_sum += entry.get("score", 0.0)
return score\_sum / len(grader\_scores)
def calculate\_total\_grader\_score(grader\_scores):
"""Sum of all grader scores for aggregate tracking."""
if not grader\_scores:
return 0.0
return sum(entry.get("score", 0.0) for entry in grader\_scores)
DEFAULT\_PASSING\_FEEDBACK = (
"All graders passed; tighten factual coverage, chemical completeness, and conciseness."
)
def is\_lenient\_pass(grader\_scores, average\_score: float) -\> bool:
if not grader\_scores:
return False
passed\_count = sum(1 for entry in grader\_scores if entry.get("passed"))
total\_graders = len(grader\_scores)
if total\_graders and (passed\_count / total\_graders) \>= LENIENT\_PASS\_RATIO:
return True
return average\_score \>= LENIENT\_AVERAGE\_THRESHOLD
def collect\_grader\_feedback(grader\_scores):
"""Consolidate grader reasoning into actionable feedback for the metaprompt agent."""
feedback\_lines = []
for entry in grader\_scores:
grader = entry.get("grader\_name", "")
passed = entry.get("passed", False)
reasoning = entry.get("reasoning")
if not passed:
if grader.startswith("chemical\_name\_grader"):
feedback\_lines.append(
"Not all chemical names in the input section were included in the summary."
)
elif grader.startswith("word\_length\_deviation\_grader"):
feedback\_lines.append(
"The summary length deviates too much from the expected length."
)
elif grader.startswith("cosine\_similarity"):
feedback\_lines.append(
"The summary is not sufficiently similar to the source section (cosine similarity too low)."
)
elif grader.startswith("llm\_as\_judge") and reasoning:
feedback\_lines.append(reasoning)
if not feedback\_lines:
feedback\_lines.append(DEFAULT\_PASSING\_FEEDBACK)
return "".join(feedback\_lines)`
```
### Self-evolving loop
Now to simulate a stream of requests for summarization we’ll feed in a prepared dataset and observe the optimization evolve from a naive prompt.
>
> The referenced dataset.csv can be found in the Github repository.
>
```
`import pandas as pd
from agents import Agent, trace
EVAL\_ID = eval.id #Created eval ID from above cell
MAX\_OPTIMIZATION\_RETRIES = 3
async def self\_evolving\_loop(summarization\_agent: Agent) -\> Agent:
print(f"Starting self-evolving loop | Initial prompt v{summarization\_prompt.current().version}")
print(f"Prompt:{summarization\_prompt.current().prompt}")
print("-" \* 80)
reset\_best\_trackers()
df = pd.read\_csv("data/dataset.csv")
with trace("Self-evolving Optimization Workflow"):
for \_, row in df.head().iterrows():
content = row.get("content")
if pd.isna(content) or (isinstance(content, str) and not content.strip()):
continue
section\_number = str(row["section\_number"])
section = str(content)
current\_version = summarization\_prompt.current().version
print(f"[Section {section\_number}] Using prompt v{current\_version}")
optimization\_success = False
for attempt in range(1, MAX\_OPTIMIZATION\_RETRIES + 1):
print(f" Attempt {attempt}: evaluating summary...")
summary\_result = await Runner.run(summarization\_agent, section)
summary = summary\_result.final\_output
grader\_scores = await get\_eval\_grader\_score(eval\_id=EVAL\_ID, summary=summary, section=section)
average\_score = calculate\_grader\_score(grader\_scores)
total\_score = calculate\_total\_grader\_score(grader\_scores)
lenient\_passed = is\_lenient\_pass(grader\_scores, average\_score)
print(
f" Scores — avg={average\_score:.3f}, total={total\_score:.3f}, lenient\_passed={lenient\_passed}"
)
record\_aggregate\_prompt\_score(
prompt\_version=summarization\_prompt.current().version,
prompt\_text=summarization\_prompt.current().prompt,
model\_name=summarization\_prompt.current().model,
average\_score=average\_score,
total\_score=total\_score,
)
update\_best\_candidate(
average\_score=average\_score,
prompt\_text=summarization\_prompt.current().prompt,
model\_name=summarization\_prompt.current().model,
summary\_text=summary,
metadata={
"section": section\_number,
"average\_score": average\_score,
"grader\_results": grader\_scores,
"prompt\_version": summarization\_prompt.current().version,
},
lenient\_passed=lenient\_passed,
prompt\_version=summarization\_prompt.current().version,
)
if lenient\_passed:
optimization\_success = True
print(f" Passed with prompt v{summarization\_prompt.current().version}")
break
print(" Failed eval. Improving prompt...")
eval\_feedback = collect\_grader\_feedback(grader\_scores)
metaprompt\_result = await Runner.run(
metaprompt\_agent,
input=METAPROMPT\_TEMPLATE.format(
original\_prompt=summarization\_prompt.current().prompt,
section=section,
summary=summary,
reasoning=eval\_feedback,
),
)
improved\_prompt = metaprompt\_result.final\_output
summarization\_prompt.update(
new\_prompt=improved\_prompt,
metadata={"section": section, "summary": summary},
)
summarization\_agent = make\_summarization\_agent(summarization\_prompt.current())
print(f" Prompt improved → v{summarization\_prompt.current().version}")
if not optimization\_success:
print(
" All attempts failed; keeping latest prompt version "
f"v{summarization\_prompt.current().version} for the next section."
)
summarization\_agent = apply\_best\_candidate\_if\_needed()
print("" + "-" \* 80)
print("Completed optimization loop.")
print(f"Final prompt version: v{summarization\_prompt.current().version}")
if best\_candidate["score"] \> float("-inf"):
print(
f"Best lenient prompt: v{best\_candidate.get('version')} (avg={best\_candidate['score']:.3f})"
)
aggregate\_best = select\_best\_aggregate\_prompt()
if aggregate\_best:
per\_section = (
aggregate\_best.get("total\_average", 0.0) / aggregate\_best.get("count", 1)
if aggregate\_best.get("count")
else 0.0
)
print(
f"Aggregate best prompt: v{aggregate\_best.get('version')} "
f"(total={aggregate\_best.get('total\_score', 0.0):.3f}, avg/section={per\_section:.3f}, model={aggregate\_best.get('model', 'unknown')})"
)
print(f"Final prompt:{summarization\_prompt.current().prompt}")
return summarization\_agent
summarization\_agent = await self\_evolving\_loop(summarization\_agent)`
```
**How the final prompt is chosen**
* Every evaluation logs the average grader score, the total score across graders, and whether the attempt passed the lenient criteria.
* `best\_candidate` tracks the most recent lenient pass (for transparency), but the final selection uses the aggregate totals to ensure we keep the top-performing prompt overall.
* When the loop ends, `apply\_best\_candidate\_if\_needed` restores the prompt with the highest cumulative grader score (ties favor the latest version), guaranteeing that the surfaced prompt is the strongest performer observed.
Here is an example (abridged) output for the code above.
Inspecting the output shows that the self evolving prompt worked. There are a few takeaways to account for:
1. The optimization is not always successful, so being able to roll back the prompt version is important
2. The fidelity of the information from the graders is crucially important to ensuring a quality optimization
## Starting self-evolving loop | Initial prompt v0
Prompt:You are a summarization assistant.
Given a section of text, produce a summary.
## [Section 7.1] Using prompt v0
Attempt 1: evaluating summary…
Scores — avg=0.805, total=3.218, lenient\_passed=False
Failed eval. Improving prompt…
Prompt improved → v1
Attempt 2: evaluating summary…
Scores — avg=0.720, total=2.881, lenient\_passed=False
Failed eval. Improving prompt…
Prompt improved → v2
Attempt 3: evaluating summary…
Scores — avg=0.762, total=3.048, lenient\_passed=True
Passed with prompt v2
[Section 7.2] Using prompt v2
Attempt 1: evaluating summary…
Scores — avg=0.612, total=2.450, lenient\_passed=False
Failed eval. Improving prompt…
Prompt improved → v3
Attempt 2: evaluating summary…
Scores — avg=0.915, total=3.660, lenient\_passed=True
Passed with prompt v3
[Section 3.2.P.2.1] Using prompt v3
Attempt 1: evaluating summary…
Scores — avg=0.684, total=2.736, lenient\_passed=False
Failed eval. Improving prompt…
Prompt improved → v4
Attempt 2: evaluating summary…
Scores — avg=0.684, total=2.736, lenient\_passed=False
Failed eval. Improving prompt…
Prompt improved → v5
Attempt 3: evaluating summary…
Scores — avg=0.920, total=3.680, lenient\_passed=True
Passed with prompt v5
[Section 3.2.P.2.2] Using prompt v5
Attempt 1: evaluating summary…
Scores — avg=0.737, total=2.950, lenient\_passed=True
Passed with prompt v5
[Section 3.2.P.2.3] Using prompt v5
Attempt 1: evaluating summary…
Scores — avg=0.750, total=3.000, lenient\_passed=True
Passed with prompt v5
Completed optimization loop.
Final prompt version: v5
Best lenient prompt: v5 (avg=0.750)
Aggregate best prompt: v5 (total=9.630, avg/section=0.802)
Final prompt:**Optimized Technical Summarization System Prompt**
You are a technical summarization assistant specialized in scientific and regulatory documents. Your objective is to generate a summary that preserves every explicit detail and organizational structure from the source text, without any paraphrasing, omission, or synthesis.
**Strict Summarization Guidelines:**
**1. Comprehensive Detail Inclusion:**
* Transcribe all named compounds, salts, excipients, drug substances, molecular designations, batch codes, identifiers, and CAS numbers exactly as written.
* Include every stated concentration, unit, measurement, quantitative value, compositional detail, and preparatory parameter verbatim and in original format.
* Accurately replicate all descriptions of appearance, color, physical state, rationale for inclusion, and labeling or typographical conventions present in the source.
* Clearly include all section titles, headings, subsections, hierarchical numbering, referenced sections, and in-line citations or figures.
**2. Prohibited Actions:**
* Do NOT paraphrase, summarize, interpret, synthesize, restructure, generalize, or alter any information at any level.
* Do NOT omit, compress, merge, or reorder any data point, named entity, technical term, or explicit instruction from the source.
* Do NOT introduce additional content, inference, or editorial clarification.
**3. Structural and Formatting Requirements:**
* Maintain verbatim order, sectioning, and hierarchy from the source text, including all original lists, bullet points, numbering, or formatting.
* Reproduce every element in the precise sequence, alignment, and structure as the input, ensuring maximal traceability.
* If the source uses lists, tables, subpoints, or hierarchies, mirror them exactly.
**4. Precision, Fidelity, and Reviewability:**
* Your summary must enable full regulatory or technical audit by containing every explicit detail, designation, and measurement from the original—unaltered and unabridged.
* The output must be comprehensive, exhaustive, and identical in informational content and structure to the input. Every visible explicit detail must be present.
**Output Instruction:**
Begin summarization after this message, applying the above rules without exception. Each output must be concise in format but all-inclusive in content, reflecting every explicit fact, designation, and organizational feature of the source text, and suitable for regulatory or expert review. No interpretation, paraphrasing, or omission is permitted under any circumstance.
### Agent Logs & Tracing
We can view optimization workflow runs in the dashboard under logs:
*Figure 10 - Agent log traces showing optimization workflow runs in the dashboard.*
And drill down into the different agent calls:
*Figure 11 - Detailed agent trace showing individual agent calls and execution flow.*
### Continuous Monitoring
Once the evaluation loop is complete, the system should continue to monitor new incoming data and periodically re-evaluate model performance on blind datasets. This ensures the model remains accurate and compliant as the data distribution evolves.
To enable continuous monitoring, you can integrate a cron job or a lightweight scheduler loop that periodically checks for updates in your data source (e.g., new PDF uploads or database entries). When new data is detected, the system automatically triggers the evaluation and optimization loop described earlier.
For example (pseudo code):
```
`# this cell is pseudo-code and not meant to be run as-is
import time
def continuous\_monitoring(interval\_hours=24):
"""Periodically check for new data and trigger the evaluation loop."""
while True:
print("Checking for new data...")
if new\_data\_detected():
print("New data found — running evaluation and optimization loop.")
self\_evolving\_loop()
else:
print("No new data. Sleeping until next cycle.")
time.sleep(interval\_hours \* 3600)
continuous\_monitoring(interval\_hours=24)`
```
This approach allows the model to continuously learn and adapt, improving over time as it processes fresh data — a key requirement for maintaining high-quality, real-world performance.
## 4. Going Further
### a. Model Evaluation
We now have a fully automated loop improving our prompt with **evals** and accepting the new prompt when the rating is over the defined threshold.
In production, you could use a similar framework to monitor the performance of your agents as new user requests come in.
As mentioned above, this is a simplified example, and in a real-world scenario you’d want to have additional guardrails and a human-in-the-loop approach to approve new prompts.
Taking this concept further, we can also use evals to test different model parameter candidates such as the model version, verbosity, and reasoning. To see the full available set of parameters that could considered, check the [ModelSettings class in the Agents SDK](https://openai.github.io/openai-agents-python/ref/model_settings/#agents.model_settings.ModelSettings)
The `compare\_model\_candidates` function is an example of how to:
1. Optimize the prompt
2. Generate candidate outputs from the optimized prompt using two or more different models
3. Use evals to grade the candidate outputs and select the best candidate
It can be worked into the `self\_evolving\_loop` function with minimal refactoring.
>
**> NOTE:
**> Production testing of model versions should be limited to versions within the same family version (e.g. gpt-5, gpt-5-mini, gpt-5-nano). It is recommended to conduct cross family version selection pre-production deployment.
>
And the final `self\_evolving\_loop` with model comparison code:
```
`from agents import Agent, Runner
async def eval\_agent\_candidate(agent: Agent, section: str, prompt\_text: str, model\_name: str):
summary\_result = await Runner.run(agent, section)
summary = summary\_result.final\_output
scores = await get\_eval\_grader\_score(
eval\_id=EVAL\_ID, summary=summary, section=section
)
average = calculate\_grader\_score(scores)
lenient\_passed = is\_lenient\_pass(scores, average)
passed = all(entry.get("passed") is True for entry in scores)
update\_best\_candidate(
average\_score=average,
prompt\_text=prompt\_text,
model\_name=model\_name,
summary\_text=summary,
metadata={
"section": section,
"average\_score": average,
"grader\_results": scores,
},
lenient\_passed=lenient\_passed,
)
return {"summary": summary, "scores": scores, "average": average, "passed": passed}
async def compare\_model\_candidates(
summarization\_prompt,
eval\_feedback: str,
section: str,
summary: str,
model\_candidates=None,
):
"""Improve the prompt, evaluate it across candidate models, and adopt the top performer."""
if model\_candidates is None:
model\_candidates = ["gpt-5", "gpt-5-mini"]
metaprompt\_result = await Runner.run(
metaprompt\_agent,
input=METAPROMPT\_TEMPLATE.format(
original\_prompt=summarization\_prompt.current().prompt,
section=section,
summary=summary,
reasoning=eval\_feedback,
),
)
improved\_prompt = metaprompt\_result.final\_output
async def evaluate\_model(model\_name: str):
candidate\_agent = Agent(
name=f"SummarizationAgent:{model\_name}",
instructions=improved\_prompt,
model=model\_name,
)
result = await eval\_agent\_candidate(candidate\_agent, section, improved\_prompt, model\_name)
return model\_name, candidate\_agent, result
best = {
"average": float("-inf"),
"passed": False,
"agent": None,
"model": None,
"summary": None,
}
tasks = [asyncio.create\_task(evaluate\_model(model\_name)) for model\_name in model\_candidates]
for task in asyncio.as\_completed(tasks):
model\_name, candidate\_agent, result = await task
print(
f"Candidate average — {model\_name}: {result['average']:.4f} "
f"(passed={result.get('passed', False)})"
)
if result["average"] \> best["average"]:
best.update(
{
"average": result["average"],
"model": model\_name,
"summary": result.get("summary"),
"agent": candidate\_agent,
"passed": result.get("passed", False),
}
)
for task in tasks:
if not task.done():
task.cancel()
if best["passed"] and best["model"]:
summarization\_prompt.update(
new\_prompt=improved\_prompt,
model=best["model"],
metadata={"section": section, "summary": best["summary"]},
)
print(f"Updated summarization\_prompt with passing model: {best['model']}")
return make\_summarization\_agent(summarization\_prompt.current())
print(
f"No passing models. Best candidate (model={best['model']}, "
f"avg={best['average']:.4f}) did not pass. Prompt not updated."
)
return None
async def self\_evolving\_loop\_with\_model\_comparison(summarization\_agent: Agent) -\> Agent:
print(
f"Starting self-evolving loop | Initial prompt v{summarization\_prompt.current().version}"
)
print(f"Prompt: {summarization\_prompt.current().prompt}")
print(f"Model: {summarization\_prompt.current().model}")
print("-" \* 80)
reset\_best\_trackers()
df = pd.read\_csv("data/dataset.csv")
with trace("Self-evolving Optimization Workflow: model comparison"):
for \_, row in df.head(5).iterrows():
content = row.get("content")
if pd.isna(content) or (isinstance(content, str) and not content.strip()):
continue
section\_number = str(row["section\_number"])
section = str(content)
current\_version = summarization\_prompt.current().version
print(f"[Section {section\_number}] Using prompt v{current\_version}")
summary\_passed = False
for attempt in range(1, MAX\_OPTIMIZATION\_RETRIES + 1):
print(f"\\tAttempt {attempt}: evaluating summary...")
summary\_result = await Runner.run(summarization\_agent, section)
summary = summary\_result.final\_output
grader\_scores = await get\_eval\_grader\_score(
eval\_id=EVAL\_ID, summary=summary, section=section
)
average\_score = calculate\_grader\_score(grader\_scores)
total\_score = calculate\_total\_grader\_score(grader\_scores)
lenient\_passed = is\_lenient\_pass(grader\_scores, average\_score)
print(
f"\\tScores — avg={average\_score:.3f}, total={total\_score:.3f}, lenient\_passed={lenient\_passed}"
)
record\_aggregate\_prompt\_score(
prompt\_version=summarization\_prompt.current().version,
prompt\_text=summarization\_prompt.current().prompt,
model\_name=summarization\_prompt.current().model,
average\_score=average\_score,
total\_score=total\_score,
)
update\_best\_candidate(
average\_score=average\_score,
total\_score=total\_score,
prompt\_text=summarization\_prompt.current().prompt,
model\_name=summarization\_prompt.current().model,
summary\_text=summary,
metadata={
"section": section\_number,
"average\_score": average\_score,
"grader\_results": grader\_scores,
"prompt\_version": summarization\_prompt.current().version,
},
lenient\_passed=lenient\_passed,
prompt\_version=summarization\_prompt.current().version,
)
if lenient\_passed:
summary\_passed = True
print(
f"\\tPassed with prompt v{summarization\_prompt.current().version} (model={summarization\_prompt.current().model})"
)
break
print("\\tFailed eval. Improving prompt...")
eval\_feedback = collect\_grader\_feedback(grader\_scores)
new\_agent = await compare\_model\_candidates(
summarization\_prompt=summarization\_prompt,
eval\_feedback=eval\_feedback,
section=section,
summary=summary,
# model\_candidates could be given as an argument if you want to expand options.
)
if new\_agent is None:
print(
"\\tNo passing model found. Optimization failed for this section."
)
summary\_passed = False
else:
summarization\_agent = new\_agent
summary\_passed = True
print(
f"\\tPrompt improved → v{summarization\_prompt.current().version} "
f"(model={summarization\_prompt.current().model})"
)
break
if not summary\_passed:
print(
"\\tAll attempts failed; keeping latest prompt version "
f"v{summarization\_prompt.current().version} (model={summarization\_prompt.current().model}) for the next section."
)
summarization\_agent = apply\_best\_candidate\_if\_needed()
print("" + "-" \* 80)
print("Completed optimization loop.")
print(f"Final prompt version: v{summarization\_prompt.current().version}")
print(f"Final model: {summarization\_prompt.current().model}")
aggregate\_best = select\_best\_aggregate\_prompt()
if best\_candidate["score"] \> float("-inf"):
print(
f"Best lenient prompt: v{best\_candidate.get('version')} (avg={best\_candidate['score']:.3f}, model={best\_candidate.get('model', 'unknown')})"
)
if aggregate\_best:
per\_section = (
aggregate\_best.get("total\_average", 0.0) / aggregate\_best.get("count", 1)
if aggregate\_best.get("count")
else 0.0
)
print(
f"Aggregate best prompt: v{aggregate\_best.get('version')} "
f"(total={aggregate\_best.get('total\_score', 0.0):.3f}, avg/section={per\_section:.3f}, model={aggregate\_best.get('model', 'unknown')})"
)
print(f"Final prompt: {summarization\_prompt.current().prompt}")
print(f"Final model: {summarization\_prompt.current().model}")
return summarization\_agent
summarization\_agent = await self\_evolving\_loop\_with\_model\_comparison(summarization\_agent)`
```
Here we can see a very similar output with additional information on the model version scores:
Starting self-evolving loop | Initial prompt v0
Prompt:
You are a summarization assistant.
Given a section of text, produce a concise, accurate summary.
[…]
[Section 3.2.P.2.2] Using prompt v2
Attempt 1: evaluating summary…
Failed eval. Improving prompt…
Candidate average — gpt-5: 0.3533 (passed=False)
Candidate average — gpt-5-mini: 0.4670 (passed=False)
No passing models. Best candidate (model=gpt-5-mini, avg=0.4670) did not pass. Prompt not updated.
No passing model found. Optimization failed for this section.
Attempt 2: evaluating summary…
Exceeded retries, aborting
Passed with prompt v2
Completed optimization loop.
Final prompt version: v2
Final prompt:
**Improved Prompt:**
You are a summarization assistant.
Given any section of text, generate a concise and accurate summary that includes all key concepts, components, and their main characteristics or interactions as described in the original section. Your summary should be brief yet complete, faithfully reflecting essential information, descriptors, and relationships between elements while omitting unnecessary details. Ensure the summary maintains the original meaning and captures all critical content and terminology relevant to the section.
### b. Prompt Optimization with Genetic-Pareto (GEPA)
We’ve demonstrated that the self-evolving loop works and that a prompt can be improved autonomously using Evals. However, we relied on a relatively straightforward, static metaprompt to improve our system prompt. In this section, we explore a more dynamic and reflexive method by using Genetic-Pareto (GEPA) [[1]](##Citations) — a framework that samples agent trajectories, reflects on them in natural language, proposes prompt revisions, and evolves the system through iterative feedback loops.
The GEPA method, described in the paper available [here](https://doi.org/10.48550/arXiv.2507.19457), offers an compelling blueprint for continuous, self-improving prompt optimization. The code below draws generously on the GEPA Github repository available [here](https://github.com/gepa-ai/gepa).
```
`import pandas as pd
import gepa
from gepa import EvaluationBatch
# Extract sections from dataset
def read\_csv\_content(file\_path: str) -\> list[dict]:
"""Read csv and return section to summarize."""
df = pd.read\_csv(file\_path)
return [{'content': content} for content in df['content'].tolist()]
# Split dataset into training and validation sets
trainset = read\_csv\_content("data/dataset.csv")
val\_cut = max(1, int(0.1 \* len(trainset)))
valset = trainset[:val\_cut] if len(trainset) \> 1 else trainset`
```
We’ll reuse our graders and helper functions by adding a small adapter so that our setup works with GEPA. GEPA’s `GEPAAdapter` makes it easy to plug into our eval framework. We defined three hooks
* `evaluate`: runs the summarization and grades with graders defined in the previous section (i.e., chemical\_name\_grader, word\_length\_deviation\_grader, cosine\_similarity, llm\_as\_judge).
* `get\_components\_to\_update`: gets the text fields GEPA should evolve (here, system\_prompt).
* `make\_reflective\_dataset`: packages inputs, outputs, and feedback for reflection.
```
`class EvalsBackedSummarizationAdapter:
"""
Minimal adapter for GEPA:
- evaluate(...) -\> EvaluationBatch (scores + outputs + feedback-rich trajectories)
- get\_components\_to\_update(...) returns the prompt to update
- make\_reflective\_dataset(...) packages examples for reflection
"""
propose\_new\_texts = None # use GEPA's default reflection flow
def \_\_init\_\_(self, client, eval\_id: str, gen\_model: str = "gpt-5", user\_prefix: str | None = None):
self.client = client
self.eval\_id = eval\_id
self.gen\_model = gen\_model
self.user\_prefix = user\_prefix or "Summarize:\\n\\n"
# Same summarization agent as in the previous section
def \_summarize(self, system\_prompt: str, section: str) -\> str:
resp = self.client.chat.completions.create(
model=self.gen\_model,
messages=[
{"role": "system", "content": system\_prompt},
{"role": "user", "content": f"{self.user\_prefix}{section}"},
],
)
return resp.choices[0].message.content.strip()
# Required by GEPA: run eval minibatch
def evaluate(self, inputs: list[dict], candidate: dict, capture\_traces: bool = True) -\> EvaluationBatch:
system\_prompt = candidate["system\_prompt"]
scores: list[float] = []
outputs: list[str] = []
trajectories: list[dict] = []
for item in inputs:
section = item["content"]
# 1) Generate with the candidate prompt
summary = self.\_summarize(system\_prompt, section)
outputs.append(summary)
# 2) Grade using previous evals pipeline
run = run\_eval(eval\_id=self.eval\_id, section=section, summary=summary)
out\_items = poll\_eval\_run(eval\_id=self.eval\_id, run\_id=run.id)
grader\_scores = parse\_eval\_run\_output(out\_items)
# 3) Score + actionable feedback
scalar = calculate\_grader\_score(grader\_scores)
feedback = collect\_grader\_feedback(grader\_scores) or "All graders passed; keep precision and coverage."
scores.append(float(scalar))
trajectories.append(
{
"inputs": {"section": section},
"generated\_output": summary,
"metrics": {
"combined": float(scalar),
"by\_grader": grader\_scores, # keeping for analysis if needed
},
"feedback": feedback,
}
)
return EvaluationBatch(scores=scores, outputs=outputs, trajectories=trajectories)
# Required by GEPA: text field to evolve
def get\_components\_to\_update(self, candidate: dict) -\> list[str]:
return ["system\_prompt"]
# Required by GEPA: build the reflective dataset the reflection LM will read
def make\_reflective\_dataset(self, candidate: dict, eval\_batch: EvaluationBatch, components\_to\_update: list[str]) -\> dict:
examples = []
for traj in (eval\_batch.trajectories or []):
examples.append(
{
"Inputs": {"section": traj["inputs"]["section"]},
"Generated Outputs": traj["generated\_output"],
"Feedback": traj["feedback"],
}
)
return {"system\_prompt": examples}`
```
Now that the adapter is ready, we can run GEPA using the same starting prompt (`"You are a summarization assistant. Given a section of text, produce a summary."`) and model (here, `gpt-5`) as in the earlier self-evolving loop for comparison. We provide our adapter instance, seed candidate, and training/validation sets to `gepa.optimize(...)`. During the optimization, GEPA repeatedly invokes the adapter to score candidates, reflects on feedback, and ultimately produces the best evolved prompt.
*Note: GEPA might take \~10-15 minutes to complete.*
```
`seed\_candidate = {"system\_prompt": "You are a summarization assistant. Given a section of text, produce a summary."}
adapter = EvalsBackedSummarizationAdapter(
client=client,
eval\_id=EVAL\_ID,
gen\_model=summarization\_prompt.current().model,
)
# Keeping max\_metric\_calls small for the cookbook.
# In practice, use a larger value to allow more optimization iterations.
result = gepa.optimize(
seed\_candidate=seed\_candidate,
trainset=trainset,
valset=valset,
adapter=adapter,
reflection\_lm="gpt-5",
max\_metric\_calls=10,
track\_best\_outputs=True,
display\_progress\_bar=True
)
best\_prompt = result.best\_candidate["system\_prompt"]
print("\\n=== Best evolved instruction ===\\n")
print(best\_prompt)`
```
Here is an example (abridged) output for the code above:
Iteration 0: Base program full valset score: 0.2183466466681351
Iteration 1: Selected program 0 score: 0.2183466466681351
Iteration 1: Proposed new text for system\_prompt:
[…]
Iteration 3: New subsample score 0.6592202195294341 is better than old score 0.6565039300893376. Continue to full eval and add to candidate pool.
GEPA Optimization: 90%|█████████ | 18/20 [39:21\<04:22, 131.19s/rollouts]
Iteration 3: Full valset score for new program: 0.2225472423976205
Iteration 3: Full train\_val score for new program: 0.2225472423976205
Iteration 3: Individual valset scores for new program: [0.22866548337721018, 0.21864704884895614, 0.2203291949666952]
Iteration 3: New valset pareto front scores: [0.23142100182952327, 0.2389098334382265, 0.23513790628541456]
Iteration 3: Full valset pareto front score: 0.2351562471843881
Iteration 3: Updated valset pareto front programs: [{1}, {1}, {1}]
Iteration 3: Best valset aggregate score so far: 0.2351562471843881
Iteration 3: Best program as per aggregate score on train\_val: 1
Iteration 3: Best program as per aggregate score on valset: 1
Iteration 3: Best score on valset: 0.2351562471843881
Iteration 3: Best score on train\_val: 0.2351562471843881
Iteration 3: Linear pareto front program index: 1
Iteration 3: New program candidate index: 2
=== Best evolved instruction ===
You are a domain-aware summarization assistant for technical pharmaceutical texts. Given a “section” of text, produce a concise summary that preserves key technical facts and exact nomenclature.
Requirements:
* Length and format:
* Write 1–3 sentences totaling about 45–70 words (never exceed 90 words). Default to \~60 words.
* Use a single paragraph (no bullet points, headings, or heavy formatting).
* Preserve exact technical names and notation:
* Include every chemical name that appears in the section at least once, with exact spelling, capitalization, isotopic labels, brackets, hyphens, salts, and buffer names (e.g., Hyperpolarized Pyruvate (13C) Injection; [1-13C]pyruvic acid; hyperpolarized [1-13C]pyruvate; 15 mM AH111501 sodium salt; TRIS/EDTA buffer solution).
* Keep study identifiers, section numbers, regulatory citations, and codes verbatim when mentioned (e.g., GE-101-001, GE-101-003, USP \<797\>, 3.2.P.7, company codes, CAS numbers).
…
Self-check before finalizing:
* Have you included every chemical name exactly as written?
* Is the summary within 45–70 words (≤90 max) and a single paragraph?
* Are key process/regulatory/test details and critical numbers preserved without unnecessary verbosity?
In this cookbook, we explored three distinct approaches to prompt optimization:
* **OpenAI Platform Optimizer:** using the *Optimize* button with a dataset containing manually entered human feedback (thumbs up/down and textual comments), we quickly produced a strong prompt with minimal configuration. This method excels at rapid iteration, but does not provide the automation needed for production environments.
* **Optimization using a static metaprompt:** Our loop, incorporating four different graders,enabled automated exploration and iterative self-improvement without manual intervention. However, its exploration space was limited by a single static meta-prompt, and evaluation was performed section by section. Consequently, this approach risked overfitting to immediate grader feedback instead of achieving broader generalization.
* **GEPA optimization:** Offering a more structured search process, reflective updates were informed by both quantitative scores and textual feedback, while candidates were trained on one dataset and validated on another. This method produced a more robust, generalized prompt and provided clearer empirical evidence of its performance.
*Note: Examples of prompts generated by each method are available in the Appendix.*
Depending on your use case, you may prioritize speed (OpenAI optimizer), lightweight automation (static metaprompt), or systematic generalization (GEPA). In practice, combining these methods by starting with rapid iteration and progressing toward reflective optimization can deliver both agility and performance.
Happy coding!
## Contributors
This cookbook is based on a joint collaboration between [Bain](www.bain.com) and [OpenAI](openai.com).
[Calvin Maguranis](https://www.linkedin.com/in/calvin-maguranis-b9956045/)
[Fanny Perraudeau](https://www.linkedin.com/in/fanny-sabran-perraudeau-494b7573/)
[Giorgio Saladino](https://www.linkedin.com/in/giorgio-saladino-202/)
[Shikhar Kwatra](https://www.linkedin.com/in/shikharkwatra/)
[Valentina Frenkel](https://www.linkedin.com/in/valentina-frenkel/)
## Citations
[1] *GEPA: Reflective Prompt Evolution Can Outperform Reinforcement Learning* by Lakshya A Agrawal, Shangyin Tan, Dilara Soylu, Noah Ziems, Rishi Khare, Krista Opsahl-Ong, Arnav Singhvi, Herumb Shandilya, Michael J Ryan, Meng Jiang, Christopher Potts, Koushik Sen, Alexandros G. Dimakis, Ion Stoica, Dan Klein, Matei Zaharia, Omar Khattab - [https://arxiv.org/abs/2507.19457](https://arxiv.org/abs/2507.19457)
## Appendix
### Examples of output prompts:
* **Initial prompt:**
```
`You are a summarization assistant. Given a section of text, produce a summary.`
```
* **OpenAI Platform Optimizer:**
```
`You are a summarization assistant.
Task: Summarize the provided text concisely and accurately.
Output requirements:
- Output only the summary. Do not add titles, labels (e.g.,
"Summary:"), prefaces, or commentary.
- Preserve the document's structure. If multiple sections/subsections appear, summarize each one.
- Use a numbered list for sections/subsections (use their numbers/titles when present).
- Under each, use short dash bullets for key points.
- If there is only a single short section, return a brief bullet list or 1-2 concise sentences.
- Split any inline lists into separate bullets.
- Use plain, simple language. Keep bullets tight (ideally one line each). Remove redundancy.
- Include important quantitative details (values, units, conditions) and constraints. Do not invent information.
- Keep formatting simple: plain text, "1." numbering and "-" bullets only. No tables or special markup.
- Retain exact technical terms/notation from the source (e.g., chemical names, isotopic labels).
- If a section is explicitly marked "Not applicable," include that status; otherwise do not add it.`
```
* **Static metaprompt:**
```
`You are a technical summarization assistant for scientific and regulatory documentation. Your task is to generate a concise, comprehensive, and fully detailed summary of any scientific, technical, or regulatory text provided. Strictly adhere to the following instructions:
---
\*\*1. Complete and Exact Information Inclusion\*\*
- Capture \*every\* explicit fact, technical value, specification, quantity, measurement, regulatory reference, entity, process, site, and contextual detail verbatim from the source text.
- Do not omit or generalize any explicit information, no matter how minor.
\*\*2. Precise Terminology and Named Entity Retention\*\*
- Reproduce all names of chemicals, drugs, mixtures, buffer components, devices, companies, institutions, regulatory standards, section numbers, and procedural labels \*exactly as stated\*.
- Report all quantities, measurements, concentrations, ratios, masses, volumes, compositions, pH values, and units precisely as given.
- Do not paraphrase, rename, substitute, or simplify any term or value.
\*\*3. All Procedural Details and Justifications\*\*
- Explicitly include all described procedures, technical processes (e.g., terminal sterilization, aseptic processing), operational constraints, process justifications, compliance requirements, and standards references.
- Clearly state all reasons provided for choosing or omitting particular methods or processes.
\*\*4. Regulatory and Compliance References\*\*
- Accurately cite all regulations, standards (e.g., USP \<797\>), compliance statements, section numbers, and cross-references as in the original.
- Include all explicit mentions of compliance, applicability, and site location details.
\*\*5. Explicit Statements of Absence, Limitations, and Applicability\*\*
- Clearly state any declarations of absence, inapplicability (“Not applicable”), or limitations exactly as written in the source.
\*\*6. Structural and Organizational Fidelity\*\*
- Precisely reflect the original document’s section and subsection hierarchy, using clear section labels and indentation.
- Present all enumerations, lists, and tabulated data in structured bullet-point or numbered format, organized in accordance with the source document’s arrangement.
\*\*7. No Paraphrasing, Summarizing, or Reinterpretation\*\*
- Do \*not\* paraphrase, summarize contextually, reinterpret, or alter the meaning or sequence of any content.
- Remove only literal repetitions or redundant phrasing; otherwise, preserve all explicit statements, technical details, and contextual notes.
---
\*\*Summary Output Objective:\*\*
Produce a summary that delivers the full technical, factual, and regulatory content and structure of the original text, reformatted by eliminating only redundant language. The summary must enable audit, regulatory review, or peer reference without loss of any explicit information or terminology from the source.
---
\*Apply these instructions rigorously to every provided document section to ensure scientific and regulatory accuracy and completeness.\*`
```
* **GEPA optimizer**:
```
`You are a domain-aware summarization assistant for technical pharmaceutical texts. Given a “section” of text, produce a concise, single-paragraph summary that preserves key technical facts and exact nomenclature.
Length and format
- Write 1–3 sentences totaling about 45–70 words (target \~60; never exceed 90).
- Use one paragraph; no bullets, headings, tables, or heavy formatting.
Exact names and notation
- Include every chemical name that appears in the section at least once, using the exact original spelling, capitalization, punctuation, isotopic labels, brackets, hyphens, salts, buffer names, and parenthetical qualifiers. Treat distinct case/format variants as distinct names (e.g., [1-13C]pyruvic acid and [1-13C]Pyruvic acid are separate and each must appear once).
- Examples you must preserve verbatim when present: Hyperpolarized Pyruvate (13C) Injection; non-polarized Pyruvate Injection; Pyruvate (13C) Injection; hyperpolarized [1-13C]pyruvate; Mixture of [1-13C]pyruvic acid and 15 mM AH111501 sodium salt; TRIS/EDTA buffer solution; TRIS; NaOH; Na2EDTA; [1-13C]pyruvic acid; AH111501 sodium salt.
- Also preserve exact study identifiers, batch codes, section numbers, regulatory citations, and instrument parameters as written (e.g., GE-101-001, GE-101-003, USP \<797\>, 3.2.P.5.2.5, FFF106/140-806, FFF106/142-806, 3T MRI, 5 degree RF pulse, TR=3s, 90 degree pulse, 64 averages, TR=10s, 10 μl Gd/ml solution).
Content prioritization (if space is tight)
1) What the section is about (topic/purpose).
2) All named chemical entities and compositions (list all chemical names at least once; include concentrations/amounts if given).
3) Critical process/handling facts (e.g., aseptic processing vs terminal sterilization; ISO classifications; filtration specs; compounding/filling steps; temperatures/times/volumes; storage/administration limits).
4) Container/packaging specifics (e.g., cryovials, “sterile fluid path”).
5) Microbiological/testing/regulatory details (e.g., sterility/pyrogenicity testing timing; USP \<797\>; state board compliance; site/manufacturer if stated).
6) Overages/single-dose formulas and key quantities.
Numerical fidelity
- Preserve all critical numbers and units exactly (e.g., 1.44 g, 27.7 mg, 15 mM, 18 mL, 1.47 g, two 0.2 μm filters, ISO 7, ISO 5, 38 mL).
- Include testing/analysis parameters when present (e.g., polarization/relaxation time (T1); number of spectra; pulse angles; TR values; MRI location relative to clean room).
Style and compression
- Be neutral and factual; do not infer unstated information.
- Consolidate repeated statements; compress lists with commas/semicolons to save words.
- Mention tables/figures only to convey key data; do not reproduce them.
- If many chemicals are present, ensure each distinct name appears once; group them succinctly.
- Avoid symbols or special formatting not in the source text.
Common domain cues to include when present
- Aseptic processing vs terminal sterilization and the rationale/timing (e.g., “tested for sterility and pyrogenicity subsequent to patient administration”).
- Environmental/processing controls (ISO 7/ISO 5; LAF unit; filtration; filling/weight targets per cryovial).
- Site/regulatory context (e.g., USP \<797\>; California State Board of Pharmacy; University of California, San Francisco Department of Clinical Pharmacy).
- Study/kit equivalence statements (e.g., equivalence to GE-101-001/GE-101-003 formulations).
- QC/measurement methods (e.g., capacitive threshold at Administration syringe nominal 38 mL).
Self-check before finalizing
- Does the paragraph contain every distinct chemical name exactly as written in the section (including case and notation variants)?
- Is the summary 45–70 words (≤90), in a single paragraph?
- Are the most critical process/regulatory/testing details and all key numbers preserved without unnecessary verbosity?``
```