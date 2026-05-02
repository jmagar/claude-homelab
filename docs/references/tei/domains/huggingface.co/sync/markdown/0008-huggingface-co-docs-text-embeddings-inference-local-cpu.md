Using TEI locally with CPU · Hugging Face
text-embeddings-inference documentation
Using TEI locally with CPU
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
# [](#using-tei-locally-with-cpu) Using TEI locally with CPU
You can install `text-embeddings-inference` locally to run it on your own machine. Here are the step-by-step instructions for installation:
## [](#step-1-install-rust) Step 1: Install Rust
[Install Rust](https://rustup.rs/) on your machine by run the following in your terminal, then following the instructions:
Copied
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
## [](#step-2-install-necessary-packages) Step 2: Install necessary packages
Depending on your machine’s architecture, run one of the following commands:
### [](#for-x86-machines) For x86 Machines
Copied
```
cargo install --path router -F mkl
```
### [](#for-m1-or-m2-machines) For M1 or M2 Machines
Copied
```
cargo install --path router -F metal
```
## [](#step-3-launch-text-embeddings-inference) Step 3: Launch Text Embeddings Inference
Once the installation is successfully complete, you can launch Text Embeddings Inference on CPU with the following command:
Copied
```
model=Qwen/Qwen3-Embedding-0.6B
text-embeddings-router --model-id $model --port 8080
```
> In some cases, you might also need the OpenSSL libraries and gcc installed. On Linux machines, run the following command:
>
>
> Copied
>
```
> sudo apt-get install libssl-dev gcc -y
```
Now you are ready to use `text-embeddings-inference` locally on your machine.
If you want to run TEI locally with a GPU, check out the [Using TEI locally with GPU](local_gpu) page.
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/local_cpu.md)
[←Supported models and hardware](/docs/text-embeddings-inference/supported_models) [Using TEI locally with Metal→](/docs/text-embeddings-inference/local_metal)