Configure the Qdrant Operator
* [Documentation](https://qdrant.tech/documentation/)
*
* [Hybrid Cloud](https://qdrant.tech/documentation/hybrid-cloud/)
*
* Configure the Qdrant Operator# Configuring Qdrant Operator: Advanced Options
The Qdrant Operator has several configuration options, which can be configured in the advanced section of your Hybrid Cloud Environment.
The following YAML shows all configuration options with their default values:
```
`# Additional pod annotations
podAnnotations: {}
# Configuration for the Qdrant operator service monitor to scrape metrics
serviceMonitor:
enabled: false
# Resource requests and limits for the Qdrant operator
resources: {}
# Node selector for the Qdrant operator
nodeSelector: {}
# Tolerations for the Qdrant operator
tolerations: []
# Affinity configuration for the Qdrant operator
affinity: {}
# Configuration for the Qdrant operator (v2)
settings:
# The log level for the operator
# Available options: DEBUG | INFO | WARN | ERROR
logLevel: INFO
# Controller related settings
controller:
# The period a forced recync is done by the controller (if watches are missed / nothing happened)
forceResyncPeriod: 10h
# QPS indicates the maximum QPS to the master from this client.
# Default is 200
qps: 200
# Maximum burst for throttle.
# Default is 500.
burst: 500
# Features contains the settings for enabling / disabling the individual features of the operator
features:
# ClusterManagement contains the settings for qdrant (database) cluster management
clusterManagement:
# Whether or not the Qdrant cluster features are enabled.
# If disabled, all other properties in this struct are disregarded. Otherwise, the individual features will be inspected.
# Default is true.
enable: true
# The StorageClass used to make database and snapshot PVCs.
# Default is nil, meaning the default storage class of Kubernetes.
storageClass:
# The StorageClass used to make database PVCs.
# Default is nil, meaning the default storage class of Kubernetes.
#database:
# The StorageClass used to make snapshot PVCs.
# Default is nil, meaning the default storage class of Kubernetes.
#snapshot:
# Qdrant config contains settings specific for the database
qdrant:
# The config where to find the image for qdrant
image:
# The repository where to find the image for qdrant
# Default is "qdrant/qdrant"
repository: qdrant/qdrant
# Docker image pull policy
# Default "IfNotPresent", unless the tag is dev, master or latest. Then "Always"
#pullPolicy:
# Docker image pull secret name
# This secret should be available in the namespace where the cluster is running
# Default not set
#pullSecretName:
# storage contains the settings for the storage of the Qdrant cluster
storage:
performance:
# CPU budget, how many CPUs (threads) to allocate for an optimization job.
# If 0 - auto selection, keep 1 or more CPUs unallocated depending on CPU size
# If negative - subtract this number of CPUs from the available CPUs.
# If positive - use this exact number of CPUs.
optimizerCpuBudget: 0
# Enable async scorer which uses io\_uring when rescoring.
# Only supported on Linux, must be enabled in your kernel.
# See: \<https://qdrant.tech/articles/io\_uring/#and-what-about-qdrant\>
asyncScorer: false
# Qdrant DB log level
# Available options: DEBUG | INFO | WARN | ERROR
# Default is "INFO"
logLevel: INFO
# Default Qdrant security context configuration
securityContext:
# Enable default security context
# Default is false
enabled: false
# Default user for qdrant container
# Default not set
#user: 1000
# Default fsGroup for qdrant container
# Default not set
#fsUser: 2000
# Default group for qdrant container
# Default not set
#group: 3000
# Network policies configuration for the Qdrant databases
networkPolicies:
ingress:
- ports:
- protocol: TCP
port: 6333
- protocol: TCP
port: 6334
# Allow DNS resolution from qdrant pods at Kubernetes internal DNS server
egress:
- ports:
- protocol: UDP
port: 53
# Scheduling config contains the settings specific for scheduling
scheduling:
# Default topology spread constraints (list from type corev1.TopologySpreadConstraint)
topologySpreadConstraints:
- maxSkew: 1
topologyKey: "kubernetes.io/hostname"
whenUnsatisfiable: "ScheduleAnyway"
# Default pod disruption budget (object from type policyv1.PodDisruptionBudgetSpec)
podDisruptionBudget:
maxUnavailable: 1
# ClusterManager config contains the settings specific for cluster manager
clusterManager:
# Whether or not the cluster manager (on operator level).
# If disabled, all other properties in this struct are disregarded. Otherwise, the individual features will be inspected.
# Default is false.
enable: true
# The endpoint address the cluster manager could be reached
# If set, this should be a full URL like: http://cluster-manager.qdrant-cloud-ns.svc.cluster.local:7333
endpointAddress: http://qdrant-cluster-manager:80
# InvocationInterval is the interval between calls (started after the previous call is retured)
# Default is 10 seconds
invocationInterval: 10s
# Timeout is the duration a single call to the cluster manager is allowed to take.
# Default is 30 seconds
timeout: 30s
# Specifies overrides for the manage rules
manageRulesOverrides:
#dry\_run:
#max\_transfers:
#max\_transfers\_per\_collection:
#rebalance:
#replicate:
# Ingress config contains the settings specific for ingress
ingress:
# Whether or not the Ingress feature is enabled.
# Default is true.
enable: false
# Which specific ingress provider should be used
# Default is KubernetesIngress
provider: KubernetesIngress
# The specific settings when the Provider is QdrantCloudTraefik
qdrantCloudTraefik:
# Enable tls
# Default is false
tls: false
# Secret with TLS certificate
# Default is None
secretName: ""
# List of Traefik middlewares to apply
# Default is an empty list
middlewares: []
# IP Allowlist Strategy for Traefik
# Default is None
ipAllowlistStrategy:
# Enable body validator plugin and matching ingressroute rules
# Default is false
enableBodyValidatorPlugin: false
# The specific settings when the Provider is KubernetesIngress
kubernetesIngress:
# Name of the ingress class
# Default is None
#ingressClassName:
# TelemetryTimeout is the duration a single call to the cluster telemetry endpoint is allowed to take.
# Default is 3 seconds
telemetryTimeout: 3s
# MaxConcurrentReconciles is the maximum number of concurrent Reconciles which can be run. Defaults to 20.
maxConcurrentReconciles: 20
# VolumeExpansionMode specifies the expansion mode, which can be online or offline (e.g. in case of Azure).
# Available options: Online, Offline
# Default is Online
volumeExpansionMode: Online
# BackupManagementConfig contains the settings for backup management
backupManagement:
# Whether or not the backup features are enabled.
# If disabled, all other properties in this struct are disregarded. Otherwise, the individual features will be inspected.
# Default is true.
enable: true
# Snapshots contains the settings for snapshots as part of backup management.
snapshots:
# Whether or not the Snapshot feature is enabled.
# Default is true.
enable: true
# The VolumeSnapshotClass used to make VolumeSnapshots.
# Default is "csi-snapclass".
volumeSnapshotClass: "csi-snapclass"
# The duration a snapshot is retained when the phase becomes Failed or Skipped
# Default is 72h (3d).
retainUnsuccessful: 72h
# MaxConcurrentReconciles is the maximum number of concurrent Reconciles which can be run. Defaults to 1.
maxConcurrentReconciles: 1
# ScheduledSnapshots contains the settings for scheduled snapshot as part of backup management.
scheduledSnapshots:
# Whether or not the ScheduledSnapshot feature is enabled.
# Default is true.
enable: true
# MaxConcurrentReconciles is the maximum number of concurrent Reconciles which can be run. Defaults to 1.
maxConcurrentReconciles: 1
# Restores contains the settings for restoring (a snapshot) as part of backup management.
restores:
# Whether or not the Restore feature is enabled.
# Default is true.
enable: true
# MaxConcurrentReconciles is the maximum number of concurrent Reconciles which can be run. Defaults to 1.
maxConcurrentReconciles: 1
`
```
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/hybrid-cloud/operator-configuration.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/hybrid-cloud/operator-configuration/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/hybrid-cloud/operator-configuration.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)