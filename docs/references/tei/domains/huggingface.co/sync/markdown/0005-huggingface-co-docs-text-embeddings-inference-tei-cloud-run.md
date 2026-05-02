Deploying TEI on Google Cloud Run · Hugging Face
text-embeddings-inference documentation
Deploying TEI on Google Cloud Run
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
# [](#deploying-tei-on-google-cloud-run) Deploying TEI on Google Cloud Run
Deploying Text Embeddings Inference (TEI) on Google Cloud Platform (GCP) allows to benefit from the underlying [Kubernetes](https://kubernetes.io/) technology which ensures that TEI can scale automatically up or down based on demand.
On Google Cloud, there are 3 main options for deploying TEI (or any other Docker container):
* Cloud Run
* Vertex AI endpoints
* GKE (Google Kubernetes Engine).
This guide explains how to deploy TEI on Cloud Run, a fully managed service by Google. Cloud Run is a so-called serverless offering. This means that the server infrastructure is handled by Google, you only need to provide a Docker container. The benefit of this is that you only pay for compute when there is demand for your application. Cloud Run will automatically spin up servers when there’s demand, and scale down to zero when there is no demand.
We will showcase how to deploy any text embedding model with or without a GPU.
> At the time of writing, GPU support on Cloud Run is generally available in 4 regions. If you’re interested in using it,
[> request a quota increase
](https://cloud.google.com/run/quotas#increase)> for
`> Total Nvidia L4 GPU allocation, per project per region
`> . So far, NVIDIA L4 GPUs (24GiB VRAM) are the only available GPUs on Cloud Run; enabling automatic scaling up to 7 instances by default (more available via quota), as well as scaling down to zero instances when there are no requests.
## [](#setup--configuration) Setup / Configuration
This guide already assumes you have set up a Google Cloud project and have enabled billing. This can be done at [https://console.cloud.google.com/](https://console.cloud.google.com/).
First, you need to install the [gcloud CLI](https://cloud.google.com/sdk/docs/install) on your local machine. This allows to programmatically interact with your Google Cloud project.
Optionally, to ease the usage of the commands within this tutorial, you need to set the following environment variables for GCP:
Copied
```
export PROJECT\_ID=your-project-id
export LOCATION=europe-west1 # or any location you prefer: https://cloud.google.com/run/docs/locations
export CONTAINER\_URI="gcr.io/deeplearning-platform-release/huggingface-text-embeddings-inference-cpu.1-6"
export SERVICE\_NAME="text-embedding-server" # choose a name for your service
export MODEL\_ID="ibm-granite/granite-embedding-278m-multilingual" # choose any embedding model
```
Some clarifications:
* We provide the latest official Docker image URI based on the [README](https://github.com/huggingface/Google-Cloud-Containers/blob/main/containers/tei/README.md).
* We choose to deploy the [IBM granite](https://huggingface.co/ibm-granite/granite-embedding-278m-multilingual) embedding model given its strong multilingual capabilities. One can of course choose any other embedding model from the hub. It’s recommended to look for models tagged with either `feature-extraction`, `sentence-similarity` or `text-ranking`.
Then you need to login into your Google Cloud account and set the project ID you want to use to deploy Cloud Run.
Copied
```
gcloud auth login
gcloud auth application-default login # For local development
gcloud config set project $PROJECT\_ID
```
Once you are logged in, you need to enable the Cloud Run API, which is required for the Hugging Face DLC for TEI deployment on Cloud Run.
Copied
```
gcloud services enable run.googleapis.com
```
## [](#deploy-tei-on-cloud-run) Deploy TEI on Cloud Run
Once you are all set, you can call the `gcloud run deploy` command to deploy the Docker image.
The command needs you to specify the following parameters:
* `--image`: The container image URI to deploy.
* `--args`: The arguments to pass to the container entrypoint, being `text-embeddings-inference` for the Hugging Face DLC for TEI. Read more about the supported arguments [here](https://huggingface.co/docs/text-embeddings-inference/cli_arguments).
* `--model-id`: The model ID to use, in this case, [`ibm-granite/granite-embedding-278m-multilingual`](https://huggingface.co/ibm-granite/granite-embedding-278m-multilingual).
* `--quantize`: The quantization method to use. If not specified, it will be retrieved from the `quantization\_config-\>quant\_method` in the `config.json` file.
* `--max-concurrent-requests`: The maximum amount of concurrent requests for this particular deployment. Having a low limit will refuse clients requests instead of having them wait for too long and is usually good to handle back pressure correctly. Set to 64, but default is 128.
* `--port`: The port the container listens to.
* `--cpu` and `--memory`: The number of CPUs and amount of memory to allocate to the container. Needs to be set to 4 and 16Gi (16 GiB), respectively; as that’s the minimum requirement for using the GPU.
* `--no-cpu-throttling`: Disables CPU throttling, which is required for using the GPU.
* `--gpu` and `--gpu-type`: The number of GPUs and the GPU type to use. Needs to be set to 1 and `nvidia-l4`, respectively; as at the time of writing this tutorial, those are the only available options as Cloud Run on GPUs.
* `--max-instances`: The maximum number of instances to run, set to 3, but default maximum value is 7. Alternatively, one could set it to 1 too, but that could eventually lead to downtime during infrastructure migrations, so anything above 1 is recommended.
* `--concurrency`: the maximum number of concurrent requests per instance, set to 64. Note that this value is also aligned with the [`--max-concurrent-requests`](https://huggingface.co/docs/text-embeddings-inference/cli_arguments) argument in TEI.
* `--region`: The region to deploy the Cloud Run service.
* `--no-allow-unauthenticated`: Disables unauthenticated access to the service, which is a good practice as adds an authentication layer managed by Google Cloud IAM.
> Optionally, you can include the arguments
`> --vpc-egress=all-traffic
`> and
`> --subnet=default
`> , as there is external traffic being sent to the public internet, so in order to speed the network, you need to route all traffic through the VPC network by setting those flags. Note that besides setting the flags, you need to set up Google Cloud NAT to reach the public internet, which is a paid product. Find more information in
[> Cloud Run Documentation - Networking best practices
](https://cloud.google.com/run/docs/configuring/networking-best-practices)> .
>
>
> Copied
>
```
> gcloud compute routers create nat-router --network=default --region=
> $LOCATION
> gcloud compute routers nats create vm-nat --router=nat-router --region=
> $LOCATION
> --auto-allocate-nat-external-ips --nat-all-subnet-ip-ranges
```
Finally, you can run the `gcloud run deploy` command to deploy TEI on Cloud Run as:
Copied
```
gcloud run deploy $SERVICE\_NAME \\
--image=$CONTAINER\_URI \\
--args="--model-id=$MODEL\_ID,--max-concurrent-requests=64" \\
--set-env-vars=HF\_HUB\_ENABLE\_HF\_TRANSFER=1 \\
--port=8080 \\
--cpu=8 \\
--memory=32Gi \\
--region=$LOCATION \\
--no-allow-unauthenticated
```
If you want to deploy with a GPU, run the following command:
Copied
```
gcloud run deploy $SERVICE\_NAME \\
--image=$CONTAINER\_URI \\
--args="--model-id=$MODEL\_ID,--max-concurrent-requests=64" \\
--set-env-vars=HF\_HUB\_ENABLE\_HF\_TRANSFER=1 \\
--port=8080 \\
--cpu=8 \\
--memory=32Gi \\
--no-cpu-throttling \\
--gpu=1 \\
--gpu-type=nvidia-l4 \\
--max-instances=3 \\
--concurrency=64 \\
--region=$LOCATION \\
--no-allow-unauthenticated
```
Or as it follows if you created the Cloud NAT:
Copied
```
gcloud beta run deploy $SERVICE\_NAME \\
--image=$CONTAINER\_URI \\
--args="--model-id=$MODEL\_ID,--max-concurrent-requests=64" \\
--set-env-vars=HF\_HUB\_ENABLE\_HF\_TRANSFER=1 \\
--port=8080 \\
--cpu=8 \\
--memory=32Gi \\
--no-cpu-throttling \\
--gpu=1 \\
--gpu-type=nvidia-l4 \\
--max-instances=3 \\
--concurrency=64 \\
--region=$LOCATION \\
--no-allow-unauthenticated \\
--vpc-egress=all-traffic \\
--subnet=default
```
> The first time you deploy a new container on Cloud Run it will take around 5 minutes to deploy as it needs to import it from the Google Cloud Artifact Registry, but on the follow up deployments it will take less time as the image has been already imported before.
## [](#inference) Inference
Once deployed, you can send requests to the service via any of the supported TEI endpoints, check TEI’s [OpenAPI Specification](https://huggingface.github.io/text-embeddings-inference/) to see all the available endpoints and their respective parameters.
All Cloud Run services are deployed privately by default, which means that they can’t be accessed without providing authentication credentials in the request headers. These services are secured by IAM and are only callable by Project Owners, Project Editors, and Cloud Run Admins and Cloud Run Invokers.
In this case, a couple of alternatives to enable developer access will be showcased; while the other use cases are out of the scope of this example, as those are either not secure due to the authentication being disabled (for public access scenarios), or require additional setup for production-ready scenarios (service-to-service authentication, end-user access).
> The alternatives mentioned below are for development scenarios, and should not be used in production-ready scenarios as is. The approach below is following the guide defined in
[> Cloud Run Documentation - Authenticate Developers
](https://cloud.google.com/run/docs/authenticating/developers)> ; but you can find every other guide as mentioned above in
[> Cloud Run Documentation - Authentication overview
](https://cloud.google.com/run/docs/authenticating/overview)> .
### [](#via-cloud-run-proxy) Via Cloud Run Proxy
Cloud Run Proxy runs a server on localhost that proxies requests to the specified Cloud Run Service with credentials attached; which is useful for testing and experimentation.
Copied
```
gcloud run services proxy $SERVICE\_NAME --region $LOCATION
```
Then you can send requests to the deployed service on Cloud Run, using the http://localhost:8080 URL, with no authentication, exposed by the proxy as shown in the examples below. You can check the API docs at http://localhost:8080/docs in your browser.
#### [](#curl) cURL
To send a POST request to the TEI service using cURL, you can run the following command:
Copied
```
curl http://localhost:8080/embed \\
-X POST \\
-H 'Content-Type: application/json' \\
-d '{
"model": "tei",
"text": "What is deep learning?"
}'
```
Alternatively, one can also send requests to the OpenAI-compatible endpoint:
Copied
```
curl http://localhost:8080/v1/embeddings \\
-X POST \\
-H 'Content-Type: application/json' \\
-d '{
"model": "tei",
"text": "What is deep learning?"
}'
```
#### [](#python) Python
To run inference using Python, you can either use the [huggingface\_hub](https://huggingface.co/docs/huggingface_hub/en/index) Python SDK (recommended) or the openai Python SDK.
##### [](#huggingfacehub) huggingface\_hub
You can install it via pip as `pip install --upgrade --quiet huggingface\_hub`, and then run:
Copied
```
from huggingface\_hub import InferenceClient
client = InferenceClient()
embedding = client.feature\_extraction("What is deep learning?",
model="http://localhost:8080/embed")
print(len(embedding[0]))
```
#### [](#openai) OpenAI
You can install it via pip as `pip install --upgrade openai`, and then run:
Copied
```
from openai import OpenAI
client = OpenAI(base\_url="http://localhost:8080/v1/embeddings", api\_key="")
response = client.embeddings.create(
model="tei",
input="What is deep learning?"
)
print(response)
```
### [](#recommended-via-cloud-run-service-url) (recommended) Via Cloud Run Service URL
Cloud Run Service has an unique URL assigned that can be used to send requests from anywhere, using the Google Cloud Credentials with Cloud Run Invoke access to the service; which is the recommended approach as it’s more secure and consistent than using the Cloud Run Proxy.
The URL of the Cloud Run service can be obtained via the following command (assigned to the SERVICE\_URL variable for convenience):
Copied
```
SERVICE\_URL=$(gcloud run services describe $SERVICE\_NAME --region $LOCATION --format 'value(status.url)')
```
Then you can send requests to the deployed service on Cloud Run, using the `SERVICE\_URL` and any Google Cloud Credentials with Cloud Run Invoke access. For setting up the credentials there are multiple approaches, some of those are listed below:
Using the default identity token from the Google Cloud SDK:
* Via gcloud as:
Copied
```
gcloud auth print-identity-token
```
* Via Python as:
Copied
```
import google.auth
from google.auth.transport.requests import Request as GoogleAuthRequest
auth\_req = GoogleAuthRequest()
creds, \_ = google.auth.default()
creds.refresh(auth\_req)
id\_token = creds.id\_token
```
* Using a Service Account with Cloud Run Invoke access, which can either be done with any of the following approaches:
**Create a Service Account before the Cloud Run Service was created, and then set the service-account flag to the Service Account email when creating the Cloud Run Service. And use an Access Token for that Service Account only using `gcloud auth print-access-token --impersonate-service-account=SERVICE\_ACCOUNT\_EMAIL`.** Create a Service Account after the Cloud Run Service was created, and then update the Cloud Run Service to use the Service Account. And use an Access Token for that Service Account only using `gcloud auth print-access-token --impersonate-service-account=SERVICE\_ACCOUNT\_EMAIL`.
The recommended approach is to use a Service Account (SA), as the access can be controlled better and the permissions are more granular; as the Cloud Run Service was not created using a SA, which is another nice option, you need to now create the SA, gran it the necessary permissions, update the Cloud Run Service to use the SA, and then generate an access token to set as the authentication token within the requests, that can be revoked later once you are done using it.
* Set the SERVICE\_ACCOUNT\_NAME environment variable for convenience:
Copied
```
export SERVICE\_ACCOUNT\_NAME=tei-invoker
```
* Create the Service Account:
Copied
```
gcloud iam service-accounts create $SERVICE\_ACCOUNT\_NAME
```
* Grant the Service Account the Cloud Run Invoker role:
Copied
```
gcloud run services add-iam-policy-binding $SERVICE\_NAME \\
--member="serviceAccount:$SERVICE\_ACCOUNT\_NAME@$PROJECT\_ID.iam.gserviceaccount.com" \\
--role="roles/run.invoker" \\
--region=$LOCATION
```
Generate the Access Token for the Service Account:
Copied
```
export ACCESS\_TOKEN=$(gcloud auth print-access-token --impersonate-service-account=$SERVICE\_ACCOUNT\_NAME@$PROJECT\_ID.iam.gserviceaccount.com)
```
> The access token is short-lived and will expire, by default after 1 hour. If you want to extend the token lifetime beyond the default, you must create and organization policy and use the —lifetime argument when creating the token. Refer to Access token lifetime to learn more. Otherwise, you can also generate a new token by running the same command again.
Now you can already dive into the different alternatives for sending the requests to the deployed Cloud Run Service using the `SERVICE\_URL` AND `ACCESS\_TOKEN` as described above.
#### [](#curl) cURL
To send a POST request to the TEI service using cURL, you can run the following command:
Copied
```
curl $SERVICE\_URL/v1/embeddigs \\
-X POST \\
-H "Authorization: Bearer $ACCESS\_TOKEN" \\
-H 'Content-Type: application/json' \\
-d '{
"model": "tei",
"text": "What is deep learning?"
}'
```
#### [](#python) Python
To run inference using Python, you can either use the [huggingface\_hub](https://huggingface.co/docs/huggingface_hub/en/index) Python SDK (recommended) or the openai Python SDK.
##### [](#huggingfacehub) huggingface\_hub
You can install it via pip as `pip install --upgrade --quiet huggingface\_hub`, and then run:
Copied
```
import os
from huggingface\_hub import InferenceClient
client = InferenceClient(
base\_url=os.getenv("SERVICE\_URL"),
api\_key=os.getenv("ACCESS\_TOKEN"),
)
embedding = client.feature\_extraction("What is deep learning?",
model="http://localhost:8080/embed")
print(len(embedding[0]))
```
#### [](#openai) OpenAI
You can install it via pip as `pip install --upgrade openai`, and then run:
Copied
```
import os
from openai import OpenAI
client = OpenAI(
base\_url=os.getenv("SERVICE\_URL"),
api\_key=os.getenv("ACCESS\_TOKEN"),
)
response = client.embeddings.create(
model="tei",
input="What is deep learning?"
)
print(response)
```
## [](#resource-clean-up) Resource clean up
Finally, once you are done using TEI on the Cloud Run Service, you can safely delete it to avoid incurring in unnecessary costs e.g. if the Cloud Run services are inadvertently invoked more times than your monthly Cloud Run invoke allocation in the free tier.
To delete the Cloud Run Service you can either go to the Google Cloud Console at [https://console.cloud.google.com/run](https://console.cloud.google.com/run) and delete it manually; or use the Google Cloud SDK via gcloud as follows:
Copied
```
gcloud run services delete $SERVICE\_NAME --region $LOCATION
```
Additionally, if you followed the steps in via Cloud Run Service URL and generated a Service Account and an access token, you can either remove the Service Account, or just revoke the access token if it is still valid.
* (recommended) Revoke the Access Token as:
Copied
```
gcloud auth revoke --impersonate-service-account=$SERVICE\_ACCOUNT\_NAME@$PROJECT\_ID.iam.gserviceaccount.com
```
* (optional) Delete the Service Account as:
Copied
```
gcloud iam service-accounts delete $SERVICE\_ACCOUNT\_NAME@$PROJECT\_ID.iam.gserviceaccount.com
```
Finally, if you decided to enable the VPC network via Cloud NAT, you can also remove the Cloud NAT (which is a paid product) as:
Copied
```
gcloud compute routers nats delete vm-nat --router=nat-router --region=$LOCATION
gcloud compute routers delete nat-router --region=$LOCATION
```
## [](#references) References
* [Cloud Run documentation - Overview](https://cloud.google.com/run/docs)
* [Cloud Run documentation - GPU services](https://cloud.google.com/run/docs/configuring/services/gpu)
* [Google Cloud blog - Run your AI inference applications on Cloud Run with NVIDIA GPUs](https://cloud.google.com/blog/products/application-development/run-your-ai-inference-applications-on-cloud-run-with-nvidia-gpus) [ Update on GitHub](https://github.com/huggingface/text-embeddings-inference/blob/main/docs/source/en/tei_cloud_run.md)
[←Example uses](/docs/text-embeddings-inference/examples) [CLI arguments→](/docs/text-embeddings-inference/cli_arguments)