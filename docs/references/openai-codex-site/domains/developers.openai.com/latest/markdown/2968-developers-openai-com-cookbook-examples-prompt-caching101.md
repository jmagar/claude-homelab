Prompt Caching 101
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
Oct 1, 2024
# Prompt Caching 101
[ CJ ](https://www.linkedin.com/in/charu-j-8a866471)
[ Charu Jaiswal
(OpenAI)
](https://www.linkedin.com/in/charu-j-8a866471)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Prompt_Caching101.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Prompt_Caching101.ipynb)
OpenAI offers discounted prompt caching for prompts exceeding 1024 tokens, resulting in up to an 80% reduction in latency for longer prompts over 10,000 tokens. By caching repetitive information across LLM API requests, you can greatly reduce both latency and costs. Prompt caching is scoped at the organization level, meaning only members of the same organization can access shared caches. Additionally, caching is eligible for zero data retention, as no data is stored during the process.
Prompt caching automatically activates for prompts longer than 1024 tokens— you don’t have to change anything in your completions request. When an API request is made, the system first checks if the beginning portion (prefix) of the prompt has already been cached. If a match is found (cache hit), the cached prompt is used, leading to reduced latency and costs. If there’s no match, the system processes the full prompt from scratch and caches the prefix for future use.
With these benefits in mind, some of the key use cases where prompt caching can be especially advantageous are:
* **Agents using tools and structured outputs**: Cache the extended list of tools and schemas.
* **Coding and writing assistants**: Insert large sections or summaries of codebases and workspaces directly in prompts.
* **Chatbots**: Cache static portions of multi-turn conversations to maintain context efficiently over extended dialogues.
In this cookbook, we’ll go through a couple examples of caching tools and images. Recall that in general, you’ll want to put static content like instructions and examples at the beginning of your prompt, and variable content, such as user-specific information, at the end. This also applies to images and tools, which must be identical even in their ordering between requests. All requests, including those with fewer than 1024 tokens, will display a cached\_tokens field of the `usage.prompt\_tokens\_details` chat completions object indicating how many of the prompt tokens were a cache hit. For requests under 1024 tokens, cached\_tokens will be zero. Caching discounts are based on the actual number of tokens processed, including those used for images, which also count toward your rate limits.
## Example 1: Caching tools and multi-turn conversations
In this example, we define tools and interactions for a customer support assistant, capable of handling tasks such as checking delivery dates, canceling orders, and updating payment methods. The assistant processes two separate messages, first responding to an initial query, followed by a delayed response to a follow-up query.
When caching tools, it is important that the tool definitions and their order remain identical for them to be included in the prompt prefix. To cache message histories in a multi-turn conversation, append new elements to the end of the messages array. In the response object and the output below, for the second completion `run2`, you can see that the `cached\_tokens` value is greater than zero, indicating successful caching.
```
`from openai import OpenAI
import os
import json
import time
api\_key = os.getenv("OPENAI\_API\_KEY")
client = OpenAI(organization='org-l89177bnhkme4a44292n5r3j', api\_key=api\_key)`
```
```
`import time
import json
# Define tools
tools = [
{
"type": "function",
"function": {
"name": "get\_delivery\_date",
"description": "Get the delivery date for a customer's order. Call this whenever you need to know the delivery date, for example when a customer asks 'Where is my package'.",
"parameters": {
"type": "object",
"properties": {
"order\_id": {
"type": "string",
"description": "The customer's order ID.",
},
},
"required": ["order\_id"],
"additionalProperties": False,
},
}
},
{
"type": "function",
"function": {
"name": "cancel\_order",
"description": "Cancel an order that has not yet been shipped. Use this when a customer requests order cancellation.",
"parameters": {
"type": "object",
"properties": {
"order\_id": {
"type": "string",
"description": "The customer's order ID."
},
"reason": {
"type": "string",
"description": "The reason for cancelling the order."
}
},
"required": ["order\_id", "reason"],
"additionalProperties": False
}
}
},
{
"type": "function",
"function": {
"name": "return\_item",
"description": "Process a return for an order. This should be called when a customer wants to return an item and the order has already been delivered.",
"parameters": {
"type": "object",
"properties": {
"order\_id": {
"type": "string",
"description": "The customer's order ID."
},
"item\_id": {
"type": "string",
"description": "The specific item ID the customer wants to return."
},
"reason": {
"type": "string",
"description": "The reason for returning the item."
}
},
"required": ["order\_id", "item\_id", "reason"],
"additionalProperties": False
}
}
},
{
"type": "function",
"function": {
"name": "update\_shipping\_address",
"description": "Update the shipping address for an order that hasn't been shipped yet. Use this if the customer wants to change their delivery address.",
"parameters": {
"type": "object",
"properties": {
"order\_id": {
"type": "string",
"description": "The customer's order ID."
},
"new\_address": {
"type": "object",
"properties": {
"street": {
"type": "string",
"description": "The new street address."
},
"city": {
"type": "string",
"description": "The new city."
},
"state": {
"type": "string",
"description": "The new state."
},
"zip": {
"type": "string",
"description": "The new zip code."
},
"country": {
"type": "string",
"description": "The new country."
}
},
"required": ["street", "city", "state", "zip", "country"],
"additionalProperties": False
}
},
"required": ["order\_id", "new\_address"],
"additionalProperties": False
}
}
},
# New tool: Update payment method
{
"type": "function",
"function": {
"name": "update\_payment\_method",
"description": "Update the payment method for an order that hasn't been completed yet. Use this if the customer wants to change their payment details.",
"parameters": {
"type": "object",
"properties": {
"order\_id": {
"type": "string",
"description": "The customer's order ID."
},
"payment\_method": {
"type": "object",
"properties": {
"card\_number": {
"type": "string",
"description": "The new credit card number."
},
"expiry\_date": {
"type": "string",
"description": "The new credit card expiry date in MM/YY format."
},
"cvv": {
"type": "string",
"description": "The new credit card CVV code."
}
},
"required": ["card\_number", "expiry\_date", "cvv"],
"additionalProperties": False
}
},
"required": ["order\_id", "payment\_method"],
"additionalProperties": False
}
}
}
]
# Enhanced system message with guardrails
messages = [
{
"role": "system",
"content": (
"You are a professional, empathetic, and efficient customer support assistant. Your mission is to provide fast, clear, "
"and comprehensive assistance to customers while maintaining a warm and approachable tone. "
"Always express empathy, especially when the user seems frustrated or concerned, and ensure that your language is polite and professional. "
"Use simple and clear communication to avoid any misunderstanding, and confirm actions with the user before proceeding. "
"In more complex or time-sensitive cases, assure the user that you're taking swift action and provide regular updates. "
"Adapt to the user’s tone: remain calm, friendly, and understanding, even in stressful or difficult situations."
"\\n\\n"
"Additionally, there are several important guardrails that you must adhere to while assisting users:"
"\\n\\n"
"1. \*\*Confidentiality and Data Privacy\*\*: Do not share any sensitive information about the company or other users. When handling personal details such as order IDs, addresses, or payment methods, ensure that the information is treated with the highest confidentiality. If a user requests access to their data, only provide the necessary information relevant to their request, ensuring no other user's information is accidentally revealed."
"\\n\\n"
"2. \*\*Secure Payment Handling\*\*: When updating payment details or processing refunds, always ensure that payment data such as credit card numbers, CVVs, and expiration dates are transmitted and stored securely. Never display or log full credit card numbers. Confirm with the user before processing any payment changes or refunds."
"\\n\\n"
"3. \*\*Respect Boundaries\*\*: If a user expresses frustration or dissatisfaction, remain calm and empathetic but avoid overstepping professional boundaries. Do not make personal judgments, and refrain from using language that might escalate the situation. Stick to factual information and clear solutions to resolve the user's concerns."
"\\n\\n"
"4. \*\*Legal Compliance\*\*: Ensure that all actions you take comply with legal and regulatory standards. For example, if the user requests a refund, cancellation, or return, follow the company’s refund policies strictly. If the order cannot be canceled due to being shipped or another restriction, explain the policy clearly but sympathetically."
"\\n\\n"
"5. \*\*Consistency\*\*: Always provide consistent information that aligns with company policies. If unsure about a company policy, communicate clearly with the user, letting them know that you are verifying the information, and avoid providing false promises. If escalating an issue to another team, inform the user and provide a realistic timeline for when they can expect a resolution."
"\\n\\n"
"6. \*\*User Empowerment\*\*: Whenever possible, empower the user to make informed decisions. Provide them with relevant options and explain each clearly, ensuring that they understand the consequences of each choice (e.g., canceling an order may result in loss of loyalty points, etc.). Ensure that your assistance supports their autonomy."
"\\n\\n"
"7. \*\*No Speculative Information\*\*: Do not speculate about outcomes or provide information that you are not certain of. Always stick to verified facts when discussing order statuses, policies, or potential resolutions. If something is unclear, tell the user you will investigate further before making any commitments."
"\\n\\n"
"8. \*\*Respectful and Inclusive Language\*\*: Ensure that your language remains inclusive and respectful, regardless of the user’s tone. Avoid making assumptions based on limited information and be mindful of diverse user needs and backgrounds."
)
},
{
"role": "user",
"content": (
"Hi, I placed an order three days ago and haven’t received any updates on when it’s going to be delivered. "
"Could you help me check the delivery date? My order number is #9876543210. I’m a little worried because I need this item urgently."
)
}
]
# Enhanced user\_query2
user\_query2 = {
"role": "user",
"content": (
"Since my order hasn't actually shipped yet, I would like to cancel it. "
"The order number is #9876543210, and I need to cancel because I’ve decided to purchase it locally to get it faster. "
"Can you help me with that? Thank you!"
)
}
# Function to run completion with the provided message history and tools
def completion\_run(messages, tools):
completion = client.chat.completions.create(
model="gpt-4o-mini",
tools=tools,
messages=messages,
tool\_choice="required"
)
usage\_data = json.dumps(completion.to\_dict(), indent=4)
return usage\_data
# Main function to handle the two runs
def main(messages, tools, user\_query2):
# Run 1: Initial query
print("Run 1:")
run1 = completion\_run(messages, tools)
print(run1)
# Delay for 7 seconds
time.sleep(7)
# Append user\_query2 to the message history
messages.append(user\_query2)
# Run 2: With appended query
print("\\nRun 2:")
run2 = completion\_run(messages, tools)
print(run2)
# Run the main function
main(messages, tools, user\_query2)`
```
```
`Run 1:
{
"id": "chatcmpl-ADeOueQSi2DIUMdLXnZIv9caVfnro",
"choices": [
{
"finish\_reason": "stop",
"index": 0,
"logprobs": null,
"message": {
"content": null,
"refusal": null,
"role": "assistant",
"tool\_calls": [
{
"id": "call\_5TnLcdD9tyVMVbzNGdejlJJa",
"function": {
"arguments": "{\\"order\_id\\":\\"9876543210\\"}",
"name": "get\_delivery\_date"
},
"type": "function"
}
]
}
}
],
"created": 1727816928,
"model": "gpt-4o-mini-2024-07-18",
"object": "chat.completion",
"system\_fingerprint": "fp\_f85bea6784",
"usage": {
"completion\_tokens": 17,
"prompt\_tokens": 1079,
"total\_tokens": 1096,
"prompt\_tokens\_details": {
"cached\_tokens": 0
},
"completion\_tokens\_details": {
"reasoning\_tokens": 0
}
}
}
Run 2:
{
"id": "chatcmpl-ADeP2i0frELC4W5RVNNkKz6TQ7hig",
"choices": [
{
"finish\_reason": "stop",
"index": 0,
"logprobs": null,
"message": {
"content": null,
"refusal": null,
"role": "assistant",
"tool\_calls": [
{
"id": "call\_viwwDZPuQh8hJFPf2Co1dYJK",
"function": {
"arguments": "{\\"order\_id\\": \\"9876543210\\"}",
"name": "get\_delivery\_date"
},
"type": "function"
},
{
"id": "call\_t1FFdAhrfvRc5IgqA6WkPKYj",
"function": {
"arguments": "{\\"order\_id\\": \\"9876543210\\", \\"reason\\": \\"Decided to purchase locally to get it faster.\\"}",
"name": "cancel\_order"
},
"type": "function"
}
]
}
}
],
"created": 1727816936,
"model": "gpt-4o-mini-2024-07-18",
"object": "chat.completion",
"system\_fingerprint": "fp\_f85bea6784",
"usage": {
"completion\_tokens": 64,
"prompt\_tokens": 1136,
"total\_tokens": 1200,
"prompt\_tokens\_details": {
"cached\_tokens": 1024
},
"completion\_tokens\_details": {
"reasoning\_tokens": 0
}
}
}`
```
## Example 2: Images
In our second example we include multiple image URLs of grocery items in the messages array, along with a user query, run three times with delays. Images—whether linked or encoded in base64 within user messages—qualify for caching. Make sure the detail parameter remains consistent, as it affects how images are tokenized. Note that GPT-4o-mini adds extra tokens to cover image processing costs, even though it uses a low-cost token model for text. Caching discounts are based on the actual number of tokens processed, including those used for images, which also count toward your rate limits.
The output for this example shows that a cache was hit for the second run, however it was not hit for the third run because of a different first url (eggs\_url instead of veggie\_url), even though the user query is the same.
```
`sauce\_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/12-04-20-saucen-by-RalfR-15.jpg/800px-12-04-20-saucen-by-RalfR-15.jpg"
veggie\_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Veggies.jpg/800px-Veggies.jpg"
eggs\_url= "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Egg\_shelf.jpg/450px-Egg\_shelf.jpg"
milk\_url= "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Lactaid\_brand.jpg/800px-Lactaid\_brand.jpg"
def multiimage\_completion(url1, url2, user\_query):
completion = client.chat.completions.create(
model="gpt-4o-2024-08-06",
messages=[
{
"role": "user",
"content": [
{
"type": "image\_url",
"image\_url": {
"url": url1,
"detail": "high"
},
},
{
"type": "image\_url",
"image\_url": {
"url": url2,
"detail": "high"
},
},
{"type": "text", "text": user\_query}
],
}
],
max\_tokens=300,
)
print(json.dumps(completion.to\_dict(), indent=4))
def main(sauce\_url, veggie\_url):
multiimage\_completion(sauce\_url, veggie\_url, "Please list the types of sauces are shown in these images")
#delay for 20 seconds
time.sleep(20)
multiimage\_completion(sauce\_url, veggie\_url, "Please list the types of vegetables are shown in these images")
time.sleep(20)
multiimage\_completion(milk\_url, sauce\_url, "Please list the types of sauces are shown in these images")
if \_\_name\_\_ == "\_\_main\_\_":
main(sauce\_url, veggie\_url)`
```
```
`{
"id": "chatcmpl-ADeV3IrUqhpjMXEgv29BFHtTQ0Pzt",
"choices": [
{
"finish\_reason": "stop",
"index": 0,
"logprobs": null,
"message": {
"content": "The images show the following types of sauces:\\n\\n1. \*\*Soy Sauce\*\* - Kikkoman brand.\\n2. \*\*Worcester Sauce\*\* - Appel brand, listed as \\"Dresdner Art.\\"\\n3. \*\*Tabasco Sauce\*\* - Original pepper sauce.\\n\\nThe second image shows various vegetables, not sauces.",
"refusal": null,
"role": "assistant"
}
}
],
"created": 1727817309,
"model": "gpt-4o-2024-08-06",
"object": "chat.completion",
"system\_fingerprint": "fp\_2f406b9113",
"usage": {
"completion\_tokens": 65,
"prompt\_tokens": 1548,
"total\_tokens": 1613,
"prompt\_tokens\_details": {
"cached\_tokens": 0
},
"completion\_tokens\_details": {
"reasoning\_tokens": 0
}
}
}
{
"id": "chatcmpl-ADeVRSI6zFINkx99k7V6ux1v5iF5f",
"choices": [
{
"finish\_reason": "stop",
"index": 0,
"logprobs": null,
"message": {
"content": "The images show different types of items. In the first image, you'll see bottles of sauces like soy sauce, Worcester sauce, and Tabasco. The second image features various vegetables, including:\\n\\n1. Napa cabbage\\n2. Kale\\n3. Carrots\\n4. Bok choy\\n5. Swiss chard\\n6. Leeks\\n7. Parsley\\n\\nThese vegetables are arranged on shelves in a grocery store setting.",
"refusal": null,
"role": "assistant"
}
}
],
"created": 1727817333,
"model": "gpt-4o-2024-08-06",
"object": "chat.completion",
"system\_fingerprint": "fp\_2f406b9113",
"usage": {
"completion\_tokens": 86,
"prompt\_tokens": 1548,
"total\_tokens": 1634,
"prompt\_tokens\_details": {
"cached\_tokens": 1280
},
"completion\_tokens\_details": {
"reasoning\_tokens": 0
}
}
}
{
"id": "chatcmpl-ADeVphj3VALQVrdnt2efysvSmdnBx",
"choices": [
{
"finish\_reason": "stop",
"index": 0,
"logprobs": null,
"message": {
"content": "The second image shows three types of sauces:\\n\\n1. Soy Sauce (Kikkoman)\\n2. Worcestershire Sauce\\n3. Tabasco Sauce",
"refusal": null,
"role": "assistant"
}
}
],
"created": 1727817357,
"model": "gpt-4o-2024-08-06",
"object": "chat.completion",
"system\_fingerprint": "fp\_2f406b9113",
"usage": {
"completion\_tokens": 29,
"prompt\_tokens": 1548,
"total\_tokens": 1577,
"prompt\_tokens\_details": {
"cached\_tokens": 0
},
"completion\_tokens\_details": {
"reasoning\_tokens": 0
}
}
}`
```
## Overall tips
To get the most out of prompt caching, consider following these best practices:
* Place static or frequently reused content at the beginning of prompts: This helps ensure better cache efficiency by keeping dynamic data towards the end of the prompt.
* Maintain consistent usage patterns: Prompts that aren’t used regularly are automatically removed from the cache. To prevent cache evictions, maintain consistent usage of prompts.
* Monitor key metrics: Regularly track cache hit rates, latency, and the proportion of cached tokens. Use these insights to fine-tune your caching strategy and maximize performance.
By implementing these practices, you can take full advantage of prompt caching, ensuring that your applications are both responsive and cost-efficient. A well-managed caching strategy will significantly reduce processing times, lower costs, and help maintain smooth user experiences.