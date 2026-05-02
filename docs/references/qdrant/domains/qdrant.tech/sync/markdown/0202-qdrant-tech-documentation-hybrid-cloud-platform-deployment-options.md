Deployment Platforms - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Hybrid Cloud](https://qdrant.tech/documentation/hybrid-cloud/)
*
* Deployment Platforms# Qdrant Hybrid Cloud: Hosting Platforms & Deployment Options
This page provides an overview of how to deploy Qdrant Hybrid Cloud on various managed Kubernetes platforms.
For a general list of prerequisites and installation steps, see our [Hybrid Cloud setup guide](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/). This platform specific documentation also applies to Qdrant Private Cloud.
## Akamai (Linode)
[The Linode Kubernetes Engine (LKE)](https://www.linode.com/products/kubernetes/) is a managed container orchestration engine built on top of Kubernetes. LKE enables you to quickly deploy and manage your containerized applications without needing to build (and maintain) your own Kubernetes cluster. All LKE instances are equipped with a fully managed control plane at no additional cost.
First, consult Linode&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on LKE**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on Linode Kubernetes Engine
* [Getting Started with LKE](https://www.linode.com/docs/products/compute/kubernetes/get-started/)
* [LKE Guides](https://www.linode.com/docs/products/compute/kubernetes/guides/)
* [LKE API Reference](https://www.linode.com/docs/api/)
At the time of writing, Linode [does not support CSI Volume Snapshots](https://github.com/linode/linode-blockstorage-csi-driver/issues/107).
## Amazon Web Services (AWS)
[Amazon Elastic Kubernetes Service (Amazon EKS)](https://aws.amazon.com/eks/) is a managed service to run Kubernetes in the AWS cloud and on-premises data centers which can then be paired with Qdrant&rsquo;s hybrid cloud. With Amazon EKS, you can take advantage of all the performance, scale, reliability, and availability of AWS infrastructure, as well as integrations with AWS networking and security services.
First, consult AWS&rsquo; managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on AWS**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
For a good balance between peformance and cost, we recommend:
* Depending on your cluster resource configuration either general purpose (m6\*, m7\*, or m8\*), memory optimized (r6\*, r7\*, or r8\*) or cpu optimized (c6\*, c7\*, or c8\*) instance types. Qdrant Hybrid Cloud also supports AWS Graviton ARM64 instances.
* At least gp3 EBS volumes for storage### More on Amazon Elastic Kubernetes Service
* [Getting Started with Amazon EKS](https://docs.aws.amazon.com/eks/)
* [Amazon EKS User Guide](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
* [Amazon EKS API Reference](https://docs.aws.amazon.com/eks/latest/APIReference/Welcome.html)
Your EKS cluster needs the EKS EBS CSI driver or a similar storage driver:
* [Amazon EBS CSI Driver](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html)
To allow vertical scaling, you need a StorageClass with volume expansion enabled:
* [Amazon EBS CSI Volume Resizing](https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/examples/kubernetes/resizing/README.md)
```
`apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
annotations:
storageclass.kubernetes.io/is-default-class: "true"
name: ebs-sc
provisioner: ebs.csi.aws.com
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
allowVolumeExpansion: true
`
```
To allow backups and restores, your EKS cluster needs the CSI snapshot controller:
* [Amazon EBS CSI Snapshot Controller](https://docs.aws.amazon.com/eks/latest/userguide/csi-snapshot-controller.html)
And you need to create a VolumeSnapshotClass:
```
`apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
name: csi-snapclass
deletionPolicy: Delete
driver: ebs.csi.aws.com
`
```
## Civo
[Civo Kubernetes](https://www.civo.com/kubernetes) is a robust, scalable, and managed Kubernetes service. Civo supplies a CNCF-compliant Kubernetes cluster and makes it easy to provide standard Kubernetes applications and containerized workloads. User-defined Kubernetes clusters can be created as self-service without complications using the Civo Portal.
First, consult Civo&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on Civo**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on Civo Kubernetes
* [Getting Started with Civo Kubernetes](https://www.civo.com/docs/kubernetes)
* [Civo Tutorials](https://www.civo.com/learn)
* [Frequently Asked Questions on Civo](https://www.civo.com/docs/faq)
To allow backups and restores, you need to create a VolumeSnapshotClass:
```
`apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
name: csi-snapclass
deletionPolicy: Delete
driver: csi.civo.com
`
```
## Digital Ocean
[DigitalOcean Kubernetes (DOKS)](https://www.digitalocean.com/products/kubernetes) is a managed Kubernetes service that lets you deploy Kubernetes clusters without the complexities of handling the control plane and containerized infrastructure. Clusters are compatible with standard Kubernetes toolchains and integrate natively with DigitalOcean Load Balancers and volumes.
First, consult Digital Ocean&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on DigitalOcean**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on DigitalOcean Kubernetes
* [Getting Started with DOKS](https://docs.digitalocean.com/products/kubernetes/getting-started/quickstart/)
* [DOKS - How To Guides](https://docs.digitalocean.com/products/kubernetes/how-to/)
* [DOKS - Reference Manual](https://docs.digitalocean.com/products/kubernetes/reference/)
## Gcore
[Gcore Managed Kubernetes](https://gcore.com/cloud/managed-kubernetes) is a managed container orchestration engine built on top of Kubernetes. Gcore enables you to quickly deploy and manage your containerized applications without needing to build (and maintain) your own Kubernetes cluster. All Gcore instances are equipped with a fully managed control plane at no additional cost.
First, consult Gcore&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on Gcore**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on Gcore Kubernetes Engine
* [Getting Started with Kubnetes on Gcore](https://gcore.com/docs/cloud/kubernetes/about-gcore-kubernetes)
## Google Cloud Platform (GCP)
[Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) is a managed Kubernetes service that you can use to deploy and operate containerized applications at scale using Google&rsquo;s infrastructure. GKE provides the operational power of Kubernetes while managing many of the underlying components, such as the control plane and nodes, for you.
First, consult GCP&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on GCP**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
For a good balance between peformance and cost, we recommend:
* Depending on your cluster resource configuration either general purpose (standard), memory optimized (highmem) or cpu optimized (highcpu) instance types of at least 2nd generation. Qdrant Hybrid Cloud also supports ARM64 instances.
* At least pd-balanced disks for storage### More on the Google Kubernetes Engine
* [Getting Started with GKE](https://cloud.google.com/kubernetes-engine/docs/quickstart)
* [GKE Tutorials](https://cloud.google.com/kubernetes-engine/docs/tutorials)
* [GKE Documentation](https://cloud.google.com/kubernetes-engine/docs/)
To allow backups and restores, your GKE cluster needs the CSI VolumeSnapshot controller and class:
* [Google GKE Volume Snapshots](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/volume-snapshots)
```
`apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
name: csi-snapclass
deletionPolicy: Delete
driver: pd.csi.storage.gke.io
`
```
## Mircrosoft Azure
With [Azure Kubernetes Service (AKS)](https://azure.microsoft.com/en-in/products/kubernetes-service), you can start developing and deploying cloud-native apps in Azure, data centres, or at the edge. Get unified management and governance for on-premises, edge, and multi-cloud Kubernetes clusters. Interoperate with Azure security, identity, cost management, and migration services.
First, consult Azure&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on Azure**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
For a good balance between peformance and cost, we recommend:
* Depending on your cluster resource configuration either general purpose (D-family), memory optimized (E-family) or cpu optimized (F-family) instance types. Qdrant Hybrid Cloud also supports Azure Cobalt ARM64 instances.
* At least Premium SSD v2 disks for storage### More on Azure Kubernetes Service
* [Getting Started with AKS](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/containers/aks-start-here)
* [AKS Documentation](https://learn.microsoft.com/en-in/azure/aks/)
* [Best Practices with AKS](https://learn.microsoft.com/en-in/azure/aks/best-practices)
To allow backups and restores, your AKS cluster needs the CSI VolumeSnapshot controller and class:
* [Azure AKS Volume Snapshots](https://learn.microsoft.com/en-us/azure/aks/azure-disk-csi#create-a-volume-snapshot)
```
`apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
name: csi-snapclass
deletionPolicy: Delete
driver: disk.csi.azure.com
`
```
## Oracle Cloud Infrastructure
[Oracle Cloud Infrastructure Container Engine for Kubernetes (OKE)](https://www.oracle.com/in/cloud/cloud-native/container-engine-kubernetes/) is a managed Kubernetes solution that enables you to deploy Kubernetes clusters while ensuring stable operations for both the control plane and the worker nodes through automatic scaling, upgrades, and security patching. Additionally, OKE offers a completely serverless Kubernetes experience with virtual nodes.
First, consult OCI&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on OCI**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on OCI Container Engine
* [Getting Started with OCI](https://docs.oracle.com/en-us/iaas/Content/ContEng/home.htm)
* [Frequently Asked Questions on OCI](https://www.oracle.com/in/cloud/cloud-native/container-engine-kubernetes/faq/)
* [OCI Product Updates](https://docs.oracle.com/en-us/iaas/releasenotes/services/conteng/)
To allow backups and restores, your OCI cluster needs the CSI VolumeSnapshot controller and class:
* [Prerequisites for Creating Volume Snapshots](https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV.htm#contengcreatingpersistentvolumeclaim_topic-Provisioning_PVCs_on_BV-PV_From_Snapshot_CSI__section_volume-snapshot-prerequisites)
```
`apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
name: csi-snapclass
deletionPolicy: Delete
driver: blockvolume.csi.oraclecloud.com
`
```
## OVHcloud
[Service Managed Kubernetes](https://www.ovhcloud.com/en-in/public-cloud/kubernetes/), powered by OVH Public Cloud Instances, a leading European cloud provider. With OVHcloud Load Balancers and disks built in. OVHcloud Managed Kubernetes provides high availability, compliance, and CNCF conformance, allowing you to focus on your containerized software layers with total reversibility.
First, consult OVHcloud&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on OVHcloud**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on Service Managed Kubernetes by OVHcloud
* [Getting Started with OVH Managed Kubernetes](https://help.ovhcloud.com/csm/en-in-documentation-public-cloud-containers-orchestration-managed-kubernetes-k8s-getting-started)
* [OVH Managed Kubernetes Documentation](https://help.ovhcloud.com/csm/en-in-documentation-public-cloud-containers-orchestration-managed-kubernetes-k8s)
* [OVH Managed Kubernetes Tutorials](https://help.ovhcloud.com/csm/en-in-documentation-public-cloud-containers-orchestration-managed-kubernetes-k8s-tutorials)
## Red Hat OpenShift
[Red Hat OpenShift Kubernetes Engine](https://www.redhat.com/en/technologies/cloud-computing/openshift/kubernetes-engine) provides you with the basic functionality of Red Hat OpenShift. It offers a subset of the features that Red Hat OpenShift Container Platform offers, like full access to an enterprise-ready Kubernetes environment and an extensive compatibility test matrix with many of the software elements that you might use in your data centre.
First, consult Red Hat&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on Red Hat OpenShift**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on OpenShift Kubernetes Engine
* [Getting Started with Red Hat OpenShift Kubernetes](https://docs.openshift.com/container-platform/4.15/getting_started/kubernetes-overview.html)
* [Red Hat OpenShift Kubernetes Documentation](https://docs.openshift.com/container-platform/4.15/welcome/index.html)
* [Installing on Container Platforms](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.5/html/installing/index)
Qdrant databases need a persistent storage solution. See [Openshift Storage Overview](https://docs.openshift.com/container-platform/4.15/storage/index.html).
To allow vertical scaling, you need a StorageClass with [volume expansion enabled](https://docs.openshift.com/container-platform/4.15/storage/expanding-persistent-volumes.html).
To allow backups and restores, your OpenShift cluster needs the [CSI snapshot controller](https://docs.openshift.com/container-platform/4.15/storage/container_storage_interface/persistent-storage-csi-snapshots.html), and you need to create a VolumeSnapshotClass.
## Scaleway
[Scaleway Kapsule](https://www.scaleway.com/en/kubernetes-kapsule/) and [Kosmos](https://www.scaleway.com/en/kubernetes-kosmos/) are managed Kubernetes services from [Scaleway](https://www.scaleway.com/en/). They abstract away the complexities of managing and operating a Kubernetes cluster. The primary difference being, Kapsule clusters are composed solely of Scaleway Instances. Whereas, a Kosmos cluster is a managed multi-cloud Kubernetes engine that allows you to connect instances from any cloud provider to a single managed Control-Plane.
First, consult Scaleway&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on Scaleway**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on Scaleway Kubernetes
* [Getting Started with Scaleway Kubernetes](https://www.scaleway.com/en/docs/containers/kubernetes/quickstart/#how-to-add-a-scaleway-pool-to-a-kubernetes-cluster)
* [Scaleway Kubernetes Documentation](https://www.scaleway.com/en/docs/containers/kubernetes/)
* [Frequently Asked Questions on Scaleway Kubernetes](https://www.scaleway.com/en/docs/faq/kubernetes/)
## STACKIT
[STACKIT Kubernetes Engine (SKE)](https://www.stackit.de/en/product/kubernetes/) is a robust, scalable, and managed Kubernetes service. SKE supplies a CNCF-compliant Kubernetes cluster and makes it easy to provide standard Kubernetes applications and containerized workloads. User-defined Kubernetes clusters can be created as self-service without complications using the STACKIT Portal.
First, consult STACKIT&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on STACKIT**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on STACKIT Kubernetes Engine
* [Getting Started with SKE](https://docs.stackit.cloud/stackit/en/getting-started-ske-10125565.html)
* [SKE Tutorials](https://docs.stackit.cloud/stackit/en/tutorials-ske-66683162.html)
* [Frequently Asked Questions on SKE](https://docs.stackit.cloud/stackit/en/faq-known-issues-of-ske-28476393.html)
To allow backups and restores, you need to create a VolumeSnapshotClass:
```
`apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
name: csi-snapclass
deletionPolicy: Delete
driver: cinder.csi.openstack.org
`
```
## Vultr
[Vultr Kubernetes Engine (VKE)](https://www.vultr.com/kubernetes/) is a fully-managed product offering with predictable pricing that makes Kubernetes easy to use. Vultr manages the control plane and worker nodes and provides integration with other managed services such as Load Balancers, Block Storage, and DNS.
First, consult Vultr&rsquo;s managed Kubernetes instructions below. Then, **to set up Qdrant Hybrid Cloud on Vultr**, follow our [step-by-step documentation](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/).
### More on Vultr Kubernetes Engine
* [VKE Guide](https://docs.vultr.com/vultr-kubernetes-engine)
* [VKE Documentation](https://docs.vultr.com/)
* [Frequently Asked Questions on VKE](https://docs.vultr.com/vultr-kubernetes-engine#frequently-asked-questions)
At the time of writing, Vultr does not support CSI Volume Snapshots.
## Generic Kubernetes Support (on-premises, cloud, edge)
Qdrant Hybrid Cloud works with any Kubernetes cluster that meets the [standard compliance](https://www.cncf.io/training/certification/software-conformance/) requirements.
This includes for example:
* [VMWare Tanzu](https://tanzu.vmware.com/kubernetes-grid)
* [Red Hat OpenShift](https://www.openshift.com/)
* [SUSE Rancher](https://www.rancher.com/)
* [Canonical Kubernetes](https://ubuntu.com/kubernetes)
* [RKE](https://rancher.com/docs/rke/latest/en/)
* [RKE2](https://docs.rke2.io/)
* [K3s](https://k3s.io/)
Qdrant databases need persistent block storage. Most storage solutions provide a CSI driver that can be used with Kubernetes. See [CSI drivers](https://kubernetes-csi.github.io/docs/drivers.html) for more information.
To allow vertical scaling, you need a StorageClass with volume expansion enabled. See [Volume Expansion](https://kubernetes.io/docs/concepts/storage/storage-classes/#allow-volume-expansion) for more information.
To allow backups and restores, your CSI driver needs to support volume snapshots cluster needs the CSI VolumeSnapshot controller and class. See [CSI Volume Snapshots](https://kubernetes-csi.github.io/docs/snapshot-controller.html) for more information.
## Next Steps
Once you&rsquo;ve got a Kubernetes cluster deployed on a platform of your choosing, you can begin setting up Qdrant Hybrid Cloud. Head to our Qdrant Hybrid Cloud [setup guide](https://qdrant.tech/documentation/hybrid-cloud/hybrid-cloud-setup/) for instructions.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/hybrid-cloud/platform-deployment-options.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/hybrid-cloud/platform-deployment-options/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/hybrid-cloud/platform-deployment-options.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)