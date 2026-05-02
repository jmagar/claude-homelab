Iterate on difficult problems | Codex use cases
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
* [ Home ](/codex/use-cases)
* [ Collections ](/codex/use-cases/collections)
[API Dashboard](https://platform.openai.com/login)
Codex use case
# Iterate on difficult problems
Use Codex as a scored improvement loop to solve hard tasks.
Difficulty **Advanced**
Time horizon **Long-running**
Give Codex an evaluation system, such as scripts and reviewable artifacts, so it can keep improving a hard task until the scores are good enough.
## Best for
* Problems where each iteration can be scored, but the best result usually takes many passes
* Tasks with visual or subjective outputs that need both deterministic checks and an LLM-as-a-judge score
* Long-running Codex sessions where you want progress tracked clearly instead of relying on context
# Contents
[
← All use cases
](/codex/use-cases)
Copy page [ Export as PDF ](/codex/use-cases/iterate-on-difficult-problems/?export=pdf)
Give Codex an evaluation system, such as scripts and reviewable artifacts, so it can keep improving a hard task until the scores are good enough.
Advanced
Long-running
Related links
[ Custom instructions with AGENTS.md ](/codex/guides/agents-md)[ Codex workflows ](/codex/workflows)
##
Best for
* Problems where each iteration can be scored, but the best result usually takes many passes
* Tasks with visual or subjective outputs that need both deterministic checks and an LLM-as-a-judge score
* Long-running Codex sessions where you want progress tracked clearly instead of relying on context
##
Starter prompt
I have a difficult task in this workspace and I want you to run it as an eval-driven improvement loop.
Before changing anything:
- Read `AGENTS.md`.
- Find the script or command that scores the current output.
Iteration loop:
- Make one focused improvement at a time.
- Re-run the eval command after each meaningful change.
- Log the scores and what changed.
- Inspect generated artifacts directly. If the output is visual, use `view\_image`.
- Keep going until both the overall score and the LLM average are above 90%.
Constraints:
- Do not stop at the first acceptable result.
- Do not revert to an earlier version unless the new result is clearly worse in scores or artifacts.
- If the eval improves but is still below target, explain the bottleneck and continue.
Output:
- current best scores
- log of major iterations
- remaining risks or weak spots
[Open in the Codex app](<codex://new?prompt=I+have+a+difficult+task+in+this+workspace+and+I+want+you+to+run+it+as+an+eval-driven+improvement+loop.
Before+changing+anything:
-+Read+`AGENTS.md`.
-+Find+the+script+or+command+that+scores+the+current+output.
Iteration+loop:
-+Make+one+focused+improvement+at+a+time.
-+Re-run+the+eval+command+after+each+meaningful+change.
-+Log+the+scores+and+what+changed.
-+Inspect+generated+artifacts+directly.+If+the+output+is+visual,+use+`view_image`.
-+Keep+going+until+both+the+overall+score+and+the+LLM+average+are+above+90%.
Constraints:
-+Do+not+stop+at+the+first+acceptable+result.
-+Do+not+revert+to+an+earlier+version+unless+the+new+result+is+clearly+worse+in+scores+or+artifacts.
-+If+the+eval+improves+but+is+still+below+target,+explain+the+bottleneck+and+continue.
Output:
-+current+best+scores
-+log+of+major+iterations
-+remaining+risks+or+weak+spots>)
I have a difficult task in this workspace and I want you to run it as an eval-driven improvement loop.
Before changing anything:
- Read `AGENTS.md`.
- Find the script or command that scores the current output.
Iteration loop:
- Make one focused improvement at a time.
- Re-run the eval command after each meaningful change.
- Log the scores and what changed.
- Inspect generated artifacts directly. If the output is visual, use `view\_image`.
- Keep going until both the overall score and the LLM average are above 90%.
Constraints:
- Do not stop at the first acceptable result.
- Do not revert to an earlier version unless the new result is clearly worse in scores or artifacts.
- If the eval improves but is still below target, explain the bottleneck and continue.
Output:
- current best scores
- log of major iterations
- remaining risks or weak spots
## Introduction
Some tasks are easy to verify in one shot: the build passes, the tests go green, and you are done. But there are some optimization problems that are difficult to solve, and need many iterations with a tight evaluation loop. To know which direction to go in, Codex needs to inspect the current output, score it, decide the next change, and repeat until the result is actually good.
This type of use case pairs well with a custom UI that lets you inspect progress visually, by having Codex log the outputs and generated artifacts for each iteration.
You can watch Codex continue working in the app while the target artifact, model output, or generated asset keeps improving.
The key is to give Codex the necessary scripts to generate the evaluation metrics and the artifacts to inspect.
## Start with evals
Before the task begins, define how success will be measured. The best setup usually combines:
* **Deterministic checks:** things the scripts can score directly, such as constraint violations or deterministic metrics computed with code
* **LLM-as-a-judge checks:** rubric-based scores for qualities that are harder to encode exactly, such as resemblance, readability, usefulness, or overall quality - this can rely on text or image outputs
If the subjective part matters, give Codex a script that can call a model for example using the [Responses API](/api/reference/resources/responses/methods/create) and return structured scores. The point is not to replace deterministic checks, it’s to supplement them with a consistent judge for the part humans would otherwise assess by eye.
The loop works best when the eval output is machine-readable, saved after every run, and easy to compare over time.
**Tip**: Ask Codex to generate the evaluation script for you, describing the
checks you want to run.
## Give Codex a stopping rule
Hard tasks often drift because the prompt says “keep improving” without saying when to stop. Make the stopping rule explicit.
A practical pattern is:
1. Set a target for the overall score.
2. Set a separate target for the LLM-judge average.
3. Tell Codex to continue until both are above the threshold, not just one.
For example, if the goal is a high-quality artifact, ask Codex to keep going until both the overall score and the LLM average are above 90%. That makes the task legible: Codex can tell whether it is still below target, where the gap is, and whether the latest change helped.
## Keep a running log of the loop
Long-running work is much more reliable when Codex keeps notes about the loop instead of trying to remember everything from the thread.
That running log should record:
* the current best scores
* what changed on the last iteration
* what the eval said got better or worse
* what Codex plans to try next
This is especially important when the task runs for a long time. The log becomes the handoff point for the next session and the self-evaluation record for the current one.
## Inspect the artifact, not just the logs
For some difficult tasks, the code diff and metric output are not enough. Codex should look at the artifact it produced.
If the output is visual, such as a generated image, layout, or rendered state, let Codex inspect that artifact directly, for example when the output lives on disk as an image and compare the current result to the prior best result or to the intended rubric.
This makes the loop stronger:
* the eval script reports the score
* the artifact shows what the score missed
* the next change is grounded in both
That combination is much more effective than changing code blindly between runs.
## Make every iteration explicit
Ask Codex to follow the same loop every time:
1. Run the evals on the current baseline.
2. Identify the biggest failure mode from the scores and artifacts.
3. Make one focused change that addresses that bottleneck.
4. Re-run the evals.
5. Log the new scores and whether the change helped.
6. Continue until the thresholds are met.
This discipline matters. If each iteration changes too many things at once, Codex cannot tell which idea improved the score. If it skips logging, the session becomes hard to trust and hard to resume.
##
Related use cases
[
### Understand large codebases
Use Codex to map unfamiliar codebases, explain different modules and data flow, and point...
Engineering Analysis
](/codex/use-cases/codebase-onboarding)[
### Create browser-based games
Use Codex to turn a game brief into first a well-defined plan, and then a real browser-based...
Engineering Code
](/codex/use-cases/browser-games)[
### Learn a new concept
Use Codex to study material such as research papers or courses, split the reading across...
Knowledge Work Data
](/codex/use-cases/learn-a-new-concept)