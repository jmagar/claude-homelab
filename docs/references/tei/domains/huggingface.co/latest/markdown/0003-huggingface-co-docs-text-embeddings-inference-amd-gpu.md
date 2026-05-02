Using TEI on AMD Instinct GPUs (ROCm) · Hugging Face
text-embeddings-inference documentation
Using TEI on AMD Instinct GPUs (ROCm)
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
# [](#using-tei-on-amd-instinct-gpus-rocm) Using TEI on AMD Instinct GPUs (ROCm)
> AMD ROCm support is
**> experimental
**> . Only AMD Instinct GPUs (MI200, MI300 series) are tested.
Text Embeddings Inference can run on AMD Instinct GPUs using [ROCm](https://rocm.docs.amd.com/). The implementation uses PyTorch’s built-in `scaled\_dot\_product\_attention` as the attention backend.
## [](#prerequisites) Prerequisites
* AMD Instinct GPU (MI200, MI300 series) with ROCm 6.x drivers on the host
* Either a working ROCm PyTorch installation, **or** the `rocm/pytorch:latest` Docker image (recommended)
The recommended way to get started is to use AMD’s official ROCm PyTorch image, which ships with PyTorch and ROCm pre-installed. Alternatively, you can install ROCm PyTorch directly on the host with `pip install torch --index-url https://download.pytorch.org/whl/rocm6.2` and skip Step 1.
## [](#step-1-start-the-container) Step 1: Start the container
Copied
```
docker run -it --device=/dev/kfd --device=/dev/dri \\
--group-add video --shm-size 8g \\
-v $PWD:/workspace \\
rocm/pytorch:latest bash
```
Inside the container, clone the TEI repository (or mount it via `-v`) and run the remaining steps from the repo root.
## [](#step-2-install-rust) Step 2: Install Rust
Copied
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
```
## [](#step-3-install-python-dependencies) Step 3: Install Python dependencies
PyTorch is already provided by the container image, so install the remaining dependencies without pulling a new torch:
Copied
```
pip install --no-deps -r backends/python/server/requirements-amd.txt
pip install safetensors opentelemetry-api opentelemetry-sdk \\
opentelemetry-exporter-otlp-proto-grpc grpcio-reflection \\
grpc-interceptor einops packaging
```
## [](#step-4-generate-protobuf-stubs) Step 4: Generate protobuf stubs
Copied
```
pip install grpcio-tools==1.62.2 mypy-protobuf==3.6.0 types-protobuf
mkdir -p backends/python/server/text\_embeddings\_server/pb
python -m grpc\_tools.protoc \\
-I backends/proto \\
--python\_out=backends/python/server/text\_embeddings\_server/pb \\
--grpc\_python\_out=backends/python/server/text\_embeddings\_server/pb \\
--mypy\_out=backends/python/server/text\_embeddings\_server/pb \\
backends/proto/embed.proto
# Fix relative imports in generated files
find backends/python/server/text\_embeddings\_server/pb/ -name "\*.py" \\
-exec sed -i 's/^\\(import.\*pb2\\)/from . \\1/g' {} \\;
touch backends/python/server/text\_embeddings\_server/pb/\_\_init\_\_.py
```
## [](#step-5-install-the-python-server-package) Step 5: Install the Python server package
Copied
```
pip install -e backends/python/server
```
## [](#step-6-build-the-rust-router) Step 6: Build the Rust router
Copied
```
cargo build --release \\
--no-default-features \\
--features python,http \\
--bin text-embeddings-router
```
## [](#step-7-launch-tei) Step 7: Launch TEI
Copied
```
model=BAAI/bge-base-en-v1.5
./target/release/text-embeddings-router --model-id $model --dtype bfloat16 --port 8080
```
Once the server is ready, you can test it with a simple embed request:
Copied
```
curl http://localhost:8080/embed \\
-X POST \\
-H 'Content-Type: application/json' \\
-d '{"inputs": "What is Deep Learning?"}'
```
## [](#verifying-gpu-detection) Verifying GPU detection
After launch you should see a log line confirming ROCm was detected:
Copied
```
INFO text\_embeddings\_server::utils::device: ROCm / HIP version: X.Y.Z
```
You can also verify from Python:
Copied
```
import torch
print(torch.cuda.is\_available()) # True
print(torch.version.hip) # e.g. 6.2.12345-...
```
## [](#notes) Notes
This is a work in progress — more model support and optimized operations for AMD GPUs are coming soon.
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/amd_gpu.md)
[←Using TEI container with Intel Hardware](/docs/text-embeddings-inference/intel_container) [Example uses→](/docs/text-embeddings-inference/examples)