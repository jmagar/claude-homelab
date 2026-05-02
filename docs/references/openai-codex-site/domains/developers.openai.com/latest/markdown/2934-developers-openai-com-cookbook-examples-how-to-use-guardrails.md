How to implement LLM guardrails
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
Dec 19, 2023
# How to implement LLM guardrails
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/How_to_use_guardrails.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/How_to_use_guardrails.ipynb)
In this notebook we share examples of how to implement guardrails for your LLM applications. A guardrail is a generic term for **detective controls** that aim to steer your application. Greater steerability is a common requirement given the inherent randomness of LLMs, and so creating effective guardrails has become one of the most common areas of performance optimization when pushing an LLM from prototype to production.
Guardrails are incredibly [diverse](https://github.com/NVIDIA/NeMo-Guardrails/blob/main/examples/README.md) and can be deployed to virtually any context you can imagine something going wrong with LLMs. This notebook aims to give simple examples that can be extended to meet your unique use case, as well as outlining the trade-offs to consider when deciding whether to implement a guardrail, and how to do it.
This notebook will focus on:
1. **Input guardrails** that flag inappropriate content before it gets to your LLM
2. **Output guardrails** that validate what your LLM has produced before it gets to the customer
**Note:** This notebook tackles guardrails as a generic term for detective controls around an LLM - for the official libraries that provide distributions of pre-built guardrails frameworks, please check out the following:
* [NeMo Guardrails](https://github.com/NVIDIA/NeMo-Guardrails/tree/main)
* [Guardrails AI](https://github.com/ShreyaR/guardrails)
```
`import openai
GPT\_MODEL = 'gpt-4o-mini'`
```
## 1. Input guardrails
Input guardrails aim to prevent inappropriate content getting to the LLM in the first place - some common use cases are:
* **Topical guardrails:** Identify when a user asks an off-topic question and give them advice on what topics the LLM can help them with.
* **Jailbreaking:** Detect when a user is trying to hijack the LLM and override its prompting.
* **Prompt injection:** Pick up instances of prompt injection where users try to hide malicious code that will be executed in any downstream functions the LLM executes.
In all of these they act as a preventative control, running either before or in parallel with the LLM, and triggering your application to behave differently if one of these criteria are met.
### Designing a guardrail
When designing guardrails it is important to consider the trade-off between **accuracy**, **latency** and **cost**, where you try to achieve maximum accuracy for the least impact to your bottom line and the user’s experience.
We’ll begin with a simple **topical guardrail** which aims to detect off-topic questions and prevent the LLM from answering if triggered. This guardrail consists of a simple prompt and uses `gpt-4o-mini`, maximising latency/cost holding a good enough accuracy, but if we wanted to optimize further we could consider:
* **Accuracy:** You could consider fine-tuning `gpt-4o-mini` or few-shot examples to increase the accuracy. RAG can also be effective if you have a corpus of information that can help determine whether a piece of content is allowed or not.
* **Latency/Cost:** You could try fine-tuning smaller models, such as `babbage-002` or open-source offerings like Llama, which can perform quite well when given enough training examples. When using open-source offerings you can also tune the machines you are using for inference to maximize either cost or latency reduction.
This simple guardrail aims to ensure the LLM only answers to a predefined set of topics, and responds to out-of-bounds queries with a canned message.
### Embrace async
A common design to minimize latency is to send your guardrails asynchronously along with your main LLM call. If your guardrails get triggered you send back their response, otherwise send back the LLM response.
We’ll use this approach, creating an `execute\_chat\_with\_guardrails` function that will run our LLM’s `get\_chat\_response` and the `topical\_guardrail` guardrail in parallel, and return the LLM response only if the guardrail returns `allowed`.
### Limitations
You should always consider the limitations of guardrails when developing your design. A few of the key ones to be aware of are:
* When using LLMs as a guardrail, be aware that they have the same vulnerabilities as your base LLM call itself. For example, a **prompt injection** attempt could be successful in evading both your guardrail and your actual LLM call.
* As conversations get longer, LLMs are more susceptible to **jailbreaking** as your instructions become diluted by the extra text.
* Guardrails can harm the user experience if you make them overly restrictive to compensate for the issues noted above. This manifests as **over-refusals**, where your guardrails reject innocuous user requests because there are similarities with prompt injection or jailbreaking attempts.
### Mitigations
If you can combine guardrails with rules-based or more traditional machine learning models for detection this can mitigate some of these risks. We’ve also seen customers have guardrails that only ever consider the latest message, to alleviate the risks of the model being confused by a long conversation.
We would also recommend doing a gradual roll-out with active monitoring of conversations so you can pick up instances of prompt injection or jailbreaking, and either add more guardrails to cover these new types of behaviour, or include them as training examples to your existing guardrails.
```
`system\_prompt = "You are a helpful assistant."
bad\_request = "I want to talk about horses"
good\_request = "What are the best breeds of dog for people that like cats?"`
```
```
`import asyncio
async def get\_chat\_response(user\_request):
print("Getting LLM response")
messages = [
{"role": "system", "content": system\_prompt},
{"role": "user", "content": user\_request},
]
response = openai.chat.completions.create(
model=GPT\_MODEL, messages=messages, temperature=0.5
)
print("Got LLM response")
return response.choices[0].message.content
async def topical\_guardrail(user\_request):
print("Checking topical guardrail")
messages = [
{
"role": "system",
"content": "Your role is to assess whether the user question is allowed or not. The allowed topics are cats and dogs. If the topic is allowed, say 'allowed' otherwise say 'not\_allowed'",
},
{"role": "user", "content": user\_request},
]
response = openai.chat.completions.create(
model=GPT\_MODEL, messages=messages, temperature=0
)
print("Got guardrail response")
return response.choices[0].message.content
async def execute\_chat\_with\_guardrail(user\_request):
topical\_guardrail\_task = asyncio.create\_task(topical\_guardrail(user\_request))
chat\_task = asyncio.create\_task(get\_chat\_response(user\_request))
while True:
done, \_ = await asyncio.wait(
[topical\_guardrail\_task, chat\_task], return\_when=asyncio.FIRST\_COMPLETED
)
if topical\_guardrail\_task in done:
guardrail\_response = topical\_guardrail\_task.result()
if guardrail\_response == "not\_allowed":
chat\_task.cancel()
print("Topical guardrail triggered")
return "I can only talk about cats and dogs, the best animals that ever lived."
elif chat\_task in done:
chat\_response = chat\_task.result()
return chat\_response
else:
await asyncio.sleep(0.1) # sleep for a bit before checking the tasks again`
```
```
`# Call the main function with the good request - this should go through
response = await execute\_chat\_with\_guardrail(good\_request)
print(response)`
```
```
`Checking topical guardrail
Got guardrail response
Getting LLM response
Got LLM response
If you like cats and are considering getting a dog, there are several breeds known for their compatibility with feline friends. Here are some of the best dog breeds that tend to get along well with cats:
1. \*\*Golden Retriever\*\*: Friendly and tolerant, Golden Retrievers often get along well with other animals, including cats.
2. \*\*Labrador Retriever\*\*: Similar to Golden Retrievers, Labs are social and friendly, making them good companions for cats.
3. \*\*Cavalier King Charles Spaniel\*\*: This breed is gentle and affectionate, often forming strong bonds with other pets.
4. \*\*Basset Hound\*\*: Basset Hounds are laid-back and generally have a calm demeanor, which can help them coexist peacefully with cats.
5. \*\*Beagle\*\*: Beagles are friendly and sociable, and they often enjoy the company of other animals, including cats.
6. \*\*Pug\*\*: Pugs are known for their playful and friendly nature, which can make them good companions for cats.
7. \*\*Shih Tzu\*\*: Shih Tzus are typically friendly and adaptable, often getting along well with other pets.
8. \*\*Collie\*\*: Collies are known for their gentle and protective nature, which can extend to their relationships with cats.
9. \*\*Newfoundland\*\*: These gentle giants are known for their calm demeanor and often get along well with other animals.
10. \*\*Cocker Spaniel\*\*: Cocker Spaniels are friendly and affectionate dogs that can get along well with cats if introduced properly.
When introducing a dog to a cat, it's important to do so gradually and supervise their interactions to ensure a positive relationship. Each dog's personality can vary, so individual temperament is key in determining compatibility.`
```
```
`# Call the main function with the bad request - this should get blocked
response = await execute\_chat\_with\_guardrail(bad\_request)
print(response)`
```
```
`Checking topical guardrail
Got guardrail response
Getting LLM response
Got LLM response
Topical guardrail triggered
I can only talk about cats and dogs, the best animals that ever lived.`
```
Looks like our guardrail worked - the first question was allowed through, but the second was blocked for being off-topic. Now we’ll extend this concept to moderate the response we get from the LLM as well.
## 2. Output guardrails
Output guardrails govern what the LLM comes back with. These can take many forms, with some of the most common being:
* **Hallucination/fact-checking guardrails:** Using a corpus of ground truth information or a training set of hallucinated responses to block hallucinated responses.
* **Moderation guardrails:** Applying brand and corporate guidelines to moderate the LLM’s results, and either blocking or rewriting its response if it breaches them.
* **Syntax checks:** Structured outputs from LLMs can be returned corrupt or unable to be parsed - these guardrails detect those and either retry or fail gracefully, preventing failures in downstream applications.
* This is a common control to apply with function calling, ensuring that the expected schema is returned in the `arguments` when the LLM returns a `function\_call`.
### Moderation guardrail
Here we implement a **moderation guardrail** that uses a version of the [G-Eval](https://arxiv.org/abs/2303.16634) evaluation method to score the presence of unwanted content in the LLM’s response. This method is demonstrated in more detail in of our other [notebooks](https://github.com/openai/openai-cookbook/blob/main/examples/evaluation/How_to_eval_abstractive_summarization.ipynb).
To accomplish this we will make an extensible framework for moderating content that takes in a `domain` and applies `criteria` to a piece of `content` using a set of `steps`:
1. We set a domain name, which describes the type of content we’re going to moderate.
2. We provide criteria, which outline clearly what the content should and should not contain.
3. Step-by-step instructions are provided for the LLM to grade the content.
4. The LLM returns a discrete score from 1-5.
### Setting guardrail thresholds
Our output guardrail will assess the LLM’s response and block anything scoring a 3 or higher. Setting this threshold is a common area for optimization - we recommend building an evaluation set and grading the results using a confusion matrix to set the right tolerance for your guardrail. The trade-off here is generally:
* More false positives leads to a fractured user experience, where customers get annoyed and the assistant seems less helpful.
* More false negatives can cause lasting harm to your business, as people get the assistant to answer inappropriate questions, or prompt inject/jailbreak it.
For example, for jailbreaking you may want to have a very low threshold, as the risk to your business if your LLM is hijacked and used to produce dangerous content that ends up on social media is very high. However, for our use case we’re willing to accept a few false negatives, as the worst that could happen is someone ends up with a Bichon Frise who might have been better suited to a Labrador, which though sad will probably not cause lasting damage to our business (we hope).
```
`domain = "animal breed recommendation"
animal\_advice\_criteria = """
Assess the presence of explicit recommendation of cat or dog breeds in the content.
The content should contain only general advice about cats and dogs, not specific breeds to purchase."""
animal\_advice\_steps = """
1. Read the content and the criteria carefully.
2. Assess how much explicit recommendation of cat or dog breeds is contained in the content.
3. Assign an animal advice score from 1 to 5, with 1 being no explicit cat or dog breed advice, and 5 being multiple named cat or dog breeds.
"""
moderation\_system\_prompt = """
You are a moderation assistant. Your role is to detect content about {domain} in the text provided, and mark the severity of that content.
## {domain}
### Criteria
{scoring\_criteria}
### Instructions
{scoring\_steps}
### Content
{content}
### Evaluation (score only!)
"""`
```
```
`async def moderation\_guardrail(chat\_response):
print("Checking moderation guardrail")
mod\_messages = [
{"role": "user", "content": moderation\_system\_prompt.format(
domain=domain,
scoring\_criteria=animal\_advice\_criteria,
scoring\_steps=animal\_advice\_steps,
content=chat\_response
)},
]
response = openai.chat.completions.create(
model=GPT\_MODEL, messages=mod\_messages, temperature=0
)
print("Got moderation response")
return response.choices[0].message.content
async def execute\_all\_guardrails(user\_request):
topical\_guardrail\_task = asyncio.create\_task(topical\_guardrail(user\_request))
chat\_task = asyncio.create\_task(get\_chat\_response(user\_request))
while True:
done, \_ = await asyncio.wait(
[topical\_guardrail\_task, chat\_task], return\_when=asyncio.FIRST\_COMPLETED
)
if topical\_guardrail\_task in done:
guardrail\_response = topical\_guardrail\_task.result()
if guardrail\_response == "not\_allowed":
chat\_task.cancel()
print("Topical guardrail triggered")
return "I can only talk about cats and dogs, the best animals that ever lived."
elif chat\_task in done:
chat\_response = chat\_task.result()
moderation\_response = await moderation\_guardrail(chat\_response)
if int(moderation\_response) \>= 3:
print(f"Moderation guardrail flagged with a score of {int(moderation\_response)}")
return "Sorry, we're not permitted to give animal breed advice. I can help you with any general queries you might have."
else:
print('Passed moderation')
return chat\_response
else:
await asyncio.sleep(0.1) # sleep for a bit before checking the tasks again`
```
```
`# Adding a request that should pass both our topical guardrail and our moderation guardrail
great\_request = 'What is some advice you can give to a new dog owner?'`
```
```
`tests = [good\_request,bad\_request,great\_request]
for test in tests:
result = await execute\_all\_guardrails(test)
print(result)
print('\\n\\n')`
```
```
`Checking topical guardrail
Got guardrail response
Getting LLM response
Got LLM response
Checking moderation guardrail
Got moderation response
Moderation guardrail flagged with a score of 5
Sorry, we're not permitted to give animal breed advice. I can help you with any general queries you might have.
Checking topical guardrail
Got guardrail response
Getting LLM response
Got LLM response
Topical guardrail triggered
I can only talk about cats and dogs, the best animals that ever lived.
Checking topical guardrail
Got guardrail response
Getting LLM response
Got LLM response
Checking moderation guardrail
Got moderation response
Moderation guardrail flagged with a score of 3
Sorry, we're not permitted to give animal breed advice. I can help you with any general queries you might have.`
```
## Conclusion
Guardrails are a vibrant and evolving topic in LLMs, and we hope this notebook has given you an effective introduction to the core concepts around guardrails. To recap:
* Guardrails are detective controls that aim to prevent harmful content getting to your applications and your users, and add steerability to your LLM in production.
* They can take the form of input guardrails, which target content before it gets to the LLM, and output guardrails, which control the LLM’s response.
* Designing guardrails and setting their thresholds is a trade-off between accuracy, latency, and cost. Your decision should be based on clear evaluations of the performance of your guardrails, and an understanding of what the cost of a false negative and false positive are for your business.
* By embracing asynchronous design principles, you can scale guardrails horizontally to minimize the impact to the user as your guardrails increase in number and scope.
We look forward to seeing how you take this forward, and how thinking on guardrails evolves as the ecosystem matures.