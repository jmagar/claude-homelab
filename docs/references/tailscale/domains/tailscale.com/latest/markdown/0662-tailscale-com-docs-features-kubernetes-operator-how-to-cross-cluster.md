Expose a Service in one cluster to another cluster (cross-cluster connectivity) · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Expose a Service in one cluster to another cluster (cross-cluster connectivity)
Last validated: Jan 5, 2026
You can use the Tailscale Kubernetes Operator to expose a `Service` in one cluster to another cluster. This is done by exposing the `Service` on destination cluster A to the tailnet ([cluster ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress)), and connecting from a source `Service` in cluster B to the tailnet ([cluster egress](/docs/features/kubernetes-operator/how-to/cluster-egress)) to access the `Service` running in cluster A.
For GitOps workflows that need to manage deployments across multiple clusters, refer to [Manage multi-cluster Kubernetes deployments with ArgoCD](/docs/solutions/manage-multi-cluster-kubernetes-deployments-argocd). To distribute secrets between clusters, refer to [Sync Kubernetes secrets across clusters with External Secrets Operator](/docs/solutions/sync-kubernetes-secrets-across-clusters-external-secrets).
## [Prerequisites](#prerequisites)
* [Set up the Kubernetes Operator](/docs/features/kubernetes-operator#setup).
## [Cross-cluster connectivity setup](#cross-cluster-connectivity-setup)
This will need to be configured for each `Ingress` and `Egress` pair of `Services`. To set this up for access through ingress to a `Service` in cluster A and routing through egress from a `Service` in cluster B:
1. Set up [`Ingress`](/docs/features/kubernetes-operator/how-to/cluster-ingress) in cluster A for the `Service` you wish to access.
2. Expose the external `Service` (running in cluster A) using its Tailscale IP address in cluster B with an [annotation on the external `Service`](/docs/features/kubernetes-operator/how-to/cluster-egress#tailnet-node-ip-expose).
## [Customization](#customization)
[Customize the operator and resources it manages](/docs/features/kubernetes-operator/how-to/customize).
## [Troubleshooting](#troubleshooting)
[Troubleshoot the operator and resources it manages](/docs/reference/troubleshooting/containers/kubernetes-operator).
On this page
* [Prerequisites](#prerequisites)
* [Cross-cluster connectivity setup](#cross-cluster-connectivity-setup)
* [Customization](#customization)
* [Troubleshooting](#troubleshooting)
Scroll to top