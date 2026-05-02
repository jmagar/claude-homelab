Web Search and States with Responses API
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
Mar 11, 2025
# Web Search and States with Responses API
[ BC ](https://www.linkedin.com/in/billchen99/)
[ Bill Chen
(OpenAI)
](https://www.linkedin.com/in/billchen99/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/responses_api/responses_example.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/responses_api/responses_example.ipynb)
## What is the Responses API?
The Responses API is a new way to interact with OpenAI models, designed to be simpler and more flexible than previous APIs. It makes it easy to build advanced AI applications that use multiple tools, handle multi-turn conversations, and work with different types of data (not just text).
Unlike older APIs—such as Chat Completions, which were built mainly for text, or the Assistants API, which can require a lot of setup—the Responses API is built from the ground up for:
* Seamless multi-turn interactions (carry on a conversation across several steps in a single API call)
* Easy access to powerful hosted tools (like file search, web search, and code interpreter)
* Fine-grained control over the context you send to the model
As AI models become more capable of complex, long-running reasoning, developers need an API that is both asynchronous and stateful. The Responses API is designed to meet these needs.
In this guide, you’ll see some of the new features the Responses API offers, along with practical examples to help you get started.
## Basics
By design, on the surface, the Responses API is very similar to the Completions API.
```
`from openai import OpenAI
import os
client = OpenAI(api\_key=os.getenv("OPENAI\_API\_KEY"))`
```
```
`response = client.responses.create(
model="gpt-4o-mini",
input="tell me a joke",
)`
```
```
`print(response.output[0].content[0].text)`
```
```
`Why did the scarecrow win an award?
Because he was outstanding in his field!`
```
One key feature of the Response API is that it is stateful. This means that you do not have to manage the state of the conversation by yourself, the API will handle it for you. For example, you can retrieve the response at any time and it will include the full conversation history.
```
`fetched\_response = client.responses.retrieve(
response\_id=response.id)
print(fetched\_response.output[0].content[0].text)`
```
```
`Why did the scarecrow win an award?
Because he was outstanding in his field!`
```
You can continue the conversation by referring to the previous response.
```
`response\_two = client.responses.create(
model="gpt-4o-mini",
input="tell me another",
previous\_response\_id=response.id
)`
```
```
`print(response\_two.output[0].content[0].text)`
```
```
`Why don't skeletons fight each other?
They don't have the guts!`
```
You can of course manage the context yourself. But one benefit of OpenAI maintaining the context for you is that you can fork the response at any point and continue the conversation from that point.
```
`response\_two\_forked = client.responses.create(
model="gpt-4o-mini",
input="I didn't like that joke, tell me another and tell me the difference between the two jokes",
previous\_response\_id=response.id # Forking and continuing from the first response
)
output\_text = response\_two\_forked.output[0].content[0].text
print(output\_text)`
```
```
`Sure! Here’s another joke:
Why don’t scientists trust atoms?
Because they make up everything!
\*\*Difference:\*\* The first joke plays on a pun involving "outstanding" in a literal sense versus being exceptional, while the second joke relies on a play on words about atoms "making up" matter versus fabricating stories. Each joke uses wordplay, but they target different concepts (farming vs. science).`
```
## Hosted Tools
Another benefit of the Responses API is that it adds support for hosted tools like `file\_search` and `web\_search`. Instead of manually calling the tools, simply pass in the tools and the API will decide which tool to use and use it.
Here is an example of using the `web\_search` tool to incorporate web search results into the response.
```
`response = client.responses.create(
model="gpt-4o", # or another supported model
input="What's the latest news about AI?",
tools=[
{
"type": "web\_search"
}
]
)`
```
```
`import json
print(json.dumps(response.output, default=lambda o: o.\_\_dict\_\_, indent=2))`
```
```
`[
{
"id": "ws\_67bd64fe91f081919bec069ad65797f1",
"status": "completed",
"type": "web\_search\_call"
},
{
"id": "msg\_67bd6502568c8191a2cbb154fa3fbf4c",
"content": [
{
"annotations": [
{
"index": null,
"title": "Huawei improves AI chip production in boost for China's tech goals",
"type": "url\_citation",
"url": "https://www.ft.com/content/f46b7f6d-62ed-4b64-8ad7-2417e5ab34f6?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Apple cheers Trump with $500bn US investment plan; more losses on Wall Street - as it happened",
"type": "url\_citation",
"url": "https://www.theguardian.com/business/live/2025/feb/24/euro-hits-one-month-high-german-election-result-stock-markets-dax-bank-of-england-business-live-news?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Microsoft axes data center leases as DeepSeek casts doubt on massive AI spend: report",
"type": "url\_citation",
"url": "https://nypost.com/2025/02/24/business/microsoft-axes-some-ai-data-center-leases-td-cowen-says/?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Alibaba Plans to Invest $52B in AI, Cloud Over Next Three Years",
"type": "url\_citation",
"url": "https://www.investopedia.com/alibaba-plans-to-invest-usd52b-in-ai-cloud-over-next-three-years-11684981?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "JPMorgan Unit Backs Albert Invent at a $270 Million Valuation",
"type": "url\_citation",
"url": "https://www.wsj.com/articles/jpmorgan-unit-backs-albert-invent-at-a-270-million-valuation-1ab03c96?utm\_source=chatgpt.com"
}
],
"text": "As of February 25, 2025, several significant developments have emerged in the field of artificial intelligence (AI):\\n\\n\*\*Huawei's Advancements in AI Chip Production\*\*\\n\\nHuawei has notably enhanced its AI chip production capabilities, increasing the yield rate of its Ascend 910C processors from 20% to nearly 40%. This improvement has rendered the production line profitable for the first time and is pivotal for China's ambition to achieve self-sufficiency in advanced semiconductors. Despite these strides, Nvidia continues to dominate the AI chip market in China, attributed to its user-friendly software and widespread adoption. Huawei aims to further elevate its yield rate to 60% and plans to produce 100,000 Ascend 910C processors and 300,000 910B chips in 2025. ([ft.com](https://www.ft.com/content/f46b7f6d-62ed-4b64-8ad7-2417e5ab34f6?utm\_source=chatgpt.com))\\n\\n\*\*Apple's $500 Billion U.S. Investment Plan\*\*\\n\\nApple has unveiled a substantial $500 billion investment strategy in the United States over the next four years. This plan encompasses the creation of 20,000 new jobs and the establishment of a major facility in Texas dedicated to manufacturing artificial intelligence servers. President Donald Trump has lauded this initiative, viewing it as a testament to the confidence in his administration. Concurrently, Wall Street has experienced further losses due to concerns over a potential economic slowdown, exacerbated by tariffs. ([theguardian.com](https://www.theguardian.com/business/live/2025/feb/24/euro-hits-one-month-high-german-election-result-stock-markets-dax-bank-of-england-business-live-news?utm\_source=chatgpt.com))\\n\\n\*\*Microsoft Adjusts AI Data Center Investments\*\*\\n\\nMicrosoft has canceled leases on U.S. data centers totaling several hundred megawatts, potentially affecting two large centers. This decision is reportedly linked to concerns about oversupply, following claims by Chinese competitor DeepSeek of developing a generative chatbot more efficiently than U.S. companies. Analysts suggest that Microsoft might be reallocating funds or responding to OpenAI's shift to Oracle for a $500 billion project. Despite being a leading AI investor with planned expenditures of $80 billion this year, Microsoft appears to be scaling back on massive spending initiatives, allowing significant data center agreements to lapse and citing facility and power delays. ([nypost.com](https://nypost.com/2025/02/24/business/microsoft-axes-some-ai-data-center-leases-td-cowen-says/?utm\_source=chatgpt.com))\\n\\n\*\*Alibaba's $52 Billion Investment in AI and Cloud Infrastructure\*\*\\n\\nAlibaba Group has announced plans to invest over $52 billion in artificial intelligence and cloud infrastructure over the next three years, surpassing its total investment in these areas over the past decade. This strategic move underscores Alibaba's commitment to AI-driven growth and reinforces its position as a leading global cloud provider. Following this announcement, Alibaba's U.S.-listed shares experienced a 3% drop in premarket trading. Analysts view this investment as aligning with market expectations and indicative of Alibaba Cloud's significant capital expenditure compared to peers. ([investopedia.com](https://www.investopedia.com/alibaba-plans-to-invest-usd52b-in-ai-cloud-over-next-three-years-11684981?utm\_source=chatgpt.com))\\n\\n\*\*JPMorgan's Investment in AI-Driven Chemical Development\*\*\\n\\nJPMorgan Chase's private investment arm has led a $20 million growth investment in Albert Invent, an AI-driven chemical development platform, valuing the company at $270 million. This funding will enable Albert Invent to expand globally and increase its workforce from 120 to over 200 employees by the end of the year. The company assists chemists in developing new formulations and materials, significantly accelerating chemical experiments. For instance, Albert's platform can simulate 100,000 experiments in 10 minutes for clients like Nouryon Chemicals. ([wsj.com](https://www.wsj.com/articles/jpmorgan-unit-backs-albert-invent-at-a-270-million-valuation-1ab03c96?utm\_source=chatgpt.com))\\n\\nThese developments reflect the dynamic and rapidly evolving landscape of AI, with major corporations and financial institutions making significant investments to advance technology and infrastructure in this sector.\\n\\n\\n# Key AI Developments as of February 25, 2025:\\n- [Huawei improves AI chip production in boost for China's tech goals](https://www.ft.com/content/f46b7f6d-62ed-4b64-8ad7-2417e5ab34f6?utm\_source=chatgpt.com)\\n- [Apple cheers Trump with $500bn US investment plan; more losses on Wall Street - as it happened](https://www.theguardian.com/business/live/2025/feb/24/euro-hits-one-month-high-german-election-result-stock-markets-dax-bank-of-england-business-live-news?utm\_source=chatgpt.com)\\n- [Microsoft axes data center leases as DeepSeek casts doubt on massive AI spend: report](https://nypost.com/2025/02/24/business/microsoft-axes-some-ai-data-center-leases-td-cowen-says/?utm\_source=chatgpt.com)\\n ",
"type": "output\_text",
"logprobs": null
}
],
"role": "assistant",
"type": "message"
}
]`
```
## Multimodal, Tool-augmented conversation
The Responses API natively supports text, images, and audio modalities.
Tying everything together, we can build a fully multimodal, tool-augmented interaction with one API call through the responses API.
```
`import base64
from IPython.display import Image, display
# Display the image from the provided URL
url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Cat\_August\_2010-4.jpg/2880px-Cat\_August\_2010-4.jpg"
display(Image(url=url, width=400))
response\_multimodal = client.responses.create(
model="gpt-4o",
input=[
{
"role": "user",
"content": [
{"type": "input\_text", "text":
"Come up with keywords related to the image, and search on the web using the search tool for any news related to the keywords"
", summarize the findings and cite the sources."},
{"type": "input\_image", "image\_url": "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Cat\_August\_2010-4.jpg/2880px-Cat\_August\_2010-4.jpg"}
]
}
],
tools=[
{"type": "web\_search"}
]
)`
```
```
`import json
print(json.dumps(response\_multimodal.\_\_dict\_\_, default=lambda o: o.\_\_dict\_\_, indent=4))`
```
```
`{
"id": "resp\_67bd65392a088191a3b802a61f4fba14",
"created\_at": 1740465465.0,
"error": null,
"metadata": {},
"model": "gpt-4o-2024-08-06",
"object": "response",
"output": [
{
"id": "msg\_67bd653ab9cc81918db973f0c1af9fbb",
"content": [
{
"annotations": [],
"text": "Based on the image of a cat, some relevant keywords could be:\\n\\n- Cat\\n- Feline\\n- Pet\\n- Animal care\\n- Cat behavior\\n\\nI'll search for recent news related to these keywords.",
"type": "output\_text",
"logprobs": null
}
],
"role": "assistant",
"type": "message"
},
{
"id": "ws\_67bd653c7a548191af86757fbbca96e1",
"status": "completed",
"type": "web\_search\_call"
},
{
"id": "msg\_67bd653f34fc8191989241b2659fd1b5",
"content": [
{
"annotations": [
{
"index": null,
"title": "Cat miraculously survives 3 weeks trapped in sofa during family's cross-country move",
"type": "url\_citation",
"url": "https://nypost.com/2025/02/24/us-news/cat-miraculously-survives-3-weeks-trapped-in-sofa-during-familys-cross-country-move/?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Ex-College Soccer Player Accused of Killing Fellow Athlete Brother, Cat Using Knife, Golf Club: Prosecutors",
"type": "url\_citation",
"url": "https://people.com/princeton-murder-soccer-player-accused-murdering-athlete-brother-11685671?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Cuddly 8-Year-Old Cat Surrendered to Shelter for Being 'Too Affectionate' Inspires Dozens of Adoption Applications",
"type": "url\_citation",
"url": "https://people.com/cat-surrendered-connecticut-shelter-too-affectionate-11684130?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Emaciated cat found in Meriden abandoned in snow dies after rescue attempt, officials say",
"type": "url\_citation",
"url": "https://www.ctinsider.com/recordjournal/article/meriden-animal-control-cat-neglected-abandoned-20172924.php?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Cat proves mom correct by using human toilet",
"type": "url\_citation",
"url": "https://nypost.com/video/cat-proves-mom-correct-by-using-human-toilet/?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Litter-Robot 3 Connect Review",
"type": "url\_citation",
"url": "https://www.thesprucepets.com/litter-robot-3-connect-review-8780105?utm\_source=chatgpt.com"
},
{
"index": null,
"title": "Taylor Swift's favourite cat faces breeding ban",
"type": "url\_citation",
"url": "https://www.thetimes.co.uk/article/taylor-swifts-favourite-cat-faces-breeding-ban-k32nvf6kv?utm\_source=chatgpt.com"
}
],
"text": "Here are some recent news stories related to cats:\\n\\n\*\*1. Cat Survives Three Weeks Trapped in Sofa During Move\*\*\\n\\nA cat named Sunny-Loo survived three weeks trapped inside a sofa during the Hansons' move from Washington state to Colorado. After disappearing during the move, she was discovered emaciated but alive when the family unpacked their furniture. Sunny-Loo received intensive care and has since been reunited with her family. ([nypost.com](https://nypost.com/2025/02/24/us-news/cat-miraculously-survives-3-weeks-trapped-in-sofa-during-familys-cross-country-move/?utm\_source=chatgpt.com))\\n\\n\*\*2. Man Charged with Killing Brother and Family Cat\*\*\\n\\nMatthew Hertgen, a former college soccer player, has been charged with the murder of his younger brother, Joseph Hertgen, and animal cruelty for allegedly killing the family cat. The incident occurred in Princeton, New Jersey, where authorities found Joseph's body with signs of trauma. Matthew faces multiple charges, including first-degree murder. ([people.com](https://people.com/princeton-murder-soccer-player-accused-murdering-athlete-brother-11685671?utm\_source=chatgpt.com))\\n\\n\*\*3. \\"Too Affectionate\\" Cat Sparks Adoption Interest\*\*\\n\\nAn 8-year-old cat named Ravi was surrendered to a Connecticut shelter for being \\"too affectionate.\\" A TikTok video highlighting his story went viral, amassing over 12.6 million views and leading to more than 160 adoption applications. Ravi now has an adoption appointment, and the shelter has gained increased attention for its other adoptable pets. ([people.com](https://people.com/cat-surrendered-connecticut-shelter-too-affectionate-11684130?utm\_source=chatgpt.com))\\n\\n\*\*4. Emaciated Cat Found in Snow Dies After Rescue Attempt\*\*\\n\\nA severely neglected cat named Lizzy was found abandoned in a snowbank in Meriden, Connecticut. Despite rescue efforts, Lizzy did not survive. Authorities are seeking information to identify the person responsible for her abandonment, with a reward offered for leads. ([ctinsider.com](https://www.ctinsider.com/recordjournal/article/meriden-animal-control-cat-neglected-abandoned-20172924.php?utm\_source=chatgpt.com))\\n\\n\*\*5. Cat Uses Human Toilet, Surprising Family\*\*\\n\\nIn the UK, a cat named Cruise surprised his family by using a human toilet. Despite initial skepticism from her partner and son, Hayley Bibby captured footage of Cruise's bathroom habits, validating her claims. The family now accommodates Cruise's preference by leaving the toilet seat up. ([nypost.com](https://nypost.com/video/cat-proves-mom-correct-by-using-human-toilet/?utm\_source=chatgpt.com))\\n\\n\*\*6. Litter-Robot 3 Connect: A High-Tech Litter Box Review\*\*\\n\\nThe Litter-Robot 3 Connect, priced at $499, offers a self-cleaning solution for cat owners averse to scooping litter. While effective and reducing litter usage by 50%, some users note that odor prevention could be improved. The device includes features like a night light and smartphone app integration. ([thesprucepets.com](https://www.thesprucepets.com/litter-robot-3-connect-review-8780105?utm\_source=chatgpt.com))\\n\\n\*\*7. Taylor Swift's Favorite Cat Breed Faces Breeding Ban\*\*\\n\\nThe Scottish Fold cat breed, favored by celebrities like Taylor Swift, may face a breeding ban in Britain due to inheritable health issues. These cats often suffer from painful conditions caused by defective cartilage formation. The Animal Welfare Committee has recommended prohibiting the breeding of such cats to prevent further health problems. ([thetimes.co.uk](https://www.thetimes.co.uk/article/taylor-swifts-favourite-cat-faces-breeding-ban-k32nvf6kv?utm\_source=chatgpt.com))\\n\\n\\n# Recent Cat-Related News Stories:\\n- [Cat miraculously survives 3 weeks trapped in sofa during family's cross-country move](https://nypost.com/2025/02/24/us-news/cat-miraculously-survives-3-weeks-trapped-in-sofa-during-familys-cross-country-move/?utm\_source=chatgpt.com)\\n- [Ex-College Soccer Player Accused of Killing Fellow Athlete Brother, Cat Using Knife, Golf Club: Prosecutors](https://people.com/princeton-murder-soccer-player-accused-murdering-athlete-brother-11685671?utm\_source=chatgpt.com)\\n- [Cuddly 8-Year-Old Cat Surrendered to Shelter for Being 'Too Affectionate' Inspires Dozens of Adoption Applications](https://people.com/cat-surrendered-connecticut-shelter-too-affectionate-11684130?utm\_source=chatgpt.com)\\n ",
"type": "output\_text",
"logprobs": null
}
],
"role": "assistant",
"type": "message"
}
],
"temperature": 1.0,
"tool\_choice": "auto",
"tools": [
{
"type": "web\_search",
"location": null,
"sites": null
}
],
"top\_p": 1.0,
"max\_completion\_tokens": null,
"previous\_response\_id": null,
"reasoning\_effort": null,
"text": {
"format": {
"type": "text"
},
"stop": null
},
"top\_logprobs": null,
"truncation": "disabled",
"usage": {
"completion\_tokens": null,
"prompt\_tokens": null,
"total\_tokens": 1370,
"completion\_tokens\_details": null,
"prompt\_tokens\_details": null
}
}`
```
In the above example, we were able to use the `web\_search` tool to search the web for news related to the image in one API call instead of multiple round trips that would be required if we were using the Chat Completions API.
With the responses API
🔥 a single API call can handle:
✅ Analyze a given image using a multimodal input.
✅ Perform web search via the `web\_search` hosted tool
✅ Summarize the results.
In contrast, With Chat Completions API would require multiple steps, each requiring a round trip to the API:
1️⃣ Upload image and get analysis → 1 request
2️⃣ Extract info, call external web search → manual step + tool execution
3️⃣ Re-submit tool results for summarization → another request
See the following diagram for a side by side visualized comparison!
We are very excited for you to try out the Responses API and see how it can simplify your code and make it easier to build complex, multimodal, tool-augmented interactions!