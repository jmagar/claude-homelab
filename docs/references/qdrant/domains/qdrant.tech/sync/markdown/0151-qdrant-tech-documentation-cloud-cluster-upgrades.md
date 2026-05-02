Update Clusters - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Managed Cloud](https://qdrant.tech/documentation/cloud/)
*
* Update Clusters# Updating Qdrant Cloud Clusters
As soon as a new Qdrant version is available. Qdrant Cloud will show you an update notification in the Cluster list and on the Cluster details page.
To update to a new version, go to the Cluster Details page, choose the new version from the version dropdown and click **Update**.
If you are several versions behind, multiple updates might be required to reach the latest version. In this case, Qdrant Cloud will automatically perform the required intermediate updates to ensure a supported update path. You need to ensure that your client applications and used SDKs are compatible with the target version.
We recommend first updating the client SDKs, and after that update the cluster to ensure a smooth update process. All client SDKs are tested to be backwards compatible with the latest 3 minor versions of Qdrant.
If you have a multi-node cluster and if your collections have a replication factor of at least **2**, the update process will be zero-downtime and done in a rolling fashion. You will be able to use your database cluster normally.
If you have a single-node cluster or a collection with a replication factor of **1**, the update process will require a short downtime period to restart your cluster with the new version.
See also [Restart Mode](https://qdrant.tech/documentation/cloud/configure-cluster/#restart-mode) for more details.
We advise taking a [backup](https://qdrant.tech/documentation/cloud/backups/) before updating to allow for rollbacks.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/cloud/cluster-upgrades.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/cloud/cluster-upgrades/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/cloud/cluster-upgrades.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)