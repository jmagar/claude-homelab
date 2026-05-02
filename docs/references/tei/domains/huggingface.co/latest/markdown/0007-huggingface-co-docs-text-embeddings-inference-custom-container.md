Build a custom container for TEI · Hugging Face
text-embeddings-inference documentation
Build a custom container for TEI
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
# [](#build-a-custom-container-for-tei) Build a custom container for TEI
You can build our own CPU or CUDA TEI container using Docker. To build a CPU container, run the following command in the
directory containing your custom Dockerfile:
Copied
```
docker build .
```
To build a CUDA container, it is essential to determine the compute capability (compute cap) of the GPU that will be
used at runtime. This information is crucial for the proper configuration of the CUDA containers. The following are
the examples of runtime compute capabilities for various GPU types:
* Turing (T4, RTX 2000 series, …) - `runtime\_compute\_cap=75`
* Ampere 8.0 (A100, …) - `runtime\_compute\_cap=80`
* Ampere 8.6 (A10, …) - `runtime\_compute\_cap=86`
* Ada Lovelace (RTX 4000 series, …) - `runtime\_compute\_cap=89`
* Hopper (H100) - `runtime\_compute\_cap=90`
* Blackwell 10.0 (B200, GB200, …) - `runtime\_compute\_cap=100`
* Blackwell 12.0 (GeForce RTX 50X0, …) - `runtime\_compute\_cap=120`
Once you have determined the compute capability is determined, set it as the `runtime\_compute\_cap` variable and build
the container using `Dockerfile-cuda`:
Copied
```
# Get submodule dependencies
git submodule update --init
runtime\_compute\_cap=80
docker build . -f Dockerfile-cuda --build-arg CUDA\_COMPUTE\_CAP=$runtime\_compute\_cap
```
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/custom_container.md)
[←Serving private and gated models](/docs/text-embeddings-inference/private_models) [Using TEI container with Intel Hardware→](/docs/text-embeddings-inference/intel_container)