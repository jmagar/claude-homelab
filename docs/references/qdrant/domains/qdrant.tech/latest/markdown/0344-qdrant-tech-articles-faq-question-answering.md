Q&A with Similarity Learning - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Q&A with Similarity Learning
[
Back to
Practical Examples](https://qdrant.tech/articles/practicle-examples/)# Q&A with Similarity Learning
George Panchuk
&#183;
June 28, 2022
# Question-answering system with Similarity Learning and Quaterion
Many problems in modern machine learning are approached as classification tasks.
Some are the classification tasks by design, but others are artificially transformed into such.
And when you try to apply an approach, which does not naturally fit your problem, you risk coming up with over-complicated or bulky solutions.
In some cases, you would even get worse performance.
Imagine that you got a new task and decided to solve it with a good old classification approach.
Firstly, you will need labeled data.
If it came on a plate with the task, you&rsquo;re lucky, but if it didn&rsquo;t, you might need to label it manually.
And I guess you are already familiar with how painful it might be.
Assuming you somehow labeled all required data and trained a model.
It shows good performance - well done!
But a day later, your manager told you about a bunch of new data with new classes, which your model has to handle.
You repeat your pipeline.
Then, two days later, you&rsquo;ve been reached out one more time.
You need to update the model again, and again, and again.
Sounds tedious and expensive for me, does not it for you?
## Automating customer support
Let&rsquo;s now take a look at the concrete example. There is a pressing problem with automating customer support.
The service should be capable of answering user questions and retrieving relevant articles from the documentation without any human involvement.
With the classification approach, you need to build a hierarchy of classification models to determine the question&rsquo;s topic.
You have to collect and label a whole custom dataset of your private documentation topics to train that.
And then, each time you have a new topic in your documentation, you have to re-train the whole pile of classifiers with additionally labeled data.
Can we make it easier?
## Similarity option
One of the possible alternatives is Similarity Learning, which we are going to discuss in this article.
It suggests getting rid of the classes and making decisions based on the similarity between objects instead.
To do it quickly, we would need some intermediate representation - embeddings.
Embeddings are high-dimensional vectors with semantic information accumulated in them.
As embeddings are vectors, one can apply a simple function to calculate the similarity score between them, for example, cosine or euclidean distance.
So with similarity learning, all we need to do is provide pairs of correct questions and answers.
And then, the model will learn to distinguish proper answers by the similarity of embeddings.
> If you want to learn more about similarity learning and applications, check out this
[> article
](https://qdrant.tech/documentation/tutorials-search-engineering/neural-search/)> which might be an asset.
## Let&rsquo;s build
Similarity learning approach seems a lot simpler than classification in this case, and if you have some
doubts on your mind, let me dispel them.
As I have no any resource with exhaustive F.A.Q. which might serve as a dataset, I&rsquo;ve scrapped it from sites of popular cloud providers.
The dataset consists of just 8.5k pairs of question and answers, you can take a closer look at it [here](https://github.com/qdrant/demo-cloud-faq).
Once we have data, we need to obtain embeddings for it.
It is not a novel technique in NLP to represent texts as embeddings.
There are plenty of algorithms and models to calculate them.
You could have heard of Word2Vec, GloVe, ELMo, BERT, all these models can provide text embeddings.
However, it is better to produce embeddings with a model trained for semantic similarity tasks.
For instance, we can find such models at [sentence-transformers](https://www.sbert.net/docs/pretrained_models.html).
Authors claim that `all-mpnet-base-v2` provides the best quality, but let&rsquo;s pick `all-MiniLM-L6-v2` for our tutorial
as it is 5x faster and still offers good results.
Having all this, we can test our approach. We won&rsquo;t take all our dataset at the moment, but only
a part of it. To measure model&rsquo;s performance we will use two metrics -
[mean reciprocal rank](https://en.wikipedia.org/wiki/Mean_reciprocal_rank) and
[precision@1](https://en.wikipedia.org/wiki/Evaluation_measures_(information_retrieval)#Precision_at_k).
We have a [ready script](https://github.com/qdrant/demo-cloud-faq/blob/experiments/faq/baseline.py)
for this experiment, let&rsquo;s just launch it now.
|precision@1|reciprocal\_rank|
|0.564|0.663|
That&rsquo;s already quite decent quality, but maybe we can do better?
## Improving results with fine-tuning
Actually, we can! Model we used has a good natural language understanding, but it has never seen
our data. An approach called `fine-tuning` might be helpful to overcome this issue. With
fine-tuning you don&rsquo;t need to design a task-specific architecture, but take a model pre-trained on
another task, apply a couple of layers on top and train its parameters.
Sounds good, but as similarity learning is not as common as classification, it might be a bit inconvenient to fine-tune a model with traditional tools.
For this reason we will use [Quaterion](https://github.com/qdrant/quaterion) - a framework for fine-tuning similarity learning models.
Let&rsquo;s see how we can train models with it
First, create our project and call it `faq`.
> All project dependencies, utils scripts not covered in the tutorial can be found in the
[> repository
](https://github.com/qdrant/demo-cloud-faq/tree/tutorial)> .
### Configure training
The main entity in Quaterion is [TrainableModel](https://quaterion.qdrant.tech/quaterion.train.trainable_model.html).
This class makes model&rsquo;s building process fast and convenient.
`TrainableModel` is a wrapper around [pytorch\_lightning.LightningModule](https://pytorch-lightning.readthedocs.io/en/latest/common/lightning_module.html).
[Lightning](https://www.pytorchlightning.ai/) handles all the training process complexities, like training loop, device managing, etc. and saves user from a necessity to implement all this routine manually.
Also Lightning&rsquo;s modularity is worth to be mentioned.
It improves separation of responsibilities, makes code more readable, robust and easy to write.
All these features make Pytorch Lightning a perfect training backend for Quaterion.
To use `TrainableModel` you need to inherit your model class from it.
The same way you would use `LightningModule` in pure `pytorch\_lightning`.
Mandatory methods are `configure\_loss`, `configure\_encoders`, `configure\_head`,
`configure\_optimizers`.
The majority of mentioned methods are quite easy to implement, you&rsquo;ll probably just need a couple of
imports to do that. But `configure\_encoders` requires some code:)
Let&rsquo;s create a `model.py` with model&rsquo;s template and a placeholder for `configure\_encoders`
for the moment.
```
`from typing import Union, Dict, Optional
from torch.optim import Adam
from quaterion import TrainableModel
from quaterion.loss import MultipleNegativesRankingLoss, SimilarityLoss
from quaterion\_models.encoders import Encoder
from quaterion\_models.heads import EncoderHead
from quaterion\_models.heads.skip\_connection\_head import SkipConnectionHead
class FAQModel(TrainableModel):
def \_\_init\_\_(self, lr=10e-5, \*args, \*\*kwargs):
self.lr = lr
super().\_\_init\_\_(\*args, \*\*kwargs)
def configure\_optimizers(self):
return Adam(self.model.parameters(), lr=self.lr)
def configure\_loss(self) -\> SimilarityLoss:
return MultipleNegativesRankingLoss(symmetric=True)
def configure\_encoders(self) -\> Union[Encoder, Dict[str, Encoder]]:
... # ToDo
def configure\_head(self, input\_embedding\_size: int) -\> EncoderHead:
return SkipConnectionHead(input\_embedding\_size)
`
```
* `configure\_optimizers` is a method provided by Lightning. An eagle-eye of you could notice
mysterious `self.model`, it is actually a [SimilarityModel](https://quaterion-models.qdrant.tech/quaterion_models.model.html) instance. We will cover it later.
* `configure\_loss` is a loss function to be used during training. You can choose a ready-made implementation from Quaterion.
However, since Quaterion&rsquo;s purpose is not to cover all possible losses, or other entities and
features of similarity learning, but to provide a convenient framework to build and use such models,
there might not be a desired loss. In this case it is possible to use [PytorchMetricLearningWrapper](https://quaterion.qdrant.tech/quaterion.loss.extras.pytorch_metric_learning_wrapper.html)
to bring required loss from [pytorch-metric-learning](https://kevinmusgrave.github.io/pytorch-metric-learning/) library, which has a rich collection of losses.
You can also implement a custom loss yourself.
* `configure\_head` - model built via Quaterion is a combination of encoders and a top layer - head.
As with losses, some head implementations are provided. They can be found at [quaterion\_models.heads](https://quaterion-models.qdrant.tech/quaterion_models.heads.html).
At our example we use [MultipleNegativesRankingLoss](https://quaterion.qdrant.tech/quaterion.loss.multiple_negatives_ranking_loss.html).
This loss is especially good for training retrieval tasks.
It assumes that we pass only positive pairs (similar objects) and considers all other objects as negative examples.
`MultipleNegativesRankingLoss` use cosine to measure distance under the hood, but it is a configurable parameter.
Quaterion provides implementation for other distances as well. You can find available ones at [quaterion.distances](https://quaterion.qdrant.tech/quaterion.distances.html).
Now we can come back to `configure\_encoders`:)
### Configure Encoder
The encoder task is to convert objects into embeddings.
They usually take advantage of some pre-trained models, in our case `all-MiniLM-L6-v2` from `sentence-transformers`.
In order to use it in Quaterion, we need to create a wrapper inherited from the [Encoder](https://quaterion-models.qdrant.tech/quaterion_models.encoders.encoder.html) class.
Let&rsquo;s create our encoder in `encoder.py`
```
`import os
from torch import Tensor, nn
from sentence\_transformers.models import Transformer, Pooling
from quaterion\_models.encoders import Encoder
from quaterion\_models.types import TensorInterchange, CollateFnType
class FAQEncoder(Encoder):
def \_\_init\_\_(self, transformer, pooling):
super().\_\_init\_\_()
self.transformer = transformer
self.pooling = pooling
self.encoder = nn.Sequential(self.transformer, self.pooling)
@property
def trainable(self) -\> bool:
# Defines if we want to train encoder itself, or head layer only
return False
@property
def embedding\_size(self) -\> int:
return self.transformer.get\_word\_embedding\_dimension()
def forward(self, batch: TensorInterchange) -\> Tensor:
return self.encoder(batch)["sentence\_embedding"]
def get\_collate\_fn(self) -\> CollateFnType:
return self.transformer.tokenize
@staticmethod
def \_transformer\_path(path: str):
return os.path.join(path, "transformer")
@staticmethod
def \_pooling\_path(path: str):
return os.path.join(path, "pooling")
def save(self, output\_path: str):
transformer\_path = self.\_transformer\_path(output\_path)
os.makedirs(transformer\_path, exist\_ok=True)
pooling\_path = self.\_pooling\_path(output\_path)
os.makedirs(pooling\_path, exist\_ok=True)
self.transformer.save(transformer\_path)
self.pooling.save(pooling\_path)
@classmethod
def load(cls, input\_path: str) -\> Encoder:
transformer = Transformer.load(cls.\_transformer\_path(input\_path))
pooling = Pooling.load(cls.\_pooling\_path(input\_path))
return cls(transformer=transformer, pooling=pooling)
`
```
As you can notice, there are more methods implemented, then we&rsquo;ve already discussed. Let&rsquo;s go
through them now!
* In `\_\_init\_\_` we register our pre-trained layers, similar as you do in [torch.nn.Module](https://pytorch.org/docs/stable/generated/torch.nn.Module.html) descendant.
* `trainable` defines whether current `Encoder` layers should be updated during training or not. If `trainable=False`, then all layers will be frozen.
* `embedding\_size` is a size of encoder&rsquo;s output, it is required for proper `head` configuration.
* `get\_collate\_fn` is a tricky one. Here you should return a method which prepares a batch of raw
data into the input, suitable for the encoder. If `get\_collate\_fn` is not overridden, then the [default\_collate](https://pytorch.org/docs/stable/data.html#torch.utils.data.default_collate) will be used.
The remaining methods are considered self-describing.
As our encoder is ready, we now are able to fill `configure\_encoders`.
Just insert the following code into `model.py`:
```
`...
from sentence\_transformers import SentenceTransformer
from sentence\_transformers.models import Transformer, Pooling
from faq.encoder import FAQEncoder
class FAQModel(TrainableModel):
...
def configure\_encoders(self) -\> Union[Encoder, Dict[str, Encoder]]:
pre\_trained\_model = SentenceTransformer("all-MiniLM-L6-v2")
transformer: Transformer = pre\_trained\_model[0]
pooling: Pooling = pre\_trained\_model[1]
encoder = FAQEncoder(transformer, pooling)
return encoder
`
```
### Data preparation
Okay, we have raw data and a trainable model. But we don&rsquo;t know yet how to feed this data to our model.
Currently, Quaterion takes two types of similarity representation - pairs and groups.
The groups format assumes that all objects split into groups of similar objects. All objects inside
one group are similar, and all other objects outside this group considered dissimilar to them.
But in the case of pairs, we can only assume similarity between explicitly specified pairs of objects.
We can apply any of the approaches with our data, but pairs one seems more intuitive.
The format in which Similarity is represented determines which loss can be used.
For example, *ContrastiveLoss* and *MultipleNegativesRankingLoss* works with pairs format.
[SimilarityPairSample](https://quaterion.qdrant.tech/quaterion.dataset.similarity_samples.html#quaterion.dataset.similarity_samples.SimilarityPairSample) could be used to represent pairs.
Let&rsquo;s take a look at it:
```
`@dataclass
class SimilarityPairSample:
obj\_a: Any
obj\_b: Any
score: float = 1.0
subgroup: int = 0
`
```
Here might be some questions: what `score` and `subgroup` are?
Well, `score` is a measure of expected samples similarity.
If you only need to specify if two samples are similar or not, you can use `1.0` and `0.0` respectively.
`subgroups` parameter is required for more granular description of what negative examples could be.
By default, all pairs belong the subgroup zero.
That means that we would need to specify all negative examples manually.
But in most cases, we can avoid this by enabling different subgroups.
All objects from different subgroups will be considered as negative examples in loss, and thus it
provides a way to set negative examples implicitly.
With this knowledge, we now can create our `Dataset` class in `dataset.py` to feed our model:
```
`import json
from typing import List, Dict
from torch.utils.data import Dataset
from quaterion.dataset.similarity\_samples import SimilarityPairSample
class FAQDataset(Dataset):
"""Dataset class to process .jsonl files with FAQ from popular cloud providers."""
def \_\_init\_\_(self, dataset\_path):
self.dataset: List[Dict[str, str]] = self.read\_dataset(dataset\_path)
def \_\_getitem\_\_(self, index) -\> SimilarityPairSample:
line = self.dataset[index]
question = line["question"]
# All questions have a unique subgroup
# Meaning that all other answers are considered negative pairs
subgroup = hash(question)
return SimilarityPairSample(
obj\_a=question,
obj\_b=line["answer"],
score=1,
subgroup=subgroup
)
def \_\_len\_\_(self):
return len(self.dataset)
@staticmethod
def read\_dataset(dataset\_path) -\> List[Dict[str, str]]:
"""Read jsonl-file into a memory."""
with open(dataset\_path, "r") as fd:
return [json.loads(json\_line) for json\_line in fd]
`
```
We assigned a unique subgroup for each question, so all other objects which have different question will be considered as negative examples.
### Evaluation Metric
We still haven&rsquo;t added any metrics to the model. For this purpose Quaterion provides `configure\_metrics`.
We just need to override it and attach interested metrics.
Quaterion has some popular retrieval metrics implemented - such as *precision @ k* or *mean reciprocal rank*.
They can be found in [quaterion.eval](https://quaterion.qdrant.tech/quaterion.eval.html) package.
But there are just a few metrics, it is assumed that desirable ones will be made by user or taken from another libraries.
You will probably need to inherit from `PairMetric` or `GroupMetric` to implement a new one.
In `configure\_metrics` we need to return a list of `AttachedMetric`.
They are just wrappers around metric instances and helps to log metrics more easily.
Under the hood `logging` is handled by `pytorch-lightning`.
You can configure it as you want - pass required parameters as keyword arguments to `AttachedMetric`.
For additional info visit [logging documentation page](https://pytorch-lightning.readthedocs.io/en/stable/extensions/logging.html)
Let&rsquo;s add mentioned metrics for our `FAQModel`.
Add this code to `model.py`:
```
`...
from quaterion.eval.pair import RetrievalPrecision, RetrievalReciprocalRank
from quaterion.eval.attached\_metric import AttachedMetric
class FAQModel(TrainableModel):
def \_\_init\_\_(self, lr=10e-5, \*args, \*\*kwargs):
self.lr = lr
super().\_\_init\_\_(\*args, \*\*kwargs)
...
def configure\_metrics(self):
return [
AttachedMetric(
"RetrievalPrecision",
RetrievalPrecision(k=1),
prog\_bar=True,
on\_epoch=True,
),
AttachedMetric(
"RetrievalReciprocalRank",
RetrievalReciprocalRank(),
prog\_bar=True,
on\_epoch=True
),
]
`
```
### Fast training with Cache
Quaterion has one more cherry on top of the cake when it comes to non-trainable encoders.
If encoders are frozen, they are deterministic and emit the exact embeddings for the same input data on each epoch.
It provides a way to avoid repeated calculations and reduce training time.
For this purpose Quaterion has a cache functionality.
Before training starts, the cache runs one epoch to pre-calculate all embeddings with frozen encoders and then store them on a device you chose (currently CPU or GPU).
Everything you need is to define which encoders are trainable or not and set cache settings.
And that&rsquo;s it: everything else Quaterion will handle for you.
To configure cache you need to override `configure\_cache` method in `TrainableModel`.
This method should return an instance of [CacheConfig](https://quaterion.qdrant.tech/quaterion.train.cache.cache_config.html#quaterion.train.cache.cache_config.CacheConfig).
Let&rsquo;s add cache to our model:
```
`...
from quaterion.train.cache import CacheConfig, CacheType
...
class FAQModel(TrainableModel):
...
def configure\_caches(self) -\> Optional[CacheConfig]:
return CacheConfig(CacheType.AUTO)
...
`
```
[CacheType](https://quaterion.qdrant.tech/quaterion.train.cache.cache_config.html#quaterion.train.cache.cache_config.CacheType) determines how the cache will be stored in memory.
### Training
Now we need to combine all our code together in `train.py` and launch a training process.
```
`import torch
import pytorch\_lightning as pl
from quaterion import Quaterion
from quaterion.dataset import PairsSimilarityDataLoader
from faq.dataset import FAQDataset
def train(model, train\_dataset\_path, val\_dataset\_path, params):
use\_gpu = params.get("cuda", torch.cuda.is\_available())
trainer = pl.Trainer(
min\_epochs=params.get("min\_epochs", 1),
max\_epochs=params.get("max\_epochs", 500),
auto\_select\_gpus=use\_gpu,
log\_every\_n\_steps=params.get("log\_every\_n\_steps", 1),
gpus=int(use\_gpu),
)
train\_dataset = FAQDataset(train\_dataset\_path)
val\_dataset = FAQDataset(val\_dataset\_path)
train\_dataloader = PairsSimilarityDataLoader(
train\_dataset, batch\_size=1024
)
val\_dataloader = PairsSimilarityDataLoader(
val\_dataset, batch\_size=1024
)
Quaterion.fit(model, trainer, train\_dataloader, val\_dataloader)
if \_\_name\_\_ == "\_\_main\_\_":
import os
from pytorch\_lightning import seed\_everything
from faq.model import FAQModel
from faq.config import DATA\_DIR, ROOT\_DIR
seed\_everything(42, workers=True)
faq\_model = FAQModel()
train\_path = os.path.join(
DATA\_DIR,
"train\_cloud\_faq\_dataset.jsonl"
)
val\_path = os.path.join(
DATA\_DIR,
"val\_cloud\_faq\_dataset.jsonl"
)
train(faq\_model, train\_path, val\_path, {})
faq\_model.save\_servable(os.path.join(ROOT\_DIR, "servable"))
`
```
Here are a couple of unseen classes, `PairsSimilarityDataLoader`, which is a native dataloader for
`SimilarityPairSample` objects, and `Quaterion` is an entry point to the training process.
### Dataset-wise evaluation
Up to this moment we&rsquo;ve calculated only batch-wise metrics.
Such metrics can fluctuate a lot depending on a batch size and can be misleading.
It might be helpful if we can calculate a metric on a whole dataset or some large part of it.
Raw data may consume a huge amount of memory, and usually we can&rsquo;t fit it into one batch.
Embeddings, on the contrary, most probably will consume less.
That&rsquo;s where `Evaluator` enters the scene.
At first, having dataset of `SimilaritySample`, `Evaluator` encodes it via `SimilarityModel` and compute corresponding labels.
After that, it calculates a metric value, which could be more representative than batch-wise ones.
However, you still can find yourself in a situation where evaluation becomes too slow, or there is no enough space left in the memory.
A bottleneck might be a squared distance matrix, which one needs to calculate to compute a retrieval metric.
You can mitigate this bottleneck by calculating a rectangle matrix with reduced size.
`Evaluator` accepts `sampler` with a sample size to select only specified amount of embeddings.
If sample size is not specified, evaluation is performed on all embeddings.
Fewer words! Let&rsquo;s add evaluator to our code and finish `train.py`.
```
`...
from quaterion.eval.evaluator import Evaluator
from quaterion.eval.pair import RetrievalReciprocalRank, RetrievalPrecision
from quaterion.eval.samplers.pair\_sampler import PairSampler
...
def train(model, train\_dataset\_path, val\_dataset\_path, params):
...
metrics = {
"rrk": RetrievalReciprocalRank(),
"rp@1": RetrievalPrecision(k=1)
}
sampler = PairSampler()
evaluator = Evaluator(metrics, sampler)
results = Quaterion.evaluate(evaluator, val\_dataset, model.model)
print(f"results: {results}")
`
```
### Train Results
At this point we can train our model, I do it via `python3 -m faq.train`.
|epoch|train\_precision@1|train\_reciprocal\_rank|val\_precision@1|val\_reciprocal\_rank|
|0|0.650|0.732|0.659|0.741|
|100|0.665|0.746|0.673|0.754|
|200|0.677|0.757|0.682|0.763|
|300|0.686|0.765|0.688|0.768|
|400|0.695|0.772|0.694|0.773|
|500|0.701|0.778|0.700|0.777|
Results obtained with `Evaluator`:
|precision@1|reciprocal\_rank|
|0.577|0.675|
After training all the metrics have been increased.
And this training was done in just 3 minutes on a single gpu!
There is no overfitting and the results are steadily growing, although I think there is still room for improvement and experimentation.
## Model serving
As you could already notice, Quaterion framework is split into two separate libraries: `quaterion`
and [quaterion-models](https://quaterion-models.qdrant.tech/).
The former one contains training related stuff like losses, cache, `pytorch-lightning` dependency, etc.
While the latter one contains only modules necessary for serving: encoders, heads and `SimilarityModel` itself.
The reasons for this separation are:
* less amount of entities you need to operate in a production environment
* reduced memory footprint
It is essential to isolate training dependencies from the serving environment cause the training step is usually more complicated.
Training dependencies are quickly going out of control, significantly slowing down the deployment and serving timings and increasing unnecessary resource usage.
The very last row of `train.py` - `faq\_model.save\_servable(...)` saves encoders and the model in a fashion that eliminates all Quaterion dependencies and stores only the most necessary data to run a model in production.
In `serve.py` we load and encode all the answers and then look for the closest vectors to the questions we are interested in:
```
`import os
import json
import torch
from quaterion\_models.model import SimilarityModel
from quaterion.distances import Distance
from faq.config import DATA\_DIR, ROOT\_DIR
if \_\_name\_\_ == "\_\_main\_\_":
device = "cuda:0" if torch.cuda.is\_available() else "cpu"
model = SimilarityModel.load(os.path.join(ROOT\_DIR, "servable"))
model.to(device)
dataset\_path = os.path.join(DATA\_DIR, "val\_cloud\_faq\_dataset.jsonl")
with open(dataset\_path) as fd:
answers = [json.loads(json\_line)["answer"] for json\_line in fd]
# everything is ready, let's encode our answers
answer\_embeddings = model.encode(answers, to\_numpy=False)
# Some prepared questions and answers to ensure that our model works as intended
questions = [
"what is the pricing of aws lambda functions powered by aws graviton2 processors?",
"can i run a cluster or job for a long time?",
"what is the dell open manage system administrator suite (omsa)?",
"what are the differences between the event streams standard and event streams enterprise plans?",
]
ground\_truth\_answers = [
"aws lambda functions powered by aws graviton2 processors are 20% cheaper compared to x86-based lambda functions",
"yes, you can run a cluster for as long as is required",
"omsa enables you to perform certain hardware configuration tasks and to monitor the hardware directly via the operating system",
"to find out more information about the different event streams plans, see choosing your plan",
]
# encode our questions and find the closest to them answer embeddings
question\_embeddings = model.encode(questions, to\_numpy=False)
distance = Distance.get\_by\_name(Distance.COSINE)
question\_answers\_distances = distance.distance\_matrix(
question\_embeddings, answer\_embeddings
)
answers\_indices = question\_answers\_distances.min(dim=1)[1]
for q\_ind, a\_ind in enumerate(answers\_indices):
print("Q:", questions[q\_ind])
print("A:", answers[a\_ind], end="\\n\\n")
assert (
answers[a\_ind] == ground\_truth\_answers[q\_ind]
), f"\<{answers[a\_ind]}\> != \<{ground\_truth\_answers[q\_ind]}\>"
`
```
We stored our collection of answer embeddings in memory and perform search directly in Python.
For production purposes, it&rsquo;s better to use some sort of vector search engine like [Qdrant](https://github.com/qdrant/qdrant).
It provides durability, speed boost, and a bunch of other features.
So far, we&rsquo;ve implemented a whole training process, prepared model for serving and even applied a
trained model today with `Quaterion`.
Thank you for your time and attention!
I hope you enjoyed this huge tutorial and will use `Quaterion` for your similarity learning projects.
All ready to use code can be found [here](https://github.com/qdrant/demo-cloud-faq/tree/tutorial).
Stay tuned!:)
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/faq-question-answering.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/faq-question-answering/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/faq-question-answering.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)