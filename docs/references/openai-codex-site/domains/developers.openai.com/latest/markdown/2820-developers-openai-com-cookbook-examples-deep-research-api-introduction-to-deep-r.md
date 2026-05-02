Introduction to deep research in the OpenAI API
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
Jun 25, 2025
# Introduction to deep research in the OpenAI API
[ GJ ](https://www.linkedin.com/in/gloryjain/)[ KA ](https://github.com/alwell-kevin)
[ Glory Jain , ](https://www.linkedin.com/in/gloryjain/)[ Kevin Alwell
(OpenAI)
](https://github.com/alwell-kevin)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/deep_research_api/introduction_to_deep_research_api.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/deep_research_api/introduction_to_deep_research_api.ipynb)
## Background
The Deep Research API enables you to automate complex research workflows that require reasoning, planning, and synthesis across real-world information. It is designed to take a high-level query and return a structured, citation-rich report by leveraging an agentic model capable of decomposing the task, performing web searches, and synthesizing results.
Unlike ChatGPT where this process is abstracted away, the API provides direct programmatic access. When you send a request, the model autonomously plans sub-questions, uses tools like web search and code execution, and produces a final structured response. This cookbook will provide a brief introduction to the Deep Research API and how to use it.
You can access Deep Research via the `responses` endpoint using the following models:
* `o3-deep-research-2025-06-26`: Optimized for in-depth synthesis and higher-quality output
* `o4-mini-deep-research-2025-06-26`: Lightweight and faster, ideal for latency-sensitive use cases
## Setup
### Install requirements
Install the latest version of the OpenAI Python SDK.
```
`!pip install --upgrade openai`
```
### Authenticate
Import the OpenAI client and initialize with your API key.
```
`from openai import OpenAI
OPENAI\_API\_KEY="" # YOUR OPENAI\_API\_KEY
#OPENAI\_API\_KEY = os.environ.get("OPENAI\_API\_KEY")
client = OpenAI(api\_key=OPENAI\_API\_KEY)`
```
## Getting started
Let’s walk through an example of a Deep Research API call. Imagine we’re working at a healthcare financial services firm tasked with producing an in-depth report on the economic implications of recent medications used to treat type 2 diabetes and obesity—particularly semaglutide. Our goal is to synthesize clinical outcomes, cost-effectiveness, and regional pricing data into a structured, citation-backed analysis that could inform investment, payer strategy, or policy recommendations.
To get started, let’s:
* Put our role in the system message, outlining what type of report we’d like to generate
* Set the summary paramter to “auto” for now for the best available summary. (If you’d like for your report to more detailed, you can set summary to detailed)
* Include the required tool web\_search\_preview and optionally add code\_interpreter.
* Set the background parameter to True. Since a Deep Research task can take several minutes to execute, enabling background mode will allow you to run the request asynchronously without having to worry about timeouts or other connectivity issues.
```
`system\_message = """
You are a professional researcher preparing a structured, data-driven report on behalf of a global health economics team. Your task is to analyze the health question the user poses.
Do:
- Focus on data-rich insights: include specific figures, trends, statistics, and measurable outcomes (e.g., reduction in hospitalization costs, market size, pricing trends, payer adoption).
- When appropriate, summarize data in a way that could be turned into charts or tables, and call this out in the response (e.g., “this would work well as a bar chart comparing per-patient costs across regions”).
- Prioritize reliable, up-to-date sources: peer-reviewed research, health organizations (e.g., WHO, CDC), regulatory agencies, or pharmaceutical earnings reports.
- Include inline citations and return all source metadata.
Be analytical, avoid generalities, and ensure that each section supports data-backed reasoning that could inform healthcare policy or financial modeling.
"""
user\_query = "Research the economic impact of semaglutide on global healthcare systems."
response = client.responses.create(
model="o3-deep-research",
input=[
{
"role": "developer",
"content": [
{
"type": "input\_text",
"text": system\_message,
}
]
},
{
"role": "user",
"content": [
{
"type": "input\_text",
"text": user\_query,
}
]
}
],
reasoning={
"summary": "auto"
},
tools=[
{
"type": "web\_search\_preview"
},
{
"type": "code\_interpreter",
"container": {
"type": "auto",
"file\_ids": []
}
}
]
)`
```
## Parse the Response
The Deep Research API response includes a structured final answer along with inline citations, summaries of the reasoning steps, and source metadata.
### Extract the Final Report Output
Here’s the main text output of this report.
```
`# Access the final report from the response object
print(response.output[-1].content[0].text)`
```
### Access Inline Citations and Metadata
Inline citations in the response text are annotated and linked to their corresponding source metadata. Each annotation contains:
* start\_index and end\_index: the character span in the text the citation refers to
* title: a brief title of the source
* url: the full source URL
This structure will allow you to build a citation list or bibliography, add clickable hyperlinks in downstream apps, and highlight & trace data-backed claims in your report.
```
`annotations = response.output[-1].content[0].annotations
for i, citation in enumerate(annotations):
print(f"Citation {i+1}:")
print(f" Title: {citation.title}")
print(f" URL: {citation.url}")
print(f" Location: chars {citation.start\_index}–{citation.end\_index}")`
```
### Inspect Intermediate Steps
The Deep Research API also exposes all intermediate steps taken by the agent, including reasoning steps, web search calls, and code executions. You can use these to debug, analyze, or visualize how the final answer was constructed.
Each intermediate step is stored in `response.output`, and the `type` field indicates what kind it is.
#### Reasoning Step
These represent internal summaries or plans generated by the model as it reasons through sub-questions.
```
`# Find the first reasoning step
reasoning = next(item for item in response.output if item.type == "reasoning")
for s in reasoning.summary:
print(s.text)`
```
#### Web Search Call
These show what search queries were executed and can help you trace what information the model retrieved.
```
`# Find the first web search step
search = next(item for item in response.output if item.type == "web\_search\_call")
print("Query:", search.action["query"])
print("Status:", search.status)`
```
#### Code Execution
If the model used the code interpreter (e.g. for parsing data or generating charts), those steps will appear as type “code\_interpreter\_call” or similar.
```
`# Find a code execution step (if any)
code\_step = next((item for item in response.output if item.type == "code\_interpreter\_call"), None)
if code\_step:
print(code\_step.input)
print(code\_step.output)
else:
print("No code execution steps found.")`
```
#### Model Context Protocol (MCP)
Suppose you would like to pull in your own internal documents as part of a Deep Research task. The Deep Research models and the Responses API both support MCP-based tools, so you can extend them to query your private knowledge stores or other 3rd party services.
In the example below, we configure an MCP tool that lets Deep Research fetch your organizations internal semaglutide studies on demand. The MCP server is a proxy for the OpenAI File Storage service that automagically vectorizes your uploaded files for performant retrieval.
If you would like to see *how* we built this simple MCP server, refer to [this related cookbook](https://cookbook.openai.com/examples/deep_research_api/how_to_build_a_deep_research_mcp_server/readme).
```
`# system\_message includes reference to internal file lookups for MCP.
system\_message = """
You are a professional researcher preparing a structured, data-driven report on behalf of a global health economics team. Your task is to analyze the health question the user poses.
Do:
- Focus on data-rich insights: include specific figures, trends, statistics, and measurable outcomes (e.g., reduction in hospitalization costs, market size, pricing trends, payer adoption).
- When appropriate, summarize data in a way that could be turned into charts or tables, and call this out in the response (e.g., “this would work well as a bar chart comparing per-patient costs across regions”).
- Prioritize reliable, up-to-date sources: peer-reviewed research, health organizations (e.g., WHO, CDC), regulatory agencies, or pharmaceutical earnings reports.
- Include an internal file lookup tool to retrieve information from our own internal data sources. If you’ve already retrieved a file, do not call fetch again for that same file. Prioritize inclusion of that data.
- Include inline citations and return all source metadata.
Be analytical, avoid generalities, and ensure that each section supports data-backed reasoning that could inform healthcare policy or financial modeling.
"""
user\_query = "Research the economic impact of semaglutide on global healthcare systems."
response = client.responses.create(
model="o3-deep-research-2025-06-26",
input=[
{
"role": "developer",
"content": [
{
"type": "input\_text",
"text": system\_message,
}
]
},
{
"role": "user",
"content": [
{
"type": "input\_text",
"text": user\_query,
}
]
}
],
reasoning={
"summary": "auto"
},
tools=[
{
"type": "web\_search\_preview"
},
{ # ADD MCP TOOL SUPPORT
"type": "mcp",
"server\_label": "internal\_file\_lookup",
"server\_url": "https://\<your\_mcp\_server\>/sse/", # Update to the location of \*your\* MCP server
"require\_approval": "never"
}
]
)`
```
## Reviewing your response
First 100 characters of your Research Report, followed by Citations and MCP tool calls.
```
`# Grab the full report text once
report\_text = response.output[-1].content[0].text
print("REPORT EXCERPT:")
print(report\_text[:100]) # first 100 chars
print("--------")
annotations = response.output[-1].content[0].annotations
target\_url = "https://platform.openai.com/storage/files"
for citation in annotations:
if citation.url.startswith(target\_url):
start, end = citation.start\_index, citation.end\_index
# extract exactly the cited span
excerpt = report\_text[start:end]
# extract up to 100 chars immediately before the citation
pre\_start = max(0, start - 100)
preceding\_txt = report\_text[pre\_start:start]
print("MCP CITATION SAMPLE:")
print(f" Title: {citation.title}")
print(f" URL: {citation.url}")
print(f" Location: chars {start}–{end}")
print(f" Preceding: {preceding\_txt!r}")
print(f" Excerpt: {excerpt!r}")
break
print("--------")
# EXAMPLE MCP CITATION
# REPORT EXCERPT:
# # Introduction
# Semaglutide – a glucagon-like peptide-1 (GLP-1) analogue – has rapidly become a blo
# --------
# MCP CITATION SAMPLE:
# Title: Document file-WqbCdYNqNzGuFfCAeWyZfp
# URL: https://platform.openai.com/storage/files/file-WqbCdYNqNzGuFfCAeWyZfp
# Location: chars 237–331
# Preceding: 'and obesity due to its potent clinical efficacy (often inducing \~10–15% body weight loss in trials) '
# Excerpt: '([platform.openai.com](https://platform.openai.com/storage/files/file-WqbCdYNqNzGuFfCAeWyZfp))'
# print the MCP tool calls
calls = [
(item.name, item.server\_label, item.arguments)
for item in response.output
if item.type == "mcp\_call" and item.arguments
]
for name, server, args in calls:
print(f"{name}@{server} → {args}")
print("--------")`
```
## Clarifying Questions in ChatGPT vs. the Deep Research API
If you’ve used Deep Research in ChatGPT, you may have noticed that it often asks follow-up questions after you submit a query. This is intentional: ChatGPT uses an intermediate model (like gpt-4.1) to help clarify your intent and gather more context (such as your preferences, goals, or constraints) before the research process begins. This extra step helps the system tailor its web searches and return more relevant and targeted results.
In contrast, the Deep Research API skips this clarification step. As a developer, you can configure this processing step to rewrite the user prompt or ask a set of clarifying questions, since the model expects fully-formed prompts up front and will not ask for additional context or fill in missing information; it simply starts researching based on the input it receives.
To get strong, reliable outputs from the API, you can use two approaches.
* Use a prompt rewriter using another lightweight model (e.g., gpt-4.1) to expand or specify user queries before passing them to the research model.
* Include all relevant details: desired scope, comparisons, metrics, regions, preferred sources, and expected output format.
This setup gives developers full control over how research tasks are framed, but also places greater responsibility on the quality of the input prompt. Here’s an example of a generic rewriting\_prompt to better direct the subsequent deep research query.
Here’s an example of a rewriting prompt:
```
`suggested\_rewriting\_prompt = """
You will be given a research task by a user. Your job is to produce a set of instructions for a researcher that will complete the task. Do NOT complete the task yourself, just provide instructions on how to complete it.
GUIDELINES:
1. \*\*Maximize Specificity and Detail\*\*
- Include all known user preferences and explicitly list key attributes or dimensions to consider.
- It is of utmost importance that all details from the user are included in the instructions.
2. \*\*Fill in Unstated But Necessary Dimensions as Open-Ended\*\*
- If certain attributes are essential for a meaningful output but the user has not provided them, explicitly state that they are open-ended or default to no specific constraint.
3. \*\*Avoid Unwarranted Assumptions\*\*
- If the user has not provided a particular detail, do not invent one.
- Instead, state the lack of specification and guide the researcher to treat it as flexible or accept all possible options.
4. \*\*Use the First Person\*\*
- Phrase the request from the perspective of the user.
5. \*\*Tables\*\*
- If you determine that including a table will help illustrate, organize, or enhance the information in the research output, you must explicitly request that the researcher provide them.
Examples:
- Product Comparison (Consumer): When comparing different smartphone models, request a table listing each model's features, price, and consumer ratings side-by-side.
- Project Tracking (Work): When outlining project deliverables, create a table showing tasks, deadlines, responsible team members, and status updates.
- Budget Planning (Consumer): When creating a personal or household budget, request a table detailing income sources, monthly expenses, and savings goals.
Competitor Analysis (Work): When evaluating competitor products, request a table with key metrics, such as market share, pricing, and main differentiators.
6. \*\*Headers and Formatting\*\*
- You should include the expected output format in the prompt.
- If the user is asking for content that would be best returned in a structured format (e.g. a report, plan, etc.), ask the researcher to format as a report with the appropriate headers and formatting that ensures clarity and structure.
7. \*\*Language\*\*
- If the user input is in a language other than English, tell the researcher to respond in this language, unless the user query explicitly asks for the response in a different language.
8. \*\*Sources\*\*
- If specific sources should be prioritized, specify them in the prompt.
- For product and travel research, prefer linking directly to official or primary websites (e.g., official brand sites, manufacturer pages, or reputable e-commerce platforms like Amazon for user reviews) rather than aggregator sites or SEO-heavy blogs.
- For academic or scientific queries, prefer linking directly to the original paper or official journal publication rather than survey papers or secondary summaries.
- If the query is in a specific language, prioritize sources published in that language.
"""`
```
```
`response = client.responses.create(
instructions=suggested\_rewriting\_prompt,
model="gpt-4.1-2025-04-14",
input="help me plan a trip to france",
)`
```
```
`new\_query = response.output[0].content[0].text
print(new\_query)`
```
In this instance, a user submitted a generic or open-ended query without specifying key details like travel dates, destination preferences, budget, interests, or travel companions; the rewriting prompt rewrote the query so Deep Research will attempt to generate a broad and inclusive response that anticipates common use cases.
While this behavior can be helpful in surfacing a wide range of options, it often leads to verbosity, higher latency, and increased token usage, as the model must account for many possible scenarios. This is especially true for queries that trigger complex planning or synthesis tasks (e.g. multi-destination travel itineraries, comparative research, product selection).
Instead of proceeding immediately with a broad research plan, let’s trying using a lighter weight model to gently ask clarification questions from the user before generating a full answer and then using the rewriting prompt for clearer output for the model.
```
`suggested\_clariying\_prompt = """"
You will be given a research task by a user. Your job is NOT to complete the task yet, but instead to ask clarifying questions that would help you or another researcher produce a more specific, efficient, and relevant answer.
GUIDELINES:
1. \*\*Maximize Relevance\*\*
- Ask questions that are \*directly necessary\* to scope the research output.
- Consider what information would change the structure, depth, or direction of the answer.
2. \*\*Surface Missing but Critical Dimensions\*\*
- Identify essential attributes that were not specified in the user’s request (e.g., preferences, time frame, budget, audience).
- Ask about each one \*explicitly\*, even if it feels obvious or typical.
3. \*\*Do Not Invent Preferences\*\*
- If the user did not mention a preference, \*do not assume it\*. Ask about it clearly and neutrally.
4. \*\*Use the First Person\*\*
- Phrase your questions from the perspective of the assistant or researcher talking to the user (e.g., “Could you clarify...” or “Do you have a preference for...”)
5. \*\*Use a Bulleted List if Multiple Questions\*\*
- If there are multiple open questions, list them clearly in bullet format for readability.
6. \*\*Avoid Overasking\*\*
- Prioritize the 3–6 questions that would most reduce ambiguity or scope creep. You don’t need to ask \*everything\*, just the most pivotal unknowns.
7. \*\*Include Examples Where Helpful\*\*
- If asking about preferences (e.g., travel style, report format), briefly list examples to help the user answer.
8. \*\*Format for Conversational Use\*\*
- The output should sound helpful and conversational—not like a form. Aim for a natural tone while still being precise.
"""
response = client.responses.create(
instructions=suggested\_clariying\_prompt,
model="gpt-4.1-2025-04-14",
input="help me plan a trip to france",
)
new\_query = response.output[0].content[0].text
print(new\_query)`
```
```
`user\_follow\_up = """I'd like to travel in August. I'd like to visit Paria and Nice. I'd like to keep it under $1500 for a 7 day trip without including flights.
I'm going with my friend. we're both in our mid-twenties. i like history, really good french food and wine, and hiking
"""
instructions\_for\_DR = client.responses.create(
instructions=suggested\_rewriting\_prompt,
model="gpt-4.1-2025-04-14",
input=user\_follow\_up,
)
instructions\_for\_deep\_research = instructions\_for\_DR.output[0].content[0].text
print(instructions\_for\_deep\_research)`
```
```
`deep\_research\_call = client.responses.create(
model="o4-mini-deep-research-2025-06-26",
input=[
{
"role": "developer",
"content": [
{
"type": "input\_text",
"text": instructions\_for\_deep\_research,
}
]
},
],
reasoning={
"summary": "auto"
},
tools=[
{
"type": "web\_search\_preview"
},
]
)`
```
```
`# Access the final report from the response object
print(deep\_research\_call.output[-1].content[0].text)`
```
And there you have it! A deep research report crafted for your upcoming trip to France!
In this notebook, we explored how to use the Deep Research API to automate complex, real-world research tasks, from analyzing the economic impact of semaglutide to planning a trip to France that works for you. Deep Research shines when you need structured, citation-backed answers grounded in real-world evidence. Some standout use cases include:
* Product comparisons and market analyses
* Competitive intelligence and strategy reports
* Technical literature reviews and policy synthesis
Whether you’re looking to build research agents, generate structured reports, or integrate high-quality synthesis into your workflows, we hope the examples here help you get started.
What’s next? [Deep Research Agents](https://cookbook.openai.com/examples/deep_research_api/introduction_to_deep_research_api_agents)