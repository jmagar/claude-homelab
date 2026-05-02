Using Evals API on Audio Inputs
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
Aug 13, 2025
# Using Evals API on Audio Inputs
[ TH ](https://www.linkedin.com/in/todd-hendry-962aa577/)
[ Todd Hendry ](https://www.linkedin.com/in/todd-hendry-962aa577/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/EvalsAPI_Audio_Inputs.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/EvalsAPI_Audio_Inputs.ipynb)
This cookbook demonstrates how to use OpenAI’s Evals framework for audio-based tasks. Leveraging the Evals API, we will grade model-generated responses to an audio message and prompt by using **sampling** to generate model responses and **model grading** to score the model responses against the output audio and reference answer. Note that grading will be on audio outputs from the sampled response.
Before audio support was added, to evaluate audio conversations, they first needed to be transcribed to text. Now you can use the original audio and get samples from the model in audio as well. This more accurately represents workflows such as a customer support scenario where both the user and the agent are using audio. For grading, we will use an audio model to grade the audio response with a model grader. We could alternatively, or in combination, use the text transcript from the sampled audio and leverage the existing suite of text graders.
In this example, we will evaluate how well our model can:
1. **Generate appropriate responses** to user prompts about an audio message
2. **Align with reference answers** that represent high-quality responses
## Installing Dependencies + Setup
```
`# Install required packages
%pip install openai datasets pandas soundfile torch torchcodec pydub jiwer --quiet`
```
```
`# Import libraries
from datasets import load\_dataset, Audio
from openai import OpenAI
import base64
import os
import json
import time
import io
import soundfile as sf
import numpy as np
import pandas as pd`
```
## Dataset Preparation
We use the [big\_bench\_audio](https://huggingface.co/datasets/ArtificialAnalysis/big_bench_audio) dataset that is hosted on Hugging Face. Big Bench Audio is an audio version of a subset of Big Bench Hard questions. The dataset can be used for evaluating the reasoning capabilities of models that support audio input. It contains an audio clip describing a logic problem, a category, and an official answer.
```
`dataset = load\_dataset("ArtificialAnalysis/big\_bench\_audio")
# Ensure audio column is decoded into a dict with 'array' and 'sampling\_rate'
dataset = dataset.cast\_column("audio", Audio(decode=True))`
```
We extract the relevant fields and put them in a JSON-like format to pass in as a data source in the Evals API. Input audio data must be in the form of a base64-encoded string. We process the data in the audio file and convert it to base64.
Note: Audio models currently support WAV, MP3, FLAC, Opus, or PCM16 formats. See [audio inputs](https://platform.openai.com/docs/api-reference/chat/create#chat_create-audio) for details.
```
`# Audio helpers: file/array to base64
def get\_base64(audio\_path\_or\_datauri: str) -\> str:
if audio\_path\_or\_datauri.startswith("data:"):
# Already base64, just strip prefix
return audio\_path\_or\_datauri.split(",", 1)[1]
else:
# It's a real file path
with open(audio\_path\_or\_datauri, "rb") as f:
return base64.b64encode(f.read()).decode("ascii")
def audio\_to\_base64(audio\_val) -\> str:
"""
Accepts various Hugging Face audio representations and returns base64-encoded WAV bytes (no data: prefix).
Handles:
- dict or mapping-like with 'path'
- decoded dict with 'array' and 'sampling\_rate'
- torchcodec AudioDecoder (mapping-like access via ['path'] or ['array'])
- raw bytes
"""
# Try to get a file path first
try:
path = None
if isinstance(audio\_val, dict) and "path" in audio\_val:
path = audio\_val["path"]
else:
# Mapping-like access
try:
path = audio\_val["path"] # works for many decoder objects
except Exception:
path = getattr(audio\_val, "path", None)
if isinstance(path, str) and os.path.exists(path):
with open(path, "rb") as f:
return base64.b64encode(f.read()).decode("ascii")
except Exception:
pass
# Fallback: use array + sampling\_rate and render to WAV in-memory
try:
array = None
sampling\_rate = None
try:
array = audio\_val["array"]
sampling\_rate = audio\_val["sampling\_rate"]
except Exception:
array = getattr(audio\_val, "array", None)
sampling\_rate = getattr(audio\_val, "sampling\_rate", None)
if array is not None and sampling\_rate is not None:
audio\_np = np.array(array)
buf = io.BytesIO()
sf.write(buf, audio\_np, int(sampling\_rate), format="WAV")
return base64.b64encode(buf.getvalue()).decode("ascii")
except Exception:
pass
if isinstance(audio\_val, (bytes, bytearray)):
return base64.b64encode(audio\_val).decode("ascii")
raise ValueError("Unsupported audio value; could not convert to base64")`
```
```
`evals\_data\_source = []
audio\_base64 = None
# Will use the first 3 examples for testing
for example in dataset["train"].select(range(3)):
audio\_val = example["audio"]
try:
audio\_base64 = audio\_to\_base64(audio\_val)
except Exception as e:
print(f"Warning: could not encode audio for id={example['id']}: {e}")
audio\_base64 = None
evals\_data\_source.append({
"item": {
"id": example["id"],
"category": example["category"],
"official\_answer": example["official\_answer"],
"audio\_base64": audio\_base64
}
})`
```
If you print the data source list, each item should be of a similar form to:
```
`{
"item": {
"id": 0
"category": "formal\_fallacies"
"official\_answer": "invalid"
"audio\_base64": "UklGRjrODwBXQVZFZm10IBAAAAABAAEAIlYAAESsA..."
}
}`
```
## Eval Configuration
Now that we have our data source and task, we will create our evals. For the OpenAI Evals API docs, visit [API docs](https://platform.openai.com/docs/guides/evals).
```
`client = OpenAI(
api\_key=os.getenv("OPENAI\_API\_KEY")
)`
```
Since audio inputs are large, we need to save the examples to a file and upload it to the API.
```
`# Save the examples to a file
file\_name = "evals\_data\_source.json"
with open(file\_name, "w", encoding="utf-8") as f:
for obj in evals\_data\_source:
f.write(json.dumps(obj, ensure\_ascii=False) + "\\n")
# Upload the file to the API
file = client.files.create(
file=open(file\_name, "rb"),
purpose="evals"
)`
```
Evals have two parts: the “Eval” and the “Run”. In the “Eval” we define the expected structure of the data and the testing criteria (grader).
### Data Source Configuration
Based on the data that we have compiled, our data source configuration is as follows:
```
`data\_source\_config = {
"type": "custom",
"item\_schema": {
"type": "object",
"properties": {
"id": { "type": "integer" },
"category": { "type": "string" },
"official\_answer": { "type": "string" },
"audio\_base64": { "type": "string" }
},
"required": ["id", "category", "official\_answer", "audio\_base64"]
},
"include\_sample\_schema": True, # enables sampling
}`
```
### Testing Criteria
For our testing criteria, we set up our grader configuration. In this example, we use a score\_model grader that takes in the official answer and sampled model response (in the `sample` namespace), and then outputs a score of 0 or 1 based on whether the model response matches the official answer. The response contains both audio and the text transcript of the audio. We will use the audio in the grader. For more information on graders, visit [API Grader docs](https://platform.openai.com/docs/api-reference/graders).
Getting both the data and the grader right is key for an effective evaluation. You will likely want to iteratively refine the prompts for your graders.
```
`grader\_config = {
"type": "score\_model",
"name": "Reference answer audio model grader",
"model": "gpt-audio",
"input": [
{
"role": "system",
"content": 'You are a helpful assistant that evaluates audio clips to judge whether they match a provided reference answer. The audio clip is the model''s response to the question. Respond ONLY with a single JSON object matching: {"steps":[{"description":"string","conclusion":"string"}],"result":number}. Do not include any extra text. result must be a float in [0.0, 1.0].'
},
{
"role": "user",
"content": [
{
"type": "input\_text",
"text": "Evaluate this audio clip to see if it reaches the same conclusion as the reference answer. Reference answer: {{item.official\_answer}}",
},
{
"type": "input\_audio",
"input\_audio": {
"data": "{{ sample.output\_audio.data }}",
"format": "wav",
},
},
],
},
],
"range": [0, 1],
"pass\_threshold": 0.6,
}`
```
Alternatively we could use a string\_check grader that takes in the official answer and sampled model response (in the `sample` namespace), and then outputs a score between 0 and 1 based on if the model response contains the reference answer. The response contains both audio and the text transcript of the audio. We will use the text transcript in the grader.
```
`grader\_config = {
"type": "string\_check",
"name": "String check grader",
"input": "{{sample.output\_text}}",
"reference": "{{item.official\_answer}}",
"operation": "ilike"
}`
```
Now, we create the eval object.
```
`eval\_object = client.evals.create(
name="Audio Grading Cookbook",
data\_source\_config=data\_source\_config,
testing\_criteria=[grader\_config],
)`
```
## Eval Run
To create the run, we pass in the eval object id, the data source (i.e., the data we compiled earlier), and the chat message input we will use for sampling to generate the model response.
Here’s the sampling message input we’ll use for this example.
```
`sampling\_messages = [
{
"role": "system",
"content": "You are a helpful and obedient assistant that can answer questions with audio input. You will be given an audio input containing a question to answer."
},
{
"role": "user",
"type": "message",
"content": {
"type": "input\_text",
"text": "Answer the following question by replying with brief reasoning statements and a conclusion with a single word answer: 'valid' or 'invalid'."
}
},
{
"role": "user",
"type": "message",
"content": {
"type": "input\_audio",
"input\_audio": {
"data": "{{ item.audio\_base64 }}",
"format": "wav"
}
}
}]`
```
We now kick off an eval run.
```
`eval\_run = client.evals.runs.create(
name="Audio Input Eval Run",
eval\_id=eval\_object.id,
data\_source={
"type": "completions", # sample using completions API; responses API is not supported for audio inputs
"source": {
"type": "file\_id",
"id": file.id
},
"model": "gpt-audio", # model used to generate the response; check that the model you use supports audio inputs
"sampling\_params": {
"temperature": 0.0,
},
"input\_messages": {
"type": "template",
"template": sampling\_messages},
"modalities": ["audio", "text"],
},
)`
```
## Poll and Display the Results
When the run finishes, we can take a look at the result. You can also check your organization’s OpenAI Evals dashboard to see the progress and results.
```
`while True:
run = client.evals.runs.retrieve(run\_id=eval\_run.id, eval\_id=eval\_object.id)
if run.status == "completed":
output\_items = list(client.evals.runs.output\_items.list(
run\_id=run.id, eval\_id=eval\_object.id
))
df = pd.DataFrame({
"id": [item.datasource\_item["id"]for item in output\_items],
"category": [item.datasource\_item["category"] for item in output\_items],
"official\_answer": [item.datasource\_item["official\_answer"] for item in output\_items],
"model\_response": [item.sample.output[0].content for item in output\_items],
"grading\_results": ["passed" if item.results[0]["passed"] else "failed"
for item in output\_items]
})
display(df)
break
if run.status == "failed":
print(run.error)
break
time.sleep(5)`
```
### Viewing Individual Output Items
To see a full output item, we can do the following. The structure of an output item is specified in the API docs [here](https://platform.openai.com/docs/api-reference/evals/run-output-item-object).
```
`first\_item = output\_items[0]
print(json.dumps(dict(first\_item), indent=2, default=str))`
```
## Conclusion
In this cookbook, we covered a workflow for evaluating native audio inputs to a model using the OpenAI Evals API. We demonstrated using a score model grader to grade the audio response.
### Next steps
* Convert this example to your own use case.
* If you have large audio clips, try using the [uploads API](https://platform.openai.com/docs/api-reference/uploads/create) for support up to 8 GB.
* Navigate to the [Evals dashboard](https://platform.openai.com/evaluations) to visualize the outputs and get insights into the performance of the eval.