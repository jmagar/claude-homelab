Skills in OpenAI API
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
Feb 10, 2026
# Skills in OpenAI API
[ EO ](https://www.linkedin.com/in/emreokcular/)
[ Emre Okcular ](https://www.linkedin.com/in/emreokcular/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/skills_in_api.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/skills_in_api.ipynb)
Upload, manage, and attach reusable skills to hosted environments. Agent Skills let you upload and reuse versioned bundles of files in hosted and local shell environments. For the full reference, see the [Skills documentation](https://developers.openai.com/api/docs/guides/tools-skills).
## What is a skill?
A skill is a reusable bundle of files (instructions + scripts + assets), packaged as a folder and anchored by a required `SKILL.md` manifest. OpenAI copies that bundle into an execution environment so the model can read instructions and run code as needed.
In hosted shell, here’s what happens when you attach skills to the shell tool environment (`environment.type="container\_auto"`):
* The service uploads and unzips skills into the runtime
* The service reads `SKILL.md` frontmatter (name/description), then adds each skill’s `name`, `description`, and `path` to the hidden system prompt context, which lets the model know the skill exists
* If the model decides to invoke a skill, it uses the `path` to read `SKILL.md`, then explores files and executes scripts via the shell tool
Skills are for procedures: repeatable workflows where the *how* matters (steps, branching logic, formatting rules, scripts). Skills are useful for when you want your procedure:
* Reused across prompts/agents
* Versioned and independently shipped
* Invoked only when needed (not baked into every system prompt)
### When to use skills
**Skills are particularly appropriate and powerful when…**
1. **You want a reusable, independently versionable set of behaviors.**
Examples: “PowerPoint formatting procedure,” “company-specific report generator,” “standard data-cleaning pipeline.”
2. **Your workflow is highly conditional, or branches like a complex flow chart.**
Example: If X → do this; else if Y → do that; plus validation + retries.
3. **Your workflow needs code execution and local artifacts.**
Anything that benefits from scripts, templates, test fixtures, or reference assets that should live beside the instructions. Skills are designed as a zip of those resources.
4. **You want to keep system prompts slim.**
Put stable procedures in skills; keep system prompts for global behavior.
5. **Multiple agents or teams share the same “house style.”**
Skills are a nice “org standard library” pattern.
6. **You need reproducibility**
Skills are naturally compatible with version pinning via skill versions (see versioning section below).
**Skills are less ideal when…**
* It’s truly a **one-off** task (a quick inline script in the conversation is fine).
* You mostly need **live external data or side effects.** (That’s a tool/API call).
* The procedure changes every day (skills shine when the workflow stabilizes).
## Skills vs. tools vs. system prompts
System prompts and tool schemas become heavy when the boundary isn’t crisp. Use all three to stay organized and help models perform better. Here’s a simple framework:
**System prompt: global behavior and constraints**
Use for:
* Safety boundaries, tone, refusal style
* “Always do X” principles that apply every turn
* Small, stable policies
Avoid:
* Putting long, multi-step procedures here (it bloats every turn and becomes brittle)
**Tools: “do something in the world”**
Use tools when the model must:
* Call external services or databases
* Create side effects (tasks outside of the environment, like canceling an order or sending an email)
* Fetch live state
Tools should:
* Be narrowly scoped
* Have strongly typed inputs
* Be explicit about side effects
**Skills: packaged procedures (+ code + assets)**
Use a skill when you want the model to:
* Follow a repeatable workflow
* Use scripts/templates
* Execute code in a sandbox
* Do it sometimes, not always
## Skill packaging: SKILL.md and folder layout
### Folder structure
A skill is just a folder bundle. Here’s an example:
* `SKILL.md` (required)
* Scripts, like `\*.py`, `\*.js` (optional)
* Helpers and `requirements.txt`
* Assets, templates, sample inputs
### SKILL.md frontmatter
OpenAI models expect names and descriptions to come from frontmatter (important for discovery and routing). Put name and description in the `SKILL.md` frontmatter. Use each API `create` call to upload one skill bundle (one top-level folder) containing exactly one `SKILL.md`/`skill.md`. To upload multiple skills, upload multiple bundles.
## Creating skills via API
After you assemble your skill in a folder, create the skill with an API call.
### Directory upload or zip upload
Use `POST /v1/skills` to upload and validate your skill, extracting name and description from the manifest frontmatter. You can either upload a zip bundle or upload multiple files in your request.
**Option A: Upload files (multipart)**
```
`curl -X POST 'https://api.openai.com/v1/skills' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F 'files[]=@./csv\_insights\_skill/SKILL.md;filename=csv\_insights\_skill/SKILL.md;type=text/markdown' \\
-F 'files[]=@./csv\_insights\_skill/calculate.py;filename=csv\_insights\_skill/calculate.py;type=text/plain'`
```
**Option B: Upload zip**
```
`curl -X POST 'https://api.openai.com/v1/skills' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F 'files=@./csv\_insights\_skill.zip;type=application/zip'`
```
If you hit server errors, **zip locally and upload the zip**. We ran into this internally and found this to be a practical workaround.
**Skill object and version pointers**
A skill returns identifiers and version pointers (e.g., default, latest). Version pointers show up in platform changes and tests.
## Mounting skills into execution
Models use skills via the shell and container. To use skills in the Responses API, attach them to the shell tool with `tools[].environment.skills`.
### How to reference skills
Specify the environment, either hosted or local shell.
**Hosted vs. local**
* Hosted shell: `environment.type="container\_auto"`
* Local shell: `environment.type="local"`
**Skills can be referenced as**:
* `skill\_reference` (by `skill\_id`, optionally with `version` or `"latest"`)
* `inline` (base64 zip bundle) when you don’t want to create a hosted skill
## Runnable example: `csv\_insights\_skill` Skill
**1) Create the skill folder.**
```
`csv\_insights\_skill/
├── SKILL.md
├── requirements.txt
├── run.py
└── assets/
└── example.csv`
```
**2) Create your `SKILL.md`**
```
`---
name: csv-insights
description: Summarize a CSV, compute basic stats, and produce a markdown report + a plot image.
---
# CSV Insights Skill
## When to use this
Use this skill when the user provides a CSV file and wants:
- a quick summary (row/col counts, missing values)
- basic numeric statistics
- a simple visualization
- results packaged into an output folder (or zip)
## Inputs
- A CSV file path (local) or a file mounted in the container.
## Outputs
- `output/report.md`
- `output/plot.png`
## How to run
python -m pip install -r requirements.txt
python run.py --input assets/example.csv --outdir output
`
```
**3) Create your `run.py`**
```
`import argparse
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt
def write\_report(df: pd.DataFrame, outpath: Path) -\> None:
lines = []
lines.append(f"# CSV Insights Report\\n")
lines.append(f"\*\*Rows:\*\* {len(df)} \\n\*\*Columns:\*\* {len(df.columns)}\\n")
lines.append("\\n## Columns\\n")
lines.append("\\n".join([f"- `{c}` ({df[c].dtype})" for c in df.columns]))
missing = df.isna().sum()
if missing.any():
lines.append("\\n## Missing values\\n")
for col, count in missing[missing \> 0].items():
lines.append(f"- `{col}`: {int(count)}")
else:
lines.append("\\n## Missing values\\nNo missing values detected.\\n")
numeric = df.select\_dtypes(include="number")
if not numeric.empty:
lines.append("\\n## Numeric summary (describe)\\n")
lines.append(numeric.describe().to\_markdown())
outpath.write\_text("\\n".join(lines), encoding="utf-8")
def make\_plot(df: pd.DataFrame, outpath: Path) -\> None:
numeric = df.select\_dtypes(include="number")
if numeric.empty:
# No numeric columns → skip plotting
return
# Plot the first numeric column as a simple histogram
col = numeric.columns[0]
plt.figure()
df[col].dropna().hist(bins=30)
plt.title(f"Histogram: {col}")
plt.xlabel(col)
plt.ylabel("Count")
plt.tight\_layout()
plt.savefig(outpath)
plt.close()
def main() -\> None:
parser = argparse.ArgumentParser()
parser.add\_argument("--input", required=True, help="Path to input CSV")
parser.add\_argument("--outdir", required=True, help="Directory for outputs")
args = parser.parse\_args()
inpath = Path(args.input)
outdir = Path(args.outdir)
outdir.mkdir(parents=True, exist\_ok=True)
df = pd.read\_csv(inpath)
write\_report(df, outdir / "report.md")
make\_plot(df, outdir / "plot.png")
if \_\_name\_\_ == "\_\_main\_\_":
main()`
```
**4) Zip it (recommended)**
```
`zip -r csv\_insights\_skill.zip csv\_insights\_skill`
```
**5) Upload the skill**
```
`curl -X POST 'https://api.openai.com/v1/skills' \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F 'files=@./csv\_insights\_skill.zip;type=application/zip'`
```
**6) Run the skill via the API (hosted shell pattern)**
This follows the flow: create skill → call Responses API with the shell tool, with `environment.skills` referencing the skill
Conceptually:
```
`from openai import OpenAI
client = OpenAI()
response = client.responses.create(
model="gpt-5.2",
tools=[{
"type": "shell",
"environment": {
"type": "container\_auto",
"skills": [
{"type": "skill\_reference", "skill\_id": "\<skill\_id\>"},
{"type": "skill\_reference", "skill\_id": "\<skill\_id\>", "version": 2},
],
},
}],
input="Use the skills to analyze the uploaded CSV and write outputs to /mnt/output."
)
print(response.output\_text)`
```
**7) Use this skill via the API (local container pattern)**
Skills also work with local shell mode. The skill selection and prompt behavior are the same as hosted shell mode, but command execution and filesystem access are still handled by your local runtime.
Conceptually:
```
`from openai import OpenAI
client = OpenAI()
response = client.responses.create(
model="gpt-5.2",
tools=[
{
"type": "shell",
"environment": {
"type": "local",
"skills": [
{"type": "skill\_reference", "skill\_id": "\<skill\_id\>"},
{"type": "skill\_reference", "skill\_id": "\<skill\_id\>", "version": 2},
],
},
}
],
input="Use the configured skills and run locally to summarize today's CSV reports in this repo.",
)
print(response.output\_text)`
```
## Operational best practices
**1) Keep skills “discoverable”**
* Put a **clear** `name` and `description` in frontmatter.
* In `SKILL.md`, include: when to use, how to run, expected outputs, gotchas.
* Add explicit routing guidance: “Use when…” vs. “Don’t use when…”, and a few key edge cases, all in `SKILL.md`.
* Include negative examples (when the skill should *not* be triggered) alongside positive examples to improve routing accuracy.
* If routing feels inconsistent, iterate on name, description, and examples before changing code.
This came up in “bulk upload” discussions: name and description should come from frontmatter, and you should test with a small number first.
**2) Prefer zip uploads for reliability and reproducibility**
* Zips are portable, easy to version, and a useful workaround when uploads misbehave.
**3) Version pin in production**
You want to be able to say, “Run this procedure version,” not, “Run whatever the latest is.” Skills are trending toward explicit versions (**default\_version**, **latest\_version**), and there’s active work on version creation endpoints.
* How to pin: `version: 2`
* How to float: `version: "latest"`
* What happens when omitted: defaults to `default\_version`
Consider pinning the model and skill version together for reproducible behavior across deployments.
**4) Design skills like tiny CLIs**
A good skill script:
* Runs from the command line
* Prints deterministic stdout
* Fails loudly with usage/errors
* Writes outputs to known file paths when needed
Add concrete templates and worked examples inside the skill (inputs → commands → expected outputs); they cost nothing on turns where the skill isn’t invoked. When examples are workflow-specific, prefer examples and templates in skills over system-level, few-shot prompting.
**5) Avoid duplicating skills in system prompts**
If the system prompt repeats the entire procedure, people will:
* Bypass skills
* Stuff logic into tool schemas
And you lose the whole point (reusability + versioning + conditional invocation) of skills. Keep the system prompt content separate.
**6) Network access**
Combining skills and open network access is high-risk. If you must use network access, use strict allowlists and treat tool output as untrusted. Avoid this configuration for consumer-facing apps where users expect confirmation controls.
**If network access is required, pair allowlists with explicit “what data is allowed to leave” guidance.**
**7) Use a model that reliably executes multi-step workflows**
Skills work best when the model is strong at long-context reasoning and multi-step tool execution (filesystem navigation, CLI runs, verification).
If you see partial completion or brittle execution, upgrade the model or simplify the workflow, and add explicit verification steps and output checks in `SKILL.md`.
**Limits and validation**
* `SKILL.md` matching is case-insensitive
* Exactly one manifest file allowed (`skill.md`/`SKILL.md`)
* Frontmatter validation follows Agent Skills spec (name field)
* Max zip upload size: 50 MB
* Max file count per skill version: 500
* Max uncompressed file size: 25 MB
## Conclusion
Skills are the missing “middle layer” between prompts and tools: **prompts** define always-on behavior, **tools** provide atomic capabilities and side effects, and **skills** package repeatable procedures (instructions + scripts + assets) that the model can **mount and execute only when needed.**
**Use skills to keep your system prompts lean and your workflows durable.** Start small—bundle one stable procedure with a clear `SKILL.md`, make it runnable as a tiny CLI, and ship it. After it’s in production, pin versions for reproducibility, iterate safely by publishing new versions, and treat your skills library like an internal standard library: audited, discoverable, and shared across agents.
As users scale from single-turn assistants to long-running agents, skills help turn “prompt spaghetti” into **maintainable, testable, versioned workflows**—for building agentic behavior you can trust, reuse, and evolve over time.
To get started with Skills, check out our [documentation](https://developers.openai.com/api/docs/guides/tools-skills).