Eval Driven System Design - From Prototype to Production
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
Jun 2, 2025
# Eval Driven System Design - From Prototype to Production
[ SK ](https://www.linkedin.com/in/shikharkwatra/)[ HW ](<https://github.com/Hugh Wimberly>)[ JM ](<https://github.com/Joshua Marker>)[ ES ](<https://github.com/Eddie Siegel>)
[ Shikhar Kwatra
(OpenAI)
, ](https://www.linkedin.com/in/shikharkwatra/)[ Hugh Wimberly , ](<https://github.com/Hugh Wimberly>)[ Joshua Marker , ](<https://github.com/Joshua Marker>)[ Eddie Siegel ](<https://github.com/Eddie Siegel>)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/partners/eval_driven_system_design/receipt_inspection.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/partners/eval_driven_system_design/receipt_inspection.ipynb)
## Overview
### Purpose of This Cookbook
This cookbook provides a **practical**, end-to-end guide on how to effectively use
evals as the core process in creating a production-grade autonomous system to
replace a labor-intensive human workflow. It’s a direct product of collaborative
experience dealing with projects where users may not have started with pristine
labeled data or a perfect understanding of the problem - two issues that most tutorials gloss
over but are in practice almost always serious challenges.
Making evals the core process prevents poke-and-hope guesswork and impressionistic
judgments of accuracy, instead demanding engineering rigor. This means we can make
principled decisions about cost trade-offs and investment.
### Target Audience
This guide is designed for ML/AI engineers and Solution Architects who are
looking for practical guidance beyond introductory tutorials. This notebook is fully
executable and organized to be as modular as possible to support using code
samples directly in your own applications.
### Guiding Narrative: From Tiny Seed to Production System
We’ll follow a realistic storyline: replacing a manual receipt-analysis service for validating expenses.
* **Start Small:** Begin with a very small set of labeled data (retail receipts). Many businesses don’t have good ground truth data sets.
* **Build Incrementally:** Develop a minimal viable system and establish initial evals.
* **Business Alignment:** Evaluate eval performance in the context of business KPIs and
dollar impact, and target efforts to avoid working on low-impact improvements.
* **Eval-Driven Iteration:** Iteratively improve by using eval scores to power model
improvements, then by using better models on more data to expand evals and identify more
areas for improvement.
### How to Use This Cookbook
This cookbook is structured as an eval-centric guide through the lifecycle of building
an LLM application.
1. If you’re primarily interested in the ideas presented, read through the text and skim over
the code.
2. If you’re here because of something else you’re working on, you can go ahead and jump to that
section and dig into the code there, copy it, and adapt it to your needs.
3. If you want to really understand how this all works, download this notebook and run
the cells as you read through it; edit the code to make your own changes, test your
hypotheses, and make sure you actually understand how it all works together.
>
> Note: If your OpenAI organization has a Zero Data Retention (ZDR) policy, Evals will still be available, but will retain data to maintain application state.
>
## Use Case: Receipt Parsing
In order to condense this guide we’ll be using a small hypothetical problem that’s still complex
enough to merit detailed and multi-faceted evals. In particular, we’ll be focused on how
to solve a problem given a limited amount of data to work with, so we’re working with a
dataset that’s quite small.
### Problem Definition
For this guide, we assume that we are starting with a workflow for reviewing and filing
receipts. While in general, this is a problem that already has a lot of established
solutions, it’s analogous to other problems that don’t have nearly so much prior work;
further, even when good enterprise solutions exist there is often still a
“last mile” problem that still requires human time.
In our case, we’ll assume we have a pipeline where:
* People upload photos of receipts
* An accounting team reviews each receipt to categorize and approve or audit the expense
Based on interviews with the accounting team, they make their decisions based on
1. Merchant
2. Geographic location
3. Expense amount
4. Items or services purchased
5. Handwritten notes or annotations
Our system will be expected to handle most receipts without any human intervention, but
escalate low-confidence decisions for human QA. We’ll be focused on reducing the total
cost of the accounting process, which is dependent on
1. How much the previous / current system cost to run per-receipt
2. How many receipts the new system sends to QA
3. How much the system costs to run per-receipt, plus any fixed costs
4. What the business impact is of mistakes, either receipts kicked out for review or mistakes missed
5. The cost of engineering to develop and integrate the system
### Dataset Overview
The receipt images come from the CC by 4.0 licensed
[Receipt Handwriting Detection Computer Vision Project](https://universe.roboflow.com/newreceipts/receipt-handwriting-detection)
dataset published by Roboflow. We’ve added our own labels and narrative spin in order to
tell a story with a small number of examples.
## Project Lifecycle
Not every project will proceed in the same way, but projects generally have some
important components in common.
The solid arrows show the primary progressions or steps, while the dotted line
represents the ongoing nature of problem understanding - uncovering more about
the customer domain will influence every step of the process. We wil examine
several of these iterative cycles of refinement in detail below.
Not every project will proceed in the same way, but projects generally have some common
important components.
### 1. Understand the Problem
Usually, the decision to start an engineering process is made by leadership who
understand the business impact but don’t need to know the process details. In our
example, we’re building a system designed to replace a non-AI workflow. In a sense this
is ideal: we have a set of domain experts, *the people currently doing the task* who we
can interview to understand the task details and who we can lean upon to help develop
appropriate evals.
This step doesn’t end before we start building our system; invariably, our initial
assessments are an incomplete understanding of the problem space and we will continue to
refine our understanding as we get closer to a solution.
### 2. Assemble Examples (Gather Data)
It’s very rare for a real-world project to begin with all the data necessary to achieve a satisfactory solution, let alone establish confidence.
In our case, we’ll assume we have a decent sample of system *inputs*, in the form of but receipt images, but start without any fully annotated data. We find this is a not-unusual situation when automating an existing process. We’ll walk through the process of incrementally expanding our test and training sets in collaboration with domain experts as we go along and make our evals progressively more comprehensive.
### 3. Build an End-to-End V0 System
We want to get the skeleton of a system built as quickly as possible. We don’t need a
system that performs well - we just need something that accepts the right inputs and
provides outputs of the correct type. Usually this is almost as simple as describing the
task in a prompt, adding the inputs, and using a single model (usually with structured
outputs) to make an initial best-effort attempt.
### 4. Label Data and Build Initial Evals
We’ve found that in the absence of an established ground truth, it’s not uncommon to
use an early version of a system to generate ‘draft’ truth data which can be annotated
or corrected by domain experts.
Once we have an end-to-end system constructed, we can start processing the inputs we
have to generate plausible outputs. We’ll send these to our domain experts to grade
and correct. We will use these corrections and conversations about how the experts
are making their decisions to design further evals and to embed expertise in the system.
### 5. Map Evals to Business Metrics
Before we jump into correcting every error, we need to make sure that we’re investing
time effectively. The most critical task at this stage is to review our evals and
gain an understanding of how they connect to our key objectives.
* Step back and assess the potential costs and benefits of the system
* Identify which eval measurements speak directly to those costs and benefits
* For example, what does “failure” on a particular eval cost? Are we measuring
something worthwhile?
* Create a (non-LLM) model that uses eval metrics to provide a dollar value
* Balance performance (accuracy, or speed) with cost to develop and run
### 6. Progressively Improve System and Evals
Having identified which efforts are most worth making, we can begin iterating on
improvements to the system. The evals act as an objective guide so we know when we’ve
made the system good enough, and ensure we avoid or identify regression.
### 7. Integrate QA Process and Ongoing Improvements
Evals aren’t just for development. Instrumenting all or a portion of a production
service will surface more useful test and training samples over time, identifying
incorrect assumptions or finding areas with insufficient coverage. This is also the only
way you can ensure that your models continue performing well long after your initial
development process is complete.
## V0 System Construction
In practice, we would probably be building a system that operates via a REST API,
possibly with some web frontend that would have access to some set of components and
resources. For the purposes of this cookbook, we’ll distill that down to a pair of
functions, `extract\_receipt\_details` and `evaluate\_receipt\_for\_audit` that collectively
decide what we should do with a given receipt.
* `extract\_receipt\_details` will take an image as input and produce structured output
containing important details about the receipt.
* `evaluate\_receipt\_for\_audit` will take that structure as input and decide whether or
not the receipt should be audited.
>
> Breaking up a process into steps like this has both pros and cons; it is easier to> examine and develop if the process is made up of small isolated steps. But you can> progressively lose information, effectively letting your agents play “telephone”. In> this notebook we break up the steps and don’t let the auditor see the actual receiptbecause it’s more instructive for the evals we want to discuss.
>
We’ll start with the first step, the literal data extraction. This is *intermediate*
data: it’s information that people would examine implicitly, but often isn’t recorded.
And for this reason, we often don’t have labeled data to work from.
```
`%pip install --upgrade openai pydantic python-dotenv rich persist-cache -qqq
%load\_ext dotenv
%dotenv
# Place your API key in a file called .env
# OPENAI\_API\_KEY=sk-...`
```
### Structured Output Model
Capture the meaningful information in a structured output.
```
`from pydantic import BaseModel
class Location(BaseModel):
city: str | None
state: str | None
zipcode: str | None
class LineItem(BaseModel):
description: str | None
product\_code: str | None
category: str | None
item\_price: str | None
sale\_price: str | None
quantity: str | None
total: str | None
class ReceiptDetails(BaseModel):
merchant: str | None
location: Location
time: str | None
items: list[LineItem]
subtotal: str | None
tax: str | None
total: str | None
handwritten\_notes: list[str]`
```
>
*> Note
*> : Normally we would use
`> decimal.Decimal
`> objects for the numbers above and
`> datetime.datetime
`> objects for
`> time
`> field, but neither of those deserialize well. For the purposes of this cookbook, we’ll work with strings, but in practice you’d want to have another level of translation to get the correct output validated.
>
### Basic Info Extraction
Let’s build our `extract\_receipt\_details` function.
Usually, for the very first stab at something that might work, we’ll simply feed ChatGPT
the available documents we’ve assembled so far and ask it to generate a prompt. It’s not
worth spending too much time on prompt engineering before you have a benchmark to grade
yourself against! This is a prompt produced by o4-mini based on the problem description
above.
```
`BASIC\_PROMPT = """
Given an image of a retail receipt, extract all relevant information and format it as a structured response.
# Task Description
Carefully examine the receipt image and identify the following key information:
1. Merchant name and any relevant store identification
2. Location information (city, state, ZIP code)
3. Date and time of purchase
4. All purchased items with their:
\* Item description/name
\* Item code/SKU (if present)
\* Category (infer from context if not explicit)
\* Regular price per item (if available)
\* Sale price per item (if discounted)
\* Quantity purchased
\* Total price for the line item
5. Financial summary:
\* Subtotal before tax
\* Tax amount
\* Final total
6. Any handwritten notes or annotations on the receipt (list each separately)
## Important Guidelines
\* If information is unclear or missing, return null for that field
\* Format dates as ISO format (YYYY-MM-DDTHH:MM:SS)
\* Format all monetary values as decimal numbers
\* Distinguish between printed text and handwritten notes
\* Be precise with amounts and totals
\* For ambiguous items, use your best judgment based on context
Your response should be structured and complete, capturing all available information
from the receipt.
"""`
```
```
`import base64
import mimetypes
from pathlib import Path
from openai import AsyncOpenAI
client = AsyncOpenAI()
async def extract\_receipt\_details(
image\_path: str, model: str = "o4-mini"
) -\> ReceiptDetails:
"""Extract structured details from a receipt image."""
# Determine image type for data URI.
mime\_type, \_ = mimetypes.guess\_type(image\_path)
# Read and base64 encode the image.
b64\_image = base64.b64encode(Path(image\_path).read\_bytes()).decode("utf-8")
image\_data\_url = f"data:{mime\_type};base64,{b64\_image}"
response = await client.responses.parse(
model=model,
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": BASIC\_PROMPT},
{"type": "input\_image", "image\_url": image\_data\_url},
],
}
],
text\_format=ReceiptDetails,
)
return response.output\_parsed`
```
### Test on one receipt
Let’s evaluate just a single receipt and review it manually to see how well a smart model with a naive prompt can do.
```
`from rich import print
receipt\_image\_dir = Path("data/test")
ground\_truth\_dir = Path("data/ground\_truth")
example\_receipt = Path(
"data/train/Supplies\_20240322\_220858\_Raven\_Scan\_3\_jpeg.rf.50852940734939c8838819d7795e1756.jpg"
)
result = await extract\_receipt\_details(example\_receipt)`
```
We’ll get different answers if we re-run it, but it usually gets most things correct
with a few errors. Here’s a specific example:
```
`walmart\_receipt = ReceiptDetails(
merchant="Walmart",
location=Location(city="Vista", state="CA", zipcode="92083"),
time="2023-06-30T16:40:45",
items=[
LineItem(
description="SPRAY 90",
product\_code="001920056201",
category=None,
item\_price=None,
sale\_price=None,
quantity="2",
total="28.28",
),
LineItem(
description="LINT ROLLER 70",
product\_code="007098200355",
category=None,
item\_price=None,
sale\_price=None,
quantity="1",
total="6.67",
),
LineItem(
description="SCRUBBER",
product\_code="003444193232",
category=None,
item\_price=None,
sale\_price=None,
quantity="2",
total="12.70",
),
LineItem(
description="FLOUR SACK 10",
product\_code="003444194263",
category=None,
item\_price=None,
sale\_price=None,
quantity="1",
total="0.77",
),
],
subtotal="50.77",
tax="4.19",
total="54.96",
handwritten\_notes=[],
)`
```
The model extracted a lot of things correctly, but renamed some of the line
items - incorrectly, in fact. More importantly, it got some of the prices wrong, and it
decided not to categorize any of the line items.
That’s okay, we don’t expect to have perfect answers at this point! Instead, our
objective is to build a basic system we can evaluate. Then, when we start iterating, we
won’t be ‘vibing’ our way to something that *looks* better — we’ll be engineering a
reliable solution. But first, we’ll add an action decision to complete our draft system.
### Action Decision
Next, we need to close the loop and get to an actual decision based on receipts. This
looks pretty similar, so we’ll present the code without comment.
Ordinarily one would start with the most capable model - `o3`, at this time - for a
first pass, and then once correctness is established experiment with different models
to analyze any tradeoffs for their business impact, and potentially consider whether
they are remediable with iteration. A client may be willing to take a certain accuracy
hit for lower latency or cost, or it may be more effective to change the architecture
to hit cost, latency, and accuracy goals. We’ll get into how to make these tradeoffs
explicitly and objectively later on.
For this cookbook, `o3` might be too good. We’ll use `o4-mini` for our first pass, so
that we get a few reasoning errors we can use to illustrate the means of addressing
them when they occur.
Next, we need to close the loop and get to an actual decision based on receipts. This
looks pretty similar, so we’ll present the code without comment.
```
`from pydantic import BaseModel, Field
audit\_prompt = """
Evaluate this receipt data to determine if it need to be audited based on the following
criteria:
1. NOT\_TRAVEL\_RELATED:
- IMPORTANT: For this criterion, travel-related expenses include but are not limited
to: gas, hotel, airfare, or car rental.
- If the receipt IS for a travel-related expense, set this to FALSE.
- If the receipt is NOT for a travel-related expense (like office supplies), set this
to TRUE.
- In other words, if the receipt shows FUEL/GAS, this would be FALSE because gas IS
travel-related.
2. AMOUNT\_OVER\_LIMIT: The total amount exceeds $50
3. MATH\_ERROR: The math for computing the total doesn't add up (line items don't sum to
total)
4. HANDWRITTEN\_X: There is an "X" in the handwritten notes
For each criterion, determine if it is violated (true) or not (false). Provide your
reasoning for each decision, and make a final determination on whether the receipt needs
auditing. A receipt needs auditing if ANY of the criteria are violated.
Return a structured response with your evaluation.
"""
class AuditDecision(BaseModel):
not\_travel\_related: bool = Field(
description="True if the receipt is not travel-related"
)
amount\_over\_limit: bool = Field(description="True if the total amount exceeds $50")
math\_error: bool = Field(description="True if there are math errors in the receipt")
handwritten\_x: bool = Field(
description="True if there is an 'X' in the handwritten notes"
)
reasoning: str = Field(description="Explanation for the audit decision")
needs\_audit: bool = Field(
description="Final determination if receipt needs auditing"
)
async def evaluate\_receipt\_for\_audit(
receipt\_details: ReceiptDetails, model: str = "o4-mini"
) -\> AuditDecision:
"""Determine if a receipt needs to be audited based on defined criteria."""
# Convert receipt details to JSON for the prompt
receipt\_json = receipt\_details.model\_dump\_json(indent=2)
response = await client.responses.parse(
model=model,
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text": audit\_prompt},
{"type": "input\_text", "text": f"Receipt details:\\n{receipt\_json}"},
],
}
],
text\_format=AuditDecision,
)
return response.output\_parsed`
```
A schematic of the overall process shows two LLM calls:
If we run our above example through this model, here’s what we get — again, we’ll use
an example result here. When you run the code you might get slightly different results.
```
`audit\_decision = await evaluate\_receipt\_for\_audit(result)
print(audit\_decision)`
```
```
`audit\_decision = AuditDecision(
not\_travel\_related=True,
amount\_over\_limit=True,
math\_error=False,
handwritten\_x=False,
reasoning="""
The receipt from Walmart is for office supplies, which are not travel-related, thus NOT\_TRAVEL\_RELATED is TRUE.
The total amount of the receipt is $54.96, which exceeds the limit of $50, making AMOUNT\_OVER\_LIMIT TRUE.
The subtotal ($50.77) plus tax ($4.19) correctly sums to the total ($54.96), so there is no MATH\_ERROR.
There are no handwritten notes, so HANDWRITTEN\_X is FALSE.
Since two criteria (amount over limit and travel-related) are violated, the receipt
needs auditing.
""",
needs\_audit=True,
)`
```
This example illustrates why we care about end-to-end evals and why we can’t use them in
isolation. Here, the initial extraction had OCR errors and forwarded the prices to the
auditor that don’t add up to the total, but the auditor fails to detect it and asserts
there are no math errors. However, missing this doesn’t change the audit decision
because it did pick up on the other two reasons the receipt needs to be audited.
Thus, `AuditDecision` is factually incorrect, but the decision that we care about
is correct. This gives us an edge to improve upon, but also guides us toward making
sound choices for where and when we apply our engineering efforts.
With that said, let’s build ourselves some evals!
## Initial Evals
Once we have a minimally functional system we should process more inputs and get domain
experts to help develop ground-truth data. Domain experts doing expert tasks may not
have much time to devote to our project, so we want to be efficient and start small,
aiming for breadth rather than depth at first.
>
> If your data
*> doesn’t
*> require domain expertise, then you’d want to reach for alabeling solution (such as
[> Label Studio
](https://labelstud.io/)> ) and attempt to annotate> as much data as you can given the policy, budget, and data availability restrictions.> In this case, we’re going to proceed as if data labeling is a scarce resource; one we> can rely on for small amounts each week, but these are people with other job> responsibilities whose time and willingness to help may be limited. Sitting with these> experts to help annotate examples can help make selecting future examples moreefficient.
>
Because we have a chain of two steps, we’ll be collecting tuples of type
`[FilePath, ReceiptDetails, AuditDecision]`. Generally, the way to do this is to take
unlabeled samples, run them through our model, and then have experts correct the output.
For the purposes of this notebook, we’ve already gone through that process for all the
receipt images in `data/test`.
### Additional Considerations
There’s a little more to it than that though, because when you are evaluating a
multistep process it’s important to know both the end to end performance and the
performance of each individual step, *conditioned on the output of the prior step*.
In this case, we want to evaluate:
1. Given an input image, how well do we extract the information we need?
2. Given receipt information, how good is our **judgement** for our audit decision?
3. Given an input image, how **successful** are we about making our final audit decision?
The phrasing difference between #2 and #3 is because if we give our auditor incorrect
data, we expect it to come to incorrect conclusions. What we *want* is to be confident
that the auditor is making the correct decision based on the evidence available, even if
that evidence is misleading. If we don’t pay attention to that case, we can end up
training the auditor to ignore its inputs and cause our overall performance to degrade.
### Graders
The core component of an eval is the
[grader](https://platform.openai.com/docs/guides/graders). Our eventual eval is going to
use 18 of them, but we only use three kinds, and they’re all quite conceptually
straightforward.
Here are examples of one of our string check graders, one of our text similarity
graders, and finally one of our model graders.
```
`example\_graders = [
{
"name": "Total Amount Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.total }}",
"reference": "{{ item.correct\_receipt\_details.total }}",
},
{
"name": "Merchant Name Accuracy",
"type": "text\_similarity",
"input": "{{ item.predicted\_receipt\_details.merchant }}",
"reference": "{{ item.correct\_receipt\_details.merchant }}",
"pass\_threshold": 0.8,
"evaluation\_metric": "bleu",
},
]
# A model grader needs a prompt to instruct it in what it should be scoring.
missed\_items\_grader\_prompt = """
Your task is to evaluate the correctness of a receipt extraction model.
The following items are the actual (correct) line items from a specific receipt.
{{ item.correct\_receipt\_details.items }}
The following items are the line items extracted by the model.
{{ item.predicted\_receipt\_details.items }}
Score 0 if the sample evaluation missed any items from the receipt; otherwise score 1.
The line items are permitted to have small differences or extraction mistakes, but each
item from the actual receipt must be present in some form in the model's output. Only
evaluate whether there are MISSED items; ignore other mistakes or extra items.
"""
example\_graders.append(
{
"name": "Missed Line Items",
"type": "score\_model",
"model": "o4-mini",
"input": [{"role": "system", "content": missed\_items\_grader\_prompt}],
"range": [0, 1],
"pass\_threshold": 1,
}
)`
```
Each grader evaluates some portion of a predicted output. This might be a very narrow
check for a specific field in a structured output, or a more holistic check that
judges an output in its entirety. Some graders can work without context, and evaluate an
output in isolation (for example, an LLM judge that is evaluating if a paragraph is rude
or inappropriate). Others can evaluate based on the input and output, while while the
ones we’re using here rely on an output and a ground-truth (correct) output to compare
against.
The most direct way of using Evals provides a prompt and a model, and lets the eval run
on an input to generate output itself. Another useful method uses previously logged
responses or completions as the source of the outputs. It’s not quite as simple, but the
most flexible thing we can do is to supply an item containing everything we want it to
use—this allows us to have the “prediction” function be an arbitrary system rather than
restricting it to a single model call. This is how we’re using it in the examples below;
the `EvaluationRecord` shown below will be used to populate the `{{ }}` template
variables.
>
**> Note on Model Selection:
**
> Selecting the right model is crucial. While faster, less expensive models are often preferable in production, development workflows benefit from prioritizing the most capable models available. For this guide, we use
`> o4-mini
`> for both system tasks and LLM-based grading—while
`> o3
`> is more capable, our experience suggests the difference in output quality is modest relative to the substantial increase in cost. In practice, spending $10+/day/engineer on evals is typical, but scaling to $100+/day/engineer may not be sustainable.
>
> Nonetheless, it’s valuable to periodically benchmark with a more advanced model like
`> o3
`> . If you observe significant improvements, consider incorporating it for a representative subset of your evaluation data. Discrepancies between models can reveal important edge cases and guide system improvements.
>
```
`import asyncio
class EvaluationRecord(BaseModel):
"""Holds both the correct (ground truth) and predicted audit decisions."""
receipt\_image\_path: str
correct\_receipt\_details: ReceiptDetails
predicted\_receipt\_details: ReceiptDetails
correct\_audit\_decision: AuditDecision
predicted\_audit\_decision: AuditDecision
async def create\_evaluation\_record(image\_path: Path, model: str) -\> EvaluationRecord:
"""Create a ground truth record for a receipt image."""
extraction\_path = ground\_truth\_dir / "extraction" / f"{image\_path.stem}.json"
correct\_details = ReceiptDetails.model\_validate\_json(extraction\_path.read\_text())
predicted\_details = await extract\_receipt\_details(image\_path, model)
audit\_path = ground\_truth\_dir / "audit\_results" / f"{image\_path.stem}.json"
correct\_audit = AuditDecision.model\_validate\_json(audit\_path.read\_text())
predicted\_audit = await evaluate\_receipt\_for\_audit(predicted\_details, model)
return EvaluationRecord(
receipt\_image\_path=image\_path.name,
correct\_receipt\_details=correct\_details,
predicted\_receipt\_details=predicted\_details,
correct\_audit\_decision=correct\_audit,
predicted\_audit\_decision=predicted\_audit,
)
async def create\_dataset\_content(
receipt\_image\_dir: Path, model: str = "o4-mini"
) -\> list[dict]:
# Assemble paired samples of ground truth data and predicted results. You could
# instead upload this data as a file and pass a file id when you run the eval.
tasks = [
create\_evaluation\_record(image\_path, model)
for image\_path in receipt\_image\_dir.glob("\*.jpg")
]
return [{"item": record.model\_dump()} for record in await asyncio.gather(\*tasks)]
file\_content = await create\_dataset\_content(receipt\_image\_dir)`
```
Once we have the graders and the data, creating and running our evals is very straightforward:
```
`from persist\_cache import cache
# We're caching the output so that if we re-run this cell we don't create a new eval.
@cache
async def create\_eval(name: str, graders: list[dict]):
eval\_cfg = await client.evals.create(
name=name,
data\_source\_config={
"type": "custom",
"item\_schema": EvaluationRecord.model\_json\_schema(),
"include\_sample\_schema": False, # Don't generate new completions.
},
testing\_criteria=graders,
)
print(f"Created new eval: {eval\_cfg.id}")
return eval\_cfg
initial\_eval = await create\_eval(
"Initial Receipt Processing Evaluation", example\_graders
)
# Run the eval.
eval\_run = await client.evals.runs.create(
name="initial-receipt-processing-run",
eval\_id=initial\_eval.id,
data\_source={
"type": "jsonl",
"source": {"type": "file\_content", "content": file\_content},
},
)
print(f"Evaluation run created: {eval\_run.id}")
print(f"View results at: {eval\_run.report\_url}")`
```
After you run that eval you’ll be able to view it in the UI, and should see something
like the below.
(Note, if you have a Zero-Data-Retention agreement, this data is not stored
by OpenAI, so will not be available in this interface.)
like:
You can drill into the data tab to look at individual examples:
## Connecting Evals to Business Metrics
Evals show you where you can improve, and help track progress and regressions over time.
But the three evals above are just measurements — we need to imbue them with raison
d’être.
The first thing we need is to add evaluations for the final stage of our receipt
processing, so that we can start seeing the results of our audit decisions. The next
thing we need, the most important, is a *model of business relevance*.
### A Business Model
It’s almost never easy to work out what costs and benefits you could get out of a new
system depending on how well it performs. Often people will avoid trying to put
numbers to things because they know how much uncertainty there is and they don’t want to
make guesses that make them look bad. That’s okay; we just have to make our best guess,
and if we get more information later we can refine our model.
For this cookbook, we’re going to create a simple cost structure:
* our company processes 1 million receipts a year, at a baseline cost of $0.20 /
receipt
* auditing a receipt costs about $2
* failing to audit a receipt we should have audited costs an average of $30
* 5% of receipts need to be audited
* the existing process
* identifies receipts that need to be audited 97% of the time
* misidentifies receipts that don’t need to be audited 2% of the time
This gives us two baseline comparisons:
* if we identified every receipt correctly, we would spend $100,000 on audits
* our current process spends $135,000 on audits and loses $45,000 to un-audited expenses
On top of that, the human-driven process costs an additional $200,000.
We’re expecting our service to save money by costing less to run (≈1¢/receipt if we use
the prompts from above with `o4-mini`), but whether we save or lose money on audits and
missed audits depends on how well our system performs. It might be worth writing this as
a simple function — written below is a version that includes the above factors but
neglects nuance and ignores development, maintenance, and serving costs.
```
`def calculate\_costs(fp\_rate: float, fn\_rate: float, per\_receipt\_cost: float):
audit\_cost = 2
missed\_audit\_cost = 30
receipt\_count = 1e6
audit\_fraction = 0.05
needs\_audit\_count = receipt\_count \* audit\_fraction
no\_needs\_audit\_count = receipt\_count - needs\_audit\_count
missed\_audits = needs\_audit\_count \* fn\_rate
total\_audits = needs\_audit\_count \* (1 - fn\_rate) + no\_needs\_audit\_count \* fp\_rate
audit\_cost = total\_audits \* audit\_cost
missed\_audit\_cost = missed\_audits \* missed\_audit\_cost
processing\_cost = receipt\_count \* per\_receipt\_cost
return audit\_cost + missed\_audit\_cost + processing\_cost
perfect\_system\_cost = calculate\_costs(0, 0, 0)
current\_system\_cost = calculate\_costs(0.02, 0.03, 0.20)
print(f"Current system cost: ${current\_system\_cost:,.0f}")`
```
### Connecting Back To Evals
The point of the above model is it lets us apply meaning to an eval that would
otherwise just be a number. For instance, when we ran the system above we were wrong 85%
of the time for merchant names. But digging in, it seems like most instances are
capitalization issues or “Shell Gasoline” vs. “Shell Oil #2144” — problems that when
we follow through, do not appear to affect our audit decision or change our fundamental
costs.
On the other hand, it seems like we fail to catch handwritten “X”s on receipts about
half the time, and about half of the time when there’s an “X” on a receipt that gets
missed, it results in a receipt not getting audited when it should. Those are
overrepresented in our dataset, but if that makes up even 1% of receipts, that 50%
failure would cost us $75,000 a year.
Similarly, it seems like we have OCR errors that cause us to audit receipts quite often
on account of the math not working out, up to 20% of the time. This could cost us almost
$400,000!
Now, we’re in a place to add more graders and start working backwards from the audit
decision accuracy to determine which problems we should focus on.
Below are the rest of our graders and the results we get with our initial un-optimized
prompts. Note that at this point we do quite badly! Across our 20 samples (8 positive,
12 negative), we had two false negatives and two false positives. If we extrapolated to
our entire business, we’d be losing $375,000 on audits we missed and $475,000 on
unnecessary audits.
```
`simple\_extraction\_graders = [
{
"name": "Merchant Name Accuracy",
"type": "text\_similarity",
"input": "{{ item.predicted\_receipt\_details.merchant }}",
"reference": "{{ item.correct\_receipt\_details.merchant }}",
"pass\_threshold": 0.8,
"evaluation\_metric": "bleu",
},
{
"name": "Location City Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.location.city }}",
"reference": "{{ item.correct\_receipt\_details.location.city }}",
},
{
"name": "Location State Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.location.state }}",
"reference": "{{ item.correct\_receipt\_details.location.state }}",
},
{
"name": "Location Zipcode Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.location.zipcode }}",
"reference": "{{ item.correct\_receipt\_details.location.zipcode }}",
},
{
"name": "Time Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.time }}",
"reference": "{{ item.correct\_receipt\_details.time }}",
},
{
"name": "Subtotal Amount Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.subtotal }}",
"reference": "{{ item.correct\_receipt\_details.subtotal }}",
},
{
"name": "Tax Amount Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.tax }}",
"reference": "{{ item.correct\_receipt\_details.tax }}",
},
{
"name": "Total Amount Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_receipt\_details.total }}",
"reference": "{{ item.correct\_receipt\_details.total }}",
},
{
"name": "Handwritten Notes Accuracy",
"type": "text\_similarity",
"input": "{{ item.predicted\_receipt\_details.handwritten\_notes }}",
"reference": "{{ item.correct\_receipt\_details.handwritten\_notes }}",
"pass\_threshold": 0.8,
"evaluation\_metric": "fuzzy\_match",
},
]
item\_extraction\_base = """
Your task is to evaluate the correctness of a receipt extraction model.
The following items are the actual (correct) line items from a specific receipt.
{{ item.correct\_receipt\_details.items }}
The following items are the line items extracted by the model.
{{ item.predicted\_receipt\_details.items }}
"""
missed\_items\_instructions = """
Score 0 if the sample evaluation missed any items from the receipt; otherwise score 1.
The line items are permitted to have small differences or extraction mistakes, but each
item from the actual receipt must be present in some form in the model's output. Only
evaluate whether there are MISSED items; ignore other mistakes or extra items.
"""
extra\_items\_instructions = """
Score 0 if the sample evaluation extracted any extra items from the receipt; otherwise
score 1.
The line items are permitted to have small differences or extraction mistakes, but each
item from the actual receipt must be present in some form in the model's output. Only
evaluate whether there are EXTRA items; ignore other mistakes or missed items.
"""
item\_mistakes\_instructions = """
Score 0 to 10 based on the number and severity of mistakes in the line items.
A score of 10 means that the two lists are perfectly identical.
Remove 1 point for each minor mistake (typos, capitalization, category name
differences), and up to 3 points for significant mistakes (incorrect quantity, price, or
total, or categories that are not at all similar).
"""
item\_extraction\_graders = [
{
"name": "Missed Line Items",
"type": "score\_model",
"model": "o4-mini",
"input": [
{
"role": "system",
"content": item\_extraction\_base + missed\_items\_instructions,
}
],
"range": [0, 1],
"pass\_threshold": 1,
},
{
"name": "Extra Line Items",
"type": "score\_model",
"model": "o4-mini",
"input": [
{
"role": "system",
"content": item\_extraction\_base + extra\_items\_instructions,
}
],
"range": [0, 1],
"pass\_threshold": 1,
},
{
"name": "Item Mistakes",
"type": "score\_model",
"model": "o4-mini",
"input": [
{
"role": "system",
"content": item\_extraction\_base + item\_mistakes\_instructions,
}
],
"range": [0, 10],
"pass\_threshold": 8,
},
]
simple\_audit\_graders = [
{
"name": "Not Travel Related Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_audit\_decision.not\_travel\_related }}",
"reference": "{{ item.correct\_audit\_decision.not\_travel\_related }}",
},
{
"name": "Amount Over Limit Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_audit\_decision.amount\_over\_limit }}",
"reference": "{{ item.correct\_audit\_decision.amount\_over\_limit }}",
},
{
"name": "Math Error Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_audit\_decision.math\_error }}",
"reference": "{{ item.correct\_audit\_decision.math\_error }}",
},
{
"name": "Handwritten X Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_audit\_decision.handwritten\_x }}",
"reference": "{{ item.correct\_audit\_decision.handwritten\_x }}",
},
{
"name": "Needs Audit Accuracy",
"type": "string\_check",
"operation": "eq",
"input": "{{ item.predicted\_audit\_decision.needs\_audit }}",
"reference": "{{ item.correct\_audit\_decision.needs\_audit }}",
},
]
reasoning\_eval\_prompt = """
Your task is to evaluate the quality of \*reasoning\* for audit decisions on receipts.
Here are the rules for audit decisions:
Expenses should be audited if they violate any of the following criteria:
1. Expenses must be travel-related
2. Expenses must not exceed $50
3. All math should be correct; the line items plus tax should equal the total
4. There must not be an "X" in the handwritten notes
If ANY of those criteria are violated, the expense should be audited.
Here is the input to the grader:
{{ item.predicted\_receipt\_details }}
Below is the output of an authoritative grader making a decision about whether or not to
audit an expense. This is a correct reference decision.
GROUND TRUTH:
{{ item.correct\_audit\_decision }}
Here is the output of the model we are evaluating:
MODEL GENERATED:
{{ item.predicted\_audit\_decision }}
Evaluate:
1. For each of the 4 criteria, did the model correctly score it as TRUE or FALSE?
2. Based on the model's \*scoring\* of the criteria (regardless if it scored it
correctly), did the model reason appropriately about the criteria (i.e. did it
understand and apply the prompt correctly)?
3. Is the model's reasoning logically sound, sufficient, and comprehensible?
4. Is the model's reasoning concise, without extraneous details?
5. Is the final decision to audit or not audit correct?
Grade the model with the following rubric:
- (1) point for each of the 4 criteria that the model scored correctly
- (3) points for each aspect of the model's reasoning that is meets the criteria
- (3) points for the model's final decision to audit or not audit
The total score is the sum of the points, and should be between 0 and 10 inclusive.
"""
model\_judgement\_graders = [
{
"name": "Audit Reasoning Quality",
"type": "score\_model",
"model": "o4-mini",
"input": [{"role": "system", "content": reasoning\_eval\_prompt}],
"range": [0, 10],
"pass\_threshold": 8,
},
]
full\_eval = await create\_eval(
"Full Receipt Processing Evaluation",
simple\_extraction\_graders
+ item\_extraction\_graders
+ simple\_audit\_graders
+ model\_judgement\_graders,
)
eval\_run = await client.evals.runs.create(
name="complete-receipt-processing-run",
eval\_id=full\_eval.id,
data\_source={
"type": "jsonl",
"source": {"type": "file\_content", "content": file\_content},
},
)
eval\_run.report\_url`
```
## Spin Up the Flywheel
Having our business model means we have a map of what’s worth doing and what isn’t. Our
initial evals are a road sign that lets us know we’re moving in the right direction; but
eventually we’ll need more signage. At this point in the process we usually have a lot
of different things we can work on, with a few linked cycles where improvement on one
will open up more room for improvement on a different cycle.
1. Our evals show us where we can improve, and we can immediately use them to guide us
in model selection, prompt engineering, tool use, and fine-tuning strategies.
2. We’re not done once system performs well according to our evals. That’s when it’s
time to *improve our evals*. We will process more data, give it to our domain experts
to review, and feed the corrections into building better, more comprehensive evals.
This cycle can go on for a while. We can speed it along by identifying the efficient
frontier of “interesting” data to examine. There are a few techniques for this, but an
easy one is re-running models on inputs to prioritize labeling inputs that don’t
get consistent answers. This works especially well when using different underlying
models, and often even benefits from using less-intelligent models (if a dumb model
agrees with a smart model then it’s probably not a hard problem).
Once it seems like we’ve hit a point of dimishing returns on performance, we can keep
using the same techniques to optimize model cost; if we have a system that performs
quite well, then fine-tuning or some form of model distillation will probably allow us
to get similar performance from smaller, cheaper, faster models.
## System Improvements
With our evals in place and an understanding of how they connect to our business metrics,
we’re finally ready to turn our attention to improving the output of our system.
Above, we noted that we get merchant names wrong 85% of the time, more than any other
output we’re evaluating. This looks pretty bad, and it’s probably something we can
improve dramaticaly with only a little work, but instead let’s start from the endpoint
of our business metrics and work backwards to see what issues caused incorrect
decisions.
When we do that, we see that the mistakes we made on merchant names are completely
uncorrelated with our final audit decision, and there’s no evidence that they have any
impact on that decision. Based on our business model, we don’t actually see a need to
improve it — in other words, *not all evals matter*. Instead, we can examine
specifically the examples where we made a bad audit decision. There are only two of them
(out of 20). Examining them closely, we observe that in both cases the problem came from
the second stage of the pipeline making a wrong decision based on a non-problematic
extraction. And in fact, both of them come from a failure to reason correctly about
travel-related expenses.
In the first case, the purchase is a snowbroom from an auto-parts store. This is a
little bit of an edge case, but our domain experts identified this as a valid travel
expense (because drivers might need one to clear their windshield). This seems like
explaining the decision process in more detail and providing an analogous example would
correct the error.
In the second case, the purchase is some tools from a home improvement score. The tools
don’t have anything to do with normal driving, so this receipt should be audited as a
“non-travel-related expense”. In this case our model *correctly* identifies it as an
expense that’s not travel-related, but then reasons incorrectly about that fact,
apparently misunderstanding that `true` for `not\_travel\_related` should imply `true` for
`needs\_audit`. Again, this seems like an example where more clarity in our instructions
and a few examples should fix the issue.
Connecting this back to our cost model, we note that we have 1 false negative and 1
false positive, along with 7 true positives and 11 true negatives. Extrapolating this to
the frequencies we see in production, this would increase our overall costs by $63,000
per year.
Let’s modify the prompt and re-run our evals to see how we do. We’ll provide more
guidance in the form of a specific example in the instructions about engine oil
(different from a snow broom, but requires the same reasoning), and we’ll include three
examples pulled from our training set (`data/train`) as few-shot guidance.
```
`first\_ai\_system\_cost = calculate\_costs(
fp\_rate=1 / 12, fn\_rate=1 / 8, per\_receipt\_cost=0.01
)
print(f"First version of our system, estimated cost: ${first\_ai\_system\_cost:,.0f}")`
```
```
`nursery\_receipt\_details = ReceiptDetails(
merchant="WESTERN SIERRA NURSERY",
location=Location(city="Oakhurst", state="CA", zipcode="93644"),
time="2024-09-27T12:33:38",
items=[
LineItem(
description="Plantskydd Repellent RTU 1 Liter",
product\_code=None,
category="Garden/Pest Control",
item\_price="24.99",
sale\_price=None,
quantity="1",
total="24.99",
)
],
subtotal="24.99",
tax="1.94",
total="26.93",
handwritten\_notes=[],
)
nursery\_audit\_decision = AuditDecision(
not\_travel\_related=True,
amount\_over\_limit=False,
math\_error=False,
handwritten\_x=False,
reasoning="""
1. The merchant is a plant nursery and the item purchased an insecticide, so this
purchase is not travel-related (criterion 1 violated).
2. The total is $26.93, under $50, so criterion 2 is not violated.
3. The line items (1 \* $24.99 + $1.94 tax) sum to $26.93, so criterion 3 is not
violated.
4. There are no handwritten notes or 'X's, so criterion 4 is not violated.
Since NOT\_TRAVEL\_RELATED is true, the receipt must be audited.
""",
needs\_audit=True,
)
flying\_j\_details = ReceiptDetails(
merchant="Flying J #616",
location=Location(city="Frazier Park", state="CA", zipcode=None),
time="2024-10-01T13:23:00",
items=[
LineItem(
description="Unleaded",
product\_code=None,
category="Fuel",
item\_price="4.459",
sale\_price=None,
quantity="11.076",
total="49.39",
)
],
subtotal="49.39",
tax=None,
total="49.39",
handwritten\_notes=["yos -\> home sequoia", "236660"],
)
flying\_j\_audit\_decision = AuditDecision(
not\_travel\_related=False,
amount\_over\_limit=False,
math\_error=False,
handwritten\_x=False,
reasoning="""
1. The only item purchased is Unleaded gasoline, which is travel-related so
NOT\_TRAVEL\_RELATED is false.
2. The total is $49.39, which is under $50, so AMOUNT\_OVER\_LIMIT is false.
3. The line items ($4.459 \* 11.076 = $49.387884) sum to the total of $49.39, so
MATH\_ERROR is false.
4. There is no "X" in the handwritten notes, so HANDWRITTEN\_X is false.
Since none of the criteria are violated, the receipt does not need auditing.
""",
needs\_audit=False,
)
engine\_oil\_details = ReceiptDetails(
merchant="O'Reilly Auto Parts",
location=Location(city="Sylmar", state="CA", zipcode="91342"),
time="2024-04-26T8:43:11",
items=[
LineItem(
description="VAL 5W-20",
product\_code=None,
category="Auto",
item\_price="12.28",
sale\_price=None,
quantity="1",
total="12.28",
)
],
subtotal="12.28",
tax="1.07",
total="13.35",
handwritten\_notes=["vista -\> yos"],
)
engine\_oil\_audit\_decision = AuditDecision(
not\_travel\_related=False,
amount\_over\_limit=False,
math\_error=False,
handwritten\_x=False,
reasoning="""
1. The only item purchased is engine oil, which might be required for a vehicle
while traveling, so NOT\_TRAVEL\_RELATED is false.
2. The total is $13.35, which is under $50, so AMOUNT\_OVER\_LIMIT is false.
3. The line items ($12.28 + $1.07 tax) sum to the total of $13.35, so
MATH\_ERROR is false.
4. There is no "X" in the handwritten notes, so HANDWRITTEN\_X is false.
None of the criteria are violated so the receipt does not need to be audited.
""",
needs\_audit=False,
)
examples = [
{"input": nursery\_receipt\_details, "output": nursery\_audit\_decision},
{"input": flying\_j\_details, "output": flying\_j\_audit\_decision},
{"input": engine\_oil\_details, "output": engine\_oil\_audit\_decision},
]
# Format the examples as JSON, with each example wrapped in XML tags.
example\_format = """
\<example\>
\<input\>
{input}
\</input\>
\<output\>
{output}
\</output\>
\</example\>
"""
examples\_string = ""
for example in examples:
example\_input = example["input"].model\_dump\_json()
correct\_output = example["output"].model\_dump\_json()
examples\_string += example\_format.format(input=example\_input, output=correct\_output)
audit\_prompt = f"""
Evaluate this receipt data to determine if it need to be audited based on the following
criteria:
1. NOT\_TRAVEL\_RELATED:
- IMPORTANT: For this criterion, travel-related expenses include but are not limited
to: gas, hotel, airfare, or car rental.
- If the receipt IS for a travel-related expense, set this to FALSE.
- If the receipt is NOT for a travel-related expense (like office supplies), set this
to TRUE.
- In other words, if the receipt shows FUEL/GAS, this would be FALSE because gas IS
travel-related.
- Travel-related expenses include anything that could be reasonably required for
business-related travel activities. For instance, an employee using a personal
vehicle might need to change their oil; if the receipt is for an oil change or the
purchase of oil from an auto parts store, this would be acceptable and counts as a
travel-related expense.
2. AMOUNT\_OVER\_LIMIT: The total amount exceeds $50
3. MATH\_ERROR: The math for computing the total doesn't add up (line items don't sum to
total)
- Add up the price and quantity of each line item to get the subtotal
- Add tax to the subtotal to get the total
- If the total doesn't match the amount on the receipt, this is a math error
- If the total is off by no more than $0.01, this is NOT a math error
4. HANDWRITTEN\_X: There is an "X" in the handwritten notes
For each criterion, determine if it is violated (true) or not (false). Provide your
reasoning for each decision, and make a final determination on whether the receipt needs
auditing. A receipt needs auditing if ANY of the criteria are violated.
Note that violation of a criterion means that it is `true`. If any of the above four
values are `true`, then the receipt needs auditing (`needs\_audit` should be `true`: it
functions as a boolean OR over all four criteria).
If the receipt contains non-travel expenses, then NOT\_TRAVEL\_RELATED should be `true`
and therefore NEEDS\_AUDIT must also be set to `true`. IF THE RECEIPT LISTS ITEMS THAT
ARE NOT TRAVEL-RELATED, THEN IT MUST BE AUDITED. Here are some example inputs to
demonstrate how you should act:
\<examples\>
{examples\_string}
\</examples\>
Return a structured response with your evaluation.
"""`
```
The modifications we made to the prompt above are:
1. Under item 1 concerning travel-related expenses, we added a bullet point
```
`- Travel-related expenses include anything that could be reasonably required for
business-related travel activities. For instance, an employee using a personal
vehicle might need to change their oil; if the receipt is for an oil change or the
purchase of oil from an auto parts store, this would be acceptable and counts as a
travel-related expense.`
```
1. We added more proscriptive guidance on how to evaluate for a math error.
Specifically, we added the bullet points:
```
` - Add up the price and quantity of each line item to get the subtotal
- Add tax to the subtotal to get the total
- If the total doesn't match the amount on the receipt, this is a math error
- If the total is off by no more than $0.01, this is NOT a math error`
```
This doesn’t actually have to do with the issues we mentioned, but is another issue
we noticed as a flaw in the reasoning provided by the audit model.
1. We added very strong guidance (we actually needed to state it and restate it
emphatically) to say that non-travel-related expenses should be audited.
```
`Note that violation of a criterion means that it is `true`. If any of the above four
values are `true`, then the receipt needs auditing (`needs\_audit` should be `true`: it
functions as a boolean OR over all four criteria).
If the receipt contains non-travel expenses, then NOT\_TRAVEL\_RELATED should be `true`
and therefore NEEDS\_AUDIT must also be set to `true`. IF THE RECEIPT LISTS ITEMS THAT
ARE NOT TRAVEL-RELATED, THEN IT MUST BE AUDITED.`
```
1. We added three examples, JSON input/output pairs wrapped in XML tags.
2. We added three examples, JSON input/output pairs wrapped in XML tags.
With our prompt revisions, we’ll regenerate the data to evaluate and re-run the same
eval to compare our results:
```
`file\_content = await create\_dataset\_content(receipt\_image\_dir)
eval\_run = await client.evals.runs.create(
name="updated-receipt-processing-run",
eval\_id=full\_eval.id,
data\_source={
"type": "jsonl",
"source": {"type": "file\_content", "content": file\_content},
},
)
eval\_run.report\_url`
```
When we ran the eval again, we actually still got two audit decisions wrong. Digging into
the examples we made a mistake on, it turns out that we completely fixed the issues we
identified, but our examples improved the reasoning step and caused two other issues to
surface. Specifically:
1. One receipt needed to be audited only because there was a mistake in extraction and
a handwritten “X” wasn’t identified. The audit model reasoned correctly, but based on
incorrect data.
2. One receipt was extracted in such a way that a $0.35 debit fee wasn’t visible, so the
audit model identified a math error. This almost certainly happened because we
provided it with more detailed instructions and clear examples that demonstrated it
needed to actually add up all the line items in order to decide whether there was a
math error. Again, this demonstrates correct behavior on the part of the audit model
and suggests we need to correct the extraction model.
This is great, and we’ll continue iterating on issues as we uncover them. This is the
cycle of improvement!
### Model Choice
When beginning a project, we usually start with one of the most capable models available, such as `o4-mini`, to establish a performance baseline. Once we’re confident in the model’s ability to solve the task, the next step is to explore smaller, faster, or more cost-effective alternatives.
Optimizing for inference cost and latency is essential, especially for production or customer-facing systems, where these factors can significantly impact overall expenses and user experience. For instance, switching from `o4-mini` to `gpt-4.1-mini` could reduce inference costs by nearly two-thirds—an example where thoughtful model selection leads to meaningful savings.
In the next section, we’ll rerun our evaluations using `gpt-4.1-mini` for both extraction and audit steps to see how well a more efficient model performs.
```
`file\_content = await create\_dataset\_content(receipt\_image\_dir, model="gpt-4.1-mini")
eval\_run = await client.evals.runs.create(
name="receipt-processing-run-gpt-4-1-mini",
eval\_id=full\_eval.id,
data\_source={
"type": "jsonl",
"source": {"type": "file\_content", "content": file\_content},
},
)
eval\_run.report\_url`
```
The results are pretty promising. It doesn’t look like the extraction accuracy suffered
at all. We see one regression (the snowbroom again), but our audit decision is correct
twice as often as it was before our prompt changes.
This is great evidence that we’ll be able to switch to a cheaper model, but it might
require more prompt engineering, fine-tuning, or some form of model-distillation. Note
however that according to our current model this would already be saving us money. We
don’t quite believe that yet because we don’t have a large enough sample — our real
false negative rate will be more than the 0 we see here.
```
`system\_cost\_4\_1\_mini = calculate\_costs(
fp\_rate=1 / 12, fn\_rate=0, per\_receipt\_cost=0.003
)
print(f"Cost using gpt-4.1-mini: ${system\_cost\_4\_1\_mini:,.0f}")`
```
### Further improvements
This cookbook focuses on the philosophy and practicalities of evals, not the full range of model improvement techniques. For boosting or maintaining model performance (especially when moving to smaller, faster, or cheaper models), consider these steps in order—start from the top, and only proceed down if needed. For example, always optimize your prompt before resorting to fine-tuning; fine-tuning on a weak prompt can lock in bad performance even if you improve the prompt later.
1. **Model selection:** try smarter models, or increase their reasoning budget.
2. **Prompt tuning:** clarify instructions and provide very explicit rules.
3. **Examples and context:** add few- or many-shot examples, or more context for the
problem. RAG fits in here, and may be used to dynamically select similar examples.
4. **Tools use:** provide tools to solve specific problems, including access to external
APIs, the ability to query databases, or otherwise enable the model to have its own
questions answered.
5. **Accessory models:** add models to perform limited sub-tasks, to supervise and provide
guardrails, or use a mixture of experts and aggregate solutions from multiple
sub-models.
6. **Fine-tuning:** use labeled training data for supervised fine tuning, eval
graders for reinforcement fine tuning, or different outputs for direct preference
optimization.
The above options are all tools to maximize performance. Once you’re trying to optimize
for a price:performance ratio, you’ll usually have already done all of the above and
likely don’t need to repeat most steps, but you can still fine-tune smaller models or
use your best model to train a smaller model (model distillation).
>
> One really excellent thing about OpenAI Evals is that you can use the same graders for
[> Reinforcement Fine-Tuning
](https://cookbook.openai.com/examples/reinforcement_fine_tuning)> > to produce better model performance in an extremely sample-efficient manner. One note> of caution is to make sure that you use separate training data and don’t leak youreval datasets during RFT.
>
## Deploying and Post-Development
Building and deploying an LLM application is just the beginning—the real value comes from ongoing improvement. Once your system is live, prioritize continuous monitoring: log traces, track outputs, and proactively sample real user interactions for human review using smart sampling techniques.
Production data is your most authentic source for evolving your evaluation and training datasets. Regularly collect and curate fresh samples from actual use cases to identify gaps, edge cases, and new opportunities for enhancement.
In practice, leverage this data for rapid iteration. Automate periodic fine-tuning pipelines that retrain your models on recent, high-quality samples and automatically deploy new versions when they outperform existing ones in your evals. Capture user corrections and feedback, then systematically feed these insights back into your prompts or retraining process—especially when they highlight persistent issues.
By embedding these feedback loops into your post-development workflow, you ensure your LLM applications continuously adapt, stay robust, and remain closely aligned with user needs as they evolve.
### Contributors
This cookbook serves as a joint collaboration effort between OpenAI and [Fractional](https://www.fractional.ai/).
* Hugh Wimberly
* Joshua Marker
* Eddie Siegel
* Shikhar Kwatra