Clean and prepare messy data | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Clean and prepare messy data
Process tabular data without affecting the original.
Difficulty **Easy**
Time horizon **5m**
Drag in or mention a messy CSV or spreadsheet, describe the problems you see, and ask Codex to write a cleaned copy while keeping the original file unchanged.
## Best for
* CSV or spreadsheet exports with mixed dates, currencies, duplicates, summary rows, or missing values.
* Teams who work with data from multiple sources.
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/clean-messy-data/?export=pdf)
Drag in or mention a messy CSV or spreadsheet, describe the problems you see, and ask Codex to write a cleaned copy while keeping the original file unchanged.
Easy
5m
Related links
[ Analyze data with Codex ](/codex/use-cases/analyze-data-export)[ File inputs ](/api/docs/guides/file-inputs)[ Agent skills ](/codex/skills)
##
Best for
* CSV or spreadsheet exports with mixed dates, currencies, duplicates, summary rows, or missing values.
* Teams who work with data from multiple sources.
##
Skills & Plugins
*
Spreadsheet
Inspect tabular files, clean columns, and produce reviewable outputs.
|
Skill
|
Why use it
|
| Spreadsheet | Inspect tabular files, clean columns, and produce reviewable outputs. |
##
Starter prompt
Clean @marketplace-risk-rollout-export.csv.
What's wrong:
- dates are mixed between MM/DD/YYYY and YYYY-MM-DD
- currency values include $, commas, and blank cells
- a few duplicate customer rows came from repeated exports
- region and category names use several aliases
- there are pasted summary rows mixed into the data
What I want:
- write a cleaned CSV
- keep the original file unchanged
- use one date format
- keep blank currency cells blank
- preserve source row IDs when possible
- add a short data-quality note with rows you changed, removed, or could not clean confidently
[Open in the Codex app](<codex://new?prompt=Clean+@marketplace-risk-rollout-export.csv.
What's+wrong:
-+dates+are+mixed+between+MM/DD/YYYY+and+YYYY-MM-DD
-+currency+values+include+$,+commas,+and+blank+cells
-+a+few+duplicate+customer+rows+came+from+repeated+exports
-+region+and+category+names+use+several+aliases
-+there+are+pasted+summary+rows+mixed+into+the+data
What+I+want:
-+write+a+cleaned+CSV
-+keep+the+original+file+unchanged
-+use+one+date+format
-+keep+blank+currency+cells+blank
-+preserve+source+row+IDs+when+possible
-+add+a+short+data-quality+note+with+rows+you+changed,+removed,+or+could+not+clean+confidently>)
Clean @marketplace-risk-rollout-export.csv.
What's wrong:
- dates are mixed between MM/DD/YYYY and YYYY-MM-DD
- currency values include $, commas, and blank cells
- a few duplicate customer rows came from repeated exports
- region and category names use several aliases
- there are pasted summary rows mixed into the data
What I want:
- write a cleaned CSV
- keep the original file unchanged
- use one date format
- keep blank currency cells blank
- preserve source row IDs when possible
- add a short data-quality note with rows you changed, removed, or could not clean confidently
## Introduction
Codex is great at cleaning systematically tabular data.
When a CSV or spreadsheet has mixed dates, duplicate rows, currency strings, blank cells, aliases, or pasted summary rows, ask Codex to clean a copy and leave the original file unchanged.
Your browser does not support the video tag.
## How to use
1. Drag the file into Codex or mention it in your prompt, such as `@customer-export.csv`.
2. Describe the problems you already see.
3. Tell Codex what the cleaned version should be: CSV, spreadsheet tab, or upload-ready file.
4. Review the cleaned copy before using it.
Use the starter prompt on this page for the first cleaning pass. Replace the file name and bullets with your own. The useful details are the problems you already see and the file you need next: a cleaned CSV, a clean spreadsheet tab, or an upload-ready file. After Codex writes the clean copy, open the cleaned file and the data-quality note from the thread before using the data downstream.
##
Related use cases
[
### Query tabular data
Use Codex with a CSV, spreadsheet, dashboard export, Google Sheet, or local data file to...
Data Knowledge Work
](/codex/use-cases/analyze-data-export)[
### Turn feedback into actions
Connect Codex to multiple data sources such as Slack, GitHub, Linear, or Google Drive to...
Data Integrations
](/codex/use-cases/feedback-synthesis)[
### Coordinate new-hire onboarding
Use Codex to gather approved new-hire context, stage tracker updates, draft team-by-team...
Integrations Data
](/codex/use-cases/new-hire-onboarding)