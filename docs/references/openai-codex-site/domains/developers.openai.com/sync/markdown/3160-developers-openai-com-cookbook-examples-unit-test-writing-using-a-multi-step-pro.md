Unit test writing using a multi-step prompt with legacy Completions
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
May 19, 2023
# Unit test writing using a multi-step prompt with legacy Completions
[ TS ](https://github.com/ted-at-openai)
[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Unit_test_writing_using_a_multi-step_prompt_with_older_completions_API.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Unit_test_writing_using_a_multi-step_prompt_with_older_completions_API.ipynb)
Complex tasks, such as writing unit tests, can benefit from multi-step prompts. In contrast to a single prompt, a multi-step prompt generates text from GPT-3 and then feeds that text back into subsequent prompts. This can help in cases where you want GPT-3 to explain its reasoning before answering, or brainstorm a plan before executing it.
In this notebook, we use a 3-step prompt to write unit tests in Python using the following steps:
1. Given a Python function, we first prompt GPT-3 to explain what the function is doing.
2. Second, we prompt GPT-3 to plan a set of unit tests for the function.
* If the plan is too short, we ask GPT-3 to elaborate with more ideas for unit tests.
* Finally, we prompt GPT-3 to write the unit tests.
The code example illustrates a few optional embellishments on the chained, multi-step prompt:
* Conditional branching (e.g., only asking for elaboration if the first plan is too short)
* Different models for different steps (e.g., `gpt-3.5-turbo-instruct` for the text planning steps and `gpt-4` for the code writing step)
* A check that re-runs the function if the output is unsatisfactory (e.g., if the output code cannot be parsed by Python’s `ast` module)
* Streaming output so that you can start reading the output before it’s fully generated (useful for long, multi-step outputs)
The full 3-step prompt looks like this (using as an example `pytest` for the unit test framework and `is\_palindrome` as the function):
```
`# How to write great unit tests with pytest
In this advanced tutorial for experts, we'll use Python 3.9 and `pytest` to write a suite of unit tests to verify the behavior of the following function.
```python
def is\_palindrome(s):
return s == s[::-1]
```
Before writing any unit tests, let's review what each element of the function is doing exactly and what the author's intentions may have been.
- First,{GENERATED IN STEP 1}
A good unit test suite should aim to:
- Test the function's behavior for a wide range of possible inputs
- Test edge cases that the author may not have foreseen
- Take advantage of the features of `pytest` to make the tests easy to write and maintain
- Be easy to read and understand, with clean code and descriptive names
- Be deterministic, so that the tests always pass or fail in the same way
`pytest` has many convenient features that make it easy to write and maintain unit tests. We'll use them to write unit tests for the function above.
For this particular function, we'll want our unit tests to handle the following diverse scenarios (and under each scenario, we include a few examples as sub-bullets):
-{GENERATED IN STEP 2}
[OPTIONALLY APPENDED]In addition to the scenarios above, we'll also want to make sure we don't forget to test rare or unexpected edge cases (and under each edge case, we include a few examples as sub-bullets):
-{GENERATED IN STEP 2B}
Before going into the individual tests, let's first look at the complete suite of unit tests as a cohesive whole. We've added helpful comments to explain what each line does.
```python
import pytest # used for our unit tests
def is\_palindrome(s):
return s == s[::-1]
#Below, each test case is represented by a tuple passed to the @pytest.mark.parametrize decorator
{GENERATED IN STEP 3}`
```
```
`import ast # used for detecting whether generated Python code is valid
import openai
# example of a function that uses a multi-step prompt to write unit tests
def unit\_test\_from\_function(
function\_to\_test: str, # Python function to test, as a string
unit\_test\_package: str = "pytest", # unit testing package; use the name as it appears in the import statement
approx\_min\_cases\_to\_cover: int = 7, # minimum number of test case categories to cover (approximate)
print\_text: bool = False, # optionally prints text; helpful for understanding the function & debugging
text\_model: str = "gpt-3.5-turbo-instruct", # model used to generate text plans in steps 1, 2, and 2b
code\_model: str = "gpt-3.5-turbo-instruct", # if you don't have access to code models, you can use text models here instead
max\_tokens: int = 1000, # can set this high, as generations should be stopped earlier by stop sequences
temperature: float = 0.4, # temperature = 0 can sometimes get stuck in repetitive loops, so we use 0.4
reruns\_if\_fail: int = 1, # if the output code cannot be parsed, this will re-run the function up to N times
) -\> str:
"""Outputs a unit test for a given Python function, using a 3-step GPT-3 prompt."""
# Step 1: Generate an explanation of the function
# create a markdown-formatted prompt that asks GPT-3 to complete an explanation of the function, formatted as a bullet list
prompt\_to\_explain\_the\_function = f"""# How to write great unit tests with {unit\_test\_package}
In this advanced tutorial for experts, we'll use Python 3.9 and `{unit\_test\_package}` to write a suite of unit tests to verify the behavior of the following function.
```python
{function\_to\_test}
```
Before writing any unit tests, let's review what each element of the function is doing exactly and what the author's intentions may have been.
- First,"""
if print\_text:
text\_color\_prefix = "\\033[30m" # black; if you read against a dark background \\033[97m is white
print(text\_color\_prefix + prompt\_to\_explain\_the\_function, end="") # end='' prevents a newline from being printed
# send the prompt to the API, using \\n\\n as a stop sequence to stop at the end of the bullet list
explanation\_response = openai.Completion.create(
model=text\_model,
prompt=prompt\_to\_explain\_the\_function,
stop=["\\n\\n", "\\n\\t\\n", "\\n \\n"],
max\_tokens=max\_tokens,
temperature=temperature,
stream=True,
)
explanation\_completion = ""
if print\_text:
completion\_color\_prefix = "\\033[92m" # green
print(completion\_color\_prefix, end="")
for event in explanation\_response:
event\_text = event["choices"][0]["text"]
explanation\_completion += event\_text
if print\_text:
print(event\_text, end="")
# Step 2: Generate a plan to write a unit test
# create a markdown-formatted prompt that asks GPT-3 to complete a plan for writing unit tests, formatted as a bullet list
prompt\_to\_explain\_a\_plan = f"""
A good unit test suite should aim to:
- Test the function's behavior for a wide range of possible inputs
- Test edge cases that the author may not have foreseen
- Take advantage of the features of `{unit\_test\_package}` to make the tests easy to write and maintain
- Be easy to read and understand, with clean code and descriptive names
- Be deterministic, so that the tests always pass or fail in the same way
`{unit\_test\_package}` has many convenient features that make it easy to write and maintain unit tests. We'll use them to write unit tests for the function above.
For this particular function, we'll want our unit tests to handle the following diverse scenarios (and under each scenario, we include a few examples as sub-bullets):
-"""
if print\_text:
print(text\_color\_prefix + prompt\_to\_explain\_a\_plan, end="")
# append this planning prompt to the results from step 1
prior\_text = prompt\_to\_explain\_the\_function + explanation\_completion
full\_plan\_prompt = prior\_text + prompt\_to\_explain\_a\_plan
# send the prompt to the API, using \\n\\n as a stop sequence to stop at the end of the bullet list
plan\_response = openai.Completion.create(
model=text\_model,
prompt=full\_plan\_prompt,
stop=["\\n\\n", "\\n\\t\\n", "\\n \\n"],
max\_tokens=max\_tokens,
temperature=temperature,
stream=True,
)
plan\_completion = ""
if print\_text:
print(completion\_color\_prefix, end="")
for event in plan\_response:
event\_text = event["choices"][0]["text"]
plan\_completion += event\_text
if print\_text:
print(event\_text, end="")
# Step 2b: If the plan is short, ask GPT-3 to elaborate further
# this counts top-level bullets (e.g., categories), but not sub-bullets (e.g., test cases)
elaboration\_needed = plan\_completion.count("\\n-") +1 \< approx\_min\_cases\_to\_cover # adds 1 because the first bullet is not counted
if elaboration\_needed:
prompt\_to\_elaborate\_on\_the\_plan = f"""
In addition to the scenarios above, we'll also want to make sure we don't forget to test rare or unexpected edge cases (and under each edge case, we include a few examples as sub-bullets):
-"""
if print\_text:
print(text\_color\_prefix + prompt\_to\_elaborate\_on\_the\_plan, end="")
# append this elaboration prompt to the results from step 2
prior\_text = full\_plan\_prompt + plan\_completion
full\_elaboration\_prompt = prior\_text + prompt\_to\_elaborate\_on\_the\_plan
# send the prompt to the API, using \\n\\n as a stop sequence to stop at the end of the bullet list
elaboration\_response = openai.Completion.create(
model=text\_model,
prompt=full\_elaboration\_prompt,
stop=["\\n\\n", "\\n\\t\\n", "\\n \\n"],
max\_tokens=max\_tokens,
temperature=temperature,
stream=True,
)
elaboration\_completion = ""
if print\_text:
print(completion\_color\_prefix, end="")
for event in elaboration\_response:
event\_text = event["choices"][0]["text"]
elaboration\_completion += event\_text
if print\_text:
print(event\_text, end="")
# Step 3: Generate the unit test
# create a markdown-formatted prompt that asks GPT-3 to complete a unit test
starter\_comment = ""
if unit\_test\_package == "pytest":
starter\_comment = "Below, each test case is represented by a tuple passed to the @pytest.mark.parametrize decorator"
prompt\_to\_generate\_the\_unit\_test = f"""
Before going into the individual tests, let's first look at the complete suite of unit tests as a cohesive whole. We've added helpful comments to explain what each line does.
```python
import {unit\_test\_package} # used for our unit tests
{function\_to\_test}
#{starter\_comment}"""
if print\_text:
print(text\_color\_prefix + prompt\_to\_generate\_the\_unit\_test, end="")
# append this unit test prompt to the results from step 3
if elaboration\_needed:
prior\_text = full\_elaboration\_prompt + elaboration\_completion
else:
prior\_text = full\_plan\_prompt + plan\_completion
full\_unit\_test\_prompt = prior\_text + prompt\_to\_generate\_the\_unit\_test
# send the prompt to the API, using ``` as a stop sequence to stop at the end of the code block
unit\_test\_response = openai.Completion.create(
model=code\_model,
prompt=full\_unit\_test\_prompt,
stop="```",
max\_tokens=max\_tokens,
temperature=temperature,
stream=True
)
unit\_test\_completion = ""
if print\_text:
print(completion\_color\_prefix, end="")
for event in unit\_test\_response:
event\_text = event["choices"][0]["text"]
unit\_test\_completion += event\_text
if print\_text:
print(event\_text, end="")
# check the output for errors
code\_start\_index = prompt\_to\_generate\_the\_unit\_test.find("```python\\n") + len("```python\\n")
code\_output = prompt\_to\_generate\_the\_unit\_test[code\_start\_index:] + unit\_test\_completion
try:
ast.parse(code\_output)
except SyntaxError as e:
print(f"Syntax error in generated code: {e}")
if reruns\_if\_fail \> 0:
print("Rerunning...")
return unit\_test\_from\_function(
function\_to\_test=function\_to\_test,
unit\_test\_package=unit\_test\_package,
approx\_min\_cases\_to\_cover=approx\_min\_cases\_to\_cover,
print\_text=print\_text,
text\_model=text\_model,
code\_model=code\_model,
max\_tokens=max\_tokens,
temperature=temperature,
reruns\_if\_fail=reruns\_if\_fail-1, # decrement rerun counter when calling again
)
# return the unit test as a string
return unit\_test\_completion`
```
```
`example\_function = """def is\_palindrome(s):
return s == s[::-1]"""
unit\_test\_from\_function(example\_function, print\_text=True)`
```
```
`[30m# How to write great unit tests with pytest
In this advanced tutorial for experts, we'll use Python 3.9 and `pytest` to write a suite of unit tests to verify the behavior of the following function.
```python
def is\_palindrome(s):
return s == s[::-1]
```
Before writing any unit tests, let's review what each element of the function is doing exactly and what the author's intentions may have been.
- First,[92m we have a function definition. This is where we give the function a name, `is\_palindrome`, and specify the arguments that the function accepts. In this case, the function accepts a single string argument, `s`.
- Next, we have a return statement. This is where we specify the value that the function returns. In this case, the function returns `s == s[::-1]`.
- Finally, we have a function call. This is where we actually call the function with a specific set of arguments. In this case, we're calling the function with the string `"racecar"`.[30m
A good unit test suite should aim to:
- Test the function's behavior for a wide range of possible inputs
- Test edge cases that the author may not have foreseen
- Take advantage of the features of `pytest` to make the tests easy to write and maintain
- Be easy to read and understand, with clean code and descriptive names
- Be deterministic, so that the tests always pass or fail in the same way
`pytest` has many convenient features that make it easy to write and maintain unit tests. We'll use them to write unit tests for the function above.
For this particular function, we'll want our unit tests to handle the following diverse scenarios (and under each scenario, we include a few examples as sub-bullets):
-[92m The input is a palindrome
- `"racecar"`
- `"madam"`
- `"anna"`
- The input is not a palindrome
- `"python"`
- `"test"`
- `"1234"`
- The input is an empty string
- `""`
- The input is `None`
- The input is not a string
- `1`
- `1.0`
- `True`
- `False`
- `[]`
- `{}`[30m
In addition to the scenarios above, we'll also want to make sure we don't forget to test rare or unexpected edge cases (and under each edge case, we include a few examples as sub-bullets):
-[92m The input is a palindrome with spaces
- `"race car"`
- `" madam "`
- `" anna "`
- The input is not a palindrome with spaces
- `" python "`
- `" test "`
- `" 1234 "`
- The input is a palindrome with punctuation
- `"racecar!"`
- `"Madam, I'm Adam."`
- `"Anna's"`
- The input is not a palindrome with punctuation
- `"python!"`
- `"test."`
- `"1234!"`
- The input is a palindrome with mixed case
- `"Racecar"`
- `"Madam"`
- `"Anna"`
- The input is not a palindrome with mixed case
- `"Python"`
- `"Test"`
- `"1234"`[30m
Before going into the individual tests, let's first look at the complete suite of unit tests as a cohesive whole. We've added helpful comments to explain what each line does.
```python
import pytest # used for our unit tests
def is\_palindrome(s):
return s == s[::-1]
#Below, each test case is represented by a tuple passed to the @pytest.mark.parametrize decorator[92m.
#The first element of the tuple is a name for the test case, and the second element is a list of arguments for the test case.
#The @pytest.mark.parametrize decorator will generate a separate test function for each test case.
#The generated test function will be named test\_is\_palindrome\_\<name\> where \<name\> is the name of the test case.
#The generated test function will be given the arguments specified in the list of arguments for the test case.
#The generated test function will be given the fixture specified in the decorator, in this case the function itself.
#The generated test function will call the function with the arguments and assert that the result is equal to the expected value.
@pytest.mark.parametrize(
"name,args,expected",
[
# Test the function's behavior for a wide range of possible inputs
("palindrome", ["racecar"], True),
("palindrome", ["madam"], True),
("palindrome", ["anna"], True),
("non-palindrome", ["python"], False),
("non-palindrome", ["test"], False),
("non-palindrome", ["1234"], False),
("empty string", [""], True),
("None", [None], False),
("non-string", [1], False),
("non-string", [1.0], False),
("non-string", [True], False),
("non-string", [False], False),
("non-string", [[]], False),
("non-string", [{}], False),
# Test edge cases that the author may not have foreseen
("palindrome with spaces", ["race car"], True),
("palindrome with spaces", [" madam "], True),
("palindrome with spaces", [" anna "], True),
("non-palindrome with spaces", [" python "], False),
("non-palindrome with spaces", [" test "], False),
("non-palindrome with spaces", [" 1234 "], False),
("palindrome with punctuation", ["racecar!"], True),
("palindrome with punctuation", ["Madam, I'm Adam."], True),
("palindrome with punctuation", ["Anna's"], True),
("non-palindrome with punctuation", ["python!"], False),
("non-palindrome with punctuation", ["test."], False),
("non-palindrome with punctuation", ["1234!"], False),
("palindrome with mixed case", ["Racecar"], True),
("palindrome with mixed case", ["Madam"], True),
("palindrome with mixed case", ["Anna"], True),
("non-palindrome with mixed case", ["Python"], False),
("non-palindrome with mixed case", ["Test"], False),
("non-palindrome with mixed case", ["1234"], False),
],
)
def test\_is\_palindrome(is\_palindrome, args, expected):
assert is\_palindrome(\*args) == expected`
```
```
`'.\\n#The first element of the tuple is a name for the test case, and the second element is a list of arguments for the test case.\\n#The @pytest.mark.parametrize decorator will generate a separate test function for each test case.\\n#The generated test function will be named test\_is\_palindrome\_\<name\> where \<name\> is the name of the test case.\\n#The generated test function will be given the arguments specified in the list of arguments for the test case.\\n#The generated test function will be given the fixture specified in the decorator, in this case the function itself.\\n#The generated test function will call the function with the arguments and assert that the result is equal to the expected value.\\n@pytest.mark.parametrize(\\n "name,args,expected",\\n [\\n # Test the function\\'s behavior for a wide range of possible inputs\\n ("palindrome", ["racecar"], True),\\n ("palindrome", ["madam"], True),\\n ("palindrome", ["anna"], True),\\n ("non-palindrome", ["python"], False),\\n ("non-palindrome", ["test"], False),\\n ("non-palindrome", ["1234"], False),\\n ("empty string", [""], True),\\n ("None", [None], False),\\n ("non-string", [1], False),\\n ("non-string", [1.0], False),\\n ("non-string", [True], False),\\n ("non-string", [False], False),\\n ("non-string", [[]], False),\\n ("non-string", [{}], False),\\n # Test edge cases that the author may not have foreseen\\n ("palindrome with spaces", ["race car"], True),\\n ("palindrome with spaces", [" madam "], True),\\n ("palindrome with spaces", [" anna "], True),\\n ("non-palindrome with spaces", [" python "], False),\\n ("non-palindrome with spaces", [" test "], False),\\n ("non-palindrome with spaces", [" 1234 "], False),\\n ("palindrome with punctuation", ["racecar!"], True),\\n ("palindrome with punctuation", ["Madam, I\\'m Adam."], True),\\n ("palindrome with punctuation", ["Anna\\'s"], True),\\n ("non-palindrome with punctuation", ["python!"], False),\\n ("non-palindrome with punctuation", ["test."], False),\\n ("non-palindrome with punctuation", ["1234!"], False),\\n ("palindrome with mixed case", ["Racecar"], True),\\n ("palindrome with mixed case", ["Madam"], True),\\n ("palindrome with mixed case", ["Anna"], True),\\n ("non-palindrome with mixed case", ["Python"], False),\\n ("non-palindrome with mixed case", ["Test"], False),\\n ("non-palindrome with mixed case", ["1234"], False),\\n ],\\n)\\ndef test\_is\_palindrome(is\_palindrome, args, expected):\\n assert is\_palindrome(\*args) == expected\\n'`
```