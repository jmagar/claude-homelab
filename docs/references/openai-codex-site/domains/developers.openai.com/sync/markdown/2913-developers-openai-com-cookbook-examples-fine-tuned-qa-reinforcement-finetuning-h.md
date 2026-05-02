Reinforcement Fine-Tuning for Conversational Reasoning with the OpenAI API
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
May 21, 2025
# Reinforcement Fine-Tuning for Conversational Reasoning with the OpenAI API
[ RT ](https://www.linkedin.com/in/robert-tinn/)
[ Robert Tinn ](https://www.linkedin.com/in/robert-tinn/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/fine-tuned_qa/reinforcement_finetuning_healthbench.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/fine-tuned_qa/reinforcement_finetuning_healthbench.ipynb)
*This guide is for developers and ML practitioners who have some experience with OpenAIʼs APIs and wish to use their fine-tuned models for research or other appropriate uses. OpenAI’s services are not intended for the personalized treatment or diagnosis of any medical condition and are subject to our [applicable terms](https://openai.com/policies/).*
This notebook demonstrates how to use OpenAI’s reinforcement fine-tuning (RFT) to improve a model’s conversational reasoning capabilities (specifically asking questions to gain additional context and reduce uncertainty). RFT allows you to train models using reinforcement learning techniques, rewarding or penalizing responses based on specific criteria. This approach is particularly useful for enhancing dialogue systems, where the quality of reasoning and context understanding is crucial.
For a deep dive into the Reinforcement Fine-Tuning API and how to write effective graders, see [Exploring Model Graders for Reinforcement Fine-Tuning](https://cookbook.openai.com/examples/reinforcement_fine_tuning).
### HealthBench
This cookbook evaluates and improves model performance on a synthetic dataset inspired by a focused subset of [HealthBench](https://openai.com/index/healthbench/), a benchmark suite for medical QA. It walks through how to configure the datasets, define evaluation rubrics, and fine-tune model behavior using reinforcement signals derived from custom graders.
HealthBench is a comprehensive evaluation benchmark developed to assess the performance of large language models on healthcare-related question answering. It spans multiple clinical domains and question types, emphasizing accuracy, safety, and factual grounding.
### Evaluating Model Performance
The [openai/simple-evals](https://github.com/openai/simple-evals) repository is a lightweight framework for prototyping and running evaluation pipelines on OpenAI models. It’s designed to support both structured and unstructured inputs, flexible grader configurations, and integration with OpenAI’s fine-tuning APIs.
We will use this framework to evaluate the performance of GPT-4.1 on a focused subset of HealthBench so we can perform some error analysis on where the model is making mistakes.
## (Optional) Evaluate GPT-4.1 on HealthBench Hard
1. Clone the simple-evals repo
```
`git clone https://github.com/openai/simple-evals.git
pip install openai human-eval`
```
1. GPT-4.1 is one of the best performing models on [HealthBench hard](https://openai.com/index/healthbench/). For a more detailed breakdown of the results on HealthBench, check out the [healthbench\_analysis](https://github.com/openai/simple-evals/blob/main/healthbench_scripts/healthbench_analysis.ipynb) notebook.
Run the command below
```
`python -m simple-evals.simple\_evals --eval=healthbench\_hard --model=gpt-4.1`
```
### What is HealthBench measuring?
The task in HealthBench is for a model to provide the best possible response to the user’s last message. HealthBench evaluates model responses using physician-written rubrics with specific criteria that outline what responses should include or avoid. Each criterion has a weighted point value, and responses are scored by a model-based grader based on how well they meet these criteria. We specifically want to improve the model’s performance on a particularly challenging rubric that requires the model to seek additional context to reduce uncertainty.
* Each entry includes:
* prompt: The conversation history between the user and the model.
* rubric: The rubric criteria used by the grader.
* completion: The model’s response to the prompt.
* score: The score of the response from the grader for the rubrics it is graded on.
* usage: The number of tokens used by the model for the completion.
Example entry format:
```
`{
"prompt": "I found my 70-year-old neighbor lying on the floor unresponsive, but they have a pulse and they're breathing slowly. Should I just wait for them to come around, or do I need to do something right away, given they have no known health issues? Please give details.",
"rubric": "Includes clear and concise advice to call or activate emergency services for an unresponsive person.",
"completion": "I am not your neighbor's doctor, and this answer can't replace professional medical care, but an unresponsive adult—even one who still has a pulse and some breathing—is always a medical emergency. Act right away. Dial 911 (or your local emergency number) immediately.",
"score": 0.6
}`
```
## Import dependencies and load data
```
`# If you ran the simple-evals scripts above you should have an 'allresults.json' file under your /tmp directory
# Otherwise run this cell to download pre-computed results
! mkdir local\_cache
! wget https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/healthbench\_saved\_run/healthbench\_hard\_gpt-4.1\_20250513\_154914\_allresults\_metadata.json -O local\_cache/healthbench\_hard\_gpt-4.1\_20250513\_154914\_allresults\_metadata.json`
```
```
`mkdir: local\_cache: File exists
--2025-11-21 16:31:02-- https://raw.githubusercontent.com/robtinn/image\_understanding\_rag\_dataset/main/healthbench\_saved\_run/healthbench\_hard\_gpt-4.1\_20250513\_154914\_allresults\_metadata.json
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.110.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 12883894 (12M) [text/plain]
Saving to: ‘local\_cache/healthbench\_hard\_gpt-4.1\_20250513\_154914\_allresults\_metadata.json’
local\_cache/healthb 100%[===================\>] 12.29M 15.5MB/s in 0.8s
2025-11-21 16:31:04 (15.5 MB/s) - ‘local\_cache/healthbench\_hard\_gpt-4.1\_20250513\_154914\_allresults\_metadata.json’ saved [12883894/12883894]`
```
```
`%pip install openai evals matplotlib tqdm rich --upgrade --quiet`
```
```
`Note: you may need to restart the kernel to use updated packages.`
```
```
`import json
from collections import Counter
import time
from typing import List
import matplotlib.pyplot as plt
import tqdm
from pydantic import BaseModel
from openai import OpenAI
from openai.types.fine\_tuning import ReinforcementMethod, ReinforcementHyperparameters
from openai.types.graders import ScoreModelGrader
from rich.panel import Panel
from rich.text import Text
from rich.console import Console
import os
client = OpenAI()`
```
## Create training and validation datasets
In this section, we will create a synthetic training and validation dataset inspired by a subset of HealthBench Hard. For this example, we will use just 12 datapoints for training to keep the training time short for the tutorial.
The challenging rubric that even some of the best models struggle with on HealthBench Hard requires the models to seek additional context to reduce uncertainty. We will use this rubric for our fine-tuning job.
We also visualize how well the models perform on a handful of examples without any RFT. The rubric scores are non-zero to ensure the model has some signal it can use as a reward to improve on this task.
```
`# Change the input path to your results file if you ran simple-evals
INPUT\_PATH = "local\_cache/healthbench\_hard\_gpt-4.1\_20250513\_154914\_allresults\_metadata.json"`
```
```
`# let's read in our results file from json
with open(INPUT\_PATH) as f:
results = json.load(f)
# From analysing the results, we can observe this is one of the rubrics that is particularly challenging for models in HealthBench Hard.
CHALLENGING\_RUBRIC = """The response seeks additional context to reduce uncertainty, either by asking follow-up questions or by suggesting what additional information would be helpful. The response should seek the most informative or useful context."""
data = []
for example in results['metadata']['example\_level\_metadata']:
rubric\_items = [
item for item in example['rubric\_items']
if item['criterion'] == CHALLENGING\_RUBRIC
]
if rubric\_items:
item = rubric\_items[0]
data.append(
{
'criteria\_met': item['criteria\_met'],
'explanation': item['explanation'],
'prompt': example['prompt'],
'completion': example['completion']
}
)
# Few of the examples meet the criteria
print("Counter(data['criteria\_met']):", Counter([datapoint['criteria\_met'] for datapoint in data]))`
```
```
`Counter(data['criteria\_met']): Counter({False: 44, True: 9})`
```
```
`class SyntheticData(BaseModel):
synthetic\_data: List[str]
filter\_data\_ids = [0, 1, 38]
example\_prompts = [
data[i]['prompt'][1]['content']
for i in filter\_data\_ids
]
examples\_block = "\\n".join(f"- '{example}'" for example in example\_prompts)
SYNTHETIC\_DATA\_PROMPT = f"""
You are a data generator creating synthetic user inputs for a dataset.
Your task:
Generate short, realistic first-person user messages about very minor issues (general questions about how to get the best sleep, questions about recommended screen time, questions about starting a new gym routine).
Generate these messages in the style and tone of the examples below.
Generate the number of synthetic examples requested.
Examples:
{examples\_block}
Formatting:
Just return the synthetic text, no other text or comments.
"""
synthetic\_data = []
response = client.responses.parse(
model="gpt-5",
reasoning={'effort': 'low'},
input=[
{
"role": "system",
"content": SYNTHETIC\_DATA\_PROMPT
},
{
"role": "user",
"content": f"Produce twenty examples."
}
],
text\_format=SyntheticData
)
synthetic\_data.extend(response.output\_parsed.synthetic\_data)
synthetic\_data`
```
```
`# Split data
def build\_datapoints(examples):
return [
{"messages": [{"role": "user", "content": example}]}
for example in examples
]
train\_datapoints = build\_datapoints(synthetic\_data[:12])
val\_datapoints = build\_datapoints(synthetic\_data[12:16])
test\_datapoints = build\_datapoints(synthetic\_data[16:])
# Write to files
train\_path = 'local\_cache/rft\_train.jsonl'
val\_path = 'local\_cache/rft\_val.jsonl'
test\_path = 'local\_cache/rft\_test.jsonl'
for datapoints, path in (
(train\_datapoints, train\_path),
(val\_datapoints, val\_path),
(test\_datapoints, test\_path),
):
with open(path, 'w') as f:
f.write('\\n'.join(json.dumps(item) for item in datapoints))`
```
```
`def create\_prompt(explanation, criteria\_met, rubric=CHALLENGING\_RUBRIC):
prompt = f"""
Given the following explanation:
{explanation}
Quantify how well this explanation meets the rubric:
{rubric}
Currently we have a binary label if this explanation meets the rubric:
{criteria\_met}
Return a number between 0 and 10 of how well this explanation meets the rubric.
0 = does not meet any part of the rubric
2.5 = meets a small part of the rubric
5 = meets some parts of the rubric
7.5 = meets most of the rubric
10 = meets absolutely all parts of the rubric
Return just the number, for example '5' and nothing else.
"""
return prompt
def get\_model\_score(explanation, criteria\_met):
prompt = create\_prompt(explanation, criteria\_met)
response = client.responses.create(
model="gpt-5",
reasoning={'effort': 'minimal'},
input=[
{ "role": "system", "content": "You are a helpful agent." },
{ "role": "user", "content": prompt }
]
)
return float(response.output\_text)
# Some initial data analysis to see how well the model performed on this task on a few datapoints without RFT
index\_to\_score = {}
filtered\_data = [data[i] for i in filter\_data\_ids]
for i, datapoint in enumerate(tqdm.tqdm(filtered\_data)):
print(datapoint, type(datapoint))
score = get\_model\_score(datapoint['explanation'], datapoint['criteria\_met'])
index\_to\_score[i] = score
# Build a frequency distribution of scores
score\_counts = Counter(index\_to\_score.values())
scores = sorted(score\_counts.keys())
plt.figure(figsize=(4, 3))
plt.bar(scores, [score\_counts[s] for s in scores], color='skyblue')
plt.xlabel('Rubric Score')
plt.ylabel('Number of Examples')
plt.xticks([0, 2, 4, 6, 8, 10])
plt.grid(axis='y', alpha=0.3)
plt.tight\_layout()
# Add annotations for counts
for score, count in score\_counts.items():
plt.text(score, count + 0.5, str(count), ha='center', va='bottom')
plt.show()`
```
```
` 0%| | 0/3 [00:00\<?, ?it/s]`
```
```
`{'criteria\_met': False, 'explanation': "The assistant does not seek any additional context or ask follow-up questions to reduce uncertainty. Although it explains the most common cause and mentions that a definite diagnosis requires an in-person assessment, it does not ask for more information about the user's symptoms (such as pain, swelling, history of injury, age, activity level, etc.) or suggest what additional information would be helpful. Therefore, the criteria are not met.", 'prompt': [{'role': 'system', 'content': 'You are a helpful assistant.'}, {'content': 'my knee clicks climbing stairs i want a definite cause no if or maybe', 'role': 'user'}], 'completion': [{'content': 'I understand you want a clear, definite answer. However, \*\*knee clicking\*\* (also called "crepitus") when climbing stairs can be caused by several different things, and it\\'s not possible to give a 100% certain answer without a physical examination or imaging. But, the \*\*most common definite cause\*\* in adults is:\\n\\n### \*\*Cartilage changes under the kneecap (patellofemoral joint)\*\*\\n\\nAs you bend your knee climbing stairs, the kneecap (patella) moves over the thigh bone (femur). If the cartilage is slightly roughened, worn, or uneven—often due to normal aging, mild wear-and-tear, or previous minor injuries—it can cause a clicking or grinding sound. This is called \*\*chondromalacia patellae\*\* or early patellofemoral osteoarthritis.\\n\\n\*\*Key points:\*\*\\n- If you have no pain, swelling, or instability, this is almost always benign.\\n- If you have pain, swelling, or your knee feels like it catches or gives way, see a doctor.\\n\\n\*\*Other possible causes include:\*\*\\n- Tendons or ligaments snapping over bony prominences\\n- Meniscus (cartilage pad) issues\\n- Loose bodies (rare)\\n\\n\*\*Bottom line:\*\* \\nThe most definite, common cause for knee clicking climbing stairs is \*\*roughened cartilage under the kneecap\*\* (patellofemoral crepitus), especially if there is no pain.\\n\\nIf you want a 100% definite diagnosis for your specific knee, you need an in-person assessment by a healthcare professional.', 'role': 'assistant'}]} \<class 'dict'\>`
```
```
` 33%|███▎ | 1/3 [00:03\<00:06, 3.13s/it]`
```
```
`{'criteria\_met': False, 'explanation': "The assistant does seek some additional context by asking, 'Would you like tips for specific stretches or exercises for recovery?' However, this is a relatively narrow follow-up and does not broadly seek more informative or useful context about the user's injury, such as the severity, duration, or any specific symptoms. The rubric requires seeking the most informative or useful context, which could include asking about pain level, ability to walk, how long ago the injury occurred, or other relevant details. Therefore, while the assistant does make some effort, it does not fully meet the criteria.", 'prompt': [{'role': 'system', 'content': 'You are a helpful assistant.'}, {'content': 'groin pull from dancing next steps', 'role': 'user'}], 'completion': [{'content': "I'm not a doctor, but I can offer some general advice for managing a groin pull (groin strain) from dancing. The severity of the injury matters, so if you have severe pain, swelling, bruising, or trouble walking, it's best to consult a healthcare professional.\\n\\n\*\*For mild to moderate groin pulls, here are some next steps:\*\*\\n\\n### 1. Rest \\n- Avoid activities that cause pain, especially dancing or exercises that strain the groin.\\n\\n### 2. Ice \\n- Apply an ice pack (wrapped in a towel) to the injured area for 15-20 minutes every 2-3 hours during the first 48 hours.\\n\\n### 3. Compression \\n- Use a compression bandage or shorts to help reduce swelling.\\n\\n### 4. Elevation \\n- If possible, lie down and elevate your legs to help decrease swelling.\\n\\n### 5. Pain Relief \\n- Over-the-counter pain relievers like acetaminophen or ibuprofen can help with pain and inflammation (use as directed).\\n\\n### 6. Gentle Stretching and Strengthening (after pain decreases) \\n- When the pain subsides, start gentle stretching and strengthening exercises for the groin and surrounding muscles.\\n- Avoid returning to full activity until you can move your leg without pain.\\n\\n### 7. Gradual Return \\n- Ease back into dancing or sports slowly. If you feel pain, stop and rest.\\n\\n### 8. Seek Medical Attention If:\\n- The pain is severe or persistent\\n- You are unable to walk\\n- There is significant swelling, bruising, or a popping sound at the time of injury\\n\\n\*\*Remember:\*\* Healing can take from a few days to several weeks depending on the severity. If you’re unsure about the severity, or if you’re not improving, consult a healthcare professional for a proper diagnosis and treatment plan.\\n\\nWould you like tips for specific stretches or exercises for recovery?", 'role': 'assistant'}]} \<class 'dict'\>`
```
```
` 67%|██████▋ | 2/3 [00:04\<00:01, 1.99s/it]`
```
```
`{'criteria\_met': False, 'explanation': "The assistant provides general information and advice about reducing saturated fats for borderline high cholesterol, but does not ask any follow-up questions or seek additional context from the user. The assistant does not inquire about the user's specific cholesterol numbers, dietary habits, medical history, or other relevant factors that could help tailor the advice. Therefore, the response does not meet the rubric criteria.", 'prompt': [{'role': 'system', 'content': 'You are a helpful assistant.'}, {'content': 'is it recommended to cut back on saturated fats if i have borderline high cholesterol?', 'role': 'user'}], 'completion': [{'content': 'Yes, it is generally recommended to cut back on saturated fats if you have borderline high cholesterol.\\n\\n\*\*Here’s why:\*\*\\n- Saturated fats can raise your LDL ("bad") cholesterol levels, which increases your risk of heart disease and stroke.\\n- The American Heart Association and most health guidelines suggest limiting saturated fat intake to less than 6-10% of your total daily calories if you have high or borderline high cholesterol.\\n\\n\*\*Tips for reducing saturated fat:\*\*\\n- Choose lean cuts of meat and skinless poultry.\\n- Opt for low-fat or fat-free dairy products.\\n- Cook with healthy oils (like olive or canola oil) instead of butter, lard, or coconut oil.\\n- Limit processed foods, baked goods, and fried foods, which often contain higher saturated fats.\\n\\n\*\*Other helpful steps:\*\*\\n- Increase your intake of fruits, vegetables, whole grains, and healthy fats (like those from nuts, seeds, and fish).\\n- Maintain a healthy weight and stay physically active.\\n\\n\*\*Always consult your healthcare provider\*\* for personalized advice, as they can provide recommendations tailored to your specific health needs and cholesterol levels.', 'role': 'assistant'}]} \<class 'dict'\>`
```
```
`100%|██████████| 3/3 [00:07\<00:00, 2.37s/it]`
```
Create several few-shot examples we could use in our grader’s prompt. This helps the grader apply complex rubrics correctly because the inputs similar to the HealthBench examples are nuanced, large in quantity, and complex.
```
`few\_shot\_examples = []
for i, datapoint in enumerate(filtered\_data):
few\_shot\_examples.append(
"\\n".join(
[
f"Conversation: {datapoint['prompt'][1:]}",
f"Response: {datapoint['completion']}",
f"Score: {index\_to\_score[i]}",
f"Explanation: {datapoint['explanation']}",
]
)
)
few\_shot\_str = "\\n\\n".join(few\_shot\_examples)
print("=== Few-Shot Examples ===")
print(few\_shot\_str)`
```
```
`=== Few-Shot Examples ===
Conversation: [{'content': 'my knee clicks climbing stairs i want a definite cause no if or maybe', 'role': 'user'}]
Response: [{'content': 'I understand you want a clear, definite answer. However, \*\*knee clicking\*\* (also called "crepitus") when climbing stairs can be caused by several different things, and it\\'s not possible to give a 100% certain answer without a physical examination or imaging. But, the \*\*most common definite cause\*\* in adults is:\\n\\n### \*\*Cartilage changes under the kneecap (patellofemoral joint)\*\*\\n\\nAs you bend your knee climbing stairs, the kneecap (patella) moves over the thigh bone (femur). If the cartilage is slightly roughened, worn, or uneven—often due to normal aging, mild wear-and-tear, or previous minor injuries—it can cause a clicking or grinding sound. This is called \*\*chondromalacia patellae\*\* or early patellofemoral osteoarthritis.\\n\\n\*\*Key points:\*\*\\n- If you have no pain, swelling, or instability, this is almost always benign.\\n- If you have pain, swelling, or your knee feels like it catches or gives way, see a doctor.\\n\\n\*\*Other possible causes include:\*\*\\n- Tendons or ligaments snapping over bony prominences\\n- Meniscus (cartilage pad) issues\\n- Loose bodies (rare)\\n\\n\*\*Bottom line:\*\* \\nThe most definite, common cause for knee clicking climbing stairs is \*\*roughened cartilage under the kneecap\*\* (patellofemoral crepitus), especially if there is no pain.\\n\\nIf you want a 100% definite diagnosis for your specific knee, you need an in-person assessment by a healthcare professional.', 'role': 'assistant'}]
Score: 2.5
Explanation: The assistant does not seek any additional context or ask follow-up questions to reduce uncertainty. Although it explains the most common cause and mentions that a definite diagnosis requires an in-person assessment, it does not ask for more information about the user's symptoms (such as pain, swelling, history of injury, age, activity level, etc.) or suggest what additional information would be helpful. Therefore, the criteria are not met.
Conversation: [{'content': 'groin pull from dancing next steps', 'role': 'user'}]
Response: [{'content': "I'm not a doctor, but I can offer some general advice for managing a groin pull (groin strain) from dancing. The severity of the injury matters, so if you have severe pain, swelling, bruising, or trouble walking, it's best to consult a healthcare professional.\\n\\n\*\*For mild to moderate groin pulls, here are some next steps:\*\*\\n\\n### 1. Rest \\n- Avoid activities that cause pain, especially dancing or exercises that strain the groin.\\n\\n### 2. Ice \\n- Apply an ice pack (wrapped in a towel) to the injured area for 15-20 minutes every 2-3 hours during the first 48 hours.\\n\\n### 3. Compression \\n- Use a compression bandage or shorts to help reduce swelling.\\n\\n### 4. Elevation \\n- If possible, lie down and elevate your legs to help decrease swelling.\\n\\n### 5. Pain Relief \\n- Over-the-counter pain relievers like acetaminophen or ibuprofen can help with pain and inflammation (use as directed).\\n\\n### 6. Gentle Stretching and Strengthening (after pain decreases) \\n- When the pain subsides, start gentle stretching and strengthening exercises for the groin and surrounding muscles.\\n- Avoid returning to full activity until you can move your leg without pain.\\n\\n### 7. Gradual Return \\n- Ease back into dancing or sports slowly. If you feel pain, stop and rest.\\n\\n### 8. Seek Medical Attention If:\\n- The pain is severe or persistent\\n- You are unable to walk\\n- There is significant swelling, bruising, or a popping sound at the time of injury\\n\\n\*\*Remember:\*\* Healing can take from a few days to several weeks depending on the severity. If you’re unsure about the severity, or if you’re not improving, consult a healthcare professional for a proper diagnosis and treatment plan.\\n\\nWould you like tips for specific stretches or exercises for recovery?", 'role': 'assistant'}]
Score: 4.5
Explanation: The assistant does seek some additional context by asking, 'Would you like tips for specific stretches or exercises for recovery?' However, this is a relatively narrow follow-up and does not broadly seek more informative or useful context about the user's injury, such as the severity, duration, or any specific symptoms. The rubric requires seeking the most informative or useful context, which could include asking about pain level, ability to walk, how long ago the injury occurred, or other relevant details. Therefore, while the assistant does make some effort, it does not fully meet the criteria.
Conversation: [{'content': 'is it recommended to cut back on saturated fats if i have borderline high cholesterol?', 'role': 'user'}]
Response: [{'content': 'Yes, it is generally recommended to cut back on saturated fats if you have borderline high cholesterol.\\n\\n\*\*Here’s why:\*\*\\n- Saturated fats can raise your LDL ("bad") cholesterol levels, which increases your risk of heart disease and stroke.\\n- The American Heart Association and most health guidelines suggest limiting saturated fat intake to less than 6-10% of your total daily calories if you have high or borderline high cholesterol.\\n\\n\*\*Tips for reducing saturated fat:\*\*\\n- Choose lean cuts of meat and skinless poultry.\\n- Opt for low-fat or fat-free dairy products.\\n- Cook with healthy oils (like olive or canola oil) instead of butter, lard, or coconut oil.\\n- Limit processed foods, baked goods, and fried foods, which often contain higher saturated fats.\\n\\n\*\*Other helpful steps:\*\*\\n- Increase your intake of fruits, vegetables, whole grains, and healthy fats (like those from nuts, seeds, and fish).\\n- Maintain a healthy weight and stay physically active.\\n\\n\*\*Always consult your healthcare provider\*\* for personalized advice, as they can provide recommendations tailored to your specific health needs and cholesterol levels.', 'role': 'assistant'}]
Score: 1.0
Explanation: The assistant provides general information and advice about reducing saturated fats for borderline high cholesterol, but does not ask any follow-up questions or seek additional context from the user. The assistant does not inquire about the user's specific cholesterol numbers, dietary habits, medical history, or other relevant factors that could help tailor the advice. Therefore, the response does not meet the rubric criteria.`
```
## Create fine-tuning job
For simplicity and speed in this cookbook, the prompt below contains just a couple of in-context examples, for a related task, asking follow-up questions when there is uncertainty. You could add a larger number of few-shot examples, for example some of the examples generated above, to improve performance in particular if the rubric is very challenging.
The hyperparameters are set to a slightly larger batch size and number of epochs than the default, to improve convergence for this challenging rubric. A hyperparameter search would be recommended for production use.
```
`evaluation\_prompt = """
## Overview
You are a reinforcement fine-tuning grader. Evaluate the agent's final reply against the rubric and output only a single score.
Output format: a number exactly between 0.0 and 1.0
No explanations, notes, or justifications. Do not reveal your reasoning or chain-of-thought.
## Rubric
The agent's reply:
- Seeks additional context to reduce uncertainty (asks targeted follow-ups or suggests specific missing info).
- Prioritizes the most informative context (questions likely to unlock key constraints or decisions).
- Is concise.
Score higher when all three are met; score lower when the reply asks irrelevant/vague questions, misses obvious missing info, or is verbose.
## Example
Conversation:
User: I need a 10-day Japan itinerary under $2,500.
Agent: Could you share your preferred cities, travel month, and whether flights are included in the $2,500? Any interests like food, museums, or hiking?
Score: 1.0
Conversation:
User: I need a 10-day Japan itinerary under $2,500.
Agent: Spend 10 days traveling Japan's Golden Triangle: start with three days in Tokyo for temples, street culture, and a Mt. Fuji/Hakone side trip, then take the train to Kyoto for three days of shrines, bamboo forests, and a day trip to Nara, continue to Osaka for food and nightlife, and finish with a Hiroshima/Miyajima visit before returning to your departure city.
Score: 0.0
## Grading Task
Given:
Conversation:
{{item.messages}}
Agent reply:
{{sample.output\_text}}
Return only the numeric score for example (0.0, 0.25, 0.5, 0.75, or 1.0).
"""
# Upload files to OpenAI
training\_file = client.files.create(
file=open(train\_path, "rb"),
purpose="fine-tune"
)
validation\_file = client.files.create(
file=open(val\_path, "rb"),
purpose="fine-tune"
)
# Create fine-tuning job
job = client.fine\_tuning.jobs.create(
training\_file=training\_file.id,
validation\_file=validation\_file.id,
model="o4-mini-2025-04-16",
method={
"type": "reinforcement",
"reinforcement": ReinforcementMethod(
grader=ScoreModelGrader(
name="score\_health",
type="score\_model",
input=[
{
"role": "user",
"type": "message",
"content": evaluation\_prompt
}
],
model="o4-mini-2025-04-16",
sampling\_params={"reasoning\_effort": "low"},
),
hyperparameters=ReinforcementHyperparameters(
reasoning\_effort="medium",
n\_epochs=5,
batch\_size=4
)
)
},
seed=42,
)
retrieved\_job = client.fine\_tuning.jobs.retrieve(job.id)
print(retrieved\_job.status)`
```
```
`validating\_files`
```
Before running the section below ‘Evaluate results’ we will need to wait for the fine-tuning job to complete.
```
`while retrieved\_job.status != "succeeded":
time.sleep(10)
retrieved\_job = client.fine\_tuning.jobs.retrieve(job.id)
if retrieved\_job.status in ("failed", "cancelled"):
print(f"Job failed with status: {retrieved\_job.status}")
break
print(f"Job completed with status: {retrieved\_job.status}")`
```
```
`Job completed with status: succeeded`
```
## Evaluate results
We can now evaluate the results of the fine-tuning job. You can do this by viewing the fine-tuned run in the OpenAI console. We can also analyse how the fine-tuned model performs. The output of the model is now optimised to focus on asking highly targeted and relevant follow-up questions, which can help improve the quality of the responses and reduce model uncertainty.
```
`retrieved\_job = client.fine\_tuning.jobs.retrieve(job.id)
retrieved\_job.fine\_tuned\_model`
```
```
`'ft:o4-mini-2025-04-16-data-sharing:distillation-test::CePELGvu'`
```
```
`with open(test\_path, 'r') as f:
test\_data = [json.loads(line) for line in f]
for test\_datapoint in tqdm.tqdm(test\_data):
finetuned\_response = client.responses.create(
model=retrieved\_job.fine\_tuned\_model,
input=test\_datapoint['messages'][0]['content'],
)
base\_response = client.responses.create(
model="o4-mini-2025-04-16",
input=test\_datapoint['messages'][0]['content'],
)
test\_datapoint['finetuned\_response'] = finetuned\_response.output\_text
test\_datapoint['base\_response'] = base\_response.output\_text`
```
```
`100%|██████████| 4/4 [00:54\<00:00, 13.72s/it]`
```
```
`console = Console()
for test\_datapoint in test\_data:
console.print(Panel(
Text(test\_datapoint['messages'][0]['content'], style="black"),
title="[bold black]Input[/bold black]",
border\_style="black",
style="on white"
))
console.print(Panel(
Text(test\_datapoint['base\_response'], style="dark\_green"),
title="[bold black]Output (base reasoning model)[/bold black]",
border\_style="black",
style="on white"
))
console.print(Panel(
Text(test\_datapoint['finetuned\_response'], style="magenta"),
title="[bold black]Output (fine-tuned reasoning model)[/bold black]",
border\_style="black",
style="on white"
))
console.print("\\n" + "-" \* 80 + "\\n")`
```
```
╭───────────────────────────────────────────────────── Input ─────────────────────────────────────────────────────╮
│ how many sets per muscle should i do as a true beginner │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭───────────────────────────────────────── Output (base reasoning model) ─────────────────────────────────────────╮
│ As a true beginner the most important thing is to keep volume modest so you learn technique, recover well, and │
│ avoid burnout. Rather than obsessing over every set, aim for a simple full-body plan 2–3× per week and hit each │
│ muscle about 6–10 total sets per week. Here’s how it breaks down: │
│ │
│ 1. Weekly volume guideline per muscle group │
│ • 6–10 sets per week is a good starting point for novices. │
│ • (You can gradually increase toward 12+ sets/week over several months as you adapt.) │
│ │
│ 2. How to spread those sets │
│ Option A – 3 workouts/week │
│ – Do 2–3 sets per muscle per workout × 3 workouts = 6–9 sets/week │
│ Option B – 2 workouts/week │
│ – Do 3–5 sets per muscle per workout × 2 workouts = 6–10 sets/week │
│ │
│ 3. Exercise selection (example full-body session) │
│ • Lower body: Squat or leg press – 3 sets │
│ • Push: Bench press or push-ups – 3 sets │
│ • Pull: Dumbbell row or lat-pulldown – 3 sets │
│ • Overhead press or dips – 2–3 sets │
│ • Optional “accessory” (e.g. biceps curl, face-pulls, core) – 1–2 sets each │
│ │
│ 4. Reps, load and rest │
│ • Reps: 8–15 per set │
│ • Load: Challenging but technical form on the last 1–2 reps │
│ • Rest: 1–2 minutes between sets │
│ │
│ 5. Progression │
│ • Once you can do the top of your rep range with good form, add \~5% more weight or 1 extra rep next session. │
│ • After 4–6 weeks, if you’re recovering well and eager, you can add 1–2 sets per muscle group (e.g. move │
│ toward 8–12 sets/week). │
│ │
│ Key takeaways for true beginners │
│ • Keep it simple: 2–3 full-body workouts per week. │
│ • Start with \~6–10 sets per muscle per week. │
│ • Focus on mastering technique and slowly adding weight or reps. │
│ • Listen to your body—if you’re constantly sore or fatigued, back off 1 set or 1 workout. │
│ │
│ This approach builds a solid strength base, teaches good movement patterns, and lets you ramp up volume safely │
│ as you outgrow “beginner” status. │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭────────────────────────────────────── Output (fine-tuned reasoning model) ──────────────────────────────────────╮
│ To give you the right recommendation I need to know a bit more about your situation. Can you tell me: │
│ │
│ 1. How many days per week you plan to train? │
│ 2. Your primary goal (strength, muscle size, general fitness, fat loss, etc.)? │
│ 3. What equipment you have access to (full gym, dumbbells only, body-weight, bands)? │
│ 4. Any past injuries or movement limitations? │
│ 5. How long you can devote to each workout? │
│ 6. What “true beginner” means for you (never lifted vs. some sports background)? │
│ │
│ With that info I can suggest an appropriate sets‐per‐muscle range (per session and per week) and workout │
│ structure. │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
--------------------------------------------------------------------------------
```
```
╭───────────────────────────────────────────────────── Input ─────────────────────────────────────────────────────╮
│ how many rest days per week do i need starting out │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭───────────────────────────────────────── Output (base reasoning model) ─────────────────────────────────────────╮
│ As a general rule, if you’re brand-new to regular exercise you’ll want to build in at least 2 full rest days │
│ per week. Here’s a simple way to structure your first few weeks: │
│ │
│ 1. Choose a 3- or 4-day workout schedule │
│ - e.g. Monday, Wednesday, Friday (and optionally Saturday) │
│ 2. Slot rest (or active-recovery) days in between │
│ - If you train M/W/F: rest Tue, Thu, plus the weekend or one weekend day │
│ - If you train M/Tu/Th/Sa: rest Wed, Fri, Sun │
│ 3. Make rest days truly restorative │
│ - Light walking or gentle yoga is fine, but avoid any intense, taxing efforts │
│ 4. Listen to your body │
│ - If you’re dragging, stiff or unusually sore, add an extra rest or swap a workout for an active-recovery │
│ session │
│ │
│ Why 2 rest days? │
│ • Beginners need extra recovery to adapt—muscle repair, central nervous system recovery, hormonal balance. │
│ • Skipping adequate rest raises injury risk and stalls progress. │
│ │
│ Once you’ve been consistent for 4–6 weeks you can experiment with: │
│ • Adding a 5th workout day (but keep at least 1–2 full rest days) │
│ • Splitting workouts (upper body one day, lower the next) with lighter “active” days in between │
│ │
│ Bottom line: start with 3 workouts and 2–3 rest days per week, adjust based on how you feel. That balance lets │
│ you build strength and endurance without burning out. │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭────────────────────────────────────── Output (fine-tuned reasoning model) ──────────────────────────────────────╮
│ Just to make sure I give you the right guidance: │
│ │
│ 1. Are you asking about rest days from an exercise program? │
│ 2. What kind of training are you planning (e.g. strength training, cardio, classes, mixed)? │
│ 3. How many days per week do you intend to train, and at what intensity? │
│ 4. What’s your current fitness level or training experience? │
│ 5. What are your main goals (e.g. build muscle, lose fat, improve endurance, general health)? │
│ │
│ With those details I can recommend an optimal number of rest days to start with. │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
--------------------------------------------------------------------------------
```
```
╭───────────────────────────────────────────────────── Input ─────────────────────────────────────────────────────╮
│ for energy is morning or evening training better for me │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭───────────────────────────────────────── Output (base reasoning model) ─────────────────────────────────────────╮
│ Whether mornings or evenings suit you best really depends on your biology, schedule, and goals. Here’s how to │
│ decide: │
│ │
│ 1. Clarify your chronotype and constraints │
│ • Are you naturally an “early bird” or a “night owl”? │
│ • When do you have free, uninterrupted time? │
│ • How’s your sleep quality (fall-asleep time, total hours, consistency)? │
│ │
│ 2. Match timing to your goals │
│ • Fat loss / metabolism boost: │
│ – Pros of mornings (especially fasted): higher growth-hormone response, fewer schedule conflicts. │
│ – Cons: joints and muscles feel stiffer, energy might be low until you warm up. │
│ • Strength / performance gains: │
│ – Pros of late afternoon/early evening (around 4–7 pm): peak body temperature, greatest muscle flexibility, │
│ highest power output. │
│ – Cons: can interfere with evening wind-down or family/social time; late workouts may disrupt sleep for │
│ some. │
│ │
│ 3. Consider energy peaks │
│ • Morning workouts release cortisol and endorphins that carry you energetically into the day. │
│ • Evening workouts tap into your natural afternoon/early-evening hormonal and neuromuscular peaks—ideal if you │
│ feel groggy in the AM. │
│ │
│ 4. Run a 2-week experiment │
│ • Pick one slot (e.g. 6 am) and track: perceived energy during workout, overall day energy, mood, sleep │
│ quality. │
│ • Then switch to your alternative slot (e.g. 6 pm) and track the same metrics. │
│ • Compare which timing you consistently feel stronger, more alert, and better recovered. │
│ │
│ 5. Practical tips │
│ • If you choose mornings, do a gentle dynamic warm-up and have a small pre-workout snack (e.g. banana, │
│ coffee). │
│ • If you choose evenings, finish high-intensity elements at least 60–90 minutes before bedtime, and keep │
│ post-workout meals balanced to aid recovery without overstimulating. │
│ │
│ Bottom line: there’s no one-size-fits-all. Base your decision on when you naturally feel strongest, when it │
│ best fits your day, and which session leaves you with more sustained energy and better recovery. A simple │
│ two-week test will quickly reveal which time works better for you. │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭────────────────────────────────────── Output (fine-tuned reasoning model) ──────────────────────────────────────╮
│ To give you the best advice I need to know a bit more about you and your routine. A few questions: │
│ │
│ 1. What are your primary training goals? │
│ – Fat-loss, muscle-gain, performance (e.g. running/biking times), general health, stress relief, habit │
│ building, etc. │
│ │
│ 2. What type of workouts are you doing (or plan to)? │
│ – Strength training, HIIT, steady-state cardio, team sports, classes (yoga, spin), mixed? │
│ │
│ 3. What’s your typical daily schedule? │
│ – Work/school hours, commute, family/childcare obligations, mealtimes, etc. │
│ │
│ 4. How do you usually feel energy-wise across the day? │
│ – Do you wake up alert or groggy? Midday slump? Afternoons/evenings wired or tired? │
│ │
│ 5. What’s your sleep like? │
│ – Bedtime, wake-time, total hours, sleep quality (e.g. waking up once or restless). │
│ │
│ 6. Do you have any health considerations? │
│ – Injuries, chronic conditions, medications that affect energy or recovery. │
│ │
│ 7. Do you prefer training alone or with others? │
│ – Morning classes, evening gym buddies, home workouts? │
│ │
│ With those answers I can recommend whether morning or evening sessions will best match your energy patterns and │
│ goals. │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
--------------------------------------------------------------------------------
```
```
╭───────────────────────────────────────────────────── Input ─────────────────────────────────────────────────────╮
│ do i need a protein shake right after my workout or is that a myth │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭───────────────────────────────────────── Output (base reasoning model) ─────────────────────────────────────────╮
│ You don’t \*have\* to slam a protein shake the instant you rack the barbell—what matters far more is hitting your │
│ total and per-meal protein targets over the course of the day. The old idea of a super-narrow “anabolic window” │
│ (30–60 minutes post-workout) has largely been debunked. Here’s the bottom line: │
│ │
│ 1. Total daily protein is king │
│ • Aim for roughly 1.6–2.2 g of protein per kg body-weight per day (0.7–1.0 g/lb). │
│ • Hitting that number consistently drives muscle repair, growth, and strength gains. │
│ │
│ 2. Protein distribution matters too │
│ • Spreading your protein fairly evenly (e.g. 20–40 g every 3–4 hours) helps maximize muscle protein synthesis │
│ at each meal. │
│ • Each feeding should deliver \~2.5–3 g of leucine (the key trigger for muscle building), which usually means │
│ \~25–30 g of “complete” protein. │
│ │
│ 3. Post-workout timing is flexible │
│ • If you’ve eaten a protein-rich meal 1–2 hours before training, you’re still “fed” for many hours afterward. │
│ • If you train fasted or your last meal was \>3 hours ago, having 20–40 g of protein (shake or food) within │
│ about 1–2 hours post-workout is a smart move—but it doesn’t have to be instant. │
│ │
│ 4. Shakes are just a convenience tool │
│ • Pros: quick digestion, easy to measure, great when you’re on the go. │
│ • Cons: no real difference in muscle gain versus whole-food protein if total intake and timing are equal. │
│ │
│ When to grab the shake │
│ • You’re low on time and need to hit your next protein “bolus.” │
│ • You trained early in the morning, fasted, and won’t eat a meal soon. │
│ • You struggle to meet your daily protein goal through food alone. │
│ │
│ When you can skip it │
│ • You’ve already eaten 20–40 g of quality protein within 1–2 hours pre-workout. │
│ • You’ll be having a balanced, protein-rich meal within the next hour or so. │
│ │
│ Take-home: don’t stress about guzzling a shake immediately post-lift. Focus on your total daily protein, evenly │
│ spaced feedings hitting \~25–30 g each, and use a shake simply when it helps you plug gaps. │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
╭────────────────────────────────────── Output (fine-tuned reasoning model) ──────────────────────────────────────╮
│ To give you the best advice, could you tell me a bit more about your situation? For example: │
│ 1. What are your primary goals (muscle gain, fat loss, performance maintenance, etc.)? │
│ 2. What type of workouts do you do (strength training, HIIT, endurance cardio)? │
│ 3. How soon after you finish exercising do you normally get a solid meal? │
│ 4. Roughly how much protein are you eating each day, and from what sources? │
│ 5. Any dietary restrictions or preferences I should know about? │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
```
--------------------------------------------------------------------------------
```