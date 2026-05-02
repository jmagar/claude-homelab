Changelog - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Private Cloud](https://qdrant.tech/documentation/private-cloud/)
*
* Changelog# Changelog
## 1.9.6 (2026-02-19)
|Component|Version|
|qdrant-kubernetes-api|v1.23.0|
|operator|2.15.0|
|qdrant-cluster-manager|v0.3.17|
|qdrant-cluster-exporter|1.7.6|
Latest validated Qdrant version: 1.17.0
* Support for Qdrant 1.17## 1.9.5 (2026-02-18)
|Component|Version|
|qdrant-kubernetes-api|v1.23.0|
|operator|2.14.0|
|qdrant-cluster-manager|v0.3.17|
|qdrant-cluster-exporter|1.7.6|
Latest validated Qdrant version: 1.16.3
* Performance and stability improvements
* Extended status information in QdrantCluster status
* Support for VolumeAttributeClasses for storage volumes
* Qdrant Pod zone added to QdrantCluster status
* Metrics are additionally exposed on a separate port to allow more granular access control through NetworkPolicies## 1.9.4 (2026-01-15)
|Component|Version|
|qdrant-kubernetes-api|v1.22.1|
|operator|2.9.1|
|qdrant-cluster-manager|v0.3.15|
|qdrant-cluster-exporter|1.7.6|
Latest validated Qdrant version: 1.16.3
* Configurable labels support for cluster-manager
* Limit RBAC for cluster-exporter to release namespace## 1.9.3 (2025-12-22)
|Component|Version|
|qdrant-kubernetes-api|v1.22.1|
|operator|2.9.1|
|qdrant-cluster-manager|v0.3.13|
|qdrant-cluster-exporter|1.7.6|
Latest validated Qdrant version: 1.16.3
* Performance and stability improvements
* Qdrant 1.16 improvements
* Configurable volumeAttributesClassName for storage volumes## 1.9.2 (2025-11-18)
|Component|Version|
|qdrant-kubernetes-api|v1.20.0|
|operator|2.8.3|
|qdrant-cluster-manager|v0.3.9|
|qdrant-cluster-exporter|1.7.2|
* Qdrant 1.16 improvements## 1.9.1 (2025-11-14)
|Component|Version|
|qdrant-kubernetes-api|v1.20.0|
|operator|2.8.1|
|qdrant-cluster-manager|v0.3.9|
|qdrant-cluster-exporter|1.7.2|
* Automated storage class migration
* Support for max\_payload\_index\_count in strict mode
* Experimental support for read replica clusters
* Enable restoring snapshots into another cluster
* Performance and stability improvements## 1.8.0 (2025-08-08)
|Component|Version|
|qdrant-kubernetes-api|v1.17.2|
|operator|2.6.8|
|qdrant-cluster-manager|v0.3.7|
|qdrant-cluster-exporter|1.7.1|
* Add qdrant-cluster-exporter to provide OpenTelemetry/Prometheus metrics for Qdrant clusters## 1.7.3 (2025-08-04)
|Component|Version|
|qdrant-kubernetes-api|v1.17.2|
|operator|2.6.8|
|qdrant-cluster-manager|v0.3.7|
* Configurable max\_request\_size\_mb## 1.7.2 (2025-06-27)
|Component|Version|
|qdrant-kubernetes-api|v1.17.0|
|operator|2.6.4|
|qdrant-cluster-manager|v0.3.7|
* Performance and stability improvements
* Configurable maxCollection## 1.7.1 (2025-06-03)
|Component|Version|
|qdrant-kubernetes-api|v1.16.6|
|operator|2.6.0|
|qdrant-cluster-manager|v0.3.6|
* Performance and stability improvements## 1.7.0 (2025-05-14)
|Component|Version|
|qdrant-kubernetes-api|v1.16.3|
|operator|2.4.2|
|qdrant-cluster-manager|v0.3.5|
* Add optional automatic shard balancing
* Set strict mode by default for new clusters to only allow queries with payload filters on fields that are indexed## 1.6.4 (2025-04-17)
|Component|Version|
|qdrant-kubernetes-api|v1.15.5|
|operator|2.3.4|
|qdrant-cluster-manager|v0.3.4|
* Fix bug in operator Helm chart that caused role binding generation to fail when using `watch.namespaces`## 1.6.3 (2025-03-28)
|Component|Version|
|qdrant-kubernetes-api|v1.15.0|
|operator|2.3.3|
|qdrant-cluster-manager|v0.3.4|
* Performance and stability improvements for collection re-sharding## 1.6.2 (2025-03-21)
|Component|Version|
|qdrant-kubernetes-api|v1.15.0|
|operator|2.3.2|
|qdrant-cluster-manager|v0.3.3|
* Allow disabling NetworkPolicy management in Qdrant Cluster operator## 1.6.1 (2025-03-14)
|Component|Version|
|qdrant-kubernetes-api|v1.14.2|
|operator|2.3.2|
|qdrant-cluster-manager|v0.3.3|
* Add support for GPU instances
* Experimental support for automatic shard balancing## 1.5.1 (2025-03-04)
|Component|Version|
|qdrant-kubernetes-api|v1.12.0|
|operator|2.1.26|
|qdrant-cluster-manager|v0.3.2|
* Fix scaling down clusters that have TLS with self-signed certificates configured
* Various performance improvements and stability fixes## 1.5.0 (2025-02-21)
|Component|Version|
|qdrant-kubernetes-api|v1.12.0|
|operator|2.1.26|
|qdrant-cluster-manager|v0.3.0|
* Added support for P2P TLS configuration
* Faster node removal on scale down
* Various performance improvements and stability fixes## 1.4.0 (2025-01-23)
|Component|Version|
|qdrant-kubernetes-api|v1.8.0|
|operator|2.1.26|
|qdrant-cluster-manager|v0.3.0|
* Support deleting peers on horizontal scale down, even if they are already offline
* Support removing partially deleted peers## 1.3.0 (2025-01-17)
|Component|Version|
|qdrant-kubernetes-api|v1.8.0|
|operator|2.1.21|
|qdrant-cluster-manager|v0.2.10|
* Support for re-sharding with Qdrant \>= 1.13.0## 1.2.0 (2025-01-16)
|Component|Version|
|qdrant-kubernetes-api|v1.8.0|
|operator|2.1.20|
|qdrant-cluster-manager|v0.2.9|
* Performance and stability improvements## 1.1.0 (2024-12-03)
|Component|Version|
|qdrant-kubernetes-api|v1.6.4|
|operator|2.1.10|
|qdrant-cluster-manager|v0.2.6|
* Activate cluster-manager for automatic shard replication## 1.0.0 (2024-11-11)
|Component|Version|
|qdrant-kubernetes-api|v1.2.7|
|operator|0.1.3|
|qdrant-cluster-manager|v0.2.4|
* Initial release
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/private-cloud/changelog.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/private-cloud/changelog/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/private-cloud/changelog.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)