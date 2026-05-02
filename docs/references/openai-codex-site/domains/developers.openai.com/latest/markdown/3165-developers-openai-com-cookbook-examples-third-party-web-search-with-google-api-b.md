Building a Bring Your Own Browser (BYOB) Tool for Web Browsing and Summarization
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
Sep 26, 2024
# Building a Bring Your Own Browser (BYOB) Tool for Web Browsing and Summarization
[ MS ](https://github.com/msingh-openai)
[ Mandeep Singh
(OpenAI)
](https://github.com/msingh-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/third_party/Web_search_with_google_api_bring_your_own_browser_tool.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/third_party/Web_search_with_google_api_bring_your_own_browser_tool.ipynb)
## Building a Bring Your Own Browser (BYOB) Tool for Web Browsing and Summarization
**Disclaimer: This cookbook is for educational purposes only. Ensure that you comply with all applicable laws and service terms when using web search and scraping technologies. This cookbook will restrict the search to openai.com domain to retrieve the public information to illustrate the concepts.**
Large Language Models (LLMs) such as GPT-4o have a knowledge cutoff date, which means they lack information about events that occurred after that point. In scenarios where the most recent data is essential, it’s necessary to provide LLMs with access to current web information to ensure accurate and relevant responses.
In this guide, we will build a Bring Your Own Browser (BYOB) tool using Python to overcome this limitation. Our goal is to create a system that provides up-to-date answers in your application, including the most recent developments such as the latest product launches by OpenAI. By integrating web search capabilities with an LLM, we’ll enable the model to generate responses based on the latest information available online.
While you can use any publicly available search APIs, we’ll utilize Google’s Custom Search API to perform web searches. The retrieved information from the search results will be processed and passed to the LLM to generate the final response through Retrieval-Augmented Generation (RAG).
**Bring Your Own Browser (BYOB)** tools allow users to perform web browsing tasks programmatically. In this notebook, we’ll create a BYOB tool that:
**#1. Set Up a Search Engine:** Use a public search API, such as Google’s Custom Search API, to perform web searches and obtain a list of relevant search results.
**#2. Build a Search Dictionary:** Collect the title, URL, and a summary of each web page from the search results to create a structured dictionary of information.
**#3. Generate a RAG Response:** Implement Retrieval-Augmented Generation (RAG) by passing the gathered information to the LLM, which then generates a final response to the user’s query.
### Use Case
In this cookbook, we’ll take the example of a user who wants to list recent product launches by OpenAI in chronological order. Because the current GPT-4o model has a knowledge cutoff date, it is not expected that the model will know about recent product launches such as the o1-preview model launched in September 2024.
```
`from openai import OpenAI
client = OpenAI()
search\_query = "List the latest OpenAI product launches in chronological order from latest to oldest in the past 2 years"
response = client.chat.completions.create(
model="gpt-4o",
messages=[
{"role": "system", "content": "You are a helpful agent."},
{"role": "user", "content": search\_query}]
).choices[0].message.content
print(response)`
```
```
`OpenAI has had several notable product launches and updates in the past couple of years. Here’s a chronological list of some significant ones:
1. \*\*ChatGPT (November 2022)\*\*: OpenAI launched an AI chatbot called ChatGPT, which is based on GPT-3.5. This chatbot became widely popular due to its impressive capabilities in understanding and generating human-like text.
2. \*\*GPT-4 (March 2023)\*\*: OpenAI released GPT-4, the latest version of their Generative Pre-trained Transformer model. It brought improvements in both performance and accuracy over its predecessors.
3. \*\*DALL-E 2 (April 2022)\*\*: The second version of DALL-E, an AI model that can generate images from textual descriptions, was launched with enhanced image resolution and more robust capabilities.
4. \*\*Whisper (September 2022)\*\*: Whisper, an automatic speech recognition (ASR) system, was introduced. This model can handle multiple languages and is useful for transcribing and understanding spoken language.
These are some of the key product launches from OpenAI in the past couple of years. Keep in mind the technology landscape is continually evolving, and new developments can occur.`
```
Given the knowledge cutoff, as expected the model does not know about the recent product launches by OpenAI.
### Setting up a BYOB tool
To provide the model with recent events information, we’ll follow these steps:
##### Step 1: Set Up a Search Engine to Provide Web Search Results
##### Step 2: Build a Search Dictionary with Titles, URLs, and Summaries of Web Pages
##### Step 3: Pass the information to the model to generate a RAG Response to the User Query
Before we begin, ensure you have the following: **Python 3.12 or later** installed on your machine. You will also need a Google Custom Search API key and Custom Search Engine ID (CSE ID). Necessary Python packages installed: `requests`, `beautifulsoup4`, `openai`. And ensure the OPENAI\_API\_KEY is set up as an environment variable.
#### Step 1: Set Up a Search Engine to Provide Web Search Results
You can use any publicly available web search APIs to perform this task. We will configure a custom search engine using Google’s Custom Search API. This engine will fetch a list of relevant web pages based on the user’s query, focusing on obtaining the most recent and pertinent results.
**a. Configure Search API key and Function:** Acquire a Google API key and a Custom Search Engine ID (CSE ID) from the Google Developers Console. You can navigate to this [Programmable Search Engine Link](https://developers.google.com/custom-search/v1/overview) to set up an API key as well as Custom Search Engine ID (CSE ID).
The `search` function below sets up the search based on search term, the API and CSE ID keys, as well as number of search results to return. We’ll introduce a parameter `site\_filter` to restrict the output to only `openai.com`
```
`import requests # For making HTTP requests to APIs and websites
def search(search\_item, api\_key, cse\_id, search\_depth=10, site\_filter=None):
service\_url = 'https://www.googleapis.com/customsearch/v1'
params = {
'q': search\_item,
'key': api\_key,
'cx': cse\_id,
'num': search\_depth
}
try:
response = requests.get(service\_url, params=params)
response.raise\_for\_status()
results = response.json()
# Check if 'items' exists in the results
if 'items' in results:
if site\_filter is not None:
# Filter results to include only those with site\_filter in the link
filtered\_results = [result for result in results['items'] if site\_filter in result['link']]
if filtered\_results:
return filtered\_results
else:
print(f"No results with {site\_filter} found.")
return []
else:
if 'items' in results:
return results['items']
else:
print("No search results found.")
return []
except requests.exceptions.RequestException as e:
print(f"An error occurred during the search: {e}")
return []`
```
**b. Identify the search terms for search engine:** Before we can retrieve specific results from a 3rd Party API, we may need to use Query Expansion to identify specific terms our browser search API should retrieve. **Query expansion** is a process where we broaden the original user query by adding related terms, synonyms, or variations. This technique is essential because search engines, like Google’s Custom Search API, are often better at matching a range of related terms rather than just the natural language prompt used by a user.
For example, searching with only the raw query `"List the latest OpenAI product launches in chronological order from latest to oldest in the past 2 years"` may return fewer and less relevant results than a more specific and direct search on a succinct phrase such as `"Latest OpenAI product launches"`. In the code below, we will use the user’s original `search\_query` to produce a more specific search term to use with the Google API to retrieve the results.
```
`search\_term = client.chat.completions.create(
model="gpt-4o",
messages=[
{"role": "system", "content": "Provide a google search term based on search query provided below in 3-4 words"},
{"role": "user", "content": search\_query}]
).choices[0].message.content
print(search\_term)`
```
```
`Latest OpenAI product launches`
```
**c. Invoke the search function:** Now that we have the search term, we will invoke the search function to retrieve the results from Google search API. The results only have the link of the web page and a snippet at this point. In the next step, we will retrieve more information from the webpage and summarize it in a dictionary to pass to the model.
```
`from dotenv import load\_dotenv
import os
load\_dotenv('.env')
api\_key = os.getenv('API\_KEY')
cse\_id = os.getenv('CSE\_ID')
search\_items = search(search\_item=search\_term, api\_key=api\_key, cse\_id=cse\_id, search\_depth=10, site\_filter="https://openai.com")`
```
```
`for item in search\_items:
print(f"Link: {item['link']}")
print(f"Snippet: {item['snippet']}\\n")`
```
```
`Link: https://openai.com/news/
Snippet: Overview ; Product. Sep 12, 2024. Introducing OpenAI o1 ; Product. Jul 25, 2024. SearchGPT is a prototype of new AI search features ; Research. Jul 18, 2024. GPT- ...
Link: https://openai.com/index/new-models-and-developer-products-announced-at-devday/
Snippet: Nov 6, 2023 ... GPT-4 Turbo with 128K context · We released the first version of GPT-4 in March and made GPT-4 generally available to all developers in July.
Link: https://openai.com/news/product/
Snippet: Discover the latest product advancements from OpenAI and the ways they're being used by individuals and businesses.
Link: https://openai.com/
Snippet: A new series of AI models designed to spend more time thinking before they respond. Learn more · (opens in a new window) ...
Link: https://openai.com/index/sora/
Snippet: Feb 15, 2024 ... We plan to include C2PA metadata(opens in a new window) in the future if we deploy the model in an OpenAI product. In addition to us developing ...
Link: https://openai.com/o1/
Snippet: We've developed a new series of AI models designed to spend more time thinking before they respond. Here is the latest news on o1 research, product and ...
Link: https://openai.com/index/introducing-gpts/
Snippet: Nov 6, 2023 ... We plan to offer GPTs to more users soon. Learn more about our OpenAI DevDay announcements for new models and developer products.
Link: https://openai.com/api/
Snippet: The most powerful platform for building AI products ... Build and scale AI experiences powered by industry-leading models and tools. Start building (opens in a ...`
```
#### Step 2: Build a Search Dictionary with Titles, URLs, and Summaries of Web Pages
After obtaining the search results, we’ll extract and organize the relevant information, so it can be passed to the LLM for final output.
**a. Scrape Web Page Content:** For each URL in the search results, retrieve the web page to extract textual content while filtering out non-relevant data like scripts and advertisements as demonstrated in function `retrieve\_content`.
**b. Summarize Content:** Use an LLM to generate concise summaries of the scraped content, focusing on information pertinent to the user’s query. Model can be provided the original search text, so it can focus on summarizing the content for the search intent as outlined in function `summarize\_content`.
**c. Create a Structured Dictionary:** Organize the data into a dictionary or a DataFrame containing the title, link, and summary for each web page. This structure can be passed on to the LLM to generate the summary with the appropriate citations.
```
`import requests
from bs4 import BeautifulSoup
TRUNCATE\_SCRAPED\_TEXT = 50000 # Adjust based on your model's context window
SEARCH\_DEPTH = 5
def retrieve\_content(url, max\_tokens=TRUNCATE\_SCRAPED\_TEXT):
try:
headers = {'User-Agent': 'Mozilla/5.0'}
response = requests.get(url, headers=headers, timeout=10)
response.raise\_for\_status()
soup = BeautifulSoup(response.content, 'html.parser')
for script\_or\_style in soup(['script', 'style']):
script\_or\_style.decompose()
text = soup.get\_text(separator=' ', strip=True)
characters = max\_tokens \* 4 # Approximate conversion
text = text[:characters]
return text
except requests.exceptions.RequestException as e:
print(f"Failed to retrieve {url}: {e}")
return None
def summarize\_content(content, search\_term, character\_limit=500):
prompt = (
f"You are an AI assistant tasked with summarizing content relevant to '{search\_term}'. "
f"Please provide a concise summary in {character\_limit} characters or less."
)
try:
response = client.chat.completions.create(
model="gpt-4o-mini",
messages=[
{"role": "system", "content": prompt},
{"role": "user", "content": content}]
)
summary = response.choices[0].message.content
return summary
except Exception as e:
print(f"An error occurred during summarization: {e}")
return None
def get\_search\_results(search\_items, character\_limit=500):
# Generate a summary of search results for the given search term
results\_list = []
for idx, item in enumerate(search\_items, start=1):
url = item.get('link')
snippet = item.get('snippet', '')
web\_content = retrieve\_content(url, TRUNCATE\_SCRAPED\_TEXT)
if web\_content is None:
print(f"Error: skipped URL: {url}")
else:
summary = summarize\_content(web\_content, search\_term, character\_limit)
result\_dict = {
'order': idx,
'link': url,
'title': snippet,
'Summary': summary
}
results\_list.append(result\_dict)
return results\_list`
```
```
`results = get\_search\_results(search\_items)
for result in results:
print(f"Search order: {result['order']}")
print(f"Link: {result['link']}")
print(f"Snippet: {result['title']}")
print(f"Summary: {result['Summary']}")
print('-' \* 80)`
```
```
`Search order: 1
Link: https://openai.com/news/
Snippet: Overview ; Product. Sep 12, 2024. Introducing OpenAI o1 ; Product. Jul 25, 2024. SearchGPT is a prototype of new AI search features ; Research. Jul 18, 2024. GPT- ...
Summary: OpenAI recently launched several notable products in 2024, including OpenAI o1 and SearchGPT, a prototype for enhanced AI search capabilities. Additionally, GPT-4o mini was introduced, enhancing cost-efficient intelligence. The organization also rolled out OpenAI for Nonprofits and ChatGPT Edu to support various sectors. Improvements in data analysis within ChatGPT and enhancements to the fine-tuning API were also announced. These updates reflect OpenAI's ongoing commitment to advancing AI technologies across different fields.
--------------------------------------------------------------------------------
Search order: 2
Link: https://openai.com/index/new-models-and-developer-products-announced-at-devday/
Snippet: Nov 6, 2023 ... GPT-4 Turbo with 128K context · We released the first version of GPT-4 in March and made GPT-4 generally available to all developers in July.
Summary: OpenAI's recent DevDay revealed several new products and model updates, including the launch of GPT-4 Turbo with a 128K context window, new pricing, and enhanced multimodal capabilities. Key features include the new Assistants API for developing specialized AI applications, improved function calling, and advanced capabilities like text-to-speech and DALL·E 3 integration. Additionally, OpenAI introduced a Copyright Shield for legal protection and Whisper v3 for improved speech recognition. Pricing reductions and rate limit increases were also announced across several models.
--------------------------------------------------------------------------------
Search order: 3
Link: https://openai.com/news/product/
Snippet: Discover the latest product advancements from OpenAI and the ways they're being used by individuals and businesses.
Summary: As of September 2024, OpenAI has launched several significant products, including OpenAI o1, a versatile AI tool, and SearchGPT, a prototype aimed at enhancing AI-driven search capabilities. Earlier, in May 2024, they introduced OpenAI for Education, emphasizing AI's integration into educational settings. Upcoming enhancements to existing products like GPT-4, DALL·E 3, and ChatGPT are also in focus, continuing OpenAI's mission to innovate across various sectors with cutting-edge AI technologies.
--------------------------------------------------------------------------------
Search order: 4
Link: https://openai.com/
Snippet: A new series of AI models designed to spend more time thinking before they respond. Learn more · (opens in a new window) ...
Summary: OpenAI has recently launched several innovative products, including the OpenAI o1 and o1-mini models which focus on enhanced reasoning capabilities. The partnership with Apple aims to integrate ChatGPT into Apple’s user experience. OpenAI also debuted "Sora," a video generation tool from text prompts, and made significant upgrades to the ChatGPT Enterprise with new compliance tools. The introduction of structured outputs in the API and enhanced data analysis features are also notable advancements, further expanding the utility of AI in various domains.
--------------------------------------------------------------------------------
Search order: 5
Link: https://openai.com/index/sora/
Snippet: Feb 15, 2024 ... We plan to include C2PA metadata(opens in a new window) in the future if we deploy the model in an OpenAI product. In addition to us developing ...
Summary: OpenAI has launched Sora, an innovative AI model capable of generating high-quality text-to-video content. Sora can create videos up to one minute long, simulating complex scenes with motion and character interactions based on user prompts. The model uses advanced diffusion techniques, akin to its predecessors in the GPT and DALL·E families, enabling it to understand and animate real-world physics and nuances. OpenAI is working with external artists and domain experts to ensure safety and accuracy, while gathering feedback for future enhancements before wider release.
--------------------------------------------------------------------------------
Search order: 6
Link: https://openai.com/o1/
Snippet: We've developed a new series of AI models designed to spend more time thinking before they respond. Here is the latest news on o1 research, product and ...
Summary: OpenAI has introduced the o1 series, a new set of AI models aimed at improving response deliberation. This innovation allows models to "think" more before generating replies. The o1 models can be accessed via ChatGPT Plus and through APIs. Other recent advancements include updates to GPT-4, GPT-4o mini, and DALL·E 3. OpenAI continues to focus on enhancing product offerings for individual, team, and enterprise use, reflecting its commitment to research and safety in AI technologies.
--------------------------------------------------------------------------------
Search order: 7
Link: https://openai.com/index/introducing-gpts/
Snippet: Nov 6, 2023 ... We plan to offer GPTs to more users soon. Learn more about our OpenAI DevDay announcements for new models and developer products.
Summary: On November 6, 2023, OpenAI launched "GPTs," allowing users to create customized versions of ChatGPT tailored to specific tasks without needing coding skills. These custom GPTs can assist in various activities, from learning games to workplace tasks. The upcoming GPT Store will feature creations from users, making them searchable and shareable. Enterprise users can develop internal-only versions, enhancing workplace productivity. Additionally, ChatGPT Plus users benefit from an improved interface that consolidates features like DALL·E and data analysis.
--------------------------------------------------------------------------------
Search order: 8
Link: https://openai.com/api/
Snippet: The most powerful platform for building AI products ... Build and scale AI experiences powered by industry-leading models and tools. Start building (opens in a ...
Summary: OpenAI has launched several notable products, including GPT-4o and GPT-4o mini, designed for complex and lightweight tasks respectively, both featuring a 128k context length. New models like OpenAI o1-preview and o1-mini enhance reasoning capabilities. The API platform offers various tools for building AI applications, including Chat Completions, Assistants, and Batch APIs. Enhanced customization options include Fine-tuning and a Custom Model Program. OpenAI's enterprise features emphasize security, compliance, and dedicated support, facilitating widespread innovative applications across sectors.
--------------------------------------------------------------------------------`
```
We retrieved the most recent results. (Note these will vary depending on when you execute this script.)
#### Step 3: Pass the information to the model to generate a RAG Response to the User Query
With the search data organized in a JSON data structure, we will pass this information to the LLM with the original user query to generate the final response. Now, the LLM response includes information beyond its original knowledge cutoff, providing current insights.
```
`import json
final\_prompt = (
f"The user will provide a dictionary of search results in JSON format for search query {search\_term} Based on on the search results provided by the user, provide a detailed response to this query: \*\*'{search\_query}'\*\*. Make sure to cite all the sources at the end of your answer."
)
response = client.chat.completions.create(
model="gpt-4o",
messages=[
{"role": "system", "content": final\_prompt},
{"role": "user", "content": json.dumps(results)}],
temperature=0
)
summary = response.choices[0].message.content
print(summary)`
```
```
`Based on the search results provided, here is a chronological list of the latest OpenAI product launches from the past two years, ordered from the most recent to the oldest:
1. \*\*September 12, 2024\*\*: \*\*OpenAI o1\*\*
- A versatile AI tool designed to enhance reasoning capabilities.
- Source: [OpenAI News](https://openai.com/news/)
2. \*\*July 25, 2024\*\*: \*\*SearchGPT\*\*
- A prototype aimed at enhancing AI-driven search capabilities.
- Source: [OpenAI News](https://openai.com/news/)
3. \*\*July 18, 2024\*\*: \*\*GPT-4o mini\*\*
- A cost-efficient intelligence model.
- Source: [OpenAI News](https://openai.com/news/)
4. \*\*May 2024\*\*: \*\*OpenAI for Education\*\*
- Focuses on integrating AI into educational settings.
- Source: [OpenAI News](https://openai.com/news/product/)
5. \*\*February 15, 2024\*\*: \*\*Sora\*\*
- An AI model capable of generating high-quality text-to-video content.
- Source: [OpenAI Sora](https://openai.com/index/sora/)
6. \*\*November 6, 2023\*\*: \*\*GPT-4 Turbo\*\*
- Features a 128K context window and enhanced multimodal capabilities.
- Source: [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
7. \*\*November 6, 2023\*\*: \*\*GPTs\*\*
- Allows users to create customized versions of ChatGPT tailored to specific tasks.
- Source: [OpenAI DevDay](https://openai.com/index/introducing-gpts/)
8. \*\*March 2023\*\*: \*\*GPT-4\*\*
- The first version of GPT-4 was released.
- Source: [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
9. \*\*July 2023\*\*: \*\*GPT-4 General Availability\*\*
- GPT-4 was made generally available to all developers.
- Source: [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
10. \*\*2023\*\*: \*\*Whisper v3\*\*
- An improved speech recognition model.
- Source: [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
11. \*\*2023\*\*: \*\*DALL·E 3 Integration\*\*
- Enhanced capabilities for generating images from text prompts.
- Source: [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
12. \*\*2023\*\*: \*\*Assistants API\*\*
- For developing specialized AI applications.
- Source: [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
13. \*\*2023\*\*: \*\*Copyright Shield\*\*
- Legal protection for AI-generated content.
- Source: [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
14. \*\*2023\*\*: \*\*OpenAI for Nonprofits\*\*
- Support for various sectors through AI.
- Source: [OpenAI News](https://openai.com/news/)
15. \*\*2023\*\*: \*\*ChatGPT Edu\*\*
- Aimed at educational support.
- Source: [OpenAI News](https://openai.com/news/)
16. \*\*2023\*\*: \*\*ChatGPT Enterprise\*\*
- New compliance tools and enhanced data analysis features.
- Source: [OpenAI](https://openai.com/)
17. \*\*2023\*\*: \*\*OpenAI o1-mini\*\*
- A lightweight version of the OpenAI o1 model.
- Source: [OpenAI](https://openai.com/)
18. \*\*2023\*\*: \*\*OpenAI o1-preview\*\*
- An early version of the OpenAI o1 model.
- Source: [OpenAI](https://openai.com/api/)
19. \*\*2023\*\*: \*\*Custom Model Program\*\*
- Enhanced customization options for AI models.
- Source: [OpenAI](https://openai.com/api/)
20. \*\*2023\*\*: \*\*Fine-tuning API Enhancements\*\*
- Improvements to the fine-tuning API.
- Source: [OpenAI News](https://openai.com/news/)
### Sources:
- [OpenAI News](https://openai.com/news/)
- [OpenAI DevDay](https://openai.com/index/new-models-and-developer-products-announced-at-devday/)
- [OpenAI Sora](https://openai.com/index/sora/)
- [OpenAI API](https://openai.com/api/)
- [OpenAI](https://openai.com/)`
```
### Conclusion
Large Language Models (LLMs) have a knowledge cutoff and may not be aware of recent events. To provide them with the latest information, you can build a Bring Your Own Browser (BYOB) tool using Python. This tool retrieves current web data and feeds it to the LLM, enabling up-to-date responses.
The process involves three main steps:
**#1 Set Up a Search Engine:** Use a public search API, like Google’s Custom Search API, to perform web searches and obtain a list of relevant search results.
**#2 Build a Search Dictionary:** Collect the title, URL, and a summary of each web page from the search results to create a structured dictionary of information.
**#3. Generate a RAG Response:** Implement Retrieval-Augmented Generation (RAG) by passing the gathered information to the LLM, which then generates a final response to the user’s query.
By following these steps, you enhance the LLMs ability to provide up-to-date answers in your application that include the most recent developments, such as the latest product launches by OpenAI.