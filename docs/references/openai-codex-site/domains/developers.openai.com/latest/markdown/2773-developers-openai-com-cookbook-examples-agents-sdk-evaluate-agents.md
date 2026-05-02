Evaluating Agents with Langfuse
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
Mar 31, 2025
# Evaluating Agents with Langfuse
[ JM ](https://www.linkedin.com/in/maierhoefer/)
[ Jannik Maierhöfer ](https://www.linkedin.com/in/maierhoefer/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/agents_sdk/evaluate_agents.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/agents_sdk/evaluate_agents.ipynb)
In this cookbook, we will learn how to **monitor the internal steps (traces) of the [OpenAI agent SDK](https://github.com/openai/openai-agents-python)** and **evaluate its performance** using [Langfuse](https://langfuse.com/docs).
This guide covers **online** and **offline evaluation** metrics used by teams to bring agents to production fast and reliably. To learn more about evaluation strategies, check out this [blog post](https://langfuse.com/blog/2025-03-04-llm-evaluation-101-best-practices-and-challenges).
**Why AI agent Evaluation is important:**
* Debugging issues when tasks fail or produce suboptimal results
* Monitoring costs and performance in real-time
* Improving reliability and safety through continuous feedback
## Step 0: Install the Required Libraries
Below we install the `openai-agents` library (the [OpenAI Agents SDK](https://github.com/openai/openai-agents-python)), the `pydantic-ai[logfire]` OpenTelemetry instrumentation, `langfuse` and the Hugging Face `datasets` library
```
`%pip install openai-agents nest\_asyncio "pydantic-ai[logfire]" langfuse datasets`
```
## Step 1: Instrument Your Agent
In this notebook, we will use [Langfuse](https://langfuse.com/) to trace, debug and evaluate our agent.
**Note:** If you are using LlamaIndex or LangGraph, you can find documentation on instrumenting them [here](https://langfuse.com/docs/integrations/llama-index/workflows) and [here](https://langfuse.com/docs/integrations/langchain/example-python-langgraph).
```
`import os
import base64
# Get keys for your project from the project settings page: https://cloud.langfuse.com
os.environ["LANGFUSE\_PUBLIC\_KEY"] = "pk-lf-..."
os.environ["LANGFUSE\_SECRET\_KEY"] = "sk-lf-..."
os.environ["LANGFUSE\_HOST"] = "https://cloud.langfuse.com" # 🇪🇺 EU region
# os.environ["LANGFUSE\_HOST"] = "https://us.cloud.langfuse.com" # 🇺🇸 US region
# Build Basic Auth header.
LANGFUSE\_AUTH = base64.b64encode(
f"{os.environ.get('LANGFUSE\_PUBLIC\_KEY')}:{os.environ.get('LANGFUSE\_SECRET\_KEY')}".encode()
).decode()
# Configure OpenTelemetry endpoint & headers
os.environ["OTEL\_EXPORTER\_OTLP\_ENDPOINT"] = os.environ.get("LANGFUSE\_HOST") + "/api/public/otel"
os.environ["OTEL\_EXPORTER\_OTLP\_HEADERS"] = f"Authorization=Basic {LANGFUSE\_AUTH}"
# Your openai key
os.environ["OPENAI\_API\_KEY"] = "sk-proj-..."`
```
With the environment variables set, we can now initialize the Langfuse client. `get\_client()` initializes the Langfuse client using the credentials provided in the environment variables.
```
`from langfuse import get\_client
langfuse = get\_client()
# Verify connection
if langfuse.auth\_check():
print("Langfuse client is authenticated and ready!")
else:
print("Authentication failed. Please check your credentials and host.")`
```
Pydantic Logfire offers an instrumentation for the OpenAi Agent SDK. We use this to send traces to the [Langfuse OpenTelemetry Backend](https://langfuse.com/docs/opentelemetry/get-started).
```
`import nest\_asyncio
nest\_asyncio.apply()`
```
```
`import logfire
# Configure logfire instrumentation.
logfire.configure(
service\_name='my\_agent\_service',
send\_to\_logfire=False,
)
# This method automatically patches the OpenAI Agents SDK to send logs via OTLP to Langfuse.
logfire.instrument\_openai\_agents()`
```
## Step 2: Test Your Instrumentation
Here is a simple Q&A agent. We run it to confirm that the instrumentation is working correctly. If everything is set up correctly, you will see logs/spans in your observability dashboard.
```
`import asyncio
from agents import Agent, Runner
async def main():
agent = Agent(
name="Assistant",
instructions="You are a senior software engineer",
)
result = await Runner.run(agent, "Tell me why it is important to evaluate AI agents.")
print(result.final\_output)
loop = asyncio.get\_running\_loop()
await loop.create\_task(main())
langfuse.flush()`
```
```
`13:00:52.784 OpenAI Agents trace: Agent workflow
13:00:52.787 Agent run: 'Assistant'
13:00:52.797 Responses API with 'gpt-4o'
Evaluating AI agents is crucial for several reasons:
1. \*\*Performance Assessment\*\*: It helps determine if the agent meets the desired goals and performs tasks effectively. By evaluating, we can assess accuracy, speed, and overall performance.
2. \*\*Reliability and Consistency\*\*: Regular evaluation ensures that the AI behaves consistently under different conditions and is reliable in production environments.
3. \*\*Bias and Fairness\*\*: Identifying and mitigating biases is essential for fair and ethical AI. Evaluation helps uncover any discriminatory patterns in the agent's behavior.
4. \*\*Safety\*\*: Evaluating AI agents ensures they operate safely and do not cause harm or unintended side effects, especially in critical applications.
5. \*\*User Trust\*\*: Proper evaluation builds trust with users and stakeholders by demonstrating that the AI is effective and aligned with expectations.
6. \*\*Regulatory Compliance\*\*: It ensures adherence to legal and ethical standards, which is increasingly important as regulations around AI evolve.
7. \*\*Continuous Improvement\*\*: Ongoing evaluation provides insights that can be used to improve the agent over time, optimizing performance and adapting to new challenges.
8. \*\*Resource Efficiency\*\*: Evaluating helps ensure that the AI agent uses resources effectively, which can reduce costs and improve scalability.
In summary, evaluation is essential to ensure AI agents are effective, ethical, and aligned with user needs and societal norms.`
```
Check your [Langfuse Traces Dashboard](https://cloud.langfuse.com/traces) to confirm that the spans and logs have been recorded.
Example trace in Langfuse:
*[Link to the trace](https://cloud.langfuse.com/project/cloramnkj0002jz088vzn1ja4/traces/0195948781a9f0d78fd5e067154aa508?timestamp=2025-03-14T12:01:03.401Z&#x26;observation=64bcac3cb82d04e9)*
## Step 3: Observe and Evaluate a More Complex Agent
Now that you have confirmed your instrumentation works, let’s try a more complex query so we can see how advanced metrics (token usage, latency, costs, etc.) are tracked.
```
`import asyncio
from agents import Agent, Runner, function\_tool
# Example function tool.
@function\_tool
def get\_weather(city: str) -\> str:
return f"The weather in {city} is sunny."
agent = Agent(
name="Hello world",
instructions="You are a helpful agent.",
tools=[get\_weather],
)
async def main():
result = await Runner.run(agent, input="What's the weather in Berlin?")
print(result.final\_output)
loop = asyncio.get\_running\_loop()
await loop.create\_task(main())`
```
```
`13:01:15.351 OpenAI Agents trace: Agent workflow
13:01:15.355 Agent run: 'Hello world'
13:01:15.364 Responses API with 'gpt-4o'
13:01:15.999 Function: get\_weather
13:01:16.000 Responses API with 'gpt-4o'
The weather in Berlin is currently sunny.`
```
### Trace Structure
Langfuse records a **trace** that contains **spans**, which represent each step of your agent’s logic. Here, the trace contains the overall agent run and sub-spans for:
* The tool call (get\_weather)
* The LLM calls (Responses API with ‘gpt-4o’)
You can inspect these to see precisely where time is spent, how many tokens are used, and so on:
*[Link to the trace](https://cloud.langfuse.com/project/cloramnkj0002jz088vzn1ja4/traces/019594b5b9a27c5d497b13be71e7f255?timestamp=2025-03-14T12:51:32.386Z&#x26;display=preview&#x26;observation=6374a3c96baf831d)*
## Online Evaluation
Online Evaluation refers to evaluating the agent in a live, real-world environment, i.e. during actual usage in production. This involves monitoring the agent’s performance on real user interactions and analyzing outcomes continuously.
We have written down a guide on different evaluation techniques [here](https://langfuse.com/blog/2025-03-04-llm-evaluation-101-best-practices-and-challenges).
### Common Metrics to Track in Production
1. **Costs** — The instrumentation captures token usage, which you can transform into approximate costs by assigning a price per token.
2. **Latency** — Observe the time it takes to complete each step, or the entire run.
3. **User Feedback** — Users can provide direct feedback (thumbs up/down) to help refine or correct the agent.
4. **LLM-as-a-Judge** — Use a separate LLM to evaluate your agent’s output in near real-time (e.g., checking for toxicity or correctness).
Below, we show examples of these metrics.
#### 1. Costs
Below is a screenshot showing usage for `gpt-4o` calls. This is useful to see costly steps and optimize your agent.
*[Link to the trace](https://cloud.langfuse.com/project/cloramnkj0002jz088vzn1ja4/traces/019594b5b9a27c5d497b13be71e7f255?timestamp=2025-03-14T12:51:32.386Z&#x26;display=preview&#x26;observation=6374a3c96baf831d)*
#### 2. Latency
We can also see how long it took to complete each step. In the example below, the entire run took 7 seconds, which you can break down by step. This helps you identify bottlenecks and optimize your agent.
*[Link to the trace](https://cloud.langfuse.com/project/cloramnkj0002jz088vzn1ja4/traces/019594b5b9a27c5d497b13be71e7f255?timestamp=2025-03-14T12:51:32.386Z&#x26;display=timeline&#x26;observation=b12967a01b3f8bcb)*
#### 3. Additional Attributes
Langfuse allows you to pass additional attributes to your spans. These can include `user\_id`, `tags`, `session\_id`, and custom `metadata`. Enriching traces with these details is important for analysis, debugging, and monitoring of your application’s behavior across different users or sessions.
In this example, we pass a [user\_id](https://langfuse.com/docs/tracing-features/users), [session\_id](https://langfuse.com/docs/tracing-features/sessions) and [trace\_tags](https://langfuse.com/docs/tracing-features/tags) to Langfuse.
```
`input\_query = "Why is AI agent evaluation important?"
with langfuse.start\_as\_current\_span(
name="OpenAI-Agent-Trace",
) as span:
# Run your application here
async def main(input\_query):
agent = Agent(
name = "Assistant",
instructions = "You are a helpful assistant.",
)
result = await Runner.run(agent, input\_query)
print(result.final\_output)
return result
result = await main(input\_query)
# Pass additional attributes to the span
span.update\_trace(
input=input\_query,
output=result,
user\_id="user\_123",
session\_id="my-agent-session",
tags=["staging", "demo", "OpenAI Agent SDK"],
metadata={"email": "user@langfuse.com"},
version="1.0.0"
)
# Flush events in short-lived applications
langfuse.flush()`
```
```
`13:02:41.552 OpenAI Agents trace: Agent workflow
13:02:41.553 Agent run: 'Assistant'
13:02:41.554 Responses API with 'gpt-4o'
AI agent evaluation is crucial for several reasons:
1. \*\*Performance Metrics\*\*: It helps determine how well an AI agent performs its tasks, ensuring it meets the desired standards and objectives.
2. \*\*Reliability and Safety\*\*: Evaluation ensures the agent behaves consistently and safely in different scenarios, reducing risks of unintended consequences.
3. \*\*Bias Detection\*\*: By evaluating AI agents, developers can identify and mitigate biases, ensuring fair and equitable outcomes for all users.
4. \*\*Benchmarking and Comparison\*\*: Evaluation allows for the comparison of different AI models or versions, facilitating improvements and advancements.
5. \*\*User Trust\*\*: Demonstrating the effectiveness and reliability of an AI agent builds trust with users, encouraging adoption and usage.
6. \*\*Regulatory Compliance\*\*: Proper evaluation helps ensure AI systems meet legal and regulatory requirements, which is especially important in sensitive domains like healthcare or finance.
7. \*\*Scalability and Deployment\*\*: Evaluation helps determine if an AI agent can scale effectively and function accurately in real-world environments.
Overall, AI agent evaluation is key to developing effective, trustworthy, and ethical AI systems.`
```
#### 4. User Feedback
If your agent is embedded into a user interface, you can record direct user feedback (like a thumbs-up/down in a chat UI). Below is an example using `IPython.display` for simple feedback mechanism.
In the code snippet below, when a user sends a chat message, we capture the OpenTelemetry trace ID. If the user likes/dislikes the last answer, we attach a score to the trace.
```
`from agents import Agent, Runner, WebSearchTool
from opentelemetry.trace import format\_trace\_id
import ipywidgets as widgets
from IPython.display import display
from langfuse import get\_client
langfuse = get\_client()
# Define your agent with the web search tool
agent = Agent(
name="WebSearchAgent",
instructions="You are an agent that can search the web.",
tools=[WebSearchTool()]
)
def on\_feedback(button):
if button.icon == "thumbs-up":
langfuse.create\_score(
value=1,
name="user-feedback",
comment="The user gave this response a thumbs up",
trace\_id=trace\_id
)
elif button.icon == "thumbs-down":
langfuse.create\_score(
value=0,
name="user-feedback",
comment="The user gave this response a thumbs down",
trace\_id=trace\_id
)
print("Scored the trace in Langfuse")
user\_input = input("Enter your question: ")
# Run agent
with langfuse.start\_as\_current\_span(
name="OpenAI-Agent-Trace",
) as span:
# Run your application here
result = Runner.run\_sync(agent, user\_input)
print(result.final\_output)
result = await main(user\_input)
trace\_id = langfuse.get\_current\_trace\_id()
span.update\_trace(
input=user\_input,
output=result.final\_output,
)
# Get feedback
print("How did you like the agent response?")
thumbs\_up = widgets.Button(description="👍", icon="thumbs-up")
thumbs\_down = widgets.Button(description="👎", icon="thumbs-down")
thumbs\_up.on\_click(on\_feedback)
thumbs\_down.on\_click(on\_feedback)
display(widgets.HBox([thumbs\_up, thumbs\_down]))
# Flush events in short-lived applications
langfuse.flush()`
```
```
`Enter your question: What is Langfuse?
13:54:41.574 OpenAI Agents trace: Agent workflow
13:54:41.575 Agent run: 'WebSearchAgent'
13:54:41.577 Responses API with 'gpt-4o'
Langfuse is an open-source engineering platform designed to enhance the development, monitoring, and optimization of Large Language Model (LLM) applications. It offers a suite of tools that provide observability, prompt management, evaluations, and metrics, facilitating the debugging and improvement of LLM-based solutions. ([toolkitly.com](https://www.toolkitly.com/langfuse?utm\_source=openai))
\*\*Key Features of Langfuse:\*\*
- \*\*LLM Observability:\*\* Langfuse enables developers to monitor and analyze the performance of language models by tracking API calls, user inputs, prompts, and outputs. This observability aids in understanding model behavior and identifying areas for improvement. ([toolkitly.com](https://www.toolkitly.com/langfuse?utm\_source=openai))
- \*\*Prompt Management:\*\* The platform provides tools for managing, versioning, and deploying prompts directly within Langfuse. This feature allows for efficient organization and refinement of prompts to optimize model responses. ([toolkitly.com](https://www.toolkitly.com/langfuse?utm\_source=openai))
- \*\*Evaluations and Metrics:\*\* Langfuse offers capabilities to collect and calculate scores for LLM completions, run model-based evaluations, and gather user feedback. It also tracks key metrics such as cost, latency, and quality, providing insights through dashboards and data exports. ([toolkitly.com](https://www.toolkitly.com/langfuse?utm\_source=openai))
- \*\*Playground Environment:\*\* The platform includes a playground where users can interactively experiment with different models and prompts, facilitating prompt engineering and testing. ([toolkitly.com](https://www.toolkitly.com/langfuse?utm\_source=openai))
- \*\*Integration Capabilities:\*\* Langfuse integrates seamlessly with various tools and frameworks, including LlamaIndex, LangChain, OpenAI SDK, LiteLLM, and more, enhancing its functionality and allowing for the development of complex applications. ([toolerific.ai](https://toolerific.ai/ai-tools/opensource/langfuse-langfuse?utm\_source=openai))
- \*\*Open Source and Self-Hosting:\*\* Being open-source, Langfuse allows developers to customize and extend the platform according to their specific needs. It can be self-hosted, providing full control over infrastructure and data. ([vafion.com](https://www.vafion.com/blog/unlocking-power-language-models-langfuse/?utm\_source=openai))
Langfuse is particularly valuable for developers and researchers working with LLMs, offering a comprehensive set of tools to improve the performance and reliability of LLM applications. Its flexibility, integration capabilities, and open-source nature make it a robust choice for those seeking to enhance their LLM projects.
How did you like the agent response?`
```
```
`HBox(children=(Button(description='👍', icon='thumbs-up', style=ButtonStyle()), Button(description='👎', icon='t…`
```
```
`Scored the trace in Langfuse`
```
User feedback is then captured in Langfuse:
#### 5. LLM-as-a-Judge
LLM-as-a-Judge is another way to automatically evaluate your agent’s output. You can set up a separate LLM call to gauge the output’s correctness, toxicity, style, or any other criteria you care about.
**Workflow**:
1. You define an **Evaluation Template**, e.g., “Check if the text is toxic.”
2. You set a model that is used as judge-model; in this case `gpt-4o-mini`.
3. Each time your agent generates output, you pass that output to your “judge” LLM with the template.
4. The judge LLM responds with a rating or label that you log to your observability tool.
Example from Langfuse:
```
`# Example: Checking if the agent’s output is toxic or not.
from agents import Agent, Runner, WebSearchTool
# Define your agent with the web search tool
agent = Agent(
name="WebSearchAgent",
instructions="You are an agent that can search the web.",
tools=[WebSearchTool()]
)
input\_query = "Is eating carrots good for the eyes?"
# Run agent
with langfuse.start\_as\_current\_span(name="OpenAI-Agent-Trace") as span:
# Run your agent with a query
result = Runner.run\_sync(agent, input\_query)
# Add input and output values to parent trace
span.update\_trace(
input=input\_query,
output=result.final\_output,
)`
```
```
`14:05:34.735 OpenAI Agents trace: Agent workflow
14:05:34.736 Agent run: 'WebSearchAgent'
14:05:34.738 Responses API with 'gpt-4o'`
```
You can see that the answer of this example is judged as “not toxic”.
#### 6. Observability Metrics Overview
All of these metrics can be visualized together in dashboards. This enables you to quickly see how your agent performs across many sessions and helps you to track quality metrics over time.
## Offline Evaluation
Online evaluation is essential for live feedback, but you also need **offline evaluation**—systematic checks before or during development. This helps maintain quality and reliability before rolling changes into production.
### Dataset Evaluation
In offline evaluation, you typically:
1. Have a benchmark dataset (with prompt and expected output pairs)
2. Run your agent on that dataset
3. Compare outputs to the expected results or use an additional scoring mechanism
Below, we demonstrate this approach with the [search-dataset](https://huggingface.co/datasets/junzhang1207/search-dataset), which contains questions that can be answered via the web search tool and expected answers.
```
`import pandas as pd
from datasets import load\_dataset
# Fetch search-dataset from Hugging Face
dataset = load\_dataset("junzhang1207/search-dataset", split = "train")
df = pd.DataFrame(dataset)
print("First few rows of search-dataset:")
print(df.head())`
```
```
`README.md: 0%| | 0.00/2.12k [00:00\<?, ?B/s]`
```
```
`data-samples.json: 0%| | 0.00/2.48k [00:00\<?, ?B/s]`
```
```
`data.jsonl: 0%| | 0.00/316k [00:00\<?, ?B/s]`
```
```
`Generating train split: 0%| | 0/934 [00:00\<?, ? examples/s]`
```
```
`First few rows of GSM8K dataset:
id \\
0 20caf138-0c81-4ef9-be60-fe919e0d68d4
1 1f37d9fd-1bcc-4f79-b004-bc0e1e944033
2 76173a7f-d645-4e3e-8e0d-cca139e00ebe
3 5f5ef4ca-91fe-4610-a8a9-e15b12e3c803
4 64dbed0d-d91b-4acd-9a9c-0a7aa83115ec
question \\
0 steve jobs statue location budapst
1 Why is the Battle of Stalingrad considered a t...
2 In what year did 'The Birth of a Nation' surpa...
3 How many Russian soldiers surrendered to AFU i...
4 What event led to the creation of Google Images?
expected\_answer category area
0 The Steve Jobs statue is located in Budapest, ... Arts Knowledge
1 The Battle of Stalingrad is considered a turni... General News News
2 This question is based on a false premise. 'Th... Entertainment News
3 About 300 Russian soldiers surrendered to the ... General News News
4 Jennifer Lopez's appearance in a green Versace... Technology News`
```
Next, we create a dataset entity in Langfuse to track the runs. Then, we add each item from the dataset to the system.
```
`from langfuse import get\_client
langfuse = get\_client()
langfuse\_dataset\_name = "search-dataset\_huggingface\_openai-agent"
# Create a dataset in Langfuse
langfuse.create\_dataset(
name=langfuse\_dataset\_name,
description="search-dataset uploaded from Huggingface",
metadata={
"date": "2025-03-14",
"type": "benchmark"
}
)`
```
```
`Dataset(id='cm88w66t102qpad07xhgeyaej', name='search-dataset\_huggingface\_openai-agent', description='search-dataset uploaded from Huggingface', metadata={'date': '2025-03-14', 'type': 'benchmark'}, project\_id='cloramnkj0002jz088vzn1ja4', created\_at=datetime.datetime(2025, 3, 14, 14, 47, 14, 676000, tzinfo=datetime.timezone.utc), updated\_at=datetime.datetime(2025, 3, 14, 14, 47, 14, 676000, tzinfo=datetime.timezone.utc))`
```
```
`for idx, row in df.iterrows():
langfuse.create\_dataset\_item(
dataset\_name=langfuse\_dataset\_name,
input={"text": row["question"]},
expected\_output={"text": row["expected\_answer"]}
)
if idx \>= 49: # For this example, we upload only the first 50 items
break`
```
#### Running the Agent on the Dataset
We define a helper function `run\_openai\_agent()` that:
1. Starts a Langfuse span
2. Runs our agent on the prompt
3. Records the trace ID in Langfuse
Then, we loop over each dataset item, run the agent, and link the trace to the dataset item. We can also attach a quick evaluation score if desired.
```
`from agents import Agent, Runner, WebSearchTool
from langfuse import get\_client
langfuse = get\_client()
dataset\_name = "search-dataset\_huggingface\_openai-agent"
current\_run\_name = "qna\_model\_v3\_run\_05\_20" # Identifies this specific evaluation run
agent = Agent(
name="WebSearchAgent",
instructions="You are an agent that can search the web.",
tools=[WebSearchTool(search\_context\_size= "high")]
)
# Assume 'run\_openai\_agent' is your instrumented application function
def run\_openai\_agent(question):
with langfuse.start\_as\_current\_generation(name="qna-llm-call") as generation:
# Simulate LLM call
result = Runner.run\_sync(agent, question)
# Update the trace with the input and output
generation.update\_trace(
input= question,
output=result.final\_output,
)
return result.final\_output
dataset = langfuse.get\_dataset(name=dataset\_name) # Fetch your pre-populated dataset
for item in dataset.items:
# Use the item.run() context manager
with item.run(
run\_name=current\_run\_name,
run\_metadata={"model\_provider": "OpenAI", "temperature\_setting": 0.7},
run\_description="Evaluation run for Q&A model v3 on May 20th"
) as root\_span: # root\_span is the root span of the new trace for this item and run.
# All subsequent langfuse operations within this block are part of this trace.
# Call your application logic
generated\_answer = run\_openai\_agent(question=item.input["text"])
print(item.input)`
```
You can repeat this process with different:
* Search tools (e.g. different context sized for OpenAI’s `WebSearchTool`)
* Models (gpt-4o-mini, o1, etc.)
* Tools (search vs. no search)
Then compare them side-by-side in Langfuse. In this example, I did run the agent 3 times on the 50 dataset questions. For each run, I used a different setting for the context size of OpenAI’s `WebSearchTool`. You can see that an increased context size also slightly increased the answer correctness from `0.89` to `0.92`. The `correct\_answer` score is created by an [LLM-as-a-Judge Evaluator](https://langfuse.com/docs/scores/model-based-evals) that is set up to judge the correctness of the question based on the sample answer given in the dataset.