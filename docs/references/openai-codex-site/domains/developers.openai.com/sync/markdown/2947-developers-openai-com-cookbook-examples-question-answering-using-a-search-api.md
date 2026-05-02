Question answering using a search API and re-ranking
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
Jun 16, 2023
# Question answering using a search API and re-ranking
[ SF ](https://twitter.com/simonpfish)[ TS ](https://github.com/ted-at-openai)
[ Simón Fishman
(OpenAI)
, ](https://twitter.com/simonpfish)[ Ted Sanders
(OpenAI)
](https://github.com/ted-at-openai)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_a_search_API.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Question_answering_using_a_search_API.ipynb)
Searching for relevant information can sometimes feel like looking for a needle in a haystack, but don’t despair, GPTs can actually do a lot of this work for us. In this guide we explore a way to augment existing search systems with various AI techniques, helping us sift through the noise.
Two ways of retrieving information for GPT are:
1. **Mimicking Human Browsing:** [GPT triggers a search](https://openai.com/blog/chatgpt-plugins#browsing), evaluates the results, and modifies the search query if necessary. It can also follow up on specific search results to form a chain of thought, much like a human user would do.
2. **Retrieval with Embeddings:** Calculate [embeddings](https://platform.openai.com/docs/guides/embeddings) for your content and a user query, and then [retrieve the content](Question_answering_using_embeddings.ipynb) most related as measured by cosine similarity. This technique is [used heavily](https://blog.google/products/search/search-language-understanding-bert/) by search engines like Google.
These approaches are both promising, but each has their shortcomings: the first one can be slow due to its iterative nature and the second one requires embedding your entire knowledge base in advance, continuously embedding new content and maintaining a vector database.
By combining these approaches, and drawing inspiration from [re-ranking](https://www.sbert.net/examples/applications/retrieve_rerank/README.html) methods, we identify an approach that sits in the middle. **This approach can be implemented on top of any existing search system, like the Slack search API, or an internal ElasticSearch instance with private data**. Here’s how it works:
**Step 1: Search**
1. User asks a question.
2. GPT generates a list of potential queries.
3. Search queries are executed in parallel.
**Step 2: Re-rank**
1. Embeddings for each result are used to calculate semantic similarity to a generated hypothetical ideal answer to the user question.
2. Results are ranked and filtered based on this similarity metric.
**Step 3: Answer**
1. Given the top search results, the model generates an answer to the user’s question, including references and links.
This hybrid approach offers relatively low latency and can be integrated into any existing search endpoint, without requiring the upkeep of a vector database. Let’s dive into it! We will use the [News API](https://newsapi.org/) as an example domain to search over.
## Setup
In addition to your `OPENAI\_API\_KEY`, you’ll have to include a `NEWS\_API\_KEY` in your environment. You can get an API key [here](https://newsapi.org/).
```
`%%capture
%env NEWS\_API\_KEY = YOUR\_NEWS\_API\_KEY`
```
```
`# Dependencies
from datetime import date, timedelta # date handling for fetching recent news
from IPython import display # for pretty printing
import json # for parsing the JSON api responses and model outputs
from numpy import dot # for cosine similarity
from openai import OpenAI
import os # for loading environment variables
import requests # for making the API requests
from tqdm.notebook import tqdm # for printing progress bars
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
# Load environment variables
news\_api\_key = os.getenv("NEWS\_API\_KEY")
GPT\_MODEL = "gpt-3.5-turbo"
# Helper functions
def json\_gpt(input: str):
completion = client.chat.completions.create(model=GPT\_MODEL,
messages=[
{"role": "system", "content": "Output only valid JSON"},
{"role": "user", "content": input},
],
temperature=0.5)
text = completion.choices[0].message.content
parsed = json.loads(text)
return parsed
def embeddings(input: list[str]) -\> list[list[str]]:
response = client.embeddings.create(model="text-embedding-3-small", input=input)
return [data.embedding for data in response.data]`
```
## 1. Search
It all starts with a user question.
```
`# User asks a question
USER\_QUESTION = "Who won the NBA championship? And who was the MVP? Tell me a bit about the last game."`
```
Now, in order to be as exhaustive as possible, we use the model to generate a list of diverse queries based on this question.
```
`QUERIES\_INPUT = f"""
You have access to a search API that returns recent news articles.
Generate an array of search queries that are relevant to this question.
Use a variation of related keywords for the queries, trying to be as general as possible.
Include as many queries as you can think of, including and excluding terms.
For example, include queries like ['keyword\_1 keyword\_2', 'keyword\_1', 'keyword\_2'].
Be creative. The more queries you include, the more likely you are to find relevant results.
User question: {USER\_QUESTION}
Format: {{"queries": ["query\_1", "query\_2", "query\_3"]}}
"""
queries = json\_gpt(QUERIES\_INPUT)["queries"]
# Let's include the original question as well for good measure
queries.append(USER\_QUESTION)
queries`
```
```
`['NBA championship winner',
'MVP of NBA championship',
'Last game of NBA championship',
'NBA finals winner',
'Most valuable player of NBA championship',
'Finals game of NBA',
'Who won the NBA finals',
'NBA championship game summary',
'NBA finals MVP',
'Champion of NBA playoffs',
'NBA finals last game highlights',
'NBA championship series result',
'NBA finals game score',
'NBA finals game recap',
'NBA champion team and player',
'NBA finals statistics',
'NBA championship final score',
'NBA finals best player',
'NBA playoffs champion and MVP',
'NBA finals game analysis',
'Who won the NBA championship? And who was the MVP? Tell me a bit about the last game.']`
```
The queries look good, so let’s run the searches.
```
`def search\_news(
query: str,
news\_api\_key: str = news\_api\_key,
num\_articles: int = 50,
from\_datetime: str = "2023-06-01", # the 2023 NBA finals were played in June 2023
to\_datetime: str = "2023-06-30",
) -\> dict:
response = requests.get(
"https://newsapi.org/v2/everything",
params={
"q": query,
"apiKey": news\_api\_key,
"pageSize": num\_articles,
"sortBy": "relevancy",
"from": from\_datetime,
"to": to\_datetime,
},
)
return response.json()
articles = []
for query in tqdm(queries):
result = search\_news(query)
if result["status"] == "ok":
articles = articles + result["articles"]
else:
raise Exception(result["message"])
# remove duplicates
articles = list({article["url"]: article for article in articles}.values())
print("Total number of articles:", len(articles))
print("Top 5 articles of query 1:", "\\n")
for article in articles[0:5]:
print("Title:", article["title"])
print("Description:", article["description"])
print("Content:", article["content"][0:100] + "...")
print()`
```
```
` 0%| | 0/21 [00:00\<?, ?it/s]`
```
```
`Total number of articles: 554
Top 5 articles of query 1:
Title: Nascar takes on Le Mans as LeBron James gets centenary race under way
Description: \<ul\>\<li\>Nascar has presence at iconic race for first time since 1976\</li\>\<li\>NBA superstar LeBron James waves flag as honorary starter\</li\>\</ul\>The crowd chanted “U-S-A! U-S-A!” as Nascar driver lineup for the 24 Hours of Le Mans passed through the city cente…
Content: The crowd chanted U-S-A! U-S-A! as Nascar driver lineup for the 24 Hours of Le Mans passed through t...
Title: NBA finals predictions: Nuggets or Heat? Our writers share their picks
Description: Denver or Miami? Our contributors pick the winner, key players and dark horses before the NBA’s grand finale tips offA lot has been made of the importance of a balanced roster with continuity, but, somehow, still not enough. The Nuggets are the prime example …
Content: The Nuggets are here because
A lot has been made of the importance of a balanced roster with conti...
Title: Unboxing: Michelob ULTRA and Artist Futura Enshrine the NBA Championship In Custom Hand-Painted Bottles
Description: As the 2022-2023 NBA Championship nears the end, Michelob ULTRA brings joy to sports fans who will gather to watch the showdown between the Denver Nuggets and Miami Heat. The beermaker teamed up with artist Futura to remix its newly-designed 2023 Champ Bottle…
Content: As the 2022-2023 NBA Championship nears the end, Michelob ULTRA brings joy to sports fans who will g...
Title: Futura and Michelob ULTRA Toast to the NBA Finals With Abstract Artwork Crafted From the Brand’s 2023 Limited-Edition Championship Bottles
Description: The sun is out to play, and so is Michelob ULTRA. With the 2022-2023 NBA Finals underway, the beermaker is back with its celebratory NBA Champ Bottles. This year, the self-proclaimed MVP of joy is dropping a limited-edition bottle made in collaboration with a…
Content: The sun is out to play, and so is Michelob ULTRA. With the 2022-2023 NBA Finals underway, the beerma...
Title: Signed and Delivered, Futura and Michelob ULTRA Will Gift Hand-Painted Bottles to This Year’s NBA Championship Team
Description: Michelob ULTRA, the MVP of joy and official beer sponsor of the NBA is back to celebrate with basketball lovers and sports fans around the globe as the NBA 2022-2023 season comes to a nail-biting close. In collaboration with artist Futura, Michelob ULTRA will…
Content: Michelob ULTRA, the MVP of joy and official beer sponsor of the NBA is back to celebrate with basket...`
```
As we can see, oftentimes, the search queries will return a large number of results, many of which are not relevant to the original question asked by the user. In order to improve the quality of the final answer, we use embeddings to re-rank and filter the results.
## 2. Re-rank
Drawing inspiration from [HyDE (Gao et al.)](https://arxiv.org/abs/2212.10496), we first generate a hypothetical ideal answer to rerank our compare our results against. This helps prioritize results that look like good answers, rather than those similar to our question. Here’s the prompt we use to generate our hypothetical answer.
```
`HA\_INPUT = f"""
Generate a hypothetical answer to the user's question. This answer will be used to rank search results.
Pretend you have all the information you need to answer, but don't use any actual facts. Instead, use placeholders
like NAME did something, or NAME said something at PLACE.
User question: {USER\_QUESTION}
Format: {{"hypotheticalAnswer": "hypothetical answer text"}}
"""
hypothetical\_answer = json\_gpt(HA\_INPUT)["hypotheticalAnswer"]
hypothetical\_answer`
```
```
`'The NBA championship was won by TEAM NAME. The MVP was awarded to PLAYER NAME. The last game was held at STADIUM NAME, where both teams played with great energy and enthusiasm. It was a close game, but in the end, TEAM NAME emerged victorious.'`
```
Now, let’s generate embeddings for the search results and the hypothetical answer. We then calculate the cosine distance between these embeddings, giving us a semantic similarity metric. Note that we can simply calculate the dot product in lieu of doing a full cosine similarity calculation since the OpenAI embeddings are returned normalized in our API.
```
`hypothetical\_answer\_embedding = embeddings(hypothetical\_answer)[0]
article\_embeddings = embeddings(
[
f"{article['title']} {article['description']} {article['content'][0:100]}"
for article in articles
]
)
# Calculate cosine similarity
cosine\_similarities = []
for article\_embedding in article\_embeddings:
cosine\_similarities.append(dot(hypothetical\_answer\_embedding, article\_embedding))
cosine\_similarities[0:10]`
```
```
`[0.7854456526852069,
0.8086023500072106,
0.8002998147018501,
0.7961229569526956,
0.798354506673743,
0.758216458795653,
0.7753754083127359,
0.7494958338411927,
0.804733946801739,
0.8405965885235218]`
```
Finally, we use these similarity scores to sort and filter the results.
```
`scored\_articles = zip(articles, cosine\_similarities)
# Sort articles by cosine similarity
sorted\_articles = sorted(scored\_articles, key=lambda x: x[1], reverse=True)
# Print top 5 articles
print("Top 5 articles:", "\\n")
for article, score in sorted\_articles[0:5]:
print("Title:", article["title"])
print("Description:", article["description"])
print("Content:", article["content"][0:100] + "...")
print("Score:", score)
print()`
```
```
`Top 5 articles:
Title: NBA Finals: Denver Nuggets beat Miami Hea, lift thier first-ever NBA title
Description: Denver Nuggets won their maiden NBA Championship trophy defeating Miami Heat 94-89 in Game 5 of the NBA Final held on Tuesday at the Ball Arena in Denver
Content: Denver Nuggets won their maiden NBA Championship trophy defeating Miami Heat 94-89 in Game 5 of the ...
Score: 0.8445817523602124
Title: Photos: Denver Nuggets celebrate their first NBA title
Description: The Nuggets capped off an impressive postseason by beating the Miami Heat in the NBA Finals.
Content: Thousands of supporters watched along the streets of Denver, Colorado as the US National Basketball ...
Score: 0.842070667753606
Title: Denver Nuggets win first NBA championship title in Game 5 victory over Miami Heat
Description: The Denver Nuggets won their first NBA championship Monday night, downing the Miami Heat 94-89 at Ball Arena in Denver to take Game 5 of the NBA Finals.
Content: The Denver Nuggets won their first NBA championship Monday night, downing the Miami Heat 94-89 at Ba...
Score: 0.8409346078172385
Title: Denver Nuggets Capture Their First NBA Championship Behind Unbreakable Chemistry
Description: After 47 years of waiting, the Denver Nuggets are NBA champions. Led by Nikola Jokic and Jamal Murray, they reached the mountain top by staying true to themselves.
Content: DENVER, CO - JUNE 12: Jamal Murray (27) of the Denver Nuggets celebrates as he leaves the court ... ...
Score: 0.8405965885235218
Title: NBA Finals: Nikola Jokic, Denver Nuggets survive Miami Heat to secure franchise's first NBA championship
Description: In a rock-fight of a Game 5, the Denver Nuggets reached the NBA mountaintop from the foothills of the Rockies, winning their first-ever championship and setting Nikola Jokic's legacy as an all-timer in stone.
Content: DENVER, COLORADO - JUNE 12: Jamal Murray #27 of the Denver Nuggets reacts during the fourth quarter ...
Score: 0.8389716330890262`
```
Awesome! These results look a lot more relevant to our original query. Now, let’s use the top 5 results to generate a final answer.
## 3. Answer
```
`formatted\_top\_results = [
{
"title": article["title"],
"description": article["description"],
"url": article["url"],
}
for article, \_score in sorted\_articles[0:5]
]
ANSWER\_INPUT = f"""
Generate an answer to the user's question based on the given search results.
TOP\_RESULTS: {formatted\_top\_results}
USER\_QUESTION: {USER\_QUESTION}
Include as much information as possible in the answer. Reference the relevant search result urls as markdown links.
"""
completion = client.chat.completions.create(
model=GPT\_MODEL,
messages=[{"role": "user", "content": ANSWER\_INPUT}],
temperature=0.5,
stream=True,
)
text = ""
for chunk in completion:
text += chunk.choices[0].delta.content
display.clear\_output(wait=True)
display.display(display.Markdown(text))`
```
The Denver Nuggets won their first-ever NBA championship by defeating the Miami Heat 94-89 in Game 5 of the NBA Finals held on Tuesday at the Ball Arena in Denver, according to this [Business Standard article](https://www.business-standard.com/sports/other-sports-news/nba-finals-denver-nuggets-beat-miami-hea-lift-thier-first-ever-nba-title-123061300285_1.html). Nikola Jokic, the Nuggets’ center, was named the NBA Finals MVP. In a rock-fight of a Game 5, the Nuggets reached the NBA mountaintop, securing their franchise’s first NBA championship and setting Nikola Jokic’s legacy as an all-timer in stone, according to this [Yahoo Sports article](https://sports.yahoo.com/nba-finals-nikola-jokic-denver-nuggets-survive-miami-heat-to-secure-franchises-first-nba-championship-030321214.html). For more information and photos of the Nuggets’ celebration, check out this [Al Jazeera article](https://www.aljazeera.com/gallery/2023/6/15/photos-denver-nuggets-celebrate-their-first-nba-title) and this [CNN article](https://www.cnn.com/2023/06/12/sport/denver-nuggets-nba-championship-spt-intl?cid=external-feeds_iluminar_yahoo).