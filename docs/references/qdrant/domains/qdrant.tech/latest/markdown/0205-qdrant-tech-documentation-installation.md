Installation - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* Installation# Installation requirements
The following sections describe the requirements for deploying Qdrant.
## CPU and memory
The preferred size of your CPU and RAM depends on:
* Number of vectors
* Vector dimensions
* [Payloads](https://qdrant.tech/documentation/manage-data/payload/) and their indexes
* Storage
* Replication
* How you configure quantization
Our [Cloud Pricing Calculator](https://cloud.qdrant.io/calculator) can help you estimate required resources without payload or index data.
### Supported CPU architectures:
**64-bit system:**
* x86\_64/amd64
* AArch64/arm64
**32-bit system:**
* Not supported### Storage
For persistent storage, Qdrant requires block-level access to storage devices with a [POSIX-compatible file system](https://www.quobyte.com/storage-explained/posix-filesystem/). Network systems such as [iSCSI](https://en.wikipedia.org/wiki/ISCSI) that provide block-level access are also acceptable.
Qdrant won&rsquo;t work with [Network file systems](https://en.wikipedia.org/wiki/File_system#Network_file_systems) such as NFS, or [Object storage](https://en.wikipedia.org/wiki/Object_storage) systems such as S3.
If you offload vectors to a local disk, we recommend you use a solid-state (SSD or NVMe) drive.
Using Docker/WSL on Windows with mounts is known to have file system problems causing data loss. See [troubleshooting](https://qdrant.tech/documentation/common-errors/#incompatible-file-system).### Networking
Each Qdrant instance requires three open ports:
* `6333` - For the HTTP API, for the [Monitoring](https://qdrant.tech/documentation/ops-monitoring/monitoring/) health and metrics endpoints
* `6334` - For the [gRPC](https://qdrant.tech/documentation/interfaces/#grpc-interface) API
* `6335` - For [Distributed deployment](https://qdrant.tech/documentation/distributed_deployment/)
All Qdrant instances in a cluster must be able to:
* Communicate with each other over these ports
* Allow incoming connections to ports `6333` and `6334` from clients that use Qdrant.### Security
The default configuration of Qdrant might not be secure enough for every situation. Please see [our security documentation](https://qdrant.tech/documentation/security/) for more information.
## Installation options
Qdrant can be installed in different ways depending on your needs:
For production, you can use our Qdrant Cloud to run Qdrant either fully managed in our infrastructure or with Hybrid Cloud in yours.
If you want to run Qdrant in your own infrastructure, without any cloud connection, we recommend to install Qdrant in a Kubernetes cluster with our Qdrant Private Cloud Enterprise Operator.
For testing or development setups, you can run the Qdrant container or as a binary executable. We also provide a Helm chart for an easy installation in Kubernetes.
## Production
### Qdrant Cloud
You can set up production with the [Qdrant Cloud](https://qdrant.to/cloud), which provides fully managed Qdrant databases.
It provides horizontal and vertical scaling, one click installation and upgrades, monitoring, logging, as well as backup and disaster recovery. For more information, see the [Qdrant Cloud documentation](https://qdrant.tech/documentation/cloud/).
### Qdrant Kubernetes Operator
We provide a Qdrant Enterprise Operator for Kubernetes installations as part of our [Qdrant Private Cloud](https://qdrant.tech/documentation/private-cloud/) offering. For more information, [use this form](https://qdrant.to/contact-us) to contact us.
### Kubernetes
You can use a ready-made [Helm Chart](https://helm.sh/docs/) to run Qdrant in your Kubernetes cluster. While it is possible to deploy Qdrant in a distributed setup with the Helm chart, it does not come with the same level of features for zero-downtime upgrades, up and down-scaling, monitoring, logging, and backup and disaster recovery as the Qdrant Cloud offering or the Qdrant Private Cloud Enterprise Operator. Instead you must manage and set this up [yourself](https://qdrant.tech/documentation/distributed_deployment/). Support for the Helm chart is limited to community support.
The following table gives you an overview about the feature differences between the Qdrant Cloud and the Helm chart:
|Feature|Qdrant Helm Chart|Qdrant Cloud|
|Open-source|✅||
|Community support only|✅||
|Quick to get started|✅|✅|
|Vertical and horizontal scaling|✅|✅|
|API keys with granular access control|✅|✅|
|Qdrant version upgrades|✅|✅|
|Support for transit and storage encryption|✅|✅|
|Zero-downtime upgrades with optimized restart strategy||✅|
|Production ready out-of the box||✅|
|Dataloss prevention on downscaling||✅|
|Full cluster backup and disaster recovery||✅|
|Automatic shard rebalancing||✅|
|Re-sharding support||✅|
|Automatic persistent volume scaling||✅|
|Advanced telemetry||✅|
|One-click API key revoking||✅|
|Recreating nodes with new volumes in existing cluster||✅|
|Enterprise support||✅|
To install the helm chart:
```
`helm repo add qdrant https://qdrant.to/helm
helm install qdrant qdrant/qdrant
`
```
For more information, see the [qdrant-helm](https://github.com/qdrant/qdrant-helm/tree/main/charts/qdrant) README.
### Docker and Docker Compose
Usually, we recommend to run Qdrant in Kubernetes, or use the Qdrant Cloud for production setups. This makes setting up highly available and scalable Qdrant clusters with backups and disaster recovery a lot easier.
However, you can also use Docker and Docker Compose to run Qdrant in production, by following the setup instructions in the [Docker](#docker) and [Docker Compose](#docker-compose) Development sections.
In addition, you have to make sure:
* To use a performant [persistent storage](#storage) for your data
* To configure the [security settings](https://qdrant.tech/documentation/security/) for your deployment
* To set up and configure Qdrant on multiple nodes for a highly available [distributed deployment](https://qdrant.tech/documentation/distributed_deployment/)
* To set up a load balancer for your Qdrant cluster
* To create a [backup and disaster recovery strategy](https://qdrant.tech/documentation/snapshots/) for your data
* To integrate Qdrant with your [monitoring](https://qdrant.tech/documentation/ops-monitoring/monitoring/) and logging solutions## Development
For development and testing, we recommend that you set up Qdrant in Docker. We also have different client libraries.
### Docker
The easiest way to start using Qdrant for testing or development is to run the Qdrant container image.
The latest versions are always available on [DockerHub](https://hub.docker.com/r/qdrant/qdrant/tags?page=1&amp;ordering=last_updated).
Make sure that [Docker](https://docs.docker.com/engine/install/), [Podman](https://podman.io/docs/installation) or the container runtime of your choice is installed and running. The following instructions use Docker.
Pull the image:
```
`docker pull qdrant/qdrant
`
```
In the following command, revise `$(pwd)/path/to/data` for your Docker configuration. Then use the updated command to run the container:
```
`docker run -p 6333:6333 \\
-v $(pwd)/path/to/data:/qdrant/storage \\
qdrant/qdrant
`
```
With this command, you start a Qdrant instance with the default configuration.
It stores all data in the `./path/to/data` directory.
By default, Qdrant uses port 6333, so at [localhost:6333](http://localhost:6333) you should see the welcome message.
To change the Qdrant configuration, you can overwrite the production configuration:
```
`docker run -p 6333:6333 \\
-v $(pwd)/path/to/data:/qdrant/storage \\
-v $(pwd)/path/to/custom\_config.yaml:/qdrant/config/production.yaml \\
qdrant/qdrant
`
```
Alternatively, you can use your own `custom\_config.yaml` configuration file:
```
`docker run -p 6333:6333 \\
-v $(pwd)/path/to/data:/qdrant/storage \\
-v $(pwd)/path/to/custom\_config.yaml:/qdrant/config/custom\_config.yaml \\
qdrant/qdrant \\
./qdrant --config-path config/custom\_config.yaml
`
```
For more information, see the [Configuration](https://qdrant.tech/documentation/ops-configuration/configuration/) documentation.
### Docker Compose
You can also use [Docker Compose](https://docs.docker.com/compose/) to run Qdrant.
Here is an example customized compose file for a single node Qdrant cluster:
```
`services:
qdrant:
image: qdrant/qdrant:latest
restart: always
container\_name: qdrant
ports:
- 6333:6333
- 6334:6334
expose:
- 6333
- 6334
- 6335
configs:
- source: qdrant\_config
target: /qdrant/config/production.yaml
volumes:
- ./qdrant\_data:/qdrant/storage
configs:
qdrant\_config:
content: |
log\_level: INFO
`
```
Providing the inline `content` in the [configs top-level element](https://docs.docker.com/compose/compose-file/08-configs/) requires [Docker Compose v2.23.1](https://docs.docker.com/compose/release-notes/#2231) or above. This functionality is supported starting [Docker Engine v25.0.0](https://docs.docker.com/engine/release-notes/25.0/#2500) and [Docker Desktop v4.26.0](https://docs.docker.com/desktop/release-notes/#4260) onwards.### From source
Qdrant is written in Rust and can be compiled into a binary executable.
This installation method can be helpful if you want to compile Qdrant for a specific processor architecture or if you do not want to use Docker.
Before compiling, make sure that the necessary libraries and the [rust toolchain](https://www.rust-lang.org/tools/install) are installed.
The current list of required libraries can be found in the [Dockerfile](https://github.com/qdrant/qdrant/blob/master/Dockerfile).
Build Qdrant with Cargo:
```
`cargo build --release --bin qdrant
`
```
After a successful build, you can find the binary in the following subdirectory `./target/release/qdrant`.
## Client libraries
In addition to the service, Qdrant provides a variety of client libraries for different programming languages. For a full list, see our [Client libraries](https://qdrant.tech/documentation/interfaces/#client-libraries) documentation.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/installation.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/installation/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/installation.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)