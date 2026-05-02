Fine-Tuned Q&A - create Q&A
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
Mar 10, 2022
# Fine-Tuned Q&A - create Q&A
This recipe is archived and may reference outdated models or APIs.
[ TS ](https://github.com/ted-at-openai)[ BO ](https://github.com/BorisPower)
[ Ted Sanders
(OpenAI)
, ](https://github.com/ted-at-openai)[ BorisPower ](https://github.com/BorisPower)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/fine-tuned_qa/olympics-2-create-qa.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/fine-tuned_qa/olympics-2-create-qa.ipynb)
Note: To answer questions based on text documents, we recommend the procedure in [Question Answering using Embeddings](https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb). Some of the code below may rely on [deprecated API endpoints](https://github.com/openai/openai-cookbook/tree/main/transition_guides_for_deprecated_API_endpoints).
# 2. Creating a synthetic Q&A dataset
We use [`davinci-instruct-beta-v3`](https://beta.openai.com/docs/engines/instruct-series-beta), a model specialized in following instructions, to create questions based on the given context. Then we also use [`davinci-instruct-beta-v3`](https://beta.openai.com/docs/engines/instruct-series-beta) to answer those questions, given the same context.
This is expensive, and will also take a long time, as we call the davinci engine for each section. You can simply download the final dataset instead.
We’re using the dataset created using the [previous notebook](olympics-1-collect-data.ipynb)
## 2.1 Read in the data, and create a context
Create a context by concatenating the title, the heading and the content of that section
```
`import pandas as pd
df = pd.read\_csv('olympics-data/olympics\_sections.csv')
df['context'] = df.title + "\\n" + df.heading + "\\n\\n" + df.content
df.head()`
```
||title|heading|content|tokens|context|
|0|2020 Summer Olympics|Summary|The 2020 Summer Olympics (Japanese: 2020年夏季オリン...|713|2020 Summer Olympics\\nSummary\\n\\nThe 2020 Summ...|
|1|2020 Summer Olympics|Host city selection|The International Olympic Committee (IOC) vote...|126|2020 Summer Olympics\\nHost city selection\\n\\nT...|
|2|2020 Summer Olympics|Impact of the COVID-19 pandemic|In January 2020, concerns were raised about th...|369|2020 Summer Olympics\\nImpact of the COVID-19 p...|
|3|2020 Summer Olympics|Qualifying event cancellation and postponement|Concerns about the pandemic began to affect qu...|298|2020 Summer Olympics\\nQualifying event cancell...|
|4|2020 Summer Olympics|Effect on doping tests|Mandatory doping tests were being severely res...|163|2020 Summer Olympics\\nEffect on doping tests\\n...|
## 2.2 Create questions based on the context
Use davinci-instruct to generate a number of plausible questions relating to the Wikipedia section contents.
Note: We have used temperature=0, but it may be beneficial to experiment with a higher temperature to get a higher diversity of questions.
WARNING: This step will last a long time, and consume a lot of tokens, as it calls davinci-instruct for every section to generate a number of questions.
```
`from openai import OpenAI
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
def get\_questions(context):
try:
response = client.chat.completions.create(model="davinci-instruct-beta-v3",
prompt=f"Write questions based on the text below\\n\\nText: {context}\\n\\nQuestions:\\n1.",
temperature=0,
max\_tokens=257,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0,
stop=["\\n\\n"])
return response.choices[0].text
except:
return ""
df['questions']= df.context.apply(get\_questions)
df['questions'] = "1." + df.questions
print(df[['questions']].values[0][0])`
```
```
`1. What is the 2020 Summer Olympics?
2. When did the 2020 Summer Olympics take place?
3. Who won the most medals at the 2020 Summer Olympics?
4. Who won the most gold medals at the 2020 Summer Olympics?
5. Who won the most medals at the 2020 Summer Olympics?`
```
The prompt is designed to generate a number of questions. Example questions above were generated based on the summary section of the 2020 Summer Olympics page.
We can observe that the questions 3 and 5 above repeat. Sometimes the generated questions could be ambiguous without the context. We will show that even despite these limitations we can create a successful model.
```
`print(df.content.values[0])`
```
```
`The 2020 Summer Olympics (Japanese: 2020年夏季オリンピック, Hepburn: Nisen Nijū-nen Kaki Orinpikku), officially the Games of the XXXII Olympiad (第三十二回オリンピック競技大会, Dai Sanjūni-kai Orinpikku Kyōgi Taikai) and branded as Tokyo 2020 (東京2020, Tōkyō Nii Zero Nii Zero), was an international multi-sport event held from 23 July to 8 August 2021 in Tokyo, Japan, with some preliminary events that began on 21 July.
Tokyo was selected as the host city during the 125th IOC Session in Buenos Aires, Argentina, on 7 September 2013. Originally scheduled to take place from 24 July to 9 August 2020, the event was postponed to 2021 in March 2020 as a result of the COVID-19 pandemic, the first such instance in the history of the Olympic Games (previous games had been cancelled but not rescheduled). However, the event retained the Tokyo 2020 name for marketing and branding purposes. It was largely held behind closed doors with no public spectators permitted due to the declaration of a state of emergency in the Greater Tokyo Area in response to the pandemic. The Summer Paralympics were held between 24 August and 5 September 2021, 16 days after the completion of the Olympics.The 2020 Games were the fourth Olympic Games to be held in Japan, following the Tokyo 1964 (Summer), Sapporo 1972 (Winter) and Nagano 1998 (Winter) games. Tokyo is the first city in Asia to hold the Summer Games twice. The 2020 Games were the second of three consecutive Olympics to be held in East Asia, following the 2018 Winter Olympics in Pyeongchang, South Korea and preceding the 2022 Winter Olympics in Beijing, China.
New events were introduced in existing sports for 2020, including 3x3 basketball, freestyle BMX and mixed gender team events in a number of existing sports, as well as the return of madison cycling for men and an introduction of the same event for women. New IOC policies also allowed the host organizing committee to add new sports to the Olympic program for just one Games. The disciplines added by the Japanese Olympic Committee were baseball and softball, karate, sport climbing, surfing and skateboarding, the last four of which made their Olympic debuts, and the last three of which will remain on the Olympic program.The United States topped the medal count by both total golds (39) and total medals (113), with China finishing second by both respects (38 and 88). Host nation Japan finished third, setting a record for the most gold medals and total medals ever won by their delegation at an Olympic Games with 27 and 58. Great Britain finished fourth, with a total of 22 gold and 65 medals, becoming the first nation at the Summer Olympics to increase or equal their total medals won in the two Games subsequent to hosting them. The Russian delegation competing as the ROC (not to be confused with the Republic of China (Taiwan) which competed as Chinese Taipei, not ROC) finished fifth with 20 gold medals and third in the overall medal count, with 71 medals. Bermuda, the Philippines and Qatar won their first-ever Olympic gold medals. Burkina Faso, San Marino and Turkmenistan won their first-ever Olympic medals.`
```
## 2.3 Create answers based on the context
Use davinci-instruct to answer the questions given the relevant Wikipedia section contents
Note: We have used temperature=0, but it may be beneficial to experiment with a higher temperature to get a higher diversity of questions.
**WARNING: This step will last a long time, and consume a lot of tokens, as it calls davinci-instruct for every section to answer all the questions.**
```
`def get\_answers(row):
try:
response = client.chat.completions.create(
engine="davinci-instruct-beta-v3",
prompt=f"Write answer based on the text below\\n\\nText: {row.context}\\n\\nQuestions:\\n{row.questions}\\n\\nAnswers:\\n1.",
temperature=0,
max\_tokens=257,
top\_p=1,
frequency\_penalty=0,
presence\_penalty=0
)
return response.choices[0].text
except Exception as e:
print (e)
return ""
df['answers']= df.apply(get\_answers, axis=1)
df['answers'] = "1." + df.answers
df = df.dropna().reset\_index().drop('index',axis=1)
print(df[['answers']].values[0][0])`
```
```
`1. The 2020 Summer Olympics is an international multi-sport event held from 23 July to 8 August 2021 in Tokyo, Japan.
2. The 2020 Summer Olympics took place from 23 July to 8 August 2021.
3. The United States topped the medal count by both total golds (39) and total medals (113), with China finishing second by both respects (38 and 88).
4. The United States topped the medal count by both total golds (39) and total medals (113), with China finishing second by both respects (38 and 88).
5. The United States topped the medal count by both total golds (39) and total medals (113), with China finishing second by both respects (38 and 88).`
```
These are the answers to the questions above based on the context around the host city selection.
We can see that answers 3-5 contain the correct answer, but instead of answering the question directly, the answer is a verbatim extraction. Despite these occasional lower quality answers, we will show that the model can learn the task reasonably well, given a high number of examples.
## 2.4 Save the Olympics Q&A dataset based on Wikipedia sections
We save the file for use in the [next notebook](olympics-3-train-qa.ipynb)
```
`df.to\_csv('olympics-data/olympics\_qa.csv', index=False)`
```
## 2.5 Search file (DEPRECATED)
We create a search file ([API reference](https://beta.openai.com/docs/api-reference/files/list)), which can be used to retrieve the relevant context when a question is asked.
DEPRECATED: The /search endpoint is deprecated in favour of using embeddings. Embeddings are cheaper, faster and can support a better search experience. See [Question Answering Guide](https://github.com/openai/openai-cookbook/blob/main/examples/Question_answering_using_embeddings.ipynb) for a search implementation using the embeddings
```
`df = df[df.tokens\<2000]
df[['context', 'tokens']].rename(columns={'context':'text','tokens':'metadata'}).to\_json('olympics-data/olympics\_search.jsonl', orient='records', lines=True)
search\_file = client.files.create(
file=open("olympics-data/olympics\_search.jsonl"),
purpose='search'
)
olympics\_search\_fileid = search\_file['id']`
```
## 2.6 Answer questions based on the context provided
We will use a simple implementation of the answers endpoint. This works by simply using the [/search endpoint](https://beta.openai.com/docs/api-reference/searches), which searches over an indexed file to obtain the relevant sections which can be included in the context, following by a question and answering prompt given a specified model.
```
`from answers\_with\_ft import create\_context, answer\_question
print(create\_context("Where did women's 4 x 100 metres relay event take place during the 2020 Summer Olympics?", olympics\_search\_fileid, max\_len=400))`
```
```
`Athletics at the 2020 Summer Olympics – Women's 4 × 100 metres relay
Summary
The women's 4 × 100 metres relay event at the 2020 Summer Olympics took place on 5 and 6 August 2021 at the Japan National Stadium. There were 16 competing relay teams, with each team having 5 members from which 4 were selected in each round.
###
Athletics at the 2020 Summer Olympics – Men's 4 × 100 metres relay
Qualification
National Olympic Committees (NOCs) could qualify one relay team in one of three following ways:
The top 8 NOCs at the 2019 World Athletics Championships qualified a relay team.
The top 8 NOCs at the 2021 World Athletics Relays qualified a relay team.
Where an NOC placed in the top 8 at both the 2019 World Championships and the 2021 World Relays, the quota place was allocated to the world top list as of 29 June 2021. In this case, 4 teams did so, so there are 4 places available through the world rankings.A total of five athletes may be entered for a relay team. Should a NOC have also entered individual athletes in the corresponding individual event (100 m), the entered individual athletes must be included in the total of five (5) athletes entered for the relay event. In addition of five, NOCs can nominate a maximum of one alternate athlete for each team.
The qualifying period was originally from 1 May 2019 to 29 June 2020. Due to the COVID-19 pandemic, the period was suspended from 6 April 2020 to 30 November 2020, with the end date extended to 29 June 2021. The qualifying time standards could be obtained in various meets during the given period that have the approval of the IAAF. Both indoor and outdoor meets are eligible. The most recent Area Championships may be counted in the ranking, even if not during the qualifying period.`
```
```
`answer\_question(olympics\_search\_fileid, "davinci-instruct-beta-v3",
"Where did women's 4 x 100 metres relay event take place during the 2020 Summer Olympics?")`
```
```
`' Japan National Stadium'`
```
After we fine-tune the model for Q&A we’ll be able to use it instead of [`davinci-instruct-beta-v3`](https://beta.openai.com/docs/engines/instruct-series-beta), to obtain better answers when the question can’t be answered based on the context. We see a downside of [`davinci-instruct-beta-v3`](https://beta.openai.com/docs/engines/instruct-series-beta), which always attempts to answer the question, regardless of the relevant context being present or not. (Note the second question is asking about a future event, set in 2024.)
```
`answer\_question(olympics\_search\_fileid, "davinci-instruct-beta-v3",
"Where did women's 4 x 100 metres relay event take place during the 2048 Summer Olympics?", max\_len=1000)`
```
```
`' Japan National Stadium'`
```
We can see that davinci has a tendency to answer the question, even if the question can’t be answered given the context provided. Note the question asked regarding 2048 Summer Olympics, which didn’t happen yet, and the retrieved content has only returned results for 2020.
## 2.7 (Optional) Investigation into how likely the search endpoint is to return the relevant context
```
`def check\_context(title, heading, question, max\_len=1800, search\_model='ada', max\_rerank=10):
"""
Evaluate the performance of the search model in retrieving the correct context
Parameters
----------
title: str
The title of the Wikipedia page
heading: str
The heading of the Wikipedia section
qusetion: str
The question
max\_len: int
The maximum length of the context
search\_model: str
The search model to use - `ada` is most cost effective
max\_rerank: int
The maximum number of reranking documents to use the search model on
Returns
-------
rank: int
The rank of the correct context
token\_length: int
The number of tokens needed to obtain the correct context
"""
try:
# TODO: openai.Engine(search\_model) is deprecated
results = openai.Engine(search\_model).search(
search\_model=search\_model,
query=question,
max\_rerank=max\_rerank,
file=olympics\_search\_fileid,
return\_metadata=True
)
index=-1
returns = []
cur\_len = 0
for result in results['data']:
cur\_len += int(result['metadata']) + 4 # we add 4 tokens for the separator `\\n\\n###\\n\\n`
if cur\_len \> max\_len:
break
returns.append(result['text'])
res = result['text'].split('\\n')
if res[0] == title and res[1] == heading:
index = len(returns) - 1
break
return index, cur\_len
except Exception as e:
#print (e)
return []
print(check\_context("Athletics at the 2020 Summer Olympics – Women's 4 × 100 metres relay", "Summary", "Where did women's 4 x 100 metres relay event take place during the 2020 Summer Olympics?", max\_len=10000))`
```
```
`(0, 58)`
```
We utilize the generated questions based on context to estimate how often we can retrieve the original context. These questions are noisy, so this is not a perfect estimate.
Our questions and answers are prefixed with numbered bullet points, however due to the way they were generated, they are missing the first number, hence we add “1.” to the list of questions (and answers).
We calculate the rank of the section retrieved using ada search, and the number of tokens in the context needed to retrieve the relevant section in full.
```
`ada\_results = df.apply(lambda x: [
check\_context( x.title,
x.heading,
q[3:], # remove the number prefix
max\_len=1000000, # set a large number to get the full context
search\_model='ada',
max\_rerank=200,
)
for q in (x.questions).split('\\n') # split the questions
if len(q) \>10 # remove the empty questions
], axis=1)
ada\_results.head()`
```
```
`0 [(132, 27104), (-1, 22939), (8, 2151), (2, 121...
1 [(4, 1737), (0, 130), (8, 744), (96, 17208), (...
2 [(0, 373), (0, 373), (-1, 40610), (1, 570)]
3 [(0, 302), (0, 302), (5, 968), (8, 1425)]
4 [(0, 167), (0, 167), (2, 1442)]
Name: ada, dtype: object`
```
```
`out = pd.concat([ada\_results], axis=1)
out.columns = ['ada']
out.to\_csv('olympics-data/search\_engine\_results.csv')`
```
```
`def expand\_lists(out):
"""
Expand a pandas series containing lists into a series, where each list element becomes a value on its own
Input is a row per paragraph, which has multiple questions
Output is a row per question
"""
cols = [pd.DataFrame(out[name].tolist()).stack().reset\_index(level=1, drop=True).rename(name) for name in out.columns]
return pd.concat(cols, axis=1)
out\_expanded = expand\_lists(out)
out\_expanded['rank'] = out\_expanded.ada.apply(lambda x: x[0] if x != [] else -2)
out\_expanded['tokens'] = out\_expanded.ada.apply(lambda x: x[1] if x != [] else -2)`
```
```
`within\_2k = (out\_expanded.tokens \< 2000).mean()
print(f"{within\_2k\*100:.1f}% of relevant paragraphs are retrieved within the first 2k tokens")`
```
```
`74.3% of relevant paragraphs are retrieved within the first 2k tokens`
```
The relevant context can be obtained 74% of the time on this dataset
```
`outside\_200 = (out\_expanded['rank'] == -1).mean()
print(f"{outside\_200\*100:.1f}% of relevant paragraphs are not retrieved within the first 200 results")`
```
```
`7.4% of relevant paragraphs are not retrieved within the first 200 results`
```
7.4% of the time, this is due to the keyword search part of the search algorithm not retrieving the relevant context within the first 200 results.
18.3% of the time this is due to the semantic search not placing the relevant context within the first 2000 tokens.
```
`import matplotlib.pyplot as plt
# plot a histogram, and add axis descriptions and title
out\_expanded[(out\_expanded['rank'] \>=0)&(out\_expanded['rank'] \<30)]['rank'].hist(bins=29)
plt.xlabel('rank')
plt.ylabel('count')
plt.title('Histogram of ranks of retrieved paragraphs')
plt.show()`
```
```
`out\_expanded[(out\_expanded.tokens\>=0)&(out\_expanded.tokens \< 2000)]['tokens'].hist(bins=29)
plt.xlabel('tokens')
plt.ylabel('count')
plt.title('Histogram of the number of minimum tokens needed')
plt.show()`
```
We can observe that the context is most likely to be returned as one of the first results, and most likely to be returned within the first 200-500 tokens.
```
`# normalized value\_counts
out\_expanded['rank'].value\_counts(normalize=True).sort\_index()[:13]`
```
```
`-2 0.000063
-1 0.074428
0 0.453420
1 0.089515
2 0.047146
3 0.032437
4 0.024139
5 0.019676
6 0.015967
7 0.013452
8 0.011189
9 0.009869
10 0.009178
Name: rank, dtype: float64`
```
probabilities of the relevant context being returned at each rank. (-2 means a processing error, -1 means the rank is \>200)