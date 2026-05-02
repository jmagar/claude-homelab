Using TEI locally with GPU · Hugging Face
text-embeddings-inference documentation
Using TEI locally with GPU
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
# [](#using-tei-locally-with-gpu) Using TEI locally with GPU
You can install `text-embeddings-inference` locally to run it on your own machine with a GPU.
To make sure that your hardware is supported, check out the [Supported models and hardware](supported_models) page.
## [](#step-1-cuda-and-nvidia-drivers) Step 1: CUDA and NVIDIA drivers
Make sure you have CUDA and the NVIDIA drivers installed - NVIDIA drivers on your device need to be compatible with CUDA version 12.2 or higher.
Add the NVIDIA binaries to your path:
Copied
```
export PATH=$PATH:/usr/local/cuda/bin
```
## [](#step-2-install-rust) Step 2: Install Rust
[Install Rust](https://rustup.rs/) on your machine by run the following in your terminal, then following the instructions:
Copied
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
## [](#step-3-install-necessary-packages) Step 3: Install necessary packages
This step can take a while as we need to compile a lot of CUDA kernels.
### [](#for-turing-gpus-t4-rtx-2000-series--) For Turing GPUs (T4, RTX 2000 series … )
Copied
```
cargo install --path router -F candle-cuda-turing
```
### [](#for-ampere-ada-lovelace-hopper-and-blackwell) For Ampere, Ada Lovelace, Hopper, and Blackwell
Copied
```
cargo install --path router -F candle-cuda
```
## [](#step-4-launch-text-embeddings-inference) Step 4: Launch Text Embeddings Inference
You can now launch Text Embeddings Inference on GPU with:
Copied
```
model=Qwen/Qwen3-Embedding-0.6B
text-embeddings-router --model-id $model --dtype float16 --port 8080
```
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/local_gpu.md)
[←Using TEI locally with Metal](/docs/text-embeddings-inference/local_metal) [Serving private and gated models→](/docs/text-embeddings-inference/private_models)