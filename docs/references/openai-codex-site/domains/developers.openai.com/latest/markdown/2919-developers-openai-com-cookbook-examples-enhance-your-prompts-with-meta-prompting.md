Enhance your prompts with meta prompting
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
Oct 23, 2024
# Enhance your prompts with meta prompting
[ TM ](https://www.linkedin.com/in/teodora-musatoiu/)
[ Teodora Musatoiu
(OpenAI)
](https://www.linkedin.com/in/teodora-musatoiu/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Enhance_your_prompts_with_meta_prompting.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Enhance_your_prompts_with_meta_prompting.ipynb)
Welcome to our cookbook on meta prompting! In this guide, we’ll explore how to take a basic prompt and refine it to enhance the quality of outputs from a language model. We’ll use the example of summarizing news reports to illustrate the process.
Meta-prompting is a technique where you use an LLM to generate or improve prompts. Typically this is done using a higher intelligence model that optimizes prompts for a model with less intelligence. It’s a process of using prompts to guide, structure, and optimize other prompts, helping ensure they’re more effective in guiding the LLM towards high-quality, relevant outputs. We’ll be leveraging the capabilities of `o1-preview`, a more intelligent model with advanced reasoning skills, to improve a prompt for `gpt-4o`.
We’re committed to making your development journey with LLMs smoother and more accessible through this technique. Don’t forget to check out our [Generate Anything](https://platform.openai.com/docs/guides/prompt-generation) feature in the playground — it’s a fantastic starting point to dive into meta prompting.
In this example, we’ll begin with a simple prompt for summarizing news articles and then enhance it to see how the outputs improve. We’ll use `o1-preview` to analyze and refine our prompt, adding more detail and clarity along the way. Finally, we’ll evaluate the outputs systematically to understand the impact of our refinements.
```
`import pandas as pd
import openai
from concurrent.futures import ThreadPoolExecutor, as\_completed
from tqdm import tqdm
from pydantic import BaseModel
from datasets import load\_dataset
client = openai.Client()`
```
```
`/Library/Frameworks/Python.framework/Versions/3.12/lib/python3.12/site-packages/tqdm/auto.py:21: TqdmWarning: IProgress not found. Please update jupyter and ipywidgets. See https://ipywidgets.readthedocs.io/en/stable/user\_install.html
from .autonotebook import tqdm as notebook\_tqdm`
```
## Importing the Data
Let’s kick things off by importing the `bbc\_news\_alltime` dataset from [HuggingFace](https://huggingface.co/datasets/RealTimeData/bbc_news_alltime). This dataset contains all BBC News articles, capturing everything published monthly from 2017 up to the latest complete month. For our experiment, we’ll focus exclusively on a sample from a recent month—August 2024—to keep things current and manageable.
```
`ds = load\_dataset("RealTimeData/bbc\_news\_alltime", "2024-08")
df = pd.DataFrame(ds['train']).sample(n=100, random\_state=1)
df.head()`
```
||title|published\_date|authors|description|section|content|link|top\_image|
|2662|Laura Whitmore: I was gaslighted after raising...|2024-08-04|https://www.facebook.com/bbcnews|The former Love Island host said that things s...|Culture|Television presenter Laura Whitmore has said t...|http://www.bbc.co.uk/news/articles/c9wvwvzm7x7o|https://ichef.bbci.co.uk/ace/standard/2560/cps...|
|1865|Errollyn Wallen appointed as Master of the Kin...|2024-08-25|https://www.facebook.com/bbcnews|She is best known for her work on the 2012 Par...|Culture|Celebrated composer and singer-songwriter Erro...|http://www.bbc.co.uk/news/articles/c4gl758g7zgo|https://ichef.bbci.co.uk/ace/standard/2560/cps...|
|2554|SDLP: Matthew O'Toole endorses Claire Hanna fo...|2024-08-30|https://www.facebook.com/bbcnews|Matthew O'Toole had been named by some as a po...|Northern Ireland Politics|Matthew O'Toole leads his party's official opp...|http://www.bbc.co.uk/news/articles/cvg41j7xrzdo|https://ichef.bbci.co.uk/ace/standard/3840/cps...|
|1338|Rotherham rioters among those jailed - BBC News|2024-08-20|https://www.facebook.com/bbcnews|Two men who were part of a mob targeting a Hol...|South Yorkshire|Rotherham pair among those jailed for UK rioti...|http://www.bbc.co.uk/news/articles/cwywggd7qw6o|https://ichef.bbci.co.uk/ace/standard/2560/cps...|
|1232|BBC News - BBC iPlayer|2024-08-02|None|None|None|JavaScript seems to be disabled. Please enable...|http://www.bbc.co.uk/news/10318089||
## Iterating on Prompts
Let’s start with a straightforward prompt and then use `o1-preview` to enhance it for better results. We want to summarize news articles, so this is what i’ll ask the model to do.
```
`simple\_prompt = "Summarize this news article: {article}"`
```
To improve the prompt, we need to provide `o1-preview` with the context and goals we want to achieve. We can then ask it to generate a more detailed prompt that would produce richer and more comprehensive news summaries.
```
`meta\_prompt = """
Improve the following prompt to generate a more detailed summary.
Adhere to prompt engineering best practices.
Make sure the structure is clear and intuitive and contains the type of news, tags and sentiment analysis.
{simple\_prompt}
Only return the prompt.
"""`
```
```
`def get\_model\_response(messages, model="o1-preview"):
response = client.chat.completions.create(
messages=messages,
model=model,
)
return response.choices[0].message.content
complex\_prompt = get\_model\_response([{"role": "user", "content": meta\_prompt.format(simple\_prompt=simple\_prompt)}])
complex\_prompt`
```
```
`'Please read the following news article and provide a comprehensive summary that includes:\\n\\n1. \*\*Type of News\*\*: Specify the category of the news article (e.g., Politics, Technology, Health, Sports, etc.).\\n2. \*\*Summary\*\*: Write a concise and clear summary of the main points, ensuring the structure is logical and intuitive.\\n3. \*\*Tags\*\*: List relevant keywords or tags associated with the article.\\n4. \*\*Sentiment Analysis\*\*: Analyze the overall sentiment of the article (positive, negative, or neutral) and briefly explain your reasoning.\\n\\n\*\*Article:\*\*\\n\\n{article}'`
```
## Generating the Summaries
Now that we have both prompts, let’s generate the summaries! For each entry in our dataset, we’ll use both the simple and the enhanced prompts to see how they compare. By doing this, we’ll get a firsthand look at how our refinements with `o1-preview` can lead to richer and more detailed summaries. Let’s dive in and see the difference for ourselves!
```
`def generate\_response(prompt):
messages = [{"role": "user", "content": prompt}]
response = get\_model\_response(messages, model="gpt-4o-mini")
return response
def generate\_summaries(row):
simple\_itinerary = generate\_response(simple\_prompt.format(article=row["content"]))
complex\_itinerary = generate\_response(complex\_prompt + row["content"])
return simple\_itinerary, complex\_itinerary`
```
Let’s check if everything looks good and if we can generate a summary for the first news report.
```
`generate\_summaries(df.iloc[0])`
```
```
`('Television presenter Laura Whitmore has shared that the issues she attempted to address during her time on \*Strictly Come Dancing\* eight years ago are now surfacing, stating that she experienced "gaslighting" that made her concerns seem normalized. In a recent interview, she expressed the difficulties she faced, including being portrayed negatively and feeling "broken" during the competition. Whitmore indicated that she raised concerns about inappropriate behavior and is currently providing evidence for a BBC investigation, although she has not made an official complaint herself. The BBC is facing allegations of mistreatment towards contestants, prompting them to announce new welfare measures, including the presence of a chaperone during rehearsals. Other celebrities participating in the show have also made allegations against professional dancers, leading to growing scrutiny around conditions on the show. The BBC emphasized that it takes complaints very seriously and is committed to updating its support processes.',
'1. \*\*Type of News\*\*: Entertainment\\n\\n2. \*\*Summary\*\*: Laura Whitmore, a television presenter, has spoken out about her experiences on Strictly Come Dancing, revealing that issues she attempted to address during her tenure on the show are now coming to light. In an interview with The Irish Times, she described feeling "gaslit" and suggested that her concerns, which she raised eight years ago, were not taken seriously at the time. Whitmore recalled that her participation left her feeling "broken" and criticized how she was portrayed during the show. She mentioned contributing evidence to an ongoing review involving incidents of alleged inappropriate behavior during her time on the show, although she did not make an official complaint. The BBC, which has been navigating its own controversy related to the treatment of contestants, stated it is taking these claims seriously and plans to enhance welfare measures on the show, including the introduction of a chaperone at rehearsals. Recent allegations from other contestants have further intensified the scrutiny of Strictly Come Dancing.\\n\\n3. \*\*Tags\*\*: Laura Whitmore, Strictly Come Dancing, BBC, allegations, inappropriate behavior, gaslighting, welfare measures, entertainment controversy\\n\\n4. \*\*Sentiment Analysis\*\*: The overall sentiment of the article is negative. It highlights serious allegations of mistreatment and inappropriate behavior associated with a popular television show, along with personal accounts from Whitmore that reflect emotional distress and professional struggles. The tone conveys a sense of urgency and seriousness regarding the issues raised, indicating a critical atmosphere within the entertainment industry related to contestant treatment.')`
```
By comparing the summaries generated from the simple and enhanced prompts, we can already see significant improvements. The initial summary gives us a general overview of the article, whereas the enhanced summary dives deeper — it not only provides a detailed summary but also categorizes the news type, lists relevant tags, and even includes a sentiment analysis.
Let’s test on the entire dataset now!
```
`# Add new columns to the dataframe for storing itineraries
df['simple\_summary'] = None
df['complex\_summary'] = None
# Use ThreadPoolExecutor to generate itineraries concurrently
with ThreadPoolExecutor() as executor:
futures = {executor.submit(generate\_summaries, row): index for index, row in df.iterrows()}
for future in tqdm(as\_completed(futures), total=len(futures), desc="Generating Itineraries"):
index = futures[future]
simple\_itinerary, complex\_itinerary = future.result()
df.at[index, 'simple\_summary'] = simple\_itinerary
df.at[index, 'complex\_summary'] = complex\_itinerary
df.head()`
```
```
`Generating Itineraries: 100%|██████████| 100/100 [00:50\<00:00, 1.98it/s]`
```
||title|published\_date|authors|description|section|content|link|top\_image|simple\_summary|complex\_summary|
|2662|Laura Whitmore: I was gaslighted after raising...|2024-08-04|https://www.facebook.com/bbcnews|The former Love Island host said that things s...|Culture|Television presenter Laura Whitmore has said t...|http://www.bbc.co.uk/news/articles/c9wvwvzm7x7o|https://ichef.bbci.co.uk/ace/standard/2560/cps...|Television presenter Laura Whitmore has spoken...|1. \*\*Type of News\*\*: Entertainment/Television\\...|
|1865|Errollyn Wallen appointed as Master of the Kin...|2024-08-25|https://www.facebook.com/bbcnews|She is best known for her work on the 2012 Par...|Culture|Celebrated composer and singer-songwriter Erro...|http://www.bbc.co.uk/news/articles/c4gl758g7zgo|https://ichef.bbci.co.uk/ace/standard/2560/cps...|Errollyn Wallen has been appointed Master of t...|1. \*\*Type of News\*\*: Arts/Music\\n\\n2. \*\*Summar...|
|2554|SDLP: Matthew O'Toole endorses Claire Hanna fo...|2024-08-30|https://www.facebook.com/bbcnews|Matthew O'Toole had been named by some as a po...|Northern Ireland Politics|Matthew O'Toole leads his party's official opp...|http://www.bbc.co.uk/news/articles/cvg41j7xrzdo|https://ichef.bbci.co.uk/ace/standard/3840/cps...|Matthew O'Toole, the leader of the official op...|1. \*\*Type of News\*\*: Politics\\n\\n2. \*\*Summary\*...|
|1338|Rotherham rioters among those jailed - BBC News|2024-08-20|https://www.facebook.com/bbcnews|Two men who were part of a mob targeting a Hol...|South Yorkshire|Rotherham pair among those jailed for UK rioti...|http://www.bbc.co.uk/news/articles/cwywggd7qw6o|https://ichef.bbci.co.uk/ace/standard/2560/cps...|Two men, Nathan Palmer (29) and Niven Matthewm...|1. \*\*Type of News\*\*: Politics / Crime and Just...|
|1232|BBC News - BBC iPlayer|2024-08-02|None|None|None|JavaScript seems to be disabled. Please enable...|http://www.bbc.co.uk/news/10318089||The article discusses the need to enable JavaS...|I cannot provide a summary of the article as t...|
## Evaluating the Results
To assess the difference in performance between the two prompts, we’ll use a structured evaluation approach with the LLM acting as a judge. This means we’ll leverage the language model itself to evaluate and compare the outputs based on specific criteria.
**What Does “LLM as a Judge” Mean?**
Using an LLM as a judge involves having the language model evaluate its own outputs or those of another model. It applies predefined criteria to assess aspects like accuracy, clarity, and relevance. This approach helps us obtain an objective and consistent evaluation without human bias, making it easier to identify improvements between different prompts. Our cookbook on [Getting Started with OpenAI Evals](https://cookbook.openai.com/examples/evaluation/getting_started_with_openai_evals) offers a glimps on how you can get started with this approach.
Here’s the prompt we’ll use for evaluation:
```
`evaluation\_prompt = """
You are an expert editor tasked with evaluating the quality of a news article summary. Below is the original article and the summary to be evaluated:
\*\*Original Article\*\*:
{original\_article}
\*\*Summary\*\*:
{summary}
Please evaluate the summary based on the following criteria, using a scale of 1 to 5 (1 being the lowest and 5 being the highest). Be critical in your evaluation and only give high scores for exceptional summaries:
1. \*\*Categorization and Context\*\*: Does the summary clearly identify the type or category of news (e.g., Politics, Technology, Sports) and provide appropriate context?
2. \*\*Keyword and Tag Extraction\*\*: Does the summary include relevant keywords or tags that accurately capture the main topics and themes of the article?
3. \*\*Sentiment Analysis\*\*: Does the summary accurately identify the overall sentiment of the article and provide a clear, well-supported explanation for this sentiment?
4. \*\*Clarity and Structure\*\*: Is the summary clear, well-organized, and structured in a way that makes it easy to understand the main points?
5. \*\*Detail and Completeness\*\*: Does the summary provide a detailed account that includes all necessary components (type of news, tags, sentiment) comprehensively?
Provide your scores and justifications for each criterion, ensuring a rigorous and detailed evaluation.
"""
class ScoreCard(BaseModel):
justification: str
categorization: int
keyword\_extraction: int
sentiment\_analysis: int
clarity\_structure: int
detail\_completeness: int`
```
Here’s a pro tip — you can actually use meta prompting to refine your evaluation prompt as well! By applying the same iterative enhancement to the prompt that instructs the LLM to act as a judge, you can make your evaluations even more precise and insightful.
Let’s use this prompt to evaluate our summaries!
```
`def evaluate\_summaries(row):
simple\_messages = [{"role": "user", "content": evaluation\_prompt.format(original\_article=row["content"], summary=row['simple\_summary'])}]
complex\_messages = [{"role": "user", "content": evaluation\_prompt.format(original\_article=row["content"], summary=row['complex\_summary'])}]
simple\_summary = client.beta.chat.completions.parse(
model="gpt-4o",
messages=simple\_messages,
response\_format=ScoreCard)
simple\_summary = simple\_summary.choices[0].message.parsed
complex\_summary = client.beta.chat.completions.parse(
model="gpt-4o",
messages=complex\_messages,
response\_format=ScoreCard)
complex\_summary = complex\_summary.choices[0].message.parsed
return simple\_summary, complex\_summary
# Add new columns to the dataframe for storing evaluations
df['simple\_evaluation'] = None
df['complex\_evaluation'] = None
# Use ThreadPoolExecutor to evaluate itineraries concurrently
with ThreadPoolExecutor() as executor:
futures = {executor.submit(evaluate\_summaries, row): index for index, row in df.iterrows()}
for future in tqdm(as\_completed(futures), total=len(futures), desc="Evaluating Summaries"):
index = futures[future]
simple\_evaluation, complex\_evaluation = future.result()
df.at[index, 'simple\_evaluation'] = simple\_evaluation
df.at[index, 'complex\_evaluation'] = complex\_evaluation
df.head()`
```
```
`Evaluating Summaries: 100%|██████████| 100/100 [01:42\<00:00, 1.02s/it]`
```
||title|published\_date|authors|description|section|content|link|top\_image|simple\_summary|complex\_summary|simple\_evaluation|complex\_evaluation|
|2662|Laura Whitmore: I was gaslighted after raising...|2024-08-04|https://www.facebook.com/bbcnews|The former Love Island host said that things s...|Culture|Television presenter Laura Whitmore has said t...|http://www.bbc.co.uk/news/articles/c9wvwvzm7x7o|https://ichef.bbci.co.uk/ace/standard/2560/cps...|Television presenter Laura Whitmore has spoken...|1. \*\*Type of News\*\*: Entertainment/Television\\...|categorization=4 keyword\_extraction=3 sentimen...|categorization=5 keyword\_extraction=5 sentimen...|
|1865|Errollyn Wallen appointed as Master of the Kin...|2024-08-25|https://www.facebook.com/bbcnews|She is best known for her work on the 2012 Par...|Culture|Celebrated composer and singer-songwriter Erro...|http://www.bbc.co.uk/news/articles/c4gl758g7zgo|https://ichef.bbci.co.uk/ace/standard/2560/cps...|Errollyn Wallen has been appointed Master of t...|1. \*\*Type of News\*\*: Arts/Music\\n\\n2. \*\*Summar...|categorization=4 keyword\_extraction=4 sentimen...|categorization=5 keyword\_extraction=5 sentimen...|
|2554|SDLP: Matthew O'Toole endorses Claire Hanna fo...|2024-08-30|https://www.facebook.com/bbcnews|Matthew O'Toole had been named by some as a po...|Northern Ireland Politics|Matthew O'Toole leads his party's official opp...|http://www.bbc.co.uk/news/articles/cvg41j7xrzdo|https://ichef.bbci.co.uk/ace/standard/3840/cps...|Matthew O'Toole, the leader of the official op...|1. \*\*Type of News\*\*: Politics\\n\\n2. \*\*Summary\*...|categorization=5 keyword\_extraction=4 sentimen...|categorization=5 keyword\_extraction=5 sentimen...|
|1338|Rotherham rioters among those jailed - BBC News|2024-08-20|https://www.facebook.com/bbcnews|Two men who were part of a mob targeting a Hol...|South Yorkshire|Rotherham pair among those jailed for UK rioti...|http://www.bbc.co.uk/news/articles/cwywggd7qw6o|https://ichef.bbci.co.uk/ace/standard/2560/cps...|Two men, Nathan Palmer (29) and Niven Matthewm...|1. \*\*Type of News\*\*: Politics / Crime and Just...|categorization=3 keyword\_extraction=3 sentimen...|categorization=5 keyword\_extraction=4 sentimen...|
|1232|BBC News - BBC iPlayer|2024-08-02|None|None|None|JavaScript seems to be disabled. Please enable...|http://www.bbc.co.uk/news/10318089||The article discusses the need to enable JavaS...|I cannot provide a summary of the article as t...|categorization=2 keyword\_extraction=3 sentimen...|categorization=1 keyword\_extraction=1 sentimen...|
```
`import matplotlib.pyplot as plt
df["simple\_scores"] = df["simple\_evaluation"].apply(lambda x: [score for key, score in x.model\_dump().items() if key != 'justification'])
df["complex\_scores"] = df["complex\_evaluation"].apply(lambda x: [score for key, score in x.model\_dump().items() if key != 'justification'])
# Calculate average scores for each criterion
criteria = [
'Categorisation',
'Keywords and Tags',
'Sentiment Analysis',
'Clarity and Structure',
'Detail and Completeness'
]
# Calculate average scores for each criterion by model
simple\_avg\_scores = df['simple\_scores'].apply(pd.Series).mean()
complex\_avg\_scores = df['complex\_scores'].apply(pd.Series).mean()
# Prepare data for plotting
avg\_scores\_df = pd.DataFrame({
'Criteria': criteria,
'Original Prompt': simple\_avg\_scores,
'Improved Prompt': complex\_avg\_scores
})
# Plotting
ax = avg\_scores\_df.plot(x='Criteria', kind='bar', figsize=(6, 4))
plt.ylabel('Average Score')
plt.title('Comparison of Simple vs Complex Prompt Performance by Model')
plt.xticks(rotation=45, ha='right')
plt.tight\_layout()
plt.legend(loc='upper left', bbox\_to\_anchor=(1, 1))
plt.show()`
```
After evaluating the results, we found that while the basic prompt performed well in clarity and structure, the enhanced prompt significantly improved outputs across several other key criteria: Categorization, Keywords and Tags, Sentiment Analysis, and Detail and Completeness. The complex prompt led to summaries that were more informative, better organized, and richer in content.
This demonstrates how refining prompts can greatly enhance the quality of the generated summaries. Although this is a simplified example, the benefits of prompt optimization are expected to be even more pronounced in real-world, production-level applications, leading to outputs that are more aligned with specific goals and user needs.
## Conclusion
Meta prompting is a powerful technique that can significantly enhance the quality of outputs from language models. Our exploration showed that starting with a simple prompt and refining it using `o1-preview` led to summaries that were more informative, better organized, and richer in content—improving across key criteria like categorization, keywords and tags, sentiment analysis, and completeness. This exercise underscores the value of prompt optimization, and even in this simplified example, the benefits are clear. In real-world applications, leveraging meta prompting and tools like `o1-preview` can elevate language model performance to better meet your specific goals and user needs.