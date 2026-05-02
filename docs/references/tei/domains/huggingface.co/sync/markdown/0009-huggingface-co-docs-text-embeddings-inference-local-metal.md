Using TEI locally with Metal · Hugging Face
text-embeddings-inference documentation
Using TEI locally with Metal
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
# [](#using-tei-locally-with-metal) Using TEI locally with Metal
You can install `text-embeddings-inference` locally to run it on your own Mac with Metal support.
## [](#homebrew-apple-silicon) Homebrew (Apple Silicon)
On Apple Silicon (M1/M2/M3/M4), you can install a prebuilt binary via Homebrew:
Copied
```
brew install text-embeddings-inference
```
Then launch Text Embeddings Inference:
Copied
```
model=Qwen/Qwen3-Embedding-0.6B
text-embeddings-router --model-id $model --port 8080
```
## [](#build-from-source) Build from source
Alternatively, you can build from source. Here are the step-by-step instructions:
## [](#step-1-install-rust) Step 1: Install Rust
[Install Rust](https://rustup.rs/) on your machine by run the following in your terminal, then following the instructions:
Copied
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
## [](#step-2-install-with-metal-support) Step 2: Install with Metal support
Copied
```
cargo install --path router -F metal
```
## [](#step-3-launch-text-embeddings-inference) Step 3: Launch Text Embeddings Inference
Once the installation is successfully complete, you can launch Text Embeddings Inference with Metal with the following command:
Copied
```
model=Qwen/Qwen3-Embedding-0.6B
text-embeddings-router --model-id $model --port 8080
```
Now you are ready to use `text-embeddings-inference` locally on your machine.
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/local_metal.md)
[←Using TEI locally with CPU](/docs/text-embeddings-inference/local_cpu) [Using TEI locally with GPU→](/docs/text-embeddings-inference/local_gpu)