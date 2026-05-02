Image Evals for Image Generation and Editing Use Cases
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
Jan 29, 2026
# Image Evals for Image Generation and Editing Use Cases
[ EO ](https://www.linkedin.com/in/emreokcular/)[ KL ](https://github.com/kathylau-oai)
[ Emre Okcular , ](https://www.linkedin.com/in/emreokcular/)[ Kathy Lau ](https://github.com/kathylau-oai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/multimodal/image_evals.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/multimodal/image_evals.ipynb)
## Introduction
Image models are increasingly used in real product workflows—design
mockups, marketing assets, virtual try-on, and high-precision edits to
existing brand materials. To trust these systems in production, you need
more than “does it look good?” You need **repeatable, workflow-specific
evaluation** that measures whether outputs satisfy requirements, fail
safely, and improve predictably over time.
Vision evaluations(or vision evals) are harder than text evals because the “answer” is an image
that mixes:
* **Hard constraints**: exact text, counts, attributes, locality
(“change only this region”).
* **Perceptual quality**: sharpness, coherence, realism, aesthetic
match.
* **Hidden failure modes**: subtle distortions, unintended edits, or
small text errors that look fine at a glance but break product
requirements—especially in editing.
A good vision eval does **not** score “a pretty picture.” It scores
whether the model is **reliable for a specific workflow**. Many images
that look visually strong still fail because text is wrong, style is
off-brand, or edits spill beyond the intended area. Image evals measure
**quality, controllability, and usability** for real prompts—not just
visual appeal.
#### What this guide covers
This cookbook focuses on building a practical image-eval system for four
major categories:
**1) Image generation evals**
* Instruction following (constraints satisfied)
* Text rendering (accuracy, legibility, placement)
* Style control (aesthetic match, brand/character consistency)
* Preference alignment (rubric labels + pairwise comparisons)
**2) Image editing evals**
* Transformation correctness (the requested change is done exactly)
* Locality (edits happen only where intended)
* Preservation (unrequested regions remain unchanged)
* Spatial control (edits applied to the correct instance / region)
**3) Human feedback alignment**
* Rubric-based labels and pairwise preferences to capture subjective
quality and “vibe”
* Calibration techniques to keep human judgments consistent over time
**4) Strategy for building evals**
* Start with non-negotiable correctness gates
* Add graded quality metrics once failures are controlled
* Tag failure modes to drive targeted iteration
## Building a Vision Eval Harness
A vision eval harness is a small, repeatable system that turns “did this
image work?” into **structured, comparable results** across prompts,
models, and settings.
At a high level, vision evals follow the same loop as any LLM eval
system:
**Inputs → Model → Outputs → Graders → Scores → Feedback → Improvement**
To make this reusable across the rest of the cookbook (generation +
editing), build the harness around **three plug-ins**:
1. **Test cases:** what to run (prompt + criteria + optional input
images/mask)
2. **Runners:** how to call a model and save output images
3. **Graders:** how to score an output (rubrics, LLM-as-judge, human
labels later)
**Setup**
Run this once. It:
* creates the API client
* creates `images/` in the folder.
```
`import os
from openai import OpenAI
client = OpenAI()
os.makedirs("../../images", exist\_ok=True)`
```
Below is a minimal `vision\_harness/` package you can drop into your repo.
For a full, runnable harness you can extend (edit, reproduce, and add your own cases), see [examples/evals/imagegen\_evals](https://github.com/openai/openai-cookbook/tree/main/examples/evals/imagegen_evals).
### vision\_harness/types.py
Keep the core types generic so you can reuse them for *both* image
generation and image editing.
```
`from \_\_future\_\_ import annotations
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Literal, Optional
TaskType = Literal["image\_generation", "image\_editing"]
ScoreValue = bool | int | float | str
@dataclass(frozen=True)
class ImageInputs:
"""Editing inputs: one or more reference images + optional mask."""
image\_paths: list[Path]
mask\_path: Optional[Path] = None
@dataclass(frozen=True)
class TestCase:
"""A single evaluable example."""
id: str
task\_type: TaskType
prompt: str
criteria: str
image\_inputs: Optional[ImageInputs] = None
@dataclass(frozen=True)
class ModelRun:
"""One model configuration to evaluate (useful for sweeps)."""
label: str
task\_type: TaskType
params: dict[str, Any] # e.g. {"model": "...", "quality": "...", ...}
@dataclass(frozen=True)
class Artifact:
"""A saved artifact from a run (usually an image)."""
kind: Literal["image"]
path: Path
mime: str = "image/png"
@dataclass
class ModelResponse:
"""Normalized output from any runner."""
artifacts: list[Artifact] = field(default\_factory=list)
raw: dict[str, Any] = field(default\_factory=dict) # optional debug payload
@dataclass(frozen=True)
class Score:
key: str
value: ScoreValue
reason: str = ""
tags: Optional[list[str]] = None`
```
### vision\_harness/io.py
You’ll use this in graders (LLM-as-judge) and sometimes in model calls.
```
`from \_\_future\_\_ import annotations
import base64
from pathlib import Path
\_MIME\_BY\_SUFFIX = {
".jpg": "image/jpeg",
".jpeg": "image/jpeg",
".png": "image/png",
".webp": "image/webp",
}
def image\_to\_data\_url(path: Path) -\> str:
mime = \_MIME\_BY\_SUFFIX.get(path.suffix.lower(), "image/png")
b64 = base64.b64encode(path.read\_bytes()).decode("utf-8")
return f"data:{mime};base64,{b64}"`
```
### vision\_harness/storage.py
```
`from \_\_future\_\_ import annotations
import time
from dataclasses import dataclass
from pathlib import Path
@dataclass
class OutputStore:
"""
Simple artifact store that writes directly to the root folder.
Note: This implementation writes directly to `root` (no per-test subfolders),
which keeps site-relative image paths stable for cookbook rendering.
"""
root: Path
def run\_dir(self, test\_id: str, model\_label: str) -\> Path:
# Ignore test/model subfolders; write everything to the root.
self.root.mkdir(parents=True, exist\_ok=True)
return self.root
def new\_basename(self, prefix: str) -\> str:
created\_ms = int(time.time() \* 1000)
return f"{prefix}\_{created\_ms}"
def save\_png(self, run\_dir: Path, basename: str, idx: int, png\_bytes: bytes) -\> Path:
out = run\_dir / f"{basename}\_{idx}.png"
out.write\_bytes(png\_bytes)
return out`
```
### vision\_harness/sweeps.py
```
`from \_\_future\_\_ import annotations
from itertools import product
from typing import Any
def grid\_sweep(
\*,
base\_label: str,
task\_type: TaskType,
fixed: dict[str, Any],
grid: dict[str, list[Any]],
) -\> list[ModelRun]:
keys = list(grid.keys())
runs: list[ModelRun] = []
for values in product(\*[grid[k] for k in keys]):
params = dict(fixed)
label\_parts = [base\_label]
for k, v in zip(keys, values):
params[k] = v
label\_parts.append(f"{k}={v}")
runs.append(ModelRun(label=",".join(label\_parts), task\_type=task\_type, params=params))
return runs`
```
### vision\_harness/runners.py
Two runners: one for **generation**, one for **editing**. Both return a
normalized `ModelResponse` containing saved output images.
```
`from \_\_future\_\_ import annotations
import base64
from contextlib import ExitStack
from typing import Optional
from openai import OpenAI
def \_mime\_for\_path(path) -\> str:
suffix = str(path).lower()
if suffix.endswith(".png"):
return "image/png"
if suffix.endswith(".jpg") or suffix.endswith(".jpeg"):
return "image/jpeg"
if suffix.endswith(".webp"):
return "image/webp"
return "application/octet-stream"
def \_extract\_b64\_items(images\_response) -\> list[str]:
b64\_items: list[str] = []
for item in getattr(images\_response, "data", []) or []:
b64 = getattr(item, "b64\_json", None)
if b64:
b64\_items.append(b64)
return b64\_items
class ImageGenerationRunner:
"""Text-to-image runner."""
def \_\_init\_\_(self, client: Optional[OpenAI] = None):
self.client = client or OpenAI()
def run(self, case: TestCase, run\_cfg: ModelRun, store: OutputStore) -\> ModelResponse:
assert case.task\_type == "image\_generation"
assert run\_cfg.task\_type == "image\_generation"
params = dict(run\_cfg.params)
model = params.pop("model")
n = int(params.pop("n", 1))
run\_dir = store.run\_dir(case.id, run\_cfg.label)
basename = store.new\_basename(f"gen\_{case.id}\_{run\_cfg.label}")
images\_response = self.client.images.generate(
model=model,
prompt=case.prompt,
n=n,
\*\*params,
)
artifacts: list[Artifact] = []
for idx, b64\_json in enumerate(\_extract\_b64\_items(images\_response)):
png\_bytes = base64.b64decode(b64\_json)
out\_path = store.save\_png(run\_dir, basename, idx, png\_bytes)
artifacts.append(Artifact(kind="image", path=out\_path))
return ModelResponse(artifacts=artifacts, raw={"model": model, "params": run\_cfg.params})
class ImageEditRunner:
"""Image editing runner (reference image(s) + optional mask)."""
def \_\_init\_\_(self, client: Optional[OpenAI] = None):
self.client = client or OpenAI()
def run(self, case: TestCase, run\_cfg: ModelRun, store: OutputStore) -\> ModelResponse:
assert case.task\_type == "image\_editing"
assert run\_cfg.task\_type == "image\_editing"
assert case.image\_inputs is not None and case.image\_inputs.image\_paths
params = dict(run\_cfg.params)
model = params.pop("model")
n = int(params.pop("n", 1))
run\_dir = store.run\_dir(case.id, run\_cfg.label)
basename = store.new\_basename(f"edit\_{case.id}\_{run\_cfg.label}")
with ExitStack() as stack:
image\_files = []
for p in case.image\_inputs.image\_paths:
f = stack.enter\_context(p.open("rb"))
image\_files.append((p.name, f, \_mime\_for\_path(p)))
mask\_file = None
if case.image\_inputs.mask\_path:
mf = stack.enter\_context(case.image\_inputs.mask\_path.open("rb"))
mask\_file = (case.image\_inputs.mask\_path.name, mf, \_mime\_for\_path(case.image\_inputs.mask\_path))
edit\_kwargs = dict(
model=model,
prompt=case.prompt,
image=image\_files,
n=n,
\*\*params,
)
if mask\_file is not None:
edit\_kwargs["mask"] = mask\_file
images\_response = self.client.images.edit(\*\*edit\_kwargs)
artifacts: list[Artifact] = []
for idx, b64\_json in enumerate(\_extract\_b64\_items(images\_response)):
png\_bytes = base64.b64decode(b64\_json)
out\_path = store.save\_png(run\_dir, basename, idx, png\_bytes)
artifacts.append(Artifact(kind="image", path=out\_path))
return ModelResponse(artifacts=artifacts, raw={"model": model, "params": run\_cfg.params})`
```
### vision\_harness/graders.py
A clean grader interface + a reusable **LLM-as-judge** grader that can
be used for both generation and editing by changing how you build the
judge inputs.
```
`from \_\_future\_\_ import annotations
import json
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable, Optional, Protocol
from openai import OpenAI
class Grader(Protocol):
key: str
def grade(self, response: ModelResponse, case: TestCase) -\> Score | list[Score]: ...
def pick\_first\_image(response: ModelResponse) -\> Optional[Path]:
for artifact in response.artifacts:
if artifact.kind == "image":
return artifact.path
return None
def build\_generation\_judge\_content(case: TestCase, output\_image: Path) -\> list[dict]:
return [
{
"type": "input\_text",
"text": f"Prompt:\\n{case.prompt}\\n\\nCriteria:\\n{case.criteria}",
},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(output\_image),
},
]
def build\_editing\_judge\_content(case: TestCase, output\_image: Path) -\> list[dict]:
assert case.image\_inputs is not None and case.image\_inputs.image\_paths
content: list[dict] = [
{
"type": "input\_text",
"text": f"Edit instruction:\\n{case.prompt}\\n\\nCriteria:\\n{case.criteria}",
}
]
for image\_path in case.image\_inputs.image\_paths:
content.append(
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(image\_path),
}
)
if case.image\_inputs.mask\_path:
content.append(
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(case.image\_inputs.mask\_path),
}
)
content.append(
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(output\_image),
}
)
return content
def default\_schema() -\> dict:
return {
"type": "object",
"properties": {
"pass": {"type": "boolean"},
"reason": {"type": "string"},
},
"required": ["pass", "reason"],
"additionalProperties": False,
}
@dataclass
class LLMajRubricGrader:
"""
Reusable vision LLM-as-judge grader.
- Provide a system prompt + a content\_builder for generation/editing.
- Optionally provide a custom JSON schema and parser.
"""
key: str
system\_prompt: str
content\_builder: Callable[[TestCase, Path], list[dict]]
judge\_model: str = "gpt-5.2"
client: Optional[OpenAI] = None
json\_schema\_name: str = "vision\_eval\_result"
json\_schema: dict = field(default\_factory=default\_schema)
result\_parser: Optional[Callable[[dict, str], Score | list[Score]]] = None
def \_parse\_result(self, data: dict) -\> Score | list[Score]:
if self.result\_parser:
return self.result\_parser(data, self.key)
return Score(
key=self.key,
value=bool(data.get("pass", False)),
reason=(data.get("reason") or "").strip(),
tags=data.get("tags") or None,
)
def grade(self, response: ModelResponse, case: TestCase) -\> Score | list[Score]:
output\_image = pick\_first\_image(response)
if not output\_image:
return Score(key=self.key, value=False, reason="No output image artifact found")
client = self.client or OpenAI()
content = self.content\_builder(case, output\_image)
completion = client.responses.create(
model=self.judge\_model,
input=[
{"role": "system", "content": self.system\_prompt},
{"role": "user", "content": content},
],
text={
"format": {
"type": "json\_schema",
"name": self.json\_schema\_name,
"schema": self.json\_schema,
"strict": True,
}
},
)
data = json.loads(completion.output\_text)
return self.\_parse\_result(data)`
```
### vision\_harness/evaluate.py
A simple evaluation loop that returns plain Python data (no “eval row”
class). Later sections can write their own reporting/CSV utilities on
top.
```
`from \_\_future\_\_ import annotations
from typing import Any
def \_as\_score\_list(score\_or\_scores: Score | list[Score]) -\> list[Score]:
if isinstance(score\_or\_scores, list):
return score\_or\_scores
return [score\_or\_scores]
def evaluate(
\*,
cases: list[TestCase],
model\_runs: list[ModelRun],
graders: list[Grader],
output\_store: OutputStore,
) -\> list[dict[str, Any]]:
gen\_runner = ImageGenerationRunner()
edit\_runner = ImageEditRunner()
results: list[dict[str, Any]] = []
for case in cases:
for run\_cfg in model\_runs:
if run\_cfg.task\_type != case.task\_type:
continue
if case.task\_type == "image\_generation":
response = gen\_runner.run(case, run\_cfg, output\_store)
elif case.task\_type == "image\_editing":
response = edit\_runner.run(case, run\_cfg, output\_store)
else:
raise ValueError(f"Unknown task\_type: {case.task\_type}")
score\_map: dict[str, Any] = {}
reason\_map: dict[str, str] = {}
for grader in graders:
scored = grader.grade(response, case)
for score in \_as\_score\_list(scored):
score\_map[score.key] = score.value
reason\_map[score.key] = score.reason
results.append(
{
"test\_id": case.id,
"model\_label": run\_cfg.label,
"task\_type": case.task\_type,
"artifact\_paths": [str(a.path) for a in response.artifacts],
"scores": score\_map,
"reasons": reason\_map,
"run\_params": run\_cfg.params,
}
)
return results`
```
### Result Table Rendering Helpers
```
`import os
from html import escape
from IPython.display import HTML, display
def summarize\_scores(scores: dict[str, object]) -\> str:
return os.linesep.join(f"{k}: {scores[k]}" for k in sorted(scores.keys()))
def summarize\_reasons(reasons: dict[str, str]) -\> str:
verdict\_reason = (reasons.get("verdict") or "").strip()
if verdict\_reason:
return verdict\_reason
return os.linesep.join(f"{k}: {reasons[k]}" for k in sorted(reasons.keys()) if reasons[k])
def \_pre(text: str) -\> str:
return (
"\<pre style='white-space:pre-wrap; word-break:break-word; margin:0'\>"
f"{escape(text)}"
"\</pre\>"
)
def render\_result\_table(
\*,
case: TestCase,
result: dict[str, object],
title: str,
) -\> None:
sep = os.linesep
prompt\_text = f"{case.prompt}{sep}{sep}Criteria:{sep}{case.criteria}"
scores = result["scores"]
reasons = result["reasons"]
prompt\_html = \_pre(prompt\_text)
scores\_html = \_pre(summarize\_scores(scores))
reasons\_html = \_pre(summarize\_reasons(reasons))
table\_html = (
"\<table style='width:100%; table-layout:fixed; border-collapse:collapse;'\>"
"\<colgroup\>"
"\<col style='width:33%'\>"
"\<col style='width:33%'\>"
"\<col style='width:33%'\>"
"\</colgroup\>"
"\<thead\>\<tr\>"
"\<th style='text-align:left; padding:8px; border-bottom:1px solid #ddd'\>Input Prompt\</th\>"
"\<th style='text-align:left; padding:8px; border-bottom:1px solid #ddd'\>Scores\</th\>"
"\<th style='text-align:left; padding:8px; border-bottom:1px solid #ddd'\>Reasoning\</th\>"
"\</tr\>\</thead\>"
"\<tbody\>\<tr\>"
f"\<td style='text-align:left; padding:8px; vertical-align:top'\>{prompt\_html}\</td\>"
f"\<td style='text-align:left; padding:8px; vertical-align:top'\>{scores\_html}\</td\>"
f"\<td style='text-align:left; padding:8px; vertical-align:top'\>{reasons\_html}\</td\>"
"\</tr\>\</tbody\>\</table\>"
)
display(HTML(f"\<div style='font-weight:600; margin:6px 0'\>{escape(title)}\</div\>"))
display(HTML(table\_html))`
```
Later cookbook sections will only need to provide:
1. A list of `TestCase` objects for the use case (UI mockups, marketing
graphics, virtual try-on, logo edits, etc.)
2. A set of `ModelRun`s (single run or a sweep with `grid\_sweep`)
3. A set of graders, typically:
* **Gating graders** (pass/fail): non-negotiables ex: instruction
following, text correctness, locality/preservation
* **Graded metrics** (0–5): quality dimensions ex:
realism/usability, layout/hierarchy, artifact severity
* Optional: human rubric labels and pairwise prefs (stored outside
the harness)
This keeps the rest of the cookbook focused on **what to measure** per
use case—without rewriting harness plumbing each time.
## Image Generation Evals
**Use Case Ideas: UI mockups, marketing graphics/posters**
**Goal: evaluate text-to-image quality, controllability, and usefulness
for real prompts**
Covers:
* **instruction following** (constraints satisfied),
* **Text rendering** (generated text is accurate, legible, and placed
correctly),
* **Styling** (requested aesthetic + visual quality, may include brand,
character, and product consistency)
* **Human feedback alignment** (rubric-based labels + pairwise prefs).
Image generation models are used to create artifacts that influence real
work: UI mockups, product designs, marketing graphics, and internal
presentations. In these contexts, images are not judged purely on visual
appeal. They are judged on whether they communicate intent, follow
constraints, and are usable by downstream stakeholders.
### UI Mockups
UI mockups generated by image models are increasingly used for early
product exploration, design ideation, and internal reviews. In these
workflows, mockups are not just visual inspiration. They are
communication tools that help designers, engineers, and stakeholders
reason about layout, hierarchy, interaction intent, and feature scope
before anything is built. As a result, success is defined less by
aesthetic taste and more by whether the output can plausibly function as
a product artifact.
Example:
This section shows how to evaluate a generated UI mockup using a screen
level example. The goal is to evaluate whether the generated UI consists
of a coherent layout, uses recognizable components, and represents a
plausible product experience.
**Why UI mockup evals are different**
UI mockups combine several difficult evaluation dimensions:
1. **Component Fidelity (gating)**
The generated image must clearly depict the requested screen type
and state. Buttons should look clickable, inputs should look
editable, and navigation should look like navigation.
2. **Layout Realization (graded)**
A good UI mockup communicates instantly what the user can do and
what matters most. The layout should make primary actions obvious,
secondary actions clearly subordinate, and information grouped in a
way that reflects real interaction flow
3. **In-Image Text Rendering (gating)**
UI text encodes functionality. Labels, headings, and calls to action
must be legible and correctly rendered.
**Example task: mobile checkout screen generation**
* Scenario: a consumer ecommerce app needs a mobile checkout screen to
review an order and complete payment.
* Prompt guidance: be explicit about screen type, platform, required UI
elements, exact button/link text, hierarchy constraints, and
disallowed extras.
* Implementation: the full prompt and criteria live in the harness
setup code cell below (`ui\_prompt` and `ui\_criteria`).
#### What to evaluate (practical metrics):
##### 1) Instruction Following — Pass / Fail (gate)
Most UI mockup evals start with instruction fidelity. At a basic level,
the question is simple: did the model generate the screen that was asked
for? If the prompt specifies a mobile checkout screen, the output should
look like a mobile checkout screen, not a generic landing page. Required
sections, states, or constraints should be present, and the overall
structure should match the intent of the request. This dimension is
often the most heavily weighted, because if the model misses the core
ask, the rest of the output does not matter. Once a UI mockup satisfies
the basic instruction, evaluation shifts to whether the screen is usable
and coherent as a product artifact.
**PASS if**
* The correct screen type and platform context are present.
* All required sections, states, or constraints are included.
**FAIL if**
* Missing any required components or the output alters the UI’s purpose.
##### 2) Layout and Hierarchy — 0–5
Measures whether the screen communicates clearly at a glance.
**What to look for:**
* Clear visual hierarchy between primary and secondary actions
* Consistent alignment and spacing
* Logical grouping of related elements
##### 3) Text rendering and legibility — Pass / Fail (gate)
Labels, headings, and calls to action need to be readable and
unambiguous.
**PASS if**
* Text is readable, correctly spelled, and sensibly labeled.
* Font sizes reflect hierarchy (headings vs labels vs helper text).
**FAIL if**
* Any critical text is unreadable, cut off, misspelled, or distorted.
##### 4) UI Realism and Usability — *0–5*
Measures whether the mockup resembles a plausible product interface.
**What to look for:**
* Inputs look editable / Buttons look clickable
* Navigation looks like navigation
* Interactive elements are visually distinct from static content
##### 5) Human feedback (quick and high leverage)
UI “usability clarity” is where humans add the most value. Keep it lightweight and focused on interaction intent.
* Rubric labels (fast):
* Would you use this mockup to iterate on a real product screen? (Y/N)
* If N, why? (missing section, action button unclear, text unreadable, layout confusing, etc.)
* Overall usability clarity: 1–5
* Common failure tags (for debugging + iteration):
* `wrong\_screen\_type`
* `missing\_required\_section`
* `extra\_ui\_elements`
* `primary\_cta\_not\_clear`
* `text\_unreadable\_or\_garbled`
* `affordances\_unclear`
* `layout\_confusing`
**Verdict rules (how to convert metrics into a single pass/fail)**
* **Instruction Following must PASS**
* **Layout and Hierarchy ≥ 3**
* **Text Rendering must PASS**
* **UI Realism ≥ 3**
If any rule fails → overall **FAIL**.
**Example `TestCase` set (small but high-signal)**
Start with a few cases that cover common UI mockup variants and edge
cases.
1. **Mobile** **checkout screen** (the “checkout UI mockup” prompt
above)
2. **Minimal layout** (header + order total + primary CTA only) - tests
layout and hierarchy with sparse elements.
3. **Dense hierarchy** (order summary + payment method + promo row +
taxes + two secondary actions) - tests hierarchy under information
load.
4. **Exact CTA text** (primary button text must be exactly “Place
Order”) - tests in-image text rendering fidelity.
5. **Secondary action presence (i**nclude both “Edit Cart” and “Change
payment method”) - tests secondary actions remain visually
subordinate.
6. **Placement constraint** (require order total directly above the
primary CTA)
7. **Platform fidelity** (mobile vs desktop version) - tests screen
framing and platform cues.
**LLM-as-judge rubric prompt**
Below is a judge prompt aligned to your existing `LLMajRubricGrader`. It
returns structured metric scores + an overall verdict.
You can use this with your existing grader by changing the JSON schema
to include the fields below (or create separate graders per metric if
you prefer).
#### System Prompt (UI mockup judge)
```
`PROMPT = """\<core\_mission\>
Evaluate whether a generated UI mockup image represents a usable mobile checkout screen by checking screen type fidelity, layout/hierarchy, in-image text rendering, and UI affordance clarity.
\</core\_mission\>
\<role\>
You are an expert evaluator of UI mockups used by designers and engineers. You care about structural correctness, readable UI text, clear hierarchy, and realistic rendering of UI elements.
\</role\>
\<scope\_constraints\>
- Judge only against the provided instructions.
- Be strict about required UI elements and exact button/link text.
- Do NOT infer intent beyond what is explicitly stated.
- Do NOT reward creativity that violates constraints.
- Missing or extra required components are serious errors.
- If the UI intent or function is unclear, score conservatively.
\</scope\_constraints\>
\<metrics\>
1) instruction\_following: PASS/FAIL
2) layout\_hierarchy: 0–5
3) in\_image\_text\_rendering: PASS/FAIL
4) ui\_affordance\_rendering: 0–5
\</metrics\>
Evaluate EACH metric independently using the definitions below.
--------------------------------
1) Instruction Following (PASS / FAIL)
--------------------------------
PASS if:
- All required components are present.
- No unrequested components or features are added.
- The screen matches the requested type and product context.
FAIL if:
- Any required component is missing.
- Any unrequested component materially alters the UI.
- The screen does not match the requested type.
--------------------------------
2) Layout and Hierarchy (0–5)
--------------------------------
5: Layout is clear, coherent, and immediately usable.
Hierarchy, grouping, spacing, and alignment are strong.
3: Generally understandable, but one notable hierarchy or layout issue
that would require iteration.
0-2: Layout problems materially hinder usability or comprehension.
--------------------------------
3) In-Image Text Rendering (PASS / FAIL)
--------------------------------
PASS if:
- Text is readable, correctly spelled, and sensibly labeled.
- Font sizes reflect hierarchy (headings vs labels vs helper text).
FAIL if:
- Any critical text is unreadable, cut off, misspelled, or distorted.
--------------------------------
4) UI Affordance Rendering (0–5)
--------------------------------
5: Clearly resembles a real product interface that designers could use.
3: Marginally plausible; intent is visible but execution is weak.
0-2: Poor realism; interface would be difficult to use in practice.
\<verdict\_rules\>
- Instruction Following must PASS.
- In-Image Text Rendering must PASS.
- Layout and Hierarchy score must be ≥ 3.
- UI Affordance Rendering score must be ≥ 3.
If ANY rule fails, the overall verdict is FAIL.
Do not average scores to determine the verdict.
\</verdict\_rules\>
\<output\_constraints\>
Return JSON only.
No extra text.
\</output\_constraints\>
"""`
```
#### Recommended JSON Output
```
`{
"verdict": "PASS",
"instruction\_following": True,
"layout\_hierarchy": 3,
"in\_image\_text\_rendering": True,
"ui\_affordance\_rendering": 4,
"reason": "..."
}`
```
```
`{'verdict': 'PASS',
'instruction\_following': True,
'layout\_hierarchy': 3,
'in\_image\_text\_rendering': True,
'ui\_affordance\_rendering': 4,
'reason': '...'}`
```
### UI Mockup Example: Harness Setup
Define a UI mockup test case, a model run, and an output store under `images/`.
```
`# Capture the UI judge prompt before PROMPT is overwritten later.
ui\_judge\_prompt = PROMPT
ui\_prompt = """Generate a high-fidelity mobile checkout screen for an ecommerce app.
Orientation: portrait.
Screen type: checkout / order review.
Use the REQUIRED TEXT:
- Checkout
- Place Order
- Edit Cart
Constraints:
- Order total appears directly above the primary CTA.
- Primary CTA is the most visually prominent element.
- Do not include popups, ads, marketing copy, or extra screens.
- Do not include placeholder or lorem ipsum text.
"""
ui\_criteria = """The image clearly depicts a mobile checkout screen.
All required sections are present and visually distinct.
UI elements look clickable/editable and follow common conventions.
Primary vs secondary actions are unambiguous.
No extra UI states, decorative noise, or placeholder text."""
ui\_case = TestCase(
id="ui\_checkout\_mockup",
task\_type="image\_generation",
prompt=ui\_prompt,
criteria=ui\_criteria,
)
ui\_run = ModelRun(
label="gpt-image-1.5-ui",
task\_type="image\_generation",
params={
"model": "gpt-image-1.5",
"n": 1,
"size": "1024x1024",
},
)
ui\_store = OutputStore(root=Path("../../images"))`
```
### UI Mockup Example: Run And Grade
Run the harness and grade the UI mockup using the UI judge rubric.
```
`ui\_schema = {
"type": "object",
"properties": {
"verdict": {"type": "string"},
"instruction\_following": {"type": "boolean"},
"layout\_hierarchy": {"type": "number"},
"in\_image\_text\_rendering": {"type": "boolean"},
"ui\_affordance\_rendering": {"type": "number"},
"reason": {"type": "string"},
},
"required": [
"verdict",
"instruction\_following",
"layout\_hierarchy",
"in\_image\_text\_rendering",
"ui\_affordance\_rendering",
"reason",
],
"additionalProperties": False,
}
def parse\_ui\_result(data: dict, base\_key: str) -\> list[Score]:
return [
Score(key="instruction\_following", value=bool(data["instruction\_following"]), reason=""),
Score(key="layout\_hierarchy", value=float(data["layout\_hierarchy"]), reason=""),
Score(key="in\_image\_text\_rendering", value=bool(data["in\_image\_text\_rendering"]), reason=""),
Score(key="ui\_affordance\_rendering", value=float(data["ui\_affordance\_rendering"]), reason=""),
Score(key="verdict", value=str(data["verdict"]), reason=(data.get("reason") or "").strip()),
]
ui\_grader = LLMajRubricGrader(
key="ui\_eval",
system\_prompt=ui\_judge\_prompt,
content\_builder=build\_generation\_judge\_content,
judge\_model="gpt-5.2",
json\_schema\_name="ui\_mockup\_eval",
json\_schema=ui\_schema,
result\_parser=parse\_ui\_result,
)
ui\_results = evaluate(
cases=[ui\_case],
model\_runs=[ui\_run],
graders=[ui\_grader],
output\_store=ui\_store,
)
ui\_result = ui\_results[0]
ui\_result`
```
```
`{'test\_id': 'ui\_checkout\_mockup',
'model\_label': 'gpt-image-1.5-ui',
'task\_type': 'image\_generation',
'artifact\_paths': ['/cookbook/assets/images/gen\_ui\_checkout\_mockup\_gpt-image-1.5-ui\_1769656414221\_0.png'],
'scores': {'instruction\_following': True,
'layout\_hierarchy': 5.0,
'in\_image\_text\_rendering': True,
'ui\_affordance\_rendering': 5.0,
'verdict': 'PASS'},
'reasons': {'instruction\_following': '',
'layout\_hierarchy': '',
'in\_image\_text\_rendering': '',
'ui\_affordance\_rendering': '',
'verdict': 'All required text is present ("Checkout", "Edit Cart", "Place Order"). Screen clearly matches a mobile checkout/order review with distinct sections (Shipping Information, Payment Method, Items, Order Summary). Order Total appears directly above the primary CTA, and the "Place Order" button is the most visually prominent element. No popups, ads, marketing copy, or lorem/placeholder text. Text is crisp and readable with appropriate hierarchy. UI elements (back arrow, Edit Cart link, Change links, primary CTA) have clear, realistic affordances.'},
'run\_params': {'model': 'gpt-image-1.5', 'n': 1, 'size': '1024x1024'}}`
```
### UI Mockup Results
Show the prompt, generated image, and scores in a single pandas table.
```
`render\_result\_table(case=ui\_case, result=ui\_result, title="UI Mockup: Prompt vs. Scores")`
```
UI Mockup: Prompt vs. Scores
|Input Prompt|Scores|Reasoning|
|
```
Generate a high-fidelity mobile checkout screen for an ecommerce app.
Orientation: portrait.
Screen type: checkout / order review.
Use the REQUIRED TEXT:
- Checkout
- Place Order
- Edit Cart
Constraints:
- Order total appears directly above the primary CTA.
- Primary CTA is the most visually prominent element.
- Do not include popups, ads, marketing copy, or extra screens.
- Do not include placeholder or lorem ipsum text.
Criteria:
The image clearly depicts a mobile checkout screen.
All required sections are present and visually distinct.
UI elements look clickable/editable and follow common conventions.
Primary vs secondary actions are unambiguous.
No extra UI states, decorative noise, or placeholder text.
```
|
```
in\_image\_text\_rendering: True
instruction\_following: True
layout\_hierarchy: 5.0
ui\_affordance\_rendering: 5.0
verdict: PASS
```
|
```
All required text is present (“Checkout”, “Edit Cart”, “Place Order”). Screen clearly matches a mobile checkout/order review with distinct sections (Shipping Information, Payment Method, Items, Order Summary). Order Total appears directly above the primary CTA, and the “Place Order” button is the most visually prominent element. No popups, ads, marketing copy, or lorem/placeholder text. Text is crisp and readable with appropriate hierarchy. UI elements (back arrow, Edit Cart link, Change links, primary CTA) have clear, realistic affordances.
```
|
### Marketing Graphics Generation
Marketing graphics are a “high-stakes text-to-image” workflow: the
output is meant to ship (or at least be reviewed as if it could ship).
A flyer can look “nice” but still fail if the copy is wrong, the offer
is unclear, or the layout hides the key message.
This section shows how to evaluate **flyer generation** with a coffee
shop example. The goal is to make evaluation workflow-relevant: can a
marketer or designer use this output with minimal edits?
Example:
**Why marketing graphics evals are different**
Marketing images combine three hard problem types:
1. Exact text requirements (gating)
2. Layout + hierarchy (graded)
3. Style + brand consistency (graded + optional human prefs)
**Example task: Coffee shop flyer generation**
* Scenario: a local coffee shop needs a promotional flyer for a
limited-time drink and a weekday deal.
* Prompt guidance: be explicit about the deliverable, required copy,
hierarchy, and disallowed extras.
* Implementation: the full prompt and criteria live in the harness
setup code cell below (`coffee\_generation\_prompt` and
`coffee\_criteria`).
#### What to evaluate (practical metrics):
Use a mix of gates (hard constraints) and graded signals (quality).
##### 1) Instruction following — Pass / Fail (gate)
Marketing assets fail fast if they don’t match the spec.
**PASS if**
* Correct deliverable type: clearly a flyer/poster layout (not a UI screen, not a random photo).
* Required components exist (headline/subheadline/offer/CTA/footer + hero image).
**FAIL if**
* Missing any required component or the output is not recognizably a flyer.
##### 2) Text rendering accuracy — Pass / Fail (gate)
This is usually the #1 production failure mode.
**PASS if**
* All required text strings are present and exactly correct (spelling, punctuation, capitalization, symbols).
* Text is readable (not smeared, clipped, warped, or overlapping).
**FAIL if**
* Any required text is incorrect/missing/unreadable, or any extra text appears.
Tip: if your workflow requires “exact copy,” treat this as a hard gate. Don’t average it away.
##### 3) Layout and hierarchy — 0–5
Measures whether the flyer communicates clearly at a glance.
**What to look for:**
* Clear priority: headline dominates, subheadline supports, offer stands out, footer is secondary.
* Alignment and spacing feel intentional (no crowded clusters, no random floating elements).
* Read order is unambiguous.
##### 4) Style and brand fit — 0–5
Measures whether it matches the requested “vibe” and avoids off-brand looks.
**What to look for:**
* Warm, cozy, minimal; specialty coffee visual language.
* Consistent palette and typography feel (not multiple conflicting styles).
* Avoids cartoonish illustration if the prompt requested photo-real.
##### 5) Visual quality and artifact severity — 0–5
A flyer can be “correct” but still unusable if it’s visually broken.
**What to look for:**
* No distorted objects, broken hands/cups, melted foam textures, weird artifacts around text.
* Background texture is subtle (doesn’t compete with copy).
* Hero image looks appetizing and coherent.
##### 6) Human feedback (quick and high leverage)
UI “usability clarity” is where humans add the most value. Keep it lightweight and focused on interaction intent.
* Rubric labels (fast):
* Would you use this mockup to iterate on a real product screen? (Y/N)
* If N, why? (missing section, action button unclear, text unreadable, layout confusing, etc.)
* Overall usability clarity: 1–5
* Common failure tags (for debugging + iteration):
* `wrong\_screen\_type`
* `missing\_required\_section`
* `extra\_ui\_elements`
* `primary\_cta\_not\_clear`
* `text\_unreadable\_or\_garbled`
* `affordances\_unclear`
* `layout\_confusing`
**Verdict rules (how to convert metrics into a single pass/fail)**
A simple and strict set of rules works well:
* **Instruction following must PASS**
* **Text rendering must PASS**
* **Layout and hierarchy ≥ 3**
* **Style and brand fit ≥ 3**
* **Visual quality ≥ 3**
If any rule fails → overall **FAIL**.
(Do not average scores to override text correctness.)
**Example `TestCase` set (small but high-signal)**
Start with \~8–12 cases to cover common flyer variants and edge cases.
1. Seasonal campaign (the “Winter Latte Week” prompt above)
2. Minimal text (only 2 lines + logo + hours) — tests sparse layouts
3. Dense info (menu highlights + deal + two CTAs) — tests hierarchy under load
4. Strict no-extra-text — tests hallucinated filler copy
5. Exact punctuation (“20% OFF • Mon–Thu”) — tests symbol fidelity
6. Two offers (“BOGO Tuesdays” + “Happy Hour 2–4”) — tests multi-badge layout
7. Colorway constraint (“use only cream + dark brown + muted orange”)
8. Accessibility variant (high contrast, large text, simple background)
**LLM-as-judge rubric prompt**
Below is a judge prompt aligned to your existing `LLMajRubricGrader`. It returns structured metric scores + an overall verdict.
You can use this with your existing grader by changing the JSON schema to include the fields below (or create separate graders per metric if you prefer).
```
`PROMPT = """\<core\_mission\>
Evaluate whether a generated marketing flyer is usable for a real coffee shop
promotion by checking instruction adherence, exact text correctness, layout clarity,
style fit, and artifact severity.
\</core\_mission\>
\<role\>
You are an expert evaluator of marketing design deliverables.
You care about correctness, readability, hierarchy, and brand-fit.
You do NOT reward creativity that violates constraints.
\</role\>
\<scope\_constraints\>
- Judge ONLY against the provided prompt and criteria.
- Be strict about required copy: spelling, punctuation, casing, and symbols must match exactly.
- Extra or missing text is a serious error.
- If unsure, score conservatively (lower score).
\</scope\_constraints\>
\<metrics\>
1) instruction\_following: PASS/FAIL
2) text\_rendering: PASS/FAIL
3) layout\_hierarchy: 0-5
4) style\_brand\_fit: 0-5
5) visual\_quality: 0-5
Use these anchors:
Layout/Hierarchy 5 = instantly readable; clear order; strong spacing/alignment.
3 = understandable but needs iteration (one clear issue).
0-2 = confusing or hard to parse.
Style/Brand Fit 5 = clearly matches requested vibe; consistent; not off-style.
3 = generally matches but with noticeable mismatch.
0-2 = wrong style (e.g. cartoonish when photo-real requested).
Visual Quality 5 = clean; no distracting artifacts; hero image coherent.
3 = minor artifacts but still usable.
0-2 = obvious artifacts or distortions that break usability.
\</metrics\>
\<verdict\_rules\>
Overall verdict is FAIL if:
- instruction\_following is FAIL, OR
- text\_rendering is FAIL, OR
- any of layout\_hierarchy/style\_brand\_fit/visual\_quality is \< 3.
Otherwise PASS.
\</verdict\_rules\>
\<output\_constraints\>
Return JSON only.
No extra text.
\</output\_constraints\>
"""`
```
#### Recommended JSON Output
```
`{
"verdict": "PASS",
"instruction\_following": True,
"text\_rendering": True,
"layout\_hierarchy": 4,
"style\_brand\_fit": 4,
"visual\_quality": 3,
"reason": "..."
}`
```
```
`{'verdict': 'PASS',
'instruction\_following': True,
'text\_rendering': True,
'layout\_hierarchy': 4,
'style\_brand\_fit': 4,
'visual\_quality': 3,
'reason': '...'}`
```
### Coffee Example: Harness Setup
Define a single marketing flyer test case, a model run, and an output store.
```
`# Run the harness for a single coffee flyer generation case.
coffee\_generation\_prompt = """Create a print-ready vertical A4 flyer for a coffee shop called Sunrise Coffee.
Use a warm, cozy, minimal specialty coffee aesthetic (not cartoonish).
Required text (must be exact):
- WINTER LATTE WEEK
- Try our Cinnamon Oat Latte
- 20% OFF - Mon-Thu
- Order Ahead
- 123 Market St - 7am-6pm
Do not include any other words, prices, URLs, or QR codes.
"""
coffee\_criteria = """All required text appears exactly as written and is legible.
Layout reads clearly: shop name -\> headline -\> subheadline -\> offer -\> CTA -\> footer.
Style matches warm, cozy, specialty coffee and is not cartoonish.
No extra text, watermarks, or irrelevant UI-like elements."""
coffee\_case = TestCase(
id="coffee\_flyer\_generation",
task\_type="image\_generation",
prompt=coffee\_generation\_prompt,
criteria=coffee\_criteria,
)
coffee\_run = ModelRun(
label="gpt-image-1.5",
task\_type="image\_generation",
params={
"model": "gpt-image-1.5",
"n": 1,
"size": "1024x1024",
},
)
# Save artifacts under the repo images/ folder so they render on the site.
coffee\_store = OutputStore(root=Path("../../images"))`
```
### Coffee Example: Run And Grade
Run the harness and score the output with the marketing judge rubric.
```
`# Use the prebuilt graders + evaluate helpers with a structured marketing schema.
from openai import OpenAI
marketing\_schema = {
"type": "object",
"properties": {
"verdict": {"type": "string"},
"instruction\_following": {"type": "boolean"},
"text\_rendering": {"type": "boolean"},
"layout\_hierarchy": {"type": "number"},
"style\_brand\_fit": {"type": "number"},
"visual\_quality": {"type": "number"},
"reason": {"type": "string"},
},
"required": [
"verdict",
"instruction\_following",
"text\_rendering",
"layout\_hierarchy",
"style\_brand\_fit",
"visual\_quality",
"reason",
],
"additionalProperties": False,
}
def parse\_marketing\_result(data: dict, base\_key: str) -\> list[Score]:
return [
Score(key="instruction\_following", value=bool(data["instruction\_following"]), reason=""),
Score(key="text\_rendering", value=bool(data["text\_rendering"]), reason=""),
Score(key="layout\_hierarchy", value=float(data["layout\_hierarchy"]), reason=""),
Score(key="style\_brand\_fit", value=float(data["style\_brand\_fit"]), reason=""),
Score(key="visual\_quality", value=float(data["visual\_quality"]), reason=""),
Score(key="verdict", value=str(data["verdict"]), reason=(data.get("reason") or "").strip()),
]
marketing\_grader = LLMajRubricGrader(
key="marketing\_eval",
system\_prompt=PROMPT,
content\_builder=build\_generation\_judge\_content,
judge\_model="gpt-5.2",
json\_schema\_name="marketing\_flyer\_eval",
json\_schema=marketing\_schema,
result\_parser=parse\_marketing\_result,
)
coffee\_results = evaluate(
cases=[coffee\_case],
model\_runs=[coffee\_run],
graders=[marketing\_grader],
output\_store=coffee\_store,
)
coffee\_result = coffee\_results[0]
# Simple alternative: exact text-rendering check via OCR-style extraction.
REQUIRED\_TEXT = {
"WINTER LATTE WEEK",
"Try our Cinnamon Oat Latte",
"20% OFF • Mon–Thu",
"Order Ahead",
"123 Market St • 7am–6pm",
}
def extract\_text\_from\_flyer(image\_path: str | Path, model: str = "gpt-5.2") -\> list[str]:
judge\_client = client if "client" in globals() else OpenAI()
image\_url = image\_to\_data\_url(Path(image\_path))
instructions = (
"List every piece of text visible in this flyer image. "
"Return one line per text item and preserve capitalization, punctuation, and spacing exactly."
)
response = judge\_client.responses.create(
model=model,
instructions=instructions,
input=[
{
"role": "user",
"content": [
{"type": "input\_image", "image\_url": image\_url},
],
}
],
)
return [line.strip() for line in (response.output\_text or "").splitlines() if line.strip()]
coffee\_image\_path = Path(coffee\_result["artifact\_paths"][0])
extracted\_lines = extract\_text\_from\_flyer(coffee\_image\_path)
missing = sorted(REQUIRED\_TEXT - set(extracted\_lines))
extra = sorted(set(extracted\_lines) - REQUIRED\_TEXT)
text\_rendering\_pass = not missing and not extra
parts = []
if missing:
parts.append("missing: " + ", ".join(missing))
if extra:
parts.append("extra: " + ", ".join(extra))
text\_rendering\_reason = "; ".join(parts) if parts else "Exact text match."
# Keep both: the judge's text\_rendering and the OCR exact-match result.
text\_rendering\_judge\_score = coffee\_result["scores"].get("text\_rendering")
text\_rendering\_judge\_reason = coffee\_result["reasons"].get("text\_rendering", "")
coffee\_result["scores"]["text\_rendering\_judge"] = text\_rendering\_judge\_score
coffee\_result["reasons"]["text\_rendering\_judge"] = text\_rendering\_judge\_reason
coffee\_result["scores"]["text\_rendering\_ocr"] = text\_rendering\_pass
coffee\_result["reasons"]["text\_rendering\_ocr"] = text\_rendering\_reason
coffee\_result`
```
```
`{'test\_id': 'coffee\_flyer\_generation',
'model\_label': 'gpt-image-1.5',
'task\_type': 'image\_generation',
'artifact\_paths': ['/cookbook/assets/images/gen\_coffee\_flyer\_generation\_gpt-image-1.5\_1769657762450\_0.png'],
'scores': {'instruction\_following': True,
'text\_rendering': True,
'layout\_hierarchy': 5.0,
'style\_brand\_fit': 5.0,
'visual\_quality': 5.0,
'verdict': 'PASS',
'text\_rendering\_judge': True,
'text\_rendering\_ocr': False},
'reasons': {'instruction\_following': '',
'text\_rendering': '',
'layout\_hierarchy': '',
'style\_brand\_fit': '',
'visual\_quality': '',
'verdict': 'All required lines appear and match exactly (including casing, hyphen/en-dash, and punctuation), with no extra words, prices, URLs, or QR codes. Text is crisp and legible. Hierarchy follows the requested order: shop name at top, then headline, subheadline, offer, CTA, and footer address/hours. Visual style is warm, cozy, minimal specialty coffee with a realistic latte photo (not cartoonish). No visible watermarks, UI elements, or distracting artifacts; overall print-flyer quality is clean.',
'text\_rendering\_judge': '',
'text\_rendering\_ocr': 'missing: 123 Market St • 7am–6pm, 20% OFF • Mon–Thu; extra: 123 Market St - 7am-6pm, 20% OFF - Mon-Thu, SUNRISE COFFEE'},
'run\_params': {'model': 'gpt-image-1.5', 'n': 1, 'size': '1024x1024'}}`
```
### Flyer Generation Results
Render the generated image, prompt, and scores side by side.
```
`render\_result\_table(case=coffee\_case, result=coffee\_result, title="Coffee Flyer: Prompt vs. Scores")`
```
Coffee Flyer: Prompt vs. Scores
|Input Prompt|Scores|Reasoning|
|
```
Create a print-ready vertical A4 flyer for a coffee shop called Sunrise Coffee.
Use a warm, cozy, minimal specialty coffee aesthetic (not cartoonish).
Required text (must be exact):
- WINTER LATTE WEEK
- Try our Cinnamon Oat Latte
- 20% OFF - Mon-Thu
- Order Ahead
- 123 Market St - 7am-6pm
Do not include any other words, prices, URLs, or QR codes.
Criteria:
All required text appears exactly as written and is legible.
Layout reads clearly: shop name -\> headline -\> subheadline -\> offer -\> CTA -\> footer.
Style matches warm, cozy, specialty coffee and is not cartoonish.
No extra text, watermarks, or irrelevant UI-like elements.
```
|
```
instruction\_following: True
layout\_hierarchy: 5.0
style\_brand\_fit: 5.0
text\_rendering: True
text\_rendering\_judge: True
text\_rendering\_ocr: False
verdict: PASS
visual\_quality: 5.0
```
|
```
All required lines appear and match exactly (including casing, hyphen/en-dash, and punctuation), with no extra words, prices, URLs, or QR codes. Text is crisp and legible. Hierarchy follows the requested order: shop name at top, then headline, subheadline, offer, CTA, and footer address/hours. Visual style is warm, cozy, minimal specialty coffee with a realistic latte photo (not cartoonish). No visible watermarks, UI elements, or distracting artifacts; overall print-flyer quality is clean.
```
|
#### Additional Method: Image-to-Text + Text Comparison
Another evaluation approach is to shift the problem into a different modality—text. In this setup, images are first converted into a verbose textual description using a vision model, and evaluations are then performed by comparing the generated text against the expected text.
This method works particularly well for OCR-style workflows. For example, you can extract text from a generated flyer using a vision model and then compare the resulting text lines directly against the required copy set to verify correctness and completeness.
```
`import pandas as pd
coffee\_image\_path = Path(coffee\_result["artifact\_paths"][0])
extracted\_lines = extract\_text\_from\_flyer(coffee\_image\_path)
required\_lines = sorted(REQUIRED\_TEXT)
required\_set = set(required\_lines)
extracted\_set = set(extracted\_lines)
missing = sorted(required\_set - extracted\_set)
extra = sorted(extracted\_set - required\_set)
text\_rendering\_df = pd.DataFrame(
{
"text\_rendering\_score": [coffee\_result["scores"].get("text\_rendering")],
"missing\_text": ["\\n".join(missing) or "(none)"],
"extra\_text": ["\\n".join(extra) or "(none)"],
"extracted\_text": ["\\n".join(extracted\_lines) or "(no text extracted)"],
}
)
text\_rendering\_df`
```
||text\_rendering\_score|missing\_text|extra\_text|extracted\_text|
|0|True|123 Market St • 7am–6pm\\n20% OFF • Mon–Thu|123 Market St - 7am-6pm\\n123 Market St - 7am-6...|SUNRISE COFFEE\\nWINTER LATTE WEEK\\nTry our Cin...|
## Image Editing Evals
### Virtual Try-On
Virtual try-on (VTO) is an **image editing** workflow: given a **person
photo** (selfie or model) and a **garment reference** (product photo
and/or description), generate an output where the garment looks
**naturally worn**—while keeping the person’s identity, pose, and scene
intact.
**Why VTO evals are different**
Unlike “creative” edits, VTO is judged on **fidelity + preservation**:
* **Preserve the wearer** (face identity, body shape, pose)
* **Preserve the product** (color, pattern, logos, material cues)
* **Edit only what’s needed** (locality/preservation)
* **Look physically plausible** (occlusions, lighting, drape, wrinkles)
Example Inputs:
|Full Body|Item 1|
|||
|Item 2|Item 3|
|||
Output Image:
#### What to evaluate (practical metrics):
##### 1) Treat VTO as a multi-reference editing task
For each test case, store:
* **Input person image** (selfie/model)
* **Product reference** (catalog image(s), flat-lay, mannequin, or a
“worn” reference when available)
* Optional but high-leverage:
* **Mask(s)**: editable region, clothing region, hair/hand occluders
* **Metadata**: category (top/bottom/outerwear), desired fit
(oversized/slim), colorway, length
* **Edit instruction**: “Put on *this exact jacket* without changing
background or face.”
This lets graders compare **output vs. both inputs** (person + product),
not just “does it look good?”
##### 2) Graded metrics (use only these three)
Use these as **0–5** scores to rank models and track improvement. Keep
them **separate** (don’t average them inside the grader); use verdict
rules outside if you want gates.
##### A) Facial similarity (output vs selfie) — 0–5
Measures whether the output preserves the *same person* (identity), not
just “a plausible face.”
* **5**: Clearly the same person; key facial features unchanged; no
noticeable age/ethnicity/style drift; expression changes (if any) are
minor and realistic.
* **4**: Same person; tiny differences only noticeable on close
inspection (minor shape/texture smoothing, slight eye/mouth drift).
* **3**: Mostly the same person, but at least one noticeable identity
drift (feature proportions, jawline, eyes, nose) that would reduce
user trust.
* **2**: Significant identity drift; looks like a different person or
heavily altered face.
* **1**: Major corruption (melted/blurry face) or clearly different
identity.
* **0**: Face missing, unreadable, or replaced.
What to look for:
* Facial geometry consistency (eyes/nose/mouth spacing, jawline,
cheekbones)
* Skin texture realism without “beauty filter” identity loss
* No unintended makeup/age/style changes unless requested
##### B) Outfit fidelity (output vs provided items) — 0–5
Measures whether the output garment matches the *specific* product
reference(s) the user selected.
* **5**: Item matches reference closely: correct category, colorway,
pattern/print, material cues, and key details (logos, seams, collar,
pockets).
* **4**: Clearly the same item; 1–2 minor deviations (small logo blur,
slight hue shift, minor detail simplification).
* **3**: Generally correct but with a notable mismatch (pattern scale
wrong, material looks different, key design element missing/added).
* **2**: Multiple mismatches; could be a different variant or different
product.
* **1**: Wrong item category or strongly incorrect visual identity.
* **0**: Outfit not applied / missing / replaced with unrelated
clothing.
What to look for:
* Color/pattern correctness (especially stripes, plaid, small repeats)
* Logo/text integrity (no hallucinated letters)
* Structural details (neckline, sleeves, hem, closures)
##### C) Body shape preservation (output vs selfie) — 0–5
Measures whether the model preserves the wearer’s body shape, pose, and
proportions **outside normal garment effects** (e.g., loose clothing can
change silhouette, but shouldn’t reshape anatomy).
* **5**: Body proportions and pose are preserved; garment conforms
naturally without warping torso/limbs.
* **4**: Minor, plausible silhouette changes consistent with clothing;
no obvious anatomical distortion.
* **3**: Noticeable reshaping (waist/hips/shoulders/limbs) that feels
slightly “AI-stylized” or inconsistent with the input body.
* **2**: Significant warping (elongated limbs, shifted joints,
compressed torso) that would be unacceptable in product use.
* **1**: Severe anatomical distortion (extra/missing limbs, melted body
regions).
* **0**: Body is not recognizable or is fundamentally corrupted.
What to look for:
* Shoulder/hip width consistency relative to input
* Limb length/joint placement stability (elbows, knees, wrists)
* No “body slimming” or “body inflation” artifacts
If you want a single overall pass/fail, a common rule is:
* **Fail** if any metric ≤ 2
* **Pass** if all metrics ≥ 3
(and optionally require outfit fidelity ≥ 4 for commerce-critical
flows).
##### 3) Human feedback: keep it simple but consistent
Humans are best at “would I trust this in a shopping flow?”
Use two label types:
* **Rubric labels** (quick, structured):
* Identity preserved? (Y/N)
* Garment matches reference? (Y/N + what’s wrong)
* Any bad artifacts? (none/minor/major)
* Overall usable for e-commerce? (Y/N)
* **Pairwise preference** (A vs B):
* Which output is more faithful to the product while keeping the person unchanged?
Add periodic **calibration**: keep a small set of “anchor” examples that
raters re-score to prevent drift.
### Virtual Try-On Example: Harness Setup
Use existing images from `images/` as the person and garment references.
```
`vto\_person\_path = Path("/cookbook/assets/images/base\_woman.png")
vto\_garment\_path = Path("/cookbook/assets/images/jacket.png")
vto\_prompt = """Put the person in the first image into the jacket shown in the second image.
Keep the person's face, pose, body shape, and background unchanged.
Preserve the garment's color, pattern, and key details.
Do not add extra accessories, text, or new elements."""
vto\_criteria = """The output preserves the same person and background.
The jacket matches the reference garment closely.
Body shape and pose remain consistent outside normal garment effects.
The result looks physically plausible."""
vto\_case = TestCase(
id="vto\_jacket\_tryon",
task\_type="image\_editing",
prompt=vto\_prompt,
criteria=vto\_criteria,
image\_inputs=ImageInputs(image\_paths=[vto\_person\_path, vto\_garment\_path]),
)
vto\_run = ModelRun(
label="gpt-image-1.5-vto",
task\_type="image\_editing",
params={
"model": "gpt-image-1.5",
"n": 1,
},
)
vto\_store = OutputStore(root=Path("../../images"))`
```
### Virtual Try-On Example: Run And Grade
Define a VTO judge prompt aligned to the VTO metrics and run the harness.
```
`vto\_judge\_prompt = """\<core\_mission\>
Evaluate whether a virtual try-on edit preserves the person while accurately applying the reference garment.
\</core\_mission\>
\<role\>
You are an expert evaluator of virtual try-on outputs.
You focus on identity preservation, garment fidelity, and body-shape preservation.
\</role\>
\<metrics\>
1) facial\_similarity: 0-5
2) outfit\_fidelity: 0-5
3) body\_shape\_preservation: 0-5
\</metrics\>
\<verdict\_rules\>
FAIL if any metric \<= 2.
PASS if all metrics \>= 3.
\</verdict\_rules\>
\<output\_constraints\>
Return JSON only with the fields specified in the schema.
\</output\_constraints\>
"""
vto\_schema = {
"type": "object",
"properties": {
"verdict": {"type": "string"},
"facial\_similarity": {"type": "number"},
"outfit\_fidelity": {"type": "number"},
"body\_shape\_preservation": {"type": "number"},
"reason": {"type": "string"},
},
"required": [
"verdict",
"facial\_similarity",
"outfit\_fidelity",
"body\_shape\_preservation",
"reason",
],
"additionalProperties": False,
}
def parse\_vto\_result(data: dict, base\_key: str) -\> list[Score]:
return [
Score(key="facial\_similarity", value=float(data["facial\_similarity"]), reason=""),
Score(key="outfit\_fidelity", value=float(data["outfit\_fidelity"]), reason=""),
Score(key="body\_shape\_preservation", value=float(data["body\_shape\_preservation"]), reason=""),
Score(key="verdict", value=str(data["verdict"]), reason=(data.get("reason") or "").strip()),
]
vto\_grader = LLMajRubricGrader(
key="vto\_eval",
system\_prompt=vto\_judge\_prompt,
content\_builder=build\_editing\_judge\_content,
judge\_model="gpt-5.2",
json\_schema\_name="vto\_eval",
json\_schema=vto\_schema,
result\_parser=parse\_vto\_result,
)
vto\_results = evaluate(
cases=[vto\_case],
model\_runs=[vto\_run],
graders=[vto\_grader],
output\_store=vto\_store,
)
vto\_result = vto\_results[0]
vto\_result`
```
```
`{'test\_id': 'vto\_jacket\_tryon',
'model\_label': 'gpt-image-1.5-vto',
'task\_type': 'image\_editing',
'artifact\_paths': ['/cookbook/assets/images/edit\_vto\_jacket\_tryon\_gpt-image-1.5-vto\_1769658750053\_0.png'],
'scores': {'facial\_similarity': 5.0,
'outfit\_fidelity': 4.0,
'body\_shape\_preservation': 4.0,
'verdict': 'PASS'},
'reasons': {'facial\_similarity': '',
'outfit\_fidelity': '',
'body\_shape\_preservation': '',
'verdict': 'The edited output preserves the same face, hairstyle, pose, and plain studio background. The applied jacket closely matches the reference: camel/beige color, notch lapels, single-breasted look with dark buttons, and flap pockets are present and placed plausibly. Minor deviations include slightly different button count/placement and subtle differences in lapel/hem shaping compared to the flat lay. Body proportions and stance remain consistent, with only natural silhouette changes from wearing a structured blazer.'},
'run\_params': {'model': 'gpt-image-1.5', 'n': 1}}`
```
### Virtual Try-On: Optional Code Interpreter Crop Tool
If you want finer-grained evidence (logos, seams, fit, face details), you can run a
secondary judge that uses the Code Interpreter `crop` tool to zoom into regions.
This is useful for close-up checks on garment fidelity and identity preservation.
```
`vto\_output\_path = Path(vto\_result["artifact\_paths"][0])
instructions = """
Tools available:
- crop(image\_id, x1, y1, x2, y2): Use to zoom into a specific image's region. Coordinates are integer pixels relative to the top-left of the CURRENT view of that image. Use as few precise crops as necessary to gather evidence.
- When using crop(image\_id, x1, y1, x2, y2), ensure that x2 \> x1 and y2 \> y1. The coordinates must define a valid rectangle: x1 (left, inclusive), y1 (top, inclusive), x2 (right, exclusive), y2 (bottom, exclusive), with x2 strictly greater than x1 and y2 strictly greater than y1. If you are unsure, double-check your coordinates before cropping to avoid errors.
Images provided:
- Up to 5 user reference photos (ref\_1..ref\_5) for identity/baseline body context
- 1 clothing-only image (clothing)
- 1 reconstruction image (recon)
Your goals:
1) Judge similarity between the clothing-only image and how it appears on the user in the reconstruction.
2) Judge identity realism (face/hair/skin) vs. user reference photos.
3) Judge overall realism (lighting, shadows, artifacts).
IMPORTANT:
- Use the crop tool when you need more detail. After crop, a new grid overlay is returned for that image.
- You may use the crop tool as many times as needed to gather evidence.
- When confident, produce the final STRICT JSON only. No extra text.
"""
judge\_client = client if "client" in globals() else OpenAI()
response\_crop = judge\_client.responses.create(
model="gpt-5.2",
instructions=instructions,
tools=[
{
"type": "code\_interpreter",
"container": {"type": "auto", "memory\_limit": "4g"},
}
],
input=[
{
"role": "user",
"content": [
{
"type": "input\_text",
"text": "Order: ref\_1 (person), clothing (garment reference), recon (try-on output).",
},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(vto\_person\_path),
},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(vto\_garment\_path),
},
{
"type": "input\_image",
"image\_url": image\_to\_data\_url(vto\_output\_path),
},
],
}
],
)
response\_crop`
```
```
`Response(id='resp\_03756a1c45c8427000697ad91445ec8196a58b39ee7e0b05b1', created\_at=1769658644.0, error=None, incomplete\_details=None, instructions="\\nTools available:\\n- crop(image\_id, x1, y1, x2, y2): Use to zoom into a specific image's region. Coordinates are integer pixels relative to the top-left of the CURRENT view of that image. Use as few precise crops as necessary to gather evidence.\\n - When using crop(image\_id, x1, y1, x2, y2), ensure that x2 \> x1 and y2 \> y1. The coordinates must define a valid rectangle: x1 (left, inclusive), y1 (top, inclusive), x2 (right, exclusive), y2 (bottom, exclusive), with x2 strictly greater than x1 and y2 strictly greater than y1. If you are unsure, double-check your coordinates before cropping to avoid errors.\\n\\nImages provided:\\n- Up to 5 user reference photos (ref\_1..ref\_5) for identity/baseline body context\\n- 1 clothing-only image (clothing)\\n- 1 reconstruction image (recon)\\n\\nYour goals:\\n1) Judge similarity between the clothing-only image and how it appears on the user in the reconstruction.\\n2) Judge identity realism (face/hair/skin) vs. user reference photos.\\n3) Judge overall realism (lighting, shadows, artifacts).\\n\\nIMPORTANT:\\n- Use the crop tool when you need more detail. After crop, a new grid overlay is returned for that image.\\n- You may use the crop tool as many times as needed to gather evidence.\\n- When confident, produce the final STRICT JSON only. No extra text.\\n", metadata={}, model='gpt-5.2-2025-12-11', object='response', output=[ResponseCodeInterpreterToolCall(id='ci\_03756a1c45c8427000697ad91aaf108196974c45daf37a9a18', code="from PIL import Image, ImageOps\\nimg1=Image.open('/mnt/data/143ba8edc474910b395d0d44e2f06a9d-image.png')\\nimg2=Image.open('/mnt/data/ababce34a72604310f9dac11e9e5f00f-image.png')\\nimg3=Image.open('/mnt/data/6c920ec973b3b1abb80da8b29ee5aa3e-image.png')\\nimg1.size, img2.size, img3.size\\n", container\_id='cntr\_697ad91842dc8193a9e214852cbb3fda02ddf8755852a20c', outputs=None, status='completed', type='code\_interpreter\_call'), ResponseCodeInterpreterToolCall(id='ci\_03756a1c45c8427000697ad93101b48196a090b8acf49e7948', code="import matplotlib.pyplot as plt\\nplt.figure(figsize=(12,6))\\nfor i,img in enumerate([img1,img2,img3],1):\\n plt.subplot(1,3,i); plt.imshow(img); plt.axis('off'); plt.title(i)\\nplt.show()\\n", container\_id='cntr\_697ad91842dc8193a9e214852cbb3fda02ddf8755852a20c', outputs=None, status='completed', type='code\_interpreter\_call'), ResponseCodeInterpreterToolCall(id='ci\_03756a1c45c8427000697ad94bf50481969ec6383dc9bd0a40', code="import numpy as np, matplotlib.pyplot as plt\\n# crop face regions\\nface1=img1.crop((70,20,230,140))\\nface3=img3.crop((330,70,690,330))\\nplt.figure(figsize=(8,4))\\nplt.subplot(1,2,1); plt.imshow(face1); plt.axis('off'); plt.title('ref face')\\nplt.subplot(1,2,2); plt.imshow(face3); plt.axis('off'); plt.title('recon face')\\nplt.show()\\n", container\_id='cntr\_697ad91842dc8193a9e214852cbb3fda02ddf8755852a20c', outputs=None, status='completed', type='code\_interpreter\_call'), ResponseCodeInterpreterToolCall(id='ci\_03756a1c45c8427000697ad9522568819681f59d41d921f102', code="# crop blazer from clothing and recon for comparison\\ncloth=img2.crop((40,40,260,410))\\nrecon\_blazer=img3.crop((250,250,800,1100))\\nplt.figure(figsize=(10,4))\\nplt.subplot(1,2,1); plt.imshow(cloth); plt.axis('off'); plt.title('clothing')\\nplt.subplot(1,2,2); plt.imshow(recon\_blazer); plt.axis('off'); plt.title('recon blazer')\\nplt.show()\\n", container\_id='cntr\_697ad91842dc8193a9e214852cbb3fda02ddf8755852a20c', outputs=None, status='completed', type='code\_interpreter\_call'), ResponseOutputMessage(id='msg\_03756a1c45c8427000697ad958266c8196ab64e9c75379f4ce', content=[ResponseOutputText(annotations=[AnnotationContainerFileCitation(container\_id='cntr\_697ad91842dc8193a9e214852cbb3fda02ddf8755852a20c', end\_index=0, file\_id='cfile\_697ad956d5d4819194b112d8f80b8a9d', filename='cfile\_697ad956d5d4819194b112d8f80b8a9d.png', start\_index=0, type='container\_file\_citation')], text='{\\n "clothing\_similarity": {\\n "score": 0.9,\\n "notes": [\\n "Blazer color matches well (camel/tan) with similar fabric look.",\\n "Key design elements align: notch lapels, two-button front with dark buttons, flap pockets, and overall single-breasted silhouette.",\\n "Proportions look consistent (hip-length, straight hem, structured shoulders).",\\n "Minor differences: lapel/edge sharpness and pocket flap geometry look slightly simplified in the try-on."\\n ]\\n },\\n "identity\_realism": {\\n "score": 0.72,\\n "notes": [\\n "Overall face shape, hair color/part, and general look are fairly consistent with the reference.",\\n "Some identity drift: facial details (eyes/nose/mouth definition) appear smoother/idealized in the try-on compared to the reference.",\\n "Skin texture is more airbrushed in the try-on; less natural micro-detail."\\n ]\\n },\\n "overall\_realism": {\\n "score": 0.84,\\n "notes": [\\n "Lighting and shadows are mostly coherent with the studio background; blazer shading reads plausibly on-body.",\\n "Good garment-body integration at shoulders and torso; sleeve placement looks natural.",\\n "Small AI artifacts: slightly softened/blurred edges around lapels and pocket areas; fine fabric texture is reduced."\\n ]\\n }\\n}', type='output\_text', logprobs=[])], role='assistant', status='completed', type='message')], parallel\_tool\_calls=True, temperature=1.0, tool\_choice='auto', tools=[CodeInterpreter(container=CodeInterpreterContainerCodeInterpreterToolAuto(type='auto', file\_ids=None, memory\_limit=None), type='code\_interpreter')], top\_p=0.98, background=False, conversation=None, max\_output\_tokens=None, max\_tool\_calls=None, previous\_response\_id=None, prompt=None, prompt\_cache\_key=None, prompt\_cache\_retention=None, reasoning=Reasoning(effort='none', generate\_summary=None, summary=None), safety\_identifier=None, service\_tier='default', status='completed', text=ResponseTextConfig(format=ResponseFormatText(type='text'), verbosity='medium'), top\_logprobs=0, truncation='disabled', usage=ResponseUsage(input\_tokens=5397, input\_tokens\_details=InputTokensDetails(cached\_tokens=0), output\_tokens=717, output\_tokens\_details=OutputTokensDetails(reasoning\_tokens=417), total\_tokens=6114), user=None, billing={'payer': 'developer'}, completed\_at=1769658722, frequency\_penalty=0.0, presence\_penalty=0.0, store=True)`
```
### Virtual Try-On Eval Results
Show the edit result and VTO scores in a single pandas table.
|Full Body|Item 1|
|||
Edited Image:
```
`render\_result\_table(case=vto\_case, result=vto\_result, title="Virtual Try-On: Prompt vs. Scores")`
```
Virtual Try-On: Prompt vs. Scores
|Input Prompt|Scores|Reasoning|
|
```
Put the person in the first image into the jacket shown in the second image.
Keep the person's face, pose, body shape, and background unchanged.
Preserve the garment's color, pattern, and key details.
Do not add extra accessories, text, or new elements.
Criteria:
The output preserves the same person and background.
The jacket matches the reference garment closely.
Body shape and pose remain consistent outside normal garment effects.
The result looks physically plausible.
```
|
```
body\_shape\_preservation: 4.0
facial\_similarity: 5.0
outfit\_fidelity: 4.0
verdict: PASS
```
|
```
The edited output preserves the same face, hairstyle, pose, and plain studio background. The applied jacket closely matches the reference: camel/beige color, notch lapels, single-breasted look with dark buttons, and flap pockets are present and placed plausibly. Minor deviations include slightly different button count/placement and subtle differences in lapel/hem shaping compared to the flat lay. Body proportions and stance remain consistent, with only natural silhouette changes from wearing a structured blazer.
```
|
### Logo Editing
Logo editing is a high-precision image editing task. Given an **existing
logo** and a **narrowly scoped instruction**, the model must apply the
exact requested change while preserving everything else perfectly.
Unlike creative design tasks, logo editing typically has a single
correct answer. Any deviation, even subtle, is a failure.
**Why Logo Editing evals are different**:
Logo editing is judged on exactness, locality, and preservation rather
than visual appeal:
* Preserve the original asset identity
* Preserve all unedited text, geometry, spacing, and styling
* Edit only the explicitly requested region
* Produce character-level correctness with zero tolerance for drift
Small errors carry outsized risk. A single letter distortion, number
change, or spill outside the intended region can break brand integrity
and create downstream rework.
**Example Tasks:**
* Inputs: logo image + mask or region description
* Tasks: “change the year from 2024 to 2026,” “replace C with S,” “add
TM”
#### What to evaluate (practical metrics):
##### 1) Treat logo editing as a constrained, single-reference task
For each test case, store:
* **Input logo image**
* **Edit instruction** with explicit scope
* Optional but high-leverage:
* Mask(s) or region description defining where edits are allowed
* Expected target text or symbol for exact comparison
* **Metadata**: font type, font size, or color
The grader should compare the output directly against the original logo.
##### 2) Graded metrics
Use these **0–5** scores to rank models and track improvement. Scores
are applied across all requested steps, not per step, so partial
completion is penalized in a controlled and explainable way.
##### A) Edit intent correctness — 0–5
Measures whether every requested edit step was applied correctly to the
correct target.
* **5**: All edit steps are applied exactly as specified.
Character-level accuracy is perfect for every step.
* **4**: All steps applied correctly; extremely minor visual
imperfections only visible on close inspection.
* **3**: All steps applied, but at least one step shows noticeable
degradation in clarity or precision.
* **2**: Most steps applied correctly, but one or more steps contain a
meaningful error.
* **1**: One or more steps are incorrect or applied to the wrong
element.
* **0**: Most steps missing, incorrect, or misapplied.
##### B) Non-target invariance — 0–5
Measures whether content outside the requested edits remains unchanged
across all steps.
* **5**: No detectable changes outside the requested edits.
* **4**: Extremely minor drift visible only on close inspection.
* **3**: Noticeable but limited drift in nearby elements.
* **2**: Clear unrequested changes affecting adjacent text, symbols, or
background.
* **1**: Widespread unintended changes across the logo.
* **0**: Logo identity compromised.
##### C) Character and style integrity — 0–5
Logo editing is not creative transformation. The output must preserve
the original asset’s identity including color, stroke, letterform, and
icon consistency.
* **5**: Edited characters and symbols perfectly match the original
style. Colors, strokes, letterforms, and icons are indistinguishable
from the original.
* **4**: Extremely minor deviation visible only on close inspection,
with no impact on brand perception.
* **3**: Noticeable but limited deviation in one or more properties that
does not break recognition.
* **2**: Clear inconsistency in color, stroke, letterform, or icon
geometry that affects visual cohesion.
* **1**: Major inconsistency that materially alters the logo’s
appearance.
* **0**: Visual system is corrupted or no longer recognizable.
**LLM-as-judge rubric prompt**
Below is a judge prompt aligned to your existing `LLMajRubricGrader`. It
returns structured metric scores + an overall verdict.
You can use this with your existing grader by changing the JSON schema
to include the fields below (or create separate graders per metric if
you prefer).
```
`PROMPT = """\<core\_mission\>
Evaluate whether a logo edit was executed with exact correctness,
strict preservation, and high visual integrity.
Logo editing is a precision task.
Small errors matter.
Near-misses are failures.
\</core\_mission\>
\<role\>
You are an expert evaluator of high-precision logo and brand asset editing.
You specialize in detecting subtle text errors, unintended changes,
and preservation drift across single-step and multi-step edits.
\</role\>
\<scope\_constraints\>
- Judge only against the provided edit instruction and input logo.
- Do NOT judge aesthetics or visual appeal.
- Do NOT infer intent beyond what is explicitly stated.
- Be strict, conservative, and consistent across cases.
\</scope\_constraints\>
\<metrics\_and\_scoring\>
Evaluate EACH metric independently using the definitions below.
All metrics are scored from 0 to 5.
Scores apply across ALL requested edit steps.
--------------------------------
1) Edit Intent Correctness (0–5)
--------------------------------
Measures whether every requested edit step was applied correctly
to the correct target.
5: All edit steps applied exactly as specified. Character-level
accuracy is perfect for every step.
4: All steps applied correctly with extremely minor visual
imperfections visible only on close inspection.
3: All steps applied, but one or more steps show noticeable
degradation in clarity or precision.
2: Most steps applied correctly, but one or more steps contain
a meaningful error.
1: One or more steps are incorrect or applied to the wrong element.
0: Most steps missing, incorrect, or misapplied.
What to consider:
- Exact character identity (letters, numbers, symbols)
- Correct sequencing and targeting of multi-step edits
- No ambiguous characters (Common confusions: 0 vs 6, O vs D, R vs B)
--------------------------------
2) Non-Target Invariance (0–5)
--------------------------------
Measures whether content outside the requested edits remains unchanged.
5: No detectable changes outside the requested edits.
4: Extremely minor drift visible only on close inspection.
3: Noticeable but limited drift in nearby elements.
2: Clear unrequested changes affecting adjacent text,
symbols, or background.
1: Widespread unintended changes across the logo.
0: Logo identity compromised.
What to consider:
- Adjacent letter deformation or spacing shifts
- Background, texture, or color changes
- Cumulative drift from multi-step edits
--------------------------------
3) Character and Style Integrity (0–5)
--------------------------------
Measures whether the edited content preserves the original
logo’s visual system.
This includes color, stroke weight, letterform structure,
and icon geometry.
5: Edited characters and symbols perfectly match the original
style. Colors, strokes, letterforms, and icons are
indistinguishable from the original.
4: Extremely minor deviation visible only on close inspection,
with no impact on brand perception.
3: Noticeable but limited deviation in one or more properties
that does not break recognition.
2: Clear inconsistency in color, stroke, letterform, or icon
geometry that affects visual cohesion.
1: Major inconsistency that materially alters the logo’s appearance.
0: Visual system is corrupted or no longer recognizable.
\</metrics\_and\_scoring\>
\<verdict\_rules\>
- Edit Intent Correctness must be ≥ 4.
- Non-Target Invariance must be ≥ 4.
- Character and Style Integrity must be ≥ 4.
If ANY metric falls below threshold, the overall verdict is FAIL.
Do not average scores to determine the verdict.
\</verdict\_rules\>
\<consistency\_rules\>
- Score conservatively.
- If uncertain between two scores, choose the lower one.
- Base all scores on concrete visual observations.
- Penalize cumulative degradation across multi-step edits.
\</consistency\_rules\>
\<output\_constraints\>
Return JSON only.
No additional text.
\</output\_constraints\>
"""`
```
#### Recommended JSON Output
```
`{
"verdict": "PASS",
"edit\_intent\_correctness": 5,
"non\_target\_invariance": 5,
"character\_and\_style\_integrity": 5,
"reason": "..."
}`
```
```
`{'verdict': 'PASS',
'edit\_intent\_correctness': 5,
'non\_target\_invariance': 5,
'character\_and\_style\_integrity': 5,
'reason': '...'}`
```
### Logo Editing Example: Harness Setup
Use an existing logo image and a narrowly scoped edit instruction.
```
`# Capture the logo judge prompt.
logo\_judge\_prompt = PROMPT
logo\_input\_path = Path("../../images/logo\_generation\_1.png")
logo\_prompt = """Edit the logo by changing the text from FIELD to BUTTER .
Do not change any other text, colors, shapes, or layout."""
logo\_criteria = """The requested edit is applied exactly.
All non-target content remains unchanged.
Character style, color, and geometry remain consistent with the original."""
logo\_case = TestCase(
id="logo\_year\_edit",
task\_type="image\_editing",
prompt=logo\_prompt,
criteria=logo\_criteria,
image\_inputs=ImageInputs(image\_paths=[logo\_input\_path]),
)
logo\_run = ModelRun(
label="gpt-image-1.5-logo",
task\_type="image\_editing",
params={
"model": "gpt-image-1.5",
"n": 1,
},
)
logo\_store = OutputStore(root=Path("../../images"))`
```
### Logo Editing Example: Run And Grade
Run the harness and score the logo edit using the logo judge rubric.
```
`logo\_schema = {
"type": "object",
"properties": {
"verdict": {"type": "string"},
"edit\_intent\_correctness": {"type": "number"},
"non\_target\_invariance": {"type": "number"},
"character\_and\_style\_integrity": {"type": "number"},
"reason": {"type": "string"},
},
"required": [
"verdict",
"edit\_intent\_correctness",
"non\_target\_invariance",
"character\_and\_style\_integrity",
"reason",
],
"additionalProperties": False,
}
def parse\_logo\_result(data: dict, base\_key: str) -\> list[Score]:
return [
Score(key="edit\_intent\_correctness", value=float(data["edit\_intent\_correctness"]), reason=""),
Score(key="non\_target\_invariance", value=float(data["non\_target\_invariance"]), reason=""),
Score(key="character\_and\_style\_integrity", value=float(data["character\_and\_style\_integrity"]), reason=""),
Score(key="verdict", value=str(data["verdict"]), reason=(data.get("reason") or "").strip()),
]
logo\_grader = LLMajRubricGrader(
key="logo\_eval",
system\_prompt=logo\_judge\_prompt,
content\_builder=build\_editing\_judge\_content,
judge\_model="gpt-5.2",
json\_schema\_name="logo\_eval",
json\_schema=logo\_schema,
result\_parser=parse\_logo\_result,
)
logo\_results = evaluate(
cases=[logo\_case],
model\_runs=[logo\_run],
graders=[logo\_grader],
output\_store=logo\_store,
)
logo\_result = logo\_results[0]
logo\_result`
```
```
`{'test\_id': 'logo\_year\_edit',
'model\_label': 'gpt-image-1.5-logo',
'task\_type': 'image\_editing',
'artifact\_paths': ['/cookbook/assets/images/edit\_logo\_year\_edit\_gpt-image-1.5-logo\_1769659071403\_0.png'],
'scores': {'edit\_intent\_correctness': 5.0,
'non\_target\_invariance': 0.0,
'character\_and\_style\_integrity': 2.0,
'verdict': 'FAIL'},
'reasons': {'edit\_intent\_correctness': '',
'non\_target\_invariance': '',
'character\_and\_style\_integrity': '',
'verdict': 'Target text was correctly changed from “FIELD” to “BUTTER” (now reads “BUTTER & FLOUR”). However, major unrequested changes occurred: the background changed from a gray gradient to solid black, and the logo’s overall rendering/contrast differs (the original had a soft glow/embossed look, while the edited version is flatter with different tonal values). These violate the instruction to not change any other colors, shapes, or layout.'},
'run\_params': {'model': 'gpt-image-1.5', 'n': 1}}`
```
### Logo Editing Eval Results
Show the edited logo and logo edit scores in a single pandas table.
```
`render\_result\_table(case=logo\_case, result=logo\_result, title="Logo Editing: Prompt vs. Scores")`
```
Logo Editing: Prompt vs. Scores
|Input Prompt|Scores|Reasoning|
|
```
Edit the logo by changing the text from FIELD to BUTTER .
Do not change any other text, colors, shapes, or layout.
Criteria:
The requested edit is applied exactly.
All non-target content remains unchanged.
Character style, color, and geometry remain consistent with the original.
```
|
```
character\_and\_style\_integrity: 2.0
edit\_intent\_correctness: 5.0
non\_target\_invariance: 0.0
verdict: FAIL
```
|
```
Target text was correctly changed from “FIELD” to “BUTTER” (now reads “BUTTER & FLOUR”). However, major unrequested changes occurred: the background changed from a gray gradient to solid black, and the logo’s overall rendering/contrast differs (the original had a soft glow/embossed look, while the edited version is flatter with different tonal values). These violate the instruction to not change any other colors, shapes, or layout.
```
|
##### 3) Alternative When You Have Ground Truth Images
If you already have canonical references, you can compare directly to a
**design source-of-truth** rather than model outputs.
Ground truth should come from the design system, not generated images:
* Brand library assets (vector or high-res canonical raster)
* Figma frames or components representing the correct asset state
This maps cleanly to logo editing requirements like “still the same asset”
and “unintended drift is a failure.”
**Example: OpenAI Logo – Lunar New Year**
* Reference image: canonical OpenAI logo (from Figma or brand assets)
* Generated image: model output with the requested transformation
## Conclusion
Image models are shifting from “cool demos” to production tools that
generate real artifacts—screens, flyers, product visuals, and brand
edits that influence decisions and ship to customers. The core lesson of
this cookbook is simple: you can’t evaluate these systems with generic
“looks good” scores. You need **workflow-specific evals** that are
**repeatable** across model versions, prompts, and settings. Multimodal
LLMs make this practical by acting as scalable judges—when paired with
tight rubrics, structured outputs, and human calibration.
A practical vision-eval program starts small and gets sharper over time:
* **Start with gates.** Add strict pass/fail graders for the failure
modes that break real work: missing required components, incorrect
copy, edits spilling outside the intended region, or unintended
changes to preserved areas. This prevents “pretty but wrong” outputs
from masking regressions.
* **Layer in graded metrics.** Once hard failures are controlled, use
0–5 rubrics to capture what matters for usability and quality in each
workflow (e.g., hierarchy in UI mockups, brand fit in marketing, or
fidelity/preservation in editing).
* **Tag failures to iterate faster.** Consistent failure tags turn a
pile of outputs into actionable engineering work: you can quantify
what’s breaking, find clustered root causes, and track progress as you
tune prompts, model settings, masks, or post-processing.
* **Use humans strategically.** Humans add the most value on subjective
or ambiguous dimensions (“vibe,” usability clarity, trustworthiness),
but only if you keep rubrics tight and use calibration anchors to
prevent drift.
* **Treat the harness as a product.** The reusable harness you
built—test cases, runners, graders, and stored artifacts—creates the
foundation for regression testing, parameter sweeps, and side-by-side
comparisons. Over time, your eval suite becomes your safety net: it
catches subtle failures early and makes improvements measurable.
* **Evolve as needed.** You can redesign your grader prompts with the
complex metrics over time. One natural next step would be splitting
the single-shot grader prompt into multiple calls to focus on a
specific metric.
Build evals that reflect how images are actually used, enforce
correctness before aesthetics, and make iteration data-driven. When your
evals are aligned with real workflow requirements, image generation and
editing stop being unpredictable art projects and become tools teams can
trust.