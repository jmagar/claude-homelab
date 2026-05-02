Quick Tour · Hugging Face
text-embeddings-inference documentation
Quick Tour
# text-embeddings-inference
🏡 View all docsAWS Trainium & InferentiaAccelerateArgillaAutoTrainBitsandbytesCLIChat UIDataset viewerDatasetsDeploying on AWSDiffusersDistilabelEvaluateGoogle CloudGoogle TPUsGradioHubHub Python LibraryHuggingface.jsInference Endpoints (dedicated)Inference ProvidersKernelsLeRobotLeaderboardsLightevalMicrosoft AzureOptimumPEFTReachy MiniSafetensorsSentence TransformersTRLTasksText Embeddings InferenceText Generation InferenceTokenizersTrackioTransformersTransformers.jsXetsmolagentstimm
Search documentation
Ctrl+K
main EN
[ ](https://github.com/huggingface/text-embeddings-inference)
Join the Hugging Face community
and get access to the augmented documentation experience
Collaborate on models, datasets and Spaces
Faster examples with accelerated inference
Switch between documentation themes
[Sign Up](/join)
to get started
Copy page
# [](#quick-tour) Quick Tour
## [](#set-up) Set up
The easiest way to get started with TEI is to use one of the official Docker containers
(see [Supported models and hardware](supported_models) to choose the right container).
Hence one needs to install Docker following their [installation instructions](https://docs.docker.com/get-docker/).
TEI supports inference both on GPU and CPU. If you plan on using a GPU, make sure to check that your hardware is supported by checking [this table](https://github.com/huggingface/text-embeddings-inference?tab=readme-ov-file#docker-images).
Next, install the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html). NVIDIA drivers on your device need to be compatible with CUDA version 12.2 or higher.
## [](#deploy) Deploy
Next it’s time to deploy your model. Let’s say you want to use [`Qwen/Qwen3-Embedding-0.6B`](https://huggingface.co/Qwen/Qwen3-Embedding-0.6B). Here’s how you can do this:
Copied
```
model=Qwen/Qwen3-Embedding-0.6B
volume=$PWD/data
docker run --gpus all -p 8080:80 -v $volume:/data --pull always ghcr.io/huggingface/text-embeddings-inference:cuda-1.9 --model-id $model
```
> We also recommend sharing a volume with the Docker container (
`> volume=$PWD/data
`> ) to avoid downloading weights every run.
## [](#inference) Inference
Inference can be performed in 3 ways: using cURL, or via the `InferenceClient` or `OpenAI` Python SDKs.
#### [](#curl) cURL
To send a POST request to the TEI endpoint using cURL, you can run the following command:
Copied
```
curl 127.0.0.1:8080/embed \\
-X POST \\
-d '{"inputs":"What is Deep Learning?"}' \\
-H 'Content-Type: application/json'
```
#### [](#python) Python
To run inference using Python, you can either use the [`huggingface\_hub`](https://huggingface.co/docs/huggingface_hub/en/index) Python SDK (recommended) or the `openai` Python SDK.
##### [](#huggingfacehub) huggingface\_hub
You can install it via pip as `pip install --upgrade --quiet huggingface\_hub`, and then run:
Copied
```
from huggingface\_hub import InferenceClient
client = InferenceClient()
embedding = client.feature\_extraction("What is deep learning?",
model="http://localhost:8080/embed")
print(len(embedding[0]))
```
#### [](#openai) OpenAI
To send requests to the [OpenAI Embeddings API](https://platform.openai.com/docs/api-reference/embeddings/create) exposed on Text Embeddings Inference (TEI) with the OpenAI Python SDK, you can install it as `pip install --upgrade openai`, and then run the following snippet:
Copied
```
import os
from openai import OpenAI
client = OpenAI(base\_url="http://localhost:8080/v1", api\_key= "-")
response = client.embeddings.create(
model="text-embeddings-inference",
input="What is Deep Learning?",
)
print(response.data[0].embedding)
```
Alternatively, you can also send the request with cURL as follows:
Copied
```
curl http://localhost:8080/v1/embeddings \\
-H "Content-Type: application/json" \\
-d '{
"input": "What is Deep Learning?",
"model": "text-embeddings-inference",
"encoding\_format": "float"
}'
```
## [](#re-rankers-and-sequence-classification) Re-rankers and sequence classification
TEI also supports re-ranker and classic sequence classification models.
### [](#re-rankers) Re-rankers
Rerankers, also called cross-encoders, are sequence classification models with a single class that score the similarity between a query and a text. See [this blogpost](https://blog.llamaindex.ai/boosting-rag-picking-the-best-embedding-reranker-models-42d079022e83) by
the LlamaIndex team to understand how you can use re-rankers models in your RAG pipeline to improve
downstream performance.
Let’s say you want to use [`BAAI/bge-reranker-large`](https://huggingface.co/BAAI/bge-reranker-large). First, you can deploy it like so:
Copied
```
model=BAAI/bge-reranker-large
volume=$PWD/data
docker run --gpus all -p 8080:80 -v $volume:/data --pull always ghcr.io/huggingface/text-embeddings-inference:cuda-1.9 --model-id $model
```
Once you have deployed a model, you can use the `rerank` endpoint to rank the similarity between a query and a list of texts. With `cURL` this can be done like so:
Copied
```
curl 127.0.0.1:8080/rerank \\
-X POST \\
-d '{"query":"What is Deep Learning?", "texts": ["Deep Learning is not...", "Deep learning is..."], "raw\_scores": false}' \\
-H 'Content-Type: application/json'
```
### [](#sequence-classification-models) Sequence classification models
You can also use classic Sequence Classification models like [`SamLowe/roberta-base-go\_emotions`](https://huggingface.co/SamLowe/roberta-base-go_emotions):
Copied
```
model=SamLowe/roberta-base-go\_emotions
volume=$PWD/data
docker run --gpus all -p 8080:80 -v $volume:/data --pull always ghcr.io/huggingface/text-embeddings-inference:cuda-1.9 --model-id $model
```
Once you have deployed the model you can use the `predict` endpoint to get the emotions most associated with an input:
Copied
```
curl 127.0.0.1:8080/predict \\
-X POST \\
-d '{"inputs":"I like you."}' \\
-H 'Content-Type: application/json'
```
## [](#batching) Batching
You can send multiple inputs in a batch. For example, for embeddings:
Copied
```
curl 127.0.0.1:8080/embed \\
-X POST \\
-d '{"inputs":["Today is a nice day", "I like you"]}' \\
-H 'Content-Type: application/json'
```
And for Sequence Classification:
Copied
```
curl 127.0.0.1:8080/predict \\
-X POST \\
-d '{"inputs":[["I like you."], ["I hate pineapples"]]}' \\
-H 'Content-Type: application/json'
```
## [](#air-gapped-deployment) Air gapped deployment
To deploy Text Embeddings Inference in an air-gapped environment, first download the weights and then mount them inside
the container using a volume.
For example:
Copied
```
# (Optional) create a `models` directory
mkdir models
cd models
# Make sure you have git-lfs installed (https://git-lfs.com)
git lfs install
git clone https://huggingface.co/Alibaba-NLP/gte-base-en-v1.5
# Set the models directory as the volume path
volume=$PWD
# Mount the models directory inside the container with a volume and set the model ID
docker run --gpus all -p 8080:80 -v $volume:/data --pull always ghcr.io/huggingface/text-embeddings-inference:cuda-1.9 --model-id /data/gte-base-en-v1.5
```
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/quick_tour.md)
[←Text Embeddings Inference](/docs/text-embeddings-inference/index) [Supported models and hardware→](/docs/text-embeddings-inference/supported_models)