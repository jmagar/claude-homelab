Search reranking with cross-encoders
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
Jun 28, 2023
# Search reranking with cross-encoders
[ CJ ](https://twitter.com/colintjarvis)
[ Colin Jarvis
(OpenAI)
](https://twitter.com/colintjarvis)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/examples/Search_reranking_with_cross-encoders.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/examples/Search_reranking_with_cross-encoders.ipynb)
This notebook takes you through examples of using a cross-encoder to re-rank search results.
This is a common use case with our customers, where you’ve implemented semantic search using embeddings (produced using a [bi-encoder](https://www.sbert.net/examples/applications/retrieve_rerank/README.html#retrieval-bi-encoder)) but the results are not as accurate as your use case requires. A possible cause is that there is some business rule you can use to rerank the documents such as how recent or how popular a document is.
However, often there are subtle domain-specific rules that help determine relevancy, and this is where a cross-encoder can be useful. Cross-encoders are more accurate than bi-encoders but they don’t scale well, so using them to re-order a shortened list returned by semantic search is the ideal use case.
### Example
Consider a search task with D documents and Q queries.
The brute force approach of computing every pairwise relevance is expensive; its cost scales as `D \* Q`. This is known as **cross-encoding**.
A faster approach is **embeddings-based search**, in which an embedding is computed once for each document and query, and then re-used multiple times to cheaply compute pairwise relevance. Because embeddings are only computed once, its cost scales as `D + Q`. This is known as **bi-encoding**.
Although embeddings-based search is faster, the quality can be worse. To get the best of both, one common approach is to use embeddings (or another bi-encoder) to cheaply identify top candidates, and then use GPT (or another cross-encoder) to expensively re-rank those top candidates. The cost of this hybrid approach scales as `(D + Q) \* cost of embedding + (N \* Q) \* cost of re-ranking`, where `N` is the number of candidates re-ranked.
### Walkthrough
To illustrate this approach we’ll use `text-davinci-003` with `logprobs` enabled to build a GPT-powered cross-encoder. Our GPT models have strong general language understanding, which when tuned with some few-shot examples can provide a simple and effective cross-encoding option.
This notebook drew on this great [article](https://weaviate.io/blog/cross-encoders-as-reranker) by Weaviate, and this [excellent explanation](https://www.sbert.net/examples/applications/cross-encoder/README.html) of bi-encoders vs. cross-encoders from Sentence Transformers.
```
`!pip install openai
!pip install arxiv
!pip install tenacity
!pip install pandas
!pip install tiktoken`
```
```
`import arxiv
from math import exp
import openai
import os
import pandas as pd
from tenacity import retry, wait\_random\_exponential, stop\_after\_attempt
import tiktoken
client = OpenAI(api\_key=os.environ.get("OPENAI\_API\_KEY", "\<your OpenAI API key if not set as env var\>"))
OPENAI\_MODEL = "gpt-4"`
```
## Search
We’ll use the arXiv search service for this example, but this step could be performed by any search service you have. The key item to consider is over-fetching slightly to capture all the potentially relevant documents, before re-sorting them.
```
`query = "how do bi-encoders work for sentence embeddings"
search = arxiv.Search(
query=query, max\_results=20, sort\_by=arxiv.SortCriterion.Relevance
)`
```
```
`result\_list = []
for result in search.results():
result\_dict = {}
result\_dict.update({"title": result.title})
result\_dict.update({"summary": result.summary})
# Taking the first url provided
result\_dict.update({"article\_url": [x.href for x in result.links][0]})
result\_dict.update({"pdf\_url": [x.href for x in result.links][1]})
result\_list.append(result\_dict)`
```
```
`result\_list[0]`
```
```
`{'title': 'SBERT studies Meaning Representations: Decomposing Sentence Embeddings into Explainable Semantic Features',
'summary': 'Models based on large-pretrained language models, such as S(entence)BERT,\\nprovide effective and efficient sentence embeddings that show high correlation\\nto human similarity ratings, but lack interpretability. On the other hand,\\ngraph metrics for graph-based meaning representations (e.g., Abstract Meaning\\nRepresentation, AMR) can make explicit the semantic aspects in which two\\nsentences are similar. However, such metrics tend to be slow, rely on parsers,\\nand do not reach state-of-the-art performance when rating sentence similarity.\\n In this work, we aim at the best of both worlds, by learning to induce\\n$S$emantically $S$tructured $S$entence BERT embeddings (S$^3$BERT). Our\\nS$^3$BERT embeddings are composed of explainable sub-embeddings that emphasize\\nvarious semantic sentence features (e.g., semantic roles, negation, or\\nquantification). We show how to i) learn a decomposition of the sentence\\nembeddings into semantic features, through approximation of a suite of\\ninterpretable AMR graph metrics, and how to ii) preserve the overall power of\\nthe neural embeddings by controlling the decomposition learning process with a\\nsecond objective that enforces consistency with the similarity ratings of an\\nSBERT teacher model. In our experimental studies, we show that our approach\\noffers interpretability -- while fully preserving the effectiveness and\\nefficiency of the neural sentence embeddings.',
'article\_url': 'http://arxiv.org/abs/2206.07023v2',
'pdf\_url': 'http://arxiv.org/pdf/2206.07023v2'}`
```
```
`for i, result in enumerate(result\_list):
print(f"{i + 1}: {result['title']}")`
```
```
`1: SBERT studies Meaning Representations: Decomposing Sentence Embeddings into Explainable Semantic Features
2: Are Classes Clusters?
3: Semantic Composition in Visually Grounded Language Models
4: Evaluating the Construct Validity of Text Embeddings with Application to Survey Questions
5: Learning Probabilistic Sentence Representations from Paraphrases
6: Exploiting Twitter as Source of Large Corpora of Weakly Similar Pairs for Semantic Sentence Embeddings
7: How to Probe Sentence Embeddings in Low-Resource Languages: On Structural Design Choices for Probing Task Evaluation
8: Clustering and Network Analysis for the Embedding Spaces of Sentences and Sub-Sentences
9: Vec2Sent: Probing Sentence Embeddings with Natural Language Generation
10: Non-Linguistic Supervision for Contrastive Learning of Sentence Embeddings
11: SentPWNet: A Unified Sentence Pair Weighting Network for Task-specific Sentence Embedding
12: Learning Joint Representations of Videos and Sentences with Web Image Search
13: Character-based Neural Networks for Sentence Pair Modeling
14: Train Once, Test Anywhere: Zero-Shot Learning for Text Classification
15: Hierarchical GPT with Congruent Transformers for Multi-Sentence Language Models
16: Sentence-T5: Scalable Sentence Encoders from Pre-trained Text-to-Text Models
17: In Search for Linear Relations in Sentence Embedding Spaces
18: Learning to Borrow -- Relation Representation for Without-Mention Entity-Pairs for Knowledge Graph Completion
19: Efficient and Flexible Topic Modeling using Pretrained Embeddings and Bag of Sentences
20: Relational Sentence Embedding for Flexible Semantic Matching`
```
## Cross-encoder
We’ll create a cross-encoder using the `Completions` endpoint - the key factors to consider here are:
* Make your examples domain-specific - the strength of cross-encoders comes when you tailor them to your domain.
* There is a trade-off between how many potential examples to re-rank vs. processing speed. Consider batching and parallel processing cross-encoder requests to process them more quickly.
The steps here are:
* Build a prompt to assess relevance and provide few-shot examples to tune it to your domain.
* Add a `logit bias` for the tokens for ` Yes` and ` No` to decrease the likelihood of any other tokens occurring.
* Return the classification of yes/no as well as the `logprobs`.
* Rerank the results by the `logprobs` keyed on ` Yes`.
```
`tokens = [" Yes", " No"]
tokenizer = tiktoken.encoding\_for\_model(OPENAI\_MODEL)
ids = [tokenizer.encode(token) for token in tokens]
ids[0], ids[1]`
```
```
`([3363], [1400])`
```
```
`prompt = '''
You are an Assistant responsible for helping detect whether the retrieved document is relevant to the query. For a given input, you need to output a single token: "Yes" or "No" indicating the retrieved document is relevant to the query.
Query: How to plant a tree?
Document: """Cars were invented in 1886, when German inventor Carl Benz patented his Benz Patent-Motorwagen.[3][4][5] Cars became widely available during the 20th century. One of the first cars affordable by the masses was the 1908 Model T, an American car manufactured by the Ford Motor Company. Cars were rapidly adopted in the US, where they replaced horse-drawn carriages.[6] In Europe and other parts of the world, demand for automobiles did not increase until after World War II.[7] The car is considered an essential part of the developed economy."""
Relevant: No
Query: Has the coronavirus vaccine been approved?
Document: """The Pfizer-BioNTech COVID-19 vaccine was approved for emergency use in the United States on December 11, 2020."""
Relevant: Yes
Query: What is the capital of France?
Document: """Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine. Beyond such landmarks as the Eiffel Tower and the 12th-century, Gothic Notre-Dame cathedral, the city is known for its cafe culture and designer boutiques along the Rue du Faubourg Saint-Honoré."""
Relevant: Yes
Query: What are some papers to learn about PPO reinforcement learning?
Document: """Proximal Policy Optimization and its Dynamic Version for Sequence Generation: In sequence generation task, many works use policy gradient for model optimization to tackle the intractable backpropagation issue when maximizing the non-differentiable evaluation metrics or fooling the discriminator in adversarial learning. In this paper, we replace policy gradient with proximal policy optimization (PPO), which is a proved more efficient reinforcement learning algorithm, and propose a dynamic approach for PPO (PPO-dynamic). We demonstrate the efficacy of PPO and PPO-dynamic on conditional sequence generation tasks including synthetic experiment and chit-chat chatbot. The results show that PPO and PPO-dynamic can beat policy gradient by stability and performance."""
Relevant: Yes
Query: Explain sentence embeddings
Document: """Inside the bubble: exploring the environments of reionisation-era Lyman-α emitting galaxies with JADES and FRESCO: We present a study of the environments of 16 Lyman-α emitting galaxies (LAEs) in the reionisation era (5.8\<z\<8) identified by JWST/NIRSpec as part of the JWST Advanced Deep Extragalactic Survey (JADES). Unless situated in sufficiently (re)ionised regions, Lyman-α emission from these galaxies would be strongly absorbed by neutral gas in the intergalactic medium (IGM). We conservatively estimate sizes of the ionised regions required to reconcile the relatively low Lyman-α velocity offsets (ΔvLyα\<300kms−1) with moderately high Lyman-α escape fractions (fesc,Lyα\>5%) observed in our sample of LAEs, indicating the presence of ionised ``bubbles'' with physical sizes of the order of 0.1pMpc≲Rion≲1pMpc in a patchy reionisation scenario where the bubbles are embedded in a fully neutral IGM. Around half of the LAEs in our sample are found to coincide with large-scale galaxy overdensities seen in FRESCO at z∼5.8-5.9 and z∼7.3, suggesting Lyman-α transmission is strongly enhanced in such overdense regions, and underlining the importance of LAEs as tracers of the first large-scale ionised bubbles. Considering only spectroscopically confirmed galaxies, we find our sample of UV-faint LAEs (MUV≳−20mag) and their direct neighbours are generally not able to produce the required ionised regions based on the Lyman-α transmission properties, suggesting lower-luminosity sources likely play an important role in carving out these bubbles. These observations demonstrate the combined power of JWST multi-object and slitless spectroscopy in acquiring a unique view of the early stages of Cosmic Reionisation via the most distant LAEs."""
Relevant: No
Query: {query}
Document: """{document}"""
Relevant:
'''
@retry(wait=wait\_random\_exponential(min=1, max=40), stop=stop\_after\_attempt(3))
def document\_relevance(query, document):
response = openai.chat.completions.create(
model="text-davinci-003",
message=prompt.format(query=query, document=document),
temperature=0,
logprobs=True,
logit\_bias={3363: 1, 1400: 1},
)
return (
query,
document,
response.choices[0].message.content,
response.choices[0].logprobs.token\_logprobs[0],
)`
```
```
`content = result\_list[0]["title"] + ": " + result\_list[0]["summary"]
# Set logprobs to 1 so our response will include the most probable token the model identified
response = openai.chat.completions.create(
model=OPENAI\_MODEL,
prompt=prompt.format(query=query, document=content),
temperature=0,
logprobs=1,
logit\_bias={3363: 1, 1400: 1},
max\_tokens=1,
)`
```
```
`result = response.choices[0]
print(f"Result was {result.message.content}")
print(f"Logprobs was {result.logprobs.token\_logprobs[0]}")
print("\\nBelow is the full logprobs object\\n\\n")
print(result["logprobs"])`
```
```
`Result was Yes
Logprobs was -0.05869877
Below is the full logprobs object
{
"tokens": [
"Yes"
],
"token\_logprobs": [
-0.05869877
],
"top\_logprobs": [
{
"Yes": -0.05869877
}
],
"text\_offset": [
5764
]
}`
```
```
`output\_list = []
for x in result\_list:
content = x["title"] + ": " + x["summary"]
try:
output\_list.append(document\_relevance(query, document=content))
except Exception as e:
print(e)`
```
```
`output\_list[:10]`
```
```
`[('how do bi-encoders work for sentence embeddings',
'SBERT studies Meaning Representations: Decomposing Sentence Embeddings into Explainable Semantic Features: Models based on large-pretrained language models, such as S(entence)BERT,\\nprovide effective and efficient sentence embeddings that show high correlation\\nto human similarity ratings, but lack interpretability. On the other hand,\\ngraph metrics for graph-based meaning representations (e.g., Abstract Meaning\\nRepresentation, AMR) can make explicit the semantic aspects in which two\\nsentences are similar. However, such metrics tend to be slow, rely on parsers,\\nand do not reach state-of-the-art performance when rating sentence similarity.\\n In this work, we aim at the best of both worlds, by learning to induce\\n$S$emantically $S$tructured $S$entence BERT embeddings (S$^3$BERT). Our\\nS$^3$BERT embeddings are composed of explainable sub-embeddings that emphasize\\nvarious semantic sentence features (e.g., semantic roles, negation, or\\nquantification). We show how to i) learn a decomposition of the sentence\\nembeddings into semantic features, through approximation of a suite of\\ninterpretable AMR graph metrics, and how to ii) preserve the overall power of\\nthe neural embeddings by controlling the decomposition learning process with a\\nsecond objective that enforces consistency with the similarity ratings of an\\nSBERT teacher model. In our experimental studies, we show that our approach\\noffers interpretability -- while fully preserving the effectiveness and\\nefficiency of the neural sentence embeddings.',
'Yes',
-0.05326408),
('how do bi-encoders work for sentence embeddings',
'Are Classes Clusters?: Sentence embedding models aim to provide general purpose embeddings for\\nsentences. Most of the models studied in this paper claim to perform well on\\nSTS tasks - but they do not report on their suitability for clustering. This\\npaper looks at four recent sentence embedding models (Universal Sentence\\nEncoder (Cer et al., 2018), Sentence-BERT (Reimers and Gurevych, 2019), LASER\\n(Artetxe and Schwenk, 2019), and DeCLUTR (Giorgi et al., 2020)). It gives a\\nbrief overview of the ideas behind their implementations. It then investigates\\nhow well topic classes in two text classification datasets (Amazon Reviews (Ni\\net al., 2019) and News Category Dataset (Misra, 2018)) map to clusters in their\\ncorresponding sentence embedding space. While the performance of the resulting\\nclassification model is far from perfect, it is better than random. This is\\ninteresting because the classification model has been constructed in an\\nunsupervised way. The topic classes in these real life topic classification\\ndatasets can be partly reconstructed by clustering the corresponding sentence\\nembeddings.',
'No',
-0.009535169),
('how do bi-encoders work for sentence embeddings',
"Semantic Composition in Visually Grounded Language Models: What is sentence meaning and its ideal representation? Much of the expressive\\npower of human language derives from semantic composition, the mind's ability\\nto represent meaning hierarchically & relationally over constituents. At the\\nsame time, much sentential meaning is outside the text and requires grounding\\nin sensory, motor, and experiential modalities to be adequately learned.\\nAlthough large language models display considerable compositional ability,\\nrecent work shows that visually-grounded language models drastically fail to\\nrepresent compositional structure. In this thesis, we explore whether & how\\nmodels compose visually grounded semantics, and how we might improve their\\nability to do so.\\n Specifically, we introduce 1) WinogroundVQA, a new compositional visual\\nquestion answering benchmark, 2) Syntactic Neural Module Distillation, a\\nmeasure of compositional ability in sentence embedding models, 3) Causal\\nTracing for Image Captioning Models to locate neural representations vital for\\nvision-language composition, 4) Syntactic MeanPool to inject a compositional\\ninductive bias into sentence embeddings, and 5) Cross-modal Attention\\nCongruence Regularization, a self-supervised objective function for\\nvision-language relation alignment. We close by discussing connections of our\\nwork to neuroscience, psycholinguistics, formal semantics, and philosophy.",
'No',
-0.008887106),
('how do bi-encoders work for sentence embeddings',
"Evaluating the Construct Validity of Text Embeddings with Application to Survey Questions: Text embedding models from Natural Language Processing can map text data\\n(e.g. words, sentences, documents) to supposedly meaningful numerical\\nrepresentations (a.k.a. text embeddings). While such models are increasingly\\napplied in social science research, one important issue is often not addressed:\\nthe extent to which these embeddings are valid representations of constructs\\nrelevant for social science research. We therefore propose the use of the\\nclassic construct validity framework to evaluate the validity of text\\nembeddings. We show how this framework can be adapted to the opaque and\\nhigh-dimensional nature of text embeddings, with application to survey\\nquestions. We include several popular text embedding methods (e.g. fastText,\\nGloVe, BERT, Sentence-BERT, Universal Sentence Encoder) in our construct\\nvalidity analyses. We find evidence of convergent and discriminant validity in\\nsome cases. We also show that embeddings can be used to predict respondent's\\nanswers to completely new survey questions. Furthermore, BERT-based embedding\\ntechniques and the Universal Sentence Encoder provide more valid\\nrepresentations of survey questions than do others. Our results thus highlight\\nthe necessity to examine the construct validity of text embeddings before\\ndeploying them in social science research.",
'No',
-0.008583762),
('how do bi-encoders work for sentence embeddings',
'Learning Probabilistic Sentence Representations from Paraphrases: Probabilistic word embeddings have shown effectiveness in capturing notions\\nof generality and entailment, but there is very little work on doing the\\nanalogous type of investigation for sentences. In this paper we define\\nprobabilistic models that produce distributions for sentences. Our\\nbest-performing model treats each word as a linear transformation operator\\napplied to a multivariate Gaussian distribution. We train our models on\\nparaphrases and demonstrate that they naturally capture sentence specificity.\\nWhile our proposed model achieves the best performance overall, we also show\\nthat specificity is represented by simpler architectures via the norm of the\\nsentence vectors. Qualitative analysis shows that our probabilistic model\\ncaptures sentential entailment and provides ways to analyze the specificity and\\npreciseness of individual words.',
'No',
-0.011975748),
('how do bi-encoders work for sentence embeddings',
"Exploiting Twitter as Source of Large Corpora of Weakly Similar Pairs for Semantic Sentence Embeddings: Semantic sentence embeddings are usually supervisedly built minimizing\\ndistances between pairs of embeddings of sentences labelled as semantically\\nsimilar by annotators. Since big labelled datasets are rare, in particular for\\nnon-English languages, and expensive, recent studies focus on unsupervised\\napproaches that require not-paired input sentences. We instead propose a\\nlanguage-independent approach to build large datasets of pairs of informal\\ntexts weakly similar, without manual human effort, exploiting Twitter's\\nintrinsic powerful signals of relatedness: replies and quotes of tweets. We use\\nthe collected pairs to train a Transformer model with triplet-like structures,\\nand we test the generated embeddings on Twitter NLP similarity tasks (PIT and\\nTURL) and STSb. We also introduce four new sentence ranking evaluation\\nbenchmarks of informal texts, carefully extracted from the initial collections\\nof tweets, proving not only that our best model learns classical Semantic\\nTextual Similarity, but also excels on tasks where pairs of sentences are not\\nexact paraphrases. Ablation studies reveal how increasing the corpus size\\ninfluences positively the results, even at 2M samples, suggesting that bigger\\ncollections of Tweets still do not contain redundant information about semantic\\nsimilarities.",
'No',
-0.01219046),
('how do bi-encoders work for sentence embeddings',
"How to Probe Sentence Embeddings in Low-Resource Languages: On Structural Design Choices for Probing Task Evaluation: Sentence encoders map sentences to real valued vectors for use in downstream\\napplications. To peek into these representations - e.g., to increase\\ninterpretability of their results - probing tasks have been designed which\\nquery them for linguistic knowledge. However, designing probing tasks for\\nlesser-resourced languages is tricky, because these often lack large-scale\\nannotated data or (high-quality) dependency parsers as a prerequisite of\\nprobing task design in English. To investigate how to probe sentence embeddings\\nin such cases, we investigate sensitivity of probing task results to structural\\ndesign choices, conducting the first such large scale study. We show that\\ndesign choices like size of the annotated probing dataset and type of\\nclassifier used for evaluation do (sometimes substantially) influence probing\\noutcomes. We then probe embeddings in a multilingual setup with design choices\\nthat lie in a 'stable region', as we identify for English, and find that\\nresults on English do not transfer to other languages. Fairer and more\\ncomprehensive sentence-level probing evaluation should thus be carried out on\\nmultiple languages in the future.",
'No',
-0.015550519),
('how do bi-encoders work for sentence embeddings',
'Clustering and Network Analysis for the Embedding Spaces of Sentences and Sub-Sentences: Sentence embedding methods offer a powerful approach for working with short\\ntextual constructs or sequences of words. By representing sentences as dense\\nnumerical vectors, many natural language processing (NLP) applications have\\nimproved their performance. However, relatively little is understood about the\\nlatent structure of sentence embeddings. Specifically, research has not\\naddressed whether the length and structure of sentences impact the sentence\\nembedding space and topology. This paper reports research on a set of\\ncomprehensive clustering and network analyses targeting sentence and\\nsub-sentence embedding spaces. Results show that one method generates the most\\nclusterable embeddings. In general, the embeddings of span sub-sentences have\\nbetter clustering properties than the original sentences. The results have\\nimplications for future sentence embedding models and applications.',
'No',
-0.012663184),
('how do bi-encoders work for sentence embeddings',
'Vec2Sent: Probing Sentence Embeddings with Natural Language Generation: We introspect black-box sentence embeddings by conditionally generating from\\nthem with the objective to retrieve the underlying discrete sentence. We\\nperceive of this as a new unsupervised probing task and show that it correlates\\nwell with downstream task performance. We also illustrate how the language\\ngenerated from different encoders differs. We apply our approach to generate\\nsentence analogies from sentence embeddings.',
'Yes',
-0.004863006),
('how do bi-encoders work for sentence embeddings',
'Non-Linguistic Supervision for Contrastive Learning of Sentence Embeddings: Semantic representation learning for sentences is an important and\\nwell-studied problem in NLP. The current trend for this task involves training\\na Transformer-based sentence encoder through a contrastive objective with text,\\ni.e., clustering sentences with semantically similar meanings and scattering\\nothers. In this work, we find the performance of Transformer models as sentence\\nencoders can be improved by training with multi-modal multi-task losses, using\\nunpaired examples from another modality (e.g., sentences and unrelated\\nimage/audio data). In particular, besides learning by the contrastive loss on\\ntext, our model clusters examples from a non-linguistic domain (e.g.,\\nvisual/audio) with a similar contrastive loss at the same time. The reliance of\\nour framework on unpaired non-linguistic data makes it language-agnostic,\\nenabling it to be widely applicable beyond English NLP. Experiments on 7\\nsemantic textual similarity benchmarks reveal that models trained with the\\nadditional non-linguistic (/images/audio) contrastive objective lead to higher\\nquality sentence embeddings. This indicates that Transformer models are able to\\ngeneralize better by doing a similar task (i.e., clustering) with unpaired\\nexamples from different modalities in a multi-task fashion.',
'No',
-0.013869206)]`
```
```
`output\_df = pd.DataFrame(
output\_list, columns=["query", "document", "prediction", "logprobs"]
).reset\_index()
# Use exp() to convert logprobs into probability
output\_df["probability"] = output\_df["logprobs"].apply(exp)
# Reorder based on likelihood of being Yes
output\_df["yes\_probability"] = output\_df.apply(
lambda x: x["probability"] \* -1 + 1
if x["prediction"] == "No"
else x["probability"],
axis=1,
)
output\_df.head()`
```
||index|query|document|prediction|logprobs|probability|yes\_probability|
|0|0|how do bi-encoders work for sentence embeddings|SBERT studies Meaning Representations: Decompo...|Yes|-0.053264|0.948130|0.948130|
|1|1|how do bi-encoders work for sentence embeddings|Are Classes Clusters?: Sentence embedding mode...|No|-0.009535|0.990510|0.009490|
|2|2|how do bi-encoders work for sentence embeddings|Semantic Composition in Visually Grounded Lang...|No|-0.008887|0.991152|0.008848|
|3|3|how do bi-encoders work for sentence embeddings|Evaluating the Construct Validity of Text Embe...|No|-0.008584|0.991453|0.008547|
|4|4|how do bi-encoders work for sentence embeddings|Learning Probabilistic Sentence Representation...|No|-0.011976|0.988096|0.011904|
```
`# Return reranked results
reranked\_df = output\_df.sort\_values(
by=["yes\_probability"], ascending=False
).reset\_index()
reranked\_df.head(10)`
```
||level\_0|index|query|document|prediction|logprobs|probability|yes\_probability|
|0|16|16|how do bi-encoders work for sentence embeddings|In Search for Linear Relations in Sentence Emb...|Yes|-0.004824|0.995187|0.995187|
|1|8|8|how do bi-encoders work for sentence embeddings|Vec2Sent: Probing Sentence Embeddings with Nat...|Yes|-0.004863|0.995149|0.995149|
|2|19|19|how do bi-encoders work for sentence embeddings|Relational Sentence Embedding for Flexible Sem...|Yes|-0.038814|0.961930|0.961930|
|3|0|0|how do bi-encoders work for sentence embeddings|SBERT studies Meaning Representations: Decompo...|Yes|-0.053264|0.948130|0.948130|
|4|15|15|how do bi-encoders work for sentence embeddings|Sentence-T5: Scalable Sentence Encoders from P...|No|-0.291893|0.746849|0.253151|
|5|6|6|how do bi-encoders work for sentence embeddings|How to Probe Sentence Embeddings in Low-Resour...|No|-0.015551|0.984570|0.015430|
|6|18|18|how do bi-encoders work for sentence embeddings|Efficient and Flexible Topic Modeling using Pr...|No|-0.015296|0.984820|0.015180|
|7|9|9|how do bi-encoders work for sentence embeddings|Non-Linguistic Supervision for Contrastive Lea...|No|-0.013869|0.986227|0.013773|
|8|12|12|how do bi-encoders work for sentence embeddings|Character-based Neural Networks for Sentence P...|No|-0.012866|0.987216|0.012784|
|9|7|7|how do bi-encoders work for sentence embeddings|Clustering and Network Analysis for the Embedd...|No|-0.012663|0.987417|0.012583|
```
`# Inspect our new top document following reranking
reranked\_df["document"][0]`
```
```
`'In Search for Linear Relations in Sentence Embedding Spaces: We present an introductory investigation into continuous-space vector\\nrepresentations of sentences. We acquire pairs of very similar sentences\\ndiffering only by a small alterations (such as change of a noun, adding an\\nadjective, noun or punctuation) from datasets for natural language inference\\nusing a simple pattern method. We look into how such a small change within the\\nsentence text affects its representation in the continuous space and how such\\nalterations are reflected by some of the popular sentence embedding models. We\\nfound that vector differences of some embeddings actually reflect small changes\\nwithin a sentence.'`
```
## Conclusion
We’ve shown how to create a tailored cross-encoder to rerank academic papers. This approach will work best where there are domain-specific nuances that can be used to pick the most relevant corpus for your users, and where some pre-filtering has taken place to limit the amount of data the cross-encoder will need to process.
A few typical use cases we’ve seen are:
* Returning a list of 100 most relevant stock reports, then re-ordering into a top 5 or 10 based on the detailed context of a particular set of customer portfolios
* Running after a classic rules-based search that gets the top 100 or 1000 most relevant results to prune it according to a specific user’s context
### Taking this forward
Taking the few-shot approach, as we have here, can work well when the domain is general enough that a small number of examples will cover most reranking cases. However, as the differences between documents become more specific you may want to consider the `Fine-tuning` endpoint to make a more elaborate cross-encoder with a wider variety of examples.
There is also a latency impact of using `text-davinci-003` that you’ll need to consider, with even our few examples above taking a couple seconds each - again, the `Fine-tuning` endpoint may help you here if you are able to get decent results from an `ada` or `babbage` fine-tuned model.
We’ve used the `Completions` endpoint from OpenAI to build our cross-encoder, but this area is well-served by the open-source community. [Here](https://huggingface.co/jeffwan/mmarco-mMiniLMv2-L12-H384-v1) is an example from HuggingFace, for example.
We hope you find this useful for tuning your search use cases, and look forward to seeing what you build.