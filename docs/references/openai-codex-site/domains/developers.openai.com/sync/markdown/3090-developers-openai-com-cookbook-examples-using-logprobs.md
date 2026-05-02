Using logprobs
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
Dec 20, 2023
# Using logprobs
[ JH ](https://twitter.com/jamesmhills)[ SA ](https://twitter.com/shyamalanadkat)
[ James Hills
(OpenAI)
, ](https://twitter.com/jamesmhills)[ Shyamal Anadkat
(OpenAI)
](https://twitter.com/shyamalanadkat)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Using_logprobs.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Using_logprobs.ipynb)
This notebook demonstrates the use of the `logprobs` parameter in the Chat Completions API. When `logprobs` is enabled, the API returns the log probabilities of each output token, along with a limited number of the most likely tokens at each token position and their log probabilities. The relevant request parameters are:
* `logprobs`: Whether to return log probabilities of the output tokens or not. If true, returns the log probabilities of each output token returned in the content of message.
* `top\_logprobs`: An integer between 0 and 5 specifying the number of most likely tokens to return at each token position, each with an associated log probability. `logprobs` must be set to true if this parameter is used.
Log probabilities of output tokens indicate the likelihood of each token occurring in the sequence given the context. To simplify, a logprob is `log(p)`, where `p` = probability of a token occurring at a specific position based on the previous tokens in the context. Some key points about `logprobs`:
* Higher log probabilities suggest a higher likelihood of the token in that context. This allows users to gauge the model’s confidence in its output or explore alternative responses the model considered.
* Logprob can be any negative number or `0.0`. `0.0` corresponds to 100% probability.
* Logprobs allow us to compute the joint probability of a sequence as the sum of the logprobs of the individual tokens. This is useful for scoring and ranking model outputs. Another common approach is to take the average per-token logprob of a sentence to choose the best generation.
* We can examine the `logprobs` assigned to different candidate tokens to understand what options the model considered plausible or implausible.
While there are a wide array of use cases for `logprobs`, this notebook will focus on its use for:
1. Classification tasks
* Large Language Models excel at many classification tasks, but accurately measuring the model’s confidence in its outputs can be challenging. `logprobs` provide a probability associated with each class prediction, enabling users to set their own classification or confidence thresholds.
1. Retrieval (Q&A) evaluation
* `logprobs` can assist with self-evaluation in retrieval applications. In the Q&A example, the model outputs a contrived `has\_sufficient\_context\_for\_answer` boolean, which can serve as a confidence score of whether the answer is contained in the retrieved content. Evaluations of this type can reduce retrieval-based hallucinations and enhance accuracy.
1. Autocomplete
* `logprobs` could help us decide how to suggest words as a user is typing.
1. Token highlighting and outputting bytes
* Users can easily create a token highlighter using the built in tokenization that comes with enabling `logprobs`. Additionally, the bytes parameter includes the ASCII encoding of each output character, which is particularly useful for reproducing emojis and special characters.
1. Calculating perplexity
* `logprobs` can be used to help us assess the model’s overall confidence in a result and help us compare the confidence of results from different prompts.
## 0. Imports and utils
```
`from openai import OpenAI
from math import exp
import numpy as np
from IPython.display import display, HTML
import os
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))`
```
```
`def get\_completion(
messages: list[dict[str, str]],
model: str = "gpt-4",
max\_tokens=500,
temperature=0,
stop=None,
seed=123,
tools=None,
logprobs=None, # whether to return log probabilities of the output tokens or not. If true, returns the log probabilities of each output token returned in the content of message..
top\_logprobs=None,
) -\> str:
params = {
"model": model,
"messages": messages,
"max\_tokens": max\_tokens,
"temperature": temperature,
"stop": stop,
"seed": seed,
"logprobs": logprobs,
"top\_logprobs": top\_logprobs,
}
if tools:
params["tools"] = tools
completion = client.chat.completions.create(\*\*params)
return completion`
```
## 1. Using `logprobs` to assess confidence for classification tasks
Let’s say we want to create a system to classify news articles into a set of pre-defined categories. Without `logprobs`, we can use Chat Completions to do this, but it is much more difficult to assess the certainty with which the model made its classifications.
Now, with `logprobs` enabled, we can see exactly how confident the model is in its predictions, which is crucial for creating an accurate and trustworthy classifier. For example, if the log probability for the chosen category is high, this suggests the model is quite confident in its classification. If it’s low, this suggests the model is less confident. This can be particularly useful in cases where the model’s classification is not what you expected, or when the model’s output needs to be reviewed or validated by a human.
We’ll begin with a prompt that presents the model with four categories: **Technology, Politics, Sports, and Arts**. The model is then tasked with classifying articles into these categories based solely on their headlines.
```
`CLASSIFICATION\_PROMPT = """You will be given a headline of a news article.
Classify the article into one of the following categories: Technology, Politics, Sports, and Art.
Return only the name of the category, and nothing else.
MAKE SURE your output is one of the four categories stated.
Article headline: {headline}"""`
```
Let’s look at three sample headlines, and first begin with a standard Chat Completions output, without `logprobs`
```
`headlines = [
"Tech Giant Unveils Latest Smartphone Model with Advanced Photo-Editing Features.",
"Local Mayor Launches Initiative to Enhance Urban Public Transport.",
"Tennis Champion Showcases Hidden Talents in Symphony Orchestra Debut",
]`
```
```
`for headline in headlines:
print(f"\\nHeadline: {headline}")
API\_RESPONSE = get\_completion(
[{"role": "user", "content": CLASSIFICATION\_PROMPT.format(headline=headline)}],
model="gpt-4o",
)
print(f"Category: {API\_RESPONSE.choices[0].message.content}\\n")`
```
```
`
Headline: Tech Giant Unveils Latest Smartphone Model with Advanced Photo-Editing Features.
Category: Technology
Headline: Local Mayor Launches Initiative to Enhance Urban Public Transport.
Category: Politics
Headline: Tennis Champion Showcases Hidden Talents in Symphony Orchestra Debut
Category: Art`
```
Here we can see the selected category for each headline. However, we have no visibility into the confidence of the model in its predictions. Let’s rerun the same prompt but with `logprobs` enabled, and `top\_logprobs` set to 2 (this will show us the 2 most likely output tokens for each token). Additionally we can also output the linear probability of each output token, in order to convert the log probability to the more easily interprable scale of 0-100%.
```
`for headline in headlines:
print(f"\\nHeadline: {headline}")
API\_RESPONSE = get\_completion(
[{"role": "user", "content": CLASSIFICATION\_PROMPT.format(headline=headline)}],
model="gpt-4o-mini",
logprobs=True,
top\_logprobs=2,
)
top\_two\_logprobs = API\_RESPONSE.choices[0].logprobs.content[0].top\_logprobs
html\_content = ""
for i, logprob in enumerate(top\_two\_logprobs, start=1):
html\_content += (
f"\<span style='color: cyan'\>Output token {i}:\</span\> {logprob.token}, "
f"\<span style='color: darkorange'\>logprobs:\</span\> {logprob.logprob}, "
f"\<span style='color: magenta'\>linear probability:\</span\> {np.round(np.exp(logprob.logprob)\*100,2)}%\<br\>"
)
display(HTML(html\_content))
print("\\n")`
```
```
`
Headline: Tech Giant Unveils Latest Smartphone Model with Advanced Photo-Editing Features.`
```
Output token 1: Technology, logprobs: 0.0, linear probability: 100.0%
Output token 2: Technology, logprobs: -18.75, linear probability: 0.0%
```
`
Headline: Local Mayor Launches Initiative to Enhance Urban Public Transport.`
```
Output token 1: Politics, logprobs: -3.1281633e-07, linear probability: 100.0%
Output token 2: Polit, logprobs: -16.0, linear probability: 0.0%
```
`
Headline: Tennis Champion Showcases Hidden Talents in Symphony Orchestra Debut`
```
Output token 1: Art, logprobs: -0.028133942, linear probability: 97.23%
Output token 2: Sports, logprobs: -4.278134, linear probability: 1.39%
As expected from the first two headlines, gpt-4o-mini is 100% confident in its classifications, as the content is clearly technology and politics focused, respectively. However, the third headline combines both sports and art-related themes, resulting in slightly lower confidence at 97%, while still demonstrating strong certainty in its classification.
`logprobs` are quite useful for classification tasks. They allow us to set confidence thresholds or output multiple potential tokens if the log probability of the selected output is not sufficiently high. For instance, when creating a recommendation engine to tag articles, we can automatically classify headlines that exceed a certain threshold and send less certain ones for manual review.
## 2. Retrieval confidence scoring to reduce hallucinations
To reduce hallucinations, and the performance of our RAG-based Q&A system, we can use `logprobs` to evaluate how confident the model is in its retrieval.
Let’s say we have built a retrieval system using RAG for Q&A, but are struggling with hallucinated answers to our questions. *Note:* we will use a hardcoded article for this example, but see other entries in the cookbook for tutorials on using RAG for Q&A.
```
`# Article retrieved
ada\_lovelace\_article = """Augusta Ada King, Countess of Lovelace (née Byron; 10 December 1815 – 27 November 1852) was an English mathematician and writer, chiefly known for her work on Charles Babbage's proposed mechanical general-purpose computer, the Analytical Engine. She was the first to recognise that the machine had applications beyond pure calculation.
Ada Byron was the only legitimate child of poet Lord Byron and reformer Lady Byron. All Lovelace's half-siblings, Lord Byron's other children, were born out of wedlock to other women. Byron separated from his wife a month after Ada was born and left England forever. He died in Greece when Ada was eight. Her mother was anxious about her upbringing and promoted Ada's interest in mathematics and logic in an effort to prevent her from developing her father's perceived insanity. Despite this, Ada remained interested in him, naming her two sons Byron and Gordon. Upon her death, she was buried next to him at her request. Although often ill in her childhood, Ada pursued her studies assiduously. She married William King in 1835. King was made Earl of Lovelace in 1838, Ada thereby becoming Countess of Lovelace.
Her educational and social exploits brought her into contact with scientists such as Andrew Crosse, Charles Babbage, Sir David Brewster, Charles Wheatstone, Michael Faraday, and the author Charles Dickens, contacts which she used to further her education. Ada described her approach as "poetical science" and herself as an "Analyst (& Metaphysician)".
When she was eighteen, her mathematical talents led her to a long working relationship and friendship with fellow British mathematician Charles Babbage, who is known as "the father of computers". She was in particular interested in Babbage's work on the Analytical Engine. Lovelace first met him in June 1833, through their mutual friend, and her private tutor, Mary Somerville.
Between 1842 and 1843, Ada translated an article by the military engineer Luigi Menabrea (later Prime Minister of Italy) about the Analytical Engine, supplementing it with an elaborate set of seven notes, simply called "Notes".
Lovelace's notes are important in the early history of computers, especially since the seventh one contained what many consider to be the first computer program—that is, an algorithm designed to be carried out by a machine. Other historians reject this perspective and point out that Babbage's personal notes from the years 1836/1837 contain the first programs for the engine. She also developed a vision of the capability of computers to go beyond mere calculating or number-crunching, while many others, including Babbage himself, focused only on those capabilities. Her mindset of "poetical science" led her to ask questions about the Analytical Engine (as shown in her notes) examining how individuals and society relate to technology as a collaborative tool.
"""
# Questions that can be easily answered given the article
easy\_questions = [
"What nationality was Ada Lovelace?",
"What was an important finding from Lovelace's seventh note?",
]
# Questions that are not fully covered in the article
medium\_questions = [
"Did Lovelace collaborate with Charles Dickens",
"What concepts did Lovelace build with Charles Babbage",
]`
```
Now, what we can do is ask the model to respond to the question, but then also evaluate its response. Specifically, we will ask the model to output a boolean `has\_sufficient\_context\_for\_answer`. We can then evaluate the `logprobs` to see just how confident the model is that its answer was contained in the provided context
```
`PROMPT = """You retrieved this article: {article}. The question is: {question}.
Before even answering the question, consider whether you have sufficient information in the article to answer the question fully.
Your output should JUST be the boolean true or false, of if you have sufficient information in the article to answer the question.
Respond with just one word, the boolean true or false. You must output the word 'True', or the word 'False', nothing else.
"""`
```
```
`html\_output = ""
html\_output += "Questions clearly answered in article"
for question in easy\_questions:
API\_RESPONSE = get\_completion(
[
{
"role": "user",
"content": PROMPT.format(
article=ada\_lovelace\_article, question=question
),
}
],
model="gpt-4o-mini",
logprobs=True,
)
html\_output += f'\<p style="color:green"\>Question: {question}\</p\>'
for logprob in API\_RESPONSE.choices[0].logprobs.content:
html\_output += f'\<p style="color:cyan"\>has\_sufficient\_context\_for\_answer: {logprob.token}, \<span style="color:darkorange"\>logprobs: {logprob.logprob}, \<span style="color:magenta"\>linear probability: {np.round(np.exp(logprob.logprob)\*100,2)}%\</span\>\</p\>'
html\_output += "Questions only partially covered in the article"
for question in medium\_questions:
API\_RESPONSE = get\_completion(
[
{
"role": "user",
"content": PROMPT.format(
article=ada\_lovelace\_article, question=question
),
}
],
model="gpt-4o",
logprobs=True,
top\_logprobs=3,
)
html\_output += f'\<p style="color:green"\>Question: {question}\</p\>'
for logprob in API\_RESPONSE.choices[0].logprobs.content:
html\_output += f'\<p style="color:cyan"\>has\_sufficient\_context\_for\_answer: {logprob.token}, \<span style="color:darkorange"\>logprobs: {logprob.logprob}, \<span style="color:magenta"\>linear probability: {np.round(np.exp(logprob.logprob)\*100,2)}%\</span\>\</p\>'
display(HTML(html\_output))`
```
Questions clearly answered in article
Question: What nationality was Ada Lovelace?
has\_sufficient\_context\_for\_answer: True, logprobs: -3.1281633e-07, linear probability: 100.0%
Question: What was an important finding from Lovelace’s seventh note?
has\_sufficient\_context\_for\_answer: True, logprobs: -7.89631e-07, linear probability: 100.0%
Questions only partially covered in the article
Question: Did Lovelace collaborate with Charles Dickens
has\_sufficient\_context\_for\_answer: False, logprobs: -0.008654992, linear probability: 99.14%
Question: What concepts did Lovelace build with Charles Babbage
has\_sufficient\_context\_for\_answer: True, logprobs: -0.004082317, linear probability: 99.59%
For the first two questions, our model asserts with (near) 100% confidence that the article has sufficient context to answer the posed questions.
On the other hand, for the more tricky questions which are less clearly answered in the article, the model is less confident that it has sufficient context. This is a great guardrail to help ensure our retrieved content is sufficient.
This self-evaluation can help reduce hallucinations, as you can restrict answers or re-prompt the user when your `sufficient\_context\_for\_answer` log probability is below a certain threshold. Methods like this have been shown to significantly reduce RAG for Q&A hallucinations and errors ([Example](https://jfan001.medium.com/how-we-cut-the-rate-of-gpt-hallucinations-from-20-to-less-than-2-f3bfcc10e4ec))
## 3. Autocomplete
Another use case for `logprobs` are autocomplete systems. Without creating the entire autocomplete system end-to-end, let’s demonstrate how `logprobs` could help us decide how to suggest words as a user is typing.
First, let’s come up with a sample sentence: `"My least favorite TV show is Breaking Bad."` Let’s say we want it to dynamically recommend the next word or token as we are typing the sentence, but *only* if the model is quite sure of what the next word will be. To demonstrate this, let’s break up the sentence into sequential components.
```
`sentence\_list = [
"My",
"My least",
"My least favorite",
"My least favorite TV",
"My least favorite TV show",
"My least favorite TV show is",
"My least favorite TV show is Breaking Bad",
]`
```
Now, we can ask `gpt-4o-mini` to act as an autocomplete engine with whatever context the model is given. We can enable `logprobs` and can see how confident the model is in its prediction.
```
`high\_prob\_completions = {}
low\_prob\_completions = {}
html\_output = ""
for sentence in sentence\_list:
PROMPT = """Complete this sentence. You are acting as auto-complete. Simply complete the sentence to the best of your ability, make sure it is just ONE sentence: {sentence}"""
API\_RESPONSE = get\_completion(
[{"role": "user", "content": PROMPT.format(sentence=sentence)}],
model="gpt-4o-mini",
logprobs=True,
top\_logprobs=3,
)
html\_output += f'\<p\>Sentence: {sentence}\</p\>'
first\_token = True
for token in API\_RESPONSE.choices[0].logprobs.content[0].top\_logprobs:
html\_output += f'\<p style="color:cyan"\>Predicted next token: {token.token}, \<span style="color:darkorange"\>logprobs: {token.logprob}, \<span style="color:magenta"\>linear probability: {np.round(np.exp(token.logprob)\*100,2)}%\</span\>\</p\>'
if first\_token:
if np.exp(token.logprob) \> 0.95:
high\_prob\_completions[sentence] = token.token
if np.exp(token.logprob) \< 0.60:
low\_prob\_completions[sentence] = token.token
first\_token = False
html\_output += "\<br\>"
display(HTML(html\_output))`
```
Sentence: My
Predicted next token: My, logprobs: -0.08344023, linear probability: 91.99%
Predicted next token: dog, logprobs: -3.3334403, linear probability: 3.57%
Predicted next token: ap, logprobs: -3.5834403, linear probability: 2.78%
Sentence: My least
Predicted next token: My, logprobs: -0.1271426, linear probability: 88.06%
Predicted next token: favorite, logprobs: -2.1271427, linear probability: 11.92%
Predicted next token: My, logprobs: -9.127143, linear probability: 0.01%
Sentence: My least favorite
Predicted next token: My, logprobs: -0.052905332, linear probability: 94.85%
Predicted next token: food, logprobs: -4.0529056, linear probability: 1.74%
Predicted next token: color, logprobs: -5.0529056, linear probability: 0.64%
Sentence: My least favorite TV
Predicted next token: show, logprobs: -0.57662326, linear probability: 56.18%
Predicted next token: My, logprobs: -0.82662326, linear probability: 43.75%
Predicted next token: show, logprobs: -8.201623, linear probability: 0.03%
Sentence: My least favorite TV show
Predicted next token: is, logprobs: -0.70817715, linear probability: 49.25%
Predicted next token: My, logprobs: -0.70817715, linear probability: 49.25%
Predicted next token: was, logprobs: -4.833177, linear probability: 0.8%
Sentence: My least favorite TV show is
Predicted next token: My, logprobs: -0.47896808, linear probability: 61.94%
Predicted next token: one, logprobs: -1.7289681, linear probability: 17.75%
Predicted next token: the, logprobs: -2.9789681, linear probability: 5.08%
Sentence: My least favorite TV show is Breaking Bad
Predicted next token: because, logprobs: -0.034502674, linear probability: 96.61%
Predicted next token: ,, logprobs: -3.7845027, linear probability: 2.27%
Predicted next token: because, logprobs: -5.0345025, linear probability: 0.65%
Let’s look at the high confidence autocompletions:
```
`high\_prob\_completions`
```
```
`{'My least favorite TV show is Breaking Bad': 'because'}`
```
These look reasonable! We can feel confident in those suggestions. It’s pretty likely you want to write ‘show’ after writing ‘My least favorite TV’! Now let’s look at the autocompletion suggestions the model was less confident about:
```
`low\_prob\_completions`
```
```
`{'My least favorite TV': 'show', 'My least favorite TV show': 'is'}`
```
These are logical as well. It’s pretty unclear what the user is going to say with just the prefix ‘my least favorite’, and it’s really anyone’s guess what the author’s favorite TV show is.
So, using `gpt-4o-mini`, we can create the root of a dynamic autocompletion engine with `logprobs`!
## 4. Highlighter and bytes parameter
Let’s quickly touch on creating a simple token highlighter with `logprobs`, and using the bytes parameter. First, we can create a function that counts and highlights each token. While this doesn’t use the log probabilities, it uses the built in tokenization that comes with enabling `logprobs`.
```
`PROMPT = """What's the longest word in the English language?"""
API\_RESPONSE = get\_completion(
[{"role": "user", "content": PROMPT}], model="gpt-4o", logprobs=True, top\_logprobs=5
)
def highlight\_text(api\_response):
colors = [
"#FF00FF", # Magenta
"#008000", # Green
"#FF8C00", # Dark Orange
"#FF0000", # Red
"#0000FF", # Blue
]
tokens = api\_response.choices[0].logprobs.content
color\_idx = 0 # Initialize color index
html\_output = "" # Initialize HTML output
for t in tokens:
token\_str = bytes(t.bytes).decode("utf-8") # Decode bytes to string
# Add colored token to HTML output
html\_output += f"\<span style='color: {colors[color\_idx]}'\>{token\_str}\</span\>"
# Move to the next color
color\_idx = (color\_idx + 1) % len(colors)
display(HTML(html\_output)) # Display HTML output
print(f"Total number of tokens: {len(tokens)}")`
```
```
`highlight\_text(API\_RESPONSE)`
```
The longest word in the English language is often considered to be “pneumonoultramicroscopicsilicovolcanoconiosis,” a term referring to a type of lung disease caused by inhaling very fine silicate or quartz dust. However, it’s worth noting that this word was coined more for its length than for practical use. There are also chemical names for proteins and other compounds that can be much longer, but they are typically not used in everyday language.
```
`Total number of tokens: 95`
```
Next, let’s reconstruct a sentence using the bytes parameter. With `logprobs` enabled, we are given both each token and the ASCII (decimal utf-8) values of the token string. These ASCII values can be helpful when handling tokens of or containing emojis or special characters.
```
`PROMPT = """Output the blue heart emoji and its name."""
API\_RESPONSE = get\_completion(
[{"role": "user", "content": PROMPT}], model="gpt-4o", logprobs=True
)
aggregated\_bytes = []
joint\_logprob = 0.0
# Iterate over tokens, aggregate bytes and calculate joint logprob
for token in API\_RESPONSE.choices[0].logprobs.content:
print("Token:", token.token)
print("Log prob:", token.logprob)
print("Linear prob:", np.round(exp(token.logprob) \* 100, 2), "%")
print("Bytes:", token.bytes, "\\n")
aggregated\_bytes += token.bytes
joint\_logprob += token.logprob
# Decode the aggregated bytes to text
aggregated\_text = bytes(aggregated\_bytes).decode("utf-8")
# Assert that the decoded text is the same as the message content
assert API\_RESPONSE.choices[0].message.content == aggregated\_text
# Print the results
print("Bytes array:", aggregated\_bytes)
print(f"Decoded bytes: {aggregated\_text}")
print("Joint prob:", np.round(exp(joint\_logprob) \* 100, 2), "%")`
```
```
`Token: Here
Log prob: -0.054242473
Linear prob: 94.72 %
Bytes: [72, 101, 114, 101]
Token: is
Log prob: -0.0044352207
Linear prob: 99.56 %
Bytes: [32, 105, 115]
Token: the
Log prob: -2.1008714e-06
Linear prob: 100.0 %
Bytes: [32, 116, 104, 101]
Token: blue
Log prob: -0.0013290489
Linear prob: 99.87 %
Bytes: [32, 98, 108, 117, 101]
Token: heart
Log prob: 0.0
Linear prob: 100.0 %
Bytes: [32, 104, 101, 97, 114, 116]
Token: emoji
Log prob: 0.0
Linear prob: 100.0 %
Bytes: [32, 101, 109, 111, 106, 105]
Token: and
Log prob: -0.038287632
Linear prob: 96.24 %
Bytes: [32, 97, 110, 100]
Token: its
Log prob: 0.0
Linear prob: 100.0 %
Bytes: [32, 105, 116, 115]
Token: name
Log prob: -1.569009e-05
Linear prob: 100.0 %
Bytes: [32, 110, 97, 109, 101]
Token: :
Log prob: -0.11313002
Linear prob: 89.3 %
Bytes: [58, 10, 10]
Token: \\xf0\\x9f\\x92
Log prob: -0.09048584
Linear prob: 91.35 %
Bytes: [240, 159, 146]
Token: \\x99
Log prob: 0.0
Linear prob: 100.0 %
Bytes: [153]
Token: Blue
Log prob: -0.023958502
Linear prob: 97.63 %
Bytes: [32, 66, 108, 117, 101]
Token: Heart
Log prob: -6.2729996e-06
Linear prob: 100.0 %
Bytes: [32, 72, 101, 97, 114, 116]
Bytes array: [72, 101, 114, 101, 32, 105, 115, 32, 116, 104, 101, 32, 98, 108, 117, 101, 32, 104, 101, 97, 114, 116, 32, 101, 109, 111, 106, 105, 32, 97, 110, 100, 32, 105, 116, 115, 32, 110, 97, 109, 101, 58, 10, 10, 240, 159, 146, 153, 32, 66, 108, 117, 101, 32, 72, 101, 97, 114, 116]
Decoded bytes: Here is the blue heart emoji and its name:
💙 Blue Heart
Joint prob: 72.19 %`
```
Here, we see that while the first token was `\\xf0\\x9f\\x92'`, we can get its ASCII value and append it to a bytes array. Then, we can easily decode this array into a full sentence, and validate with our assert statement that the decoded bytes is the same as our completion message!
Additionally, we can get the joint probability of the entire completion, which is the exponentiated product of each token’s log probability. This gives us how `likely` this given completion is given the prompt. Since, our prompt is quite directive (asking for a certain emoji and its name), the joint probability of this output is high! If we ask for a random output however, we’ll see a much lower joint probability. This can also be a good tactic for developers during prompt engineering.
## 5. Calculating perplexity
When looking to assess the model’s confidence in a result, it can be useful to calculate perplexity, which is a measure of the uncertainty. Perplexity can be calculated by exponentiating the negative of the average of the logprobs. Generally, a higher perplexity indicates a more uncertain result, and a lower perplexity indicates a more confident result. As such, perplexity can be used to both assess the result of an individual model run and also to compare the relative confidence of results between model runs. While a high confidence doesn’t guarantee result accuracy, it can be a helpful signal that can be paired with other evaluation metrics to build a better understanding of your prompt’s behavior.
For example, let’s say that I want to use `gpt-4o-mini` to learn more about artificial intelligence. I could ask a question about recent history and a question about the future:
```
`prompts = [
"In a short sentence, has artifical intelligence grown in the last decade?",
"In a short sentence, what are your thoughts on the future of artificial intelligence?",
]
for prompt in prompts:
API\_RESPONSE = get\_completion(
[{"role": "user", "content": prompt}],
model="gpt-4o-mini",
logprobs=True,
)
logprobs = [token.logprob for token in API\_RESPONSE.choices[0].logprobs.content]
response\_text = API\_RESPONSE.choices[0].message.content
response\_text\_tokens = [token.token for token in API\_RESPONSE.choices[0].logprobs.content]
max\_starter\_length = max(len(s) for s in ["Prompt:", "Response:", "Tokens:", "Logprobs:", "Perplexity:"])
max\_token\_length = max(len(s) for s in response\_text\_tokens)
formatted\_response\_tokens = [s.rjust(max\_token\_length) for s in response\_text\_tokens]
formatted\_lps = [f"{lp:.2f}".rjust(max\_token\_length) for lp in logprobs]
perplexity\_score = np.exp(-np.mean(logprobs))
print("Prompt:".ljust(max\_starter\_length), prompt)
print("Response:".ljust(max\_starter\_length), response\_text, "\\n")
print("Tokens:".ljust(max\_starter\_length), " ".join(formatted\_response\_tokens))
print("Logprobs:".ljust(max\_starter\_length), " ".join(formatted\_lps))
print("Perplexity:".ljust(max\_starter\_length), perplexity\_score, "\\n")`
```
```
`Prompt: In a short sentence, has artifical intelligence grown in the last decade?
Response: Yes, artificial intelligence has grown significantly in the last decade, advancing in capabilities and applications across various fields.
Tokens: Yes , artificial intelligence has grown significantly in the last decade , advancing in capabilities and applications across various fields .
Logprobs: -0.00 0.00 -0.00 0.00 -0.00 -0.73 -0.00 -0.01 -0.02 -0.00 0.00 -0.02 -0.66 -0.03 -0.62 -0.47 -0.02 -0.39 -0.01 -0.20 -0.00
Perplexity: 1.1644170003987546
Prompt: In a short sentence, what are your thoughts on the future of artificial intelligence?
Response: The future of artificial intelligence holds immense potential for transformative advancements across various sectors, but it also requires careful consideration of ethical and societal impacts.
Tokens: The future of artificial intelligence holds immense potential for transformative advancements across various sectors , but it also requires careful consideration of ethical and societal impacts .
Logprobs: -0.02 -0.00 0.00 -0.00 0.00 -0.05 -0.35 -0.01 -0.02 -0.64 -0.43 -0.25 -0.16 -0.51 -0.02 -0.43 -0.08 -0.07 -0.97 -0.02 -0.48 -0.00 -0.00 -0.48 -0.01 -0.58 -0.00
Perplexity: 1.2292170270768858`
```
In this example, `gpt-4o-mini` returned a lower perplexity score for a more deterministic question about recent history, and a higher perplexity score for a more speculative assessment about the near future. Again, while these differences don’t guarantee accuracy, they help point the way for our interpretation of the model’s results and our future use of them.
## 6. Conclusion
Nice! We were able to use the `logprobs` parameter to build a more robust classifier, evaluate our retrieval for Q&A system, and encode and decode each ‘byte’ of our tokens! `logprobs` adds useful information and signal to our completions output, and we are excited to see how developers incorporate it to improve applications.
## 7. Possible extensions
There are many other use cases for `logprobs` that are not covered in this cookbook. We can use `logprobs` for:
* Moderation
* Keyword selection
* Improve prompts and interpretability of outputs
* Token healing
* and more!