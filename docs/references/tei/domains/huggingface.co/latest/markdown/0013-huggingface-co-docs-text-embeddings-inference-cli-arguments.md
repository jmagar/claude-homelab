CLI arguments · Hugging Face
text-embeddings-inference documentation
CLI arguments
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
# [](#cli-arguments) CLI arguments
To see all options to serve your models, run the following:
Copied
```
$ text-embeddings-router --help
Text Embedding Webserver
Usage: text-embeddings-router [OPTIONS] --model-id \<MODEL\_ID\>
Options:
--model-id \<MODEL\_ID\>
The Hugging Face model ID, can be any model listed on \<https://huggingface.co/models\> with the `text-embeddings-inference` tag (meaning it's compatible with Text Embeddings Inference).
Alternatively, the specified ID can also be a path to a local directory containing the necessary model files saved by the `save\_pretrained(...)` methods of either Transformers or Sentence Transformers.
[env: MODEL\_ID=]
--revision \<REVISION\>
The actual revision of the model if you're referring to a model on the hub. You can use a specific commit id or a branch like `refs/pr/2`
[env: REVISION=]
--tokenization-workers \<TOKENIZATION\_WORKERS\>
Optionally control the number of tokenizer workers used for payload tokenization, validation and truncation. Default to the number of CPU cores on the machine
[env: TOKENIZATION\_WORKERS=]
--dtype \<DTYPE\>
The dtype to be forced upon the model
[env: DTYPE=]
[possible values: float16, float32]
--served-model-name \<SERVED\_MODEL\_NAME\>
The name of the model that is being served. If not specified, defaults to `--model-id`. It is only used for the OpenAI-compatible endpoints via HTTP
[env: SERVED\_MODEL\_NAME=]
--pooling \<POOLING\>
Optionally control the pooling method for embedding models.
If `pooling` is not set, the pooling configuration will be parsed from the model `1\_Pooling/config.json` configuration.
If `pooling` is set, it will override the model pooling configuration
[env: POOLING=]
Possible values:
- cls: Select the CLS token as embedding
- mean: Apply Mean pooling to the model embeddings
- splade: Apply SPLADE (Sparse Lexical and Expansion) to the model embeddings. This option is only available if the loaded model is a `ForMaskedLM` Transformer model
- last-token: Select the last token as embedding
--max-concurrent-requests \<MAX\_CONCURRENT\_REQUESTS\>
The maximum amount of concurrent requests for this particular deployment. Having a low limit will refuse clients requests instead of having them wait for too long and is usually good to handle backpressure correctly
[env: MAX\_CONCURRENT\_REQUESTS=]
[default: 512]
--max-batch-tokens \<MAX\_BATCH\_TOKENS\>
\*\*IMPORTANT\*\* This is one critical control to allow maximum usage of the available hardware.
This represents the total amount of potential tokens within a batch.
For `max\_batch\_tokens=1000`, you could fit `10` queries of `total\_tokens=100` or a single query of `1000` tokens.
Overall this number should be the largest possible until the model is compute bound. Since the actual memory overhead depends on the model implementation, text-embeddings-inference cannot infer this number automatically.
[env: MAX\_BATCH\_TOKENS=]
[default: 16384]
--max-batch-requests \<MAX\_BATCH\_REQUESTS\>
Optionally control the maximum number of individual requests in a batch
[env: MAX\_BATCH\_REQUESTS=]
--max-client-batch-size \<MAX\_CLIENT\_BATCH\_SIZE\>
Control the maximum number of inputs that a client can send in a single request
[env: MAX\_CLIENT\_BATCH\_SIZE=]
[default: 32]
--auto-truncate
Control automatic truncation of inputs that exceed the model's maximum supported size. Defaults to `true` (truncation enabled). Set to `false` to disable truncation; when disabled and the model's maximum input length exceeds `--max-batch-tokens`, the server will refuse to start with an error instead of silently truncating sequences.
Unused for gRPC servers
[env: AUTO\_TRUNCATE=]
--default-prompt-name \<DEFAULT\_PROMPT\_NAME\>
The name of the prompt that should be used by default for encoding. If not set, no prompt will be applied.
Must be a key in the `sentence-transformers` configuration `prompts` dictionary.
For example if ``default\_prompt\_name`` is "query" and the ``prompts`` is {"query": "query: ", ...}, then the sentence "What is the capital of France?" will be encoded as "query: What is the capital of France?" because the prompt text will be prepended before any text to encode.
The argument '--default-prompt-name \<DEFAULT\_PROMPT\_NAME\>' cannot be used with '--default-prompt \<DEFAULT\_PROMPT\>`
[env: DEFAULT\_PROMPT\_NAME=]
--default-prompt \<DEFAULT\_PROMPT\>
The prompt that should be used by default for encoding. If not set, no prompt will be applied.
For example if ``default\_prompt`` is "query: " then the sentence "What is the capital of France?" will be encoded as "query: What is the capital of France?" because the prompt text will be prepended before any text to encode.
The argument '--default-prompt \<DEFAULT\_PROMPT\>' cannot be used with '--default-prompt-name \<DEFAULT\_PROMPT\_NAME\>`
[env: DEFAULT\_PROMPT=]
--dense-path \<DENSE\_PATH\>
Optionally, define the path to the Dense module required for some embedding models.
Some embedding models require an extra `Dense` module which contains a single Linear layer and an activation function. By default, those `Dense` modules are stored under the `2\_Dense` directory, but there might be cases where different `Dense` modules are provided, to convert the pooled embeddings into different dimensions, available as `2\_Dense\_\<dims\>` e.g. https://huggingface.co/NovaSearch/stella\_en\_400M\_v5.
Note that this argument is optional, only required to be set if there is no `modules.json` file or when you want to override a single Dense module path, only when running with the `candle` backend.
[env: DENSE\_PATH=]
--hf-token \<HF\_TOKEN\>
Your Hugging Face Hub token. If neither `--hf-token` nor `HF\_TOKEN` are set, the token will be read from the `$HF\_HOME/token` path, if it exists. This ensures access to private or gated models, and allows for a more permissive rate limiting
[env: HF\_TOKEN=]
--hostname \<HOSTNAME\>
The IP address to listen on
[env: HOSTNAME=]
[default: 0.0.0.0]
-p, --port \<PORT\>
The port to listen on
[env: PORT=]
[default: 3000]
--uds-path \<UDS\_PATH\>
The name of the unix socket some text-embeddings-inference backends will use as they communicate internally with gRPC
[env: UDS\_PATH=]
[default: /tmp/text-embeddings-inference-server]
--huggingface-hub-cache \<HUGGINGFACE\_HUB\_CACHE\>
The location of the huggingface hub cache. Used to override the location if you want to provide a mounted disk for instance
[env: HUGGINGFACE\_HUB\_CACHE=]
--payload-limit \<PAYLOAD\_LIMIT\>
Payload size limit in bytes
Default is 2MB
[env: PAYLOAD\_LIMIT=]
[default: 2000000]
--api-key \<API\_KEY\>
Set an api key for request authorization.
By default the server responds to every request. With an api key set, the requests must have the Authorization header set with the api key as Bearer token.
[env: API\_KEY=]
--json-output
Outputs the logs in JSON format (useful for telemetry)
[env: JSON\_OUTPUT=]
--disable-spans
Whether or not to include the log trace through spans
[env: DISABLE\_SPANS=]
--otlp-endpoint \<OTLP\_ENDPOINT\>
The grpc endpoint for opentelemetry. Telemetry is sent to this endpoint as OTLP over gRPC. e.g. `http://localhost:4317`
[env: OTLP\_ENDPOINT=]
--otlp-service-name \<OTLP\_SERVICE\_NAME\>
The service name for opentelemetry. e.g. `text-embeddings-inference.server`
[env: OTLP\_SERVICE\_NAME=]
[default: text-embeddings-inference.server]
--prometheus-port \<PROMETHEUS\_PORT\>
The Prometheus port to listen on
[env: PROMETHEUS\_PORT=]
[default: 9000]
--cors-allow-origin \<CORS\_ALLOW\_ORIGIN\>
Unused for gRPC servers
[env: CORS\_ALLOW\_ORIGIN=]
-h, --help
Print help (see a summary with '-h')
-V, --version
Print version
```
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/cli_arguments.md)
[←Cloud Run](/docs/text-embeddings-inference/tei_cloud_run)