How to evaluate LLMs for SQL generation
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
Jan 23, 2024
# How to evaluate LLMs for SQL generation
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/How_to_evaluate_LLMs_for_SQL_generation.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/How_to_evaluate_LLMs_for_SQL_generation.ipynb)
LLMs are fundamentally non-deterministic in their responses, this attribute makes them wonderfully creative and dynamic in their responses. However, this trait poses significant challenges in achieving consistency, a crucial aspect for integrating LLMs into production environments.
The key to harnessing the potential of LLMs in practical applications lies in consistent and systematic evaluation. This enables the identification and rectification of inconsistencies and helps with monitoring progress over time as the application evolves.
## Scope of this notebook
This notebook aims to demonstrate a framework for evaluating LLMs, particularly focusing on:
* **Unit Testing:** Essential for assessing individual components of the application.
* **Evaluation Metrics:** Methods to quantitatively measure the model’s effectiveness.
* **Runbook Documentation:** A record of historical evaluations to track progress and regression.
This example focuses on a natural language to SQL use case - code generation use cases fit well with this approach when you combine **code validation** with **code execution**, so your application can test code for real as it is generated to ensure consistency.
Although this notebook uses SQL generation usecase to demonstrate the concept, the approach is generic and can be applied to a wide variety of LLM driven applications.
We will use two versions of a prompt to perform SQL generation. We will then use the unit tests and evaluation functions to test the perforamance of the prompts. Specifically, in this demonstration, we will evaluate:
1. The consistency of JSON response.
2. Syntactic correctness of SQL in response.
1. **[Setup](#Setup):** Install required libraries, download data consisting of SQL queries and corresponding natural language translations.
2. **[Test Development](#Test-development):** Create unit tests and define evaluation metrics for the SQL generation process.
3. **[Evaluation](#Evaluation):** Conduct tests using different prompts to assess the impact on performance.
4. **[Reporting](#Report):** Compile a report that succinctly presents the performance differences observed across various tests.
## Setup
Import our libraries and the dataset we’ll use, which is the natural language to SQL [b-mc2/sql-create-context](https://huggingface.co/datasets/b-mc2/sql-create-context) dataset from HuggingFace.
```
`# Uncomment this to install all necessary dependencies
# !pip install openai datasets pandas pydantic matplotlib python-dotenv numpy tqdm`
```
```
`from datasets import load\_dataset
from openai import OpenAI
import pandas as pd
import pydantic
import os
import sqlite3
from sqlite3 import Error
from pprint import pprint
import matplotlib.pyplot as plt
import numpy as np
from dotenv import load\_dotenv
from tqdm.notebook import tqdm
from IPython.display import HTML, display
# Loads key from local .env file to setup API KEY in env variables
%reload\_ext dotenv
%dotenv
GPT\_MODEL = 'gpt-4o'
dataset = load\_dataset("b-mc2/sql-create-context")
print(dataset['train'].num\_rows, "rows")`
```
```
`78577 rows`
```
### Looking at the dataset
We use Huggingface datasets library to download SQL create context dataset. This dataset consists of:
1. Question, expressed in natural language
2. Answer, expressed in SQL designed to answer the question in natural language.
3. Context, expressed as a CREATE SQL statement, that describes the table that may be used to answer the question.
In our demonstration today, we will use LLM to attempt to answer the question (in natural language). The LLM will be expected to generate a CREATE SQL statement to create a context suitable to answer the user question and a coresponding SELECT SQL query designed to answer the user question completely.
The dataset looks like this:
```
`sql\_df = dataset['train'].to\_pandas()
sql\_df.head()`
```
||answer|question|context|
|0|SELECT COUNT(\*) FROM head WHERE age \> 56|How many heads of the departments are older th...|CREATE TABLE head (age INTEGER)|
|1|SELECT name, born\_state, age FROM head ORDER B...|List the name, born state and age of the heads...|CREATE TABLE head (name VARCHAR, born\_state VA...|
|2|SELECT creation, name, budget\_in\_billions FROM...|List the creation year, name and budget of eac...|CREATE TABLE department (creation VARCHAR, nam...|
|3|SELECT MAX(budget\_in\_billions), MIN(budget\_in\_...|What are the maximum and minimum budget of the...|CREATE TABLE department (budget\_in\_billions IN...|
|4|SELECT AVG(num\_employees) FROM department WHER...|What is the average number of employees of the...|CREATE TABLE department (num\_employees INTEGER...|
## Test development
To test the output of the LLM generations, we’ll develop two unit tests and an evaluation, which will combine to give us a basic evaluation framework to grade the quality of our LLM iterations.
To re-iterate, our purpose is to measure the correctness and consistency of LLM output given our questions.
### Unit tests
Unit tests should test the most granular components of your LLM application.
For this section we’ll develop unit tests to test the following:
* `test\_valid\_schema` will check that a parseable `create` and `select` statement are returned by the LLM.
* `test\_llm\_sql` will execute both the `create` and `select` statements on a `sqlite` database to ensure they are syntactically correct.
```
`from pydantic import BaseModel
class LLMResponse(BaseModel):
"""This is the structure that we expect the LLM to respond with.
The LLM should respond with a JSON string with `create` and `select` fields.
"""
create: str
select: str`
```
#### Prompting the LLM
For this demonstration purposes, we use a fairly simple prompt requesting GPT to generate a `(context, answer)` pair. `context` is the `CREATE` SQL statement, and `answer` is the `SELECT` SQL statement. We supply the natural language question as part of the prompt. We request the response to be in JSON format, so that it can be parsed easily.
```
`system\_prompt = """Translate this natural language request into a JSON
object containing two SQL queries. The first query should be a CREATE
tatement for a table answering the user's request, while the second
should be a SELECT query answering their question."""
# Sending the message array to GPT, requesting a response (ensure that you
# have API key loaded to Env for this step)
client = OpenAI()
def get\_response(system\_prompt, user\_message, model=GPT\_MODEL):
messages = []
messages.append({"role": "system", "content": system\_prompt})
messages.append({"role": "user", "content": user\_message})
response = client.beta.chat.completions.parse(
model=GPT\_MODEL,
messages=messages,
response\_format=LLMResponse,
)
return response.choices[0].message.content
question = sql\_df.iloc[0]['question']
content = get\_response(system\_prompt, question)
print("Question:", question)
print("Answer:", content)`
```
```
`Question: How many heads of the departments are older than 56 ?
Answer: {"create":"CREATE TABLE DepartmentHeads (\\n id INT PRIMARY KEY,\\n name VARCHAR(100),\\n age INT,\\n department VARCHAR(100)\\n);","select":"SELECT COUNT(\*) AS NumberOfHeadsOlderThan56 \\nFROM DepartmentHeads \\nWHERE age \> 56;"}`
```
#### Check JSON formatting
Our first simple unit test checks that the LLM response is parseable into the `LLMResponse` Pydantic class that we’ve defined.
We’ll test that our first response passes, then create a failing example to check that the check fails. This logic will be wrapped in a simple function `test\_valid\_schema`.
We expect GPT to respond with a valid SQL, we can validate this using LLMResponse base model. `test\_valid\_schema` is designed to help us validate this.
```
`def test\_valid\_schema(content):
"""Tests whether the content provided can be parsed into our Pydantic model."""
try:
LLMResponse.model\_validate\_json(content)
return True
# Catch pydantic's validation errors:
except pydantic.ValidationError as exc:
print(f"ERROR: Invalid schema: {exc}")
return False`
```
```
`test\_valid\_schema(content)`
```
```
`True`
```
#### Testing negative scenario
To simulate a scenario in which we get an invalid JSON response from GPT, we hardcode an invalid JSON as response. We expect `test\_valid\_schema` function to throw an exception.
```
`failing\_query = 'CREATE departments, select \* from departments'
test\_valid\_schema(failing\_query)`
```
```
`ERROR: Invalid schema: 1 validation error for LLMResponse
Invalid JSON: expected value at line 1 column 1 [type=json\_invalid, input\_value='CREATE departments, select \* from departments', input\_type=str]
For further information visit https://errors.pydantic.dev/2.10/v/json\_invalid`
```
```
`False`
```
As expected, we get an exception thrown from the `test\_valid\_schema` fucntion.
### Test SQL queries
Next we’ll validate the correctness of the SQL. This test will be desined to validate:
1. The CREATE SQL returned in GPT response is syntactically correct.
2. The SELECT SQL returned in the GPT response is syntactically correct.
To achieve this, we will use a sqlite instance. We will direct the retured SQL functions to a sqlite instance. If the SQL statements are valid, sqlite instance will accept and execute the statements; otherwise we will expect an exception to be thrown.
`create\_connection` function below will setup a sqlite instance (in-memory by default) and create a connection to be used later.
```
`# Set up SQLite to act as our test database
def create\_connection(db\_file=":memory:"):
"""create a database connection to a SQLite database"""
try:
conn = sqlite3.connect(db\_file)
# print(sqlite3.version)
except Error as e:
print(e)
return None
return conn
def close\_connection(conn):
"""close a database connection"""
try:
conn.close()
except Error as e:
print(e)
conn = create\_connection()`
```
Next, we will create the following functions to carry out the syntactical correctness checks.
* `test\_create`: Function testing if the CREATE SQL statement succeeds.
* `test\_select`: Function testing if the SELECT SQL statement succeeds.
* `test\_llm\_sql`: Wrapper function executing the two tests above.
```
`def test\_select(conn, cursor, select, should\_log=True):
"""Tests that a SQLite select query can be executed successfully."""
try:
if should\_log:
print(f"Testing select query: {select}")
cursor.execute(select)
record = cursor.fetchall()
if should\_log:
print(f"Result of query: {record}")
return True
except sqlite3.Error as error:
if should\_log:
print("Error while executing select query:", error)
return False
def test\_create(conn, cursor, create, should\_log=True):
"""Tests that a SQLite create query can be executed successfully"""
try:
if should\_log:
print(f"Testing create query: {create}")
cursor.execute(create)
conn.commit()
return True
except sqlite3.Error as error:
if should\_log:
print("Error while creating the SQLite table:", error)
return False
def test\_llm\_sql(llm\_response, should\_log=True):
"""Runs a suite of SQLite tests"""
try:
conn = create\_connection()
cursor = conn.cursor()
create\_response = test\_create(conn, cursor, llm\_response.create, should\_log=should\_log)
select\_response = test\_select(conn, cursor, llm\_response.select, should\_log=should\_log)
if conn:
close\_connection(conn)
if create\_response is not True:
return False
elif select\_response is not True:
return False
else:
return True
except sqlite3.Error as error:
if should\_log:
print("Error while creating a sqlite table", error)
return False`
```
```
`# Viewing CREATE and SELECT sqls returned by GPT
test\_query = LLMResponse.model\_validate\_json(content)
print(f"CREATE SQL is: {test\_query.create}")
print(f"SELECT SQL is: {test\_query.select}")`
```
```
`CREATE SQL is: CREATE TABLE DepartmentHeads (
id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
department VARCHAR(100)
);
SELECT SQL is: SELECT COUNT(\*) AS NumberOfHeadsOlderThan56
FROM DepartmentHeads
WHERE age \> 56;`
```
```
`# Testing the CREATE and SELECT sqls are valid (we expect this to be succesful)
test\_llm\_sql(test\_query)`
```
```
`Testing create query: CREATE TABLE DepartmentHeads (
id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
department VARCHAR(100)
);
Testing select query: SELECT COUNT(\*) AS NumberOfHeadsOlderThan56
FROM DepartmentHeads
WHERE age \> 56;
Result of query: [(0,)]`
```
```
`True`
```
```
`# Again we'll perform a negative test to confirm that a failing SELECT will return an error.
test\_failure\_query = '{"create": "CREATE TABLE departments (id INT, name VARCHAR(255), head\_of\_department VARCHAR(255))", "select": "SELECT COUNT(\*) FROM departments WHERE age \> 56"}'
test\_failure\_query = LLMResponse.model\_validate\_json(test\_failure\_query)
test\_llm\_sql(test\_failure\_query)`
```
```
`Testing create query: CREATE TABLE departments (id INT, name VARCHAR(255), head\_of\_department VARCHAR(255))
Testing select query: SELECT COUNT(\*) FROM departments WHERE age \> 56
Error while executing select query: no such column: age`
```
```
`False`
```
### Using an LLM to evaluate relevancy
Next, we **evaluate** whether the generated SQL actually answers the user’s question. This test will be performed by `gpt-4o-mini`, and will assess how **relevant** the produced SQL query is when compared to the initial user request.
This is a simple example which adapts an approach outlined in the [G-Eval paper](https://arxiv.org/abs/2303.16634), and tested in one of our other [cookbooks](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/How_to_eval_abstractive_summarization.ipynb).
```
`EVALUATION\_MODEL = "gpt-4o-mini"
EVALUATION\_PROMPT\_TEMPLATE = """
You will be given one summary written for an article. Your task is to rate the summary on one metric.
Please make sure you read and understand these instructions very carefully.
Please keep this document open while reviewing, and refer to it as needed.
Evaluation Criteria:
{criteria}
Evaluation Steps:
{steps}
Example:
Request:
{request}
Queries:
{queries}
Evaluation Form (scores ONLY):
- {metric\_name}
"""
# Relevance
RELEVANCY\_SCORE\_CRITERIA = """
Relevance(1-5) - review of how relevant the produced SQL queries are to the original question. \\
The queries should contain all points highlighted in the user's request. \\
Annotators were instructed to penalize queries which contained redundancies and excess information.
"""
RELEVANCY\_SCORE\_STEPS = """
1. Read the request and the queries carefully.
2. Compare the queries to the request document and identify the main points of the request.
3. Assess how well the queries cover the main points of the request, and how much irrelevant or redundant information it contains.
4. Assign a relevance score from 1 to 5.
"""`
```
```
`def get\_geval\_score(
criteria: str, steps: str, request: str, queries: str, metric\_name: str
):
"""Given evaluation criteria and an observation, this function uses EVALUATION GPT to evaluate the observation against those criteria.
"""
prompt = EVALUATION\_PROMPT\_TEMPLATE.format(
criteria=criteria,
steps=steps,
request=request,
queries=queries,
metric\_name=metric\_name,
)
response = client.chat.completions.create(
model=EVALUATION\_MODEL,
messages=[{"role": "user", "content": prompt}],
temperature=0,
max\_tokens=5,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0,
)
return response.choices[0].message.content`
```
```
`# Test out evaluation on a few records
evaluation\_results = []
for x,y in sql\_df.head(3).iterrows():
score = get\_geval\_score(
RELEVANCY\_SCORE\_CRITERIA,
RELEVANCY\_SCORE\_STEPS,
y['question'],
y['context'] + '\\n' + y['answer'],'relevancy'
)
evaluation\_results.append((y['question'],y['context'] + '\\n' + y['answer'],score))`
```
```
`for result in evaluation\_results:
print(f"User Question \\t: {result[0]}")
print(f"CREATE SQL Returned \\t: {result[1].splitlines()[0]}")
print(f"SELECT SQL Returned \\t: {result[1].splitlines()[1]}")
print(f"{result[2]}")
print("\*" \* 20)`
```
```
`User Question : How many heads of the departments are older than 56 ?
CREATE SQL Returned : CREATE TABLE head (age INTEGER)
SELECT SQL Returned : SELECT COUNT(\*) FROM head WHERE age \> 56
5
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
User Question : List the name, born state and age of the heads of departments ordered by age.
CREATE SQL Returned : CREATE TABLE head (name VARCHAR, born\_state VARCHAR, age VARCHAR)
SELECT SQL Returned : SELECT name, born\_state, age FROM head ORDER BY age
4
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
User Question : List the creation year, name and budget of each department.
CREATE SQL Returned : CREATE TABLE department (creation VARCHAR, name VARCHAR, budget\_in\_billions VARCHAR)
SELECT SQL Returned : SELECT creation, name, budget\_in\_billions FROM department
4
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*`
```
## Evaluation
We will test these functions in combination including our unit test and evaluations to test out two system prompts.
Each iteration of input/output and scores should be stored as a **run**. Optionally you can add GPT-4 annotation within your evaluations or as a separate step to review an entire run and highlight the reasons for errors.
For this example, the second system prompt will include an extra line of clarification, so we can assess the impact of this for both SQL validity and quality of solution.
### Building the test framework
We want to build a function, `test\_system\_prompt`, which will run our unit tests and evaluation against a given system prompt.
```
`def execute\_unit\_tests(input\_df, output\_list, system\_prompt):
"""Unit testing function that takes in a dataframe and appends test results to an output\_list."""
for x, y in tqdm(input\_df.iterrows(), total=len(input\_df)):
model\_response = get\_response(system\_prompt, y['question'])
format\_valid = test\_valid\_schema(model\_response)
try:
test\_query = LLMResponse.model\_validate\_json(model\_response)
# Avoid logging since we're executing many rows at once
sql\_valid = test\_llm\_sql(test\_query, should\_log=False)
except:
sql\_valid = False
output\_list.append((y['question'], model\_response, format\_valid, sql\_valid))
def evaluate\_row(row):
"""Simple evaluation function to categorize unit testing results.
If the format or SQL are flagged it returns a label, otherwise it is correct"""
if row['format'] is False:
return 'Format incorrect'
elif row['sql'] is False:
return 'SQL incorrect'
else:
return 'SQL correct'
def test\_system\_prompt(test\_df, system\_prompt):
# Execute unit tests and capture results
results = []
execute\_unit\_tests(
input\_df=test\_df,
output\_list=results,
system\_prompt=system\_prompt
)
results\_df = pd.DataFrame(results)
results\_df.columns = ['question','response','format','sql']
# Use `apply` to calculate the geval score and unit test evaluation
# for each generated response
results\_df['evaluation\_score'] = results\_df.apply(
lambda x: get\_geval\_score(
RELEVANCY\_SCORE\_CRITERIA,
RELEVANCY\_SCORE\_STEPS,
x['question'],
x['response'],
'relevancy'
),
axis=1
)
results\_df['unit\_test\_evaluation'] = results\_df.apply(
lambda x: evaluate\_row(x),
axis=1
)
return results\_df`
```
### System Prompt 1
The system under test is the first system prompt as shown below. This `run` will generate responses for this system prompt and evaluate the responses using the functions we’ve created so far.
```
`system\_prompt = """Translate this natural language request into a JSON object
containing two SQL queries.
The first query should be a CREATE statement for a table answering the user's
request, while the second should be a SELECT query answering their question.
"""
# Select 50 unseen queries to test this one
test\_df = sql\_df.tail(50)
results\_df = test\_system\_prompt(test\_df, system\_prompt)`
```
```
` 0%| | 0/50 [00:00\<?, ?it/s]`
```
We can now group the outcomes of:
* the **unit tests**, which test the structure of response; and
* the **evaluation**, which checks if the SQL is syntatically correct.
```
`results\_df['unit\_test\_evaluation'].value\_counts()`
```
```
`unit\_test\_evaluation
SQL correct 46
SQL incorrect 4
Name: count, dtype: int64`
```
```
`results\_df['evaluation\_score'].value\_counts()`
```
```
`evaluation\_score
5 33
4 16
3 1
Name: count, dtype: int64`
```
### System Prompt 2
We now use a new system prompt to run same unit test and evaluation.
```
`system\_prompt\_2 = """Translate this natural language request into a JSON
object containing two SQL queries.
The first query should be a CREATE statement for a table answering the user's
request, while the second should be a SELECT query answering their question.
Ensure the SQL is always generated on one line, never use \\\\n to separate rows."""
results\_2\_df = test\_system\_prompt(test\_df, system\_prompt)`
```
```
` 0%| | 0/50 [00:00\<?, ?it/s]`
```
As above, we can group the unit test and evaluation results.
```
`results\_2\_df['unit\_test\_evaluation'].value\_counts()`
```
```
`unit\_test\_evaluation
SQL correct 44
SQL incorrect 6
Name: count, dtype: int64`
```
```
`results\_2\_df['evaluation\_score'].value\_counts()`
```
```
`evaluation\_score
5 34
4 15
3 1
Name: count, dtype: int64`
```
## Reporting
We’ll make a simple dataframe to store and display the run performance - this is where you can use tools like Weights & Biases Prompts or Gantry to store the results for analytics on your different iterations.
```
`results\_df['run'] = 1
results\_df['Evaluating Model'] = 'gpt-4'
results\_2\_df['run'] = 2
results\_2\_df['Evaluating Model'] = 'gpt-4'
run\_df = pd.concat([results\_df,results\_2\_df])
run\_df.head()`
```
||question|response|format|sql|evaluation\_score|unit\_test\_evaluation|run|Evaluating Model|
|0|What venue did the parntership of shoaib malik...|{"create":"CREATE TABLE cricket\_partnerships (...|True|True|5|SQL correct|1|gpt-4|
|1|What venue did the partnership of herschelle g...|{"create":"CREATE TABLE CricketPartnerships (\\...|True|True|5|SQL correct|1|gpt-4|
|2|What is the number Played that has 310 Points ...|{"create":"CREATE TABLE game\_stats (\\n numb...|True|True|5|SQL correct|1|gpt-4|
|3|What Losing bonus has a Points against of 588?|{"create":"CREATE TABLE BonusInfo (\\n id IN...|True|True|5|SQL correct|1|gpt-4|
|4|What Tries against has a Losing bonus of 7?|{"create":"CREATE TABLE matches (\\n id SERI...|True|True|5|SQL correct|1|gpt-4|
#### Plotting unit test results
We can create a simple bar chart to visualise the results of unit tests for both runs.
```
`unittest\_df\_pivot = pd.pivot\_table(
run\_df,
values='format',
index=['run','unit\_test\_evaluation'],
aggfunc='count'
)
unittest\_df\_pivot.columns = ['Number of records']
unittest\_df\_pivot`
```
|||Number of records|
|run|unit\_test\_evaluation||
|1|SQL correct|46|
|SQL incorrect|4|
|2|SQL correct|44|
|SQL incorrect|6|
```
`unittest\_df\_pivot.reset\_index(inplace=True)
# Plotting
plt.figure(figsize=(10, 6))
# Set the width of each bar
bar\_width = 0.35
# OpenAI brand colors
openai\_colors = ['#00D1B2', '#000000'] # Green and Black
# Get unique runs and unit test evaluations
unique\_runs = unittest\_df\_pivot['run'].unique()
unique\_unit\_test\_evaluations = unittest\_df\_pivot['unit\_test\_evaluation'].unique()
# Ensure we have enough colors (repeating the pattern if necessary)
colors = openai\_colors \* (len(unique\_runs) // len(openai\_colors) + 1)
# Iterate over each run to plot
for i, run in enumerate(unique\_runs):
run\_data = unittest\_df\_pivot[unittest\_df\_pivot['run'] == run]
# Position of bars for this run
positions = np.arange(len(unique\_unit\_test\_evaluations)) + i \* bar\_width
plt.bar(positions, run\_data['Number of records'], width=bar\_width, label=f'Run {run}', color=colors[i])
# Setting the x-axis labels to be the unit test evaluations, centered under the groups
plt.xticks(np.arange(len(unique\_unit\_test\_evaluations)) + bar\_width / 2, unique\_unit\_test\_evaluations)
plt.xlabel('Unit Test Evaluation')
plt.ylabel('Number of Records')
plt.title('Unit Test Evaluations vs Number of Records for Each Run')
plt.legend()
plt.show()`
```
#### Plotting evaluation results
We can similarly plot the results of the evaluation.
```
`evaluation\_df\_pivot = pd.pivot\_table(
run\_df,
values='format',
index=['run','evaluation\_score'],
aggfunc='count'
)
evaluation\_df\_pivot.columns = ['Number of records']
evaluation\_df\_pivot`
```
|||Number of records|
|run|evaluation\_score||
|1|3|1|
|4|16|
|5|33|
|2|3|1|
|4|15|
|5|34|
```
`# Reset index without dropping the 'run' and 'evaluation\_score' columns
evaluation\_df\_pivot.reset\_index(inplace=True)
# Plotting
plt.figure(figsize=(10, 6))
bar\_width = 0.35
# OpenAI brand colors
openai\_colors = ['#00D1B2', '#000000'] # Green, Black
# Identify unique runs and evaluation scores
unique\_runs = evaluation\_df\_pivot['run'].unique()
unique\_evaluation\_scores = evaluation\_df\_pivot['evaluation\_score'].unique()
# Repeat colors if there are more runs than colors
colors = openai\_colors \* (len(unique\_runs) // len(openai\_colors) + 1)
for i, run in enumerate(unique\_runs):
# Select rows for this run only
run\_data = evaluation\_df\_pivot[evaluation\_df\_pivot['run'] == run].copy()
# Ensure every 'evaluation\_score' is present
run\_data.set\_index('evaluation\_score', inplace=True)
run\_data = run\_data.reindex(unique\_evaluation\_scores, fill\_value=0)
run\_data.reset\_index(inplace=True)
# Plot each bar
positions = np.arange(len(unique\_evaluation\_scores)) + i \* bar\_width
plt.bar(
positions,
run\_data['Number of records'],
width=bar\_width,
label=f'Run {run}',
color=colors[i]
)
# Configure the x-axis to show evaluation scores under the grouped bars
plt.xticks(np.arange(len(unique\_evaluation\_scores)) + bar\_width / 2, unique\_evaluation\_scores)
plt.xlabel('Evaluation Score')
plt.ylabel('Number of Records')
plt.title('Evaluation Scores vs Number of Records for Each Run')
plt.legend()
plt.show()`
```
## Conclusion
Now you have a framework to test SQL generation using LLMs, and with some tweaks this approach can be extended to many other code generation use cases. With GPT-4 and engaged human labellers you can aim to automate the evaluation of these test cases, making an iterative loop where new examples are added to the test set and this structure detects any performance regressions.
We hope you find this useful, and please supply any feedback.