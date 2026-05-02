Unit test writing using a multi-step prompt
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
Nov 15, 2022
# Unit test writing using a multi-step prompt
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)
[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Unit_test_writing_using_a_multi-step_prompt.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Unit_test_writing_using_a_multi-step_prompt.ipynb)
Complex tasks, such as writing unit tests, can benefit from multi-step prompts. In contrast to a single prompt, a multi-step prompt generates text from GPT and then feeds that output text back into subsequent prompts. This can help in cases where you want GPT to reason things out before answering, or brainstorm a plan before executing it.
In this notebook, we use a 3-step prompt to write unit tests in Python using the following steps:
1. **Explain**: Given a Python function, we ask GPT to explain what the function is doing and why.
2. **Plan**: We ask GPT to plan a set of unit tests for the function.
* If the plan is too short, we ask GPT to elaborate with more ideas for unit tests.
* **Execute**: Finally, we instruct GPT to write unit tests that cover the planned cases.
The code example illustrates a few embellishments on the chained, multi-step prompt:
* Conditional branching (e.g., asking for elaboration only if the first plan is too short)
* The choice of different models for different steps
* A check that re-runs the function if the output is unsatisfactory (e.g., if the output code cannot be parsed by Python’s `ast` module)
* Streaming output so that you can start reading the output before it’s fully generated (handy for long, multi-step outputs)
```
`# imports needed to run the code in this notebook
import ast # used for detecting whether generated Python code is valid
import os
from openai import OpenAI
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
color\_prefix\_by\_role = {
"system": "\\033[0m", # gray
"user": "\\033[0m", # gray
"assistant": "\\033[92m", # green
}
def print\_messages(messages, color\_prefix\_by\_role=color\_prefix\_by\_role) -\> None:
"""Prints messages sent to or from GPT."""
for message in messages:
role = message["role"]
color\_prefix = color\_prefix\_by\_role[role]
content = message["content"]
print(f"{color\_prefix}\\n[{role}]\\n{content}")
def print\_message\_delta(delta, color\_prefix\_by\_role=color\_prefix\_by\_role) -\> None:
"""Prints a chunk of messages streamed back from GPT."""
if "role" in delta:
role = delta["role"]
color\_prefix = color\_prefix\_by\_role[role]
print(f"{color\_prefix}\\n[{role}]\\n", end="")
elif "content" in delta:
content = delta["content"]
print(content, end="")
else:
pass
# example of a function that uses a multi-step prompt to write unit tests
def unit\_tests\_from\_function(
function\_to\_test: str, # Python function to test, as a string
unit\_test\_package: str = "pytest", # unit testing package; use the name as it appears in the import statement
approx\_min\_cases\_to\_cover: int = 7, # minimum number of test case categories to cover (approximate)
print\_text: bool = False, # optionally prints text; helpful for understanding the function & debugging
explain\_model: str = "gpt-3.5-turbo", # model used to generate text plans in step 1
plan\_model: str = "gpt-3.5-turbo", # model used to generate text plans in steps 2 and 2b
execute\_model: str = "gpt-3.5-turbo", # model used to generate code in step 3
temperature: float = 0.4, # temperature = 0 can sometimes get stuck in repetitive loops, so we use 0.4
reruns\_if\_fail: int = 1, # if the output code cannot be parsed, this will re-run the function up to N times
) -\> str:
"""Returns a unit test for a given Python function, using a 3-step GPT prompt."""
# Step 1: Generate an explanation of the function
# create a markdown-formatted message that asks GPT to explain the function, formatted as a bullet list
explain\_system\_message = {
"role": "system",
"content": "You are a world-class Python developer with an eagle eye for unintended bugs and edge cases. You carefully explain code with great detail and accuracy. You organize your explanations in markdown-formatted, bulleted lists.",
}
explain\_user\_message = {
"role": "user",
"content": f"""Please explain the following Python function. Review what each element of the function is doing precisely and what the author's intentions may have been. Organize your explanation as a markdown-formatted, bulleted list.
```python
{function\_to\_test}
```""",
}
explain\_messages = [explain\_system\_message, explain\_user\_message]
if print\_text:
print\_messages(explain\_messages)
explanation\_response = client.chat.completions.create(model=explain\_model,
messages=explain\_messages,
temperature=temperature,
stream=True)
explanation = ""
for chunk in explanation\_response:
delta = chunk.choices[0].delta
if print\_text:
print\_message\_delta(delta)
if "content" in delta:
explanation += delta.content
explain\_assistant\_message = {"role": "assistant", "content": explanation}
# Step 2: Generate a plan to write a unit test
# Asks GPT to plan out cases the units tests should cover, formatted as a bullet list
plan\_user\_message = {
"role": "user",
"content": f"""A good unit test suite should aim to:
- Test the function's behavior for a wide range of possible inputs
- Test edge cases that the author may not have foreseen
- Take advantage of the features of `{unit\_test\_package}` to make the tests easy to write and maintain
- Be easy to read and understand, with clean code and descriptive names
- Be deterministic, so that the tests always pass or fail in the same way
To help unit test the function above, list diverse scenarios that the function should be able to handle (and under each scenario, include a few examples as sub-bullets).""",
}
plan\_messages = [
explain\_system\_message,
explain\_user\_message,
explain\_assistant\_message,
plan\_user\_message,
]
if print\_text:
print\_messages([plan\_user\_message])
plan\_response = client.chat.completions.create(model=plan\_model,
messages=plan\_messages,
temperature=temperature,
stream=True)
plan = ""
for chunk in plan\_response:
delta = chunk.choices[0].delta
if print\_text:
print\_message\_delta(delta)
if "content" in delta:
explanation += delta.content
plan\_assistant\_message = {"role": "assistant", "content": plan}
# Step 2b: If the plan is short, ask GPT to elaborate further
# this counts top-level bullets (e.g., categories), but not sub-bullets (e.g., test cases)
num\_bullets = max(plan.count("\\n-"), plan.count("\\n\*"))
elaboration\_needed = num\_bullets \< approx\_min\_cases\_to\_cover
if elaboration\_needed:
elaboration\_user\_message = {
"role": "user",
"content": f"""In addition to those scenarios above, list a few rare or unexpected edge cases (and as before, under each edge case, include a few examples as sub-bullets).""",
}
elaboration\_messages = [
explain\_system\_message,
explain\_user\_message,
explain\_assistant\_message,
plan\_user\_message,
plan\_assistant\_message,
elaboration\_user\_message,
]
if print\_text:
print\_messages([elaboration\_user\_message])
elaboration\_response = client.chat.completions.create(model=plan\_model,
messages=elaboration\_messages,
temperature=temperature,
stream=True)
elaboration = ""
for chunk in elaboration\_response:
delta = chunk.choices[0].delta
if print\_text:
print\_message\_delta(delta)
if "content" in delta:
explanation += delta.content
elaboration\_assistant\_message = {"role": "assistant", "content": elaboration}
# Step 3: Generate the unit test
# create a markdown-formatted prompt that asks GPT to complete a unit test
package\_comment = ""
if unit\_test\_package == "pytest":
package\_comment = "# below, each test case is represented by a tuple passed to the @pytest.mark.parametrize decorator"
execute\_system\_message = {
"role": "system",
"content": "You are a world-class Python developer with an eagle eye for unintended bugs and edge cases. You write careful, accurate unit tests. When asked to reply only with code, you write all of your code in a single block.",
}
execute\_user\_message = {
"role": "user",
"content": f"""Using Python and the `{unit\_test\_package}` package, write a suite of unit tests for the function, following the cases above. Include helpful comments to explain each line. Reply only with code, formatted as follows:
```python
# imports
import {unit\_test\_package} # used for our unit tests
{{insert other imports as needed}}
# function to test
{function\_to\_test}
# unit tests
{package\_comment}
{{insert unit test code here}}
```""",
}
execute\_messages = [
execute\_system\_message,
explain\_user\_message,
explain\_assistant\_message,
plan\_user\_message,
plan\_assistant\_message,
]
if elaboration\_needed:
execute\_messages += [elaboration\_user\_message, elaboration\_assistant\_message]
execute\_messages += [execute\_user\_message]
if print\_text:
print\_messages([execute\_system\_message, execute\_user\_message])
execute\_response = client.chat.completions.create(model=execute\_model,
messages=execute\_messages,
temperature=temperature,
stream=True)
execution = ""
for chunk in execute\_response:
delta = chunk.choices[0].delta
if print\_text:
print\_message\_delta(delta)
if delta.content:
execution += delta.content
# check the output for errors
code = execution.split("```python")[1].split("```")[0].strip()
try:
ast.parse(code)
except SyntaxError as e:
print(f"Syntax error in generated code: {e}")
if reruns\_if\_fail \> 0:
print("Rerunning...")
return unit\_tests\_from\_function(
function\_to\_test=function\_to\_test,
unit\_test\_package=unit\_test\_package,
approx\_min\_cases\_to\_cover=approx\_min\_cases\_to\_cover,
print\_text=print\_text,
explain\_model=explain\_model,
plan\_model=plan\_model,
execute\_model=execute\_model,
temperature=temperature,
reruns\_if\_fail=reruns\_if\_fail
- 1, # decrement rerun counter when calling again
)
# return the unit test as a string
return code`
```
```
`example\_function = """def pig\_latin(text):
def translate(word):
vowels = 'aeiou'
if word[0] in vowels:
return word + 'way'
else:
consonants = ''
for letter in word:
if letter not in vowels:
consonants += letter
else:
break
return word[len(consonants):] + consonants + 'ay'
words = text.lower().split()
translated\_words = [translate(word) for word in words]
return ' '.join(translated\_words)
"""
unit\_tests = unit\_tests\_from\_function(
example\_function,
approx\_min\_cases\_to\_cover=10,
print\_text=True
)`
```
```
`[0m
[system]
You are a world-class Python developer with an eagle eye for unintended bugs and edge cases. You carefully explain code with great detail and accuracy. You organize your explanations in markdown-formatted, bulleted lists.
[0m
[user]
Please explain the following Python function. Review what each element of the function is doing precisely and what the author's intentions may have been. Organize your explanation as a markdown-formatted, bulleted list.
```python
def pig\_latin(text):
def translate(word):
vowels = 'aeiou'
if word[0] in vowels:
return word + 'way'
else:
consonants = ''
for letter in word:
if letter not in vowels:
consonants += letter
else:
break
return word[len(consonants):] + consonants + 'ay'
words = text.lower().split()
translated\_words = [translate(word) for word in words]
return ' '.join(translated\_words)
```
[0m
[user]
A good unit test suite should aim to:
- Test the function's behavior for a wide range of possible inputs
- Test edge cases that the author may not have foreseen
- Take advantage of the features of `pytest` to make the tests easy to write and maintain
- Be easy to read and understand, with clean code and descriptive names
- Be deterministic, so that the tests always pass or fail in the same way
To help unit test the function above, list diverse scenarios that the function should be able to handle (and under each scenario, include a few examples as sub-bullets).
[0m
[user]
In addition to those scenarios above, list a few rare or unexpected edge cases (and as before, under each edge case, include a few examples as sub-bullets).
[0m
[system]
You are a world-class Python developer with an eagle eye for unintended bugs and edge cases. You write careful, accurate unit tests. When asked to reply only with code, you write all of your code in a single block.
[0m
[user]
Using Python and the `pytest` package, write a suite of unit tests for the function, following the cases above. Include helpful comments to explain each line. Reply only with code, formatted as follows:
```python
# imports
import pytest # used for our unit tests
{insert other imports as needed}
# function to test
def pig\_latin(text):
def translate(word):
vowels = 'aeiou'
if word[0] in vowels:
return word + 'way'
else:
consonants = ''
for letter in word:
if letter not in vowels:
consonants += letter
else:
break
return word[len(consonants):] + consonants + 'ay'
words = text.lower().split()
translated\_words = [translate(word) for word in words]
return ' '.join(translated\_words)
# unit tests
# below, each test case is represented by a tuple passed to the @pytest.mark.parametrize decorator
{insert unit test code here}
```
execute messages: [{'role': 'system', 'content': 'You are a world-class Python developer with an eagle eye for unintended bugs and edge cases. You write careful, accurate unit tests. When asked to reply only with code, you write all of your code in a single block.'}, {'role': 'user', 'content': "Please explain the following Python function. Review what each element of the function is doing precisely and what the author's intentions may have been. Organize your explanation as a markdown-formatted, bulleted list.\\n\\n```python\\ndef pig\_latin(text):\\n def translate(word):\\n vowels = 'aeiou'\\n if word[0] in vowels:\\n return word + 'way'\\n else:\\n consonants = ''\\n for letter in word:\\n if letter not in vowels:\\n consonants += letter\\n else:\\n break\\n return word[len(consonants):] + consonants + 'ay'\\n\\n words = text.lower().split()\\n translated\_words = [translate(word) for word in words]\\n return ' '.join(translated\_words)\\n\\n```"}, {'role': 'assistant', 'content': ''}, {'role': 'user', 'content': "A good unit test suite should aim to:\\n- Test the function's behavior for a wide range of possible inputs\\n- Test edge cases that the author may not have foreseen\\n- Take advantage of the features of `pytest` to make the tests easy to write and maintain\\n- Be easy to read and understand, with clean code and descriptive names\\n- Be deterministic, so that the tests always pass or fail in the same way\\n\\nTo help unit test the function above, list diverse scenarios that the function should be able to handle (and under each scenario, include a few examples as sub-bullets)."}, {'role': 'assistant', 'content': ''}, {'role': 'user', 'content': 'In addition to those scenarios above, list a few rare or unexpected edge cases (and as before, under each edge case, include a few examples as sub-bullets).'}, {'role': 'assistant', 'content': ''}, {'role': 'user', 'content': "Using Python and the `pytest` package, write a suite of unit tests for the function, following the cases above. Include helpful comments to explain each line. Reply only with code, formatted as follows:\\n\\n```python\\n# imports\\nimport pytest # used for our unit tests\\n{insert other imports as needed}\\n\\n# function to test\\ndef pig\_latin(text):\\n def translate(word):\\n vowels = 'aeiou'\\n if word[0] in vowels:\\n return word + 'way'\\n else:\\n consonants = ''\\n for letter in word:\\n if letter not in vowels:\\n consonants += letter\\n else:\\n break\\n return word[len(consonants):] + consonants + 'ay'\\n\\n words = text.lower().split()\\n translated\_words = [translate(word) for word in words]\\n return ' '.join(translated\_words)\\n\\n\\n# unit tests\\n# below, each test case is represented by a tuple passed to the @pytest.mark.parametrize decorator\\n{insert unit test code here}\\n```"}]`
```
```
`print(unit\_tests)`
```
```
`# imports
import pytest
# function to test
def pig\_latin(text):
def translate(word):
vowels = 'aeiou'
if word[0] in vowels:
return word + 'way'
else:
consonants = ''
for letter in word:
if letter not in vowels:
consonants += letter
else:
break
return word[len(consonants):] + consonants + 'ay'
words = text.lower().split()
translated\_words = [translate(word) for word in words]
return ' '.join(translated\_words)
# unit tests
@pytest.mark.parametrize('text, expected', [
('hello world', 'ellohay orldway'), # basic test case
('Python is awesome', 'ythonPay isway awesomeway'), # test case with multiple words
('apple', 'appleway'), # test case with a word starting with a vowel
('', ''), # test case with an empty string
('123', '123'), # test case with non-alphabetic characters
('Hello World!', 'elloHay orldWay!'), # test case with punctuation
('The quick brown fox', 'ethay ickquay ownbray oxfay'), # test case with mixed case words
('a e i o u', 'away eway iway oway uway'), # test case with all vowels
('bcd fgh jkl mnp', 'bcday fghay jklway mnpay'), # test case with all consonants
])
def test\_pig\_latin(text, expected):
assert pig\_latin(text) == expected`
```
Make sure to check any code before using it, as GPT makes plenty of mistakes (especially on character-based tasks like this one). For best results, use the most powerful model (GPT-4, as of May 2023).