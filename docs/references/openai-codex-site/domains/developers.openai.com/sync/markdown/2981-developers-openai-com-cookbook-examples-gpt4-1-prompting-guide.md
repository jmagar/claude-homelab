GPT-4.1 Prompting Guide
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
Apr 14, 2025
# GPT-4.1 Prompting Guide
[ NM ](https://x.com/noahmacca)[ JL ](https://x.com/julianl093)
[ Noah MacCallum
(OpenAI)
, ](https://x.com/noahmacca)[ Julian Lee
(OpenAI)
](https://x.com/julianl093)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/gpt4-1_prompting_guide.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/gpt4-1_prompting_guide.ipynb)
The GPT-4.1 family of models represents a significant step forward from GPT-4o in capabilities across coding, instruction following, and long context. In this prompting guide, we collate a series of important prompting tips derived from extensive internal testing to help developers fully leverage the improved abilities of this new model family.
Many typical best practices still apply to GPT-4.1, such as providing context examples, making instructions as specific and clear as possible, and inducing planning via prompting to maximize model intelligence. However, we expect that getting the most out of this model will require some prompt migration. GPT-4.1 is trained to follow instructions more closely and more literally than its predecessors, which tended to more liberally infer intent from user and system prompts. This also means, however, that GPT-4.1 is highly steerable and responsive to well-specified prompts - if model behavior is different from what you expect, a single sentence firmly and unequivocally clarifying your desired behavior is almost always sufficient to steer the model on course.
Please read on for prompt examples you can use as a reference, and remember that while this guidance is widely applicable, no advice is one-size-fits-all. AI engineering is inherently an empirical discipline, and large language models are inherently nondeterministic; in addition to following this guide, we advise building informative evals and iterating often to ensure your prompt engineering changes are yielding benefits for your use case.
# 1. Agentic Workflows
GPT-4.1 is a great place to build agentic workflows. In model training we emphasized providing a diverse range of agentic problem-solving trajectories, and our agentic harness for the model achieves state-of-the-art performance for non-reasoning models on SWE-bench Verified, solving 55% of problems.
## System Prompt Reminders
In order to fully utilize the agentic capabilities of GPT-4.1, we recommend including three key types of reminders in all agent prompts. The following prompts are optimized specifically for the agentic coding workflow, but can be easily modified for general agentic use cases.
1. Persistence: this ensures the model understands it is entering a multi-message turn, and prevents it from prematurely yielding control back to the user. Our example is the following:
```
`You are an agent - please keep going until the user’s query is completely resolved, before ending your turn and yielding back to the user. Only terminate your turn when you are sure that the problem is solved.`
```
1. Tool-calling: this encourages the model to make full use of its tools, and reduces its likelihood of hallucinating or guessing an answer. Our example is the following:
```
`If you are not sure about file content or codebase structure pertaining to the user’s request, use your tools to read files and gather the relevant information: do NOT guess or make up an answer.`
```
1. Planning [optional]: if desired, this ensures the model explicitly plans and reflects upon each tool call in text, instead of completing the task by chaining together a series of only tool calls. Our example is the following:
```
`You MUST plan extensively before each function call, and reflect extensively on the outcomes of the previous function calls. DO NOT do this entire process by making function calls only, as this can impair your ability to solve the problem and think insightfully.`
```
GPT-4.1 is trained to respond very closely to both user instructions and system prompts in the agentic setting. The model adhered closely to these three simple instructions and increased our internal SWE-bench Verified score by close to 20% - so we highly encourage starting any agent prompt with clear reminders covering the three categories listed above. As a whole, we find that these three instructions transform the model from a chatbot-like state into a much more “eager” agent, driving the interaction forward autonomously and independently.
## Tool Calls
Compared to previous models, GPT-4.1 has undergone more training on effectively utilizing tools passed as arguments in an OpenAI API request. We encourage developers to exclusively use the tools field to pass tools, rather than manually injecting tool descriptions into your prompt and writing a separate parser for tool calls, as some have reported doing in the past. This is the best way to minimize errors and ensure the model remains in distribution during tool-calling trajectories - in our own experiments, we observed a 2% increase in SWE-bench Verified pass rate when using API-parsed tool descriptions versus manually injecting the schemas into the system prompt.
Developers should name tools clearly to indicate their purpose and add a clear, detailed description in the “description” field of the tool. Similarly, for each tool param, lean on good naming and descriptions to ensure appropriate usage. If your tool is particularly complicated and you’d like to provide examples of tool usage, we recommend that you create an `# Examples` section in your system prompt and place the examples there, rather than adding them into the “description’ field, which should remain thorough but relatively concise. Providing examples can be helpful to indicate when to use tools, whether to include user text alongside tool calls, and what parameters are appropriate for different inputs. Remember that you can use “Generate Anything” in the [Prompt Playground](https://platform.openai.com/playground) to get a good starting point for your new tool definitions.
## Prompting-Induced Planning & Chain-of-Thought
As mentioned already, developers can optionally prompt agents built with GPT-4.1 to plan and reflect between tool calls, instead of silently calling tools in an unbroken sequence. GPT-4.1 is not a reasoning model - meaning that it does not produce an internal chain of thought before answering - but in the prompt, a developer can induce the model to produce an explicit, step-by-step plan by using any variant of the Planning prompt component shown above. This can be thought of as the model “thinking out loud.” In our experimentation with the SWE-bench Verified agentic task, inducing explicit planning increased the pass rate by 4%.
## Sample Prompt: SWE-bench Verified
Below, we share the agentic prompt that we used to achieve our highest score on SWE-bench Verified, which features detailed instructions about workflow and problem-solving strategy. This general pattern can be used for any agentic task.
```
`from openai import OpenAI
import os
client = OpenAI(
api\_key=os.environ.get(
"OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"
)
)
SYS\_PROMPT\_SWEBENCH = """
You will be tasked to fix an issue from an open-source repository.
Your thinking should be thorough and so it's fine if it's very long. You can think step by step before and after each action you decide to take.
You MUST iterate and keep going until the problem is solved.
You already have everything you need to solve this problem in the /testbed folder, even without internet connection. I want you to fully solve this autonomously before coming back to me.
Only terminate your turn when you are sure that the problem is solved. Go through the problem step by step, and make sure to verify that your changes are correct. NEVER end your turn without having solved the problem, and when you say you are going to make a tool call, make sure you ACTUALLY make the tool call, instead of ending your turn.
THE PROBLEM CAN DEFINITELY BE SOLVED WITHOUT THE INTERNET.
Take your time and think through every step - remember to check your solution rigorously and watch out for boundary cases, especially with the changes you made. Your solution must be perfect. If not, continue working on it. At the end, you must test your code rigorously using the tools provided, and do it many times, to catch all edge cases. If it is not robust, iterate more and make it perfect. Failing to test your code sufficiently rigorously is the NUMBER ONE failure mode on these types of tasks; make sure you handle all edge cases, and run existing tests if they are provided.
You MUST plan extensively before each function call, and reflect extensively on the outcomes of the previous function calls. DO NOT do this entire process by making function calls only, as this can impair your ability to solve the problem and think insightfully.
# Workflow
## High-Level Problem Solving Strategy
1. Understand the problem deeply. Carefully read the issue and think critically about what is required.
2. Investigate the codebase. Explore relevant files, search for key functions, and gather context.
3. Develop a clear, step-by-step plan. Break down the fix into manageable, incremental steps.
4. Implement the fix incrementally. Make small, testable code changes.
5. Debug as needed. Use debugging techniques to isolate and resolve issues.
6. Test frequently. Run tests after each change to verify correctness.
7. Iterate until the root cause is fixed and all tests pass.
8. Reflect and validate comprehensively. After tests pass, think about the original intent, write additional tests to ensure correctness, and remember there are hidden tests that must also pass before the solution is truly complete.
Refer to the detailed sections below for more information on each step.
## 1. Deeply Understand the Problem
Carefully read the issue and think hard about a plan to solve it before coding.
## 2. Codebase Investigation
- Explore relevant files and directories.
- Search for key functions, classes, or variables related to the issue.
- Read and understand relevant code snippets.
- Identify the root cause of the problem.
- Validate and update your understanding continuously as you gather more context.
## 3. Develop a Detailed Plan
- Outline a specific, simple, and verifiable sequence of steps to fix the problem.
- Break down the fix into small, incremental changes.
## 4. Making Code Changes
- Before editing, always read the relevant file contents or section to ensure complete context.
- If a patch is not applied correctly, attempt to reapply it.
- Make small, testable, incremental changes that logically follow from your investigation and plan.
## 5. Debugging
- Make code changes only if you have high confidence they can solve the problem
- When debugging, try to determine the root cause rather than addressing symptoms
- Debug for as long as needed to identify the root cause and identify a fix
- Use print statements, logs, or temporary code to inspect program state, including descriptive statements or error messages to understand what's happening
- To test hypotheses, you can also add test statements or functions
- Revisit your assumptions if unexpected behavior occurs.
## 6. Testing
- Run tests frequently using `!python3 run\_tests.py` (or equivalent).
- After each change, verify correctness by running relevant tests.
- If tests fail, analyze failures and revise your patch.
- Write additional tests if needed to capture important behaviors or edge cases.
- Ensure all tests pass before finalizing.
## 7. Final Verification
- Confirm the root cause is fixed.
- Review your solution for logic correctness and robustness.
- Iterate until you are extremely confident the fix is complete and all tests pass.
## 8. Final Reflection and Additional Testing
- Reflect carefully on the original intent of the user and the problem statement.
- Think about potential edge cases or scenarios that may not be covered by existing tests.
- Write additional tests that would need to pass to fully validate the correctness of your solution.
- Run these new tests and ensure they all pass.
- Be aware that there are additional hidden tests that must also pass for the solution to be successful.
- Do not assume the task is complete just because the visible tests pass; continue refining until you are confident the fix is robust and comprehensive.
"""
PYTHON\_TOOL\_DESCRIPTION = """This function is used to execute Python code or terminal commands in a stateful Jupyter notebook environment. python will respond with the output of the execution or time out after 60.0 seconds. Internet access for this session is disabled. Do not make external web requests or API calls as they will fail. Just as in a Jupyter notebook, you may also execute terminal commands by calling this function with a terminal command, prefaced with an exclamation mark.
In addition, for the purposes of this task, you can call this function with an `apply\_patch` command as input. `apply\_patch` effectively allows you to execute a diff/patch against a file, but the format of the diff specification is unique to this task, so pay careful attention to these instructions. To use the `apply\_patch` command, you should pass a message of the following structure as "input":
%%bash
apply\_patch \<\<"EOF"
\*\*\* Begin Patch
[YOUR\_PATCH]
\*\*\* End Patch
EOF
Where [YOUR\_PATCH] is the actual content of your patch, specified in the following V4A diff format.
\*\*\* [ACTION] File: [path/to/file] -\> ACTION can be one of Add, Update, or Delete.
For each snippet of code that needs to be changed, repeat the following:
[context\_before] -\> See below for further instructions on context.
- [old\_code] -\> Precede the old code with a minus sign.
+ [new\_code] -\> Precede the new, replacement code with a plus sign.
[context\_after] -\> See below for further instructions on context.
For instructions on [context\_before] and [context\_after]:
- By default, show 3 lines of code immediately above and 3 lines immediately below each change. If a change is within 3 lines of a previous change, do NOT duplicate the first change's [context\_after] lines in the second change's [context\_before] lines.
- If 3 lines of context is insufficient to uniquely identify the snippet of code within the file, use the @@ operator to indicate the class or function to which the snippet belongs. For instance, we might have:
@@ class BaseClass
[3 lines of pre-context]
- [old\_code]
+ [new\_code]
[3 lines of post-context]
- If a code block is repeated so many times in a class or function such that even a single @@ statement and 3 lines of context cannot uniquely identify the snippet of code, you can use multiple `@@` statements to jump to the right context. For instance:
@@ class BaseClass
@@ def method():
[3 lines of pre-context]
- [old\_code]
+ [new\_code]
[3 lines of post-context]
Note, then, that we do not use line numbers in this diff format, as the context is enough to uniquely identify code. An example of a message that you might pass as "input" to this function, in order to apply a patch, is shown below.
%%bash
apply\_patch \<\<"EOF"
\*\*\* Begin Patch
\*\*\* Update File: pygorithm/searching/binary\_search.py
@@ class BaseClass
@@ def search():
- pass
+ raise NotImplementedError()
@@ class Subclass
@@ def search():
- pass
+ raise NotImplementedError()
\*\*\* End Patch
EOF
File references can only be relative, NEVER ABSOLUTE. After the apply\_patch command is run, python will always say "Done!", regardless of whether the patch was successfully applied or not. However, you can determine if there are issue and errors by looking at any warnings or logging lines printed BEFORE the "Done!" is output.
"""
python\_bash\_patch\_tool = {
"type": "function",
"name": "python",
"description": PYTHON\_TOOL\_DESCRIPTION,
"parameters": {
"type": "object",
"strict": True,
"properties": {
"input": {
"type": "string",
"description": " The Python code, terminal command (prefaced by exclamation mark), or apply\_patch command that you wish to execute.",
}
},
"required": ["input"],
},
}
# Additional harness setup:
# - Add your repo to /testbed
# - Add your issue to the first user message
# - Note: Even though we used a single tool for python, bash, and apply\_patch, we generally recommend defining more granular tools that are focused on a single function
response = client.responses.create(
instructions=SYS\_PROMPT\_SWEBENCH,
model="gpt-4.1-2025-04-14",
tools=[python\_bash\_patch\_tool],
input=f"Please answer the following question:\\nBug: Typerror..."
)
response.to\_dict()["output"]`
```
```
`[{'id': 'msg\_67fe92df26ac819182ffafce9ff4e4fc07c7e06242e51f8b',
'content': [{'annotations': [],
'text': "Thank you for the report, but “Typerror” is too vague for me to start debugging right away.\\n\\n\*\*To make progress, I need to:\*\*\\n1. Find the exact error message text (e.g. `'TypeError: ...'`).\\n2. Find which file and which line/function/class the error occurred in.\\n3. Figure out what triggered the error (test file, usage, reproduction steps).\\n4. Find the root cause and details.\\n\\n\*\*Next steps:\*\*\\n- Investigate error/log/test output files for a Python `TypeError` message.\\n- Examine the relevant code sections for problematic type usage.\\n- If possible, reproduce the bug locally.\\n\\n\*\*Plan:\*\*\\n- First, I will search for test files and log output in the `/testbed` directory that may contain the full error message and stack trace.\\n\\nLet’s start by listing the contents of the `/testbed` directory to look for clues.",
'type': 'output\_text'}],
'role': 'assistant',
'status': 'completed',
'type': 'message'},
{'arguments': '{"input":"!ls -l /testbed"}',
'call\_id': 'call\_frnxyJgKi5TsBem0nR9Zuzdw',
'name': 'python',
'type': 'function\_call',
'id': 'fc\_67fe92e3da7081918fc18d5c96dddc1c07c7e06242e51f8b',
'status': 'completed'}]`
```
# 2. Long context
GPT-4.1 has a performant 1M token input context window, and is useful for a variety of long context tasks, including structured document parsing, re-ranking, selecting relevant information while ignoring irrelevant context, and performing multi-hop reasoning using context.
## Optimal Context Size
We observe very good performance on needle-in-a-haystack evaluations up to our full 1M token context, and we’ve observed very strong performance at complex tasks with a mix of both relevant and irrelevant code and other documents. However, long context performance can degrade as more items are required to be retrieved, or perform complex reasoning that requires knowledge of the state of the entire context (like performing a graph search, for example).
## Tuning Context Reliance
Consider the mix of external vs. internal world knowledge that might be required to answer your question. Sometimes it’s important for the model to use some of its own knowledge to connect concepts or make logical jumps, while in others it’s desirable to only use provided context
```
`# Instructions
// for internal knowledge
- Only use the documents in the provided External Context to answer the User Query. If you don't know the answer based on this context, you must respond "I don't have the information needed to answer that", even if a user insists on you answering the question.
// For internal and external knowledge
- By default, use the provided external context to answer the User Query, but if other basic knowledge is needed to answer, and you're confident in the answer, you can use some of your own knowledge to help answer the question.`
```
## Prompt Organization
Especially in long context usage, placement of instructions and context can impact performance. If you have long context in your prompt, ideally place your instructions at both the beginning and end of the provided context, as we found this to perform better than only above or below. If you’d prefer to only have your instructions once, then above the provided context works better than below.
# 3. Chain of Thought
As mentioned above, GPT-4.1 is not a reasoning model, but prompting the model to think step by step (called “chain of thought”) can be an effective way for a model to break down problems into more manageable pieces, solve them, and improve overall output quality, with the tradeoff of higher cost and latency associated with using more output tokens. The model has been trained to perform well at agentic reasoning about and real-world problem solving, so it shouldn’t require much prompting to perform well.
We recommend starting with this basic chain-of-thought instruction at the end of your prompt:
```
`...
First, think carefully step by step about what documents are needed to answer the query. Then, print out the TITLE and ID of each document. Then, format the IDs into a list.`
```
From there, you should improve your chain-of-thought (CoT) prompt by auditing failures in your particular examples and evals, and addressing systematic planning and reasoning errors with more explicit instructions. In the unconstrained CoT prompt, there may be variance in the strategies it tries, and if you observe an approach that works well, you can codify that strategy in your prompt. Generally speaking, errors tend to occur from misunderstanding user intent, insufficient context gathering or analysis, or insufficient or incorrect step by step thinking, so watch out for these and try to address them with more opinionated instructions.
Here is an example prompt instructing the model to focus more methodically on analyzing user intent and considering relevant context before proceeding to answer.
```
`# Reasoning Strategy
1. Query Analysis: Break down and analyze the query until you're confident about what it might be asking. Consider the provided context to help clarify any ambiguous or confusing information.
2. Context Analysis: Carefully select and analyze a large set of potentially relevant documents. Optimize for recall - it's okay if some are irrelevant, but the correct documents must be in this list, otherwise your final answer will be wrong. Analysis steps for each:
a. Analysis: An analysis of how it may or may not be relevant to answering the query.
b. Relevance rating: [high, medium, low, none]
3. Synthesis: summarize which documents are most relevant and why, including all documents with a relevance rating of medium or higher.
# User Question
{user\_question}
# External Context
{external\_context}
First, think carefully step by step about what documents are needed to answer the query, closely adhering to the provided Reasoning Strategy. Then, print out the TITLE and ID of each document. Then, format the IDs into a list.`
```
# 4. Instruction Following
GPT-4.1 exhibits outstanding instruction-following performance, which developers can leverage to precisely shape and control the outputs for their particular use cases. Developers often extensively prompt for agentic reasoning steps, response tone and voice, tool calling information, output formatting, topics to avoid, and more. However, since the model follows instructions more literally, developers may need to include explicit specification around what to do or not to do. Furthermore, existing prompts optimized for other models may not immediately work with this model, because existing instructions are followed more closely and implicit rules are no longer being as strongly inferred.
## Recommended Workflow
Here is our recommended workflow for developing and debugging instructions in prompts:
1. Start with an overall “Response Rules” or “Instructions” section with high-level guidance and bullet points.
2. If you’d like to change a more specific behavior, add a section to specify more details for that category, like `# Sample Phrases`.
3. If there are specific steps you’d like the model to follow in its workflow, add an ordered list and instruct the model to follow these steps.
4. If behavior still isn’t working as expected:
1. Check for conflicting, underspecified, or wrong instructions and examples. If there are conflicting instructions, GPT-4.1 tends to follow the one closer to the end of the prompt.
2. Add examples that demonstrate desired behavior; ensure that any important behavior demonstrated in your examples are also cited in your rules.
3. It’s generally not necessary to use all-caps or other incentives like bribes or tips. We recommend starting without these, and only reaching for these if necessary for your particular prompt. Note that if your existing prompts include these techniques, it could cause GPT-4.1 to pay attention to it too strictly.
*Note that using your preferred AI-powered IDE can be very helpful for iterating on prompts, including checking for consistency or conflicts, adding examples, or making cohesive updates like adding an instruction and updating instructions to demonstrate that instruction.*
## Common Failure Modes
These failure modes are not unique to GPT-4.1, but we share them here for general awareness and ease of debugging.
* Instructing a model to always follow a specific behavior can occasionally induce adverse effects. For instance, if told “you must call a tool before responding to the user,” models may hallucinate tool inputs or call the tool with null values if they do not have enough information. Adding “if you don’t have enough information to call the tool, ask the user for the information you need” should mitigate this.
* When provided sample phrases, models can use those quotes verbatim and start to sound repetitive to users. Ensure you instruct the model to vary them as necessary.
* Without specific instructions, some models can be eager to provide additional prose to explain their decisions, or output more formatting in responses than may be desired. Provide instructions and potentially examples to help mitigate.
## Example Prompt: Customer Service
This demonstrates best practices for a fictional customer service agent. Observe the diversity of rules, the specificity, the use of additional sections for greater detail, and an example to demonstrate precise behavior that incorporates all prior rules.
Try running the following notebook cell - you should see both a user message and tool call, and the user message should start with a greeting, then echo back their answer, then mention they’re about to call a tool. Try changing the instructions to shape the model behavior, or trying other user messages, to test instruction following performance.
```
`SYS\_PROMPT\_CUSTOMER\_SERVICE = """You are a helpful customer service agent working for NewTelco, helping a user efficiently fulfill their request while adhering closely to provided guidelines.
# Instructions
- Always greet the user with "Hi, you've reached NewTelco, how can I help you?"
- Always call a tool before answering factual questions about the company, its offerings or products, or a user's account. Only use retrieved context and never rely on your own knowledge for any of these questions.
- However, if you don't have enough information to properly call the tool, ask the user for the information you need.
- Escalate to a human if the user requests.
- Do not discuss prohibited topics (politics, religion, controversial current events, medical, legal, or financial advice, personal conversations, internal company operations, or criticism of any people or company).
- Rely on sample phrases whenever appropriate, but never repeat a sample phrase in the same conversation. Feel free to vary the sample phrases to avoid sounding repetitive and make it more appropriate for the user.
- Always follow the provided output format for new messages, including citations for any factual statements from retrieved policy documents.
- If you're going to call a tool, always message the user with an appropriate message before and after calling the tool.
- Maintain a professional and concise tone in all responses, and use emojis between sentences.
- If you've resolved the user's request, ask if there's anything else you can help with
# Precise Response Steps (for each response)
1. If necessary, call tools to fulfill the user's desired action. Always message the user before and after calling a tool to keep them in the loop.
2. In your response to the user
a. Use active listening and echo back what you heard the user ask for.
b. Respond appropriately given the above guidelines.
# Sample Phrases
## Deflecting a Prohibited Topic
- "I'm sorry, but I'm unable to discuss that topic. Is there something else I can help you with?"
- "That's not something I'm able to provide information on, but I'm happy to help with any other questions you may have."
## Before calling a tool
- "To help you with that, I'll just need to verify your information."
- "Let me check that for you—one moment, please."
- "I'll retrieve the latest details for you now."
## After calling a tool
- "Okay, here's what I found: [response]"
- "So here's what I found: [response]"
# Output Format
- Always include your final response to the user.
- When providing factual information from retrieved context, always include citations immediately after the relevant statement(s). Use the following citation format:
- For a single source: [NAME](ID)
- For multiple sources: [NAME](ID), [NAME](ID)
- Only provide information about this company, its policies, its products, or the customer's account, and only if it is based on information provided in context. Do not answer questions outside this scope.
# Example
## User
Can you tell me about your family plan options?
## Assistant Response 1
### Message
"Hi, you've reached NewTelco, how can I help you? 😊🎉\\n\\nYou'd like to know about our family plan options. 🤝 Let me check that for you—one moment, please. 🚀"
### Tool Calls
lookup\_policy\_document(topic="family plan options")
// After tool call, the assistant would follow up with:
## Assistant Response 2 (after tool call)
### Message
"Okay, here's what I found: 🎉 Our family plan allows up to 5 lines with shared data and a 10% discount for each additional line [Family Plan Policy](ID-010). 📱 Is there anything else I can help you with today? 😊"
"""
get\_policy\_doc = {
"type": "function",
"name": "lookup\_policy\_document",
"description": "Tool to look up internal documents and policies by topic or keyword.",
"parameters": {
"strict": True,
"type": "object",
"properties": {
"topic": {
"type": "string",
"description": "The topic or keyword to search for in company policies or documents.",
},
},
"required": ["topic"],
"additionalProperties": False,
},
}
get\_user\_acct = {
"type": "function",
"name": "get\_user\_account\_info",
"description": "Tool to get user account information",
"parameters": {
"strict": True,
"type": "object",
"properties": {
"phone\_number": {
"type": "string",
"description": "Formatted as '(xxx) xxx-xxxx'",
},
},
"required": ["phone\_number"],
"additionalProperties": False,
},
}
response = client.responses.create(
instructions=SYS\_PROMPT\_CUSTOMER\_SERVICE,
model="gpt-4.1-2025-04-14",
tools=[get\_policy\_doc, get\_user\_acct],
input="How much will it cost for international service? I'm traveling to France.",
# input="Why was my last bill so high?"
)
response.to\_dict()["output"]`
```
```
`[{'id': 'msg\_67fe92d431548191b7ca6cd604b4784b06efc5beb16b3c5e',
'content': [{'annotations': [],
'text': "Hi, you've reached NewTelco, how can I help you? 🌍✈️\\n\\nYou'd like to know the cost of international service while traveling to France. 🇫🇷 Let me check the latest details for you—one moment, please. 🕑",
'type': 'output\_text'}],
'role': 'assistant',
'status': 'completed',
'type': 'message'},
{'arguments': '{"topic":"international service cost France"}',
'call\_id': 'call\_cF63DLeyhNhwfdyME3ZHd0yo',
'name': 'lookup\_policy\_document',
'type': 'function\_call',
'id': 'fc\_67fe92d5d6888191b6cd7cf57f707e4606efc5beb16b3c5e',
'status': 'completed'}]`
```
# 5. General Advice
## Prompt Structure
For reference, here is a good starting point for structuring your prompts.
```
`# Role and Objective
# Instructions
## Sub-categories for more detailed instructions
# Reasoning Steps
# Output Format
# Examples
## Example 1
# Context
# Final instructions and prompt to think step by step`
```
Add or remove sections to suit your needs, and experiment to determine what’s optimal for your usage.
## Delimiters
Here are some general guidelines for selecting the best delimiters for your prompt. Please refer to the Long Context section for special considerations for that context type.
1. Markdown: We recommend starting here, and using markdown titles for major sections and subsections (including deeper hierarchy, to H4+). Use inline backticks or backtick blocks to precisely wrap code, and standard numbered or bulleted lists as needed.
2. XML: These also perform well, and we have improved adherence to information in XML with this model. XML is convenient to precisely wrap a section including start and end, add metadata to the tags for additional context, and enable nesting. Here is an example of using XML tags to nest examples in an example section, with inputs and outputs for each:
```
`\<examples\>
\<example1 type="Abbreviate"\>
\<input\>San Francisco\</input\>
\<output\>- SF\</output\>
\</example1\>
\</examples\>`
```
1. JSON is highly structured and well understood by the model particularly in coding contexts. However it can be more verbose, and require character escaping that can add overhead.
Guidance specifically for adding a large number of documents or files to input context:
* XML performed well in our long context testing.
* Example: `\<doc id='1' title='The Fox'\>The quick brown fox jumps over the lazy dog\</doc\>`
* This format, proposed by Lee et al. ([ref](https://arxiv.org/pdf/2406.13121)), also performed well in our long context testing.
* Example: `ID: 1 | TITLE: The Fox | CONTENT: The quick brown fox jumps over the lazy dog`
* JSON performed particularly poorly.
* Example: `[{'id': 1, 'title': 'The Fox', 'content': 'The quick brown fox jumped over the lazy dog'}]`
The model is trained to robustly understand structure in a variety of formats. Generally, use your judgement and think about what will provide clear information and “stand out” to the model. For example, if you’re retrieving documents that contain lots of XML, an XML-based delimiter will likely be less effective.
## Caveats
* In some isolated cases we have observed the model being resistant to producing very long, repetitive outputs, for example, analyzing hundreds of items one by one. If this is necessary for your use case, instruct the model strongly to output this information in full, and consider breaking down the problem or using a more concise approach.
* We have seen some rare instances of parallel tool calls being incorrect. We advise testing this, and considering setting the [parallel\_tool\_calls](https://platform.openai.com/docs/api-reference/responses/create#responses-create-parallel_tool_calls) param to false if you’re seeing issues.
# Appendix: Generating and Applying File Diffs
Developers have provided us feedback that accurate and well-formed diff generation is a critical capability to power coding-related tasks. To this end, the GPT-4.1 family features substantially improved diff capabilities relative to previous GPT models. Moreover, while GPT-4.1 has strong performance generating diffs of any format given clear instructions and examples, we open-source here one recommended diff format, on which the model has been extensively trained. We hope that in particular for developers just starting out, that this will take much of the guesswork out of creating diffs yourself.
## Apply Patch
See the example below for a prompt that applies our recommended tool call correctly.
```
`APPLY\_PATCH\_TOOL\_DESC = """This is a custom utility that makes it more convenient to add, remove, move, or edit code files. `apply\_patch` effectively allows you to execute a diff/patch against a file, but the format of the diff specification is unique to this task, so pay careful attention to these instructions. To use the `apply\_patch` command, you should pass a message of the following structure as "input":
%%bash
apply\_patch \<\<"EOF"
\*\*\* Begin Patch
[YOUR\_PATCH]
\*\*\* End Patch
EOF
Where [YOUR\_PATCH] is the actual content of your patch, specified in the following V4A diff format.
\*\*\* [ACTION] File: [path/to/file] -\> ACTION can be one of Add, Update, or Delete.
For each snippet of code that needs to be changed, repeat the following:
[context\_before] -\> See below for further instructions on context.
- [old\_code] -\> Precede the old code with a minus sign.
+ [new\_code] -\> Precede the new, replacement code with a plus sign.
[context\_after] -\> See below for further instructions on context.
For instructions on [context\_before] and [context\_after]:
- By default, show 3 lines of code immediately above and 3 lines immediately below each change. If a change is within 3 lines of a previous change, do NOT duplicate the first change’s [context\_after] lines in the second change’s [context\_before] lines.
- If 3 lines of context is insufficient to uniquely identify the snippet of code within the file, use the @@ operator to indicate the class or function to which the snippet belongs. For instance, we might have:
@@ class BaseClass
[3 lines of pre-context]
- [old\_code]
+ [new\_code]
[3 lines of post-context]
- If a code block is repeated so many times in a class or function such that even a single @@ statement and 3 lines of context cannot uniquely identify the snippet of code, you can use multiple `@@` statements to jump to the right context. For instance:
@@ class BaseClass
@@ def method():
[3 lines of pre-context]
- [old\_code]
+ [new\_code]
[3 lines of post-context]
Note, then, that we do not use line numbers in this diff format, as the context is enough to uniquely identify code. An example of a message that you might pass as "input" to this function, in order to apply a patch, is shown below.
%%bash
apply\_patch \<\<"EOF"
\*\*\* Begin Patch
\*\*\* Update File: pygorithm/searching/binary\_search.py
@@ class BaseClass
@@ def search():
- pass
+ raise NotImplementedError()
@@ class Subclass
@@ def search():
- pass
+ raise NotImplementedError()
\*\*\* End Patch
EOF
"""
APPLY\_PATCH\_TOOL = {
"name": "apply\_patch",
"description": APPLY\_PATCH\_TOOL\_DESC,
"parameters": {
"type": "object",
"properties": {
"input": {
"type": "string",
"description": " The apply\_patch command that you wish to execute.",
}
},
"required": ["input"],
},
}`
```
## Reference Implementation: apply\_patch.py
Here’s a reference implementation of the apply\_patch tool that we used as part of model training. You’ll need to make this an executable and available as `apply\_patch` from the shell where the model will execute commands:
```
`#!/usr/bin/env python3
"""
A self-contained \*\*pure-Python 3.9+\*\* utility for applying human-readable
“pseudo-diff” patch files to a collection of text files.
"""
from \_\_future\_\_ import annotations
import pathlib
from dataclasses import dataclass, field
from enum import Enum
from typing import (
Callable,
Dict,
List,
Optional,
Tuple,
Union,
)
# --------------------------------------------------------------------------- #
# Domain objects
# --------------------------------------------------------------------------- #
class ActionType(str, Enum):
ADD = "add"
DELETE = "delete"
UPDATE = "update"
@dataclass
class FileChange:
type: ActionType
old\_content: Optional[str] = None
new\_content: Optional[str] = None
move\_path: Optional[str] = None
@dataclass
class Commit:
changes: Dict[str, FileChange] = field(default\_factory=dict)
# --------------------------------------------------------------------------- #
# Exceptions
# --------------------------------------------------------------------------- #
class DiffError(ValueError):
"""Any problem detected while parsing or applying a patch."""
# --------------------------------------------------------------------------- #
# Helper dataclasses used while parsing patches
# --------------------------------------------------------------------------- #
@dataclass
class Chunk:
orig\_index: int = -1
del\_lines: List[str] = field(default\_factory=list)
ins\_lines: List[str] = field(default\_factory=list)
@dataclass
class PatchAction:
type: ActionType
new\_file: Optional[str] = None
chunks: List[Chunk] = field(default\_factory=list)
move\_path: Optional[str] = None
@dataclass
class Patch:
actions: Dict[str, PatchAction] = field(default\_factory=dict)
# --------------------------------------------------------------------------- #
# Patch text parser
# --------------------------------------------------------------------------- #
@dataclass
class Parser:
current\_files: Dict[str, str]
lines: List[str]
index: int = 0
patch: Patch = field(default\_factory=Patch)
fuzz: int = 0
# ------------- low-level helpers -------------------------------------- #
def \_cur\_line(self) -\> str:
if self.index \>= len(self.lines):
raise DiffError("Unexpected end of input while parsing patch")
return self.lines[self.index]
@staticmethod
def \_norm(line: str) -\> str:
"""Strip CR so comparisons work for both LF and CRLF input."""
return line.rstrip("\\r")
# ------------- scanning convenience ----------------------------------- #
def is\_done(self, prefixes: Optional[Tuple[str, ...]] = None) -\> bool:
if self.index \>= len(self.lines):
return True
if (
prefixes
and len(prefixes) \> 0
and self.\_norm(self.\_cur\_line()).startswith(prefixes)
):
return True
return False
def startswith(self, prefix: Union[str, Tuple[str, ...]]) -\> bool:
return self.\_norm(self.\_cur\_line()).startswith(prefix)
def read\_str(self, prefix: str) -\> str:
"""
Consume the current line if it starts with \*prefix\* and return the text
\*\*after\*\* the prefix. Raises if prefix is empty.
"""
if prefix == "":
raise ValueError("read\_str() requires a non-empty prefix")
if self.\_norm(self.\_cur\_line()).startswith(prefix):
text = self.\_cur\_line()[len(prefix) :]
self.index += 1
return text
return ""
def read\_line(self) -\> str:
"""Return the current raw line and advance."""
line = self.\_cur\_line()
self.index += 1
return line
# ------------- public entry point -------------------------------------- #
def parse(self) -\> None:
while not self.is\_done(("\*\*\* End Patch",)):
# ---------- UPDATE ---------- #
path = self.read\_str("\*\*\* Update File: ")
if path:
if path in self.patch.actions:
raise DiffError(f"Duplicate update for file: {path}")
move\_to = self.read\_str("\*\*\* Move to: ")
if path not in self.current\_files:
raise DiffError(f"Update File Error - missing file: {path}")
text = self.current\_files[path]
action = self.\_parse\_update\_file(text)
action.move\_path = move\_to or None
self.patch.actions[path] = action
continue
# ---------- DELETE ---------- #
path = self.read\_str("\*\*\* Delete File: ")
if path:
if path in self.patch.actions:
raise DiffError(f"Duplicate delete for file: {path}")
if path not in self.current\_files:
raise DiffError(f"Delete File Error - missing file: {path}")
self.patch.actions[path] = PatchAction(type=ActionType.DELETE)
continue
# ---------- ADD ---------- #
path = self.read\_str("\*\*\* Add File: ")
if path:
if path in self.patch.actions:
raise DiffError(f"Duplicate add for file: {path}")
if path in self.current\_files:
raise DiffError(f"Add File Error - file already exists: {path}")
self.patch.actions[path] = self.\_parse\_add\_file()
continue
raise DiffError(f"Unknown line while parsing: {self.\_cur\_line()}")
if not self.startswith("\*\*\* End Patch"):
raise DiffError("Missing \*\*\* End Patch sentinel")
self.index += 1 # consume sentinel
# ------------- section parsers ---------------------------------------- #
def \_parse\_update\_file(self, text: str) -\> PatchAction:
action = PatchAction(type=ActionType.UPDATE)
lines = text.split("\\n")
index = 0
while not self.is\_done(
(
"\*\*\* End Patch",
"\*\*\* Update File:",
"\*\*\* Delete File:",
"\*\*\* Add File:",
"\*\*\* End of File",
)
):
def\_str = self.read\_str("@@ ")
section\_str = ""
if not def\_str and self.\_norm(self.\_cur\_line()) == "@@":
section\_str = self.read\_line()
if not (def\_str or section\_str or index == 0):
raise DiffError(f"Invalid line in update section:\\n{self.\_cur\_line()}")
if def\_str.strip():
found = False
if def\_str not in lines[:index]:
for i, s in enumerate(lines[index:], index):
if s == def\_str:
index = i + 1
found = True
break
if not found and def\_str.strip() not in [
s.strip() for s in lines[:index]
]:
for i, s in enumerate(lines[index:], index):
if s.strip() == def\_str.strip():
index = i + 1
self.fuzz += 1
found = True
break
next\_ctx, chunks, end\_idx, eof = peek\_next\_section(self.lines, self.index)
new\_index, fuzz = find\_context(lines, next\_ctx, index, eof)
if new\_index == -1:
ctx\_txt = "\\n".join(next\_ctx)
raise DiffError(
f"Invalid {'EOF ' if eof else ''}context at {index}:\\n{ctx\_txt}"
)
self.fuzz += fuzz
for ch in chunks:
ch.orig\_index += new\_index
action.chunks.append(ch)
index = new\_index + len(next\_ctx)
self.index = end\_idx
return action
def \_parse\_add\_file(self) -\> PatchAction:
lines: List[str] = []
while not self.is\_done(
("\*\*\* End Patch", "\*\*\* Update File:", "\*\*\* Delete File:", "\*\*\* Add File:")
):
s = self.read\_line()
if not s.startswith("+"):
raise DiffError(f"Invalid Add File line (missing '+'): {s}")
lines.append(s[1:]) # strip leading '+'
return PatchAction(type=ActionType.ADD, new\_file="\\n".join(lines))
# --------------------------------------------------------------------------- #
# Helper functions
# --------------------------------------------------------------------------- #
def find\_context\_core(
lines: List[str], context: List[str], start: int
) -\> Tuple[int, int]:
if not context:
return start, 0
for i in range(start, len(lines)):
if lines[i : i + len(context)] == context:
return i, 0
for i in range(start, len(lines)):
if [s.rstrip() for s in lines[i : i + len(context)]] == [
s.rstrip() for s in context
]:
return i, 1
for i in range(start, len(lines)):
if [s.strip() for s in lines[i : i + len(context)]] == [
s.strip() for s in context
]:
return i, 100
return -1, 0
def find\_context(
lines: List[str], context: List[str], start: int, eof: bool
) -\> Tuple[int, int]:
if eof:
new\_index, fuzz = find\_context\_core(lines, context, len(lines) - len(context))
if new\_index != -1:
return new\_index, fuzz
new\_index, fuzz = find\_context\_core(lines, context, start)
return new\_index, fuzz + 10\_000
return find\_context\_core(lines, context, start)
def peek\_next\_section(
lines: List[str], index: int
) -\> Tuple[List[str], List[Chunk], int, bool]:
old: List[str] = []
del\_lines: List[str] = []
ins\_lines: List[str] = []
chunks: List[Chunk] = []
mode = "keep"
orig\_index = index
while index \< len(lines):
s = lines[index]
if s.startswith(
(
"@@",
"\*\*\* End Patch",
"\*\*\* Update File:",
"\*\*\* Delete File:",
"\*\*\* Add File:",
"\*\*\* End of File",
)
):
break
if s == "\*\*\*":
break
if s.startswith("\*\*\*"):
raise DiffError(f"Invalid Line: {s}")
index += 1
last\_mode = mode
if s == "":
s = " "
if s[0] == "+":
mode = "add"
elif s[0] == "-":
mode = "delete"
elif s[0] == " ":
mode = "keep"
else:
raise DiffError(f"Invalid Line: {s}")
s = s[1:]
if mode == "keep" and last\_mode != mode:
if ins\_lines or del\_lines:
chunks.append(
Chunk(
orig\_index=len(old) - len(del\_lines),
del\_lines=del\_lines,
ins\_lines=ins\_lines,
)
)
del\_lines, ins\_lines = [], []
if mode == "delete":
del\_lines.append(s)
old.append(s)
elif mode == "add":
ins\_lines.append(s)
elif mode == "keep":
old.append(s)
if ins\_lines or del\_lines:
chunks.append(
Chunk(
orig\_index=len(old) - len(del\_lines),
del\_lines=del\_lines,
ins\_lines=ins\_lines,
)
)
if index \< len(lines) and lines[index] == "\*\*\* End of File":
index += 1
return old, chunks, index, True
if index == orig\_index:
raise DiffError("Nothing in this section")
return old, chunks, index, False
# --------------------------------------------------------------------------- #
# Patch → Commit and Commit application
# --------------------------------------------------------------------------- #
def \_get\_updated\_file(text: str, action: PatchAction, path: str) -\> str:
if action.type is not ActionType.UPDATE:
raise DiffError("\_get\_updated\_file called with non-update action")
orig\_lines = text.split("\\n")
dest\_lines: List[str] = []
orig\_index = 0
for chunk in action.chunks:
if chunk.orig\_index \> len(orig\_lines):
raise DiffError(
f"{path}: chunk.orig\_index {chunk.orig\_index} exceeds file length"
)
if orig\_index \> chunk.orig\_index:
raise DiffError(
f"{path}: overlapping chunks at {orig\_index} \> {chunk.orig\_index}"
)
dest\_lines.extend(orig\_lines[orig\_index : chunk.orig\_index])
orig\_index = chunk.orig\_index
dest\_lines.extend(chunk.ins\_lines)
orig\_index += len(chunk.del\_lines)
dest\_lines.extend(orig\_lines[orig\_index:])
return "\\n".join(dest\_lines)
def patch\_to\_commit(patch: Patch, orig: Dict[str, str]) -\> Commit:
commit = Commit()
for path, action in patch.actions.items():
if action.type is ActionType.DELETE:
commit.changes[path] = FileChange(
type=ActionType.DELETE, old\_content=orig[path]
)
elif action.type is ActionType.ADD:
if action.new\_file is None:
raise DiffError("ADD action without file content")
commit.changes[path] = FileChange(
type=ActionType.ADD, new\_content=action.new\_file
)
elif action.type is ActionType.UPDATE:
new\_content = \_get\_updated\_file(orig[path], action, path)
commit.changes[path] = FileChange(
type=ActionType.UPDATE,
old\_content=orig[path],
new\_content=new\_content,
move\_path=action.move\_path,
)
return commit
# --------------------------------------------------------------------------- #
# User-facing helpers
# --------------------------------------------------------------------------- #
def text\_to\_patch(text: str, orig: Dict[str, str]) -\> Tuple[Patch, int]:
lines = text.splitlines() # preserves blank lines, no strip()
if (
len(lines) \< 2
or not Parser.\_norm(lines[0]).startswith("\*\*\* Begin Patch")
or Parser.\_norm(lines[-1]) != "\*\*\* End Patch"
):
raise DiffError("Invalid patch text - missing sentinels")
parser = Parser(current\_files=orig, lines=lines, index=1)
parser.parse()
return parser.patch, parser.fuzz
def identify\_files\_needed(text: str) -\> List[str]:
lines = text.splitlines()
return [
line[len("\*\*\* Update File: ") :]
for line in lines
if line.startswith("\*\*\* Update File: ")
] + [
line[len("\*\*\* Delete File: ") :]
for line in lines
if line.startswith("\*\*\* Delete File: ")
]
def identify\_files\_added(text: str) -\> List[str]:
lines = text.splitlines()
return [
line[len("\*\*\* Add File: ") :]
for line in lines
if line.startswith("\*\*\* Add File: ")
]
# --------------------------------------------------------------------------- #
# File-system helpers
# --------------------------------------------------------------------------- #
def load\_files(paths: List[str], open\_fn: Callable[[str], str]) -\> Dict[str, str]:
return {path: open\_fn(path) for path in paths}
def apply\_commit(
commit: Commit,
write\_fn: Callable[[str, str], None],
remove\_fn: Callable[[str], None],
) -\> None:
for path, change in commit.changes.items():
if change.type is ActionType.DELETE:
remove\_fn(path)
elif change.type is ActionType.ADD:
if change.new\_content is None:
raise DiffError(f"ADD change for {path} has no content")
write\_fn(path, change.new\_content)
elif change.type is ActionType.UPDATE:
if change.new\_content is None:
raise DiffError(f"UPDATE change for {path} has no new content")
target = change.move\_path or path
write\_fn(target, change.new\_content)
if change.move\_path:
remove\_fn(path)
def process\_patch(
text: str,
open\_fn: Callable[[str], str],
write\_fn: Callable[[str, str], None],
remove\_fn: Callable[[str], None],
) -\> str:
if not text.startswith("\*\*\* Begin Patch"):
raise DiffError("Patch text must start with \*\*\* Begin Patch")
paths = identify\_files\_needed(text)
orig = load\_files(paths, open\_fn)
patch, \_fuzz = text\_to\_patch(text, orig)
commit = patch\_to\_commit(patch, orig)
apply\_commit(commit, write\_fn, remove\_fn)
return "Done!"
# --------------------------------------------------------------------------- #
# Default FS helpers
# --------------------------------------------------------------------------- #
def open\_file(path: str) -\> str:
with open(path, "rt", encoding="utf-8") as fh:
return fh.read()
def write\_file(path: str, content: str) -\> None:
target = pathlib.Path(path)
target.parent.mkdir(parents=True, exist\_ok=True)
with target.open("wt", encoding="utf-8") as fh:
fh.write(content)
def remove\_file(path: str) -\> None:
pathlib.Path(path).unlink(missing\_ok=True)
# --------------------------------------------------------------------------- #
# CLI entry-point
# --------------------------------------------------------------------------- #
def main() -\> None:
import sys
patch\_text = sys.stdin.read()
if not patch\_text:
print("Please pass patch text through stdin", file=sys.stderr)
return
try:
result = process\_patch(patch\_text, open\_file, write\_file, remove\_file)
except DiffError as exc:
print(exc, file=sys.stderr)
return
print(result)
if \_\_name\_\_ == "\_\_main\_\_":
main()`
```
## Other Effective Diff Formats
If you want to try using a different diff format, we found in testing that the SEARCH/REPLACE diff format used in Aider’s polyglot benchmark, as well as a pseudo-XML format with no internal escaping, both had high success rates.
These diff formats share two key aspects: (1) they do not use line numbers, and (2) they provide both the exact code to be replaced, and the exact code with which to replace it, with clear delimiters between the two.
```
`SEARCH\_REPLACE\_DIFF\_EXAMPLE = """
path/to/file.py
```
\>\>\>\>\>\>\> SEARCH
def search():
pass
=======
def search():
raise NotImplementedError()
\<\<\<\<\<\<\< REPLACE
"""
PSEUDO\_XML\_DIFF\_EXAMPLE = """
\<edit\>
\<file\>
path/to/file.py
\</file\>
\<old\_code\>
def search():
pass
\</old\_code\>
\<new\_code\>
def search():
raise NotImplementedError()
\</new\_code\>
\</edit\>
"""`
```