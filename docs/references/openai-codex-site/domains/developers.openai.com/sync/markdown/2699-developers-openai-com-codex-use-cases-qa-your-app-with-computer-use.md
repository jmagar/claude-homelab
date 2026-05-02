QA your app with Computer Use | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# QA your app with Computer Use
Click through real product flows and log what breaks.
Difficulty **Intermediate**
Time horizon **30m**
Use Computer Use to exercise key flows, catch issues, and finish with a bug report.
## Best for
* Teams validating real user flows before a release
* QA loops that should end with severity, repro steps, and a short triage summary
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/qa-your-app-with-computer-use/?export=pdf)
Use Computer Use to exercise key flows, catch issues, and finish with a bug report.
Intermediate
30m
Related links
[ Computer Use ](/codex/app/computer-use)[ Codex skills ](/codex/skills)
##
Best for
* Teams validating real user flows before a release
* QA loops that should end with severity, repro steps, and a short triage summary
##
Starter prompt
@Computer Use Test my app in [environment].
Test these flows:
- [hero use case 1]
- [hero use case 2]
- [hero use case 3]
For every bug you find, include:
- repro steps
- expected result
- actual result
- severity
Keep going past non-blocking issues and end with a short triage summary.
[Open in the Codex app](<codex://new?prompt=@Computer+Use+Test+my+app+in+[environment].
Test+these+flows:
-+[hero+use+case+1]
-+[hero+use+case+2]
-+[hero+use+case+3]
For+every+bug+you+find,+include:
-+repro+steps
-+expected+result
-+actual+result
-+severity
Keep+going+past+non-blocking+issues+and+end+with+a+short+triage+summary.>)
@Computer Use Test my app in [environment].
Test these flows:
- [hero use case 1]
- [hero use case 2]
- [hero use case 3]
For every bug you find, include:
- repro steps
- expected result
- actual result
- severity
Keep going past non-blocking issues and end with a short triage summary.
## Introduction
Computer Use is a strong fit for QA passes because it can see the interface, click through flows, type into fields, and record what fails. That makes it useful for catching both functional bugs and UI issues across realistic user journeys.
The key is to tell Codex what environment to test, which flows matter most, and what kind of report you want back.
## How to use
1. Install the [Computer Use plugin](/codex/app/computer-use).
2. Tell Codex which app, build, or environment to test.
3. Name the flows or hero use cases you care about most.
4. Ask for a structured report so the output is easy to triage or hand off.
You can keep this broad:
* `@Computer Use Test my app. Find any major issues and give me a report.`
Or make it more explicit:
* `@Computer Use Test my app in staging. Cover signup, invite a teammate, and upgrade billing. Log every bug with repro steps, expected result, actual result, and severity.`
If you already maintain a test-plan file in the repo, attach it to the thread or point Codex at it so the QA pass follows your existing flows.
## Practical tips
### Be explicit about setup
If account state, test data, feature flags, or environment choice affect the flow, include that up front. Codex will produce much better results when it knows whether it is testing local, staging, or production-like behavior.
### Name the issue types you care about
Call out whether you want Codex to focus on broken functionality, layout issues, confusing copy, visual regressions, or all of the above.
### Decide whether to stop or continue
If one blocking issue should end the run, say so. Otherwise, tell Codex to continue through the rest of the flow and collect all non-blocking issues before it summarizes.
## Good follow-ups
After the QA pass, keep the same thread open and ask Codex to fix one of the bugs it found, turn the findings into Linear or GitHub-ready drafts, or narrow the next pass to one specific failing flow.
## Suggested prompt
**Run a Structured QA Pass**
@Computer Use Test my app in [environment].
Test these flows:
- [hero use case 1]
- [hero use case 2]
- [hero use case 3]
For every bug you find, include:
- repro steps
- expected result
- actual result
- severity
Keep going past non-blocking issues and end with a short triage summary.
##
Related use cases
[
### Automate bug triage
Ask Codex to check recent alerts, issues, failed checks, logs, and chat reports, tune the...
Automation Quality
](/codex/use-cases/automation-bug-triage)[
### Debug in iOS simulator
Use Codex to discover the right Xcode scheme and simulator, launch the app, inspect the UI...
iOS Code
](/codex/use-cases/ios-simulator-bug-debugging)[
### Deploy an app or website
Use Codex with Build Web Apps and Vercel to turn a repo, screenshot, design, or rough app...
Front-end Integrations
](/codex/use-cases/deploy-app-or-website)