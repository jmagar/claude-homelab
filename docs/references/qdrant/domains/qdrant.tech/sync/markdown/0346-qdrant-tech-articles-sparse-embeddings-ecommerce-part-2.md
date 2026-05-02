Fine-Tuning Sparse Embeddings for E-Commerce Search | Part 2: Training SPLADE on Modal - Qdrant
* [Qdrant Articles](https://qdrant.tech/articles/)
*
* Fine-Tuning Sparse Embeddings for E-Commerce Search | Part 2: Training SPLADE on Modal
[
Back to
Practical Examples](https://qdrant.tech/articles/practicle-examples/)# Fine-Tuning Sparse Embeddings for E-Commerce Search | Part 2: Training SPLADE on Modal
Thierry Damiba
&#183;
March 09, 2026
*This is Part 2 of a 5-part series on fine-tuning sparse embeddings for e-commerce search. In [Part 1](https://qdrant.tech/articles/sparse-embeddings-ecommerce-part-1/), we covered why sparse embeddings beat BM25 for e-commerce. Now we build the training pipeline.*
**Series:**
* [Part 1: Why Sparse Embeddings Beat BM25](https://qdrant.tech/articles/sparse-embeddings-ecommerce-part-1/)
* Part 2: Training SPLADE on Modal (here)
* [Part 3: Evaluation & Hard Negatives](https://qdrant.tech/articles/sparse-embeddings-ecommerce-part-3/)
* [Part 4: Specialization vs Generalization](https://qdrant.tech/articles/sparse-embeddings-ecommerce-part-4/)
* [Part 5: From Research to Product](https://qdrant.tech/articles/sparse-embeddings-ecommerce-part-5/)
In the last article we made the case for sparse embeddings in e-commerce search. Now we write the code. All source code is available in the [GitHub repo](https://github.com/thierrypdamiba/finetune-ecommerce-search), and you can try the [fine-tuned models on HuggingFace](https://huggingface.co/thierrydamiba/splade-ecommerce-esci). Want to skip straight to fine-tuning on your own data? See the [`sparse-finetune`](https://github.com/qdrant/sparse-finetune) CLI. By the end of this piece, you&rsquo;ll have a SPLADE model trained on Amazon&rsquo;s ESCI dataset, running on Modal&rsquo;s serverless GPUs, with checkpoints saved to persistent storage.
## The Dataset: Amazon ESCI
We use Amazon&rsquo;s [ESCI dataset](https://github.com/amazon-science/esci-data) (Shopping Queries Dataset), released for KDD Cup 2022. It&rsquo;s one of the most realistic e-commerce search benchmarks available:
* **1.2M+ query-product pairs** with human-annotated relevance labels
* **Four relevance grades**: Exact (E), Substitute (S), Complement (C), Irrelevant (I)
* **Rich product metadata**: titles, descriptions, bullet points, brands
The graded relevance is what makes ESCI interesting:
For training, we use Exact and Substitute pairs as positives. This teaches the model that both the exact product and reasonable alternatives are relevant, matching how real shoppers think.
### Loading the Data
```
`from datasets import load\_dataset
from src.data.text\_builder import build\_product\_text
def load\_esci\_training\_data(max\_samples=None):
"""Load ESCI dataset as anchor-positive pairs for contrastive training."""
dataset = load\_dataset("tasksource/esci", split="train")
pairs = []
for row in dataset:
if row["relevance\_label"] not in ("E", "S"):
continue
query = row["query"]
product\_text = build\_product\_text(
title=row["product\_title"],
brand=row.get("product\_brand", ""),
description=row.get("product\_description", ""),
bullets=row.get("product\_bullet\_point", []),
)
pairs.append({"anchor": query, "positive": product\_text})
if max\_samples and len(pairs) \>= max\_samples:
break
return pairs
`
```
### Product Text Formatting
How you format product text matters for sparse embeddings. Unlike dense models that capture broad semantic meaning, SPLADE is lexically grounded: the specific tokens in your text determine which vocabulary dimensions activate:
```
`def build\_product\_text(title, brand="", description="", bullets=None, max\_length=512):
"""Consistent product text formatting for SPLADE."""
parts = []
# Brand in brackets makes it a distinct signal
if brand:
parts.append(f"[{brand}]")
parts.append(title)
# Pipe separators help the model distinguish sections
if description:
parts.append(f"| {description[:200]}")
if bullets:
parts.append(f"| {' | '.join(bullets[:3])}")
text = " ".join(parts)
return text[:max\_length]
# Example output:
# "[Sony] WH-1000XM5 Wireless Headphones | Industry-leading noise
# cancellation | 30hr battery | Hi-Res Audio"
`
```
The bracket notation for brands, pipe separators between sections, and character limits are deliberate. They preserve lexical signals that SPLADE can learn from: brand names, product attributes, and key features remain as distinct tokens rather than blurring into a wall of text.
## Setting Up the Modal App
Modal gives us serverless GPUs. No provisioning, no idle hardware, pay-per-second billing. Here&rsquo;s the app configuration:
```
`import modal
app = modal.App("esci-sparse-encoder")
# Persistent storage for checkpoints and datasets
checkpoint\_volume = modal.Volume.from\_name(
"esci-sparse-checkpoints", create\_if\_missing=True
)
dataset\_volume = modal.Volume.from\_name(
"esci-datasets", create\_if\_missing=True
)
# Docker image with dependencies
image = (
modal.Image.debian\_slim(python\_version="3.11")
.pip\_install(
"sentence-transformers\>=5.0.0",
"torch\>=2.2.0",
"transformers\>=4.45.0",
"datasets\>=2.20.0",
"qdrant-client\>=1.12.0",
"accelerate\>=0.30.0",
)
)
`
```
Two things matter here:
**Persistent volumes.** Training runs can take hours. If your SSH connection drops or a container restarts, you don&rsquo;t want to lose checkpoints. Modal volumes persist data across runs. Mount them at a path and write to them like a local filesystem.
**Detached runs.** For long training jobs, launch with `--detach` and walk away:
```
`# Start training and disconnect
uv run modal run --detach modal\_app.py --mode train
# Come back later, check your checkpoints
uv run modal volume ls esci-sparse-checkpoints /checkpoints/
`
```
No S3 uploads, no checkpoint management code, no lost training runs.
## Creating the SPLADE Model
Sentence Transformers v5 introduced `SparseEncoder`, making SPLADE training straightforward. The model has two components:
1. **MLMTransformer**: A transformer with a masked language model head that outputs logits over the full vocabulary
2. **SpladePooling**: Max-pools the token-level logits and applies ReLU + log saturation
```
`from sentence\_transformers import SparseEncoder
from sentence\_transformers.sparse\_encoder.models import (
MLMTransformer,
SpladePooling,
)
def create\_sparse\_encoder(base\_model="distilbert/distilbert-base-uncased"):
"""Create a SPLADE model from a base transformer."""
# MLM transformer outputs logits over vocabulary
mlm = MLMTransformer(base\_model)
# SPLADE pooling: max over tokens, ReLU activation
pooling = SpladePooling(pooling\_strategy="max")
return SparseEncoder(modules=[mlm, pooling])
`
```
We start from DistilBERT rather than a pre-trained SPLADE checkpoint (like `naver/splade-v3`). This is a deliberate choice. We want to measure how much domain-specific fine-tuning helps when starting from a general language model, not from a model already trained on web search data.
## The Training Function
Here&rsquo;s the core training logic, decorated as a Modal function:
```
`@app.function(
image=image,
gpu="A100",
volumes={
"/checkpoints": checkpoint\_volume,
"/datasets": dataset\_volume,
},
timeout=3600 \* 6,
)
def train\_sparse\_encoder(config: dict):
from sentence\_transformers import SparseEncoder
from sentence\_transformers.sparse\_encoder import SparseEncoderTrainer
from sentence\_transformers.training\_args import SparseEncoderTrainingArguments
from sentence\_transformers.losses import SpladeLoss, SparseMultipleNegativesRankingLoss
# Create model
model = create\_sparse\_encoder(config["base\_model"])
# Load ESCI dataset (anchor-positive pairs)
train\_dataset = load\_esci\_training\_data(
max\_samples=config.get("max\_samples")
)
# SPLADE loss combines contrastive learning with sparsity regularization
loss = SpladeLoss(
model=model,
loss=SparseMultipleNegativesRankingLoss(model=model),
query\_regularizer\_weight=float(config.get("query\_regularizer\_weight", 5e-5)),
document\_regularizer\_weight=float(config.get("document\_regularizer\_weight", 3e-5)),
)
# Training arguments
args = SparseEncoderTrainingArguments(
output\_dir=f"/checkpoints/{config['run\_name']}",
num\_train\_epochs=config.get("num\_epochs", 1),
per\_device\_train\_batch\_size=config.get("batch\_size", 32),
learning\_rate=float(config.get("learning\_rate", 2e-5)),
warmup\_ratio=0.1,
fp16=True,
save\_steps=1000,
logging\_steps=100,
)
# Train
trainer = SparseEncoderTrainer(
model=model,
args=args,
train\_dataset=train\_dataset,
loss=loss,
)
trainer.train()
# Save final model
model.save\_pretrained(f"/checkpoints/{config['run\_name']}/final")
return f"/checkpoints/{config['run\_name']}/final"
`
```
### Understanding SpladeLoss
`SpladeLoss` wraps two objectives:
**Contrastive loss** (`SparseMultipleNegativesRankingLoss`): Given a batch of (query, product) pairs, treat other products in the batch as negatives. Push relevant query-product pairs together, push irrelevant ones apart. This is the same in-batch negative approach used for dense embedding training, and it works because most random products are irrelevant to a given query.
**Sparsity regularization**: Penalizes dense outputs to maintain efficiency. Without it, the model would activate all 30,000 vocabulary dimensions for every input. That&rsquo;s technically optimal for matching but useless for retrieval speed and storage.
The regularization weights control this tradeoff:
|Parameter|Value|Effect|
|`query\_regularizer\_weight`|5e-5|Higher = sparser queries|
|`document\_regularizer\_weight`|3e-5|Higher = sparser documents|
The sweet spot is 100-300 active terms per vector. Too high regularization produces nearly empty vectors (fast but low recall). Too low produces thousands of terms (slow, huge index).
Document regularization is lower than query regularization because product descriptions need more terms to capture all relevant attributes. A product listing for headphones should activate terms like &ldquo;audio&rdquo;, &ldquo;wireless&rdquo;, &ldquo;bluetooth&rdquo;, &ldquo;noise&rdquo;, &ldquo;canceling&rdquo; - more than the 3-4 words in a typical query.
### Configuration via YAML
We keep hyperparameters in YAML files for easy experimentation:
```
`# configs/splade\_standard.yaml
run\_name: splade\_standard
base\_model: distilbert/distilbert-base-uncased
architecture: splade
batch\_size: 32
learning\_rate: 2e-5
num\_epochs: 1
query\_regularizer\_weight: 5e-5
document\_regularizer\_weight: 3e-5
max\_samples: 100000
`
```
100K samples trains in about 6 minutes on an A100 and costs less than $1 on Modal. The full 1.2M dataset with multiple epochs takes a few hours, still cheap compared to reserved GPU instances.
## Parallel Hyperparameter Sweeps
One of Modal&rsquo;s strengths is embarrassingly parallel workloads. Hyperparameter sweeps are a natural fit. `spawn()` launches one GPU per configuration:
```
`@app.function(gpu="A100")
def train\_single\_experiment(config: dict):
"""Train one configuration."""
model = create\_sparse\_encoder(config["base\_model"])
# ... training code ...
return {"config": config, "ndcg": evaluate(model)}
@app.local\_entrypoint()
def run\_hyperparameter\_sweep():
"""Launch all experiments in parallel."""
configs = [
{"learning\_rate": 1e-5, "regularizer\_weight": 3e-5},
{"learning\_rate": 2e-5, "regularizer\_weight": 3e-5},
{"learning\_rate": 2e-5, "regularizer\_weight": 5e-5},
{"learning\_rate": 5e-5, "regularizer\_weight": 5e-5},
# ... more configurations ...
]
# Launch all experiments simultaneously
handles = [train\_single\_experiment.spawn(c) for c in configs]
# Collect results as they complete
results = [h.get() for h in handles]
best = max(results, key=lambda r: r["ndcg"])
print(f"Best config: {best}")
`
```
A 24-experiment sweep finishes in the time of a single training run. Each experiment gets its own A100. You pay only for the compute time actually used, not for idle GPUs waiting in a queue.
## What NOT to Do: The Inference-Free SPLADE Trap
We tried replacing the query-side transformer with a static embedding lookup to save latency. The idea is appealing: queries are short, so why run a full transformer?
```
`# DON'T DO THIS (for e-commerce)
router = Router.for\_query\_document(
query\_modules=[
SparseStaticEmbedding(tokenizer=mlm.tokenizer) # Fast but weak
],
document\_modules=[
mlm,
SpladePooling(pooling\_strategy="max"),
],
)
`
```
The results were disastrous:
|Architecture|nDCG@10|
|Standard SPLADE (contextual)|**0.389**|
|Inference-Free (static)|0.065|
That&rsquo;s 6x worse without contextual encoding.
The static embedding completely failed because e-commerce queries are highly contextual. &ldquo;Apple&rdquo; means different things in &ldquo;apple iphone&rdquo; vs &ldquo;apple fruit&rdquo;. The static embedding can&rsquo;t disambiguate. It looks up &ldquo;apple&rdquo; and returns the same vector regardless of context.
The transformer is the bottleneck at \~15ms per query, but 15ms is perfectly acceptable for search. Don&rsquo;t prematurely optimize away the component that makes the model work.
## Running Training
With everything in place, launch training:
```
`# Quick test run (100K samples)
uv run modal run modal\_app.py \\
--config-path configs/splade\_standard.yaml \\
--mode train
# Full dataset, detached
uv run modal run --detach modal\_app.py \\
--config-path configs/splade\_standard.yaml \\
--mode train
`
```
The model checkpoint gets saved to the persistent volume at `/checkpoints/splade\_standard/final`. We&rsquo;ve also published the trained model on HuggingFace as [splade-ecommerce-esci](https://huggingface.co/thierrydamiba/splade-ecommerce-esci) so you can skip training and use it directly. In the next article, we&rsquo;ll load this model, index products into Qdrant, and run retrieval benchmarks to see exactly how much we&rsquo;ve improved over BM25.
## Key Takeaways
* **ESCI&rsquo;s graded relevance** (Exact, Substitute, Complement, Irrelevant) teaches the model nuanced matching, not just binary relevant/not-relevant.
* **Product text formatting matters** for sparse models. Keep lexical signals distinct with structured formatting.
* **SpladeLoss balances two objectives**: contrastive learning for relevance and regularization for sparsity. The regularization weights are the main knob to tune.
* **Modal&rsquo;s persistent volumes** solve the checkpoint management problem. Detached runs survive SSH drops.
* **Don&rsquo;t skip the query transformer.** The 15ms of latency buys you a 6x quality improvement over static embeddings.
*Next: [Part 3 - Evaluation, Hard Negatives, and Results](https://qdrant.tech/articles/sparse-embeddings-ecommerce-part-3/)*
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/sparse-embeddings-ecommerce-part-2.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/articles/sparse-embeddings-ecommerce-part-2/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/articles/sparse-embeddings-ecommerce-part-2.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)