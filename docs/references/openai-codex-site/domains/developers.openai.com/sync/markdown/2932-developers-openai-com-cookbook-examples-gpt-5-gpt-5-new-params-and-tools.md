GPT-5 New Params and Tools
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
Aug 7, 2025
# GPT-5 New Params and Tools
[ MS ](https://github.com/msingh-openai)
[ Mandeep Singh
(OpenAI)
](https://github.com/msingh-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/gpt-5/gpt-5_new_params_and_tools.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/gpt-5/gpt-5_new_params_and_tools.ipynb)
We’re introducing new developer controls in the GPT-5 series that give you greater control over model responses—from shaping output length and style to enforcing strict formatting. Below is a quick overview of the latest features:
|#|Feature|Overview|Values / Usage|
|1.|**Verbosity Parameter**|Lets you hint the model to be more or less expansive in its replies. Keep prompts stable and use the parameter instead of re-writing.|• **low** → terse UX, minimal prose.
• **medium***(default)* → balanced detail.
• **high** → verbose, great for audits, teaching, or hand-offs.|
|2.|**Freeform Function Calling**|Generate raw text payloads—anything from Python scripts to SQL queries—directly to your custom tool without JSON wrapping. Offers greater flexibility for external runtimes like:
• Code sandboxes (Python, C++, Java, …)
• SQL databases
• Shell environments
• Config generators|Use when structured JSON isn’t needed and raw text is more natural for the target tool.|
|3.|**Context-Free Grammar (CFG)**|A set of production rules defining valid strings in a language. Each rule rewrites a non-terminal into terminals and/or other non-terminals, independent of surrounding context. Useful for constraining output to match the syntax of programming languages or custom formats in OpenAI tools.|Use as a contract to ensure the model emits only valid strings accepted by the grammar.|
|4.|**Minimal Reasoning**|Runs GPT-5 with few or no reasoning tokens to minimize latency and speed time-to-first-token. Ideal for deterministic, lightweight tasks (extraction, formatting, short rewrites, simple classification) where explanations aren’t needed. If not specified, effort defaults to medium.|Set reasoning effort: “minimal”. Avoid for multi-step planning or tool-heavy workflows.|
**Supported Models:**
* gpt-5
* gpt-5-mini
* gpt-5-nano
**Supported API Endpoints**
* Responses API
* Chat Completions API
Note: We recommend to use Responses API with GPT-5 series of model to get the most performance out of the models.
## Prerequisites
Let’s begin with updating your OpenAI SDK that supports the new params and tools for GPT-5. Make sure you’ve set OPENAI\_API\_KEY as an environment variable.
```
`!pip install --quiet --upgrade openai pandas && \\
echo -n "openai " && pip show openai | grep '^Version:' | cut -d' ' -f2 && \\
echo -n "pandas " && pip show pandas | grep '^Version:' | cut -d' ' -f2`
```
```
`openai 1.99.2
pandas 2.3.1`
```
## 1. Verbosity Parameter
### 1.1 Overview
The verbosity parameter lets you hint the model to be more or less expansive in its replies.
**Values:** “low”, “medium”, “high”
* low → terse UX, minimal prose.
* medium (default) → balanced detail.
* high → verbose, great for audits, teaching, or hand-offs.
Keep prompts stable and use the param rather than re-writing.
```
`from openai import OpenAI
import pandas as pd
from IPython.display import display
client = OpenAI()
question = "Write a poem about a boy and his first pet dog."
data = []
for verbosity in ["low", "medium", "high"]:
response = client.responses.create(
model="gpt-5-mini",
input=question,
text={"verbosity": verbosity}
)
# Extract text
output\_text = ""
for item in response.output:
if hasattr(item, "content"):
for content in item.content:
if hasattr(content, "text"):
output\_text += content.text
usage = response.usage
data.append({
"Verbosity": verbosity,
"Sample Output": output\_text,
"Output Tokens": usage.output\_tokens
})
# Create DataFrame
df = pd.DataFrame(data)
# Display nicely with centered headers
pd.set\_option('display.max\_colwidth', None)
styled\_df = df.style.set\_table\_styles(
[
{'selector': 'th', 'props': [('text-align', 'center')]}, # Center column headers
{'selector': 'td', 'props': [('text-align', 'left')]} # Left-align table cells
]
)
display(styled\_df)`
```
| |Verbosity|Sample Output|Output Tokens|
|0|low|He found a scruff of fur behind the shed one spring afternoon,
a heartbeat small and fast beneath a coat of dust and light.
The world shrank to two—mud on sneakers, a wag, a clumsy tune—
names rolled off his tongue like marbles, simple, sure, and bright.
They learned the map of each other’s hands: the scratch beneath the ear,
the way a storm could change the shape of brave into a shake.
Mornings were for toast and sunlight, afternoons for running near
the riverbank where leaves applauded every leap they’d take.
At night they shared a blanket and the secret of the dark,
the boy with whispered stories, the dog with steady breath.
Years braided into footprints—first skinned knees, then a spark
of barnyard gray upon a muzzle, slow and gentle as a wreath.
When time unlatched its gates, the boy still carried small things:
a collar, a chewed shoe, the echo of a bark that taught him how to hope.
He learned that love can look like leaving crumbs of ordinary kings,
and that some firsts fit in your pockets long after they have gone.
|560|
|1|medium|He found him folded in the crook of a cardboard box,
a tiny ribcage hitching like a thought.
The boy had pockets full of pennies and promises;
the dog had eyes like two small questions.
They learned names together — the boy said one,
the dog tilted his head and accepted it.
Mornings were clumsy lessons: leash in hand,
the dog discovering sidewalks with a sneeze of wonder,
the boy discovering courage at the end of a rope.
They chased afternoons into puddles,
mud kissing the boy’s knees and the dog’s whiskers.
The dog taught him how to throw sticks that never came back
and how to forgive them when they didn’t.
Evenings were for quiet conspiracies:
the dog’s breath a warm punctuation
against the boy’s ankle as the sky grew blue-black.
Homework became a small island between their worlds,
a pencil, a pat, the faithful presence of paws on carpet.
The dog learned how to sit for apples,
how to hide a cold nose under a blanket of fingers.
The boy learned how to stitch up a torn stuffed bear,
how to say sorry and mean it.
There were days of thunder when the boy’s knees knocked,
and the dog, all stern responsibility, pressed his head
into the hollow of the boy’s fear and held it there
as if he could anchor lightning with his chin.
They practiced being brave together: doors opened for new schools,
new roads, a first bike without training wheels,
the dog a steady metronome of tail and warmth,
never asking to be anything but present.
Seasons unraveled the way they always do.
Snow came to lay white questions across the yard;
summer stretched its lazy hands and left grass bleaching in August.
The boy grew taller and later, the dog moved slower,
but in late afternoons they still shared the same light —
a private currency of sun and shadow.
When the boy learned the language of goodbyes,
it was the dog who taught him how to soften them.
A last look, a lingering hand across the coat,
and a promise that out of all the small ordinary days
something invincible had been braided:
two hearts, a leash, a map of pawprints on the threshold.
Years later, the boy — now grown — tucks a photograph
into his coat pocket. He feels the hollow
where a warm head used to rest and smiles.
Some bonds refuse to be folded away.
In the quiet hum of rememberings,
he can still hear a collar’s jingle and a small, glad bark:
first home, first friend, first forever.
|849|
|2|high|The day the boy met his dog the world grew wider—
a small breath of fur and a damp, earnest nose
pressed like a secret against his palm.
They stood on the porch and the sun tilted curious,
as if the sky had come to see how two new things
might fit together.
He named him after a comic-strip hero,
or maybe he didn’t name him at all at first,
just laughed and let the sound of it become a name.
They learned each other’s weight: the dog’s heavy joy,
the boy’s thin, cautious fingers turning into hands
that could hold a leaping heart steady.
Mornings became a chorus of paws and cereal,
of a collar’s jingle and the scrape of a chair.
Homework survived only when the dog approved;
math problems were beneath a wagging tail,
spelling tests punctuated by a slobbering vowel.
They hid secrets under the bed, between dust bunnies,
and shared the small, perfect conspiracy of being alive.
Afternoons were a map of adventures: the cracked sidewalk,
the river that smelled like stones and moss, the hill
where the wind felt like permission to run.
The dog learned to fetch sticks and forgotten courage,
and the boy learned that bravery could be soft
as a warm head on a lap, or loud as a bark that scares away thunder.
Summer taught them both how long the day could be.
They chased shadows and each other, made small rules:
no digging in the tulips, no chasing the mailman,
except that the tulips never stood a chance.
The boy’s knees collected stories—scrapes that healed,
dirt that stained his socks but not his smile.
The dog’s ears learned the cadence of the boy’s breath,
the way it tipped into sleep like a boat finding harbor.
Years folded like worn pages. The boy got taller,
his voice snagged on words he used to swallow.
School took afternoons; friends took phone numbers.
Still, the dog found ways to be a country in which the boy could disappear
and always be found again—on the porch, by the back door,
where a tail thumped the rhythm of home.
Time comes like winter in slow increments.
The dog’s muzzle silvered; his steps remembered caution.
He stopped fitting into the spaces he once owned
and learned to ask for rest. The boy—no longer quite a boy—
sat longer, tracing the map of every scar and whiskered gray.
There were nights when the dog’s breathing was a thin, honest drum,
and the boy pressed his forehead to the dog’s and said things out loud:
I am here. You were right. You showed me how.
The last morning was quiet in the way that endings often are:
a light that does not need to hurry, a sky that keeps its blue.
Hands that had once been small bore the weight of goodbye,
and the dog, who had taught him everything about leaving,
went gentle as a story closing.
They buried a bone under the apple tree, where shade remembered them.
At dusk the boy—grown, with work-worn hands and a child’s memory—
watches the place where grass leans toward the earth and listens.
Once, when the house was exactly the same and yet not,
he swore he heard a soft, familiar jangle in the kitchen,
a rhythm of steps padding toward the door.
For a beat the world tilted back to the way it had been:
porch light, collar, laughter spilling like coins into a pocket.
Years will teach you how to be without the body of what you loved,
but they cannot unteach the shape of its love.
In small things he carries the dog—an old ball behind the shed,
the smell of rain when it hits hot dust, the way loyalty sits
like a warm stone under the ribs. Sometimes, at night,
he still calls out a name the way you call to the ocean:
to feel a voice come back, immediate and soft,
and remember the simple miracle of being chosen.
A first dog is a first map of how to love:
fur on your sleeve, the sound of feet that always come home.
He taught a boy how to stand steady under weather,
how to be brave by being kind, and how to keep a place warm.
If you listen, sometimes the past still answers,
with a jingle, a wag, and the echo of a small, perfect breath.
|1288|
The output tokens scale roughly linearly with verbosity: low (560) → medium (849) → high (1288).
### 2.3 Using Verbosity for Coding Use Cases
The verbosity parameter also influences the length and complexity of generated code, as well as the depth of accompanying explanations. Here’s an example, wherein we use various verboisty levels for a task to generate a Python program that sorts an array of 1000000 random numbers.
```
`from openai import OpenAI
client = OpenAI()
prompt = "Output a Python program that sorts an array of 1000000 random numbers"
def ask\_with\_verbosity(verbosity: str, question: str):
response = client.responses.create(
model="gpt-5-mini",
input=question,
text={
"verbosity": verbosity
}
)
# Extract assistant's text output
output\_text = ""
for item in response.output:
if hasattr(item, "content"):
for content in item.content:
if hasattr(content, "text"):
output\_text += content.text
# Token usage details
usage = response.usage
print("--------------------------------")
print(f"Verbosity: {verbosity}")
print("Output:")
print(output\_text)
print("Tokens =\> input: {} | output: {}".format(
usage.input\_tokens, usage.output\_tokens
))
# Example usage:
ask\_with\_verbosity("low", prompt)`
```
```
`--------------------------------
Verbosity: low
Output:
```python
#!/usr/bin/env python3
import random
import time
def main():
N = 1\_000\_000
arr = [random.random() for \_ in range(N)]
t0 = time.perf\_counter()
arr.sort()
t1 = time.perf\_counter()
print(f"Sorted {N} numbers in {t1 - t0:.4f} seconds")
print("First 10:", arr[:10])
print("Last 10:", arr[-10:])
if \_\_name\_\_ == "\_\_main\_\_":
main()
```
Tokens =\> input: 21 | output: 575`
```
Notice that the code output is a plain script. Now, lets run with ‘medium’
```
`ask\_with\_verbosity("medium", prompt)`
```
```
`--------------------------------
Verbosity: medium
Output:
Here's a simple Python script that generates 1,000,000 random numbers, sorts them using the built-in Timsort, and reports timings and a small sample of the sorted output:
```python
#!/usr/bin/env python3
import random
import time
def main():
N = 1\_000\_000
random.seed(42) # remove or change for different runs
t0 = time.perf\_counter()
data = [random.random() for \_ in range(N)]
t1 = time.perf\_counter()
data.sort()
t2 = time.perf\_counter()
# Basic verification and sample output
is\_sorted = all(data[i] \<= data[i+1] for i in range(len(data)-1))
print(f"Generated {N} random numbers in {t1 - t0:.3f} seconds")
print(f"Sorted in {t2 - t1:.3f} seconds")
print("Sorted check:", is\_sorted)
print("First 10 values:", data[:10])
print("Last 10 values:", data[-10:])
if \_\_name\_\_ == "\_\_main\_\_":
main()
```
Notes:
- This uses Python's built-in list sort (Timsort), which is efficient for general-purpose sorting.
- If you need more memory- and performance-efficient numeric operations on large arrays, consider using NumPy (numpy.random.random and numpy.sort).
Tokens =\> input: 21 | output: 943`
```
Medium verboisty, generated richer code with additioanl explanations. Let’s do the same with high.
```
`ask\_with\_verbosity("high", prompt)`
```
```
`--------------------------------
Verbosity: high
Output:
Here's a single, self-contained Python program that generates 1,000,000 random numbers and sorts them. It supports two backends: the built-in Python list sort (Timsort) and NumPy (if you have NumPy installed). It measures and prints the time taken for generation, sorting, and verification.
Copy the code into a file (for example sort\_random.py) and run it. By default it uses the pure Python backend; pass --backend numpy to use NumPy.
Note: Sorting a million Python floats uses a moderate amount of memory (Python floats and list overhead). NumPy will typically be faster and use less overhead but requires the numpy package.
Program:
import time
import random
import argparse
import sys
def is\_sorted\_list(a):
# Linear check for sortedness
return all(a[i] \<= a[i+1] for i in range(len(a)-1))
def main():
parser = argparse.ArgumentParser(description="Generate and sort random numbers.")
parser.add\_argument("--n", type=int, default=1\_000\_000, help="Number of random numbers (default: 1,000,000)")
parser.add\_argument("--backend", choices=["python", "numpy"], default="python",
help="Sorting backend to use: 'python' (default) or 'numpy'")
parser.add\_argument("--seed", type=int, default=0, help="Random seed (default: 0)")
parser.add\_argument("--sample", type=int, default=10, help="How many sample elements to print (default: 10)")
args = parser.parse\_args()
n = args.n
backend = args.backend
seed = args.seed
sample = args.sample
print(f"Generating {n:,} random numbers using backend: {backend!r}, seed={seed}")
random.seed(seed)
if backend == "python":
# Generate list of floats in Python
t0 = time.perf\_counter()
data = [random.random() for \_ in range(n)]
t1 = time.perf\_counter()
gen\_time = t1 - t0
print(f"Generated {n:,} numbers in {gen\_time:.4f} s")
if sample \> 0:
print("Sample before sort:", data[:sample])
# Sort in-place
t0 = time.perf\_counter()
data.sort()
t1 = time.perf\_counter()
sort\_time = t1 - t0
print(f"Sorted {n:,} numbers in {sort\_time:.4f} s (Python list.sort)")
if sample \> 0:
print("Sample after sort: ", data[:sample])
# Verify sortedness
t0 = time.perf\_counter()
ok = is\_sorted\_list(data)
t1 = time.perf\_counter()
verify\_time = t1 - t0
print(f"Verified sortedness in {verify\_time:.4f} s -\> {'OK' if ok else 'NOT SORTED'}")
else: # numpy backend
try:
import numpy as np
except ImportError:
print("NumPy is not installed. Install it with 'pip install numpy' or use the python backend.")
sys.exit(1)
# Use the new Generator API for reproducible generation
rng = np.random.default\_rng(seed)
t0 = time.perf\_counter()
data = rng.random(n) # numpy array of floats
t1 = time.perf\_counter()
gen\_time = t1 - t0
print(f"Generated {n:,} numbers in {gen\_time:.4f} s (NumPy)")
if sample \> 0:
print("Sample before sort:", data[:sample])
# Sort in-place using NumPy's sort
t0 = time.perf\_counter()
data.sort() # in-place quicksort/mergesort (NumPy chooses default)
t1 = time.perf\_counter()
sort\_time = t1 - t0
print(f"Sorted {n:,} numbers in {sort\_time:.4f} s (NumPy sort)")
if sample \> 0:
print("Sample after sort: ", data[:sample])
# Verify sortedness
t0 = time.perf\_counter()
ok = np.all(np.diff(data) \>= 0)
t1 = time.perf\_counter()
verify\_time = t1 - t0
print(f"Verified sortedness in {verify\_time:.4f} s -\> {'OK' if ok else 'NOT SORTED'}")
print("Done.")
if \_\_name\_\_ == "\_\_main\_\_":
main()
Usage examples:
- Pure Python (default):
python sort\_random.py
- NumPy backend (if installed):
python sort\_random.py --backend numpy
- Use a different size:
python sort\_random.py --n 500000
Notes and tips:
- Pure Python uses random.random in a list comprehension, then list.sort(). Sorting a list of 1,000,000 Python floats is quite feasible but uses more memory than a NumPy array because of Python object overhead.
- NumPy's random generation and sorting are implemented in C and are typically much faster and more memory efficient for large numeric arrays.
- You can change the seed to get different random sequences, or omit seed for non-deterministic results.
- If you plan to sort data that doesn't fit in memory, consider external sorting approaches (merge sort with chunking to disk) or use specialized libraries.
Tokens =\> input: 21 | output: 2381`
```
High verbosity yielded additional details and explanations.
### 1.3 Takeaways
The new verbosity parameter reliably scales both the length and depth of the model’s output while preserving correctness and reasoning quality - **without changing the underlying prompt**.
In this example:
* **Low verbosity** produces a minimal, functional script with no extra comments or structure.
* **Medium verbosity** adds explanatory comments, function structure, and reproducibility controls.
* **High verbosity** yields a comprehensive, production-ready script with argument parsing, multiple sorting methods, timing/verification, usage notes, and best-practice tips.
## 2. Free‑Form Function Calling
### 2.1 Overview
GPT‑5 can now send raw text payloads - anything from Python scripts to SQL queries - to your custom tool without wrapping the data in JSON using the new tool `"type": "custom"`. This differs from classic structured function calls, giving you greater flexibility when interacting with external runtimes such as:
* code\_exec with sandboxes (Python, C++, Java, …)
* SQL databases
* Shell environments
* Configuration generators
**Note that custom tool type does NOT support parallel tool calling.**
### 2.2 Quick Start Example - Compute the Area of a Circle
The code below produces a simple python code to calculate area of a circle, and instruct the model to use the freeform tool call to output the result.
```
`from openai import OpenAI
client = OpenAI()
response = client.responses.create(
model="gpt-5-mini",
input="Please use the code\_exec tool to calculate the area of a circle with radius equal to the number of 'r's in strawberry",
text={"format": {"type": "text"}},
tools=[
{
"type": "custom",
"name": "code\_exec",
"description": "Executes arbitrary python code",
}
]
)
print(response.output)`
```
```
`[ResponseReasoningItem(id='rs\_6894e31b1f8081999d18325e5aeffcfe0861a2e1728d1664', summary=[], type='reasoning', content=[], encrypted\_content=None, status=None), ResponseCustomToolCall(call\_id='call\_Gnqod2MwPvayp2JdNyA0z0Ah', input='# Counting \\'r\\'s in the word "strawberry" and computing circle area with that radius\\nimport math\\nr = "strawberry".count(\\'r\\')\\narea = math.pi \* r\*\*2\\n{"radius": r, "area": area, "area\_exact": f"{r}\*pi"}', name='code\_exec', type='custom\_tool\_call', id='ctc\_6894e31c66f08199abd622bb5ac3c4260861a2e1728d1664', status='completed')]`
```
The model emits a `tool call` containing raw Python. You execute that code server‑side, capture the printed result, and send it back in a follow‑up responses.create call.
### 2.3 Mini‑Benchmark – Sorting an Array in Three Languages
To illustrate the use of free form tool calling, we will ask GPT‑5 to:
* Generate Python, C++, and Java code that sorts a fixed array 10 times.
* Print only the time (in ms) taken for each iteration in the code.
* Call all three functions, and then stop
```
`from openai import OpenAI
from typing import List, Optional
MODEL\_NAME = "gpt-5"
# Tools that will be passed to every model invocation. They are defined once so
# that the configuration lives in a single place.
TOOLS = [
{
"type": "custom",
"name": "code\_exec\_python",
"description": "Executes python code",
},
{
"type": "custom",
"name": "code\_exec\_cpp",
"description": "Executes c++ code",
},
{
"type": "custom",
"name": "code\_exec\_java",
"description": "Executes java code",
},
]
client = OpenAI()
def create\_response(
input\_messages: List[dict],
previous\_response\_id: Optional[str] = None,
):
"""Wrapper around ``client.responses.create``.
Parameters
----------
input\_messages: List[dict]
The running conversation history to feed to the model.
previous\_response\_id: str | None
Pass the ``response.id`` from the \*previous\* call so the model can keep
the thread of the conversation. Omit on the very first request.
"""
kwargs = {
"model": MODEL\_NAME,
"input": input\_messages,
"text": {"format": {"type": "text"}},
"tools": TOOLS,
}
if previous\_response\_id:
kwargs["previous\_response\_id"] = previous\_response\_id
return client.responses.create(\*\*kwargs)
# Recursive
def run\_conversation(
input\_messages: List[dict],
previous\_response\_id: Optional[str] = None,
):
response = create\_response(input\_messages, previous\_response\_id)
# ``response.output`` is expected to be a list where element 0 is the model
# message. Element 1 (if present) denotes a tool call. When the model is
# done with tool calls, that element is omitted.
tool\_call = response.output[1] if len(response.output) \> 1 else None
if tool\_call and tool\_call.type == "custom\_tool\_call":
print("--- tool name ---")
print(tool\_call.name)
print("--- tool call argument (generated code) ---")
print(tool\_call.input)
# Add a synthetic \*tool result\* so the model can continue the thread.
input\_messages.append(
{
"type": "function\_call\_output",
"call\_id": tool\_call.call\_id,
"output": "done", # \<-- replace with the result of the tool call
}
)
# Recurse with updated conversation and track the response id so the
# model is aware of the prior turn.
return run\_conversation(input\_messages, previous\_response\_id=response.id)
else:
# Base-case: no further tool call - return.
return
prompt = """
Write code to sort the array of numbers in three languages: C++, Python and Java (10 times each)using code\_exec functions.
ALWAYS CALL THESE THREE FUNCTIONS EXACTLY ONCE: code\_exec\_python, code\_exec\_cpp and code\_exec\_java tools to sort the array in each language. Stop once you've called these three functions in each language once.
Print only the time it takes to sort the array in milliseconds.
[448, 986, 255, 884, 632, 623, 246, 439, 936, 925, 644, 159, 777, 986, 706, 723, 534, 862, 195, 686, 846, 880, 970, 276, 613, 736, 329, 622, 870, 284, 945, 708, 267, 327, 678, 807, 687, 890, 907, 645, 364, 333, 385, 262, 730, 603, 945, 358, 923, 930, 761, 504, 870, 561, 517, 928, 994, 949, 233, 137, 670, 555, 149, 870, 997, 809, 180, 498, 914, 508, 411, 378, 394, 368, 766, 486, 757, 319, 338, 159, 585, 934, 654, 194, 542, 188, 934, 163, 889, 736, 792, 737, 667, 772, 198, 971, 459, 402, 989, 949]
"""
# Initial developer message.
messages = [
{
"role": "developer",
"content": prompt,
}
]
run\_conversation(messages)`
```
```
`--- tool name ---
code\_exec\_python
--- tool call argument (generated code) ---
import time
arr = [448, 986, 255, 884, 632, 623, 246, 439, 936, 925, 644, 159, 777, 986, 706, 723, 534, 862, 195, 686, 846, 880, 970, 276, 613, 736, 329, 622, 870, 284, 945, 708, 267, 327, 678, 807, 687, 890, 907, 645, 364, 333, 385, 262, 730, 603, 945, 358, 923, 930, 761, 504, 870, 561, 517, 928, 994, 949, 233, 137, 670, 555, 149, 870, 997, 809, 180, 498, 914, 508, 411, 378, 394, 368, 766, 486, 757, 319, 338, 159, 585, 934, 654, 194, 542, 188, 934, 163, 889, 736, 792, 737, 667, 772, 198, 971, 459, 402, 989, 949]
start = time.perf\_counter()
for \_ in range(10):
b = arr[:] # copy
b.sort()
elapsed\_ms = int((time.perf\_counter() - start) \* 1000)
print(elapsed\_ms, end="")
--- tool name ---
code\_exec\_cpp
--- tool call argument (generated code) ---
#include \<iostream\>
#include \<vector\>
#include \<algorithm\>
#include \<chrono\>
using namespace std;
int main() {
vector\<int\> a = {448, 986, 255, 884, 632, 623, 246, 439, 936, 925, 644, 159, 777, 986, 706, 723, 534, 862, 195, 686, 846, 880, 970, 276, 613, 736, 329, 622, 870, 284, 945, 708, 267, 327, 678, 807, 687, 890, 907, 645, 364, 333, 385, 262, 730, 603, 945, 358, 923, 930, 761, 504, 870, 561, 517, 928, 994, 949, 233, 137, 670, 555, 149, 870, 997, 809, 180, 498, 914, 508, 411, 378, 394, 368, 766, 486, 757, 319, 338, 159, 585, 934, 654, 194, 542, 188, 934, 163, 889, 736, 792, 737, 667, 772, 198, 971, 459, 402, 989, 949};
auto start = chrono::high\_resolution\_clock::now();
for (int i = 0; i \< 10; ++i) {
auto b = a;
sort(b.begin(), b.end());
}
auto end = chrono::high\_resolution\_clock::now();
auto ms = chrono::duration\_cast\<chrono::milliseconds\>(end - start).count();
cout \<\< ms;
return 0;
}
--- tool name ---
code\_exec\_java
--- tool call argument (generated code) ---
import java.util.\*;
public class Main {
public static void main(String[] args) {
int[] a = new int[] {448, 986, 255, 884, 632, 623, 246, 439, 936, 925, 644, 159, 777, 986, 706, 723, 534, 862, 195, 686, 846, 880, 970, 276, 613, 736, 329, 622, 870, 284, 945, 708, 267, 327, 678, 807, 687, 890, 907, 645, 364, 333, 385, 262, 730, 603, 945, 358, 923, 930, 761, 504, 870, 561, 517, 928, 994, 949, 233, 137, 670, 555, 149, 870, 997, 809, 180, 498, 914, 508, 411, 378, 394, 368, 766, 486, 757, 319, 338, 159, 585, 934, 654, 194, 542, 188, 934, 163, 889, 736, 792, 737, 667, 772, 198, 971, 459, 402, 989, 949};
long start = System.nanoTime();
for (int i = 0; i \< 10; i++) {
int[] b = Arrays.copyOf(a, a.length);
Arrays.sort(b);
}
long elapsedMs = (System.nanoTime() - start) / 1\_000\_000L;
System.out.print(elapsedMs);
}
}`
```
The model output three code blocks in Python, C++ and Java for the same algorithm. The output of the function call was chained back into the model as input to allow model to keep going until all the functions have been called exactly once.
### 2.4 Takeaways
Freeform tool calling in GPT-5 lets you send raw text payloads—such as Python scripts, SQL queries, or config files—directly to custom tools without JSON wrapping. This provides greater flexibility for interacting with external runtimes and allows the model to generate code or text in the exact format your tool expects. It’s ideal when structured JSON is unnecessary and natural text output improves usability.
## 3. Context‑Free Grammar (CFG)
### 3.1 Overview
A context‑free grammar is a collection of production rules that define which strings belong to a language. Each rule rewrites a non‑terminal symbol into a sequence of terminals (literal tokens) and/or other non‑terminals, independent of surrounding context—hence context‑free. CFGs can capture the syntax of most programming languages and, in OpenAI custom tools, serve as contracts that force the model to emit only strings that the grammar accepts.
### 3.2 Grammar Fundamentals
**Supported Grammar Syntax**
* Lark - [https://lark-parser.readthedocs.io/en/stable/](https://lark-parser.readthedocs.io/en/stable/)
* Regex - [https://docs.rs/regex/latest/regex/#syntax](https://docs.rs/regex/latest/regex/#syntax)
We use LLGuidance under the hood to constrain model sampling: [https://github.com/guidance-ai/llguidance](https://github.com/guidance-ai/llguidance).
**Unsupported Lark Features**
* Lookaround in regexes (`(?=...)`, `(?!...)`, etc.)
* Lazy modifier (`\*?`, `+?`, `??`) in regexes.
* Terminal priorities, templates, %declares, %import (except %import common).
**Terminals vs Rules & Greedy Lexing**
|Concept|Take-away|
|Terminals (UPPER)|Matched first by the lexer – longest match wins.|
|Rules (lower)|Combine terminals; cannot influence how text is tokenised.|
|Greedy lexer|Never try to “shape” free text across multiple terminals – you’ll lose control.|
**Correct vs Incorrect Pattern Design**
✅ **One bounded terminal handles free‑text between anchors**
```
`start: SENTENCE
SENTENCE: /[A-Za-z, ]\*(the hero|a dragon)[A-Za-z, ]\*(fought|saved)[A-Za-z, ]\*(a treasure|the kingdom)[A-Za-z, ]\*\\./`
```
❌ **Don’t split free‑text across multiple terminals/rules**
```
`start: sentence
sentence: /[A-Za-z, ]+/ subject /[A-Za-z, ]+/ verb /[A-Za-z, ]+/ object /[A-Za-z, ]+/`
```
### 3.3 Example - SQL Dialect — MS SQL vs PostgreSQL
The following code example is now the canonical reference for building multi‑dialect SQL tools with CFGs. It demonstrates:
* Two isolated grammar definitions (`mssql\_grammar\_definition`, `postgres\_grammar\_definition`) encoding TOP vs LIMIT semantics.
* How to prompt, invoke, and inspect tool calls in a single script.
* A side‑by‑side inspection of the assistant’s responses.
Define the LARK grammars for different SQL dialects
```
`import textwrap
# ----------------- grammars for MS SQL dialect -----------------
mssql\_grammar = textwrap.dedent(r"""
// ---------- Punctuation & operators ----------
SP: " "
COMMA: ","
GT: "\>"
EQ: "="
SEMI: ";"
// ---------- Start ----------
start: "SELECT" SP "TOP" SP NUMBER SP select\_list SP "FROM" SP table SP "WHERE" SP amount\_filter SP "AND" SP date\_filter SP "ORDER" SP "BY" SP sort\_cols SEMI
// ---------- Projections ----------
select\_list: column (COMMA SP column)\*
column: IDENTIFIER
// ---------- Tables ----------
table: IDENTIFIER
// ---------- Filters ----------
amount\_filter: "total\_amount" SP GT SP NUMBER
date\_filter: "order\_date" SP GT SP DATE
// ---------- Sorting ----------
sort\_cols: "order\_date" SP "DESC"
// ---------- Terminals ----------
IDENTIFIER: /[A-Za-z\_][A-Za-z0-9\_]\*/
NUMBER: /[0-9]+/
DATE: /'[0-9]{4}-[0-9]{2}-[0-9]{2}'/
""")
# ----------------- grammars for PostgreSQL dialect -----------------
postgres\_grammar = textwrap.dedent(r"""
// ---------- Punctuation & operators ----------
SP: " "
COMMA: ","
GT: "\>"
EQ: "="
SEMI: ";"
// ---------- Start ----------
start: "SELECT" SP select\_list SP "FROM" SP table SP "WHERE" SP amount\_filter SP "AND" SP date\_filter SP "ORDER" SP "BY" SP sort\_cols SP "LIMIT" SP NUMBER SEMI
// ---------- Projections ----------
select\_list: column (COMMA SP column)\*
column: IDENTIFIER
// ---------- Tables ----------
table: IDENTIFIER
// ---------- Filters ----------
amount\_filter: "total\_amount" SP GT SP NUMBER
date\_filter: "order\_date" SP GT SP DATE
// ---------- Sorting ----------
sort\_cols: "order\_date" SP "DESC"
// ---------- Terminals ----------
IDENTIFIER: /[A-Za-z\_][A-Za-z0-9\_]\*/
NUMBER: /[0-9]+/
DATE: /'[0-9]{4}-[0-9]{2}-[0-9]{2}'/
""")`
```
### 3.4 Generate specific SQL dialect
Let’s define the prompt, and call the function to produce MS SQL dialect
```
`from openai import OpenAI
client = OpenAI()
sql\_prompt\_mssql = (
"Call the mssql\_grammar to generate a query for Microsoft SQL Server that retrieve the "
"five most recent orders per customer, showing customer\_id, order\_id, order\_date, and total\_amount, "
"where total\_amount \> 500 and order\_date is after '2025-01-01'. "
)
response\_mssql = client.responses.create(
model="gpt-5",
input=sql\_prompt\_mssql,
text={"format": {"type": "text"}},
tools=[
{
"type": "custom",
"name": "mssql\_grammar",
"description": "Executes read-only Microsoft SQL Server queries limited to SELECT statements with TOP and basic WHERE/ORDER BY. YOU MUST REASON HEAVILY ABOUT THE QUERY AND MAKE SURE IT OBEYS THE GRAMMAR.",
"format": {
"type": "grammar",
"syntax": "lark",
"definition": mssql\_grammar
}
},
],
parallel\_tool\_calls=False
)
print("--- MS SQL Query ---")
print(response\_mssql.output[1].input)`
```
```
`--- MS SQL Query ---
SELECT TOP 5 customer\_id, order\_id, order\_date, total\_amount FROM orders WHERE total\_amount \> 500 AND order\_date \> '2025-01-01' ORDER BY order\_date DESC;`
```
The output SQL accurately uses “SELECT TOP” construct.
```
`sql\_prompt\_pg = (
"Call the postgres\_grammar to generate a query for PostgreSQL that retrieve the "
"five most recent orders per customer, showing customer\_id, order\_id, order\_date, and total\_amount, "
"where total\_amount \> 500 and order\_date is after '2025-01-01'. "
)
response\_pg = client.responses.create(
model="gpt-5",
input=sql\_prompt\_pg,
text={"format": {"type": "text"}},
tools=[
{
"type": "custom",
"name": "postgres\_grammar",
"description": "Executes read-only PostgreSQL queries limited to SELECT statements with LIMIT and basic WHERE/ORDER BY. YOU MUST REASON HEAVILY ABOUT THE QUERY AND MAKE SURE IT OBEYS THE GRAMMAR.",
"format": {
"type": "grammar",
"syntax": "lark",
"definition": postgres\_grammar
}
},
],
parallel\_tool\_calls=False,
)
print("--- PG SQL Query ---")
print(response\_pg.output[1].input)`
```
```
`--- PG SQL Query ---
SELECT customer\_id, order\_id, order\_date, total\_amount FROM orders WHERE total\_amount \> 500 AND order\_date \> '2025-01-01' ORDER BY order\_date DESC LIMIT 5;`
```
Output highlights the same logical query - different physical syntax. Supply distinct grammars so the model can only produce valid statements for the chosen dialect.
|Dialect|Generated Query|Key Difference|
|MS SQL Server|SELECT TOP 5 customer\_id, … ORDER BY order\_date DESC;|Uses `TOP N` clause before column list.|
|PostgreSQL|SELECT customer\_id, … ORDER BY order\_date DESC LIMIT 5;|Uses `LIMIT N` after `ORDER BY`.|
### 3.5 Example - Regex CFG Syntax
The following code example demonstrates using the Regex CFG syntax to constrain the freeform tool call to a certain timestamp pattern.
```
`from openai import OpenAI
client = OpenAI()
timestamp\_grammar\_definition = r"^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]) (?:[01]\\d|2[0-3]):[0-5]\\d$"
timestamp\_prompt = (
"Call the timestamp\_grammar to save a timestamp for August 7th 2025 at 10AM."
)
response\_mssql = client.responses.create(
model="gpt-5",
input=timestamp\_prompt,
text={"format": {"type": "text"}},
tools=[
{
"type": "custom",
"name": "timestamp\_grammar",
"description": "Saves a timestamp in date + time in 24-hr format.",
"format": {
"type": "grammar",
"syntax": "regex",
"definition": timestamp\_grammar\_definition
}
},
],
parallel\_tool\_calls=False
)
print("--- Timestamp ---")
print(response\_mssql.output[1].input)`
```
```
`--- Timestamp ---
2025-08-07 10:00`
```
### 3.5 Best Practices
Lark grammars can be tricky to perfect. While simple grammars perform most reliably, complex grammars often require iteration on the grammar definition itself, the prompt, and the tool description to ensure that the model does not go out of distribution.
* Keep terminals bounded – use `/[^.\\n]{0,10}\*\\./` rather than `/.\*\\./`. Limit matches both by content (negated character class) and by length (`{M,N}` quantifier).
* Prefer explicit char‑classes over `.` wildcards.
* Thread whitespace explicitly, e.g. using `SP = " "`, instead of a global `%ignore`.
* Describe your tool: tell the model exactly what the CFG accepts and instruct it to reason heavily about compliance.
**Troubleshooting**
* API rejects the grammar because it is too complex ➜ Simplify rules and terminals, remove `%ignore.\*`.
* Unexpected tokens ➜ Confirm terminals aren’t overlapping; check greedy lexer.
* When the model drifts “out‑of‑distribution” (shows up as the model producing excessively long or repetitive outputs, it is syntactically valid but is semantically wrong):
* Tighten the grammar.
* Iterate on the prompt (add few-shot examples) and tool description (explain the grammar and instruct the model to reason to conform to it).
* Experiment with a higher reasoning effort (e.g, bump from medium to high).
**Resources:**
* Lark Docs – [https://lark-parser.readthedocs.io/en/stable/](https://lark-parser.readthedocs.io/en/stable/)
* Lark IDE – [https://www.lark-parser.org/ide/](https://www.lark-parser.org/ide/)
* LLGuidance Syntax – [https://github.com/guidance-ai/llguidance/blob/main/docs/syntax.md](https://github.com/guidance-ai/llguidance/blob/main/docs/syntax.md)
* Regex (Rust crate) – [https://docs.rs/regex/latest/regex/#syntax](https://docs.rs/regex/latest/regex/#syntax)
### 3.6 Takeaways
Context-Free Grammar (CFG) support in GPT-5 lets you strictly constrain model output to match predefined syntax, ensuring only valid strings are generated. This is especially useful for enforcing programming language rules or custom formats, reducing post-processing and errors. By providing a precise grammar and clear tool description, you can make the model reliably stay within your target output structure.
## 4. Minimal Reasoning
### 4.1 Overview
GPT-5 now support for a new minimal reasoning effort. When using minimal reasoning effort, the model will output very few or no reasoning tokens. This is designed for use cases where developers want a very fast time-to-first-user-visible token. Note: If no reasoning effort is supplied, the default value is medium.
```
`from openai import OpenAI
client = OpenAI()
prompt = "Classify sentiment of the review as positive|neutral|negative. Return one word only."
response = client.responses.create(
model="gpt-5",
input= [{ 'role': 'developer', 'content': prompt },
{ 'role': 'user', 'content': 'The food that the restaurant was great! I recommend it to everyone.' }],
reasoning = {
"effort": "minimal"
},
)
# Extract model's text output
output\_text = ""
for item in response.output:
if hasattr(item, "content"):
for content in item.content:
if hasattr(content, "text"):
output\_text += content.text
# Token usage details
usage = response.usage
print("--------------------------------")
print("Output:")
print(output\_text)`
```
```
`--------------------------------
Output:
positive`
```
### 4.2 Takeaways
Minimal reasoning runs GPT-5 with few or no reasoning tokens to minimize latency and speed up time-to-first-token. Use it for deterministic, lightweight tasks (extraction, formatting, short rewrites, simple classification) where explanations aren’t needed. If you don’t specify effort, it defaults to medium—set minimal explicitly when you want speed over deliberation.