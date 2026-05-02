Build Your Own Code Interpreter - Dynamic Tool Generation and Execution With o3-mini
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
Feb 3, 2025
# Build Your Own Code Interpreter - Dynamic Tool Generation and Execution With o3-mini
[ MS ](https://github.com/msingh-openai)
[ Mandeep Singh
(OpenAI)
](https://github.com/msingh-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/object_oriented_agentic_approach/Secure_code_interpreter_tool_for_LLM_agents.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/object_oriented_agentic_approach/Secure_code_interpreter_tool_for_LLM_agents.ipynb)
## Build Your Own Code Interpreter - Dynamic Tool Generation and Execution With o3-mini
At the core of providing a LLM Agent capability to interact with the outside world or other Agents is “tool (or function) calling,” where a LLM can invoke a function (a block of code) with arguments. Typically, these functions are predefined by the developer, along with their expected inputs and outputs. However, in this Cookbook, we explore a more flexible paradigm - to **dynamically generate tools** using LLM models (in this case **o3-mini**), with ability to execute the tool using a code interpreter.
### Dynamically Generated Tool Calling with Code Interpreter
A Dynamically Generated Tool is a function or code block created by the LLM itself at runtime based on the user’s prompt. This means you don’t have to predefine every possible scenario in your codebase—enabling far more open-ended, creative, and adaptive problem-solving.
Dynamically Generated Tool Calling goes a step further by granting the LLM the ability to generate tools and execute code blocks on the fly. This dynamic approach is particularly useful for tasks that involve:
* Data analysis and visualization
* Data manipulation and transformation
* Machine learning workflow generation and execution
* Process automation and scripting
* And much more, as new possibilities emerge through experimentation
### Using o3-mini for Dynamic Tool generation
Released on 31-Jan-25, o3-mini model has exceptional STEM capabilities—with particular strength in science, math, and coding—all while maintaining the low cost and reduced latency of smaller models. In this Cookbook, we will demonstrate o3-mini’s capabilities to generate python code to interpret data and draw insights.
Reasoning models are particularly good at generating dynamic tools to analyze data since they can reason on their own, without the need of an explicit chain-of-thought prompt. In fact, providing explicit chain of thought instructions may interfere with model’s internal reasoning and lead to suboptimal outcomes. You can learn more about o3-mini [here.](https://openai.com/index/openai-o3-mini/)
### Why build your own code interpreter
Many API providers—such as OpenAI’s Assistants API—offer built-in code interpreter functionality. These built-in code interpreters can be immensely powerful, but there are situations where developers may need to create their own custom code interpreter. For example:
1. **Language or library support**: The built-in interpreter may not support the specific programming language (e.g., C++, Java, etc.) or libraries required for your task.
2. **Task compatibility**: Your use case may not be compatible with the provider’s built-in solution.
3. **Model constraints**: You might require a language model that isn’t supported by the provider’s interpreter.
4. **Cost considerations**: The cost structure for code execution or model usage may not fit your budget or constraints.
5. **File size**: The file size of input data is too large or not supported by the provider’s interpreter.
6. **Integrating with internal systems**: The provider’s interpreter may not be able to integrate with your internal systems.
### What You’ll Learn
By following this Cookbook, you will learn how to:
* Set up an isolated Python code execution environment using Docker
* Configure your own code interpreter tool for LLM agents
* Establish a clear separation of “Agentic” concerns for security and safety
* Using **o3-mini** model to dynamically generate code for data analysis
* Orchestrate agents to efficiently accomplish a given task
* Design an agentic application that can dynamically generate and execute code
You’ll learn how to build a custom code interpreter tool from the ground up, leverage the power of LLMs to generate sophisticated code, and safely execute that code in an isolated environment—all in pursuit of making your AI-powered applications more flexible, powerful, and cost-effective.
### Example Scenario
We’ll use the sample data provided at [Key Factors Traffic Accidents](https://www.kaggle.com/datasets/willianoliveiragibin/key-factors-traffic-accidents) to answer a set of questions. These questions do not require to be pre-defined, we will give LLM the ability to generate code to answer such question.
Sample questions could be:
* What factors contribute the most to accident frequency? (Feature importance analysis)
* Which areas are at the highest risk of accidents? (Classification/Clustering)
* How does traffic fine amount influence the number of accidents? (Regression/Causal inference)
* Can we determine the optimal fine amounts to reduce accident rates? (Optimization models)
* Do higher fines correlate with lower average speeds or reduced accidents? (Correlation/Regression)
* and so on …
Using the traditional **Predefined Tool Calling** approach, developer would need to pre-define the function for each of these questions. This limits the LLM’s ability to answer any other questions not defined in the pre-defined set of functions. We overcome this limitation by using the **Dynamic Tool Calling** approach where the LLM generates code and uses a Code Interpretter tool to execute the code.
## Overview
Let’s dive into the steps to build this Agentic Applicaiton with Dynamically generated tool calling. There are three components to this application:
#### Step 1: Set up an isolated code execution container environment
We need a secure environment where our LLM generated function calls can be executed. We want to avoid directly running the LLM generated code on the host machine so will create a Docker container environment with restricted resource access (e.g., no network access). By default, Docker containers cannot access the host machine’s file system, which helps ensure that any code generated by the LLM remains contained.
##### ⚠️ A WORD OF CAUTION: Implement Strong Gaurdrails for the LLM generated code
LLMs could generate harmful code with unintended consequences. As a best practice, isolate the code execution environment with only required access to resources as needed by the task. Avoid running the LLM generated code on your host machine or laptop.
#### Step 2: Define and Test the Agents
“**What is an Agent?**” In the context of this Cookbook, an Agent is:
1. Set of instructions for the LLM to follow, i.e. the developer prompt
2. A LLM model, and ability to call the model via the API
3. Tool call access to a function, and ability to execute the function
We will define two agents:
1. FileAccessAgent: This agent will read the file and provide the context to the PythonCodeExecAgent.
2. PythonCodeExecAgent: This agent will generate the Python code to answer the user’s question and execute the code in the Docker container.
#### Step 3: Set up Agentic Orchestration to run the application
There are various ways to orchestrate the Agents based on the application requirements. In this example, we will use a simple orchestration where the user provides a task and the agents are called in sequence to accomplish the task.
The overall orchestration is shown below:
## Let’s get started
### Prerequisites
Before you begin, ensure you have the following installed and configured on your host machine:
1. Docker: installed and running on your local machine. You can learn more about Docker and [install it from here](https://www.docker.com/).
2. Python: installed on your local machine. You can learn more about Python and [install it from here](https://www.python.org/downloads/).
3. OpenAI API key: set up on your local machine as an environment variable or in the .env file in the root directory. You can learn more about OpenAI API key and [set it up from here](https://platform.openai.com/docs/api-reference/introduction).
### Step 1: Set up an Isolated Code Execution Environment
Lets define a Dockerized container environment that will be used to execute our code. I have defined the **[dockerfile](https://github.com/openai/openai-cookbook/blob/main/examples/object_oriented_agentic_approach/resources/docker/dockerfile)** under `resources/docker` directory that will be used to create the container environment with the following specifications:
* Python 3.10 as the base
* A non-root user
* Preinstall the packages in requirements.txt
The requirements.txt included in the docker image creation process contains all the potential packages our LLM generated code may need to accomplish its tasks. Given we will restrict the container from network access, so we need to pre-install the packages that are required for the task. Our LLM will not be allowed to install any additional packages for security purposes.
You could create your own docker image with the language requirements (such as Python 3.10) and pre-install the packages that are required for the task, or create a custom docker image with the specific language (such as Java, C++, etc.) and packages that are required for the task.
Let’s build the docker image with the following command. For the sake of brevity, I have redirected the output to grep the success message and print a message if the build fails.
```
`!docker build -t python\_sandbox:latest ./resources/docker 2\>&1 | grep -E "View build details|ERROR" || echo "Build failed."`
```
```
`View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/kl8fo02q7rgbindi9b42pn1zr`
```
Let’s run the container in restricted mode. The container will run in the background. This is our opportunity to define the security policies for the container. It is good practice to only allow the bare minimum features to the container that are required for the task. By default, the container cannot access the host file system from within the container. Let’s also restrict its access to network so it cannot access the Internet or any other network resources.
```
`# Run the container in restricted mode. The container will run in the background.
!docker run -d --name sandbox --network none --cap-drop all --pids-limit 64 --tmpfs /tmp:rw,size=64M python\_sandbox:latest sleep infinity`
```
```
`8446d1e9a7972f2e00a5d1799451c1979d34a2962aa6b4c35a9868af8d321b0e`
```
Let’s make sure container is running using the `docker ps` that should list our container.
```
`!docker ps`
```
```
`CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
8446d1e9a797 python\_sandbox:latest "sleep infinity" 2 seconds ago Up 2 seconds sandbox`
```
### Step 2: Define and Test the Agents
For our purposes, we will define two agents.
1. **Agent 1: File Access Agent (with Pre-defined Tool Calling)**
* Instructions to understand the contents of the file to provide as context to Agent 2.
* Has access to the host machine’s file system.
* Can read a file from the host and copy it into the Docker container.
* Cannot access the code interpreter tool.
* Uses gpt-4o model.
1. **Agent 2: Python Code Generator and Executor (with Dynamically Generated Tool Calling and Code Execution)**
* Recieve the file content’s context from Agent 1.
* Instructions to generate a Python script to answer the user’s question.
* Has access to the code interpreter within the Docker container, which is used to execute Python code.
* Has access only to the file system inside the Docker container (not the host).
* Cannot access the host machine’s file system or the network.
* Uses our newest **o3-mini** model that excels at code generation.
This separation concerns of the File Access (Agent 1) and the Code Generator and Executor (Agent 2) is crucial to prevent the LLM from directly accessing or modifying the host machine.
**Limit the Agent 1 to Static Tool Calling as it has access to the host file system.**
|Agent|Type of Tool Call|Access to Host File System|Access to Docker Container File System|Access to Code Interpreter|
|Agent 1: File Access|Pre-defined Tools|Yes|Yes|No|
|Agent 2: Python Code Generator and Executor|Dynamically Generated Tools|No|Yes|Yes|
To keep the Agents and Tools organized, we’ve defined a set of **core classes** that will be used to create the two agents for consistency using Object Oriented Programming principles.
* **BaseAgent**: We start with an abstract base class that enforces common method signatures such as `task()`. Base class also provides a logger for debugging, a language model interface and other common functions such as `add\_context()` to add context to the agent.
* **ChatMessages**: A class to store the conversation history given ChatCompletions API is stateless.
* **ToolManager**: A class to manage the tools that an agent can call.
* **ToolInterface**: An abstract class for any ‘tool’ that an agent can call so that the tools will have a consistent interface.
These classes are defined in the [object\_oriented\_agents/core\_classes](./resources/object_oriented_agents/core_classes) directory.
#### UML Class Diagram for Core Classes
The following class diagram shows the relationship between the core classes. This UML (Unified Modeling Language) has been generated using [Mermaid](https://mermaid)
**Define Agent 1: FileAccessAgent with FileAccessTool**
Let’s start with definin the FileAccessTool that inherits from the ToolInterface class. The **FileAccessTool** tool is defined in the [file\_access\_tool.py](https://github.com/openai/openai-cookbook/blob/main/examples/object_oriented_agentic_approach/resources/registry/tools/file_access_tool.py) file in the `resources/registry/tools` directory.
* FileAccessTool implements the ToolInterface class, which ensures that the tools will have a consistent interface.
* Binding the tool definition for the OpenAI Function Calling API in the `get\_definition` method and the tool’s `run` method ensures maintainability, scalability, and reusability.
Now, let’s define the **FileAccessAgent** that extends the BaseAgent class and bind the **FileAccessTool** to the agent. The FileAccessAgent is defined in the [file\_acess\_agent.py](https://github.com/openai/openai-cookbook/blob/main/examples/object_oriented_agentic_approach/resources/registry/agents/file_access_agent.py) file in `resources/registry/agents` directory. The FileAccessAgent is:
* A concrete implementation of the BaseAgent class.
* Initialized with the developer prompt, model name, logger, and language model interface. These values can be overridden by the developer if needed.
* Has a setup\_tools method that registers the FileAccessTool to the tool manager.
* Has a `task` method that calls the FileAccessTool to read the file and provide the context to the PythonCodeExecAgent.
* `model\_name='gpt-4o'` that provides sufficient reasoning and tool calling ability for the task.
**Define Agent 2: PythonExecAgent with PythonExecTool**
Similarly, PythonExecTool inherits from the ToolInterface class and implements the get\_definition and run methods. The get\_definition method returns the tool definition in the format expected by the OpenAI Function Calling API. The run method executes the Python code in a Docker container and returns the output. This tool is defined in the [python\_code\_interpreter\_tool.py](https://github.com/openai/openai-cookbook/blob/main/examples/object_oriented_agentic_approach/resources/registry/tools/python_code_interpreter_tool.py) file in the `resources/registry/tools` directory.
Likewise, PythonExecAgent is a concrete implementation of the BaseAgent class. It is defined in the [python\_code\_exec\_agent.py](https://github.com/openai/openai-cookbook/blob/main/examples/object_oriented_agentic_approach/resources/registry/agents/python_code_exec_agent.py) file in the `resources/registry/agents` directory. The PythonExecAgent is:
* A concrete implementation of the BaseAgent class.
* Initialized with the developer prompt, model name, logger, and language model interface. These values can be overridden by the developer if needed.
* Has a setup\_tools method that registers the PythonExecTool to the tool manager.
* Has a `task` method that calls the OpenAI API to perform the user’s task, which in this case involves generating a Python script to answer the user’s question and run it with Code Interpreter tool.
* `model\_name='o3-mini'` that excels at STEM tasks such as code generation.
* `reasoning\_effort='high'` that allows for more complete reasoning given the complexity of the task at the cost of more tokens generated and slower responses. The default value is medium, which is a balance between speed and reasoning accuracy.
You can learn more about the `reasoning\_effort` parameter [here](https://platform.openai.com/docs/guides/reasoning).
### Step 3: Set up Agentic Orchestration to run the application
With the Agents defined, now we can define the orchestration loop that will run the application. This loop will prompt the user for a question or task, and then call the FileAccessAgent to read the file and provide the context to the PythonExecAgent. The PythonExecAgent will generate the Python code to answer the user’s question and execute the code in the Docker container. The output from the code execution will be displayed to the user.
User can type ‘exit’ to stop the application. Our question: **What factors contribute the most to accident frequency?** Note that we did not pre-define the function to answer this question.
```
`# Import the agents from registry/agents
from resources.registry.agents.file\_access\_agent import FileAccessAgent
from resources.registry.agents.python\_code\_exec\_agent import PythonExecAgent
prompt = """Use the file traffic\_accidents.csv for your analysis. The column names are:
Variable Description
accidents Number of recorded accidents, as a positive integer.
traffic\_fine\_amount Traffic fine amount, expressed in thousands of USD.
traffic\_density Traffic density index, scale from 0 (low) to 10 (high).
traffic\_lights Proportion of traffic lights in the area (0 to 1).
pavement\_quality Pavement quality, scale from 0 (very poor) to 5 (excellent).
urban\_area Urban area (1) or rural area (0), as an integer.
average\_speed Average speed of vehicles in km/h.
rain\_intensity Rain intensity, scale from 0 (no rain) to 3 (heavy rain).
vehicle\_count Estimated number of vehicles, in thousands, as an integer.
time\_of\_day Time of day in 24-hour format (0 to 24).
accidents traffic\_fine\_amount
"""
print("Setup: ")
print(prompt)
print("Setting up the agents... ")
# Instantiate the agents with the default constructor defined values
# Developer may override the default values - prompt, model, logger, and language model interface if needed
# This agent use gpt-4o by default
file\_ingestion\_agent = FileAccessAgent()
# Let's make sure agent uses o3-mini model and set the reasoning\_effort to high
data\_analysis\_agent = PythonExecAgent(model\_name='o3-mini', reasoning\_effort='high')
print("Understanding the contents of the file...")
# Give a task to the file ingestion agent to read the file and provide the context to the data analysis agent
file\_ingestion\_agent\_output = file\_ingestion\_agent.task(prompt)
# Add the file content as context to the data analysis agent
# The context is added to the agent's tool manager so that the tool manager can use the context to generate the code
data\_analysis\_agent.add\_context(prompt)
data\_analysis\_agent.add\_context(file\_ingestion\_agent\_output)
while True:
print("Type your question related to the data in the file. Type 'exit' to exit.")
user\_input = input("Type your question.")
if user\_input == "exit":
print("Exiting the application.")
break
print(f"User question: {user\_input}")
print("Generating dynamic tools and using code interpreter...")
data\_analysis\_agent\_output = data\_analysis\_agent.task(user\_input)
print("Output...")
print(data\_analysis\_agent\_output)`
```
```
`Setup:
Use the file traffic\_accidents.csv for your analysis. The column names are:
Variable Description
accidents Number of recorded accidents, as a positive integer.
traffic\_fine\_amount Traffic fine amount, expressed in thousands of USD.
traffic\_density Traffic density index, scale from 0 (low) to 10 (high).
traffic\_lights Proportion of traffic lights in the area (0 to 1).
pavement\_quality Pavement quality, scale from 0 (very poor) to 5 (excellent).
urban\_area Urban area (1) or rural area (0), as an integer.
average\_speed Average speed of vehicles in km/h.
rain\_intensity Rain intensity, scale from 0 (no rain) to 3 (heavy rain).
vehicle\_count Estimated number of vehicles, in thousands, as an integer.
time\_of\_day Time of day in 24-hour format (0 to 24).
accidents traffic\_fine\_amount
Setting up the agents...
Understanding the contents of the file...`
```
```
`2025-02-03 13:03:54,066 - MyApp - INFO - Handling tool call: safe\_file\_access
2025-02-03 13:03:54,067 - MyApp - INFO - Tool arguments: {'filename': './resources/data/traffic\_accidents.csv'}
2025-02-03 13:03:54,562 - MyApp - INFO - Tool 'safe\_file\_access' response: Copied ./resources/data/traffic\_accidents.csv into sandbox:/home/sandboxuser/.
The file content for the first 15 rows is:
accidents traffic\_fine\_amount traffic\_density traffic\_lights pavement\_quality urban\_area average\_speed rain\_intensity vehicle\_count time\_of\_day
0 20 4.3709 2.3049 753.000 0.7700 1 321.592 1.1944 290.8570 160.4320
1 11 9.5564 3.2757 5.452 4.0540 1 478.623 6.2960 931.8120 8.9108
2 19 7.5879 2.0989 6.697 345.0000 0 364.476 2.8584 830.0860 5.5727
3 23 6.3879 4.9188 9.412 4.7290 0 20.920 2.1065 813.1590 131.4520
4 23 2.4042 1.9610 7.393 1.7111 1 37.378 1.7028 1.4663 6.9610
5 31 2.4040 6.7137 5.411 5.9050 1 404.621 1.8936 689.0410 8.1801
6 29 1.5228 5.2316 9.326 2.3785 1 16.292 2.5213 237.9710 12.6622
7 18 8.7956 8.9864 4.784 1.9984 0 352.566 1.9072 968.0670 8.0602
8 15 6.4100 1.6439 5.612 3.6090 1 217.198 3.4380 535.4440 8.2904
9 22 7.3727 8.0411 5.961 4.7650 1 409.261 2.0919 569.0560 203.5910
10 28 1.1853 7.9196 0.410 3.7678 1 147.689 1.6946 362.9180 224.1580
11 17 9.7292 1.2718 8.385 8.9720 0 46.888 2.8990 541.3630 198.5740
12 14 8.4920 3.9856 1.852 4.6776 0 287.393 2.2012 75.2240 2.3728
13 21 2.9111 1.7015 5.548 1.9607 1 176.652 1.0320 566.3010 6.9538
14 22 2.6364 2.5472 7.222 2.3709 0 209.686 4.0620 64.4850 170.7110`
```
```
`Type your question related to the data in the file. Type 'exit' to exit.
User question: What factors contribute the most to accident frequency?
Generating dynamic tools and using code interpreter...`
```
```
`2025-02-03 13:04:39,427 - MyApp - INFO - Handling tool call: execute\_python\_code
2025-02-03 13:04:39,429 - MyApp - INFO - Tool arguments: {'python\_code': "import pandas as pd\\nimport numpy as np\\nfrom sklearn.linear\_model import LinearRegression\\nfrom sklearn.preprocessing import StandardScaler\\nimport matplotlib.pyplot as plt\\nimport seaborn as sns\\n\\n# Load the dataset\\nfile\_path = '/home/sandboxuser/traffic\_accidents.csv'\\ndf = pd.read\_csv(file\_path)\\n\\n# Show basic information\\nprint('Dataset shape:', df.shape)\\nprint('First few rows:')\\nprint(df.head(), '\\\\n')\\nprint('Columns:', df.columns.tolist(), '\\\\n')\\n\\n# Correlation matrix analysis\\ncorr\_matrix = df.corr()\\nprint('Correlation matrix:')\\nprint(corr\_matrix, '\\\\n')\\n\\n# Correlation of each feature with accidents\\nacc\_corr = corr\_matrix['accidents'].drop('accidents').sort\_values(key=lambda x: abs(x), ascending=False)\\nprint('Correlation of other variables with accidents (sorted by absolute correlation):')\\nprint(acc\_corr, '\\\\n')\\n\\n# Visualize the correlation matrix\\nplt.figure(figsize=(10, 8))\\nsns.heatmap(corr\_matrix, annot=True, cmap='coolwarm', fmt='.2f')\\nplt.title('Correlation Matrix')\\nplt.tight\_layout()\\nplt.savefig('correlation\_matrix.png')\\nplt.close()\\n\\n# Prepare data for regression analysis\\n# Exclude target variable 'accidents'\\nfeatures = [col for col in df.columns if col != 'accidents']\\nX = df[features]\\ny = df['accidents']\\n\\n# Standardize the features to compare the regression coefficients on the same scale\\nscaler = StandardScaler()\\nX\_scaled = scaler.fit\_transform(X)\\n\\n# Fit a linear regression model\\nmodel = LinearRegression()\\nmodel.fit(X\_scaled, y)\\n\\n# Gather coefficients along with feature names\\ncoef = model.coef\_\\ncoef\_df = pd.DataFrame({'Feature': features, 'Coefficient': coef})\\ncoef\_df['AbsCoefficient'] = coef\_df['Coefficient'].abs()\\ncoef\_df = coef\_df.sort\_values(by='AbsCoefficient', ascending=False)\\nprint('Linear Regression Coefficients (using standardized features):')\\nprint(coef\_df[['Feature', 'Coefficient']], '\\\\n')\\n\\n# Additionally, compute feature importances using a Random Forest regressor\\nfrom sklearn.ensemble import RandomForestRegressor\\nrf = RandomForestRegressor(random\_state=42)\\nrf.fit(X, y)\\nrf\_importance = rf.feature\_importances\_\\nrf\_df = pd.DataFrame({'Feature': features, 'Importance': rf\_importance})\\nrf\_df = rf\_df.sort\_values(by='Importance', ascending=False)\\nprint('Random Forest Feature Importances:')\\nprint(rf\_df, '\\\\n')\\n\\n# The printed outputs will help in understanding which factors contribute most to accident frequency.\\n\\n# For clarity, save the coefficients and importances to CSV files (optional)\\ncoef\_df.to\_csv('linear\_regression\_coefficients.csv', index=False)\\nrf\_df.to\_csv('random\_forest\_importances.csv', index=False)\\n\\n# End of analysis\\n"}
2025-02-03 13:04:43,123 - MyApp - INFO - Tool 'execute\_python\_code' response: Dataset shape: (8756, 10)
First few rows:
accidents traffic\_fine\_amount ... vehicle\_count time\_of\_day
0 20 4.3709 ... 290.8570 160.4320
1 11 9.5564 ... 931.8120 8.9108
2 19 7.5879 ... 830.0860 5.5727
3 23 6.3879 ... 813.1590 131.4520
4 23 2.4042 ... 1.4663 6.9610
[5 rows x 10 columns]
Columns: ['accidents', 'traffic\_fine\_amount', 'traffic\_density', 'traffic\_lights', 'pavement\_quality', 'urban\_area', 'average\_speed', 'rain\_intensity', 'vehicle\_count', 'time\_of\_day']
Correlation matrix:
accidents traffic\_fine\_amount ... vehicle\_count time\_of\_day
accidents 1.000000 -0.745161 ... 0.068399 0.101995
traffic\_fine\_amount -0.745161 1.000000 ... -0.016610 -0.006236
traffic\_density -0.059265 -0.004365 ... -0.014244 0.002806
traffic\_lights -0.026642 0.009056 ... 0.001373 -0.001971
pavement\_quality 0.064694 -0.021229 ... 0.007840 0.000055
urban\_area 0.145092 -0.005136 ... -0.006053 -0.006320
average\_speed 0.093923 0.009151 ... 0.000777 -0.005338
rain\_intensity -0.091673 -0.015302 ... -0.025933 -0.013446
vehicle\_count 0.068399 -0.016610 ... 1.000000 -0.009303
time\_of\_day 0.101995 -0.006236 ... -0.009303 1.000000
[10 rows x 10 columns]
Correlation of other variables with accidents (sorted by absolute correlation):
traffic\_fine\_amount -0.745161
urban\_area 0.145092
time\_of\_day 0.101995
average\_speed 0.093923
rain\_intensity -0.091673
vehicle\_count 0.068399
pavement\_quality 0.064694
traffic\_density -0.059265
traffic\_lights -0.026642
Name: accidents, dtype: float64
Linear Regression Coefficients (using standardized features):
Feature Coefficient
0 traffic\_fine\_amount -3.891935
4 urban\_area 0.739618
5 average\_speed 0.533698
6 rain\_intensity -0.532251
8 time\_of\_day 0.512661
1 traffic\_density -0.331997
7 vehicle\_count 0.281283
3 pavement\_quality 0.264987
2 traffic\_lights -0.092800
Random Forest Feature Importances:
Feature Importance
0 traffic\_fine\_amount 0.580838
1 traffic\_density 0.165201
6 rain\_intensity 0.095124
8 time\_of\_day 0.035814
5 average\_speed 0.035590
3 pavement\_quality 0.032177
2 traffic\_lights 0.022613
7 vehicle\_count 0.021006
4 urban\_area 0.011637`
```
```
`Output...
The analysis shows that one variable stands out by far:
• Both the simple correlation analysis and regression results indicate that traffic\_fine\_amount is the dominant factor—its correlation with accidents is strong (about –0.75), and in the standardized linear regression its coefficient is the largest in magnitude (around –3.89). The negative sign suggests that, in this data, higher fine amounts are associated with fewer accidents (which might reflect more stringent enforcement or deterrence).
Other findings include:
• The Random Forest model also ranks traffic\_fine\_amount as most important (importance ≈ 0.58), with the next most influential factor being traffic\_density (importance ≈ 0.17). Although its simple correlation with accidents is lower, traffic\_density may contribute non‐linearly.
• Additional factors like urban\_area, average\_speed, rain\_intensity, and time\_of\_day have moderate associations (with linear model coefficients ranging between about ±0.5 to +0.74). These suggest that accidents tend to be somewhat higher in urban areas and vary with time of day and weather conditions, but their overall impact is much less than that of traffic fine amounts.
In summary, the data analysis indicates that traffic\_fine\_amount contributes the most to accident frequency—with higher fines linked to fewer recorded accidents—while factors such as traffic density, urban area status, vehicle speed, rain intensity, and time of day also play secondary roles.
Type your question related to the data in the file. Type 'exit' to exit.
Exiting the application.`
```
In this example, the **o3-mini** dynamically generated a tool (Python script) based on user’s question to analyze the data. Note that **o3-mini** examined the problem using multiple approaches such as correlation analysis, linear regression and random forest models. This approach highlights the following:
**reasoning\_effort**: The depth of reasoning the model performs e.g., in this case number of approaches, generally increases when the parameter is increased from low, medium to high. You can try with different levels of reasoning effort to see the difference.
**Dynamically Generated Tool Calling**: The tool (Python script) to analyze the data was not manually written or predetermined by the developer. Instead, the o3-mini model created the relevant data exploration and correlation analysis code at runtime.
**Isolated Code Execution**: To ensure security and avoid running untrusted code on the host machine, the Python script was executed inside a Docker container using the `execute\_python\_code` tool. This container had restricted resource access (e.g., no network and limited filesystem access), minimizing potential risks posed by arbitrary code execution.
### Conclusion
The Cookbook provides a guide for developing a **custom code interpreter** tailored to specific application needs, addressing limitations found in vendor-provided solutions such as language constraints, cost considerations, and the need for flexibility with different LLMs or models.
**Approach for Managing Agents and Tools**: We also defined a set of core classes to manage the agents and tools. This approach ensures that the agents and tools will have a consistent interface and can be reused across different applications. A repository of agents and tools such as the [registry](https://github.com/openai/openai-cookbook/tree/main/examples/object_oriented_agentic_approach/resources/registry) folder can be created to manage the agents and tools.
**o3-mini model**: We demonstrated o3-mini model’s ability to generate sophisticated code at run time to analyze data based on user’s minimal prompt. o3-mini model then reasoned over the outcome of the analysis to explain the results to the user.
Finally, **to recap**, the three steps to build an Agentic Application with Dynamic Tool Calling are:
1. Set up an isolated code execution container environment
2. Define and Test the Agents
3. Set up Agentic Orchestration to run the application
We discussed the importance of isolating the code execution environment to ensure security and avoid running untrusted code on the host machine. With the use case of a CSV file, we demonstrated how to dynamically generate a tool (a Python script) to analyze the data and answer the user’s question. We also showed how to execute the code in a Docker container and return the output to the user.