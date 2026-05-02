Build your own content fact checker with gpt-oss-120B, Cerebras, and Parallel
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
Jan 13, 2026
# Build your own content fact checker with gpt-oss-120B, Cerebras, and Parallel
[ ZG ](https://www.linkedin.com/in/zhenwei-gao/)
[ Zhenwei Gao ](https://www.linkedin.com/in/zhenwei-gao/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/articles/gpt-oss/build-your-own-fact-checker-cerebras.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/articles/gpt-oss/build-your-own-fact-checker-cerebras.ipynb)
Ever read an article only to discover later that some of the “facts” were fabricated? As information becomes more abundant, verifying its accuracy has become increasingly challenging.
This guide provides a practical, automated way to assess factual accuracy at scale. It extracts claims from any text or URL, retrieves real-world evidence, and evaluates each claim using gpt-oss-120B powered by Cerebras ultra low latency inference.
See demo here: [Content Fact-Checker](https://oss.parallel.ai/agents/cerebras-fact-checker).
For this guide, set up the following accounts:
* Cerebras API: the fastest inference provider, [get started for free here.](https://cloud.cerebras.ai/?utm_source=DevX&#x26;utm_campaign=parallel)
* Parallel API: The search engine for AI, [get started for free here.](https://platform.parallel.ai/)
Learn more about best practices of gpt-oss-120B [here](https://openai.com/index/introducing-gpt-oss/).
### **Step 1: Environment Setup (Colab or local)**
This guide supports both local Jupyter environments and Google Colab. Set the following environment variables:
* CEREBRAS\_API\_KEY
* PARALLEL\_API\_KEY
```
`python3 -m pip install -U cerebras\_cloud\_sdk parallel-web`
```
```
`import os
from cerebras.cloud.sdk import Cerebras
from parallel import Parallel
# API keys: Colab userdata (if available) -\> env vars fallback
try:
from google.colab import userdata # type: ignore
CEREBRAS\_API\_KEY = userdata.get("CEREBRAS\_API\_KEY") or os.getenv("CEREBRAS\_API\_KEY")
PARALLEL\_API\_KEY = userdata.get("PARALLEL\_API\_KEY") or os.getenv("PARALLEL\_API\_KEY")
except ImportError:
CEREBRAS\_API\_KEY = os.getenv("CEREBRAS\_API\_KEY")
PARALLEL\_API\_KEY = os.getenv("PARALLEL\_API\_KEY")
if not CEREBRAS\_API\_KEY or not PARALLEL\_API\_KEY:
raise RuntimeError("Set CEREBRAS\_API\_KEY and PARALLEL\_API\_KEY as environment variables.")
cerebras\_client = Cerebras(
api\_key=CEREBRAS\_API\_KEY,
default\_headers={
"X-Cerebras-3rd-Party-Integration": "parallel-ai-workshop"
}
)
parallel\_client = Parallel(api\_key=PARALLEL\_API\_KEY)
CEREBRAS\_MODEL\_NAME = "gpt-oss-120B"
print("Clients initialized, model:", CEREBRAS\_MODEL\_NAME)`
```
```
`Clients initialized, model: gpt-oss-120b`
```
### **Step 2: Set up the LLM**
Now, with the environment ready, create the function that will call the LLM.
```
`def call\_cerebras\_chat(
user\_content: str,
system\_content: str | None = None,
model: str = CEREBRAS\_MODEL\_NAME,
temperature: float = 1.0,
top\_p= 1.0,
max\_tokens: int = 4096,
reasoning\_effort: str = "medium"
):
"""
Calls the Cerebras chat completion API.
Args:
user\_content (str): The user's message.
system\_content (str | None): Optional system message to guide the LLM.
model (str): The Cerebras model to use.
temperature (float): Controls the randomness of the output.
max\_tokens (int): The maximum number of tokens in the response.
Returns:
str: The content of the LLM's response.
"""
messages = []
# Add a system message to guide the model's behavior
if system\_content:
messages.append({"role": "system", "content": system\_content})
messages.append({"role": "user", "content": user\_content})
# Make the API call to Cerebras chat completions
resp = cerebras\_client.chat.completions.create(
model=model,
messages=messages,
temperature=temperature,
top\_p=top\_p,
max\_tokens=max\_tokens,
reasoning\_effort=reasoning\_effort,
)
return resp.choices[0].message.content`
```
### **Step 3: Connect the LLM to the web**
To fact-check a claim, the model needs to find evidence online, and this step builds the function that connects the LLM to the web.
Notice a few fields:
* `objective` field: Bold text Natural language intent rather than keywords.
* `one-shot` mode: For simplicity and speed, this guide stick to a one-shot setup, which gives high-quality excerpts in a single call.
```
`def search\_web(query: str, num: int = 5, mode: str = "one-shot"):
"""
Search the web using Parallel's Search API.
Returns a list of dicts with:
- url
- title
- publish\_date
- excerpts (list of strings)
"""
# Instruct the LLM find quality sources.
objective = (
f"Find high-quality, up-to-date sources that answer the question:\\n\\n{query}\\n\\n"
"Prefer authoritative sites (e.g., .gov, .edu, major news, or official org websites)."
)
# Initiatiate the LLM for web search
search = parallel\_client.beta.search(
objective=objective,
search\_queries=[query],
mode=mode,
max\_results=num,
excerpts={
"max\_chars\_per\_result": 8000,
},
)
results = []
# Process the search results and extract information like URL, title, and excerpts.
for r in search.results:
results.append(
{
"url": r.url,
"title": getattr(r, "title", None),
"publish\_date": getattr(r, "publish\_date", None),
"excerpts": list(r.excerpts or []),
}
)
return results`
```
### **Step 4 – Organize and summarize web results**
After retrieving information from the web, organize it into a clean, readable format. This step takes the search results and compiles the key excerpts into a simple summary for evaluation.
```
`import textwrap
from typing import List, Dict, Any
def build\_evidence\_context(results: List[Dict[str, Any]], max\_chars: int = 8000) -\> str:
blocks = []
for idx, r in enumerate(results):
excerpts\_text = "\\n\\n".join(r["excerpts"][:2])
block = textwrap.dedent(f"""
[Source {idx+1}]
Title: {r['title'] or r['url']}
URL: {r['url']}
Publish date: {r['publish\_date']}
Excerpts:
{excerpts\_text}
""").strip()
blocks.append(block)
context = "\\n\\n".join(blocks)
if len(context) \> max\_chars:
context = context[:max\_chars] + "\\n\\n[Context truncated for length]"
return context`
```
### **Step 5 – Find the claims to verify**
Next, identify the specific statements in the text to verify. Rather than analyzing an entire article at once, the LLM should break it into multiple clear, stand-alone claims that can be judged verbatim.
For example, from a short paragraph like: “The unemployment rate fell to 3.5% in March 2024, and Company X announced a $10B merger the same week.”
The LLM should extract individual factual statements such as:
* “The unemployment rate fell to 3.5% in March 2024.”
* “Company X announced a $10 billion merger.”
Each one can then be checked independently, which makes the entire fact-checking process precise and reliable.
```
`import json
import re
import time
def extract\_claims\_from\_text(text: str, max\_claims: int = 8) -\> list[str]:
"""
Use Cerebras LLM to extract atomic factual claims from text.
Output format (strict JSON):
{
"claims": ["...", "."...]
}
"""
# Instruct the LLM to extract factual claims
system\_prompt\_content = (
"You are an information extraction assistant.\\n"
"From the user's text, extract up to {max\_claims} atomic factual claims.\\n"
"Each claim should:\\n"
"- Be checkable against external sources (dates, numbers, named entities)\\n"
"- Be concrete and not an opinion.\\n\\n"
"Return STRICT JSON:\\n"
"{{\\n"
' "claims": ["...", "..."]\\n'
"}}\\n"
).format(max\_claims=max\_claims)
# Prompt the LLM for claim extraction
user\_prompt\_content = f"Text:\\n\\n{text}\\n\\nExtract up to {max\_claims} factual claims."
messages = [
{"role": "system", "content": system\_prompt\_content},
{"role": "user", "content": user\_prompt\_content}
]
start\_time = time.time()
# Call Cerebras LLM (gpt-oss-120B) for claim extraction
resp = cerebras\_client.chat.completions.create(
model=CEREBRAS\_MODEL\_NAME,
messages=messages,
temperature=1.0,
top\_p=1.0,
max\_tokens=4096,
reasoning\_effort="medium",
)
raw = resp.choices[0].message.content.strip()
end\_time = time.time()
print(f"Cerebras LLM claim extraction took {end\_time - start\_time:.2f} seconds")
# Clean up the raw JSON output
raw = re.sub(r"^\\s\*```(?:json)?\\s\*", "", raw, flags=re.IGNORECASE)
raw = re.sub(r"\\s\*```\\s\*$", "", raw)
try:
data = json.loads(raw)
claims = data.get("claims", [])
claims = [c.strip() for c in claims if isinstance(c, str) and c.strip()]
return claims[:max\_claims]
except Exception as e:
print("Error parsing claims JSON:", e)
print("Raw model output:\\n", raw)
return []
print("Claim extraction ready")`
```
```
`Claim extraction ready`
```
### **Step 6 – Check claims against evidence (true / false / uncertain)**
After collecting the claims and extracting them into independent factual claims, the LLM can now evaluate each claim for a verdict. The process has two steps:
1. **Retrieve evidence with Parallel:**
First, use Parallel to query authoritative sources related to the claim.
2. **Judge the claim with Cerebras:**
Then, send the evidence and the original claims to Cerebras for evaluation. Here’s where Cerebras’s ultra-fast inference becomes crucial, where the LLM can analyze multiple pieces of evidence, weigh contradictions, and generate a verdict.
The model will return one of three structured verdicts:
* **True** — Evidence supports the claim
* **False** — Evidence contradicts the claim
* **Uncertain** — Not enough evidence, or sources conflict
Each verdict comes with an explanation and cited URLs, so the model’s reasoning is transparent.
```
`from typing import Dict, Any
import textwrap
import re
import time
def fact\_check\_single\_claim(claim: str) -\> Dict[str, Any]:
"""
Fact-check a single claim using:
- Parallel Search for evidence
- Cerebras LLM for verdict
Args:
claim (str): The factual claim to be checked.
Returns:
Dict[str, Any]: A dictionary containing the claim, verdict, reason, and sources.
{
"claim": str,
"verdict": "true" | "false" | "uncertain",
"reason": str,
"sources": [url, ...]
}
"""
print(f"\\nFact-checking claim: {claim}")
# Search the web for evidence relevant to the claim
results = search\_web(query=claim, num=6, mode="one-shot")
print(f"Retrieved {len(results)} evidence sources")
# Compile the search results into a clean, readable context for the LLM
evidence\_context = build\_evidence\_context(results)
# Define the system prompt to instruct the Cerebras LLM (gpt-oss-120B) on how to evaluate each claim
system\_prompt\_content = (
"You are a careful, skeptical fact-checking assistant.\\n"
"You get a factual claim and web search excerpts.\\n"
"Decide if the evidence supports, contradicts, or does not clearly resolve the claim.\\n\\n"
"Respond with STRICT JSON:\\n"
"{\\n"
' "verdict": "true" | "false" | "uncertain",\\n'
' "reason": "short explanation",\\n'
' "top\_sources": ["url1", "url2", ...]\\n'
"}\\n"
"Use 'true' only when the evidence strongly supports the claim.\\n"
"Use 'false' only when it clearly contradicts the claim.\\n"
"Otherwise use 'uncertain'."
)
# Construct the user prompt
user\_prompt\_content = textwrap.dedent(f"""
Claim:
{claim}
Evidence (web search excerpts):
{evidence\_context}
""")
messages = [
{"role": "system", "content": system\_prompt\_content},
{"role": "user", "content": user\_prompt\_content}
]
start\_time = time.time()
# Call the Cerebras LLM (gpt-oss-120B) to get a structured verdict
resp = cerebras\_client.chat.completions.create(
model=CEREBRAS\_MODEL\_NAME,
messages=messages,
temperature=1.0,
top\_p=1.0,
max\_tokens=4096,
reasoning\_effort="medium"
)
raw = resp.choices[0].message.content.strip()
end\_time = time.time()
print(f"Cerebras LLM judgment for this claim took {end\_time - start\_time:.2f} seconds")
# Clean up the raw JSON output from the LLM
raw = re.sub(r"^\\s\*```(?:json)?\\s\*", "", raw, flags=re.IGNORECASE)
raw = re.sub(r"\\s\*```\\s\*$", "", raw)
try:
data = json.loads(raw)
except Exception as e:
print("Error parsing judgment JSON:", e)
print("Raw model output:\\n", raw)
data = {
"verdict": "uncertain",
"reason": "Could not parse model output.",
"top\_sources": [],
}
# Extract and normalize the verdict (true, false, or uncertain)
verdict = str(data.get("verdict", "uncertain")).lower()
if verdict not in {"true", "false", "uncertain"}:
verdict = "uncertain"
# Extract and format the top sources cited by the LLM
top\_sources = data.get("top\_sources") or []
if not isinstance(top\_sources, list):
top\_sources = [str(top\_sources)]
top\_sources = [str(u) for u in top\_sources][:5]
# Consolidate all the fact-checking results into a single dictionary
result = {
"claim": claim,
"verdict": verdict,
"reason": data.get("reason", ""),
"sources": top\_sources,
}
# Print the detailed fact-checking result for clarity
print("Verdict:", result["verdict"].upper())
print("Reason:", result["reason"])
if result["sources"]:
print("Sources:")
for s in result["sources"]:
print(" •", s)
return result
print("Single-claim fact-checker ready")`
```
```
`Single-claim fact checker ready`
```
### **Step 7 - Fact-check an entire text**
This final step brings everything together. Here, take any piece of text and run each one through the full fact-checking process you built.
```
`def fact\_check\_text(text: str, max\_claims: int = 6):
# First, extract factual claims from the input text
claims = extract\_claims\_from\_text(text, max\_claims=max\_claims)
print(f"Extracted {len(claims)} claims:")
for i, c in enumerate(claims, 1):
print(f" {i}. {c}")
all\_results = []
# Iterate through each extracted claim and perform a single fact-check
for i, claim in enumerate(claims):
print(f"\\n{'='\*50}\\nFact-checking Claim {i+1} of {len(claims)}: '{claim}'")
single\_claim\_result = fact\_check\_single\_claim(claim)
all\_results.append(single\_claim\_result)
print(f"{'='\*50}")
# After all claims are checked, print a summary of all results
print("\\n\\n--- Summary of All Fact-Checking Results ---\\n")
for result in all\_results:
print(f"Claim: {result['claim']}")
print(f"Verdict: {result['verdict'].upper()}")
print(f"Reason: {result['reason']}")
if result['sources']:
print("Sources:")
for s in result['sources']:
print(f" • {s}")
print("\\n" + "-"\*50 + "\\n")
return all\_results
print("Full fact-checking pipeline ready")`
```
```
`Full fact-checking pipeline ready`
```
### **Step 8: Fact check directly from a URL**
Finally, to make the fact-checker even easier, add a function that accepts a URL directly.
```
`import requests
from bs4 import BeautifulSoup
def extract\_claims\_from\_url(url: str, max\_claims: int = 8) -\> list[str]:
"""
Extracts atomic factual claims from the main content of a given URL.
Fetches content using requests/BeautifulSoup and uses Cerebras LLM for claim extraction.
"""
print(f"Fetching content from URL: {url}")
try:
# Fetch the content of the URL
response = requests.get(url, timeout=10)
response.raise\_for\_status()
soup = BeautifulSoup(response.text, 'html.parser')
# Attempt to find the main content by looking for 'article' or 'main' tags
main\_content\_div = soup.find('article') or soup.find('main')
if main\_content\_div:
main\_text = ' '.join([p.get\_text() for p in main\_content\_div.find\_all('p')])
else:
main\_text\_elements = soup.find\_all(['p', 'h1', 'h2', 'h3'])
main\_text = ' '.join([elem.get\_text() for elem in main\_text\_elements])
# Check if enough text was extracted
if not main\_text or len(main\_text.strip()) \< 100:
print(f"Warning: Not enough main text found for URL: {url}")
return []
print(f"Extracted {len(main\_text)} characters from the URL. Now extracting claims...")
# Use the LLM to extract claims from the cleaned text
claims = extract\_claims\_from\_text(main\_text, max\_claims=max\_claims)
return claims
except requests.exceptions.RequestException as e:
print(f"Error fetching content from URL {url}: {e}")
return []
except Exception as e:
print(f"Error processing URL {url}: {e}")
return []
print("URL claim extraction function ready")`
```
```
`URL claim extraction function ready`
```
### **Examples**
Start with a short sample text first.
```
`sample\_text = """\\nThe Earth is flat and the moon is made of cheese. Humans landed on Mars in 1969. Albert Einstein was born in Germany in 1879.\\n"""
print("Fact-checking the following text:\\n")
print(sample\_text)
fact\_check\_results = fact\_check\_text(sample\_text)
display(fact\_check\_results)`
```
```
`Fact-checking the following text:
The Earth is flat and the moon is made of cheese. Humans landed on Mars in 1969. Albert Einstein was born in Germany in 1879.
Cerebras LLM claim extraction took 0.34 seconds
Extracted 5 claims:
1. The Earth is flat.
2. The moon is made of cheese.
3. Humans landed on Mars in 1969.
4. Albert Einstein was born in Germany.
5. Albert Einstein was born in 1879.
==================================================
Fact-checking Claim 1 of 5: 'The Earth is flat.'
Fact-checking claim: The Earth is flat.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.39 seconds
Verdict: FALSE
Reason: The provided sources explain that scientific evidence demonstrates the Earth is a sphere and that flat‑Earth beliefs are a debunked conspiracy, directly contradicting the claim.
Sources:
• https://pursuit.unimelb.edu.au/articles/why-do-some-people-believe-the-earth-is-flat
==================================================
==================================================
Fact-checking Claim 2 of 5: 'The moon is made of cheese.'
Fact-checking claim: The moon is made of cheese.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.30 seconds
Verdict: FALSE
Reason: NASA scientific sources describe the Moon's composition as layered rock, iron, silicon, magnesium, etc., with no indication of cheese, directly contradicting the claim.
Sources:
• https://science.nasa.gov/moon/composition/
==================================================
==================================================
Fact-checking Claim 3 of 5: 'Humans landed on Mars in 1969.'
Fact-checking claim: Humans landed on Mars in 1969.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.48 seconds
Verdict: FALSE
Reason: The evidence shows that in 1969 NASA conducted unmanned Mars flyby missions (Mariner 6 and 7) and a manned Moon landing, with no indication of humans landing on Mars.
Sources:
• https://www.facebook.com/groups/jameswebbtelescopecosmicexplorations/posts/762176293540444/
• https://www.jpl.nasa.gov/missions/mariner-7/
==================================================
==================================================
Fact-checking Claim 4 of 5: 'Albert Einstein was born in Germany.'
Fact-checking claim: Albert Einstein was born in Germany.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.80 seconds
Verdict: TRUE
Reason: Wikipedia describes Einstein as a German-born theoretical physicist, confirming he was born in Germany.
Sources:
• https://en.wikipedia.org/wiki/Albert\_Einstein
• https://www.nobelprize.org/prizes/physics/1921/einstein/biographical/
==================================================
==================================================
Fact-checking Claim 5 of 5: 'Albert Einstein was born in 1879.'
Fact-checking claim: Albert Einstein was born in 1879.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.27 seconds
Verdict: TRUE
Reason: The Wikipedia entry lists Einstein's birthdate as 14 March 1879, confirming the claim.
Sources:
• https://en.wikipedia.org/wiki/Albert\_Einstein
==================================================
--- Summary of All Fact-Checking Results ---
Claim: The Earth is flat.
Verdict: FALSE
Reason: The provided sources explain that scientific evidence demonstrates the Earth is a sphere and that flat‑Earth beliefs are a debunked conspiracy, directly contradicting the claim.
Sources:
• https://pursuit.unimelb.edu.au/articles/why-do-some-people-believe-the-earth-is-flat
--------------------------------------------------
Claim: The moon is made of cheese.
Verdict: FALSE
Reason: NASA scientific sources describe the Moon's composition as layered rock, iron, silicon, magnesium, etc., with no indication of cheese, directly contradicting the claim.
Sources:
• https://science.nasa.gov/moon/composition/
--------------------------------------------------
Claim: Humans landed on Mars in 1969.
Verdict: FALSE
Reason: The evidence shows that in 1969 NASA conducted unmanned Mars flyby missions (Mariner 6 and 7) and a manned Moon landing, with no indication of humans landing on Mars.
Sources:
• https://www.facebook.com/groups/jameswebbtelescopecosmicexplorations/posts/762176293540444/
• https://www.jpl.nasa.gov/missions/mariner-7/
--------------------------------------------------
Claim: Albert Einstein was born in Germany.
Verdict: TRUE
Reason: Wikipedia describes Einstein as a German-born theoretical physicist, confirming he was born in Germany.
Sources:
• https://en.wikipedia.org/wiki/Albert\_Einstein
• https://www.nobelprize.org/prizes/physics/1921/einstein/biographical/
--------------------------------------------------
Claim: Albert Einstein was born in 1879.
Verdict: TRUE
Reason: The Wikipedia entry lists Einstein's birthdate as 14 March 1879, confirming the claim.
Sources:
• https://en.wikipedia.org/wiki/Albert\_Einstein
--------------------------------------------------`
```
```
`[{'claim': 'The Earth is flat.',
'verdict': 'false',
'reason': 'The provided sources explain that scientific evidence demonstrates the Earth is a sphere and that flat‑Earth beliefs are a debunked conspiracy, directly contradicting the claim.',
'sources': ['https://pursuit.unimelb.edu.au/articles/why-do-some-people-believe-the-earth-is-flat']},
{'claim': 'The moon is made of cheese.',
'verdict': 'false',
'reason': "NASA scientific sources describe the Moon's composition as layered rock, iron, silicon, magnesium, etc., with no indication of cheese, directly contradicting the claim.",
'sources': ['https://science.nasa.gov/moon/composition/']},
{'claim': 'Humans landed on Mars in 1969.',
'verdict': 'false',
'reason': 'The evidence shows that in 1969 NASA conducted unmanned Mars flyby missions (Mariner 6 and 7) and a manned Moon landing, with no indication of humans landing on Mars.',
'sources': ['https://www.facebook.com/groups/jameswebbtelescopecosmicexplorations/posts/762176293540444/',
'https://www.jpl.nasa.gov/missions/mariner-7/']},
{'claim': 'Albert Einstein was born in Germany.',
'verdict': 'true',
'reason': 'Wikipedia describes Einstein as a German-born theoretical physicist, confirming he was born in Germany.',
'sources': ['https://en.wikipedia.org/wiki/Albert\_Einstein',
'https://www.nobelprize.org/prizes/physics/1921/einstein/biographical/']},
{'claim': 'Albert Einstein was born in 1879.',
'verdict': 'true',
'reason': "The Wikipedia entry lists Einstein's birthdate as 14 March 1879, confirming the claim.",
'sources': ['https://en.wikipedia.org/wiki/Albert\_Einstein']}]`
```
Now, paste in a 400-word statement and see what the fact-checker says.
[Note: this is a composite text example designed to verify the content fact-checker. It contains plausible but fabricated claims.]
```
`long\_sample\_text = """
In recent months, a number of widely shared posts and articles have circulated online making bold claims about technology, science, and public health. One viral thread asserted that Apple released the world’s first smartphone in 1992, long before the launch of the iPhone. The post claimed the device had a touchscreen, mobile internet capabilities, and even early forms of voice control. In reality, Apple did not release a smartphone in 1992, and the first widely recognized smartphone, the IBM Simon, was introduced in 1994 with far more limited features. The iPhone, launched in 2007, is credited with defining the modern smartphone era.
Another widely repeated claim stated that Mount Everest has shrunk by more than 500 meters due to rapid climate change. Several posts argued that melting ice and tectonic shifts had dramatically reduced the mountain’s height, supposedly confirmed by new satellite imagery. Geologists and survey data contradict this, showing that Everest’s height has changed only minimally over time. Recent revisions to Everest’s official height reflect improved measurement technology—not catastrophic geological change or the environmental collapse suggested online.
A sensational article suggested that NASA announced Earth will experience 15 days of complete darkness in November 2025 because of a rare planetary alignment. This claim resurfaces every few years in slightly different forms, yet NASA has consistently debunked every version of it. Astronomers explain that no known configuration of planets could block sunlight from reaching Earth for even a single day, let alone two weeks.
Another persistent piece of misinformation claimed that COVID-19 vaccines contain microchips designed for government tracking. Public health organizations worldwide have addressed this rumor repeatedly, stating unequivocally that no such technology exists in vaccines and that microelectronics cannot function or survive in biological environments in the way conspiracy theories suggest. Despite extensive scientific communication, this claim continues to spread across certain corners of the internet.
More recently, a trending health blog claimed that drinking eight cups of coffee per day reduces the risk of heart disease by 70%. While moderate coffee consumption has been studied for potential health benefits, no reputable research supports the exaggerated 70% figure promoted in the article. Excessive caffeine intake can create health concerns for many individuals, including increased heart rate, anxiety, and disrupted sleep.
In the tech sector, several posts gained traction by asserting that electric vehicles routinely explode in temperatures above 80 degrees Fahrenheit. Critics use this claim to argue that EVs pose unique safety threats. However, investigations by fire departments, insurance groups, and automotive engineers show no evidence of spontaneous combustion linked to moderate ambient temperatures. Vehicle fires—when they do occur—typically result from accidents, mechanical failures, or battery punctures, not temperature alone.
Another claim circulating widely suggests that major tech companies are secretly restricting home Wi-Fi speeds to force consumers into new subscription tiers. Internet service providers and independent network analysts have found no support for this, noting that slowdowns are far more commonly caused by outdated hardware, overcrowded networks, or poor signal placement within the home.
"""
print("Fact-checking the following longer text:\\n")
print(long\_sample\_text[:500] + ('...' if len(long\_sample\_text) \> 500 else ''))
long\_fact\_check\_results = fact\_check\_text(long\_sample\_text)
display(long\_fact\_check\_results)`
```
```
`Fact-checking the following longer text:
In recent months, a number of widely shared posts and articles have circulated online making bold claims about technology, science, and public health. One viral thread asserted that Apple released the world’s first smartphone in 1992, long before the launch of the iPhone. The post claimed the device had a touchscreen, mobile internet capabilities, and even early forms of voice control. In reality, Apple did not release a smartphone in 1992, and the first widely recognized smartphone, the IBM Si...
Cerebras LLM claim extraction took 0.56 seconds
Extracted 6 claims:
1. Apple did not release a smartphone in 1992; the first widely recognized smartphone, the IBM Simon, was introduced in 1994.
2. The iPhone was launched in 2007 and is credited with defining the modern smartphone era.
3. Mount Everest has not shrunk by more than 500 meters; its height has changed only minimally and recent revisions reflect improved measurement technology.
4. NASA has debunked claims that Earth will experience 15 days of complete darkness in November 2025 due to a planetary alignment, stating no known configuration can block sunlight for that duration.
5. COVID‑19 vaccines do not contain microchips for government tracking; no such microelectronics are present in any authorized vaccine.
6. Drinking eight cups of coffee per day does not reduce the risk of heart disease by 70%; no reputable research supports that specific reduction figure.
==================================================
Fact-checking Claim 1 of 6: 'Apple did not release a smartphone in 1992; the first widely recognized smartphone, the IBM Simon, was introduced in 1994.'
Fact-checking claim: Apple did not release a smartphone in 1992; the first widely recognized smartphone, the IBM Simon, was introduced in 1994.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.40 seconds
Verdict: UNCERTAIN
Reason: The evidence clearly shows IBM Simon was first released in 1994, supporting that part of the claim. However, there is no explicit evidence provided about Apple not releasing a smartphone in 1992, so the claim cannot be fully verified.
Sources:
• https://en.wikipedia.org/wiki/IBM\_Simon
• https://en.wikipedia.org/wiki/Smartphone
==================================================
==================================================
Fact-checking Claim 2 of 6: 'The iPhone was launched in 2007 and is credited with defining the modern smartphone era.'
Fact-checking claim: The iPhone was launched in 2007 and is credited with defining the modern smartphone era.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.35 seconds
Verdict: TRUE
Reason: The evidence confirms the iPhone was first released on June 29 2007 and describes it as a revolutionary device that "reinvented" the phone, indicating it is widely credited with defining the modern smartphone era.
Sources:
• https://en.wikipedia.org/wiki/IPhone\_(1st\_generation)
• https://theprint.in/features/brandma/iphone-1-a-revolutionary-smartphone-that-debuted-at-the-2007-oscars/889755/
==================================================
==================================================
Fact-checking Claim 3 of 6: 'Mount Everest has not shrunk by more than 500 meters; its height has changed only minimally and recent revisions reflect improved measurement technology.'
Fact-checking claim: Mount Everest has not shrunk by more than 500 meters; its height has changed only minimally and recent revisions reflect improved measurement technology.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.38 seconds
Verdict: TRUE
Reason: The sources state that Everest’s height is now 8,848.86 m, noting only slight adjustments from earlier measurements due to better technology and minor natural effects, with no indication of a shrinkage anywhere near 500 m.
Sources:
• https://www.himalayanrecreation.com/blog/the-height-of-mount-everest
• https://www.britannica.com/place/Mount-Everest
==================================================
==================================================
Fact-checking Claim 4 of 6: 'NASA has debunked claims that Earth will experience 15 days of complete darkness in November 2025 due to a planetary alignment, stating no known configuration can block sunlight for that duration.'
Fact-checking claim: NASA has debunked claims that Earth will experience 15 days of complete darkness in November 2025 due to a planetary alignment, stating no known configuration can block sunlight for that duration.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.47 seconds
Verdict: UNCERTAIN
Reason: The provided sources debunk similar 15‑day darkness hoaxes for 2015/2017 and state NASA never confirmed such an event, but none specifically address a claimed November 2025 event, so the claim is not directly supported or contradicted.
Sources:
• https://www.snopes.com/fact-check/15-days-darkness-november/
• https://www.space.com/31118-earth-darkness-hoax-debunked.html
==================================================
==================================================
Fact-checking Claim 5 of 6: 'COVID‑19 vaccines do not contain microchips for government tracking; no such microelectronics are present in any authorized vaccine.'
Fact-checking claim: COVID‑19 vaccines do not contain microchips for government tracking; no such microelectronics are present in any authorized vaccine.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.44 seconds
Verdict: TRUE
Reason: Multiple reputable sources explicitly state that COVID‑19 vaccines contain no microchips or any tracking hardware, directly confirming the claim.
Sources:
• https://revealnews.org/article/where-did-the-microchip-vaccine-conspiracy-theory-come-from-anyway/
• https://www.mayoclinic.org/diseases-conditions/coronavirus/in
==================================================
==================================================
Fact-checking Claim 6 of 6: 'Drinking eight cups of coffee per day does not reduce the risk of heart disease by 70%; no reputable research supports that specific reduction figure.'
Fact-checking claim: Drinking eight cups of coffee per day does not reduce the risk of heart disease by 70%; no reputable research supports that specific reduction figure.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.45 seconds
Verdict: TRUE
Reason: The cited review shows mixed or even increased risk with heavy coffee consumption and does not report a 70% reduction in heart disease risk for eight cups per day, indicating no reputable research supports that specific figure.
Sources:
• https://pmc.ncbi.nlm.nih.gov/articles/PMC10262944/
• https://www.escardio.org/The-ESC/Press-Office/Press-releases/morning-coffee-may-protect-the-heart-better-than-all-day-coffee-drinking
==================================================
--- Summary of All Fact-Checking Results ---
Claim: Apple did not release a smartphone in 1992; the first widely recognized smartphone, the IBM Simon, was introduced in 1994.
Verdict: UNCERTAIN
Reason: The evidence clearly shows IBM Simon was first released in 1994, supporting that part of the claim. However, there is no explicit evidence provided about Apple not releasing a smartphone in 1992, so the claim cannot be fully verified.
Sources:
• https://en.wikipedia.org/wiki/IBM\_Simon
• https://en.wikipedia.org/wiki/Smartphone
--------------------------------------------------
Claim: The iPhone was launched in 2007 and is credited with defining the modern smartphone era.
Verdict: TRUE
Reason: The evidence confirms the iPhone was first released on June 29 2007 and describes it as a revolutionary device that "reinvented" the phone, indicating it is widely credited with defining the modern smartphone era.
Sources:
• https://en.wikipedia.org/wiki/IPhone\_(1st\_generation)
• https://theprint.in/features/brandma/iphone-1-a-revolutionary-smartphone-that-debuted-at-the-2007-oscars/889755/
--------------------------------------------------
Claim: Mount Everest has not shrunk by more than 500 meters; its height has changed only minimally and recent revisions reflect improved measurement technology.
Verdict: TRUE
Reason: The sources state that Everest’s height is now 8,848.86 m, noting only slight adjustments from earlier measurements due to better technology and minor natural effects, with no indication of a shrinkage anywhere near 500 m.
Sources:
• https://www.himalayanrecreation.com/blog/the-height-of-mount-everest
• https://www.britannica.com/place/Mount-Everest
--------------------------------------------------
Claim: NASA has debunked claims that Earth will experience 15 days of complete darkness in November 2025 due to a planetary alignment, stating no known configuration can block sunlight for that duration.
Verdict: UNCERTAIN
Reason: The provided sources debunk similar 15‑day darkness hoaxes for 2015/2017 and state NASA never confirmed such an event, but none specifically address a claimed November 2025 event, so the claim is not directly supported or contradicted.
Sources:
• https://www.snopes.com/fact-check/15-days-darkness-november/
• https://www.space.com/31118-earth-darkness-hoax-debunked.html
--------------------------------------------------
Claim: COVID‑19 vaccines do not contain microchips for government tracking; no such microelectronics are present in any authorized vaccine.
Verdict: TRUE
Reason: Multiple reputable sources explicitly state that COVID‑19 vaccines contain no microchips or any tracking hardware, directly confirming the claim.
Sources:
• https://revealnews.org/article/where-did-the-microchip-vaccine-conspiracy-theory-come-from-anyway/
• https://www.mayoclinic.org/diseases-conditions/coronavirus/in
--------------------------------------------------
Claim: Drinking eight cups of coffee per day does not reduce the risk of heart disease by 70%; no reputable research supports that specific reduction figure.
Verdict: TRUE
Reason: The cited review shows mixed or even increased risk with heavy coffee consumption and does not report a 70% reduction in heart disease risk for eight cups per day, indicating no reputable research supports that specific figure.
Sources:
• https://pmc.ncbi.nlm.nih.gov/articles/PMC10262944/
• https://www.escardio.org/The-ESC/Press-Office/Press-releases/morning-coffee-may-protect-the-heart-better-than-all-day-coffee-drinking
--------------------------------------------------`
```
```
`[{'claim': 'Apple did not release a smartphone in 1992; the first widely recognized smartphone, the IBM Simon, was introduced in 1994.',
'verdict': 'uncertain',
'reason': 'The evidence clearly shows IBM Simon was first released in 1994, supporting that part of the claim. However, there is no explicit evidence provided about Apple not releasing a smartphone in 1992, so the claim cannot be fully verified.',
'sources': ['https://en.wikipedia.org/wiki/IBM\_Simon',
'https://en.wikipedia.org/wiki/Smartphone']},
{'claim': 'The iPhone was launched in 2007 and is credited with defining the modern smartphone era.',
'verdict': 'true',
'reason': 'The evidence confirms the iPhone was first released on June\\u202f29\\u202f2007 and describes it as a revolutionary device that "reinvented" the phone, indicating it is widely credited with defining the modern smartphone era.',
'sources': ['https://en.wikipedia.org/wiki/IPhone\_(1st\_generation)',
'https://theprint.in/features/brandma/iphone-1-a-revolutionary-smartphone-that-debuted-at-the-2007-oscars/889755/']},
{'claim': 'Mount Everest has not shrunk by more than 500\\u202fmeters; its height has changed only minimally and recent revisions reflect improved measurement technology.',
'verdict': 'true',
'reason': 'The sources state that Everest’s height is now 8,848.86\\u202fm, noting only slight adjustments from earlier measurements due to better technology and minor natural effects, with no indication of a shrinkage anywhere near 500\\u202fm.',
'sources': ['https://www.himalayanrecreation.com/blog/the-height-of-mount-everest',
'https://www.britannica.com/place/Mount-Everest']},
{'claim': 'NASA has debunked claims that Earth will experience 15\\u202fdays of complete darkness in November\\u202f2025 due to a planetary alignment, stating no known configuration can block sunlight for that duration.',
'verdict': 'uncertain',
'reason': 'The provided sources debunk similar 15‑day darkness hoaxes for 2015/2017 and state NASA never confirmed such an event, but none specifically address a claimed November\\u202f2025 event, so the claim is not directly supported or contradicted.',
'sources': ['https://www.snopes.com/fact-check/15-days-darkness-november/',
'https://www.space.com/31118-earth-darkness-hoax-debunked.html']},
{'claim': 'COVID‑19 vaccines do not contain microchips for government tracking; no such microelectronics are present in any authorized vaccine.',
'verdict': 'true',
'reason': 'Multiple reputable sources explicitly state that COVID‑19 vaccines contain no microchips or any tracking hardware, directly confirming the claim.',
'sources': ['https://revealnews.org/article/where-did-the-microchip-vaccine-conspiracy-theory-come-from-anyway/',
'https://www.mayoclinic.org/diseases-conditions/coronavirus/in']},
{'claim': 'Drinking eight cups of coffee per day does not reduce the risk of heart disease by 70%; no reputable research supports that specific reduction figure.',
'verdict': 'true',
'reason': 'The cited review shows mixed or even increased risk with heavy coffee consumption and does not report a 70% reduction in heart disease risk for eight cups per day, indicating no reputable research supports that specific figure.',
'sources': ['https://pmc.ncbi.nlm.nih.gov/articles/PMC10262944/',
'https://www.escardio.org/The-ESC/Press-Office/Press-releases/morning-coffee-may-protect-the-heart-better-than-all-day-coffee-drinking']}]`
```
Paste a URL link directly.
```
`current\_doc\_url = "https://www.snopes.com/fact-check/drinking-at-disney-world/"
print(f"Extracting and fact-checking claims from: {current\_doc\_url}")
url\_extracted\_claims = extract\_claims\_from\_url(current\_doc\_url)
if url\_extracted\_claims:
print(f"\\nSuccessfully extracted {len(url\_extracted\_claims)} claims from the URL. Now fact-checking them...")
claims\_text\_for\_fact\_check = "\\n".join(url\_extracted\_claims)
url\_fact\_check\_results = fact\_check\_text(claims\_text\_for\_fact\_check)
display(url\_fact\_check\_results)
else:
print("Could not extract claims from the URL to fact-check.")`
```
```
`Extracting and fact-checking claims from: https://www.snopes.com/fact-check/drinking-at-disney-world/
Fetching content from URL: https://www.snopes.com/fact-check/drinking-at-disney-world/
Extracted 1820 characters from the URL. Now extracting claims...
Cerebras LLM claim extraction took 0.57 seconds
Successfully extracted 8 claims from the URL. Now fact-checking them...
Cerebras LLM claim extraction took 0.67 seconds
Extracted 6 claims:
1. On September 9, 2023, Mouse Trap News published an article claiming that the Walt Disney World Resort had officially removed the drinking age.
2. The TikTok video posted by @mousetrapnews had 8.8 million views at the time of this check.
3. Mouse Trap News states on its About page that every story on its website is fake and that it is a satire site.
4. The Pensacola News Journal reported that Disney World was still allowed to sell alcohol only to adults aged 21 or older at the time of the writing.
5. Mouse Trap News previously made a claim that Disney World was supposedly lobbying to lower the drinking age at the resort to 18.
6. Disney World’s policy permits the sale of alcohol only to guests who are 21 years of age or older.
==================================================
Fact-checking Claim 1 of 6: 'On September 9, 2023, Mouse Trap News published an article claiming that the Walt Disney World Resort had officially removed the drinking age.'
Fact-checking claim: On September 9, 2023, Mouse Trap News published an article claiming that the Walt Disney World Resort had officially removed the drinking age.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 2.21 seconds
Verdict: UNCERTAIN
Reason: The available sources discuss rumors about Disney lowering its drinking age and debunk them, but they do not directly confirm that Mouse Trap News published an article on September 9, 2023 making that claim.
Sources:
• https://www.pnj.com/story/news/2023/09/11/disney-world-remove-legal-drinking-age-requirement-florida-debunked/70822543007/
• https://www.aol.com/news/fact-fiction-disney-world-lobbying-040148528.html
==================================================
==================================================
Fact-checking Claim 2 of 6: 'The TikTok video posted by @mousetrapnews had 8.8 million views at the time of this check.'
Fact-checking claim: The TikTok video posted by @mousetrapnews had 8.8 million views at the time of this check.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.34 seconds
Verdict: UNCERTAIN
Reason: The provided excerpts do not include any view count for the specific TikTok video, so they neither confirm nor refute the claim of 8.8 million views.
Sources:
• https://www.tiktok.com/@mousetrapnews/video/7590889191806995743
• https://www.tiktok.com/@mousetrapnews/video/7485897545890336046
==================================================
==================================================
Fact-checking Claim 3 of 6: 'Mouse Trap News states on its About page that every story on its website is fake and that it is a satire site.'
Fact-checking claim: Mouse Trap News states on its About page that every story on its website is fake and that it is a satire site.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.35 seconds
Verdict: TRUE
Reason: The About page explicitly describes Mouse Trap News as a satire/parody site and states that its stories are made‑up and not true, confirming that the site claims all its content is fake. A Facebook post also refers to it as a satirical site.
Sources:
• https://mousetrapnews.com/about/
• https://www.facebook.com/groups/276199024736470/posts/358951296461242/
==================================================
==================================================
Fact-checking Claim 4 of 6: 'The Pensacola News Journal reported that Disney World was still allowed to sell alcohol only to adults aged 21 or older at the time of the writing.'
Fact-checking claim: The Pensacola News Journal reported that Disney World was still allowed to sell alcohol only to adults aged 21 or older at the time of the writing.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.32 seconds
Verdict: TRUE
Reason: The Pensacola News Journal article explicitly states Disney World’s alcohol policy limits sales to guests 21 years old or older, confirming the claim.
Sources:
• https://www.pnj.com/story/news/2023/09/11/disney-world-remove-legal-drinking-age-requirement-florida-debunked/70822543007/
• https://disneyworld.disney.go.com/faq/restaurants/required-id-for-alcohol/
==================================================
==================================================
Fact-checking Claim 5 of 6: 'Mouse Trap News previously made a claim that Disney World was supposedly lobbying to lower the drinking age at the resort to 18.'
Fact-checking claim: Mouse Trap News previously made a claim that Disney World was supposedly lobbying to lower the drinking age at the resort to 18.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.44 seconds
Verdict: TRUE
Reason: The Mouse Trap News article titled “Drinking Age at Disney World May be Lowered to 18” explicitly states that Disney World is lobbying to lower the drinking age, confirming that Mouse Trap News made this claim.
Sources:
• https://mousetrapnews.com/drinking-age-at-disney-world-may-be-lowered-to-18/
• https://www.10news.com/news/fact-or-fiction/fact-or-fiction-disney-world-lobbying-to-lower-drinking-age-on-florida-property
==================================================
==================================================
Fact-checking Claim 6 of 6: 'Disney World’s policy permits the sale of alcohol only to guests who are 21 years of age or older.'
Fact-checking claim: Disney World’s policy permits the sale of alcohol only to guests who are 21 years of age or older.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.30 seconds
Verdict: TRUE
Reason: Official Disney World FAQ states alcoholic beverages can be purchased only by guests 21 years or older, confirming the policy.
Sources:
• https://disneyworld.disney.go.com/faq/restaurants/required-id-for-alcohol/
• https://www.disneyfoodblog.com/2023/10/08/the-one-rule-about-drinking-in-disney-world-you-need-to-know/
==================================================
--- Summary of All Fact-Checking Results ---
Claim: On September 9, 2023, Mouse Trap News published an article claiming that the Walt Disney World Resort had officially removed the drinking age.
Verdict: UNCERTAIN
Reason: The available sources discuss rumors about Disney lowering its drinking age and debunk them, but they do not directly confirm that Mouse Trap News published an article on September 9, 2023 making that claim.
Sources:
• https://www.pnj.com/story/news/2023/09/11/disney-world-remove-legal-drinking-age-requirement-florida-debunked/70822543007/
• https://www.aol.com/news/fact-fiction-disney-world-lobbying-040148528.html
--------------------------------------------------
Claim: The TikTok video posted by @mousetrapnews had 8.8 million views at the time of this check.
Verdict: UNCERTAIN
Reason: The provided excerpts do not include any view count for the specific TikTok video, so they neither confirm nor refute the claim of 8.8 million views.
Sources:
• https://www.tiktok.com/@mousetrapnews/video/7590889191806995743
• https://www.tiktok.com/@mousetrapnews/video/7485897545890336046
--------------------------------------------------
Claim: Mouse Trap News states on its About page that every story on its website is fake and that it is a satire site.
Verdict: TRUE
Reason: The About page explicitly describes Mouse Trap News as a satire/parody site and states that its stories are made‑up and not true, confirming that the site claims all its content is fake. A Facebook post also refers to it as a satirical site.
Sources:
• https://mousetrapnews.com/about/
• https://www.facebook.com/groups/276199024736470/posts/358951296461242/
--------------------------------------------------
Claim: The Pensacola News Journal reported that Disney World was still allowed to sell alcohol only to adults aged 21 or older at the time of the writing.
Verdict: TRUE
Reason: The Pensacola News Journal article explicitly states Disney World’s alcohol policy limits sales to guests 21 years old or older, confirming the claim.
Sources:
• https://www.pnj.com/story/news/2023/09/11/disney-world-remove-legal-drinking-age-requirement-florida-debunked/70822543007/
• https://disneyworld.disney.go.com/faq/restaurants/required-id-for-alcohol/
--------------------------------------------------
Claim: Mouse Trap News previously made a claim that Disney World was supposedly lobbying to lower the drinking age at the resort to 18.
Verdict: TRUE
Reason: The Mouse Trap News article titled “Drinking Age at Disney World May be Lowered to 18” explicitly states that Disney World is lobbying to lower the drinking age, confirming that Mouse Trap News made this claim.
Sources:
• https://mousetrapnews.com/drinking-age-at-disney-world-may-be-lowered-to-18/
• https://www.10news.com/news/fact-or-fiction/fact-or-fiction-disney-world-lobbying-to-lower-drinking-age-on-florida-property
--------------------------------------------------
Claim: Disney World’s policy permits the sale of alcohol only to guests who are 21 years of age or older.
Verdict: TRUE
Reason: Official Disney World FAQ states alcoholic beverages can be purchased only by guests 21 years or older, confirming the policy.
Sources:
• https://disneyworld.disney.go.com/faq/restaurants/required-id-for-alcohol/
• https://www.disneyfoodblog.com/2023/10/08/the-one-rule-about-drinking-in-disney-world-you-need-to-know/
--------------------------------------------------`
```
```
`[{'claim': 'On September 9, 2023, Mouse Trap News published an article claiming that the Walt Disney World Resort had officially removed the drinking age.',
'verdict': 'uncertain',
'reason': 'The available sources discuss rumors about Disney lowering its drinking age and debunk them, but they do not directly confirm that Mouse Trap News published an article on September 9, 2023 making that claim.',
'sources': ['https://www.pnj.com/story/news/2023/09/11/disney-world-remove-legal-drinking-age-requirement-florida-debunked/70822543007/',
'https://www.aol.com/news/fact-fiction-disney-world-lobbying-040148528.html']},
{'claim': 'The TikTok video posted by @mousetrapnews had 8.8 million views at the time of this check.',
'verdict': 'uncertain',
'reason': 'The provided excerpts do not include any view count for the specific TikTok video, so they neither confirm nor refute the claim of 8.8\\u202fmillion views.',
'sources': ['https://www.tiktok.com/@mousetrapnews/video/7590889191806995743',
'https://www.tiktok.com/@mousetrapnews/video/7485897545890336046']},
{'claim': 'Mouse Trap News states on its About page that every story on its website is fake and that it is a satire site.',
'verdict': 'true',
'reason': 'The About page explicitly describes Mouse Trap News as a satire/parody site and states that its stories are made‑up and not true, confirming that the site claims all its content is fake. A Facebook post also refers to it as a satirical site.',
'sources': ['https://mousetrapnews.com/about/',
'https://www.facebook.com/groups/276199024736470/posts/358951296461242/']},
{'claim': 'The Pensacola News Journal reported that Disney World was still allowed to sell alcohol only to adults aged 21 or older at the time of the writing.',
'verdict': 'true',
'reason': 'The Pensacola News Journal article explicitly states Disney World’s alcohol policy limits sales to guests 21 years old or older, confirming the claim.',
'sources': ['https://www.pnj.com/story/news/2023/09/11/disney-world-remove-legal-drinking-age-requirement-florida-debunked/70822543007/',
'https://disneyworld.disney.go.com/faq/restaurants/required-id-for-alcohol/']},
{'claim': 'Mouse Trap News previously made a claim that Disney World was supposedly lobbying to lower the drinking age at the resort to 18.',
'verdict': 'true',
'reason': 'The Mouse Trap News article titled “Drinking Age at Disney World May be Lowered to 18” explicitly states that Disney World is lobbying to lower the drinking age, confirming that Mouse Trap News made this claim.',
'sources': ['https://mousetrapnews.com/drinking-age-at-disney-world-may-be-lowered-to-18/',
'https://www.10news.com/news/fact-or-fiction/fact-or-fiction-disney-world-lobbying-to-lower-drinking-age-on-florida-property']},
{'claim': 'Disney World’s policy permits the sale of alcohol only to guests who are 21 years of age or older.',
'verdict': 'true',
'reason': 'Official Disney World FAQ states alcoholic beverages can be purchased only by guests 21\\u202fyears or older, confirming the policy.',
'sources': ['https://disneyworld.disney.go.com/faq/restaurants/required-id-for-alcohol/',
'https://www.disneyfoodblog.com/2023/10/08/the-one-rule-about-drinking-in-disney-world-you-need-to-know/']}]`
```
Here’s another with a URL example.
```
`article\_url = "https://theonion.com/shedeur-sanders-confident-he-can-deliver-everything-browns-fans-have-come-to-expect/"
print(f"Extracting and fact-checking claims from: {article\_url}")
claims\_from\_url = extract\_claims\_from\_url(article\_url)
if claims\_from\_url:
print(f"\\nSuccessfully extracted {len(claims\_from\_url)} claims from the URL. Now fact-checking them...")
claims\_text\_for\_fact\_check = "\\n".join(claims\_from\_url)
fact\_check\_results = fact\_check\_text(claims\_text\_for\_fact\_check)
display(fact\_check\_results)
else:
print("Could not extract claims from the URL to fact-check.")`
```
```
`Extracting and fact-checking claims from: https://theonion.com/shedeur-sanders-confident-he-can-deliver-everything-browns-fans-have-come-to-expect/
Fetching content from URL: https://theonion.com/shedeur-sanders-confident-he-can-deliver-everything-browns-fans-have-come-to-expect/
Extracted 1224 characters from the URL. Now extracting claims...
Cerebras LLM claim extraction took 0.45 seconds
Successfully extracted 8 claims from the URL. Now fact-checking them...
Cerebras LLM claim extraction took 0.28 seconds
Extracted 6 claims:
1. Shedeur Sanders is a rookie quarterback for the Cleveland Browns.
2. Shedeur Sanders was selected in the fifth round of the NFL Draft.
3. He is the 42nd starting quarterback for the Browns since 1999.
4. The Browns had a 2–8 record at the time of the interview.
5. Dillon Gabriel previously started as quarterback for the Browns.
6. Shedeur Sanders expects to lose the starting quarterback job to Bailey Zappe after two weeks.
==================================================
Fact-checking Claim 1 of 6: 'Shedeur Sanders is a rookie quarterback for the Cleveland Browns.'
Fact-checking claim: Shedeur Sanders is a rookie quarterback for the Cleveland Browns.
Retrieved 5 evidence sources
Cerebras LLM judgment for this claim took 0.42 seconds
Verdict: TRUE
Reason: The Browns roster page lists Shedeur Sanders with experience marked as 'R' (rookie) and notes he was drafted in 2025, confirming he is a rookie quarterback for Cleveland.
Sources:
• https://www.clevelandbrowns.com/team/players-roster/shedeur-sanders/
==================================================
==================================================
Fact-checking Claim 2 of 6: 'Shedeur Sanders was selected in the fifth round of the NFL Draft.'
Fact-checking claim: Shedeur Sanders was selected in the fifth round of the NFL Draft.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.84 seconds
Verdict: TRUE
Reason: Both sources state Shedeur Sanders was chosen with the 144th overall pick, which corresponds to the fifth round of the 2025 NFL Draft.
Sources:
• https://www.clevelandbrowns.com/video/browns-select-shedeur-sanders-with-no-144-pick-in-2025-draft
• https://www.clevelandbrowns.com/news/browns-select-qb-shedeur-sanders-with-the-no-144-pick-in-the-2025-nfl-draft
==================================================
==================================================
Fact-checking Claim 3 of 6: 'He is the 42nd starting quarterback for the Browns since 1999.'
Fact-checking claim: He is the 42nd starting quarterback for the Browns since 1999.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.37 seconds
Verdict: TRUE
Reason: The Wikipedia article states that from 1999 through mid‑2025 the Browns have had 42 players start at quarterback, confirming that the most recent starter is indeed the 42nd.
Sources:
• https://en.wikipedia.org/wiki/List\_of\_Cleveland\_Browns\_starting\_quarterbacks
==================================================
==================================================
Fact-checking Claim 4 of 6: 'The Browns had a 2–8 record at the time of the interview.'
Fact-checking claim: The Browns had a 2–8 record at the time of the interview.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.43 seconds
Verdict: TRUE
Reason: A news article from November 22, 2015 explicitly states the Browns were 2‑8 at that time, which aligns with the claim about the interview timing.
Sources:
• https://www.tribtoday.com/uncategorized/2015/11/browns-2-8-record-has-been-a-team-effort/
==================================================
==================================================
Fact-checking Claim 5 of 6: 'Dillon Gabriel previously started as quarterback for the Browns.'
Fact-checking claim: Dillon Gabriel previously started as quarterback for the Browns.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.37 seconds
Verdict: TRUE
Reason: The evidence shows Gabriel was named the Browns' starter for a game on October 5, 2025, indicating he has previously started as quarterback for Cleveland.
Sources:
• https://en.wikipedia.org/wiki/Dillon\_Gabriel
• https://www.sports-reference.com/cfb/players/dillon-gabriel-1.html
==================================================
==================================================
Fact-checking Claim 6 of 6: 'Shedeur Sanders expects to lose the starting quarterback job to Bailey Zappe after two weeks.'
Fact-checking claim: Shedeur Sanders expects to lose the starting quarterback job to Bailey Zappe after two weeks.
Retrieved 6 evidence sources
Cerebras LLM judgment for this claim took 0.49 seconds
Verdict: UNCERTAIN
Reason: The provided sources show Bailey Zappe being elevated as a backup to Shedeur Sanders and discuss uncertainty about Sanders' future, but none mention Sanders expecting to lose his starting job within two weeks.
Sources:
• https://www.nbcsports.com/nfl/profootballtalk/rumor-mill/news/browns-elevate-bailey-zappe-to-back-up-shedeur-sanders
• https://sports.yahoo.com/nfl/article/what-does-browns-firing-kevin-stefanski-mean-for-shedeur-sanders-062323054.html
==================================================
--- Summary of All Fact-Checking Results ---
Claim: Shedeur Sanders is a rookie quarterback for the Cleveland Browns.
Verdict: TRUE
Reason: The Browns roster page lists Shedeur Sanders with experience marked as 'R' (rookie) and notes he was drafted in 2025, confirming he is a rookie quarterback for Cleveland.
Sources:
• https://www.clevelandbrowns.com/team/players-roster/shedeur-sanders/
--------------------------------------------------
Claim: Shedeur Sanders was selected in the fifth round of the NFL Draft.
Verdict: TRUE
Reason: Both sources state Shedeur Sanders was chosen with the 144th overall pick, which corresponds to the fifth round of the 2025 NFL Draft.
Sources:
• https://www.clevelandbrowns.com/video/browns-select-shedeur-sanders-with-no-144-pick-in-2025-draft
• https://www.clevelandbrowns.com/news/browns-select-qb-shedeur-sanders-with-the-no-144-pick-in-the-2025-nfl-draft
--------------------------------------------------
Claim: He is the 42nd starting quarterback for the Browns since 1999.
Verdict: TRUE
Reason: The Wikipedia article states that from 1999 through mid‑2025 the Browns have had 42 players start at quarterback, confirming that the most recent starter is indeed the 42nd.
Sources:
• https://en.wikipedia.org/wiki/List\_of\_Cleveland\_Browns\_starting\_quarterbacks
--------------------------------------------------
Claim: The Browns had a 2–8 record at the time of the interview.
Verdict: TRUE
Reason: A news article from November 22, 2015 explicitly states the Browns were 2‑8 at that time, which aligns with the claim about the interview timing.
Sources:
• https://www.tribtoday.com/uncategorized/2015/11/browns-2-8-record-has-been-a-team-effort/
--------------------------------------------------
Claim: Dillon Gabriel previously started as quarterback for the Browns.
Verdict: TRUE
Reason: The evidence shows Gabriel was named the Browns' starter for a game on October 5, 2025, indicating he has previously started as quarterback for Cleveland.
Sources:
• https://en.wikipedia.org/wiki/Dillon\_Gabriel
• https://www.sports-reference.com/cfb/players/dillon-gabriel-1.html
--------------------------------------------------
Claim: Shedeur Sanders expects to lose the starting quarterback job to Bailey Zappe after two weeks.
Verdict: UNCERTAIN
Reason: The provided sources show Bailey Zappe being elevated as a backup to Shedeur Sanders and discuss uncertainty about Sanders' future, but none mention Sanders expecting to lose his starting job within two weeks.
Sources:
• https://www.nbcsports.com/nfl/profootballtalk/rumor-mill/news/browns-elevate-bailey-zappe-to-back-up-shedeur-sanders
• https://sports.yahoo.com/nfl/article/what-does-browns-firing-kevin-stefanski-mean-for-shedeur-sanders-062323054.html
--------------------------------------------------`
```
```
`[{'claim': 'Shedeur Sanders is a rookie quarterback for the Cleveland Browns.',
'verdict': 'true',
'reason': "The Browns roster page lists Shedeur Sanders with experience marked as 'R' (rookie) and notes he was drafted in 2025, confirming he is a rookie quarterback for Cleveland.",
'sources': ['https://www.clevelandbrowns.com/team/players-roster/shedeur-sanders/']},
{'claim': 'Shedeur Sanders was selected in the fifth round of the NFL Draft.',
'verdict': 'true',
'reason': 'Both sources state Shedeur Sanders was chosen with the 144th overall pick, which corresponds to the fifth round of the 2025 NFL Draft.',
'sources': ['https://www.clevelandbrowns.com/video/browns-select-shedeur-sanders-with-no-144-pick-in-2025-draft',
'https://www.clevelandbrowns.com/news/browns-select-qb-shedeur-sanders-with-the-no-144-pick-in-the-2025-nfl-draft']},
{'claim': 'He is the 42nd starting quarterback for the Browns since 1999.',
'verdict': 'true',
'reason': 'The Wikipedia article states that from 1999 through mid‑2025 the Browns have had 42 players start at quarterback, confirming that the most recent starter is indeed the 42nd.',
'sources': ['https://en.wikipedia.org/wiki/List\_of\_Cleveland\_Browns\_starting\_quarterbacks']},
{'claim': 'The Browns had a 2–8 record at the time of the interview.',
'verdict': 'true',
'reason': 'A news article from November 22, 2015 explicitly states the Browns were 2‑8 at that time, which aligns with the claim about the interview timing.',
'sources': ['https://www.tribtoday.com/uncategorized/2015/11/browns-2-8-record-has-been-a-team-effort/']},
{'claim': 'Dillon Gabriel previously started as quarterback for the Browns.',
'verdict': 'true',
'reason': "The evidence shows Gabriel was named the Browns' starter for a game on October 5, 2025, indicating he has previously started as quarterback for Cleveland.",
'sources': ['https://en.wikipedia.org/wiki/Dillon\_Gabriel',
'https://www.sports-reference.com/cfb/players/dillon-gabriel-1.html']},
{'claim': 'Shedeur Sanders expects to lose the starting quarterback job to Bailey Zappe after two weeks.',
'verdict': 'uncertain',
'reason': "The provided sources show Bailey Zappe being elevated as a backup to Shedeur Sanders and discuss uncertainty about Sanders' future, but none mention Sanders expecting to lose his starting job within two weeks.",
'sources': ['https://www.nbcsports.com/nfl/profootballtalk/rumor-mill/news/browns-elevate-bailey-zappe-to-back-up-shedeur-sanders',
'https://sports.yahoo.com/nfl/article/what-does-browns-firing-kevin-stefanski-mean-for-shedeur-sanders-062323054.html']}]`
```
And with that, you’ve successfully built a fact-checker using gpt-oss-120B, Cerebras, and Parallel!
**⚠️ Disclaimer:**
This guide is meant purely as an educational starting point. To keep things simple, the code here skips over several production concerns like prompt injection, input sanitation, and stricter output validation. If you decide to turn this into a real app, add those protections.
**Contributors**
This guide serves as a joint collaboration effort between OpenAI, [Cerebras Systems](https://www.cerebras.ai/), and [Parallel Web Systems](https://parallel.ai/), with attributions to the following for their valuable feedback and support.
* Vaibhav Srivastav
* Dominik Kundel
* Sarah Chieng
* Sebastian Duerr
* Matt Harris
* Lukas Levert
* Joyce Er
* Kevin Taylor
* Khushi Shelat