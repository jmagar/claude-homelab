GPT-5 Troubleshooting Guide
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
Sep 17, 2025
# GPT-5 Troubleshooting Guide
[ PM ](https://www.linkedin.com/in/pmital/)[ BF ](https://www.linkedin.com/in/brian-fioca/)[ CM ](https://www.linkedin.com/in/carter-mcclellan/)
[ Prashant Mital
(OpenAI)
, ](https://www.linkedin.com/in/pmital/)[ Brian Fioca
(OpenAI)
, ](https://www.linkedin.com/in/brian-fioca/)[ Carter Mcclellan
(OpenAI)
](https://www.linkedin.com/in/carter-mcclellan/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/gpt-5/gpt-5_troubleshooting_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/gpt-5/gpt-5_troubleshooting_guide.ipynb)
Now that GPT-5 has been out in the world, we’ve been amazed by all of the incredible things developers are building with the model. We’ve also identified a handful of common troubleshooting patterns that should enable you to get the most out of the model.
## Overthinking
Overthinking shows up when the response is correct but total response time creeps up on trivial asks. The model keeps exploring options, delays the first tool call, and narrates a circuitous journey when a simple answer was available. The usual culprits are oversized reasoning effort, a prompt with no clear definition of done, or conflicting guidance that invites endless planning or provokes frantic double-checking.
The first step toward addressing this is to tighten your API parameters. Set reasoning.effort to “minimal” or “low” for routine work; reserving heavier effort for genuinely complex problems. Give the assistant an explicit stop condition and a single, fast self-check before it replies. Consider using gpt-5-mini or nano to classify user requests and route them appropriately with appropriate reasoning effort settings. If context gathering is part of the task, instruct the model on best practices for collecting necessary data to respond.
```
`\<efficient\_context\_understanding\_spec\>
Goal: Get enough context fast and stop as soon as you can act.
Method:
- Start broad, then fan out to focused subqueries.
- In parallel, launch 4–8 varied queries; read top 3–5 hits per query. Deduplicate paths and cache; don't repeat queries.
Early stop (act if any):
- You can name exact files/symbols to change.
- You can repro a failing test/lint or have a high-confidence bug locus.
\</efficient\_context\_understanding\_spec\>`
```
The following example is similar except that it instructs the model to answer questions that don’t require investigation or tool calls right away instead of overthinking.
```
`# Fast-path for trivial Q&A (latency optimization)
Use this section ONLY when the user's question:
- Is general knowledge or a simple usage query
- Requires no commands, browsing, or tool calls
- Especially if the user is asking an informational question or how to perform a task, rather than asking you to run that task, provide concise instructions about how the user can do it.
Exceptions:
- If the question references files/paths/functions, requests execution/verifications, or needs more context, use the normal flow
- If unsure whether fast-path applies, ask one brief clarifying question; otherwise proceed with normal flow
Behavior:
- Answer immediately and concisely
- No status updates, no todos, no summaries, no tool calls
- Ignore the rest of the instructions following this section and simply respond right away.`
```
## Laziness / underthinking
Working with gpt-5 you might have seen failures where the model did not spend enough time reasoning before producing an answer.
Following along with our best practices there are 2 ways to mitigate this:
1. Using a higher `reasoning\_effort`: the `reasoning\_effort` parameter controls how much the model thinks and how eagerly it calls tools. Try using `low` if you were previously using `minimal`, `medium` if you were using `low` and so on.
2. Encouraging the model to self reflect and score its own responses via prompting. For example, asking the model to construct an internal rubric and applying it to the solution before responding has been surprisingly effective on coding tasks. You can also provide your own rubric and instruct the model to reflect on its work and iterating if it spots any issues before responding.
```
`\<self\_reflection\>
- Internally score the draft against a 5–7 item rubric you devise (clarity, correctness, edge cases, completeness, latency).
- If any category falls short, iterate once before replying.
\</self\_reflection\>`
```
## Overly deferential
GPT-5 can be overly deferential. Especially in agentic settings we often want the model to go off and “just do things”. Providing persistence instructions in the system prompt can successfully mitigate this behavior. This can be easier to steer with a higher `reasoning\_effort` (`low` and above).
```
`\<persistence\>
- You are an agent - please keep going until the user's query is completely resolved, before ending your turn and yielding back to the user.
- Only terminate your turn when you are sure that the problem is solved.
- Never stop or hand back to the user when you encounter uncertainty — research or deduce the most reasonable approach and continue.
- Do not ask the human to confirm or clarify assumptions, as you can always adjust later — decide what the most reasonable assumption is, proceed with it, and document it for the user's reference after you finish acting
\</persistence\>`
```
## Too verbose
GPT-5 can sometimes generate more tokens than you’d like in its final message to the user.
There are two simple ways to address this. The first is to lower the `verbosity` parameter in the API. By default, reasoning verbosity is set to `medium` if unspecified, so try explicitly setting it to `low` if you want shorter outputs. The second is that particularly with coding we’ve had success setting it in the system prompt
```
`Write code for clarity first. Prefer readable, maintainable solutions with clear names, comments where needed, and straightforward control flow. Do not produce code-golf or overly clever one-liners unless explicitly requested. Use high verbosity for writing code and code tools.`
```
## Latency
Latency has a few distinct contributors, so make sure to measure before you tune. Track TTFT, time to first action, and total response time at P50/P95, separating model time from tool and network time. Tracking these metrics will help you optimize the leg that’s actually slow.
To cut model response time, right‑size the amount of thinking the model should use: use reasoning.effort “minimal” or “low” for routine work and add a clear stop condition with a single‑pass self‑check (see Overthinking). Higher reasoning efforts can also lead to more tool calls.
Combine tool calls when possible. The model will need to be told when to call tools in parallel, it won’t always by default.
```
`\<parallelization\_spec\>
Definition: Run independent or read-only tool actions in parallel (same turn/batch) to reduce latency.
When to parallelize:
- Reading multiple files/configs/logs that don’t affect each other.
- Static analysis, searches, or metadata queries with no side effects.
- Separate edits to unrelated files/features that won’t conflict.
\</parallelization\_spec\>`
```
To allow your users to [watch progress as the model reasons](https://platform.openai.com/docs/guides/latency-optimization#make-your-users-wait-less), display reasoning summaries and tool call preamble messages to the user. In many cases, perceived latency is reduced when the user isn’t presented with reasoning summaries as the model is thinking. The model is also able to be instructed to provide preamble messages, or status updates, before making tool calls, letting the user follow along with what the model is doing when calling tools.
```
`\<status\_update\_spec\>
Definition: A brief progress note: what just happened, what’s next, any real blockers, written in a continuous conversational style, narrating the story of your progress as you go.
Always start with a brief acknowledgement of the task before getting started. (No need to prefix with "Status Update:")
\</status\_update\_spec\>`
```
Lower TTFT by caching what doesn’t change: Make sure to make effective use of prompt, reasoning, and tool call result caching by properly structuring your requests to the API. When a path is truly latency‑sensitive, enable priority processing for that call with `service\_tier = “priority”` for faster responses (Note that tokens served by Priority Processing will be billed on a per-token basis, priced at a premium relative to standard processing rates). If TTFT is high with a tiny prompt and no tools, save the `request\_id` and escalate to [support@openai.com](mailto:support@openai.com) for more targeted help.
## Calling too many tools
When the model fires off tools without moving the answer forward, the usual cause is fuzzy routing: overlapping tool definitions, prompts that reward thoroughness over decisiveness, or reasoning set too high. Another frequent cause is not carrying the prior reasoning into subsequent calls; use of the Responses API ensures intent and reasoning summaries persist across turns rather than forgetting why a tool was chosen.
Make answering from context the default in your prompt instructions. Give each tool a single job with crisp inputs/outputs and explicit “don’t use for…” notes. Provide short playbooks for common scenarios so the path is obvious (for example: if the user references a document you don’t have in context, run a semantic search to find it, then fetch the relevant section before answering).
```
`\<tool\_use\_policy\>
Select one tool or none; prefer answering from context when possible.
Cap tool calls at 2 per user request unless new information makes more strictly necessary.
\</tool\_use\_policy\>`
```
Keep an eye on tool\_calls\_per\_turn, duplicate calls to the same tool within a couple of seconds, and the share of answers completed without tools; spikes are a clear signal that routing or prompts need tightening.
## Malformed tool calling
In rare instances gpt-5 can experience a mode collapse where a model calls a tool and outputs a long string of repeating garbage.
In those instances we’ve always found that it stemmed from a contradiction between separate sections of the prompt. For best practices we recommend using gpt-5 meta prompting ability to spot the bug and fix it
```
`Please analyze why the \<tool\_name\> tool call is malformed.
1. Review the provided sample issue to understand the failure mode.
2. Examine the \<System Prompt\> and \<Tool Config\> carefully. Identify any ambiguities, inconsistencies, or phrasing that could mislead GPT-5 into generating an incorrect tool call.
3. For each potential cause, explain clearly how it could result in the observed failure.
4. Provide actionable recommendations to improve the \<System Prompt\> or \<Tool Config\> so GPT-5 produces valid tool calls consistently.
\<System Prompt\>
\<Tool Config\>`
```
## General troubleshooting
Many of the above prompt additions were generated through meta prompting. It’s possible to ask GPT-5 at the end of a turn that didn’t perform up to expectations how to improve its own instructions. The following prompt was used to produce some of the solutions to overthinking problems above, and can be modified to meet your particular needs.
```
`That was a high quality response, thanks! It seemed like it took you a while to finish responding though. Is there a way to clarify your instructions so you can get to a response as good as this faster next time? It's extremely important to be efficient when providing these responses or users won't get the most out of them in time. Let's see if we can improve!
1) think through the response you gave above
2) read through your instructions starting from "\<insert the first line of the system prompt here\>" and look for anything that might have made you take longer to formulate a high quality response than you needed
3) write out targeted (but generalized) additions/changes/deletions to your instructions to make a request like this one faster next time with the same level of quality`
```
When meta prompting inside of a specific context, it is important to generate responses a few times if possible and pay attention to elements of its responses that are common between them. Some improvements or changes the model proposes might be overly specific to that particular situation, but you can often simplify them to arrive at a general improvement. We recommended that you create an eval to measure whether a particular prompt change is better or worse for your particular use case.