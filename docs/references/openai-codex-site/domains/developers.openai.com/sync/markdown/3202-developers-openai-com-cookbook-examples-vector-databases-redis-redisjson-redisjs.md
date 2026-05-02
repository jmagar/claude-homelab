Redis vectors as JSON with OpenAI
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
May 10, 2023
# Redis vectors as JSON with OpenAI
[ MY ](<https://github.com/Michael Yuan>)
[ Michael Yuan ](<https://github.com/Michael Yuan>)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/vector_databases/redis/redisjson/redisjson.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/vector_databases/redis/redisjson/redisjson.ipynb)
This notebook expands on the other Redis OpenAI-cookbook examples with examples of how to use JSON with vectors.
[Storing Vectors in JSON](https://redis.io/docs/stack/search/reference/vectors/#storing-vectors-in-json)
## Prerequisites
* Redis instance with the Redis Search and Redis JSON modules
* Redis-py client lib
* OpenAI API key
## Installation
Install Python modules necessary for the examples.
```
`! pip install redis openai python-dotenv openai[datalib]`
```
## OpenAI API Key
Create a .env file and add your OpenAI key to it
```
`OPENAI\_API\_KEY=your\_key`
```
## Create Text Vectors
Create embeddings (array of floats) of the news excerpts below.
```
`import openai
import os
from dotenv import load\_dotenv
load\_dotenv()
openai.api\_key = os.getenv("OPENAI\_API\_KEY")
def get\_vector(text, model="text-embedding-3-small"):
text = text.replace("\\n", " ")
return openai.Embedding.create(input = [text], model = model)['data'][0]['embedding']
text\_1 = """Japan narrowly escapes recession
Japan's economy teetered on the brink of a technical recession in the three months to September, figures show.
Revised figures indicated growth of just 0.1% - and a similar-sized contraction in the previous quarter. On an annual basis, the data suggests annual growth of just 0.2%, suggesting a much more hesitant recovery than had previously been thought. A common technical definition of a recession is two successive quarters of negative growth.
The government was keen to play down the worrying implications of the data. "I maintain the view that Japan's economy remains in a minor adjustment phase in an upward climb, and we will monitor developments carefully," said economy minister Heizo Takenaka. But in the face of the strengthening yen making exports less competitive and indications of weakening economic conditions ahead, observers were less sanguine. "It's painting a picture of a recovery... much patchier than previously thought," said Paul Sheard, economist at Lehman Brothers in Tokyo. Improvements in the job market apparently have yet to feed through to domestic demand, with private consumption up just 0.2% in the third quarter.
"""
text\_2 = """Dibaba breaks 5,000m world record
Ethiopia's Tirunesh Dibaba set a new world record in winning the women's 5,000m at the Boston Indoor Games.
Dibaba won in 14 minutes 32.93 seconds to erase the previous world indoor mark of 14:39.29 set by another Ethiopian, Berhane Adera, in Stuttgart last year. But compatriot Kenenisa Bekele's record hopes were dashed when he miscounted his laps in the men's 3,000m and staged his sprint finish a lap too soon. Ireland's Alistair Cragg won in 7:39.89 as Bekele battled to second in 7:41.42. "I didn't want to sit back and get out-kicked," said Cragg. "So I kept on the pace. The plan was to go with 500m to go no matter what, but when Bekele made the mistake that was it. The race was mine." Sweden's Carolina Kluft, the Olympic heptathlon champion, and Slovenia's Jolanda Ceplak had winning performances, too. Kluft took the long jump at 6.63m, while Ceplak easily won the women's 800m in 2:01.52.
"""
text\_3 = """Google's toolbar sparks concern
Search engine firm Google has released a trial tool which is concerning some net users because it directs people to pre-selected commercial websites.
The AutoLink feature comes with Google's latest toolbar and provides links in a webpage to Amazon.com if it finds a book's ISBN number on the site. It also links to Google's map service, if there is an address, or to car firm Carfax, if there is a licence plate. Google said the feature, available only in the US, "adds useful links". But some users are concerned that Google's dominant position in the search engine market place could mean it would be giving a competitive edge to firms like Amazon.
AutoLink works by creating a link to a website based on information contained in a webpage - even if there is no link specified and whether or not the publisher of the page has given permission.
If a user clicks the AutoLink feature in the Google toolbar then a webpage with a book's unique ISBN number would link directly to Amazon's website. It could mean online libraries that list ISBN book numbers find they are directing users to Amazon.com whether they like it or not. Websites which have paid for advertising on their pages may also be directing people to rival services. Dan Gillmor, founder of Grassroots Media, which supports citizen-based media, said the tool was a "bad idea, and an unfortunate move by a company that is looking to continue its hypergrowth". In a statement Google said the feature was still only in beta, ie trial, stage and that the company welcomed feedback from users. It said: "The user can choose never to click on the AutoLink button, and web pages she views will never be modified. "In addition, the user can choose to disable the AutoLink feature entirely at any time."
The new tool has been compared to the Smart Tags feature from Microsoft by some users. It was widely criticised by net users and later dropped by Microsoft after concerns over trademark use were raised. Smart Tags allowed Microsoft to link any word on a web page to another site chosen by the company. Google said none of the companies which received AutoLinks had paid for the service. Some users said AutoLink would only be fair if websites had to sign up to allow the feature to work on their pages or if they received revenue for any "click through" to a commercial site. Cory Doctorow, European outreach coordinator for digital civil liberties group Electronic Fronter Foundation, said that Google should not be penalised for its market dominance. "Of course Google should be allowed to direct people to whatever proxies it chooses. "But as an end user I would want to know - 'Can I choose to use this service?, 'How much is Google being paid?', 'Can I substitute my own companies for the ones chosen by Google?'." Mr Doctorow said the only objection would be if users were forced into using AutoLink or "tricked into using the service".
"""
doc\_1 = {"content": text\_1, "vector": get\_vector(text\_1)}
doc\_2 = {"content": text\_2, "vector": get\_vector(text\_2)}
doc\_3 = {"content": text\_3, "vector": get\_vector(text\_3)}`
```
## Start the Redis Stack Docker container
```
`! docker compose up -d`
```
```
`[1A[1B[0G[?25l[+] Running 0/0
⠿ Container redisjson-redis-1 Starting [34m0.1s [0m
[?25h[1A[1A[0G[?25l[+] Running 0/1
⠿ Container redisjson-redis-1 Starting [34m0.2s [0m
[?25h[1A[1A[0G[?25l[+] Running 0/1
⠿ Container redisjson-redis-1 Starting [34m0.3s [0m
[?25h[1A[1A[0G[?25l[+] Running 0/1
⠿ Container redisjson-redis-1 Starting [34m0.4s [0m
[?25h[1A[1A[0G[?25l[34m[+] Running 1/1[0m
[32m✔[0m Container redisjson-redis-1 [32mStarted[0m [34m0.4s [0m
[?25h`
```
## Connect Redis client
```
`from redis import from\_url
REDIS\_URL = 'redis://localhost:6379'
client = from\_url(REDIS\_URL)
client.ping()`
```
```
`True`
```
## Create Index
[FT.CREATE](https://redis.io/commands/ft.create/)
```
`from redis.commands.search.field import TextField, VectorField
from redis.commands.search.indexDefinition import IndexDefinition, IndexType
schema = [ VectorField('$.vector',
"FLAT",
{ "TYPE": 'FLOAT32',
"DIM": len(doc\_1['vector']),
"DISTANCE\_METRIC": "COSINE"
}, as\_name='vector' ),
TextField('$.content', as\_name='content')
]
idx\_def = IndexDefinition(index\_type=IndexType.JSON, prefix=['doc:'])
try:
client.ft('idx').dropindex()
except:
pass
client.ft('idx').create\_index(schema, definition=idx\_def)`
```
```
`b'OK'`
```
## Load Data into Redis as JSON objects
[Redis JSON](https://redis.io/docs/stack/json/)
```
`client.json().set('doc:1', '$', doc\_1)
client.json().set('doc:2', '$', doc\_2)
client.json().set('doc:3', '$', doc\_3)`
```
```
`True`
```
# Semantic Search
Given a sports-related article, search Redis via Vector Similarity Search (VSS) for similar articles.
[KNN Search](https://redis.io/docs/stack/search/reference/vectors/#knn-search)
```
`from redis.commands.search.query import Query
import numpy as np
text\_4 = """Radcliffe yet to answer GB call
Paula Radcliffe has been granted extra time to decide whether to compete in the World Cross-Country Championships.
The 31-year-old is concerned the event, which starts on 19 March in France, could upset her preparations for the London Marathon on 17 April. "There is no question that Paula would be a huge asset to the GB team," said Zara Hyde Peters of UK Athletics. "But she is working out whether she can accommodate the worlds without too much compromise in her marathon training." Radcliffe must make a decision by Tuesday - the deadline for team nominations. British team member Hayley Yelling said the team would understand if Radcliffe opted out of the event. "It would be fantastic to have Paula in the team," said the European cross-country champion. "But you have to remember that athletics is basically an individual sport and anything achieved for the team is a bonus. "She is not messing us around. We all understand the problem." Radcliffe was world cross-country champion in 2001 and 2002 but missed last year's event because of injury. In her absence, the GB team won bronze in Brussels.
"""
vec = np.array(get\_vector(text\_4), dtype=np.float32).tobytes()
q = Query('\*=\>[KNN 3 @vector $query\_vec AS vector\_score]')\\
.sort\_by('vector\_score')\\
.return\_fields('vector\_score', 'content')\\
.dialect(2)
params = {"query\_vec": vec}
results = client.ft('idx').search(q, query\_params=params)
for doc in results.docs:
print(f"distance:{round(float(doc['vector\_score']),3)} content:{doc['content']}\\n")`
```
```
`distance:0.188 content:Dibaba breaks 5,000m world record
Ethiopia's Tirunesh Dibaba set a new world record in winning the women's 5,000m at the Boston Indoor Games.
Dibaba won in 14 minutes 32.93 seconds to erase the previous world indoor mark of 14:39.29 set by another Ethiopian, Berhane Adera, in Stuttgart last year. But compatriot Kenenisa Bekele's record hopes were dashed when he miscounted his laps in the men's 3,000m and staged his sprint finish a lap too soon. Ireland's Alistair Cragg won in 7:39.89 as Bekele battled to second in 7:41.42. "I didn't want to sit back and get out-kicked," said Cragg. "So I kept on the pace. The plan was to go with 500m to go no matter what, but when Bekele made the mistake that was it. The race was mine." Sweden's Carolina Kluft, the Olympic heptathlon champion, and Slovenia's Jolanda Ceplak had winning performances, too. Kluft took the long jump at 6.63m, while Ceplak easily won the women's 800m in 2:01.52.
distance:0.268 content:Japan narrowly escapes recession
Japan's economy teetered on the brink of a technical recession in the three months to September, figures show.
Revised figures indicated growth of just 0.1% - and a similar-sized contraction in the previous quarter. On an annual basis, the data suggests annual growth of just 0.2%, suggesting a much more hesitant recovery than had previously been thought. A common technical definition of a recession is two successive quarters of negative growth.
The government was keen to play down the worrying implications of the data. "I maintain the view that Japan's economy remains in a minor adjustment phase in an upward climb, and we will monitor developments carefully," said economy minister Heizo Takenaka. But in the face of the strengthening yen making exports less competitive and indications of weakening economic conditions ahead, observers were less sanguine. "It's painting a picture of a recovery... much patchier than previously thought," said Paul Sheard, economist at Lehman Brothers in Tokyo. Improvements in the job market apparently have yet to feed through to domestic demand, with private consumption up just 0.2% in the third quarter.
distance:0.287 content:Google's toolbar sparks concern
Search engine firm Google has released a trial tool which is concerning some net users because it directs people to pre-selected commercial websites.
The AutoLink feature comes with Google's latest toolbar and provides links in a webpage to Amazon.com if it finds a book's ISBN number on the site. It also links to Google's map service, if there is an address, or to car firm Carfax, if there is a licence plate. Google said the feature, available only in the US, "adds useful links". But some users are concerned that Google's dominant position in the search engine market place could mean it would be giving a competitive edge to firms like Amazon.
AutoLink works by creating a link to a website based on information contained in a webpage - even if there is no link specified and whether or not the publisher of the page has given permission.
If a user clicks the AutoLink feature in the Google toolbar then a webpage with a book's unique ISBN number would link directly to Amazon's website. It could mean online libraries that list ISBN book numbers find they are directing users to Amazon.com whether they like it or not. Websites which have paid for advertising on their pages may also be directing people to rival services. Dan Gillmor, founder of Grassroots Media, which supports citizen-based media, said the tool was a "bad idea, and an unfortunate move by a company that is looking to continue its hypergrowth". In a statement Google said the feature was still only in beta, ie trial, stage and that the company welcomed feedback from users. It said: "The user can choose never to click on the AutoLink button, and web pages she views will never be modified. "In addition, the user can choose to disable the AutoLink feature entirely at any time."
The new tool has been compared to the Smart Tags feature from Microsoft by some users. It was widely criticised by net users and later dropped by Microsoft after concerns over trademark use were raised. Smart Tags allowed Microsoft to link any word on a web page to another site chosen by the company. Google said none of the companies which received AutoLinks had paid for the service. Some users said AutoLink would only be fair if websites had to sign up to allow the feature to work on their pages or if they received revenue for any "click through" to a commercial site. Cory Doctorow, European outreach coordinator for digital civil liberties group Electronic Fronter Foundation, said that Google should not be penalised for its market dominance. "Of course Google should be allowed to direct people to whatever proxies it chooses. "But as an end user I would want to know - 'Can I choose to use this service?, 'How much is Google being paid?', 'Can I substitute my own companies for the ones chosen by Google?'." Mr Doctorow said the only objection would be if users were forced into using AutoLink or "tricked into using the service".`
```
## Hybrid Search
Use a combination of full text search and VSS to find a matching article. For this scenario, we filter on a full text search of the term ‘recession’ and then find the KNN articles. In this case, business-related. Reminder document #1 was about a recession in Japan.
[Hybrid Queries](https://redis.io/docs/stack/search/reference/vectors/#hybrid-queries)
```
`text\_5 = """Ethiopia's crop production up 24%
Ethiopia produced 14.27 million tonnes of crops in 2004, 24% higher than in 2003 and 21% more than the average of the past five years, a report says.
In 2003, crop production totalled 11.49 million tonnes, the joint report from the Food and Agriculture Organisation and the World Food Programme said. Good rains, increased use of fertilizers and improved seeds contributed to the rise in production. Nevertheless, 2.2 million Ethiopians will still need emergency assistance.
The report calculated emergency food requirements for 2005 to be 387,500 tonnes. On top of that, 89,000 tonnes of fortified blended food and vegetable oil for "targeted supplementary food distributions for a survival programme for children under five and pregnant and lactating women" will be needed.
In eastern and southern Ethiopia, a prolonged drought has killed crops and drained wells. Last year, a total of 965,000 tonnes of food assistance was needed to help seven million Ethiopians. The Food and Agriculture Organisation (FAO) recommend that the food assistance is bought locally. "Local purchase of cereals for food assistance programmes is recommended as far as possible, so as to assist domestic markets and farmers," said Henri Josserand, chief of FAO's Global Information and Early Warning System. Agriculture is the main economic activity in Ethiopia, representing 45% of gross domestic product. About 80% of Ethiopians depend directly or indirectly on agriculture.
"""
vec = np.array(get\_vector(text\_5), dtype=np.float32).tobytes()
q = Query('@content:recession =\> [KNN 3 @vector $query\_vec AS vector\_score]')\\
.sort\_by('vector\_score')\\
.return\_fields('vector\_score', 'content')\\
.dialect(2)
params = {"query\_vec": vec}
results = client.ft('idx').search(q, query\_params=params)
for doc in results.docs:
print(f"distance:{round(float(doc['vector\_score']),3)} content:{doc['content']}\\n")`
```
```
`distance:0.241 content:Japan narrowly escapes recession
Japan's economy teetered on the brink of a technical recession in the three months to September, figures show.
Revised figures indicated growth of just 0.1% - and a similar-sized contraction in the previous quarter. On an annual basis, the data suggests annual growth of just 0.2%, suggesting a much more hesitant recovery than had previously been thought. A common technical definition of a recession is two successive quarters of negative growth.
The government was keen to play down the worrying implications of the data. "I maintain the view that Japan's economy remains in a minor adjustment phase in an upward climb, and we will monitor developments carefully," said economy minister Heizo Takenaka. But in the face of the strengthening yen making exports less competitive and indications of weakening economic conditions ahead, observers were less sanguine. "It's painting a picture of a recovery... much patchier than previously thought," said Paul Sheard, economist at Lehman Brothers in Tokyo. Improvements in the job market apparently have yet to feed through to domestic demand, with private consumption up just 0.2% in the third quarter.`
```