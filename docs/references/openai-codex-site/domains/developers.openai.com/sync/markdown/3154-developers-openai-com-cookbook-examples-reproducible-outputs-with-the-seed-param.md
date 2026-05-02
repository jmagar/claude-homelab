How to make your completions outputs consistent with the new seed parameter
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
Nov 6, 2023
# How to make your completions outputs consistent with the new seed parameter
[ SA ](https://twitter.com/shyamalanadkat)
[ Shyamal Anadkat
(OpenAI)
](https://twitter.com/shyamalanadkat)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Reproducible_outputs_with_the_seed_parameter.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Reproducible_outputs_with_the_seed_parameter.ipynb)
**TLDR**: Developers can now specify `seed` parameter in the Chat Completion request to receive (mostly) consistent outputs. To help you keep track of these changes, we expose the `system\_fingerprint` field. If this value is different, you may see different outputs due to changes we’ve made on our systems. Please note that this feature is in beta and only currently supported for `gpt-4-1106-preview` and `gpt-3.5-turbo-1106`.
### Context
Reproducibility has always been a big request from user communities when using our APIs. For instance, when granted the capability of getting reproducible numerical result, users can unlock quite a bit of use cases that’s sensitive to numerical changes.
#### Model level features for consistent outputs
The Chat Completions and Completions APIs are non-deterministic by default (which means model outputs may differ from request to request), but now offer some control towards deterministic outputs using a few model level controls.
This can unlock consistent completions which enables full control on the model behaviors for anything built on top of the APIs, and quite useful for reproducing results and testing so you know get peace of mind from knowing exactly what you’d get.
#### Implementing consistent outputs
To receive *mostly* deterministic outputs across API calls:
* Set the `seed` parameter to any integer of your choice, but use the same value across requests. For example, `12345`.
* Set all other parameters (prompt, temperature, top\_p, etc.) to the same values across requests.
* In the response, check the `system\_fingerprint` field. The system fingerprint is an identifier for the current combination of model weights, infrastructure, and other configuration options used by OpenAI servers to generate the completion. It changes whenever you change request parameters, or OpenAI updates numerical configuration of the infrastructure serving our models (which may happen a few times a year).
If the `seed`, request parameters, and `system\_fingerprint` all match across your requests, then model outputs will mostly be identical. There is a small chance that responses differ even when request parameters and `system\_fingerprint` match, due to the inherent non-determinism of our models.
### Model level controls for consistent outputs - `seed` and `system\_fingerprint`
##### `seed`
If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same seed and parameters should return the same result. Determinism is not guaranteed, and you should refer to the `system\_fingerprint` response parameter to monitor changes in the backend.
##### `system\_fingerprint`
This fingerprint represents the backend configuration that the model runs with. It can be used in conjunction with the seed request parameter to understand when backend changes have been made that might impact determinism.This is the indicator on whether users should expect “almost always the same result”.
## Example: Generating a short excerpt with a fixed seed
In this example, we will demonstrate how to generate a short excerpt using a fixed seed. This can be particularly useful in scenarios where you need to generate consistent results for testing, debugging, or for applications that require consistent outputs.
### Python SDK
>
**> Note
**> Switch to latest version of the SDK (
`> 1.3.3
`> at time of writing).
>
```
`!pip install --upgrade openai # Switch to the latest version of OpenAI (1.3.3 at time of writing)`
```
```
`import openai
import asyncio
from IPython.display import display, HTML
from utils.embeddings\_utils import (
get\_embedding,
distances\_from\_embeddings
)
GPT\_MODEL = "gpt-3.5-turbo-1106"`
```
```
`async def get\_chat\_response(
system\_message: str, user\_request: str, seed: int = None, temperature: float = 0.7
):
try:
messages = [
{"role": "system", "content": system\_message},
{"role": "user", "content": user\_request},
]
response = openai.chat.completions.create(
model=GPT\_MODEL,
messages=messages,
seed=seed,
max\_tokens=200,
temperature=temperature,
)
response\_content = response.choices[0].message.content
system\_fingerprint = response.system\_fingerprint
prompt\_tokens = response.usage.prompt\_tokens
completion\_tokens = response.usage.total\_tokens - response.usage.prompt\_tokens
table = f"""
\<table\>
\<tr\>\<th\>Response\</th\>\<td\>{response\_content}\</td\>\</tr\>
\<tr\>\<th\>System Fingerprint\</th\>\<td\>{system\_fingerprint}\</td\>\</tr\>
\<tr\>\<th\>Number of prompt tokens\</th\>\<td\>{prompt\_tokens}\</td\>\</tr\>
\<tr\>\<th\>Number of completion tokens\</th\>\<td\>{completion\_tokens}\</td\>\</tr\>
\</table\>
"""
display(HTML(table))
return response\_content
except Exception as e:
print(f"An error occurred: {e}")
return None
def calculate\_average\_distance(responses):
"""
This function calculates the average distance between the embeddings of the responses.
The distance between embeddings is a measure of how similar the responses are.
"""
# Calculate embeddings for each response
response\_embeddings = [get\_embedding(response) for response in responses]
# Compute distances between the first response and the rest
distances = distances\_from\_embeddings(response\_embeddings[0], response\_embeddings[1:])
# Calculate the average distance
average\_distance = sum(distances) / len(distances)
# Return the average distance
return average\_distance`
```
First, let’s try generating few different versions of a short excerpt about “a journey to Mars” without the `seed` parameter. This is the default behavior:
```
`topic = "a journey to Mars"
system\_message = "You are a helpful assistant."
user\_request = f"Generate a short excerpt of news about {topic}."
responses = []
async def get\_response(i):
print(f'Output {i + 1}\\n{"-" \* 10}')
response = await get\_chat\_response(
system\_message=system\_message, user\_request=user\_request
)
return response
responses = await asyncio.gather(\*[get\_response(i) for i in range(5)])
average\_distance = calculate\_average\_distance(responses)
print(f"The average similarity between responses is: {average\_distance}")`
```
```
`Output 1
----------`
```
|Response|"NASA's Mars mission reaches critical stage as spacecraft successfully enters orbit around the red planet. The historic journey, which began over a year ago, has captured the world's attention as scientists and astronauts prepare to land on Mars for the first time. The mission is expected to provide valuable insights into the planet's geology, atmosphere, and potential for sustaining human life in the future."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|76|
```
`Output 2
----------`
```
|Response|"NASA's Perseverance rover successfully landed on Mars, marking a major milestone in the mission to explore the red planet. The rover is equipped with advanced scientific instruments to search for signs of ancient microbial life and collect samples of rock and soil for future return to Earth. This historic achievement paves the way for further exploration and potential human missions to Mars in the near future."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|76|
```
`Output 3
----------`
```
|Response|"SpaceX successfully launched the first manned mission to Mars yesterday, marking a historic milestone in space exploration. The crew of four astronauts will spend the next six months traveling to the red planet, where they will conduct groundbreaking research and experiments. This mission represents a significant step towards establishing a human presence on Mars and paves the way for future interplanetary travel."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|72|
```
`Output 4
----------`
```
|Response|"NASA's latest Mars mission exceeds expectations as the Perseverance rover uncovers tantalizing clues about the Red Planet's past. Scientists are thrilled by the discovery of ancient riverbeds and sedimentary rocks, raising hopes of finding signs of past life on Mars. With this exciting progress, the dream of sending humans to Mars feels closer than ever before."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|72|
```
`Output 5
----------`
```
|Response|"NASA's Perseverance Rover Successfully Lands on Mars, Begins Exploration Mission
In a historic moment for space exploration, NASA’s Perseverance rover has successfully landed on the surface of Mars. After a seven-month journey, the rover touched down in the Jezero Crater, a location scientists believe may have once held a lake and could potentially contain signs of ancient microbial life.
The rover’s primary mission is to search for evidence of past life on Mars and collect rock and soil samples for future return to Earth. Equipped with advanced scientific instruments, including cameras, spectrometers, and a drill, Perseverance will begin its exploration of the Martian surface, providing valuable data and insights into the planet’s geology and potential habitability.
This successful landing marks a significant milestone in humanity’s quest to understand the red planet and paves the way for future manned missions to Mars. NASA’s Perseverance rover is poised to unravel the mysteries of Mars and unlock new possibilities
|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|200|
```
`The average similarity between responses is: 0.1136714512418833`
```
Now, let’s try to tun the same code with a constant `seed` of 123 and `temperature` of 0 and compare the responses and `system\_fingerprint`.
```
`SEED = 123
responses = []
async def get\_response(i):
print(f'Output {i + 1}\\n{"-" \* 10}')
response = await get\_chat\_response(
system\_message=system\_message,
seed=SEED,
temperature=0,
user\_request=user\_request,
)
return response
responses = await asyncio.gather(\*[get\_response(i) for i in range(5)])
average\_distance = calculate\_average\_distance(responses)
print(f"The average distance between responses is: {average\_distance}")`
```
```
`Output 1
----------`
```
|Response|"NASA's Perseverance Rover Successfully Lands on Mars
In a historic achievement, NASA’s Perseverance rover has successfully landed on the surface of Mars, marking a major milestone in the exploration of the red planet. The rover, which traveled over 293 million miles from Earth, is equipped with state-of-the-art instruments designed to search for signs of ancient microbial life and collect rock and soil samples for future return to Earth. This mission represents a significant step forward in our understanding of Mars and the potential for human exploration of the planet in the future.”
|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|113|
```
`Output 2
----------`
```
|Response|"NASA's Perseverance rover successfully lands on Mars, marking a historic milestone in space exploration. The rover is equipped with advanced scientific instruments to search for signs of ancient microbial life and collect samples for future return to Earth. This mission paves the way for future human exploration of the red planet, as scientists and engineers continue to push the boundaries of space travel and expand our understanding of the universe."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|81|
```
`Output 3
----------`
```
|Response|"NASA's Perseverance rover successfully lands on Mars, marking a historic milestone in space exploration. The rover is equipped with advanced scientific instruments to search for signs of ancient microbial life and collect samples for future return to Earth. This mission paves the way for future human exploration of the red planet, as NASA continues to push the boundaries of space exploration."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|72|
```
`Output 4
----------`
```
|Response|"NASA's Perseverance rover successfully lands on Mars, marking a historic milestone in space exploration. The rover is equipped with advanced scientific instruments to search for signs of ancient microbial life and collect samples for future return to Earth. This mission paves the way for future human exploration of the red planet, as scientists and engineers continue to push the boundaries of space travel and expand our understanding of the universe."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|81|
```
`Output 5
----------`
```
|Response|"NASA's Perseverance rover successfully lands on Mars, marking a historic milestone in space exploration. The rover is equipped with advanced scientific instruments to search for signs of ancient microbial life and collect samples for future return to Earth. This mission paves the way for future human exploration of the red planet, as scientists and engineers continue to push the boundaries of space travel."|
|System Fingerprint|fp\_772e8125bb|
|Number of prompt tokens|29|
|Number of completion tokens|74|
```
`The average distance between responses is: 0.0449054397632461`
```
As we can observe, the `seed` parameter allows us to generate much more consistent results.
## Conclusion
We demonstrated how to use a fixed integer `seed` to generate consistent outputs from our model. This is particularly useful in scenarios where reproducibility is important. However, it’s important to note that while the `seed` ensures consistency, it does not guarantee the quality of the output. Note that when you want to use reproducible outputs, you need to set the `seed` to the same integer across Chat Completions calls. You should also match any other parameters like `temperature`, `max\_tokens` etc. Further extension of reproducible outputs could be to use consistent `seed` when benchmarking/evaluating the performance of different prompts or models, to ensure that each version is evaluated under the same conditions, making the comparisons fair and the results reliable.