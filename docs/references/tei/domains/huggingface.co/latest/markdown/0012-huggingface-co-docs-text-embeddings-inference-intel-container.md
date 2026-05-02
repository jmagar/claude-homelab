Using TEI Container with Intel® Hardware · Hugging Face
text-embeddings-inference documentation
Using TEI Container with Intel® Hardware
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
# [](#using-tei-container-with-intel-hardware) Using TEI Container with Intel® Hardware
This guide explains how to build and deploy `text-embeddings-inference` containers optimized for Intel® hardware, including CPUs, XPUs, and HPUs.
## [](#cpu) CPU
### [](#build-docker-image) Build Docker Image
To build a container optimized for Intel® CPUs, run the following command:
Copied
```
platform="cpu"
docker build . -f Dockerfile-intel --build-arg PLATFORM=$platform -t tei\_cpu\_ipex
```
### [](#deploy-docker-container) Deploy Docker Container
To deploy your model on an Intel® CPU, use the following command:
Copied
```
model='Qwen/Qwen3-Embedding-0.6B'
volume=$PWD/data
docker run -p 8080:80 -v $volume:/data tei\_cpu\_ipex --model-id $model
```
## [](#xpu) XPU
### [](#build-docker-image) Build Docker Image
To build a container optimized for Intel® XPUs, run the following command:
Copied
```
platform="xpu"
docker build . -f Dockerfile-intel --build-arg PLATFORM=$platform -t tei\_xpu\_ipex
```
### [](#deploy-docker-container) Deploy Docker Container
To deploy your model on an Intel® XPU, use the following command:
Copied
```
model='Qwen/Qwen3-Embedding-0.6B'
volume=$PWD/data
docker run -p 8080:80 -v $volume:/data --device=/dev/dri -v /dev/dri/by-path:/dev/dri/by-path tei\_xpu\_ipex --model-id $model --dtype float16
```
## [](#hpu) HPU
> TEI is supported only on Gaudi 2 and Gaudi 3. Gaudi 1 is
**> not
**> supported.
### [](#build-docker-image) Build Docker Image
To build a container optimized for Intel® HPUs (Gaudi), run the following command:
Copied
```
platform="hpu"
docker build . -f Dockerfile-intel --build-arg PLATFORM=$platform -t tei\_hpu
```
### [](#deploy-docker-container) Deploy Docker Container
To deploy your model on an Intel® HPU (Gaudi), use the following command:
Copied
```
model='Qwen/Qwen3-Embedding-0.6B'
volume=$PWD/data
docker run -p 8080:80 -v $volume:/data --runtime=habana -e HABANA\_VISIBLE\_DEVICES=all -e MAX\_WARMUP\_SEQUENCE\_LENGTH=512 tei\_hpu --model-id $model --dtype bfloat16
```
## [](#prebuilt-docker-images) Prebuilt Docker Images
For convenience, prebuilt Docker images are available on GitHub Container Registry (GHCR). You can pull these images directly without the need to build them manually:
### [](#cpu) CPU
To use the prebuilt image optimized for Intel® CPUs, run:
Copied
```
docker pull ghcr.io/huggingface/text-embeddings-inference:cpu-ipex-latest
```
### [](#xpu) XPU
To use the prebuilt image optimized for Intel® XPUs, run:
Copied
```
docker pull ghcr.io/huggingface/text-embeddings-inference:xpu-ipex-latest
```
### [](#hpu) HPU
> TEI is supported only on Gaudi 2 and Gaudi 3. Gaudi 1 is
**> not
**> supported.
To use the prebuilt image optimized for Intel® HPUs (Gaudi), run:
Copied
```
docker pull ghcr.io/huggingface/text-embeddings-inference:hpu-latest
```
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/intel_container.md)
[←Build custom container for TEI](/docs/text-embeddings-inference/custom_container) [Using TEI on AMD Instinct GPUs (ROCm)→](/docs/text-embeddings-inference/amd_gpu)