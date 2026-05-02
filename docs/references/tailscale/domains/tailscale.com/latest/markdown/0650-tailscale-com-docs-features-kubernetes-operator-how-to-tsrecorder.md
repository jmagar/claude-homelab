Deploy tsrecorder on Kubernetes using the operator · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy tsrecorder on Kubernetes using the operator
Last validated: Dec 8, 2025
In Tailscale 1.74 and later, you can deploy [`tsrecorder`](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) to your Kubernetes cluster using the operator and its [`Recorder` Custom Resource Definition](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#recorder).
You can use this as a [recording destination for SSH sessions](/docs/features/tailscale-ssh/tailscale-ssh-session-recording).
The recorder will connect to your tailnet and receive end-to-end-encrypted recordings using WireGuard just like any other `tsrecorder` devices running in your tailnet.
Tailscale SSH session recording is available for [the Personal and Enterprise plans](/pricing).
## [Prerequisites](#prerequisites)
* Set up the [Kubernetes operator](/docs/features/kubernetes-operator).
* (Optional) create a [tag](/docs/features/tags), for example `tag:k8s-recorder`, to attach to the `tsrecorder` device.
This might be a useful way to refer to the recorder when configuring the [access control policies](/docs/features/access-control) for SSH session recording. Make sure the operator is one of the [tag owners](/docs/reference/syntax/policy-file#tag-owners) for your recorder tag:
```
`"tagOwners": {
"tag:k8s-operator": [],
"tag:k8s-recorder": ["tag:k8s-operator"],
}
`
```
* (Optional) [enable HTTPS](/docs/how-to/set-up-https-certificates) for your tailnet if you want to use the recorder's UI.
## [Deploy](#deploy)
1. Create your `Recorder` resource based on the below. Use the [reference documentation](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#recorder)
to update it as required and then save it as `recorder.yaml`.
The following spec will save recordings to a local temporary directory, and only persist for the lifetime of the pod.
Use the `s3` storage option shown below for durable storage.
```
`apiVersion: tailscale.com/v1alpha1
kind: Recorder
metadata:
name: recorder
spec:
enableUI: true
`
```
1. Apply the file:
```
`kubectl apply -f recorder.yaml
`
```
2. (Optional) wait for the recorder to become ready:
```
`kubectl wait --for condition=RecorderReady=true Recorder recorder
`
```
For example, this command will return information similar to the following:
```
`recorder.tailscale.com/recorder condition met
`
```
3. (Optional) find the URL for the recorder's UI:
```
`kubectl get Recorder recorder
`
```
For example, this command will return information similar to the following:
```
`NAME STATUS URL
recorder RecorderCreated https://recorder-0.tails-scales.ts.net
`
```
## [Examples](#examples)
### [Static S3 credentials](#static-s3-credentials)
The following example:
* Creates a `Secret` named "s3-auth" with AWS credentials for writing to a pre-existing S3 bucket named "tsrecorder-bucket".
* Deploys a `StatefulSet` with a single replica of `tsrecorder`.
* Assigns the tag `tag:k8s-recorder` to the recorder tailnet device.
* Enables the recorder's UI.
* Stores the recordings in an S3 bucket called "tsrecorder-bucket".
* Gets S3 credentials as environment variables from a `Secret` called "s3-auth" in
the same namespace as the Tailscale operator.
```
`apiVersion: v1
kind: Secret
metadata:
name: s3-auth
namespace: tailscale
stringData:
AWS\_ACCESS\_KEY\_ID: ABC...
AWS\_SECRET\_ACCESS\_KEY: xyz123...
---
apiVersion: tailscale.com/v1alpha1
kind: Recorder
metadata:
name: recorder
spec:
enableUI: true
tags:
- "tag:k8s-recorder"
storage:
s3:
endpoint: s3.us-east-1.amazonaws.com
bucket: tsrecorder-bucket
credentials:
secret:
name: s3-auth
`
```
### [IAM roles for service accounts (IRSA)](#iam-roles-for-service-accounts-irsa)
You can modify the above example to use IRSA for S3 credentials instead of static credentials stored in a `Secret`.
1. Follow the [AWS instructions for IRSA](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html). When you select the name and namespace of the `ServiceAccount` to attach your policy to, use the Tailscale Kubernetes Operator's namespace (usually `tailscale`) and a name of your choosing (the default `ServiceAccount` name is the same as the `Recorder` resource's name). This will be reflected in the trust policy document, for example:
```
`{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Principal": {
"Federated": "arn:aws:iam::111122223333:oidc-provider/oidc.eks.region-code.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE"
},
"Action": "sts:AssumeRoleWithWebIdentity",
"Condition": {
"StringEquals": {
"oidc.eks.region-code.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE:sub": "system:serviceaccount:tailscale:my-recorder",
"oidc.eks.region-code.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE:aud": "sts.amazonaws.com"
}
}
}
]
}
`
```
2. Use the `Recorder` field `.spec.statefulSet.pod.serviceAccount` to annotate its service account with the correct AWS role.
```
`apiVersion: tailscale.com/v1alpha1
kind: Recorder
metadata:
name: recorder
spec:
enableUI: true
tags:
- "tag:k8s-recorder"
storage:
s3:
endpoint: s3.us-east-1.amazonaws.com
bucket: tsrecorder-bucket
statefulSet:
pod:
serviceAccount:
name: my-recorder
annotations:
eks.amazonaws.com/role-arn: arn:aws:iam::111122223333:role/my-s3-role
`
```
## [Known issues and limitations](#known-issues-and-limitations)
* The only durable storage method currently available is `s3`. If `s3` storage isn't configured, recordings will be saved to a local temporary directory, and will only persist for the lifetime of the `Pod`.
On this page
* [Prerequisites](#prerequisites)
* [Deploy](#deploy)
* [Examples](#examples)
* [Static S3 credentials](#static-s3-credentials)
* [IAM roles for service accounts (IRSA)](#iam-roles-for-service-accounts-irsa)
* [Known issues and limitations](#known-issues-and-limitations)
Scroll to top