Serving private and gated models · Hugging Face
text-embeddings-inference documentation
Serving private and gated models
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
# [](#serving-private-and-gated-models) Serving private and gated models
If the model you wish to serve is behind gated access or resides in a private model repository on Hugging Face Hub,
you will need to have access to the model to serve it.
Once you have confirmed that you have access to the model:
* Navigate to your account’s [Profile | Settings | Access Tokens page](https://huggingface.co/settings/tokens).
* Generate and copy a read token.
If you’re the CLI, set the `HF\_TOKEN` environment variable. For example:
Copied
```
export HF\_TOKEN=\<YOUR READ TOKEN\>
```
Alternatively, you can provide the token when deploying the model with Docker:
Copied
```
model=\<your private model\>
volume=$PWD/data
token=\<your cli Hugging Face Hub token\>
docker run --gpus all -e HF\_TOKEN=$token -p 8080:80 -v $volume:/data --pull always ghcr.io/huggingface/text-embeddings-inference:cuda-1.9 --model-id $model
```
[ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/private_models.md)
[←Using TEI locally with GPU](/docs/text-embeddings-inference/local_gpu) [Build custom container for TEI→](/docs/text-embeddings-inference/custom_container)