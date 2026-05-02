Analyze datasets and ship reports | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Analyze datasets and ship reports
Turn messy data into clear analysis and visualizations.
Difficulty **Intermediate**
Time horizon **1h**
Use Codex to clean data, join sources, explore hypotheses, model results, and package the output as a reusable artifact.
## Best for
* Data analysis that starts with messy files and should end with a chart, memo, dashboard, or report
* Analysts who want Codex to help with cleanup, joins, exploratory analysis, and reproducible scripts
* Teams that need reviewable artifacts instead of one-off notebook state
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/datasets-and-reports/?export=pdf)
Use Codex to clean data, join sources, explore hypotheses, model results, and package the output as a reusable artifact.
Intermediate
1h
Related links
[ Agent skills ](/codex/skills)[ Worktrees in the Codex app ](/codex/app/worktrees)
##
Best for
* Data analysis that starts with messy files and should end with a chart, memo, dashboard, or report
* Analysts who want Codex to help with cleanup, joins, exploratory analysis, and reproducible scripts
* Teams that need reviewable artifacts instead of one-off notebook state
##
Skills & Plugins
*
Spreadsheet
Inspect CSV, TSV, and Excel files when formulas, exports, or quick spreadsheet checks matter.
*
[ Jupyter Notebook ](https://github.com/openai/skills/tree/main/skills/.curated/jupyter-notebook)
Create or refactor notebooks for exploratory analysis, experiments, and reusable walkthroughs.
*
[ Doc ](https://github.com/openai/skills/tree/main/skills/.curated/doc)
Produce stakeholder-ready `.docx` reports when layout, tables, or comments matter.
*
[ Pdf ](https://github.com/openai/skills/tree/main/skills/.curated/pdf)
Render PDF outputs and check the final analysis artifact before you share it.
|
Skill
|
Why use it
|
| Spreadsheet | Inspect CSV, TSV, and Excel files when formulas, exports, or quick spreadsheet checks matter. |
|[ Jupyter Notebook ](https://github.com/openai/skills/tree/main/skills/.curated/jupyter-notebook)| Create or refactor notebooks for exploratory analysis, experiments, and reusable walkthroughs. |
|[ Doc ](https://github.com/openai/skills/tree/main/skills/.curated/doc)| Produce stakeholder-ready `.docx` reports when layout, tables, or comments matter. |
|[ Pdf ](https://github.com/openai/skills/tree/main/skills/.curated/pdf)| Render PDF outputs and check the final analysis artifact before you share it. |
##
Starter prompt
I'm doing a data analysis project in this workspace.
Goal:
- Figure out whether houses near the highway have lower property valuations.
Start by:
- reading `AGENTS.md` and explaining the recommended Python environment
- loading the dataset(s) at [dataset path]
- describing what each file contains, likely join keys, and obvious data quality issues
- proposing a reproducible workflow from import and tidy through visualization, modeling, and report output
Constraints:
- prefer scripts and saved artifacts over one-off notebook state
- do not invent missing values or merge keys
- suggest any skills or worktree splits that would make the workflow more reproducible
Output:
- setup plan
- data inventory
- analysis plan
- first commands or files to create
[Open in the Codex app](<codex://new?prompt=I'm+doing+a+data+analysis+project+in+this+workspace.
Goal:
-+Figure+out+whether+houses+near+the+highway+have+lower+property+valuations.
Start+by:
-+reading+`AGENTS.md`+and+explaining+the+recommended+Python+environment
-+loading+the+dataset(s)+at+[dataset+path]
-+describing+what+each+file+contains,+likely+join+keys,+and+obvious+data+quality+issues
-+proposing+a+reproducible+workflow+from+import+and+tidy+through+visualization,+modeling,+and+report+output
Constraints:
-+prefer+scripts+and+saved+artifacts+over+one-off+notebook+state
-+do+not+invent+missing+values+or+merge+keys
-+suggest+any+skills+or+worktree+splits+that+would+make+the+workflow+more+reproducible
Output:
-+setup+plan
-+data+inventory
-+analysis+plan
-+first+commands+or+files+to+create>)
I'm doing a data analysis project in this workspace.
Goal:
- Figure out whether houses near the highway have lower property valuations.
Start by:
- reading `AGENTS.md` and explaining the recommended Python environment
- loading the dataset(s) at [dataset path]
- describing what each file contains, likely join keys, and obvious data quality issues
- proposing a reproducible workflow from import and tidy through visualization, modeling, and report output
Constraints:
- prefer scripts and saved artifacts over one-off notebook state
- do not invent missing values or merge keys
- suggest any skills or worktree splits that would make the workflow more reproducible
Output:
- setup plan
- data inventory
- analysis plan
- first commands or files to create
## Introduction
At its core, data analysis is about using data to inform decisions. The goal isn’t analysis for its own sake. It’s to produce an artifact that helps someone act: a chart for leadership, an experiment readout for a product team, a model evaluation for researchers, or a dashboard that guides daily operations.
A useful framework, popularized by *R for Data Science*, is a loop: import and tidy data, then iterate between transform, visualize, and model to build understanding before you communicate results. Programming surrounds that whole cycle.
Codex fits well into this workflow. It helps you move around the loop faster by cleaning data, exploring hypotheses, generating analyses, and producing reproducible artifacts. The target isn’t a one-off notebook. The target is a workflow that other people can review, trust, and rerun.
## Define your use case
Choose one concrete question you want to answer with your data.
The more specific the question, the better. It will help Codex understand what you want to achieve and how to help you get there.
### Running example: Property values near the highway
As an example, we’ll explore the following question:
>
> To what extent are houses near the highway lower in property valuation?
>
Suppose one dataset contains property values or sale prices, and another contains location, parcel, or highway-proximity information. The work isn’t only to run a model. It’s to make the inputs trustworthy, document the joins, pressure-test the result, and end with an artifact that somebody else can use.
## Set up the environment
When you start a new data analysis project, you need to set up the environment and define the rules of the project.
* **Environment:** Codex should know which Python environment, package manager, folders, and output conventions are canonical for the project.
* **Skills:** Repeated workflows such as notebook cleanup, spreadsheet exports, or final report packaging should move into reusable skills instead of being re-explained in every prompt.
* **Worktrees:** Separate explorations into separate worktrees so one hypothesis, merge strategy, or visualization branch doesn’t bleed into another.
To learn more about how to install and use skills, see our [skills documentation](/codex/skills).
### Guide Codex’s behavior
Before touching the data, tell Codex how to behave in the repo. Put personal defaults in `\~/.codex/AGENTS.md`, and put project rules in the repository `AGENTS.md`.
A small `AGENTS.md` is often enough:
```
`## Data analysis defaults
- Use `uv run` or the project's existing Python environment.
- Keep source data in `data/raw/` and write cleaned data to `data/processed/`.
- Put exploratory notebooks in `analysis/` and final artifacts in `output/`.
- Never overwrite raw files.
- Prefer scripts or checked-in notebooks over unnamed scratch cells.
- Before merging datasets, report candidate keys, null rates, and join coverage.`
```
If the repo doesn’t already define a Python environment, ask Codex to create a reproducible setup and explain how to run it. For data analysis work, that step matters more than jumping straight into charts.
## Import the data
Often the fastest way to start is to paste the file path and ask Codex to inspect it. This is where Codex helps you answer basic but important questions:
* What file formats are here?
* What does each dataset seem to represent?
* Which columns might be targets, identifiers, dates, locations, or measures?
* Where are the clear quality issues?
Don’t ask for conclusions yet. Ask for inventory and explanation first.
## Tidy and merge the inputs
Most real work starts here. You have two or more datasets, the primary key isn’t clear, and a naive merge could lose data or create duplicates.
Ask Codex to profile the merge before performing it:
* Check uniqueness for candidate keys.
* Measure null rates and formatting differences.
* Normalize clear formatting issues such as casing, whitespace, or address formatting.
* Run trial joins and report match rates.
* Recommend the safest merge strategy before it writes the final merged file.
If you need to derive the best key, such as a normalized address, a parcel identifier built from a few columns, or a location join, make Codex explain the tradeoffs and edge cases before you accept the merge.
## Explore with charts and separate worktrees
Exploratory data analysis is where Codex benefits from clean isolation. One worktree can test address cleanup or feature engineering while another focuses on charts or alternate model directions. That keeps each diff reviewable and prevents one long thread from mixing incompatible ideas.
The Codex app includes built-in worktree support. If you are working in a terminal, plain Git worktrees work well too:
```
`git worktree add ../analysis-highway-eda -b analysis/highway-eda
git worktree add ../analysis-model-comparison -b analysis/highway-modeling`
```
In the running example, this step is where you would compare homes near the highway against homes farther away, examine outliers, inspect missing-value patterns, and decide whether the observed effect looks real or reflects neighborhood composition, home size, or other factors.
## Model the question
Not every analysis needs a complex model. Start with an interpretable baseline.
For the highway question, a sensible first pass is a regression or other transparent model that estimates the relationship between highway proximity and property value while controlling for relevant factors such as size, age, and location.
Ask Codex to be explicit about:
* The target variable and feature definitions.
* Which controls to include and why.
* Leakage risks and exclusions.
* How it chose the split, evaluation, or uncertainty estimate.
* What the result means in plain language.
If the first model is weak, that’s still useful. It tells you whether the problem is the model, the features, the join quality, or the question itself.
## Communicate the result
The analysis is only useful when someone else can consume it. Ask Codex to produce the artifact the audience needs:
* A Markdown memo for technical collaborators.
* A spreadsheet or CSV for downstream operations work.
* A `.docx` brief using `$doc` when formatting and tables matter.
* A rendered appendix or final deliverable using `$pdf`.
* A lightweight dashboard or static report site deployed with `$vercel-deploy`.
This is also where you ask for caveats. If the join quality is imperfect, sampling bias is present, or the model assumptions are fragile, Codex should say that plainly in the deliverable.
## Skills to consider
The curated skills that fit this workflow especially well are:
* `$spreadsheet` for CSV, TSV, and Excel editing or exports.
* `$jupyter-notebook` when the deliverable should stay notebook-native.
* `$doc` and `$pdf` for stakeholder-facing outputs.
* `$vercel-deploy` when you want to share the result as a URL.
Once the workflow stabilizes, create repo-local skills for the repeated parts, such as `refresh-data`, `merge-and-qa`, or `publish-weekly-report`. That’s a better long-term pattern than pasting the same procedural prompt into every thread.
## Suggested prompts
**Set Up the Analysis Environment**
I am a data analyst working in this repo.
Read `AGENTS.md`, check whether a Python environment already exists, and set up the smallest reproducible analysis workflow for this project.
Requirements:
- Prefer `uv` and a local `.venv` unless the repo already standardizes something else.
- Create clear folders for raw data, processed data, notebooks, and outputs.
- Explain how you will run Python, install packages, and save artifacts.
- Do not touch the raw data files.
**Load the Dataset and Explain It**
Please load the dataset at [path] and explain what it is.
Include:
- what each file appears to contain
- likely identifiers, target columns, and date columns
- file formats and encodings
- obvious data quality issues or missing metadata
Do not draw conclusions yet. Start with inventory and interpretation.
**Profile the Merge Before You Join**
We need to merge these two datasets, but the primary key is not obvious.
Tasks:
- profile candidate join keys
- show uniqueness and null rates for each candidate
- standardize obvious formatting issues
- run small trial joins and report match rates
- recommend the safest merge strategy before changing any files
**Open a Fresh Exploration Worktree**
Create a separate worktree for exploratory analysis of highway proximity and property valuation.
In this worktree:
- generate summary tables and charts
- compare homes near the highway vs. farther away
- save charts and a short markdown readout
- keep the diff focused on exploration only
**Build an Interpretable First Model**
Model whether highway proximity is associated with lower property valuation.
Requirements:
- start with an interpretable baseline
- define target, features, and controls explicitly
- explain leakage risks and exclusions
- report effect size, uncertainty, and major limitations
- save the modeling code and a short results note
**Package the Results for Stakeholders**
Turn this analysis into a stakeholder-ready artifact.
Audience:
- product and operations leaders deciding whether highway-adjacent properties need separate pricing assumptions
Output:
- one short executive summary
- two to four supporting charts
- a caveats section
- either a `.docx`, `.pdf`, or a static report site, whichever fits best
Also tell me which skill would help most for the chosen output.
##
Tech stack
Need
Default options
Why it's needed
Need
Analysis stack
Default options
[ pandas ](https://pandas.pydata.org/) with [ matplotlib ](https://matplotlib.org/) or [ seaborn ](https://seaborn.pydata.org/)
Why it's needed
Good defaults for import, profiling, joins, cleaning, and the first round of charts.
Need
Modeling
Default options
[ statsmodels ](https://www.statsmodels.org/) or [ scikit-learn ](https://scikit-learn.org/stable/)
Why it's needed
Start with interpretable baselines before moving to more complex predictive models.
|
Need
|
Default options
|
Why it's needed
|
| Analysis stack |[ pandas ](https://pandas.pydata.org/) with [ matplotlib ](https://matplotlib.org/) or [ seaborn ](https://seaborn.pydata.org/)| Good defaults for import, profiling, joins, cleaning, and the first round of charts. |
| Modeling |[ statsmodels ](https://www.statsmodels.org/) or [ scikit-learn ](https://scikit-learn.org/stable/)| Start with interpretable baselines before moving to more complex predictive models. |
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