Upgrades - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* Upgrades# Upgrading Qdrant
If you are several versions behind, multiple updates might be required to reach the latest version. When upgrading Qdrant, upgrade to the latest patch version of each intermediate minor version first. For example, if you are running version 1.15 and want to upgrade to 1.17, you must first upgrade all cluster nodes to 1.16.3 before upgrading to 1.17. A Qdrant node with version 1.17 will be compatible with a node with version 1.16, but not with a node with version 1.15. If you run a single node cluster, you also can not skip versions to ensure that all data migrations are properly applied. Qdrant Cloud does this automatically for you.
If all collections of a cluster have a replication factor of at least **2**, the update process will be zero-downtime as long as you restart the Qdrant nodes in a rolling fashion. This means that you should restart the nodes one after another, allowing the cluster to maintain availability during the update process. If you have a single-node cluster or a collection with a replication factor of **1**, the update process will require a short downtime period to restart your cluster with the new version.
You need to ensure that your client applications and used SDKs are compatible with the target version.
We recommend first updating the client SDKs, and after that update the cluster to ensure a smooth update process. All client SDKs are tested to be backwards compatible with the latest 3 minor versions of Qdrant.
## Qdrant Cloud
For Qdrant Cloud, see [Cluster Upgrades](https://qdrant.tech/documentation/cloud/cluster-upgrades/).
## Kubernetes
If you are using Helm, you can upgrade your Qdrant cluster by upgrading the Helm release. For example:
```
`helm upgrade qdrant qdrant/qdrant --version \<target-version\> -n \<namespace\>
`
```
Kubernetes will automatically perform a rolling update of the Qdrant StatefulSet.
## Docker
If you run Qdrant using Docker, you can upgrade to a new version by pulling the new image and restarting the Qdrant containers one after another. For example:
```
`docker pull qdrant/qdrant
docker stop qdrant
docker run --name qdrant -d -p 6333:6333 \\
-v $(pwd)/path/to/data:/qdrant/storage \\
qdrant/qdrant
`
```
## Docker Compose
If you run Qdrant using Docker Compose, you can upgrade to a new version by updating the image version in your `docker-compose.yml` file and restarting the Qdrant service.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/upgrades.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/upgrades/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/upgrades.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)