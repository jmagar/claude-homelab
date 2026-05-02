Using NVIDIA TensorRT-LLM to run gpt-oss-20b
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
Aug 5, 2025
# Using NVIDIA TensorRT-LLM to run gpt-oss-20b
[ JR ](https://www.linkedin.com/in/jayrodge/)
[ Jay Rodge ](https://www.linkedin.com/in/jayrodge/)
[
View on GitHub
](https://github.com/openai/openai-cookbook/blob/main/articles/gpt-oss/run-nvidia.ipynb) [
Download raw
](https://raw.githubusercontent.com/openai/openai-cookbook/main/articles/gpt-oss/run-nvidia.ipynb)
This notebook provides a step-by-step guide on how to optimizing `gpt-oss` models using NVIDIA’s TensorRT-LLM for high-performance inference. TensorRT-LLM provides users with an easy-to-use Python API to define Large Language Models (LLMs) and support state-of-the-art optimizations to perform inference efficiently on NVIDIA GPUs. TensorRT-LLM also contains components to create Python and C++ runtimes that orchestrate the inference execution in performant way.
TensorRT-LLM supports both models:
* `gpt-oss-20b`
* `gpt-oss-120b`
In this guide, we will run `gpt-oss-20b`, if you want to try the larger model or want more customization refer to [this](https://github.com/NVIDIA/TensorRT-LLM/blob/main/docs/source/blogs/tech_blog/blog9_Deploying_GPT_OSS_on_TRTLLM.md) deployment guide.
Note: Your input prompts should use the [harmony response](http://cookbook.openai.com/articles/openai-harmony) format for the model to work properly, though this guide does not require it.
#### Launch on NVIDIA Brev
You can simplify the environment setup by using [NVIDIA Brev](https://developer.nvidia.com/brev). Click the button below to launch this project on a Brev instance with the necessary dependencies pre-configured.
Once deployed, click on the “Open Notebook” button to get start with this guide
[](https://brev.nvidia.com/launchable/deploy?launchableID=env-30i1YjHsRWT109HL6eYxLUeHIwF)
## Prerequisites
### Hardware
To run the gpt-oss-20b model, you will need an NVIDIA GPU with at least 20 GB of VRAM.
Recommended GPUs: NVIDIA Hopper (e.g., H100, H200), NVIDIA Blackwell (e.g., B100, B200), NVIDIA RTX PRO, NVIDIA RTX 50 Series (e.g., RTX 5090).
### Software
* CUDA Toolkit 12.8 or later
* Python 3.12 or later
## Installing TensorRT-LLM
There are multiple ways to install TensorRT-LLM. In this guide, we’ll cover using a pre-built Docker container from NVIDIA NGC as well as building from source.
If you’re using NVIDIA Brev, you can skip this section.
## Using NVIDIA NGC
Pull the pre-built [TensorRT-LLM container](https://catalog.ngc.nvidia.com/orgs/nvidia/teams/tensorrt-llm/containers/release/tags) for GPT-OSS from [NVIDIA NGC](https://www.nvidia.com/en-us/gpu-cloud/).
This is the easiest way to get started and ensures all dependencies are included.
```
`docker pull nvcr.io/nvidia/tensorrt-llm/release:gpt-oss-dev
docker run --gpus all -it --rm -v $(pwd):/workspace nvcr.io/nvidia/tensorrt-llm/release:gpt-oss-dev`
```
## Using Docker (Build from Source)
Alternatively, you can build the TensorRT-LLM container from source.
This approach is useful if you want to modify the source code or use a custom branch.
For detailed instructions, see the [official documentation](https://github.com/NVIDIA/TensorRT-LLM/tree/feat/gpt-oss/docker).
TensorRT-LLM will be available through pip soon
>
> Note on GPU Architecture: The first time you run the model, TensorRT-LLM will build an optimized engine for your specific GPU architecture (e.g., Hopper, Ada, or Blackwell). If you see warnings about your GPU’s CUDA capability (e.g., sm_90, sm_120) not being compatible with the PyTorch installation, ensure you have the latest NVIDIA drivers and a matching CUDA Toolkit version for your version of PyTorch.
>
# Verifying TensorRT-LLM Installation
```
`from tensorrt\_llm import LLM, SamplingParams`
```
# Utilizing TensorRT-LLM Python API
In the next code cell, we will demonstrate how to use the TensorRT-LLM Python API to:
1. Download the specified model weights from Hugging Face (using your HF\_TOKEN for authentication).
2. Automatically build the TensorRT engine for your GPU architecture if it does not already exist.
3. Load the model and prepare it for inference.
4. Run a simple text generation example to verify everything is working.
**Note**: The first run may take several minutes as it downloads the model and builds the engine.
Subsequent runs will be much faster, as the engine will be cached.
```
`llm = LLM(model="openai/gpt-oss-20b")`
```
```
`prompts = ["Hello, my name is", "The capital of France is"]
sampling\_params = SamplingParams(temperature=0.8, top\_p=0.95)
for output in llm.generate(prompts, sampling\_params):
print(f"Prompt: {output.prompt!r}, Generated text: {output.outputs[0].text!r}")`
```
# Conclusion and Next Steps
Congratulations! You have successfully optimized and run a large language model using the TensorRT-LLM Python API.
In this notebook, you have learned how to:
* Set up your environment with the necessary dependencies.
* Use the `tensorrt\_llm.LLM` API to download a model from the Hugging Face Hub.
* Automatically build a high-performance TensorRT engine tailored to your GPU.
* Run inference with the optimized model.
You can explore more advanced features to further improve performance and efficiency:
* Benchmarking: Try running a [benchmark](https://nvidia.github.io/TensorRT-LLM/performance/performance-tuning-guide/benchmarking-default-performance.html#benchmarking-with-trtllm-bench) to compare the latency and throughput of the TensorRT-LLM engine against the original Hugging Face model. You can do this by iterating over a larger number of prompts and measuring the execution time.
* Quantization: TensorRT-LLM [supports](https://github.com/NVIDIA/TensorRT-Model-Optimizer) various quantization techniques (like INT8 or FP8) to reduce model size and accelerate inference with minimal impact on accuracy. This is a powerful feature for deploying models on resource-constrained hardware.
* Deploy with NVIDIA Dynamo: For production environments, you can deploy your TensorRT-LLM engine using the [NVIDIA Dynamo](https://docs.nvidia.com/dynamo/latest/) for robust, scalable, and multi-model serving.