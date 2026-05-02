Deep Research API with the Agents SDK
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
# Deep Research API with the Agents SDK
[ KA ](https://github.com/alwell-kevin)[ GJ ](https://www.linkedin.com/in/gloryjain/)
[ Kevin Alwell
(OpenAI)
, ](https://github.com/alwell-kevin)[ Glory Jain ](https://www.linkedin.com/in/gloryjain/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/deep_research_api/introduction_to_deep_research_api_agents.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/deep_research_api/introduction_to_deep_research_api_agents.ipynb)
This cookbook demonstrates how to build Agentic research workflows using the OpenAI Deep Research API and the OpenAI [Agents SDK](https://openai.github.io/openai-agents-python/). It is a continuation of [a fundamentals cookbook](https://cookbook.openai.com/examples/deep_research_api/introduction_to_deep_research_api), if you have not already familiarized yourself with that content, please consider doing so.
You’ll learn how to orchestrate single and multi-agent pipelines, enrich user queries to maximize output quality, stream research progress, integrate web search and [MCP for internal file search](https://cookbook.openai.com/examples/deep_research_api/how_to_build_a_deep_research_mcp_server/readme), and architect a robust research application.
Consider using Deep Research Agents for tasks that require planning, synthesis, tool use, or multi-step reasoning. Do not use Deep Research for trivial fact lookups, simple Q&A, or short-form chat, a vanilla openai.responsesAPI would be faster and cheaper.
### Prerequisites
* OpenAI API key (set as OPENAI\_API\_KEY in your environment)
* Agents SDK and OpenAI Python SDK
### Setup
*Install dependencies*
```
`%pip install --upgrade "openai\>=1.88" "openai-agents\>=0.0.19"`
```
### Import libraries and configure client
**Zero Data Retention**
We disable Data Retention through the os.environ setting below. This allows Enterprises to operate in a Zero Data Retention environment with Deep Research. If Data Retention is *not* an active constraint for you, then consider keeping it enabled so you can have automated tracability for your agent workflows and deep integration with other platform tools like evaluations and fine tuning.
```
`import os
from agents import Agent, Runner, WebSearchTool, RunConfig, set\_default\_openai\_client, HostedMCPTool
from typing import List, Dict, Optional
from pydantic import BaseModel
from openai import AsyncOpenAI
# Use env var for API key and set a long timeout
client = AsyncOpenAI(api\_key="", timeout=600.0)
set\_default\_openai\_client(client)
os.environ["OPENAI\_AGENTS\_DISABLE\_TRACING"] = "1" # Disable tracing for Zero Data Retention (ZDR) Organizations`
```
### Basic Deep Research Agent
The Basic Research Agent performs Deep Research using the o4-mini-deep-research-alpha model. It has native WebSearch access to the public internet and streams its findings directly back into the notebook. In this case we are using the `o4-mini-deep-research-alpha` model, because it is faster than the full o3 deep research model, with acceptable intelligence.
**Learning objective:**
After this, you can run a single-agent research task and stream its progress.
```
`# Define the research agent
research\_agent = Agent(
name="Research Agent",
model="o4-mini-deep-research-2025-06-26",
tools=[WebSearchTool()],
instructions="You perform deep empirical research based on the user's question."
)
# Async function to run the research and print streaming progress
async def basic\_research(query):
print(f"Researching: {query}")
result\_stream = Runner.run\_streamed(
research\_agent,
query
)
async for ev in result\_stream.stream\_events():
if ev.type == "agent\_updated\_stream\_event":
print(f"\\n--- switched to agent: {ev.new\_agent.name} ---")
print(f"\\n--- RESEARCHING ---")
elif (
ev.type == "raw\_response\_event"
and hasattr(ev.data, "item")
and hasattr(ev.data.item, "action")
):
action = ev.data.item.action or {}
if action.get("type") == "search":
print(f"[Web search] query={action.get('query')!r}")
# streaming is complete → final\_output is now populated
return result\_stream.final\_output
# Run the research and print the result
result = await basic\_research("Research the economic impact of semaglutide on global healthcare systems.")
print(result)`
```
### Multi-Agent Research with Clarification
Multi-Agent Deep Research
Consider how you might further improve the Research quality “Deep Research” produces. In this case, we are leveraging a multi-agent architecture to enrich the prompt with *more information* about the users query and what we expect to see in the final research report, before submitting it to a deep research agent.
## Sub-Agent Prompt enrichment
The supporting Agent prompts are specifically designed to improve the quality of the final research output by providing structure and rigor to the users intial query.
```
`# ─────────────────────────────────────────────────────────────
# Prompts
# ─────────────────────────────────────────────────────────────
CLARIFYING\_AGENT\_PROMPT = """
If the user hasn't specifically asked for research (unlikely), ask them what research they would like you to do.
GUIDELINES:
1. \*\*Be concise while gathering all necessary information\*\* Ask 2–3 clarifying questions to gather more context for research.
- Make sure to gather all the information needed to carry out the research task in a concise, well-structured manner. Use bullet points or numbered lists if appropriate for clarity. Don't ask for unnecessary information, or information that the user has already provided.
2. \*\*Maintain a Friendly and Non-Condescending Tone\*\*
- For example, instead of saying “I need a bit more detail on Y,” say, “Could you share more detail on Y?”
3. \*\*Adhere to Safety Guidelines\*\*
"""
RESEARCH\_INSTRUCTION\_AGENT\_PROMPT = """
Based on the following guidelines, take the users query, and rewrite it into detailed research instructions. OUTPUT ONLY THE RESEARCH INSTRUCTIONS, NOTHING ELSE. Transfer to the research agent.
GUIDELINES:
1. \*\*Maximize Specificity and Detail\*\*
- Include all known user preferences and explicitly list key attributes or dimensions to consider.
- It is of utmost importance that all details from the user are included in the expanded prompt.
2. \*\*Fill in Unstated But Necessary Dimensions as Open-Ended\*\*
- If certain attributes are essential for a meaningful output but the user has not provided them, explicitly state that they are open-ended or default to “no specific constraint.”
3. \*\*Avoid Unwarranted Assumptions\*\*
- If the user has not provided a particular detail, do not invent one.
- Instead, state the lack of specification and guide the deep research model to treat it as flexible or accept all possible options.
4. \*\*Use the First Person\*\*
- Phrase the request from the perspective of the user.
5. \*\*Tables\*\*
- If you determine that including a table will help illustrate, organize, or enhance the information in your deep research output, you must explicitly request that the deep research model provide them.
Examples:
- Product Comparison (Consumer): When comparing different smartphone models, request a table listing each model’s features, price, and consumer ratings side-by-side.
- Project Tracking (Work): When outlining project deliverables, create a table showing tasks, deadlines, responsible team members, and status updates.
- Budget Planning (Consumer): When creating a personal or household budget, request a table detailing income sources, monthly expenses, and savings goals.
Competitor Analysis (Work): When evaluating competitor products, request a table with key metrics—such as market share, pricing, and main differentiators.
6. \*\*Headers and Formatting\*\*
- You should include the expected output format in the prompt.
- If the user is asking for content that would be best returned in a structured format (e.g. a report, plan, etc.), ask the Deep Research model to “Format as a report with the appropriate headers and formatting that ensures clarity and structure.”
7. \*\*Language\*\*
- If the user input is in a language other than English, tell the model to respond in this language, unless the user query explicitly asks for the response in a different language.
8. \*\*Sources\*\*
- If specific sources should be prioritized, specify them in the prompt.
- Prioritize Internal Knowledge. Only retrieve a single file once.
- For product and travel research, prefer linking directly to official or primary websites (e.g., official brand sites, manufacturer pages, or reputable e-commerce platforms like Amazon for user reviews) rather than aggregator sites or SEO-heavy blogs.
- For academic or scientific queries, prefer linking directly to the original paper or official journal publication rather than survey papers or secondary summaries.
- If the query is in a specific language, prioritize sources published in that language.
IMPORTANT: Ensure that the complete payload to this function is valid JSON
IMPORTANT: SPECIFY REQUIRED OUTPUT LANGUAGE IN THE PROMPT
"""`
```
# Four-Agent Deep Research Pipeline
1. **Triage Agent**
* Inspects the user’s query
* If context is missing, routes to the Clarifier Agent; otherwise routes to the Instruction Agent
* **Clarifier Agent**
* Asks follow-up questions
* Waits for user (or mock) answers
* **Instruction Builder Agent**
* Converts the enriched input into a precise research brief
* **Research Agent** (`o3-deep-research`)
* Performs web-scale empirical research with `WebSearchTool`
* Performs a search against internal knowledge store using MCP, if there are relevant documents, the agent incorporates those relevant snippets in its reference material.
* Streams intermediate events for transparency
* Outputs final Research Artifact (which we later parse)
For more insight into *how* the MCP server is build. [See this resource.](https://cookbook.openai.com/examples/deep_research_api/how_to_build_a_deep_research_mcp_server/readme)
```
`# ─────────────────────────────────────────────────────────────
# Structured outputs (needed only for Clarifying agent)
# ─────────────────────────────────────────────────────────────
class Clarifications(BaseModel):
questions: List[str]
# ─────────────────────────────────────────────────────────────
# Agents
# ─────────────────────────────────────────────────────────────
research\_agent = Agent(
name="Research Agent",
model="o3-deep-research-2025-06-26",
instructions="Perform deep empirical research based on the user's instructions.",
tools=[WebSearchTool(),
HostedMCPTool(
tool\_config={
"type": "mcp",
"server\_label": "file\_search",
"server\_url": "https://\<url\>/sse",
"require\_approval": "never",
}
)
]
)
instruction\_agent = Agent(
name="Research Instruction Agent",
model="gpt-4o-mini",
instructions=RESEARCH\_INSTRUCTION\_AGENT\_PROMPT,
handoffs=[research\_agent],
)
clarifying\_agent = Agent(
name="Clarifying Questions Agent",
model="gpt-4o-mini",
instructions=CLARIFYING\_AGENT\_PROMPT,
output\_type=Clarifications,
handoffs=[instruction\_agent],
)
triage\_agent = Agent(
name="Triage Agent",
instructions=(
"Decide whether clarifications are required.\\n"
"• If yes → call transfer\_to\_clarifying\_questions\_agent\\n"
"• If no → call transfer\_to\_research\_instruction\_agent\\n"
"Return exactly ONE function-call."
),
handoffs=[clarifying\_agent, instruction\_agent],
)
# ─────────────────────────────────────────────────────────────
# Auto-clarify helper
# ─────────────────────────────────────────────────────────────
async def basic\_research(
query: str,
mock\_answers: Optional[Dict[str, str]] = None,
verbose: bool = False,
):
stream = Runner.run\_streamed(
triage\_agent,
query,
run\_config=RunConfig(tracing\_disabled=True),
)
async for ev in stream.stream\_events():
if isinstance(getattr(ev, "item", None), Clarifications):
reply = []
for q in ev.item.questions:
ans = (mock\_answers or {}).get(q, "No preference.")
reply.append(f"\*\*{q}\*\*\\n{ans}")
stream.send\_user\_message("\\n\\n".join(reply))
continue
if verbose:
print(ev)
#return stream.final\_output
return stream
# ─────────────────────────────────────────────────────────────
# Example run
# ─────────────────────────────────────────────────────────────
result = await basic\_research(
"Research the economic impact of semaglutide on global healthcare systems.",
mock\_answers={}, # or provide canned answers
)`
```
## Agent Interaction Flow
Although provided natively through Agent SDK traces you may want to print human-readable high-level agent interaction flow with tool calls. Run print\_agent\_interaction to get a simplified readable sequence of agent steps, including: Agent name, Type of event (handoff, tool call, message output), Brief tool call info (tool name and arguments).
```
`import json
def parse\_agent\_interaction\_flow(stream):
print("=== Agent Interaction Flow ===")
count = 1
for item in stream.new\_items:
# Agent name, fallback if missing
agent\_name = getattr(item.agent, "name", "Unknown Agent") if hasattr(item, "agent") else "Unknown Agent"
if item.type == "handoff\_call\_item":
func\_name = getattr(item.raw\_item, "name", "Unknown Function")
print(f"{count}. [{agent\_name}] → Handoff Call: {func\_name}")
count += 1
elif item.type == "handoff\_output\_item":
print(f"{count}. [{agent\_name}] → Handoff Output")
count += 1
elif item.type == "mcp\_list\_tools\_item":
print(f"{count}. [{agent\_name}] → mcp\_list\_tools\_item")
count += 1
elif item.type == "reasoning\_item":
print(f"{count}. [{agent\_name}] → Reasoning step")
count += 1
elif item.type == "tool\_call\_item":
tool\_name = getattr(item.raw\_item, "name", None)
# Skip tool call if tool\_name is missing or empty
if not isinstance(tool\_name, str) or not tool\_name.strip():
continue # skip silently
tool\_name = tool\_name.strip()
args = getattr(item.raw\_item, "arguments", None)
args\_str = ""
if args:
try:
parsed\_args = json.loads(args)
if parsed\_args:
args\_str = json.dumps(parsed\_args)
except Exception:
if args.strip() and args.strip() != "{}":
args\_str = args.strip()
args\_display = f" with args {args\_str}" if args\_str else ""
print(f"{count}. [{agent\_name}] → Tool Call: {tool\_name}{args\_display}")
count += 1
elif item.type == "message\_output\_item":
print(f"{count}. [{agent\_name}] → Message Output")
count += 1
else:
print(f"{count}. [{agent\_name}] → {item.type}")
count += 1
# Example usage:
parse\_agent\_interaction\_flow(result)`
```
## Citations
Below is a Python snippet to extract and print the URL citations related to the final output:
```
`def print\_final\_output\_citations(stream, preceding\_chars=50):
# Iterate over new\_items in reverse to find the last message\_output\_item(s)
for item in reversed(stream.new\_items):
if item.type == "message\_output\_item":
for content in getattr(item.raw\_item, 'content', []):
if not hasattr(content, 'annotations') or not hasattr(content, 'text'):
continue
text = content.text
for ann in content.annotations:
if getattr(ann, 'type', None) == 'url\_citation':
title = getattr(ann, 'title', '\<no title\>')
url = getattr(ann, 'url', '\<no url\>')
start = getattr(ann, 'start\_index', None)
end = getattr(ann, 'end\_index', None)
if start is not None and end is not None and isinstance(text, str):
# Calculate preceding snippet start index safely
pre\_start = max(0, start - preceding\_chars)
preceding\_text = text[pre\_start:start].replace('\\n', ' ').strip()
excerpt = text[start:end].replace('\\n', ' ').strip()
print("# --------")
print("# MCP CITATION SAMPLE:")
print(f"# Title: {title}")
print(f"# URL: {url}")
print(f"# Location: chars {start}–{end}")
print(f"# Preceding: '{preceding\_text}'")
print(f"# Excerpt: '{excerpt}'\\n")
else:
# fallback if no indices available
print(f"- {title}: {url}")
break
# Usage
print\_final\_output\_citations(result)`
```
```
`## Deep Research Research Report
print(result.final\_output)`
```
### Conclusion
With the patterns in this notebook, you now have a foundation for building scalable, production-ready research workflows using OpenAI Deep Research Agents. The examples demonstrate not only how to orchestrate multi-agent pipelines and stream research progress, but also how to integrate web search and MCP for external knowledge access.
By leveraging agentic workflows, you can move beyond simple Q&A to tackle complex, multi-step research tasks that require planning, synthesis, and tool use. The modular multi-agent design: triage, clarification, instruction, and research agents enables you to adapt these pipelines to a wide range of domains and use cases, from healthcare and finance to technical due diligence and market analysis.
As the Deep Research API and Agents SDK continue to evolve, these patterns will help you stay at the forefront of automated, data-backed research. Whether you’re building internal knowledge tools, automating competitive intelligence, or supporting expert analysts, these workflows provide a strong, extensible starting point.
**Happy researching!**