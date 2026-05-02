Using Evals API on Image Inputs
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
Jul 15, 2025
# Using Evals API on Image Inputs
[ DS ](https://www.linkedin.com/in/daisysheng/)
[ Daisy Sheng ](https://www.linkedin.com/in/daisysheng/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/use-cases/EvalsAPI_Image_Inputs.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/evaluation/use-cases/EvalsAPI_Image_Inputs.ipynb)
This cookbook demonstrates how to use OpenAI’s Evals framework for image-based tasks. Leveraging the Evals API, we will grade model-generated responses to an image and prompt by using **sampling** to generate model responses and **model grading** (LLM as a Judge) to score the model responses against the image, prompt, and reference answer.
In this example, we will evaluate how well our model can:
1. **Generate appropriate responses** to user prompts about images
2. **Align with reference answers** that represent high-quality responses
## Installing Dependencies + Setup
```
`# Install required packages
!pip install openai datasets pandas --quiet`
```
```
`# Import libraries
from datasets import load\_dataset
from openai import OpenAI
import os
import json
import time
import pandas as pd`
```
## Dataset Preparation
We use the [VibeEval](https://huggingface.co/datasets/RekaAI/VibeEval) dataset that’s hosted on Hugging Face. It contains a collection of user prompt, accompanying image, and reference answer data. First, we load the dataset.
```
`dataset = load\_dataset("RekaAI/VibeEval")`
```
We extract the relevant fields and put it in a json-like format to pass in as a data source in the Evals API. Input image data can be in the form of a web URL or a base64 encoded string. Here, we use the provided web URLs.
```
`evals\_data\_source = []
# select the first 3 examples in the dataset to use for this cookbook
for example in dataset["test"].select(range(3)):
evals\_data\_source.append({
"item": {
"media\_url": example["media\_url"], # image web URL
"reference": example["reference"], # reference answer
"prompt": example["prompt"] # prompt
}
})`
```
If you print the data source list, each item should be of a similar form to:
```
`{
"item": {
"media\_url": "https://storage.googleapis.com/reka-annotate.appspot.com/vibe-eval/difficulty-normal\_food1\_7e5c2cb9c8200d70.jpg"
"reference": "This appears to be a classic Margherita pizza, which has the following ingredients..."
"prompt": "What ingredients do I need to make this?"
}
}`
```
## Eval Configuration
Now that we have our data source and task, we will create our evals. For the OpenAI Evals API docs, visit [API docs](https://platform.openai.com/docs/evals/overview).
```
`client = OpenAI(
api\_key=os.getenv("OPENAI\_API\_KEY")
)`
```
Evals have two parts, the “Eval” and the “Run”. In the “Eval”, we define the expected structure of the data and the testing criteria (grader).
### Data Source Config
Based on the data that we have compiled, our data source config is as follows:
```
`data\_source\_config = {
"type": "custom",
"item\_schema": {
"type": "object",
"properties": {
"media\_url": { "type": "string" },
"reference": { "type": "string" },
"prompt": { "type": "string" }
},
"required": ["media\_url", "reference", "prompt"]
},
"include\_sample\_schema": True, # enables sampling
}`
```
### Testing Criteria
For our testing criteria, we set up our grader config. In this example, it is a model grader that takes in an image, reference answer, and sampled model response (in the `sample` namespace), and then outputs a score between 0 and 1 based on how closely the model response matches the reference answer and its general suitability for the conversation. For more info on model graders, visit [API Grader docs](https://platform.openai.com/docs/api-reference/graders).
Getting the both the data and the grader right are key for an effective evaluation. So, you will likely want to iteratively refine the prompts for your graders.
**Note**: The image url field / templating need to be placed in an input image object to be interpreted as an image. Otherwise, the image will be interpreted as a text string.
```
`grader\_config = {
"type": "score\_model",
"name": "Score Model Grader",
"input":[
{
"role": "system",
"content": "You are an expert grader. Judge how well the model response suits the image and prompt as well as matches the meaniing of the reference answer. Output a score of 1 if great. If it's somewhat compatible, output a score around 0.5. Otherwise, give a score of 0."
},
{
"role": "user",
"content": [{ "type": "input\_text", "text": "Prompt: {{ item.prompt }}."},
{ "type": "input\_image", "image\_url": "{{ item.media\_url }}", "detail": "auto" },
{ "type": "input\_text", "text": "Reference answer: {{ item.reference }}. Model response: {{ sample.output\_text }}."}
]
}
],
"pass\_threshold": 0.9,
"range": [0, 1],
"model": "o4-mini" # model for grading; check that the model you use supports image inputs
}`
```
Now, we create the eval object.
```
`eval\_object = client.evals.create(
name="Image Grading",
data\_source\_config=data\_source\_config,
testing\_criteria=[grader\_config],
)`
```
## Eval Run
To create the run, we pass in the eval object id, the data source (i.e., the data we compiled earlier), and the chat message input we will use for sampling to generate the model response. Note that EvalsAPI also supports stored completions and responses containing images as a data source. See the [Additional Info: Logs Data Source](#additional-info-logs-data-source) section for more info.
Here’s the sampling message input we’ll use for this example.
```
`sampling\_messages = [{
"role": "user",
"type": "message",
"content": {
"type": "input\_text",
"text": "{{ item.prompt }}"
}
},
{
"role": "user",
"type": "message",
"content": {
"type": "input\_image",
"image\_url": "{{ item.media\_url }}",
"detail": "auto"
}
}]`
```
We now kickoff an eval run.
```
`eval\_run = client.evals.runs.create(
name="Image Input Eval Run",
eval\_id=eval\_object.id,
data\_source={
"type": "responses", # sample using responses API
"source": {
"type": "file\_content",
"content": evals\_data\_source
},
"model": "gpt-4o-mini", # model used to generate the response; check that the model you use supports image inputs
"input\_messages": {
"type": "template",
"template": sampling\_messages}
}
)`
```
## Poll and Display the Results
When the run finishes, we can take a look at the result. You can also check in your org’s OpenAI evals dashboard to see the progress and results.
```
`while True:
run = client.evals.runs.retrieve(run\_id=eval\_run.id, eval\_id=eval\_object.id)
if run.status == "completed" or run.status == "failed": # check if the run is finished
output\_items = list(client.evals.runs.output\_items.list(
run\_id=run.id, eval\_id=eval\_object.id
))
df = pd.DataFrame({
"prompt": [item.datasource\_item["prompt"] for item in output\_items],
"reference": [item.datasource\_item["reference"] for item in output\_items],
"model\_response": [item.sample.output[0].content for item in output\_items],
"score": [item.results[0].score for item in output\_items],
"passed": [item.results[0].passed for item in output\_items],
"grading\_results": [item.results[0].sample["output"][0]["content"] for item in output\_items]
})
display(df)
break
time.sleep(5)`
```
||prompt|reference|model\_response|score|passed|grading\_results|
|0|Please provide latex code to replicate this table|Below is the latex code for your table:\\n```te...|Certainly! Below is the LaTeX code to replicat...|0.5|False|{"steps":[{"description":"Interpreted prompt r...|
|1|What ingredients do I need to make this?|This appears to be a classic Margherita pizza,...|To make a classic Margherita pizza similar to ...|1.0|True|{"steps":[{"description":"Compare model's ingr...|
|2|Is this safe for a vegan to eat?|Based on the image, this dish appears to be a ...|To determine if the dish is safe for a vegan, ...|1.0|True|{"steps":[{"description":"Compare model respon...|
### Viewing Individual Output Items
To see a full output item, we can do the following. The structure of an output item is specified in the API docs [here](https://platform.openai.com/docs/api-reference/evals/run-output-item-object).
```
`first\_item = output\_items[0]
print(json.dumps(dict(first\_item), indent=2, default=str))`
```
```
`{
"id": "outputitem\_687833f102ec8191a6e53a5461b970c2",
"created\_at": 1752708081,
"datasource\_item": {
"prompt": "Please provide latex code to replicate this table",
"media\_url": "https://storage.googleapis.com/reka-annotate.appspot.com/vibe-eval/difficulty-normal\_table0\_b312eea68bcd0de6.png",
"reference": "Below is the latex code for your table:\\n```tex\\n\\\\begin{table}\\n\\\\begin{tabular}{c c c c} \\\\hline & \\\\(S2\\\\) & Expert & Layman & PoelM \\\\\\\\ \\\\cline{2-4} \\\\(S1\\\\) & Expert & \\u2013 & 54.0 & 62.7 \\\\\\\\ & Layman & 46.0 & \\u2013 & 60.7 \\\\\\\\ &,PoelM,LM,LM,LM,LM,LM,,L,M,,L,M,,L,M,,L,M,,,\\u2013&39.3 \\\\\\\\\\n[-1ex] \\\\end{tabular}\\n\\\\end{table}\\n```."
},
"datasource\_item\_id": 1,
"eval\_id": "eval\_687833d68e888191bc4bd8b965368f22",
"object": "eval.run.output\_item",
"results": [
{
"name": "Score Model Grader-73fe48a0-8090-46eb-aa8e-d426ad074eb3",
"sample": {
"input": [
{
"role": "system",
"content": "You are an expert grader. Judge how well the model response suits the image and prompt as well as matches the meaniing of the reference answer. Output a score of 1 if great. If it's somewhat compatible, output a score around 0.5. Otherwise, give a score of 0."
},
{
"role": "user",
"content": "Prompt: Please provide latex code to replicate this table. \<image\>https://storage.googleapis.com/reka-annotate.appspot.com/vibe-eval/difficulty-normal\_table0\_b312eea68bcd0de6.png\</image\> Reference answer: Below is the latex code for your table:\\n```tex\\n\\\\begin{table}\\n\\\\begin{tabular}{c c c c} \\\\hline & \\\\(S2\\\\) & Expert & Layman & PoelM \\\\\\\\ \\\\cline{2-4} \\\\(S1\\\\) & Expert & \\u2013 & 54.0 & 62.7 \\\\\\\\ & Layman & 46.0 & \\u2013 & 60.7 \\\\\\\\ &,PoelM,LM,LM,LM,LM,LM,,L,M,,L,M,,L,M,,L,M,,,\\u2013&39.3 \\\\\\\\\\n[-1ex] \\\\end{tabular}\\n\\\\end{table}\\n```.. Model response: Certainly! Below is the LaTeX code to replicate the table you provided:\\n\\n```latex\\n\\\\documentclass{article}\\n\\\\usepackage{array}\\n\\\\usepackage{multirow}\\n\\\\usepackage{booktabs}\\n\\n\\\\begin{document}\\n\\n\\\\begin{table}[ht]\\n \\\\centering\\n \\\\begin{tabular}{c|c|c|c}\\n \\\\multirow{2}{\*}{S1} & \\\\multirow{2}{\*}{S2} & \\\\multicolumn{3}{c}{Methods} \\\\\\\\ \\n \\\\cline{3-5}\\n & & Expert & Layman & PoeLM \\\\\\\\\\n \\\\hline\\n Expert & & - & 54.0 & 62.7 \\\\\\\\\\n Layman & & 46.0 & - & 60.7 \\\\\\\\\\n PoeLM & & 37.3 & 39.3 & - \\\\\\\\\\n \\\\end{tabular}\\n \\\\caption{Comparison of different methods}\\n \\\\label{tab:methods\_comparison}\\n\\\\end{table}\\n\\n\\\\end{document}\\n```\\n\\n### Explanation:\\n- The `multirow` package is used to create the multi-row header for `S1` and `S2`.\\n- The `booktabs` package is used for improved table formatting (with `\\\\hline` for horizontal lines).\\n- Adjust the table's caption and label as needed.."
}
],
"output": [
{
"role": "assistant",
"content": "{\\"steps\\":[{\\"description\\":\\"Assess if the provided LaTeX code correctly matches the structure of the target table, including the diagonal header, column counts, and alignment.\\",\\"conclusion\\":\\"The code fails to create the diagonal split between S1 and S2 and mismatches column counts (defines 4 columns but uses 5).\\"},{\\"description\\":\\"Check the header layout: the target table has a single diagonal cell spanning two axes and three following columns labeled Expert, Layman, PoeLM. The model uses \\\\\\\\multirow and a \\\\\\\\multicolumn block named 'Methods', which does not replicate the diagonal or correct labeling.\\",\\"conclusion\\":\\"Header structure is incorrect and does not match the prompt's table.\\"},{\\"description\\":\\"Verify the data rows: the model code includes two empty cells after S1 and before the data, misaligning all data entries relative to the intended columns.\\",\\"conclusion\\":\\"Data rows are misaligned due to incorrect column definitions.\\"},{\\"description\\":\\"Overall compatibility: the code is syntactically flawed for the target table and conceptually does not replicate the diagonal header or correct column count.\\",\\"conclusion\\":\\"The response does not satisfy the prompt.\\"}],\\"result\\":0.0}"
}
],
"finish\_reason": "stop",
"model": "o4-mini-2025-04-16",
"usage": {
"total\_tokens": 2185,
"completion\_tokens": 712,
"prompt\_tokens": 1473,
"cached\_tokens": 0
},
"error": null,
"seed": null,
"temperature": 1.0,
"top\_p": 1.0,
"reasoning\_effort": null,
"max\_completions\_tokens": 4096
},
"passed": false,
"score": 0.0
}
],
"run\_id": "evalrun\_687833dbadd081919a0f9fbfb817baf4",
"sample": "Sample(error=None, finish\_reason='stop', input=[SampleInput(content='Please provide latex code to replicate this table', role='user'), SampleInput(content='\<image\>https://storage.googleapis.com/reka-annotate.appspot.com/vibe-eval/difficulty-normal\_table0\_b312eea68bcd0de6.png\</image\>', role='user')], max\_completion\_tokens=None, model='gpt-4o-mini-2024-07-18', output=[SampleOutput(content=\\"Certainly! Below is the LaTeX code to replicate the table you provided:\\\\n\\\\n```latex\\\\n\\\\\\\\documentclass{article}\\\\n\\\\\\\\usepackage{array}\\\\n\\\\\\\\usepackage{multirow}\\\\n\\\\\\\\usepackage{booktabs}\\\\n\\\\n\\\\\\\\begin{document}\\\\n\\\\n\\\\\\\\begin{table}[ht]\\\\n \\\\\\\\centering\\\\n \\\\\\\\begin{tabular}{c|c|c|c}\\\\n \\\\\\\\multirow{2}{\*}{S1} & \\\\\\\\multirow{2}{\*}{S2} & \\\\\\\\multicolumn{3}{c}{Methods} \\\\\\\\\\\\\\\\ \\\\n \\\\\\\\cline{3-5}\\\\n & & Expert & Layman & PoeLM \\\\\\\\\\\\\\\\\\\\n \\\\\\\\hline\\\\n Expert & & - & 54.0 & 62.7 \\\\\\\\\\\\\\\\\\\\n Layman & & 46.0 & - & 60.7 \\\\\\\\\\\\\\\\\\\\n PoeLM & & 37.3 & 39.3 & - \\\\\\\\\\\\\\\\\\\\n \\\\\\\\end{tabular}\\\\n \\\\\\\\caption{Comparison of different methods}\\\\n \\\\\\\\label{tab:methods\_comparison}\\\\n\\\\\\\\end{table}\\\\n\\\\n\\\\\\\\end{document}\\\\n```\\\\n\\\\n### Explanation:\\\\n- The `multirow` package is used to create the multi-row header for `S1` and `S2`.\\\\n- The `booktabs` package is used for improved table formatting (with `\\\\\\\\hline` for horizontal lines).\\\\n- Adjust the table's caption and label as needed.\\", role='assistant')], seed=None, temperature=1.0, top\_p=1.0, usage=SampleUsage(cached\_tokens=0, completion\_tokens=295, prompt\_tokens=14187, total\_tokens=14482), max\_completions\_tokens=4096)",
"status": "fail",
"\_datasource\_item\_content\_hash": "bb2090df47ea2ca0aa67337709ce2ff7382d639118d3358068b0cc7031c12f82"
}`
```
## Additional Info: Logs Data Source
As mentioned earlier, EvalsAPI supports logs (i.e., stored completions or responses) containing images as a data source. To use this functionality, change your eval configurations as follows:
Eval Creation
* set `data\_source\_config = { "type": "logs" }`
* revise templating in `grader\_config` to use `{{item.input}}` and/or `{{sample.output\_text}}`, denoting the input and output of the log
Eval Run Creation
* specify the filters in the `data\_source` field that will be used to obtain the corresponding logs for the eval run (see the [docs](https://platform.openai.com/docs/api-reference/evals/createRun) for more information)
## Conclusion
In this cookbook, we covered a workflow for evaluating an image-based task using the OpenAI Evals API’s. By using the image input functionality for both sampling and model grading, we were able to streamline our evals process for the task.
We’re excited to see you extend this to your own image-based use cases, whether it’s OCR accuracy, image generation grading, and more!