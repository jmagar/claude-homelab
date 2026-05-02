# Working with SPLADE
# How to Generate Sparse Vectors with SPLADE
SPLADE is a novel method for learning sparse text representation vectors, outperforming BM25 in tasks like information retrieval and document classification. Its main advantage is generating efficient and interpretable sparse vectors, making it effective for large-scale text data.
## Setup
First, install FastEmbed.
```python
pip install -q fastembed
```
Next, import the required modules for sparse embeddings and Python’s typing module.
```python
from fastembed import SparseTextEmbedding, SparseEmbedding
```
You may always check the list of all supported sparse embedding models.
```python
SparseTextEmbedding.list_supported_models()
```
This will return a list of models, each with its details such as model name, vocabulary size, description, and sources.
```python
[
{
'model': 'prithivida/Splade_PP_en_v1',
'sources': {'hf': 'Qdrant/Splade_PP_en_v1', ...},
'model_file': 'model.onnx',
'description': 'Independent Implementation of SPLADE++ Model for English.',
'license': 'apache-2.0',
'size_in_GB': 0.532,
'vocab_size': 30522,
...
},
...
] # part of the output was omitted
```
Now, load the model.
```python
model_name = "prithivida/Splade_PP_en_v1"
# This triggers the model download
model = SparseTextEmbedding(model_name=model_name)
```
## Embed data
You need to define a list of documents to be embedded.
```python
documents: list[str] = [
"Chandrayaan-3 is India's third lunar mission",
"It aimed to land a rover on the Moon's surface - joining the US, China and Russia",
"The mission is a follow-up to Chandrayaan-2, which had partial success",
"Chandrayaan-3 will be launched by the Indian Space Research Organisation (ISRO)",
"The estimated cost of the mission is around $35 million",
"It will carry instruments to study the lunar surface and atmosphere",
"Chandrayaan-3 landed on the Moon's surface on 23rd August 2023",
"It consists of a lander named Vikram and a rover named Pragyan similar to Chandrayaan-2. Its propulsion module would act like an orbiter.",
"The propulsion module carries the lander and rover configuration until the spacecraft is in a 100-kilometre (62 mi) lunar orbit",
"The mission used GSLV Mk III rocket for its launch",
"Chandrayaan-3 was launched from the Satish Dhawan Space Centre in Sriharikota",
"Chandrayaan-3 was launched earlier in the year 2023",
]
```
Then, generate sparse embeddings for each document.
Here,`batch_size` is optional and helps to process documents in batches.
```python
sparse_embeddings_list: list[SparseEmbedding] = list(
model.embed(documents, batch_size=6)
)
```
## Retrieve embeddings
`sparse_embeddings_list` contains sparse embeddings for the documents provided earlier. Each element in this list is a `SparseEmbedding` object that contains the sparse vector representation of a document.
```python
index = 0
sparse_embeddings_list[index]
```
This output is a `SparseEmbedding` object for the first document in our list. It contains two arrays: `values` and `indices`. - The `values` array represents the weights of the features (tokens) in the document. - The `indices` array represents the indices of these features in the model's vocabulary.
Each pair of corresponding `values` and `indices` represents a token and its weight in the document.
```python
SparseEmbedding(values=array([0.05297208, 0.01963477, 0.36459631, 1.38508618, 0.71776593,
0.12667948, 0.46230844, 0.446771 , 0.26897505, 1.01519883,
1.5655334 , 0.29412213, 1.53102326, 0.59785569, 1.1001817 ,
0.02079751, 0.09955651, 0.44249091, 0.09747757, 1.53519952,
1.36765671, 0.15740395, 0.49882549, 0.38629025, 0.76612782,
1.25805044, 0.39058095, 0.27236196, 0.45152301, 0.48262018,
0.26085234, 1.35912788, 0.70710695, 1.71639752]), indices=array([ 1010, 1011, 1016, 1017, 2001, 2018, 2034, 2093, 2117,
2319, 2353, 2509, 2634, 2686, 2796, 2817, 2922, 2959,
3003, 3148, 3260, 3390, 3462, 3523, 3822, 4231, 4316,
4774, 5590, 5871, 6416, 11926, 12076, 16469]))
```
## Examine weights
Now, print the first 5 features and their weights for better understanding.
```python
for i in range(5):
print(f"Token at index {sparse_embeddings_list[0].indices[i]} has weight {sparse_embeddings_list[0].values[i]}")
```
The output will display the token indices and their corresponding weights for the first document.
```python
Token at index 1010 has weight 0.05297207832336426
Token at index 1011 has weight 0.01963476650416851
Token at index 1016 has weight 0.36459630727767944
Token at index 1017 has weight 1.385086178779602
Token at index 2001 has weight 0.7177659273147583
```
## Analyze results
Let's use the tokenizer vocab to make sense of these indices.
```python
import json
from tokenizers import Tokenizer
tokenizer = Tokenizer.from_pretrained("Qdrant/Splade_PP_en_v1")
```
The `get_tokens_and_weights` function takes a `SparseEmbedding` object and a `tokenizer` as input. It will construct a dictionary where the keys are the decoded tokens, and the values are their corresponding weights.
```python
def get_tokens_and_weights(sparse_embedding, tokenizer):
token_weight_dict = {}
for i in range(len(sparse_embedding.indices)):
token = tokenizer.decode([sparse_embedding.indices[i]])
weight = sparse_embedding.values[i]
token_weight_dict[token] = weight
# Sort the dictionary by weights
token_weight_dict = dict(sorted(token_weight_dict.items(), key=lambda item: item[1], reverse=True))
return token_weight_dict
# Test the function with the first SparseEmbedding
print(json.dumps(get_tokens_and_weights(sparse_embeddings_list[index], tokenizer), indent=4))
```
## Dictionary output
The dictionary is then sorted by weights in descending order.
```python
{
"chandra": 1.7163975238800049,
"third": 1.5655333995819092,
"##ya": 1.535199522972107,
"india": 1.5310232639312744,
"3": 1.385086178779602,
"mission": 1.3676567077636719,
"lunar": 1.3591278791427612,
"moon": 1.2580504417419434,
"indian": 1.1001816987991333,
"##an": 1.015198826789856,
"3rd": 0.7661278247833252,
"was": 0.7177659273147583,
"spacecraft": 0.7071069478988647,
"space": 0.5978556871414185,
"flight": 0.4988254904747009,
"satellite": 0.4826201796531677,
"first": 0.46230843663215637,
"expedition": 0.4515230059623718,
"three": 0.4467709958553314,
"fourth": 0.44249090552330017,
"vehicle": 0.390580952167511,
"iii": 0.3862902522087097,
"2": 0.36459630727767944,
"##3": 0.2941221296787262,
"planet": 0.27236196398735046,
"second": 0.26897504925727844,
"missions": 0.2608523368835449,
"launched": 0.15740394592285156,
"had": 0.12667948007583618,
"largest": 0.09955651313066483,
"leader": 0.09747757017612457,
",": 0.05297207832336426,
"study": 0.02079751156270504,
"-": 0.01963476650416851
}
```
## Observations
- The relative order of importance is quite useful. The most important tokens in the sentence have the highest weights.
- **Term Expansion:** The model can expand the terms in the document. This means that the model can generate weights for tokens that are not present in the document but are related to the tokens in the document. This is a powerful feature that allows the model to capture the context of the document. Here, you'll see that the model has added the tokens '3' from 'third' and 'moon' from 'lunar' to the sparse vector.
## Design choices
- The weights are not normalized. This means that the sum of the weights is not 1 or 100. This is a common practice in sparse embeddings, as it allows the model to capture the importance of each token in the document.
- Tokens are included in the sparse vector only if they are present in the model's vocabulary. This means that the model will not generate a weight for tokens that it has not seen during training.
- Tokens do not map to words directly -- allowing you to gracefully handle typo errors and out-of-vocabulary tokens.