Learn a new concept | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Learn a new concept
Turn dense source material into a clear, reviewable learning report.
Difficulty **Intermediate**
Time horizon **30m**
Use Codex to study material such as research papers or courses, split the reading across subagents, gather context, and produce a Markdown report with diagrams.
## Best for
* Individuals learning about an unfamiliar concept
* Dense source material that benefits from parallel reading, context gathering, diagrams, and a written synthesis
* Turning a one-off reading session into a reusable Markdown report with citations, glossary terms
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/learn-a-new-concept/?export=pdf)
Use Codex to study material such as research papers or courses, split the reading across subagents, gather context, and produce a Markdown report with diagrams.
Intermediate
30m
Related links
[ Subagents ](/codex/subagents)[ Subagent concepts ](/codex/concepts/subagents)
##
Best for
* Individuals learning about an unfamiliar concept
* Dense source material that benefits from parallel reading, context gathering, diagrams, and a written synthesis
* Turning a one-off reading session into a reusable Markdown report with citations, glossary terms
##
Skills & Plugins
*
ImageGen
Generate illustrative, non-exact visual assets when a Mermaid diagram is not enough.
|
Skill
|
Why use it
|
| ImageGen | Generate illustrative, non-exact visual assets when a Mermaid diagram is not enough. |
##
Starter prompt
I want to learn a new concept from this research paper: [paper path or URL].
Please run this as a subagent workflow:
- Spawn one subagent to map the paper's problem statement, contribution, method, experiments, and limitations.
- Spawn one subagent to gather prerequisite context and explain the background terms I need.
- Spawn one subagent to inspect the figures, tables, notation, and any claims that need careful verification.
- Wait for all subagents, reconcile disagreements, and avoid overclaiming beyond the source material.
Final output:
- create `notes/[concept-name]-report.md`
- include an executive summary, glossary, paper walkthrough, concept map, method diagram, evidence table, caveats, and open questions
- use Markdown-native Mermaid diagrams where diagrams help
- use imagegen to generate illustrative, non-exact visual assets when a Markdown-native diagram is not enough
- cite paper sections, pages, figures, or tables whenever possible
Constraints:
- do not treat the paper as ground truth if the evidence is weak
- separate what the paper claims from your interpretation
- call out missing background, assumptions, and follow-up reading
[Open in the Codex app](<codex://new?prompt=I+want+to+learn+a+new+concept+from+this+research+paper:+[paper+path+or+URL].
Please+run+this+as+a+subagent+workflow:
-+Spawn+one+subagent+to+map+the+paper's+problem+statement,+contribution,+method,+experiments,+and+limitations.
-+Spawn+one+subagent+to+gather+prerequisite+context+and+explain+the+background+terms+I+need.
-+Spawn+one+subagent+to+inspect+the+figures,+tables,+notation,+and+any+claims+that+need+careful+verification.
-+Wait+for+all+subagents,+reconcile+disagreements,+and+avoid+overclaiming+beyond+the+source+material.
Final+output:
-+create+`notes/[concept-name]-report.md`
-+include+an+executive+summary,+glossary,+paper+walkthrough,+concept+map,+method+diagram,+evidence+table,+caveats,+and+open+questions
-+use+Markdown-native+Mermaid+diagrams+where+diagrams+help
-+use+imagegen+to+generate+illustrative,+non-exact+visual+assets+when+a+Markdown-native+diagram+is+not+enough
-+cite+paper+sections,+pages,+figures,+or+tables+whenever+possible
Constraints:
-+do+not+treat+the+paper+as+ground+truth+if+the+evidence+is+weak
-+separate+what+the+paper+claims+from+your+interpretation
-+call+out+missing+background,+assumptions,+and+follow-up+reading>)
I want to learn a new concept from this research paper: [paper path or URL].
Please run this as a subagent workflow:
- Spawn one subagent to map the paper's problem statement, contribution, method, experiments, and limitations.
- Spawn one subagent to gather prerequisite context and explain the background terms I need.
- Spawn one subagent to inspect the figures, tables, notation, and any claims that need careful verification.
- Wait for all subagents, reconcile disagreements, and avoid overclaiming beyond the source material.
Final output:
- create `notes/[concept-name]-report.md`
- include an executive summary, glossary, paper walkthrough, concept map, method diagram, evidence table, caveats, and open questions
- use Markdown-native Mermaid diagrams where diagrams help
- use imagegen to generate illustrative, non-exact visual assets when a Markdown-native diagram is not enough
- cite paper sections, pages, figures, or tables whenever possible
Constraints:
- do not treat the paper as ground truth if the evidence is weak
- separate what the paper claims from your interpretation
- call out missing background, assumptions, and follow-up reading
## Introduction
Learning a new concept from a dense paper or course requires more than just summarization. The goal is to build a working mental model: what problem it addresses, what the method actually does, which evidence supports it, what assumptions it depends on, and which parts you still need to investigate.
Codex is useful here because it can automate the context gathering, and can turn complicated concepts into helpful diagrams or illustrations. This use case is also a good fit for [subagents](/codex/concepts/subagents): one thread can read the paper for structure, another can gather prerequisite context, another can inspect figures and notation, and the main thread can reconcile the results into a report you can review later.
For this use case, the final artifact should be something you can easily review: a Markdown file such as `notes/concept-report.md`, or a document of another format. It should include a summary, glossary, walkthrough, diagrams, evidence table, limitations, and open questions instead of ending with a transient chat answer.
## Define the learning goal
Start by naming the concept and the output you want. A narrow question makes the report more useful than a broad summary.
For example:
>
> I want to understand the main idea in this research paper, how the method works, why the experiments support or do not support the claim, and what I should read next.
>
That scope gives Codex a concrete job. It should teach you the concept, but it should also preserve uncertainty, cite where claims came from, and separate the paper’s claims from its own interpretation.
## Running example: research paper analysis
Suppose you want to learn about a paper about an unfamiliar model architecture. You want a report that lets you understand the concept at a glance, without having to read the whole paper.
A good result might look like this:
* `notes/paper-report.md` with the main explanation.
* `notes/figures/method-flow.mmd` or an inline Mermaid diagram for the method.
* `notes/figures/concept-map.mmd` or a small SVG that shows how the prerequisite ideas relate.
* An evidence table that maps claims to paper sections, pages, figures, or tables.
* A list of follow-up readings and unresolved questions.
The point is to make the learning process more systematic and to leave behind a durable artifact.
## Split the work across subagents
Subagents work best when each one has a bounded job and a clear return format. Ask Codex to spawn them explicitly; Codex does not need to use subagents for every reading task, but parallel exploration helps when the paper is long or conceptually dense.
For a research paper, a practical split is:
* **Paper map:** Extract the problem statement, contribution, method, experiments, limitations, and claimed results.
* **Prerequisite context:** Explain background terms, related concepts, and any prior work the paper assumes.
* **Notation and figures:** Walk through equations, algorithms, diagrams, figures, and tables.
* **Skeptical reviewer:** Check whether the evidence supports the claims, list caveats, and identify missing baselines or unclear assumptions.
The main agent should wait for those subagents, compare their answers, and resolve contradictions. Codex will then synthesize the results into a coherent report.
## Gather additional context deliberately
When the paper assumes background you do not have, ask Codex to gather context from approved sources. That might mean local notes, a bibliography folder, linked papers, web search if enabled, or a connected knowledge base.
If you’re learning about an internal concept, you can connect multiple sources with [plugins](/codex/plugins) to create a knowledge base.
Keep this step bounded. Tell Codex what counts as a reliable source and what the final report should do with external context:
* Define prerequisite terms in a glossary.
* Add a short “background you need first” section.
* Link follow-up readings separately from the paper’s own claims.
* Mark claims that come from outside the paper.
## Generate diagrams for the report
Diagrams are often the fastest way to check whether you really understand a concept. For a Markdown report, ask Codex for diagrams that stay close to the source material and are easy to revise.
Good defaults include:
* A concept map that shows prerequisite ideas and how they connect.
* A method flow diagram that traces inputs, transformations, model components, and outputs.
* An experiment map that connects datasets, metrics, baselines, and reported claims.
* A limitations diagram that separates assumptions, failure modes, and open questions.
For Markdown-first reports, ask for Mermaid when the destination supports it, or a small checked-in SVG/PNG asset when it does not. Ask Codex to use the imagegen system skill, which comes with Codex by default, only when you need an illustrative, non-exact visual or something that doesn’t fit in a Markdown-native diagram.
## Write the Markdown report
Ask Codex to make the report self-contained enough that you can return to it later. A useful structure is:
1. Executive summary.
2. What to know before reading.
3. Key terms and notation.
4. Paper walkthrough.
5. Method diagram.
6. Evidence table.
7. What the paper does not prove.
8. Open questions and follow-up reading.
The report should include source references wherever possible. For a PDF, ask for page, section, figure, or table references. If Codex cannot extract exact page references, it should say that and use section or heading references instead.
## Use the report as a study loop
The first report is a starting point. After reading it, ask follow-up questions and have Codex revise the artifact.
Useful follow-ups include:
* Which part of this method should I understand first?
* What is the simplest toy example that demonstrates the core idea?
* Which figure is doing the most work in the paper’s argument?
* Which claim is weakest or least supported?
* What should I read next if I want to implement this?
When the concept requires experimentation, ask Codex to add a small notebook or script that recreates a toy version of the idea. Keep that scratch work linked from the Markdown report so the explanation and the experiment stay together.
Example prompt:
Generate a script that reproduces a simple example from this paper.
The script should be self-contained and runnable with minimal dependencies.
There should be a clear output I can review, such as a csv, plot, or other artifact.
If there are code examples in the paper, use them as reference to write the script.
## Skills to consider
Use skills only when they match the artifact you want:
* `$jupyter-notebook` for toy examples, charts, or lightweight reproductions that should be runnable.
* `$imagegen` for illustrative visual assets that do not need to be exact technical diagrams.
* `$slides` when you want to turn the report into a presentation after the learning pass is done.
For most paper-analysis reports, Markdown-native diagrams or simple SVG files are better defaults than a generated bitmap. They are easier to diff, review, and update when your understanding changes.
## Suggested prompts
**Create the Report Outline First**
Before writing the full report, inspect [paper path] and propose the report outline.
Include:
- the core concept the paper is trying to explain
- which sections or figures are most important
- which background terms need definitions
- which diagrams would help
- which subagent tasks you would spawn before drafting
Stop after the outline and wait for confirmation before creating files.
**Build Diagrams for the Concept**
Read `notes/[concept-name]-report.md` and add diagrams that make the concept easier to understand.
Use Markdown-native Mermaid diagrams when possible. If the report destination cannot render Mermaid, create small checked-in SVG files instead and link them from the report.
Add:
- one concept map for prerequisites and related ideas
- one method flow diagram for inputs, transformations, and outputs
- one evidence map connecting claims to paper figures, tables, or sections
Keep the diagrams faithful to the report. Do not add unverified claims.
**Turn the Report Into a Study Plan**
Use `notes/[concept-name]-report.md` to create a study plan for the next two reading sessions.
Include:
- what I should understand first
- which paper sections to reread
- which equations, figures, or tables need extra attention
- one toy example or notebook idea if experimentation would help
- follow-up readings and questions to resolve
Update the report with a short "Next study loop" section.
##
Related use cases
[
### Coordinate new-hire onboarding
Use Codex to gather approved new-hire context, stage tracker updates, draft team-by-team...
Integrations Data
](/codex/use-cases/new-hire-onboarding)[
### Query tabular data
Use Codex with a CSV, spreadsheet, dashboard export, Google Sheet, or local data file to...
Data Knowledge Work
](/codex/use-cases/analyze-data-export)[
### Turn feedback into actions
Connect Codex to multiple data sources such as Slack, GitHub, Linear, or Google Drive to...
Data Integrations
](/codex/use-cases/feedback-synthesis)