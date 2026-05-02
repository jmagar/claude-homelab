Fine tuning classification example
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
# Fine tuning classification example
This recipe is archived and may reference outdated models or APIs.
[ BO ](https://github.com/BorisPower)
[ BorisPower ](https://github.com/BorisPower)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Fine-tuned_classification.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Fine-tuned_classification.ipynb)
We will fine-tune a `babbage-002` classifier (replacement for the `ada` models) to distinguish between the two sports: Baseball and Hockey.
```
`from sklearn.datasets import fetch\_20newsgroups
import pandas as pd
import openai
import os
client = openai.OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
categories = ['rec.sport.baseball', 'rec.sport.hockey']
sports\_dataset = fetch\_20newsgroups(subset='train', shuffle=True, random\_state=42, categories=categories)`
```
## Data exploration
The newsgroup dataset can be loaded using sklearn. First we will look at the data itself:
```
`print(sports\_dataset['data'][0])`
```
```
`From: dougb@comm.mot.com (Doug Bank)
Subject: Re: Info needed for Cleveland tickets
Reply-To: dougb@ecs.comm.mot.com
Organization: Motorola Land Mobile Products Sector
Distribution: usa
Nntp-Posting-Host: 145.1.146.35
Lines: 17
In article \<1993Apr1.234031.4950@leland.Stanford.EDU\>, bohnert@leland.Stanford.EDU (matthew bohnert) writes:
|\> I'm going to be in Cleveland Thursday, April 15 to Sunday, April 18.
|\> Does anybody know if the Tribe will be in town on those dates, and
|\> if so, who're they playing and if tickets are available?
The tribe will be in town from April 16 to the 19th.
There are ALWAYS tickets available! (Though they are playing Toronto,
and many Toronto fans make the trip to Cleveland as it is easier to
get tickets in Cleveland than in Toronto. Either way, I seriously
doubt they will sell out until the end of the season.)
--
Doug Bank Private Systems Division
dougb@ecs.comm.mot.com Motorola Communications Sector
dougb@nwu.edu Schaumburg, Illinois
dougb@casbah.acns.nwu.edu 708-576-8207`
```
```
`sports\_dataset.target\_names[sports\_dataset['target'][0]]`
```
```
`'rec.sport.baseball'`
```
```
`len\_all, len\_baseball, len\_hockey = len(sports\_dataset.data), len([e for e in sports\_dataset.target if e == 0]), len([e for e in sports\_dataset.target if e == 1])
print(f"Total examples: {len\_all}, Baseball examples: {len\_baseball}, Hockey examples: {len\_hockey}")`
```
```
`Total examples: 1197, Baseball examples: 597, Hockey examples: 600`
```
One sample from the baseball category can be seen above. It is an email to a mailing list. We can observe that we have 1197 examples in total, which are evenly split between the two sports.
## Data Preparation
We transform the dataset into a pandas dataframe, with a column for prompt and completion. The prompt contains the email from the mailing list, and the completion is a name of the sport, either hockey or baseball. For demonstration purposes only and speed of fine-tuning we take only 300 examples. In a real use case the more examples the better the performance.
```
`import pandas as pd
labels = [sports\_dataset.target\_names[x].split('.')[-1] for x in sports\_dataset['target']]
texts = [text.strip() for text in sports\_dataset['data']]
df = pd.DataFrame(zip(texts, labels), columns = ['prompt','completion']) #[:300]
df.head()`
```
||prompt|completion|
|0|From: dougb@comm.mot.com (Doug Bank)\\nSubject:...|baseball|
|1|From: gld@cunixb.cc.columbia.edu (Gary L Dare)...|hockey|
|2|From: rudy@netcom.com (Rudy Wade)\\nSubject: Re...|baseball|
|3|From: monack@helium.gas.uug.arizona.edu (david...|hockey|
|4|Subject: Let it be Known\\nFrom: \<ISSBTL@BYUVM....|baseball|
Both baseball and hockey are single tokens. We save the dataset as a jsonl file.
```
`df.to\_json("sport2.jsonl", orient='records', lines=True)`
```
### Data Preparation tool
We can now use a data preparation tool which will suggest a few improvements to our dataset before fine-tuning. Before launching the tool we update the openai library to ensure we’re using the latest data preparation tool. We additionally specify `-q` which auto-accepts all suggestions.
```
`!openai tools fine\_tunes.prepare\_data -f sport2.jsonl -q`
```
```
`Analyzing...
- Your file contains 1197 prompt-completion pairs
- Based on your data it seems like you're trying to fine-tune a model for classification
- For classification, we recommend you try one of the faster and cheaper models, such as `ada`
- For classification, you can estimate the expected model performance by keeping a held out dataset, which is not used for training
- There are 11 examples that are very long. These are rows: [134, 200, 281, 320, 404, 595, 704, 838, 1113, 1139, 1174]
For conditional generation, and for classification the examples shouldn't be longer than 2048 tokens.
- Your data does not contain a common separator at the end of your prompts. Having a separator string appended to the end of the prompt makes it clearer to the fine-tuned model where the completion should begin. See https://platform.openai.com/docs/guides/fine-tuning/preparing-your-dataset for more detail and examples. If you intend to do open-ended generation, then you should leave the prompts empty
- The completion should start with a whitespace character (` `). This tends to produce better results due to the tokenization we use. See https://platform.openai.com/docs/guides/fine-tuning/preparing-your-dataset for more details
Based on the analysis we will perform the following actions:
- [Recommended] Remove 11 long examples [Y/n]: Y
- [Recommended] Add a suffix separator `\\n\\n###\\n\\n` to all prompts [Y/n]: Y
- [Recommended] Add a whitespace character to the beginning of the completion [Y/n]: Y
- [Recommended] Would you like to split into training and validation set? [Y/n]: Y
Your data will be written to a new JSONL file. Proceed [Y/n]: Y
Wrote modified files to `sport2\_prepared\_train (1).jsonl` and `sport2\_prepared\_valid (1).jsonl`
Feel free to take a look!
Now use that file when fine-tuning:
\> openai api fine\_tunes.create -t "sport2\_prepared\_train (1).jsonl" -v "sport2\_prepared\_valid (1).jsonl" --compute\_classification\_metrics --classification\_positive\_class " baseball"
After you’ve fine-tuned a model, remember that your prompt has to end with the indicator string `\\n\\n###\\n\\n` for the model to start generating completions, rather than continuing with the prompt.
Once your model starts training, it'll approximately take 30.8 minutes to train a `curie` model, and less for `ada` and `babbage`. Queue will approximately take half an hour per job ahead of you.`
```
The tool helpfully suggests a few improvements to the dataset and splits the dataset into training and validation set.
A suffix between a prompt and a completion is necessary to tell the model that the input text has stopped, and that it now needs to predict the class. Since we use the same separator in each example, the model is able to learn that it is meant to predict either baseball or hockey following the separator.
A whitespace prefix in completions is useful, as most word tokens are tokenized with a space prefix.
The tool also recognized that this is likely a classification task, so it suggested to split the dataset into training and validation datasets. This will allow us to easily measure expected performance on new data.
## Fine-tuning
The tool suggests we run the following command to train the dataset. Since this is a classification task, we would like to know what the generalization performance on the provided validation set is for our classification use case.
We can simply copy the suggested command from the CLI tool. We specifically add `-m ada` to fine-tune a cheaper and faster ada model, which is usually comperable in performance to slower and more expensive models on classification use cases.
```
`train\_file = client.files.create(file=open("sport2\_prepared\_train.jsonl", "rb"), purpose="fine-tune")
valid\_file = client.files.create(file=open("sport2\_prepared\_valid.jsonl", "rb"), purpose="fine-tune")
fine\_tuning\_job = client.fine\_tuning.jobs.create(training\_file=train\_file.id, validation\_file=valid\_file.id, model="babbage-002")
print(fine\_tuning\_job)`
```
```
`FineTuningJob(id='ftjob-REo0uLpriEAm08CBRNDlPJZC', created\_at=1704413736, error=None, fine\_tuned\_model=None, finished\_at=None, hyperparameters=Hyperparameters(n\_epochs='auto', batch\_size='auto', learning\_rate\_multiplier='auto'), model='babbage-002', object='fine\_tuning.job', organization\_id='org-9HXYFy8ux4r6aboFyec2OLRf', result\_files=[], status='validating\_files', trained\_tokens=None, training\_file='file-82XooA2AUDBAUbN5z2DuKRMs', validation\_file='file-wTOcQF8vxQ0Z6fNY2GSm0z4P')`
```
The model is successfully trained in about ten minutes. You can watch the finetune happen on [https://platform.openai.com/finetune/](https://platform.openai.com/finetune/)
You can also check on its status programatically:
```
`fine\_tune\_results = client.fine\_tuning.jobs.retrieve(fine\_tuning\_job.id)
print(fine\_tune\_results.finished\_at)`
```
```
`1704414393`
```
### [Advanced] Results and expected model performance
We can now download the results file to observe the expected performance on a held out validation set.
```
`fine\_tune\_results = client.fine\_tuning.jobs.retrieve(fine\_tuning\_job.id).result\_files
result\_file = client.files.retrieve(fine\_tune\_results[0])
content = client.files.content(result\_file.id)
# save content to file
with open("result.csv", "wb") as f:
f.write(content.text.encode("utf-8"))`
```
```
`results = pd.read\_csv('result.csv')
results[results['train\_accuracy'].notnull()].tail(1)`
```
||step|train\_loss|train\_accuracy|valid\_loss|valid\_mean\_token\_accuracy|
|2843|2844|0.0|1.0|NaN|NaN|
The accuracy reaches 99.6%. On the plot below we can see how accuracy on the validation set increases during the training run.
```
`results[results['train\_accuracy'].notnull()]['train\_accuracy'].plot()`
```
## Using the model
We can now call the model to get the predictions.
```
`test = pd.read\_json('sport2\_prepared\_valid.jsonl', lines=True)
test.head()`
```
||prompt|completion|
|0|From: gld@cunixb.cc.columbia.edu (Gary L Dare)...|hockey|
|1|From: smorris@venus.lerc.nasa.gov (Ron Morris ...|hockey|
|2|From: golchowy@alchemy.chem.utoronto.ca (Geral...|hockey|
|3|From: krattige@hpcc01.corp.hp.com (Kim Krattig...|baseball|
|4|From: warped@cs.montana.edu (Doug Dolven)\\nSub...|baseball|
We need to use the same separator following the prompt which we used during fine-tuning. In this case it is `\\n\\n###\\n\\n`. Since we’re concerned with classification, we want the temperature to be as low as possible, and we only require one token completion to determine the prediction of the model.
```
`ft\_model = fine\_tune\_results.fine\_tuned\_model
# note that this calls the legacy completions api - https://platform.openai.com/docs/api-reference/completions
res = client.completions.create(model=ft\_model, prompt=test['prompt'][0] + '\\n\\n###\\n\\n', max\_tokens=1, temperature=0)
res.choices[0].text`
```
```
`' hockey'`
```
To get the log probabilities, we can specify logprobs parameter on the completion request
```
`res = client.completions.create(model=ft\_model, prompt=test['prompt'][0] + '\\n\\n###\\n\\n', max\_tokens=1, temperature=0, logprobs=2)
res.choices[0].logprobs.top\_logprobs`
```
```
`[{' hockey': 0.0, ' Hockey': -22.504879}]`
```
We can see that the model predicts hockey as a lot more likely than baseball, which is the correct prediction. By requesting log\_probs, we can see the prediction (log) probability for each class.
### Generalization
Interestingly, our fine-tuned classifier is quite versatile. Despite being trained on emails to different mailing lists, it also successfully predicts tweets.
```
`sample\_hockey\_tweet = """Thank you to the
@Canes
and all you amazing Caniacs that have been so supportive! You guys are some of the best fans in the NHL without a doubt! Really excited to start this new chapter in my career with the
@DetroitRedWings
!!"""
res = client.completions.create(model=ft\_model, prompt=sample\_hockey\_tweet + '\\n\\n###\\n\\n', max\_tokens=1, temperature=0, logprobs=2)
res.choices[0].text`
```
```
`' hockey'`
```
```
`sample\_baseball\_tweet="""BREAKING: The Tampa Bay Rays are finalizing a deal to acquire slugger Nelson Cruz from the Minnesota Twins, sources tell ESPN."""
res = client.completions.create(model=ft\_model, prompt=sample\_baseball\_tweet + '\\n\\n###\\n\\n', max\_tokens=1, temperature=0, logprobs=2)
res.choices[0].text`
```