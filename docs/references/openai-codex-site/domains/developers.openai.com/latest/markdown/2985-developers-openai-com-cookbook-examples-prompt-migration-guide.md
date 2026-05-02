Prompt Migration Guide
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
Jun 26, 2025
# Prompt Migration Guide
[ MH ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)[ CC ](https://www.linkedin.com/in/corwincubes/)
[ Minhajul Hoque , ](https://www.linkedin.com/in/minhajul-hoque-83242b163/)[ Corwin Cheung ](https://www.linkedin.com/in/corwincubes/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Prompt_migration_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Prompt_migration_guide.ipynb)
Newer models, such as GPT-4.1, are best in class in performance and instruction following. As model gets smarter, there is a consistent need to adapt prompts that were originally tailored to earlier models’ limitations, ensuring they remain effective and clear for newer generations.
Models such as GPT‑4.1 excel at closely following instructions, but this precision means it can interpret unclear or poorly phrased instructions **literally**, leading to unexpected or incorrect results. To leverage GPT‑4.1’s full potential, it’s essential to refine prompts, ensuring each instruction is explicit, unambiguous, and aligned with your intended outcomes.
Example of Unclear Instructions:
* Ambiguous:
>
> ""Do not include irrelevant information.""
>
Issue: GPT-4.1 might struggle to determine what is “irrelevant” if not explicitly defined. This could cause it to omit essential details due to overly cautious interpretation or include too much detail inadvertently..
* Improved:
>
> “Only include facts directly related to the main topic (X). Exclude personal anecdotes, unrelated historical context, or side discussions.”
>
**Objective**: This interactive notebook helps you improve an existing prompt (written for another model) into one that is clear, unambiguous and optimised for GPT‑4.1 following best practices.
**Workflow Overview**
This notebook uses the following approach:
* [Step 1. Input your original prompt](#step-1-input-your-original-prompt)
* [Step 2. Identify all instructions in your prompt](#step-2-identify-all-instructions-in-your-prompt)
* [Step 3. Ask GPT-4.1 to *critique* the prompt](#step-3-ask-gpt-4-1-to-critique-the-prompt)
* [Step 4. Auto-generate a revised system prompt](#step-4-auto-generate-a-revised-system-prompt)
* [Step 5. Evaluate and iterate](#step-5-evaluate-and-iterate)
* [Step 6. (Optional) Automatically apply GPT-4.1 best practices](#step-6-optional-automatically-apply-gpt-4-1-best-practices)
**Prerequisites**
* The `openai` Python package and `OPENAI\_API\_KEY`
```
`# !pip install openai pydantic tiktoken`
```
```
`# Imports & API connection
from openai import OpenAI
from pydantic import BaseModel, Field
from typing import Any, Dict, Iterable, List, Optional
import tiktoken
import html
from html import escape
import difflib
import sys
from IPython.display import display, HTML
try:
from IPython.display import HTML, display
\_IN\_IPYTHON = True
except ImportError:
\_IN\_IPYTHON = False
client = OpenAI()
MODEL = "gpt-4.1"`
```
Below are a few helper functions to enable us to easily review the analysis and modifications on our prompt.
```
`\_COLORS = {
'+': ("#d2f5d6", "#22863a"), # additions (green)
'-': ("#f8d7da", "#b31d28"), # deletions (red)
'@': (None, "#6f42c1"), # hunk header (purple)
}
def \_css(\*\*rules: str) -\> str:
"""Convert kwargs to a CSS string (snake\_case → kebab-case)."""
return ";".join(f"{k.replace('\_', '-')}: {v}" for k, v in rules.items())
def \_render(html\_str: str) -\> None:
"""Render inside Jupyter if available, else print to stdout."""
try:
display # type: ignore[name-defined]
from IPython.display import HTML # noqa: WPS433
display(HTML(html\_str))
except NameError:
print(html\_str, flush=True)
# ---------- diff helpers ------------------------------------------------------
def \_style(line: str) -\> str:
"""Wrap a diff line in a \<span\> with optional colors."""
bg, fg = \_COLORS.get(line[:1], (None, None))
css = ";".join(s for s in (f"background:{bg}" if bg else "",
f"color:{fg}" if fg else "") if s)
return f'\<span style="{css}"\>{html.escape(line)}\</span\>'
def \_wrap(lines: Iterable[str]) -\> str:
body = "\<br\>".join(lines)
return (
"\<details\>"
"\<summary\>🕵️‍♂️ Critique & Diff (click to expand)\</summary\>"
f'\<div style="font-family:monospace;white-space:pre;"\>{body}\</div\>'
"\</details\>"
)
def show\_critique\_and\_diff(old: str, new: str) -\> str:
"""Display & return a GitHub-style HTML diff between \*old\* and \*new\*."""
diff = difflib.unified\_diff(old.splitlines(), new.splitlines(),
fromfile="old", tofile="new", lineterm="")
html\_block = \_wrap(map(\_style, diff))
\_render(html\_block)
return html\_block
# ---------- “card” helpers ----------------------------------------------------
CARD = \_css(background="#f8f9fa", border\_radius="8px", padding="18px 22px",
margin\_bottom="18px", border="1px solid #e0e0e0",
box\_shadow="0 1px 4px #0001")
TITLE = \_css(font\_weight="600", font\_size="1.1em", color="#2d3748",
margin\_bottom="6px")
LABEL = \_css(color="#718096", font\_size="0.95em", font\_weight="500",
margin\_right="6px")
EXTRACT = \_css(font\_family="monospace", background="#f1f5f9", padding="7px 10px",
border\_radius="5px", display="block", margin\_top="3px",
white\_space="pre-wrap", color="#1a202c")
def display\_cards(
items: Iterable[Any],
\*,
title\_attr: str,
field\_labels: Optional[Dict[str, str]] = None,
card\_title\_prefix: str = "Item",
) -\> None:
"""Render objects as HTML “cards” (or plaintext when not in IPython)."""
items = list(items)
if not items:
\_render("\<em\>No data to display.\</em\>")
return
# auto-derive field labels if none supplied
if field\_labels is None:
sample = items[0]
field\_labels = {
a: a.replace("\_", " ").title()
for a in dir(sample)
if not a.startswith("\_")
and not callable(getattr(sample, a))
and a != title\_attr
}
cards = []
for idx, obj in enumerate(items, 1):
title\_html = html.escape(str(getattr(obj, title\_attr, "\<missing title\>")))
rows = [f'\<div style="{TITLE}"\>{card\_title\_prefix} {idx}: {title\_html}\</div\>']
for attr, label in field\_labels.items():
value = getattr(obj, attr, None)
if value is None:
continue
rows.append(
f'\<div\>\<span style="{LABEL}"\>{html.escape(label)}:\</span\>'
f'\<span style="{EXTRACT}"\>{html.escape(str(value))}\</span\>\</div\>'
)
cards.append(f'\<div style="{CARD}"\>{"".join(rows)}\</div\>')
\_render("\\n".join(cards))`
```
## Step 1. Input Your Original Prompt
Begin by providing your existing prompt clearly between triple quotes ("""). This prompt will serve as the baseline for improvement.
For this example, we will be using the system prompt for LLM-as-a-Judge provided in the following [paper](https://arxiv.org/pdf/2306.05685).
```
`original\_prompt = """
[System]
Please act as an impartial judge and evaluate the quality of the responses provided by two
AI assistants to the user question displayed below. You should choose the assistant that
follows the user’s instructions and answers the user’s question better. Your evaluation
should consider factors such as the helpfulness, relevance, accuracy, depth, creativity,
and level of detail of their responses. Begin your evaluation by comparing the two
responses and provide a short explanation. Avoid any position biases and ensure that the
order in which the responses were presented does not influence your decision. Do not allow
the length of the responses to influence your evaluation. Do not favor certain names of
the assistants. Be as objective as possible. After providing your explanation, output your
final verdict by strictly following this format: "[[A]]" if assistant A is better, "[[B]]"
if assistant B is better, and "[[C]]" for a tie.
[User Question]
{question}
[The Start of Assistant A’s Answer]
{answer\_a}
[The End of Assistant A’s Answer]
[The Start of Assistant B’s Answer]
{answer\_b}
[The End of Assistant B’s Answer]
"""
encoding = tiktoken.encoding\_for\_model("gpt-4")
num\_tokens = len(encoding.encode(original\_prompt))
print("Original prompt length:", num\_tokens, "tokens")`
```
```
`Original prompt length: 243 tokens`
```
## Step 2. Identify All Instructions in your Prompt
In this section, we will extract every INSTRUCTION that the LLM identifies within the system prompt. This allows you to review the list, spot any statements that should not be instructions, and clarify any that are ambiguous.
Carefully review and confirm that each listed instruction is both accurate and essential to retain.
```
`class Instruction(BaseModel):
instruction\_title: str = Field(description="A 2-8 word title of the instruction that the LLM has to follow.")
extracted\_instruction: str = Field(description="The exact text that was extracted from the system prompt that the instruction is derived from.")
class InstructionList(BaseModel):
instructions: list[Instruction] = Field(description="A list of instructions and their corresponding extracted text that the LLM has to follow.")
EXTRACT\_INSTRUCTIONS\_SYSTEM\_PROMPT = """
## Role & Objective
You are an \*\*Instruction-Extraction Assistant\*\*.
Your job is to read a System Prompt provided by the user and distill the \*\*mandatory instructions\*\* the target LLM must obey.
## Instructions
1. \*\*Identify Mandatory Instructions\*\*
• Locate every instruction in the System Prompt that the LLM is explicitly required to follow.
• Ignore suggestions, best-practice tips, or optional guidance.
2. \*\*Generate Rules\*\*
• Re-express each mandatory instruction as a clear, concise rule.
• Provide the extracted text that the instruction is derived from.
• Each rule must be standalone and imperative.
## Output Format
Return a json object with a list of instructions which contains an instruction\_title and their corresponding extracted text that the LLM has to follow. Do not include any other text or comments.
## Constraints
- Include \*\*only\*\* rules that the System Prompt explicitly enforces.
- Omit any guidance that is merely encouraged, implied, or optional.
"""
response = client.responses.parse(
model=MODEL,
input="SYSTEM\_PROMPT TO ANALYZE: " + original\_prompt,
instructions=EXTRACT\_INSTRUCTIONS\_SYSTEM\_PROMPT,
temperature=0.0,
text\_format=InstructionList,
)
instructions\_list = response.output\_parsed`
```
```
`display\_cards(
instructions\_list.instructions,
title\_attr="instruction\_title",
field\_labels={"extracted\_instruction": "Extracted Text"},
card\_title\_prefix="Instruction"
)`
```
Instruction 1: Act as an impartial judge
Extracted Text:Please act as an impartial judge and evaluate the quality of the responses provided by two AI assistants to the user question displayed below.
Instruction 2: Choose the better assistant
Extracted Text:You should choose the assistant that follows the user’s instructions and answers the user’s question better.
Instruction 3: Consider specific evaluation factors
Extracted Text:Your evaluation should consider factors such as the helpfulness, relevance, accuracy, depth, creativity, and level of detail of their responses.
Instruction 4: Begin with a comparison and explanation
Extracted Text:Begin your evaluation by comparing the two responses and provide a short explanation.
Instruction 5: Avoid position biases
Extracted Text:Avoid any position biases and ensure that the order in which the responses were presented does not influence your decision.
Instruction 6: Do not let response length influence evaluation
Extracted Text:Do not allow the length of the responses to influence your evaluation.
Instruction 7: Do not favor assistant names
Extracted Text:Do not favor certain names of the assistants.
Instruction 8: Be objective
Extracted Text:Be as objective as possible.
Instruction 9: Output final verdict in strict format
Extracted Text:After providing your explanation, output your final verdict by strictly following this format: "[[A]]" if assistant A is better, "[[B]]" if assistant B is better, and "[[C]]" for a tie.
It’s helpful to examine which parts of your prompt the model recognizes as instructions. Instructions are how we “program” models using natural language, so it’s crucial to ensure they’re clear, precise, and correct.
## Step 3. Ask GPT-4.1 to *critique* the prompt
Next, GPT‑4.1 itself will critique the original prompt, specifically identifying areas that may cause confusion or errors:
* Ambiguity: Phrases open to multiple interpretations.
* Lacking Definitions: Labels or terms that are not clearly defined, which may cause the model to infer or guess their intended meaning.
* Conflicting Instructions: Rules or conditions that contradict or overlap.
* Missing Context or Assumptions: Necessary information or context not explicitly provided.
The critique output will be clearly organized, highlighting specific issues along with actionable suggestions for improvement.
Models are really good at **identifying parts of a prompt that they find ambiguous or confusing**. By addressing these issues, we can engineer the instructions to make them clearer and more effective for the model.
```
`class CritiqueIssue(BaseModel):
issue: str
snippet: str
explanation: str
suggestion: str
class CritiqueIssues(BaseModel):
issues: List[CritiqueIssue] = Field(..., min\_length=1, max\_length=6)
CRITIQUE\_SYSTEM\_PROMPT = """
## Role & Objective
You are a \*\*Prompt-Critique Assistant\*\*.
Examine a user-supplied LLM prompt (targeting GPT-4.1 or compatible) and surface any weaknesses.
## Instructions
Check for the following issues:
- Ambiguity: Could any wording be interpreted in more than one way?
- Lacking Definitions: Are there any class labels, terms, or concepts that are not defined that might be misinterpreted by an LLM?
- Conflicting, missing, or vague instructions: Are directions incomplete or contradictory?
- Unstated assumptions: Does the prompt assume the model has to be able to do something that is not explicitly stated?
## Do \*\*NOT\*\* list issues of the following types:
- Invent new instructions, tool calls, or external information. You do not know what tools need to be added that are missing.
- Issues that you are not sure about.
## Output Format
Return a JSON \*\*array\*\* (not an object) with 1-6 items, each following this schema:
```json
{
"issue": "\<1-6 word label\>",
"snippet": "\<≤50-word excerpt\>",
"explanation":"\<Why it matters\>",
"suggestion": "\<Actionable fix\>"
}
Return a JSON array of these objects. If the prompt is already clear, complete, and effective, return an empty list: `[]`.
"""
CRITIQUE\_USER\_PROMPT = f"""
Evaluate the following prompt for clarity, completeness, and effectiveness:
###
{original\_prompt}
###
Return your critique using the specified JSON format only.
"""`
```
```
`response = client.responses.parse(
model=MODEL,
input=[
{"role": "system", "content": CRITIQUE\_SYSTEM\_PROMPT},
{"role": "user", "content": CRITIQUE\_USER\_PROMPT},
],
temperature=0.0,
text\_format=CritiqueIssues,
)
critique = response.output\_parsed`
```
```
`display\_cards(
critique.issues,
title\_attr="issue",
field\_labels={
"snippet": "Snippet",
"explanation": "Explanation",
"suggestion": "Suggestion"
},
card\_title\_prefix="Issue"
)`
```
Issue 1: Ambiguous evaluation criteria
Snippet:consider factors such as the helpfulness, relevance, accuracy, depth, creativity, and level of detail
Explanation:The prompt lists several evaluation factors but does not define them or explain how to weigh them. This could lead to inconsistent or subjective judgments.
Suggestion:Provide clear definitions for each criterion and specify if any should be prioritized over others.
Issue 2: Unclear handling of ties
Snippet:"[[C]]" for a tie
Explanation:The prompt allows for a tie verdict but does not specify under what circumstances a tie is appropriate, which may lead to inconsistent use.
Suggestion:Clarify when a tie should be chosen, e.g., if both responses are equally strong across all criteria.
Issue 3: Potential ambiguity in 'objectivity'
Snippet:Be as objective as possible.
Explanation:The prompt asks for objectivity but does not specify what constitutes objectivity in this context, especially given the subjective nature of some criteria.
Suggestion:Define what is meant by objectivity in this evaluation context, possibly by referencing adherence to the listed criteria.
```
`# Create a string of the issues
issues\_str = "\\n".join(
f"Issue: {issue.issue}\\nSnippet: {issue.snippet}\\nExplanation: {issue.explanation}\\nSuggestion: {issue.suggestion}\\n"
for issue in critique.issues
)
print(issues\_str)`
```
```
`Issue: Ambiguous evaluation criteria
Snippet: consider factors such as the helpfulness, relevance, accuracy, depth, creativity, and level of detail
Explanation: The prompt lists several evaluation factors but does not define them or explain how to weigh them. This could lead to inconsistent or subjective judgments.
Suggestion: Provide clear definitions for each criterion and specify if any should be prioritized over others.
Issue: Unclear handling of ties
Snippet: "[[C]]" for a tie
Explanation: The prompt allows for a tie verdict but does not specify under what circumstances a tie is appropriate, which may lead to inconsistent use.
Suggestion: Clarify when a tie should be chosen, e.g., if both responses are equally strong across all criteria.
Issue: Potential ambiguity in 'objectivity'
Snippet: Be as objective as possible.
Explanation: The prompt asks for objectivity but does not specify what constitutes objectivity in this context, especially given the subjective nature of some criteria.
Suggestion: Define what is meant by objectivity in this evaluation context, possibly by referencing adherence to the listed criteria.`
```
Review the list of issues:
* If you are satisfied with them, proceed to next step #4.
* If you believe some issues are not relevant, copy the above text into the next cell and remove those issues. In this case, all three issues make reasonable sense, so we skip this step.
```
`# issues\_str = """
# PLACEHOLDER FOR ISSUES YOU WANT TO CORRECT, DO NOT RUN THIS CELL UNLESS YOU HAVE COPY-PASTED THE ISSUES FROM ABOVE
# """`
```
## Step 4. Auto‑generate a revised *system* prompt
We now feed the critique back to GPT‑4.1 and ask it to produce an improved version of the original prompt, ready to drop into a `system` role message.
```
`REVISE\_SYSTEM\_PROMPT = """
## Role & Objective
Revise the user’s original prompt to resolve most of the listed issues, while preserving the original wording and structure as much as possible.
## Instructions
1. Carefully review the original prompt and the list of issues.
2. Apply targeted edits directly addressing the listed issues. The edits should be as minimal as possible while still addressing the issue.
3. Do not introduce new content or make assumptions beyond the provided information.
4. Maintain the original structure and format of the prompt.
## Output Format
Return only the fully revised prompt. Do not include commentary, summaries, or code fences.
"""
REVISE\_USER\_PROMPT = f"""
Here is the original prompt:
---
{original\_prompt}
---
Here are the issues to fix:
{issues\_str}
Please return \*\*only\*\* the fully revised prompt. Do not include commentary, summaries, or explanations.
"""`
```
```
`revised\_response = client.responses.create(
model=MODEL,
input=REVISE\_USER\_PROMPT,
instructions=REVISE\_SYSTEM\_PROMPT,
temperature=0.0
)
revised\_prompt = revised\_response.output\_text
print("\\n🔄 Revised prompt:\\n------------------")
print(revised\_response.output\_text)`
```
```
`
🔄 Revised prompt:
------------------
[System]
Please act as an impartial judge and evaluate the quality of the responses provided by two AI assistants to the user question displayed below. You should choose the assistant that follows the user’s instructions and answers the user’s question better. Your evaluation should be based on the following criteria:
- Helpfulness: The extent to which the response addresses the user’s needs and provides useful information.
- Relevance: How closely the response pertains to the user’s question and instructions.
- Accuracy: The correctness and factual reliability of the information provided.
- Depth: The level of insight, explanation, or reasoning demonstrated in the response.
- Creativity: The originality or resourcefulness shown in addressing the question, where appropriate.
- Level of Detail: The thoroughness and completeness of the response.
All criteria should be considered equally unless the user’s instructions indicate otherwise.
Begin your evaluation by comparing the two responses according to these criteria and provide a short explanation. Remain impartial by avoiding any position biases and ensuring that the order in which the responses were presented does not influence your decision. Do not allow the length of the responses or the names of the assistants to influence your evaluation.
Be as objective as possible by strictly adhering to the defined criteria above and basing your judgment solely on how well each response meets them.
After providing your explanation, output your final verdict by strictly following this format: "[[A]]" if assistant A is better, "[[B]]" if assistant B is better, and "[[C]]" for a tie. Choose "[[C]]" only if both responses are equally strong across all criteria.
[User Question]
{question}
[The Start of Assistant A’s Answer]
{answer\_a}
[The End of Assistant A’s Answer]
[The Start of Assistant B’s Answer]
{answer\_b}
[The End of Assistant B’s Answer]`
```
Let’s review the changes side-by-side comparison highlighting changes between the improved and refined prompts:
```
`show\_critique\_and\_diff(original\_prompt, revised\_prompt)`
```
🕵️‍♂️ Critique & Diff (click to expand)
--- old
+++ new
@@ -1,15 +1,20 @@
[System]
-Please act as an impartial judge and evaluate the quality of the responses provided by two
-AI assistants to the user question displayed below. You should choose the assistant that
-follows the user’s instructions and answers the user’s question better. Your evaluation
-should consider factors such as the helpfulness, relevance, accuracy, depth, creativity,
-and level of detail of their responses. Begin your evaluation by comparing the two
-responses and provide a short explanation. Avoid any position biases and ensure that the
-order in which the responses were presented does not influence your decision. Do not allow
-the length of the responses to influence your evaluation. Do not favor certain names of
-the assistants. Be as objective as possible. After providing your explanation, output your
-final verdict by strictly following this format: "[[A]]" if assistant A is better, "[[B]]"
-if assistant B is better, and "[[C]]" for a tie.
+Please act as an impartial judge and evaluate the quality of the responses provided by two AI assistants to the user question displayed below. You should choose the assistant that follows the user’s instructions and answers the user’s question better. Your evaluation should be based on the following criteria:
+
+- Helpfulness: The extent to which the response addresses the user’s needs and provides useful information.
+- Relevance: How closely the response pertains to the user’s question and instructions.
+- Accuracy: The correctness and factual reliability of the information provided.
+- Depth: The level of insight, explanation, or reasoning demonstrated in the response.
+- Creativity: The originality or resourcefulness shown in addressing the question, where appropriate.
+- Level of Detail: The thoroughness and completeness of the response.
+
+All criteria should be considered equally unless the user’s instructions indicate otherwise.
+
+Begin your evaluation by comparing the two responses according to these criteria and provide a short explanation. Remain impartial by avoiding any position biases and ensuring that the order in which the responses were presented does not influence your decision. Do not allow the length of the responses or the names of the assistants to influence your evaluation.
+
+Be as objective as possible by strictly adhering to the defined criteria above and basing your judgment solely on how well each response meets them.
+
+After providing your explanation, output your final verdict by strictly following this format: "[[A]]" if assistant A is better, "[[B]]" if assistant B is better, and "[[C]]" for a tie. Choose "[[C]]" only if both responses are equally strong across all criteria.
[User Question]
{question}
## Step 5. Evaluate and iterate
Finally, evaluate your refined prompt by:
* Testing it with representative evaluation examples or data.
* Analyzing the responses to ensure desired outcomes.
* Iterating through previous steps if further improvements are required.
Consistent testing and refinement ensure your prompts consistently achieve their intended results.
### Current Example
Let’s evaluate whether our current prompt migration has actually improved for the task of this judge. The original prompt, drawn from this [paper](https://arxiv.org/pdf/2306.05685), is designed to serve as a judge between two assistants’ answers. Conveniently, the paper provides a set of human-annotated ground truths, so we can measure how often the LLM judge agrees with the humans judgments.
Thus, our metric of success will be measuring how closely the judgments generated by our migrated prompt align with human evaluations compared to the judgments generated with our baseline prompt. For context, the benchmark we’re using is a subset of MT-Bench, which features multi-turn conversations. In this example, we’re evaluating 200 conversation rows, each comparing the performance of different model pairs.
On our evaluation subset, a useful reference anchor is human-human agreement, since each conversation is rated by multiple annotators. Humans do not always agree with each other on which assistant answer is better, so we wouldn’t expect our judge to achieve perfect agreement either. For turn 1 (without ties), humans agree with each other in 81% of cases, and for turn 2, in 76% of cases.
Comparing this to our models before migration, GPT-4 (as used in the paper) achieves an agreement with human judgments of 74% on turn 1 and 71% on turn 2, which is not bad, but still below the human-human ceiling. Switching to GPT-4.1 (using the same prompt) improves the agreement: 77% on turn 1 and 72% on turn 2. Finally, after migrating and tuning our prompt specifically for GPT-4.1, the agreement climbs further, reaching 80% on turn 1 and 72% on turn 2, very close to matching the level of agreement seen between human annotators.
Viewed all together, we can see that prompt migration and upgrading to more powerful models improve agreement on our sample task. Go ahead and try it on your prompt now!
## Step 6. (OPTIONAL) Automatically Apply GPT‑4.1 Best Practices
In this step, GPT-4.1 best practices will be applied automatically to enhance your original prompt. We strongly suggest to manually review the edits made and decide if you want to keep or not.
See the [4.1 Prompting Guide](https://cookbook.openai.com/examples/gpt4-1_prompting_guide) for reference.
```
`BEST\_PRACTICES\_SYSTEM\_PROMPT = """
## Task
Your task is to take a \*\*Baseline Prompt\*\* (provided by the user) and output a \*\*Revised Prompt\*\* that keeps the original wording and order as intact as possible \*\*while surgically inserting improvements that follow the “GPT‑4.1 Best Practices” reference\*\*.
## How to Edit
1. \*\*Keep original text\*\* — Only remove something if it directly goes against a best practice. Otherwise, keep the wording, order, and examples as they are.
2. \*\*Add best practices only when clearly helpful.\*\* If a guideline doesn’t fit the prompt or its use case (e.g., diff‑format guidance on a non‑coding prompt), just leave that part of the prompt unchanged.
3. \*\*Where to add improvements\*\* (use Markdown `#` headings):
- At the very top, add \*Agentic Reminders\* (like Persistence, Tool-calling, or Planning) — only if relevant. Don’t add these if the prompt doesn’t require agentic behavior (agentic means prompts that involve planning or running tools for a while).
- When adding sections, follow this order if possible. If some sections do not make sense, don't add them:
1. `# Role & Objective`
- State who the model is supposed to be (the role) and what its main goal is.
2. `# Instructions`
- List the steps, rules, or actions the model should follow to complete the task.
3. \*(Any sub-sections)\*
- Include any extra sections such as sub-instructions, notes or guidelines already in the prompt that don’t fit into the main categories.
4. `# Reasoning Steps`
- Explain the step-by-step thinking or logic the model should use when working through the task.
5. `# Output Format`
- Describe exactly how the answer should be structured or formatted (e.g., what sections to include, how to label things, or what style to use).
6. `# Examples`
- Provide sample questions and answers or sample outputs to show the model what a good response looks like.
7. `# Context`
- Supply any background information, retrieved context, or extra details that help the model understand the task better.
- Don’t introduce new sections that don’t exist in the Baseline Prompt. For example, if there’s no `# Examples` or no `# Context` section, don’t add one.
4. If the prompt is for long context analysis or long tool use, repeat key Agentic Reminders, Important Reminders and Output Format points at the end.
5. If there are class labels, evaluation criterias or key concepts, add a definition to each to define them concretely.
5. Add a chain-of-thought trigger at the end of main instructions (like “Think step by step...”), unless one is already there or it would be repetitive.
6. For prompts involving tools or sample phrases, add Failure-mode bullets:
- “If you don’t have enough info to use a tool, ask the user first.”
- “Vary sample phrases to avoid repetition.”
7. Match the original tone (formal or casual) in anything you add.
8. \*\*Only output the full Revised Prompt\*\* — no explanations, comments, or diffs. Do not output "keep the original...", you need to fully output the prompt, no shortcuts.
9. Do not delete any sections or parts that are useful and add value to the prompt and doesn't go against the best practices.
10. \*\*Self-check before sending:\*\* Make sure there are no typos, duplicated lines, missing headings, or missed steps.
## GPT‑4.1 Best Practices Reference
1. \*\*Persistence reminder\*\*: Explicitly instructs the model to continue working until the user's request is fully resolved, ensuring the model does not stop early.
2. \*\*Tool‑calling reminder\*\*: Clearly tells the model to use available tools or functions instead of making assumptions or guesses, which reduces hallucinations.
3. \*\*Planning reminder\*\*: Directs the model to create a step‑by‑step plan and reflect before and after tool calls, leading to more accurate and thoughtful output.
4. \*\*Scaffold structure\*\*: Requires a consistent and predictable heading order (e.g., Role, Instructions, Output Format) to make prompts easier to maintain.
5. \*\*Instruction placement (long context)\*\*: Ensures that key instructions are duplicated or placed strategically so they remain visible and effective in very long prompts.
6. \*\*Chain‑of‑thought trigger\*\*: Adds a phrase that encourages the model to reason step by step, which improves logical and thorough responses.
7. \*\*Instruction‑conflict hygiene\*\*: Checks for and removes any contradictory instructions, ensuring that the most recent or relevant rule takes precedence.
8. \*\*Failure‑mode mitigations\*\*: Adds safeguards against common errors, such as making empty tool calls or repeating phrases, to improve reliability.
9. \*\*Diff / code‑edit format\*\*: Specifies a robust, line‑number‑free diff or code‑edit style for output, making changes clear and easy to apply.
10. \*\*Label Definitions\*\*: Defines all the key labels or terms that are used in the prompt so that the model knows what they mean.
"""`
```
```
`best\_practices\_response = client.responses.create(
model="o3",
input="BASELINE\_PROMPT: " + revised\_prompt,
instructions=BEST\_PRACTICES\_SYSTEM\_PROMPT,
reasoning={"effort": "high"}
)
improved\_prompt = best\_practices\_response.output\_text
print("\\nImproved prompt:\\n")
print(improved\_prompt)`
```
```
`
Improved prompt:
# Role & Objective
You are an impartial judge. Your goal is to determine which of two AI assistant answers better fulfills the user’s request.
# Instructions
Follow the steps below exactly and remain strictly neutral:
1. Read the User Question and both assistant answers in full.
2. Evaluate each answer against \*\*all\*\* six criteria, treating them with equal weight unless the user explicitly states otherwise:
• Helpfulness – Does the response address the user’s needs and provide useful information?
• Relevance – How closely does the response pertain to the user’s question and instructions?
• Accuracy – Is the information correct and factually reliable?
• Depth – Does the answer show insight, explanation, or reasoning?
• Creativity – Is the approach original or resourceful when appropriate?
• Level of Detail – Is the response thorough and complete?
3. Stay impartial:
• Ignore the order in which the answers appear.
• Ignore the length of each answer.
• Ignore the assistants’ names.
4. Make your decision solely on how well each response meets the criteria above.
5. After your analysis, produce a final verdict using the exact format in the Output Format section.
# Reasoning Steps
Think step by step:
1. For each criterion, briefly note strengths and weaknesses for Assistant A.
2. Repeat for Assistant B.
3. Compare the two sets of notes criterion by criterion.
4. Decide which answer is overall superior, or declare a tie if both are equally strong across all criteria.
# Output Format
First provide a short, objective explanation (1–3 concise paragraphs).
Then on a new line output only one of the following tokens (without quotes or extra text):
• [[A]] – if Assistant A is better
• [[B]] – if Assistant B is better
• [[C]] – if it is a tie
# Context (inserted at runtime)
[User Question]
{question}
[The Start of Assistant A’s Answer]
{answer\_a}
[The End of Assistant A’s Answer]
[The Start of Assistant B’s Answer]
{answer\_b}
[The End of Assistant B’s Answer]`
```
```
`show\_critique\_and\_diff(revised\_prompt, improved\_prompt)`
```
🕵️‍♂️ Critique & Diff (click to expand)
--- old
+++ new
@@ -1,28 +1,46 @@
-[System]
-Please act as an impartial judge and evaluate the quality of the responses provided by two AI assistants to the user question displayed below. You should choose the assistant that follows the user’s instructions and answers the user’s question better. Your evaluation should be based on the following criteria:
+# Role & Objective
+You are an impartial judge. Your goal is to determine which of two AI assistant answers better fulfills the user’s request.
-- Helpfulness: The extent to which the response addresses the user’s needs and provides useful information.
-- Relevance: How closely the response pertains to the user’s question and instructions.
-- Accuracy: The correctness and factual reliability of the information provided.
-- Depth: The level of insight, explanation, or reasoning demonstrated in the response.
-- Creativity: The originality or resourcefulness shown in addressing the question, where appropriate.
-- Level of Detail: The thoroughness and completeness of the response.
+# Instructions
+Follow the steps below exactly and remain strictly neutral:
-All criteria should be considered equally unless the user’s instructions indicate otherwise.
+1. Read the User Question and both assistant answers in full.
+2. Evaluate each answer against \*\*all\*\* six criteria, treating them with equal weight unless the user explicitly states otherwise:
+ • Helpfulness – Does the response address the user’s needs and provide useful information?
+ • Relevance – How closely does the response pertain to the user’s question and instructions?
+ • Accuracy – Is the information correct and factually reliable?
+ • Depth – Does the answer show insight, explanation, or reasoning?
+ • Creativity – Is the approach original or resourceful when appropriate?
+ • Level of Detail – Is the response thorough and complete?
+3. Stay impartial:
+ • Ignore the order in which the answers appear.
+ • Ignore the length of each answer.
+ • Ignore the assistants’ names.
+4. Make your decision solely on how well each response meets the criteria above.
+5. After your analysis, produce a final verdict using the exact format in the Output Format section.
-Begin your evaluation by comparing the two responses according to these criteria and provide a short explanation. Remain impartial by avoiding any position biases and ensuring that the order in which the responses were presented does not influence your decision. Do not allow the length of the responses or the names of the assistants to influence your evaluation.
+# Reasoning Steps
+Think step by step:
+1. For each criterion, briefly note strengths and weaknesses for Assistant A.
+2. Repeat for Assistant B.
+3. Compare the two sets of notes criterion by criterion.
+4. Decide which answer is overall superior, or declare a tie if both are equally strong across all criteria.
-Be as objective as possible by strictly adhering to the defined criteria above and basing your judgment solely on how well each response meets them.
+# Output Format
+First provide a short, objective explanation (1–3 concise paragraphs).
+Then on a new line output only one of the following tokens (without quotes or extra text):
+• [[A]] – if Assistant A is better
+• [[B]] – if Assistant B is better
+• [[C]] – if it is a tie
-After providing your explanation, output your final verdict by strictly following this format: "[[A]]" if assistant A is better, "[[B]]" if assistant B is better, and "[[C]]" for a tie. Choose "[[C]]" only if both responses are equally strong across all criteria.
-
-[User Question]
+# Context (inserted at runtime)
+[User Question]
{question}
-[The Start of Assistant A’s Answer]
-{answer\_a}
+[The Start of Assistant A’s Answer]
+{answer\_a}
[The End of Assistant A’s Answer]
-[The Start of Assistant B’s Answer]
-{answer\_b}
+[The Start of Assistant B’s Answer]
+{answer\_b}
[The End of Assistant B’s Answer]