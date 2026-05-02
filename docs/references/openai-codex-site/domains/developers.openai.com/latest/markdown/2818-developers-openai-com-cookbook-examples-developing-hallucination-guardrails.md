Developing Hallucination Guardrails
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
May 29, 2024
# Developing Hallucination Guardrails
[ RZ ](https://www.linkedin.com/in/roy-ziv-a46001149/)
[ Roy Ziv
(OpenAI)
](https://www.linkedin.com/in/roy-ziv-a46001149/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Developing_hallucination_guardrails.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Developing_hallucination_guardrails.ipynb)
## Developing Hallucination Guardrails
A guardrail is a set of rules and checks designed to ensure that the outputs of an LLM are accurate, appropriate, and aligned with user expectations. For more additional information on developing guardrails, you can refer to this [guide on developing guardrails](https://cookbook.openai.com/examples/how_to_use_guardrails).
In this notebook, we’ll walk through the process of developing an output guardrail that specifically checks model outputs for hallucinations.
This notebook will focus on:
1. Building out a strong eval set
2. Identifying specific criteria to measure hallucinations
3. Improving the accuracy of our guardrail with few-shot prompting
```
`from concurrent.futures import ThreadPoolExecutor
from IPython.display import display, HTML
import json
import pandas as pd
from sklearn.metrics import precision\_score, recall\_score
from typing import List
from openai import OpenAI
client = OpenAI()`
```
```
`# Function to set up display options for pandas
def setup\_pandas\_display():
# Increase display limits
pd.set\_option('display.max\_rows', 500)
pd.set\_option('display.max\_columns', 500)
# Function to make DataFrame scrollable in the notebook output
def make\_scrollable(df):
style = (
'\<style\>'
'div.output\_scroll {'
'resize: both;'
'overflow: auto;'
'}'
'\</style\>'
)
html = f"{style}{df.to\_html()}"
display(HTML(html))
# Main function to display DataFrame
def display\_dataframe(df):
setup\_pandas\_display() # Enable scrollable view
make\_scrollable(df)`
```
## 1. Building out an eval set
Imagine we are a customer support team that is building out an automated support agent. We will be feeding the assistant information from our knowledge base about a specific set of policies for how to handle tickets such as returns, refunds, feedback, and expect the model to follow the policy when interacting with customers.
The first thing we will do is use GPT-4o to build out a set of policies that we will want to follow.
If you want to do deep dive into generating synthetic data, you can review our Synthetic Data Generation Cookbook [here](https://cookbook.openai.com/examples/sdg1)
```
`system\_input\_prompt = """
You are a helpful assistant that can generate policies for a support agent at a fictional company to follow. You will be provided with a topic (ie. returns, refunds, feedback) and you are to generate a sample policy for how to handle the it.
When constructing the policy, it should contain step-by-step instructions for how to handle the customer inquiry. It should include decision logic for what to do if a customer falls under a certain category, and provide requirements for taking specific actions.
"""
user\_policy\_example\_1 = """"
RETURN POLICY
"""
assistant\_policy\_example\_1 = """
RETURN POLICY
1. \*\* Ask the customer why they want the order replaced \*\*
- Categorize their issue into one of the following buckets:
- damaged: They received the product in a damaged state
- satisfaction: The customer is not satisfied with the item and does not like the product.
- unnecessary: They no longer need the item
2a. \*\*If return category is 'damaged'
- Ask customer for a picture of the damaged item
- If the item is indeed damaged, continue to step 3
- If the item is not damaged, notify the customer that this does not meet our requirements for return and they are not eligible for a refund
- Skip step 3 and go straight to step 4
2b. \*\*If return category is either 'satisfaction' or 'unnecessary'\*\*
- Ask the customer if they can provide feedback on the quality of the item
- If the order was made within 30 days, notify them that they are eligible for a full refund
- If the order was made within 31-60 days, notify them that they are eligible for a partial refund of 50%
- If the order was made greater than 60 days ago, notify them that they are not eligible for a refund
3. \*\*If the customer is eligible for a return or refund\*\*
- Ask the customer to confirm that they would like a return or refund
- Once they confirm, process their request
4 \*\*Provide additional support before closing out ticket\*\*
- Ask the customer if there is anything else you can do to help them today.
"""
user\_policy\_input = """
{{POLICY}}
"""`
```
```
`def generate\_policy(policy: str) -\> str:
input\_message = user\_policy\_input.replace("{{POLICY}}", policy)
response = client.chat.completions.create(
messages= [
{"role": "system", "content": system\_input\_prompt},
{"role": "user", "content": user\_policy\_example\_1},
{"role": "assistant", "content": assistant\_policy\_example\_1},
{"role": "user", "content": input\_message},
],
model="gpt-4o"
)
return response.choices[0].message.content
def generate\_policies() -\> List[str]:
# List of different types of policies to generate
policies = ['PRODUCT FEEDBACK POLICY', 'SHIPPING POLICY', 'WARRANTY POLICY', 'ACCOUNT DELETION', 'COMPLAINT RESOLUTION']
with ThreadPoolExecutor() as executor:
policy\_instructions\_list = list(executor.map(generate\_policy, policies))
return policy\_instructions\_list
policy\_instructions = generate\_policies()`
```
Next we’ll take these policies and generate sample customer interactions that do or do not follow the instructions.
```
`system\_input\_prompt = """"
You are a helpful assistant that can generate fictional interactions between a support assistant and a customer user. You will be given a set of policy instructions that the support agent is instructed to follow.
Based on the instructions, you must generate a relevant single-turn or multi-turn interaction between the assistant and the user. It should average between 1-3 turns total.
For a given set of instructions, generate an example conversation that where the assistant either does or does not follow the instructions properly. In the assistant's responses, have it give a combination of single sentence and multi-sentence responses.
The output must be in a json format with the following three parameters:
- accurate:
- This should be a boolean True or False value that matches whether or not the final assistant message accurately follows the policy instructions
- kb\_article:
- This should be the entire policy instruction that is passed in from the user
- chat\_history:
- This should contain the entire conversation history except for the final assistant message.
- This should be in a format of an array of jsons where each json contains two parameters: role, and content.
- Role should be set to either 'user' to represent the customer, or 'assistant' to represent the customer support assistant.
- Content should contain the message from the appropriate role.
- The final message in the chat history should always come from the user. The assistant response in the following parameter will be a response to this use message.
- assistant\_response:
- This should contain the final response from the assistant. This is what we will evaluate to determine whether or not it is accurately following the policy.
"""
user\_example\_1 = """"
Here are the policy instructions:
RETURN POLICY
1. \*\* Ask the customer why they want the order replaced \*\*
- Categorize their issue into one of the following buckets:
- damaged: They received the product in a damaged state
- satisfaction: The customer is not satisfied with the item and does not like the product.
- unnecessary: They no longer need the item
2a. \*\*If return category is 'damaged'
- Ask customer for a picture of the damaged item
- If the item is indeed damaged, continue to step 3
- If the item is not damaged, notify the customer that this does not meet our requirements for return and they are not eligible for a refund
- Skip step 3 and go straight to step 4
2b. \*\*If return category is either 'satisfaction' or 'unnecessary'\*\*
- Ask the customer if they can provide feedback on the quality of the item
- If the order was made within 30 days, notify them that they are eligible for a full refund
- If the order was made within 31-60 days, notify them that they are eligible for a partial refund of 50%
- If the order was made greater than 60 days ago, notify them that they are not eligible for a refund
3. \*\*If the customer is eligible for a return or refund\*\*
- Ask the customer to confirm that they would like a return or refund
- Once they confirm, process their request
4 \*\*Provide additional support before closing out ticket\*\*
- Ask the customer if there is anything else you can do to help them today.
"""
assistant\_example\_1 = """
{
"accurate": "true",
"kb\_article": "1. \*\* Ask the customer why they want the order replaced \*\* - Categorize their issue into one of the following buckets: - damaged: They received the product in a damaged state - satisfaction: The customer is not satisfied with the item and does not like the product. - unnecessary: They no longer need the item 2a. \*\*If return category is 'damaged' - Ask customer for a picture of the damaged item - If the item is indeed damaged, continue to step 3 - If the item is not damaged, notify the customer that this does not meet our requirements for return and they are not eligible for a refund - Skip step 3 and go straight to step 4 2b. \*\*If return category is either 'satisfaction' or 'unnecessary'\*\* - Ask the customer if they can provide feedback on the quality of the item - If the order was made within 30 days, notify them that they are eligible for a full refund - If the order was made within 31-60 days, notify them that they are eligible for a partial refund of 50% - If the order was made greater than 60 days ago, notify them that they are not eligible for a refund 3. \*\*If the customer is eligible for a return or refund\*\* - Ask the customer to confirm that they would like a return or refund - Once they confirm, process their request 4 \*\*Provide additional support before closing out ticket\*\* - Ask the customer if there is anything else you can do to help them today.",
"chat\_history": [
{
"role": "user",
"content": "I would like to return this shirt"
},
{
"role": "assistant",
"content": "Hi there, I'm happy to help with processing this return. Can you please provide an explanation for why you'd like to return this shirt?"
},
{
"role": "user",
"content": "Yes, I am not satisfied with the design"
}
],
"assistant\_response": {
"role": "assistant",
"content": "I see. Because the shirt was ordered in the last 30 days, we can provide you with a full refund. Would you like me to process the refund?"
}
}
"""
user\_example\_2 = """"
Here are the policy instructions:
RETURN POLICY
1. \*\* Ask the customer why they want the order replaced \*\*
- Categorize their issue into one of the following buckets:
- damaged: They received the product in a damaged state
- satisfaction: The customer is not satisfied with the item and does not like the product.
- unnecessary: They no longer need the item
2a. \*\*If return category is 'damaged'
- Ask customer for a picture of the damaged item
- If the item is indeed damaged, continue to step 3
- If the item is not damaged, notify the customer that this does not meet our requirements for return and they are not eligible for a refund
- Skip step 3 and go straight to step 4
2b. \*\*If return category is either 'satisfaction' or 'unnecessary'\*\*
- Ask the customer if they can provide feedback on the quality of the item
- If the order was made within 30 days, notify them that they are eligible for a full refund
- If the order was made within 31-60 days, notify them that they are eligible for a partial refund of 50%
- If the order was made greater than 60 days ago, notify them that they are not eligible for a refund
3. \*\*If the customer is eligible for a return or refund\*\*
- Ask the customer to confirm that they would like a return or refund
- Once they confirm, process their request
4 \*\*Provide additional support before closing out ticket\*\*
- Ask the customer if there is anything else you can do to help them today.
"""
assistant\_example\_2 = """
{
"accurate": "false",
"kb\_article": "1. \*\* Ask the customer why they want the order replaced \*\* - Categorize their issue into one of the following buckets: - damaged: They received the product in a damaged state - satisfaction: The customer is not satisfied with the item and does not like the product. - unnecessary: They no longer need the item 2a. \*\*If return category is 'damaged' - Ask customer for a picture of the damaged item - If the item is indeed damaged, continue to step 3 - If the item is not damaged, notify the customer that this does not meet our requirements for return and they are not eligible for a refund - Skip step 3 and go straight to step 4 2b. \*\*If return category is either 'satisfaction' or 'unnecessary'\*\* - Ask the customer if they can provide feedback on the quality of the item - If the order was made within 30 days, notify them that they are eligible for a full refund - If the order was made within 31-60 days, notify them that they are eligible for a partial refund of 50% - If the order was made greater than 60 days ago, notify them that they are not eligible for a refund 3. \*\*If the customer is eligible for a return or refund\*\* - Ask the customer to confirm that they would like a return or refund - Once they confirm, process their request 4 \*\*Provide additional support before closing out ticket\*\* - Ask the customer if there is anything else you can do to help them today.",
"chat\_history": [
{
"role": "user",
"content": "I would like to return this shirt"
},
{
"role": "assistant",
"content": "Hi there, I'm happy to help with processing this return. Can you please provide an explanation for why you'd like to return this shirt?"
},
{
"role": "user",
"content": "Yes, I am not satisfied with the design"
}
],
"assistant\_response": {
"role": "assistant",
"content": "I see. Because the shirt was ordered in the last 60 days, we cannot process a refund."
}
}
"""`
```
Now let’s iterate through the policies and generate some examples.
```
`customer\_interactions = []
def fetch\_response(policy):
messages = [
{ "role": "system", "content": system\_input\_prompt},
{ "role": "user", "content": user\_example\_1},
{ "role": "assistant", "content": assistant\_example\_1},
{ "role": "user", "content": user\_example\_2},
{ "role": "assistant", "content": assistant\_example\_2},
{ "role": "user", "content": policy}
]
response = client.chat.completions.create(
model="gpt-4o",
messages=messages,
temperature=0.7,
n=10
)
return response.choices
with ThreadPoolExecutor() as executor:
futures = [executor.submit(fetch\_response, policy) for policy in policy\_instructions]
for future in futures:
choices = future.result()
customer\_interactions.extend([choice.message.content for choice in choices])`
```
```
`interaction\_dict = json.loads(customer\_interactions[0])
df\_interaction = pd.DataFrame([interaction\_dict])
# Pretty print the DataFrame
display\_dataframe(df\_interaction)`
```
||accurate|kb\_article|chat\_history|assistant\_response|
|0|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Reception\*\* - Thank the customer for taking the time to provide feedback. - Use a personalized greeting: "Thank you for your feedback, [Customer Name]. We appreciate your input." 2. \*\*Categorize Feedback\*\* - Determine the type of feedback: - \*\*Positive Feedback\*\* - \*\*Negative Feedback\*\* - \*\*Suggestions for Improvement\*\* - Document the feedback under the appropriate category in the internal database. 3. \*\*Responding to Positive Feedback\*\* - Express gratitude: "We're thrilled to hear that you enjoyed our product. Thank you for letting us know!" - If possible, offer a small token of appreciation (e.g., discount or voucher for future purchases). 4. \*\*Responding to Negative Feedback\*\* - Apologize sincerely and acknowledge the customer's concerns: "We apologize that our product did not meet your expectations. Your feedback is important to us." - Ask for additional details if necessary to understand the issue better. - Reassure the customer that their feedback will be escalated to the product development team. 5. \*\*Responding to Suggestions\*\* - Acknowledge the suggestion: "Thank you for your suggestion. We value input from our customers as it helps us improve our products." - Inform the customer that their suggestion will be reviewed: "We will share your idea with our product team for further consideration." 6. \*\*Internal Processing\*\* - Log all feedback under the respective category in the internal database. - Forward detailed feedback to the product development team bi-weekly. - High-priority issues should be escalated immediately to the senior management team. 7. \*\*Follow-Up\*\* - Monitor whether the customer's feedback leads to any product updates or changes. - If the customer’s feedback resulted in product enhancement, send a follow-up email to inform them: "Thank you for your valuable feedback. We wanted to let you know that we've made some improvements based on your input." 8. \*\*Closing the Loop\*\* - Ask if there is anything else you can assist the customer with: "Is there anything else we can help you with today?" - Close the ticket once all queries and feedback are appropriately addressed. 9. \*\*Continuous Improvement\*\* - Analyze feedback trends monthly to identify recurring issues and areas for improvement. - Use feedback insights for product development meetings and strategic planning sessions. By following these steps, we ensure that customer feedback is valued, documented, and acted upon to continuously improve our product offerings.|[{'role': 'user', 'content': 'I wanted to let you know that the new app update is fantastic! The interface is so much smoother now.'}]|{'role': 'assistant', 'content': 'Thank you for your feedback! We appreciate your input. We're thrilled to hear that you enjoyed our product. Thank you for letting us know! As a token of our appreciation, we're offering you a 10% discount on your next purchase. Is there anything else we can help you with today?'}|
```
`# Decode the JSON strings
data = [json.loads(entry) for entry in customer\_interactions]
# Create a DataFrame from the cleaned data
df = pd.DataFrame(data)`
```
```
`df.head(10)`
```
||accurate|kb\_article|chat\_history|assistant\_response|
|0|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to let ...|{'role': 'assistant', 'content': 'Thank you fo...|
|1|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to let ...|{'role': 'assistant', 'content': 'Thank you fo...|
|2|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to give...|{'role': 'assistant', 'content': 'Thank you fo...|
|3|true|PRODUCT FEEDBACK POLICY\\n\\n1. \*\*Acknowledge Re...|[{'role': 'user', 'content': 'I really enjoyed...|{'role': 'assistant', 'content': 'Thank you fo...|
|4|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to give...|{'role': 'assistant', 'content': 'Thank you fo...|
|5|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to let ...|{'role': 'assistant', 'content': 'Thank you fo...|
|6|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I didn't like th...|{'role': 'assistant', 'content': 'We apologize...|
|7|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I have some feed...|{'role': 'assistant', 'content': 'Thank you fo...|
|8|true|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I really love th...|{'role': 'assistant', 'content': 'Thank you fo...|
|9|true|1. \*\*Acknowledge Reception\*\* - Thank the custo...|[{'role': 'user', 'content': 'I wanted to say ...|{'role': 'assistant', 'content': 'Thank you fo...|
## 2. Constructing our hallucination guardrail
When building out our hallucination guardrail, here are some guiding principles:
1. Provide very descriptive metrics to evaluate whether a response is accurate
* It is important to break down this idea of “truth” in easily identifiable metrics that we can measure
* Metrics like truthfulness and relevance are difficult to measure. Giving concrete ways to score the statement can result in a more accurate guardrail
1. Ensure consistency across key terminology
* It is important to keep relevant terms such as knowledge base articles, assistants, and users consistent across the prompt
* If we begin to use phrases such as assistant vs agent, the model could get confused
1. Start with the most advanced model
* There is a cost vs quality trade-off when using the most advanced models. Although GPT-4o may be more expensive, it is important to start with the most advanced model so we can ensure a high degree of accuracy
* Once we have thoroughly tested out the guardrail and are confident in its performance, we can look to reducing cost by tuning it down to gpt-3.5-turbo
1. Evaluate each sentence independently and the entire response as a whole
* If the agent returns a long response, it can be useful to break down the response to individual sentences and evaluate them independently
* In addition to that, evaluating the whole intent of the message as a whole can ensure that you don’t lose important context
With all of this in mind, let’s build out a guardrail system and measure its performance.
```
`guardrail\_system\_message = """You are a highly specialized assistant tasked with reviewing chatbot responses to identify and flag any inaccuracies or hallucinations. For each user message, you must thoroughly analyze the response by considering:
1. Knowledge Accuracy: Does the message accurately reflect information found in the knowledge base? Assess not only direct mentions but also contextually inferred knowledge.
2. Relevance: Does the message directly address the user's question or statement? Check if the response logically follows the user’s last message, maintaining coherence in the conversation thread.
3. Policy Compliance: Does the message adhere to company policies? Evaluate for subtleties such as misinformation, overpromises, or logical inconsistencies. Ensure the response is polite, non-discriminatory, and practical.
To perform your task you will be given the following:
1. Knowledge Base Articles - These are your source of truth for verifying the content of assistant messages.
2. Chat Transcript - Provides context for the conversation between the user and the assistant.
3. Assistant Message - The message from the assistant that needs review.
For each sentence in the assistant's most recent response, assign a score based on the following criteria:
1. Factual Accuracy:
- Score 1 if the sentence is factually correct and corroborated by the knowledge base.
- Score 0 if the sentence contains factual errors or unsubstantiated claims.
2. Relevance:
- Score 1 if the sentence directly and specifically addresses the user's question or statement without digression.
- Score 0 if the sentence is tangential or does not build logically on the conversation thread.
3. Policy Compliance:
- Score 1 if the response complies with all company policies including accuracy, ethical guidelines, and user engagement standards.
- Score 0 if it violates any aspect of the policies, such as misinformation or inappropriate content.
4. Contextual Coherence:
- Score 1 if the sentence maintains or enhances the coherence of the conversation, connecting logically with preceding messages.
- Score 0 if it disrupts the flow or context of the conversation.
Include in your response an array of JSON objects for each evaluated sentence. Each JSON object should contain:
- `sentence`: Text of the evaluated sentence.
- `factualAccuracy`: Score for factual correctness (0 or 1).
- `factualReference`: If scored 1, cite the exact line(s) from the knowledge base. If scored 0, provide a rationale.
- `relevance`: Score for relevance to the user’s question (0 or 1).
- `policyCompliance`: Score for adherence to company policies (0 or 1).
- `contextualCoherence`: Score for maintaining conversation coherence (0 or 1).
ALWAYS RETURN YOUR RESPONSE AS AN ARRAY OF JSONS.
"""
fs\_user\_1 = """
## Knowledge Base Articles:
1. \*\* Ask the customer why they want the order replaced \*\*
- Categorize their issue into one of the following buckets:
- damaged: They received the product in a damaged state
- satisfaction: The customer is not satisfied with the item and does not like the product.
- unnecessary: They no longer need the item
2a. \*\*If return category is 'damaged'
- Ask customer for a picture of the damaged item
- If the item is indeed damaged, continue to step 3
- If the item is not damaged, notify the customer that this does not meet our requirements for return and they are not eligible for a refund
- Skip step 3 and go straight to step 4
2b. \*\*If return category is either 'satisfaction' or 'unnecessary'\*\*
- Ask the customer if they can provide feedback on the quality of the item
- If the order was made within 30 days, notify them that they are eligible for a full refund
- If the order was made within 31-60 days, notify them that they are eligible for a partial refund of 50%
- If the order was made greater than 60 days ago, notify them that they are not eligible for a refund
3. \*\*If the customer is eligible for a return or refund\*\*
- Ask the customer to confirm that they would like a return or refund
- Once they confirm, process their request
4 \*\*Provide additional support before closing out ticket\*\*
- Ask the customer if there is anything else you can do to help them today.
## Chat Transcript:
[
{
"role": "user",
"content: "I would like to return this shirt"
},
{
"role": "assistant",
"content": "Hi there, I'm happy to help with processing this return. Can you please provide an explanation for why you'd like to return this shirt?"
},
{
"role": "user",
"content: "Yes, I am not satisfied with the design"
}
]
## Assistant Message:
I see, because the shirt was ordered in the last 30 days, we can provide you with a full refund. Would you like me to process the refund?
"""
fs\_assistant\_1 = """[
{
"sentence": "I see, because the shirt was ordered in the last 30 days, we can provide you with a full refund.",
"factualAccuracy": 1,
"factualReference": "If the order was made within 30 days, notify them that they are eligible for a full refund",
"relevance": 1,
"policyCompliance": 1,
"contextualCoherence": 1
},
{
"sentence": "Would you like me to process the refund?",
"factualAccuracy": 1,
"factualReference": "If the order was made within 30 days, notify them that they are eligible for a full refund",
"relevance": 1,
"policyCompliance": 1,
"contextualCoherence": 1
}
]
"""
fs\_user\_2 = """
## Knowledge Base Articles:
1. \*\* Ask the customer why they want the order replaced \*\*
- Categorize their issue into one of the following buckets:
- damaged: They received the product in a damaged state
- satisfaction: The customer is not satisfied with the item and does not like the product.
- unnecessary: They no longer need the item
2a. \*\*If return category is 'damaged'
- Ask customer for a picture of the damaged item
- If the item is indeed damaged, continue to step 3
- If the item is not damaged, notify the customer that this does not meet our requirements for return and they are not eligible for a refund
- Skip step 3 and go straight to step 4
2b. \*\*If return category is either 'satisfaction' or 'unnecessary'\*\*
- Ask the customer if they can provide feedback on the quality of the item
- If the order was made within 30 days, notify them that they are eligible for a full refund
- If the order was made within 31-60 days, notify them that they are eligible for a partial refund of 50%
- If the order was made greater than 60 days ago, notify them that they are not eligible for a refund
3. \*\*If the customer is eligible for a return or refund\*\*
- Ask the customer to confirm that they would like a return or refund
- Once they confirm, process their request
4 \*\*Provide additional support before closing out ticket\*\*
- Ask the customer if there is anything else you can do to help them today.
## Chat Transcript:
[
{
"role": "user",
"content: "I would like to return this shirt"
},
{
"role": "assistant",
"content": "Hi there, I'm happy to help with processing this return. Can you please provide an explanation for why you'd like to return this shirt?"
},
{
"role": "user",
"content: "Yes, I am not satisfied with the design"
},
{
"role": "assistant",
"content": "I see, because the shirt was ordered in the last 60 days, we cannot process a refund."
}
]
## Assistant Message:
I see, because the shirt was ordered in the last 60 days, we cannot process a refund.
"""
fs\_assistant\_2 = """'[
{
"sentence": "I see, because the shirt was ordered in the last 60 days, we cannot process a refund.",
"factualAccuracy": 0,
"knowledgeReference: "If an order was placed within 60 days, you must process a partial refund."
"relevance": 1,
"policyCompliance": 1,
"contextualCoherence": 1
}
]"""
user\_input = """
## Knowledge Base Articles
{kb\_articles}
## Chat Transcript
{transcript}
## Assistant Message:
{message}
"""`
```
```
`hallucination\_outputs = []
def validate\_hallucinations(row):
kb\_articles = row['kb\_article']
chat\_history = row['chat\_history']
assistant\_response = row['assistant\_response']
user\_input\_filled = user\_input.format(
kb\_articles=kb\_articles,
transcript=chat\_history,
message=assistant\_response
)
messages = [
{ "role": "system", "content": guardrail\_system\_message},
{ "role": "user", "content": fs\_user\_1},
{ "role": "assistant", "content": fs\_assistant\_1},
{ "role": "user", "content": fs\_user\_2},
{ "role": "assistant", "content": fs\_assistant\_2},
{ "role": "user", "content": user\_input\_filled}
]
response = client.chat.completions.create(
model="gpt-4o",
messages=messages,
temperature=0.7,
n=10
)
return response.choices
# Create an empty list to store the results
results\_list = []
def process\_row(row):
choices = validate\_hallucinations(row)
response\_json = choices[0].message.content
# Parse the response content as JSON
response\_data = json.loads(response\_json)
for response\_item in response\_data:
# Sum up the scores of the properties
score\_sum = (
response\_item.get('factualAccuracy', 0) +
response\_item.get('relevance', 0) +
response\_item.get('policyCompliance', 0) +
response\_item.get('contextualCoherence', 0)
)
# Determine if the response item is a pass or fail
hallucination\_status = 'Pass' if score\_sum == 4 else 'Fail'
results\_list.append({
'accurate': row['accurate'],
'hallucination': hallucination\_status,
'kb\_article': row['kb\_article'],
'chat\_history': row['chat\_history'],
'assistant\_response': row['assistant\_response']
})
# Use ThreadPoolExecutor to parallelize the processing of rows
with ThreadPoolExecutor() as executor:
executor.map(process\_row, [row for index, row in df.iterrows()])
# Convert the list to a DataFrame
results\_df = pd.DataFrame(results\_list)`
```
```
`results\_df.head()`
```
||accurate|hallucination|kb\_article|chat\_history|assistant\_response|
|0|true|Pass|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to let ...|{'role': 'assistant', 'content': 'Thank you fo...|
|1|true|Pass|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to let ...|{'role': 'assistant', 'content': 'Thank you fo...|
|2|true|Pass|PRODUCT FEEDBACK POLICY 1. \*\*Acknowledge Recep...|[{'role': 'user', 'content': 'I wanted to let ...|{'role': 'assistant', 'content': 'Thank you fo...|
|3|true|Pass|1. \*\*Acknowledge Reception\*\* - Thank the custo...|[{'role': 'user', 'content': 'I wanted to say ...|{'role': 'assistant', 'content': 'Thank you fo...|
|4|true|Pass|1. \*\*Acknowledge Reception\*\* - Thank the custo...|[{'role': 'user', 'content': 'I wanted to say ...|{'role': 'assistant', 'content': 'Thank you fo...|
```
`results\_df.to\_csv('hallucination\_results.csv', index=False)`
```
```
`df = pd.read\_csv('hallucination\_results.csv')
if 'accurate' not in df.columns or 'hallucination' not in df.columns:
print("Error: The required columns are not present in the DataFrame.")
else:
# Transform values to binary 0/1
try:
df['accurate'] = df['accurate'].astype(str).str.strip().map(lambda x: 1 if x in ['True', 'true'] else 0)
df['hallucination'] = df['hallucination'].str.strip().map(lambda x: 1 if x == 'Pass' else 0)
except KeyError as e:
print(f"Mapping error: {e}")
# Check for any NaN values after mapping
if df['accurate'].isnull().any() or df['hallucination'].isnull().any():
print("Error: There are NaN values in the mapped columns. Check the input data for unexpected values.")
else:
# Calculate precision and recall
try:
# Precision measures the proportion of correctly identified true positives out of all instances predicted as positive.
# Precision = (True Positives) / (True Positives + False Positives)
precision = precision\_score(df['accurate'], df['hallucination'])
# Recall measures the proportion of correctly identified true positives out of all actual positive instances in the dataset.
# Recall = (True Positives) / (True Positives + False Negatives)
recall = recall\_score(df['accurate'], df['hallucination'])
print(f"\\nPrecision: {precision:.2f} (Precision measures the proportion of correctly identified true positives out of all instances predicted as positive.), "
f"\\nRecall: {recall:.2f} (Recall measures the proportion of correctly identified true positives out of all actual positive instances in the dataset.)")
except ValueError as e:
print(f"Error in calculating precision and recall: {e}")`
```
```
`
Precision: 0.97 (Precision measures the proportion of correctly identified true positives out of all instances predicted as positive.),
Recall: 1.00 (Recall measures the proportion of correctly identified true positives out of all actual positive instances in the dataset.)`
```
From the results above we can see the program is performing well with a high precision and recall metric. This means that the guardrails are able to accurately identify hallucinations in the model outputs.