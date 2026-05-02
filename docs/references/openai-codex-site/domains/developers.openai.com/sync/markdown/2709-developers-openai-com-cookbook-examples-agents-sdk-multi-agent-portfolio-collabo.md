Multi-Agent Portfolio Collaboration with OpenAI Agents SDK
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
May 28, 2025
# Multi-Agent Portfolio Collaboration with OpenAI Agents SDK
[ RP ](https://www.linkedin.com/in/rajpathakopenai/)[ CH ](https://www.linkedin.com/in/chelsea-tsaiszuhu/)
[ Raj Pathak , ](https://www.linkedin.com/in/rajpathakopenai/)[ Chelsea Hu ](https://www.linkedin.com/in/chelsea-tsaiszuhu/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/agents_sdk/multi-agent-portfolio-collaboration/multi_agent_portfolio_collaboration.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/agents_sdk/multi-agent-portfolio-collaboration/multi_agent_portfolio_collaboration.ipynb)
## Introduction
*This guide is for readers already familiar with OpenAI models and LLM agents, and want to see how to orchestrate a team of agents for a real-world, complex task.*
**What You’ll Learn**
In this notebook, you’ll learn how to use the OpenAI Agents SDK to design and implement a complex multi-agent collaboration system. Specifically, you’ll see how to:
* Build a workflow where multiple specialist agents (Macro, Fundamental, Quantitative) collaborate under a Portfolio Manager agent to solve a challenging investment research problem.
* Use the “agents as a tool” approach, where a central agent orchestrates and calls other agents as tools for specific subtasks.
* Leverage all major tool types supported by the SDK (custom Python functions, managed tools like Code Interpreter and WebSearch, and external MCP servers) in a single, integrated workflow.
* Apply best practices for modularity, parallelism, and observability in agentic patterns.
**Why this matters**
The “agents as a tool” pattern is a powerful way to build transparent, auditable, and scalable multi-agent collaboration . This example demonstrates how to combine deep specialization, parallel execution, and robust orchestration using the OpenAI Agents SDK.
By the end of this guide, you’ll have a clear blueprint for building your own multi-agent workflows for research, analysis, or any complex task that benefits from expert collaboration.
1. [What is Multi-Agent Collaboration?](#what-is-multi-agent-collaboration)
2. [Collaboration Patterns: Handoff vs. Agent-as-Tool](#collaboration-patterns-handoff-vs-agent-as-tool)
3. [Architecture Overview](#architecture-overview)
4. [Supported Tool Types](#supported-tool-types)
5. [Setup](#setup)
6. [Running the Workflow](#running-the-workflow)
7. [The Head Portfolio Manager (PM) Agent](#the-head-portfolio-manager-pm-agent)
8. [Breaking Down the Head Portfolio Manager Agent](#breaking-down-the-head-portfolio-manager-agent)
9. [Example Output](#example-output)
10. [Best Practices When Building Agents](#best-practices-when-building-agents)
11. [Further Reading & Best Practices](#further-reading--best-practices)
## What is Multi-Agent Collaboration?
**Multi-agent collaboration** means multiple autonomous agents (LLM “nodes”) coordinate to achieve an overarching goal that would be difficult for a single agent to handle. Instead of one monolithic prompt, each agent handles a specific subtask or expertise area, and an orchestration layer connects these agent “nodes” into a coherent workflow. This approach is useful for complex systems – for example, a financial analysis might be broken into macro-economic analysis, fundamental company analysis, and quantitative signal analysis, each handled by a different agent specialist. The agents share information and their results are combined to produce a final outcome.
### Collaboration Patterns: Handoff vs. Agent-as-Tool
The OpenAI Agents SDK supports multiple patterns for agents to work together:
* **Handoff Collaboration:** One agent can *handoff* control to another agent mid-problem. In a handoff architecture, each agent knows about the others and can decide when to defer to a more appropriate agent. This is flexible for open-ended or conversational workflows, but can make it harder to maintain a global view of the task. [Read more in the SDK docs.](https://openai.github.io/openai-agents-python/handoffs/)
* **Agent as a Tool:** In this approach, one agent (often a central planner or manager) **calls other agents as if they were tools**. Sub-agents don’t take over the conversation; instead, the main agent invokes them for specific subtasks and incorporates their results. This model keeps a single thread of control (the main agent orchestrates everything) and tends to simplify coordination. **This repo uses the agent-as-tool model:** the Portfolio Manager agent remains in charge, using the other specialist agents as tools when it needs their expertise. This choice keeps the overall reasoning transparent and allows parallel execution of sub-tasks, which is ideal for complex analyses.
For more on these collaboration patterns, see the [OpenAI Agents SDK documentation](https://openai.github.io/openai-agents-python/multi_agent/).
## Architecture Overview
Our system follows a **hub-and-spoke design**. The **Portfolio Manager agent** is the hub (central coordinator), and the **specialist agents** are the spokes. The user’s query (e.g. “How would a planned interest rate reduction affect my GOOGL holdings?”) goes first to the Portfolio Manager. The Portfolio Manager agent is prompted to break down the problem and delegate to the appropriate specialist agents. It treats each specialist as a callable tool, invoking them for their portion of the analysis. All three report back to the Portfolio Manager, which then synthesizes a final answer for the user.
## Supported Tool Types
A key advantage of the Agents SDK is the flexibility in defining **tools** that agents can use. Tools can range from simple Python functions to external services. In this project, we use:
* **MCP (Model Context Protocol) Server:** Used to connect agents to external tools and data sources in a standardized way. This project uses a local MCP server for Yahoo Finance data (see `mcp/yahoo\_finance\_server.py`). [Learn more: OpenAI MCP docs](https://openai.github.io/openai-agents-python/mcp/) | [MCP Spec](https://modelcontextprotocol.io/)
* **OpenAI Managed Tools:** Managed tools are built-in, hosted tools provided by OpenAI that require no custom implementation. They offer powerful capabilities out of the box, such as **Code Interpreter** (for quantitative/statistical analysis) and **WebSearch** (for up-to-date news and data). These tools are easy to integrate, maintained by OpenAI, and allow agents to perform advanced actions like code execution and real-time information retrieval without additional setup.
* **Custom Tools:** Custom tools are any Python functions you define and register as tools for your agent. The Agents SDK makes this easy: just decorate your function, and the SDK will automatically extract its name, docstring, and input schema. This is ideal for domain-specific logic, data access, or workflow extensions.
In our project, we use custom tools to access FRED economic data ([see FRED API](https://fred.stlouisfed.org/docs/api/api_key.html)) and perform file system operations.
Custom tools give you full flexibility to extend your agent’s capabilities beyond built-in or managed tools. [See the SDK docs on function tools.](https://openai.github.io/openai-agents-python/tools/#function-tools)
>
**> Want to add more tools?
**> The SDK supports a wide range of tool types, including web search, file search, code execution, and more.
[> See the full list of supported tools in the SDK documentation.
](https://openai.github.io/openai-agents-python/tools/)
>
## Setup
```
`# Install required dependencies
!pip install -r requirements.txt`
```
**Before running the workflow, set your environment variables:**
* `OPENAI\_API\_KEY` (for OpenAI access)
* `FRED\_API\_KEY` (for FRED economic data, see [FRED API key instructions](https://fred.stlouisfed.org/docs/api/api_key.html))
```
`import os
missing = []
if not os.environ.get('OPENAI\_API\_KEY'):
missing.append('OPENAI\_API\_KEY')
if not os.environ.get('FRED\_API\_KEY'):
missing.append('FRED\_API\_KEY')
if missing:
print(f"Missing environment variable(s): {', '.join(missing)}. Please set them before running the workflow.")
else:
print("All required API keys are set.")`
```
## Running the Workflow
Edit the question to whatever you’d like, but keep the date field to improve accuracy!
**Disclaimer:** This example is for educational purposes only. Consult a qualified financial professional before making any investment decisions
The workflow is kicked off by sending a user request to the Head Portfolio Manager (PM) agent. The PM agent orchestrates the entire process, delegating to specialist agents and tools as needed. You can monitor the workflow in real time using OpenAI Traces, which provide detailed visibility into every agent and tool call.
Edit the `question` in the code below to whatever you’d like, but keep the date field to improve accuracy!
**Note:** Depending on the complexity of the task, this request can take up to 10 minutes.
```
`import datetime
import json
import os
from pathlib import Path
from contextlib import AsyncExitStack
from agents import Runner, add\_trace\_processor, trace
from agents.tracing.processors import BatchTraceProcessor
from utils import FileSpanExporter, output\_file
from investment\_agents.config import build\_investment\_agents
import asyncio
add\_trace\_processor(BatchTraceProcessor(FileSpanExporter()))
async def run\_workflow():
if "OPENAI\_API\_KEY" not in os.environ:
raise EnvironmentError("OPENAI\_API\_KEY not set — set it as an environment variable before running.")
today\_str = datetime.date.today().strftime("%B %d, %Y")
question = (
f"Today is {today\_str}. "
"How would the planned interest rate reduction effect my holdings in GOOGL if they were to happen?"
"Considering all the factors effecting its price right now (Macro, Technical, Fundamental, etc.), what is a realistic price target by the end of the year?"
)
bundle = build\_investment\_agents()
async with AsyncExitStack() as stack:
for agent in [getattr(bundle, "fundamental", None), getattr(bundle, "quant", None)]:
if agent is None:
continue
for server in getattr(agent, "mcp\_servers", []):
await server.connect()
await stack.enter\_async\_context(server)
print("Running multi-agent workflow with tracing enabled...\\n")
with trace(
"Investment Research Workflow",
metadata={"question": question[:512]}
) as workflow\_trace:
print(
f"\\n🔗 View the trace in the OpenAI console: "
f"https://platform.openai.com/traces/trace?trace\_id={workflow\_trace.trace\_id}\\n"
)
response = None
try:
response = await asyncio.wait\_for(
Runner.run(bundle.head\_pm, question, max\_turns=40),
timeout=1200
)
except asyncio.TimeoutError:
print("\\n❌ Workflow timed out after 20 minutes.")
report\_path = None
try:
if hasattr(response, 'final\_output'):
output = response.final\_output
if isinstance(output, str):
data = json.loads(output)
if isinstance(data, dict) and 'file' in data:
report\_path = output\_file(data['file'])
except Exception as e:
print(f"Could not parse investment report path: {e}")
print(f"Workflow Completed Response from Agent: {response.final\_output if hasattr(response, 'final\_output') else response}, investment report created: {report\_path if report\_path else '[unknown]'}")
# In a Jupyter notebook cell, run:
await run\_workflow()`
```
## Breaking Down the Head Portfolio Manager Agent
The Head Portfolio Manager (PM) agent is the orchestrator of the entire workflow. It coordinates a set of four specialist agents, each focused on a different area of expertise. This design is intentional: overloading a single agent with every possible responsibility leads to shallow, generic outputs and makes it hard to maintain or improve your system over time.
### Why This Design?
By breaking the problem into specialized agents—each with a clear role—you get:
* **Deeper, higher-quality research:** Each agent can focus on its domain, using the right tools and prompts for the job. The PM agent brings these perspectives together for a more nuanced, robust answer.
* **Modularity and clarity:** You can update, test, or improve one agent without affecting the others. This makes your system easier to maintain and extend as your needs evolve.
* **Faster results through parallelism:** Independent agents can work at the same time, dramatically reducing the time to complete complex, multi-part analyses.
* **Consistency and auditability:** A structured, prompt-driven workflow ensures every run follows best practices, is easy to debug, and produces outputs you can trust and review.
This approach is ideal for any application where you want depth, specialization, and reliability—whether you’re building a research assistant, a decision support tool, or any system that benefits from expert collaboration and orchestration.
**How We Implement This in Practice:**
* Each specialist agent (Fundamental, Macro, Quantitative) is wrapped as a callable tool using the SDK’s `function\_tool` decorator, with custom names and descriptions. This makes the PM agent’s toolset explicit and LLM-friendly.
* The Head PM agent uses the `run\_all\_specialists\_parallel` tool to invoke all three specialists concurrently, leveraging `parallel\_tool\_calls=True` for maximum speed and efficiency.
* The agent’s prompt is loaded from a markdown file (`pm\_base.md`), encoding not just the firm’s philosophy but also detailed tool usage rules and a step-by-step workflow. This ensures every run is consistent, auditable, and aligned with best practices.
* After gathering and reviewing the specialist outputs, the PM agent uses a dedicated memo editor tool to assemble, format, and finalize the investment report. This separation of concerns keeps the workflow modular and easy to extend.
* The system is designed for extensibility: you can add new specialist agents, swap out tools, or update prompts without breaking the overall orchestration logic. All tool calls, agent decisions, and outputs are captured in OpenAI Traces for full transparency and debugging.
These implementation choices directly support the benefits above—enabling deep, modular, and reliable multi-agent research workflows that are easy to maintain, audit, and improve.
### Head Portfolio Manager Agent: Code
```
`from agents import Agent, ModelSettings, function\_tool
from utils import load\_prompt, DISCLAIMER
def build\_head\_pm\_agent(fundamental, macro, quant, memo\_edit\_tool):
def make\_agent\_tool(agent, name, description):
@function\_tool(name\_override=name, description\_override=description)
async def agent\_tool(input):
return await specialist\_analysis\_func(agent, input)
return agent\_tool
fundamental\_tool = make\_agent\_tool(fundamental, "fundamental\_analysis", "Generate the Fundamental Analysis section.")
macro\_tool = make\_agent\_tool(macro, "macro\_analysis", "Generate the Macro Environment section.")
quant\_tool = make\_agent\_tool(quant, "quantitative\_analysis", "Generate the Quantitative Analysis section.")
@function\_tool(name\_override="run\_all\_specialists\_parallel", description\_override="Run all three specialist analyses (fundamental, macro, quant) in parallel and return their results as a dict.")
async def run\_all\_specialists\_tool(fundamental\_input, macro\_input, quant\_input):
return await run\_all\_specialists\_parallel(
fundamental, macro, quant,
fundamental\_input, macro\_input, quant\_input
)
return Agent(
name="Head Portfolio Manager Agent",
instructions=(load\_prompt("pm\_base.md") + DISCLAIMER),
model="gpt-4.1",
tools=[fundamental\_tool, macro\_tool, quant\_tool, memo\_edit\_tool, run\_all\_specialists\_tool],
model\_settings=ModelSettings(parallel\_tool\_calls=True, tool\_choice="auto", temperature=0)
)
```
### The Head PM System Prompt: Enforcing Best Practices
The PM agent's system prompt (see `prompts/pm\_base.md`) is the heart of the workflow. It encodes:
- The firm's philosophy (originality, risk awareness, challenging consensus)
- Clear tool usage rules (when to use parallel tools, how to structure inputs)
- A robust, multi-step workflow (determine task type, provide guidance, review outputs, assemble memo, handle missing data)
This prompt ensures that every run is:
- \*\*Consistent:\*\* The same high standards and process are followed every time.
- \*\*Auditable:\*\* Each step, tool call, and decision is visible in the trace.
- \*\*High-Quality:\*\* Outputs are original, risk-aware, and rigorously reviewed.
```python
# Render the actual system prompt used by the Head Portfolio Manager agent
from pathlib import Path
from IPython.display import Markdown, display
pm\_prompt\_path = Path("prompts/pm\_base.md")
if pm\_prompt\_path.exists():
with pm\_prompt\_path.open("r", encoding="utf-8") as f:
content = f.read()
display(Markdown(content))
else:
print("System prompt not found at prompts/pm\_base.md")`
```
## Example Output
Here’s an example of an investment report generated through the workflow. Your output will be written to the `outputs` folder in the directory.
Click to expand Investment Memo
# Investment Memo: Alphabet Inc. (GOOGL) – Impact of Planned Interest Rate Reduction (May 2025)
## Executive Summary
Alphabet Inc. (GOOGL) currently trades at $171.42 per share, with a market capitalization of $1.88 trillion and a P/E ratio of 16.91. The investment thesis is moderately constructive: while a planned interest rate reduction by the Federal Reserve is a mild tailwind, it is not the primary driver of GOOGL’s price action. The most original, differentiated insight—fully aligned with our firm’s vision—is that GOOGL’s direct sensitivity to interest rates is modest (max weekly correlation with 10Y yield is \~0.29), and the real risk/reward hinges on the sustainability of AI-driven growth, sector rotation, and regulatory headwinds. This thesis is supported by robust technicals, strong fundamentals, and overwhelmingly positive analyst sentiment, but is tempered by the risk that AI optimism fades or macro/regulatory shocks emerge. The consensus view is justified by evidence: GOOGL’s business remains resilient, but the variant view—where rate cuts fail to stimulate tech or sector rotation caps returns—should not be ignored. Key risks include regulatory action, macroeconomic uncertainty, and the potential for a shift in the AI narrative. In the best case, GOOGL could reach $200–$210 by year-end 2025; in the worst case, a retest of $160–$170 is plausible. This memo embodies the firm’s vision by focusing on scenario planning, original quantitative analysis, and a critical assessment of consensus and variant views.
## Fundamentals Perspective
Alphabet’s core business is driven by its dominance in digital advertising (Google Search, YouTube) and its growing cloud and AI segments. As of the latest quarter (Q1 2025), revenue was $90.2 billion, net income $34.5 billion, and EPS $2.81, with net margin at 38.3%. Margins have improved over the past year, and the company’s scale and leadership in AI and cloud provide a durable moat. However, recent analyst price targets have been revised downward (Bernstein: $165, UBS: $209, Wolfe: $210), reflecting caution around regulatory and macroeconomic risks. The consensus view is justified: while Alphabet’s financial strength and innovation are clear, regulatory scrutiny and macro headwinds (e.g., reduced ad budgets in downturns) are real risks. The most original insight is the company’s ability to adapt and innovate, potentially mitigating some risks. The analysis is evidence-based, with recent quarterly data showing stable or improving margins:
|Date|Revenue|Net Income|Gross Profit|Total Expenses|EPS|Net Margin (%)|Gross Margin (%)|Operating Margin (%)|
|2025-03-31|9.0234e+10|3.454e+10|5.3873e+10|5.9628e+10|2.81|38.28|59.70|33.92|
|2024-12-31|9.6469e+10|2.6536e+10|5.5856e+10|6.5497e+10|2.15|27.51|57.90|32.11|
|2024-09-30|8.8268e+10|2.6301e+10|5.1794e+10|5.9747e+10|2.12|29.80|58.68|32.31|
|2024-06-30|8.4742e+10|2.3619e+10|4.9235e+10|5.7317e+10|1.89|27.87|58.10|32.36|
|2024-03-31|8.0539e+10|2.3662e+10|4.6827e+10|5.5067e+10|1.89|29.38|58.14|31.63|
Recent analyst sentiment is overwhelmingly positive, with 56 Buy, 12 Hold, and 0 Sell recommendations currently:
|period|Buy|Hold|Sell|
|Current|56|12|0|
|1 Month Ago|55|12|0|
|2 Months Ago|55|12|0|
|3 Months Ago|53|12|0|
The fundamental view is aligned with the firm vision by focusing on evidence, scenario planning, and not simply following consensus. The main divergence from the firm vision would be if the analysis failed to consider the impact of regulatory or macro shocks, but this is addressed here.
## Macro Perspective
The macroeconomic environment is mixed. U.S. real GDP is expanding ($23.5 trillion, Q1 2025), unemployment is low (4.2%), and inflation remains elevated (CPI: 320.3). The Federal Reserve has kept rates at 4.25–4.50%, with a patient stance and a focus on evolving risks. The U.S. dollar is strong (DXY: 123.4), and recent tariffs have introduced uncertainty. Investors are rotating from U.S. tech to Asian equities, reflecting concerns about high valuations and better growth prospects abroad. The consensus macro view is that rate cuts will support tech valuations, but the variant view—supported by our firm’s vision—is that sector rotation and trade policy could offset these benefits. Tail-risk scenarios include a base case where rate cuts support GOOGL ($180–$190 target), and a downside where trade tensions or sector rotation cap returns. The analysis is evidence-based, using FRED data and recent policy statements, and explicitly considers both best- and worst-case scenarios. The macro view is fully aligned with the firm vision by challenging consensus and planning for multiple outcomes.
## Quantitative Perspective
Quantitative analysis confirms that GOOGL’s direct sensitivity to interest rates is modest. The mean weekly correlation with the 10Y Treasury yield is 0.29, and with the Fed Funds rate is 0.05, indicating that rate changes are not the primary driver of GOOGL’s returns. Technicals are robust: GOOGL is above key moving averages, momentum is positive, and volatility is moderate. Scenario analysis shows that a rate cut is a mild tailwind, but if the move is already priced in or if technicals break down, a 5–10% pullback is possible. Analyst sentiment is strongly positive, and fundamentals (revenue, margins) are improving. Quantitative summary statistics:
|Metric|Value|
|Mean daily corr (FEDFUNDS, GOOGL)|0.05|
|Mean daily reg slope (FEDFUNDS, GOOGL)|0.02|
|Mean daily corr (DGS10, GOOGL)|0.13|
|Mean daily reg slope (DGS10, GOOGL)|0.05|
|Mean weekly corr (FEDFUNDS, GOOGL)|0.05|
|Mean weekly reg slope (FEDFUNDS, GOOGL)|0.03|
|Mean weekly corr (DGS10, GOOGL)|0.29|
|Mean weekly reg slope (DGS10, GOOGL)|0.09|
Key charts and images:
The quantitative view is original in its focus on scenario analysis and the modest rate sensitivity, and is aligned with the firm vision by not simply following consensus. Limitations include the short post-pandemic data window and the fact that GOOGL’s price is driven by multiple factors (AI, ad market, regulation) beyond rates.
## Portfolio Manager Perspective
The PM synthesis is that all three specialist sections converge on a moderately constructive outlook, with a realistic year-end 2025 price target of $190–$210. The most original insight is that GOOGL’s direct rate sensitivity is modest, and the real risk is whether AI-driven growth can continue or if sector rotation and regulatory headwinds will cap returns. The quant section is strong in highlighting robust technicals and sentiment, but also the risk of a $160–$170 retest in downside scenarios. The fundamental and macro sections emphasize the importance of monitoring regulatory and trade policy. If underweight large-cap tech, now is a reasonable entry point, but position sizing should reflect the risk of sector rotation or macro disappointment. The variant view—rate cuts failing to stimulate tech or a shift in AI narrative—should not be ignored. Position sizing and risk management are key, fully in line with the firm’s vision of scenario planning and differentiated insight.
## Recommendation & Answer to the Question
The recommendation is to maintain or modestly increase exposure to GOOGL, especially if underweight large-cap tech, with a year-end 2025 price target of $200–$210 in the base case. This embodies the firm vision by focusing on original, evidence-based scenario analysis, not simply following consensus. The recommendation is justified by robust fundamentals, positive technicals, and strong analyst sentiment, but is tempered by the risk of sector rotation, regulatory action, or a shift in the AI narrative. If these risks materialize, a retest of $160–$170 is possible. Sizing and risk management should reflect these scenarios. This approach is differentiated, evidence-driven, and fully aligned with the firm’s vision.
**END\_OF\_MEMO**
*DISCLAIMER: I am an AI language model, not a registered investment adviser. Information provided is educational and general in nature. Consult a qualified financial professional before making any investment decisions.*
## Best Practices When Building Agents
The most effective agentic systems combine modular agent design, clear tool definitions, parallel execution, and structured prompts. This approach—central to the OpenAI Agents SDK—makes your workflows robust, scalable, and easy to debug or extend.
**Key features of the OpenAI Agents SDK that enable these best practices:**
* **Agent loop:** Handles tool calls, LLM reasoning, and workflow control automatically.
* **Python-first orchestration:** Use familiar Python patterns to chain, compose, and orchestrate agents.
* **Handoffs:** Delegate tasks between agents for specialization and modularity.
* **Guardrails:** Validate inputs/outputs and break early on errors for reliability.
* **Function tools:** Register any Python function as a tool, with automatic schema and validation.
* **Tracing:** Visualize, debug, and monitor every step of your workflow for full transparency.
A combination of well-designed tools, thoughtful orchestration, and careful model selection is crucial for building effective agent systems. In this example, we use the GPT-4.1 family of models for their strong analytical and tool-use capabilities ([see the GPT-4.1 Prompting Guide](https://cookbook.openai.com/examples/gpt4-1_prompting_guide)). For deeper architectural best practices, see the included [A Practical Guide to Building Agents (PDF)](https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf). By bringing these elements together, you get a system that is robust, scalable, and easy to debug or extend.
Please try out the sample with your own investment questions, and please share any feedback! Happy building.
## Further Reading & Best Practices
* [OpenAI Agents SDK Documentation](https://openai.github.io/openai-agents-python/)
* [OpenAI Agents SDK: Multi-Agent Orchestration](https://openai.github.io/openai-agents-python/multi_agent/)
* [OpenAI Agents SDK: Tool List](https://openai.github.io/openai-agents-python/tools/)
* [OpenAI Agents SDK: MCP Documentation](https://openai.github.io/openai-agents-python/mcp/)
* [MCP Spec](https://spec.modelcontextprotocol.io/specification/2024-11-05/architecture/)
* [OpenAI Cookbook](https://github.com/openai/openai-cookbook)
* ([GPT-4.1 Prompting Guide](https://cookbook.openai.com/examples/gpt4-1_prompting_guide))
* [A Practical Guide to Building Agents (PDF)](https://cdn.openai.com/business-guides-and-resources/a-practical-guide-to-building-agents.pdf)