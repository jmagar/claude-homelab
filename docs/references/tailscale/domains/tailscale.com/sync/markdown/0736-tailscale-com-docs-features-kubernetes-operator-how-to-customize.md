Customize the Kubernetes operator and resources it manages · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Customize the Kubernetes operator and resources it manages
Last validated: Jan 5, 2026
## [Cluster resource customization using `ProxyClass`](#cluster-resource-customization-using-proxyclass)
Tailscale operator v1.60 and later provides the ability to customize the configuration of cluster resources created by the operator using `ProxyClass` [Custom Resource Definition](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources).
You can specify cluster resource configuration for custom labels and resource requests using a `ProxyClass` Custom Resource.
You can then:
* Apply configuration from a particular `ProxyClass` to cluster resources created for a Tailscale Ingress or Service by using a `tailscale.com/proxy-class=\<proxy-class-name\>` annotation on the Ingress or Service.
* Apply configuration from a particular `ProxyClass` to cluster resources created for a [`Connector`](/docs/features/kubernetes-operator/how-to/connector) using `connector.spec.proxyClass` field.
The following example shows how to use a `ProxyClass` that specifies custom labels and node selectors. These are applied to Pods for a [Tailscale Ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress), a [cluster egress proxy](/docs/features/kubernetes-operator/how-to/cluster-egress), a [`Connector`](/docs/features/kubernetes-operator/how-to/connector), and a [`ProxyGroup`](/docs/features/kubernetes-operator/how-to/cluster-egress#configure-an-egress-service-using-proxygroup):
1. Create a `ProxyClass` resource:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: prod
spec:
statefulSet:
pod:
labels:
team: eng
environment: prod
nodeSelector:
beta.kubernetes.io/os: "linux"
`
```
2. Create a Tailscale Ingress with `tailscale.com/proxy-class=prod` annotation:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: my-app
annotations:
tailscale.com/proxy-class: "prod"
spec:
rules:
...
ingressClassName: tailscale
`
```
3. Create a [cluster egress](/docs/features/kubernetes-operator/how-to/cloud-services) Service with a `tailscale.com/proxy-class=prod` annotation:
```
`apiVersion: v1
kind: Service
metadata:
annotations:
tailscale.com/tailnet-ip: \<tailnet-ip\>
tailscale.com/proxy-class: "prod"
name: my-tailnet-service
spec:
`
```
4. Create a `Connector` that refers to the 'prod' `ProxyClass`:
```
`apiVersion: tailscale.com/v1alpha1
kind: Connector
metadata:
name: prod
spec:
proxyClass: prod
...
`
```
5. Create a `ProxyGroup` that refers to the 'prod' `ProxyClass`:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: egress
spec:
proxyClass: prod
...
`
```
You can find [all available `ProxyClass` configuration options on GitHub →](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxyclass)
### [Default `ProxyClass`](#default-proxyclass)
Tailscale v1.74 and later lets you specify a default `ProxyClass`. Configuration from a default `ProxyClass` is applied
to [cluster ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress), [cluster egress](/docs/features/kubernetes-operator/how-to/cluster-egress) and
[`ProxyGroup`](/docs/features/kubernetes-operator#proxy-group) proxies that don't have a `ProxyClass` explicitly set.
You can set a default `ProxyClass` for the cluster by using the `proxyConfig.defaultProxyClass` Helm value if [installing
using Helm](/docs/features/kubernetes-operator#helm) or by using the `PROXY\_DEFAULT\_CLASS` environment variable if [installing using static
manifests](/docs/features/kubernetes-operator#static-manifests).
## [Proxy configuration](#proxy-configuration)
You can specify a `ProxyClass` for [`Connector`](/docs/features/kubernetes-operator/how-to/connector) resources, and [egress](/docs/features/kubernetes-operator/how-to/cluster-egress) and [ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) proxies.
The [API server proxy](/docs/features/kubernetes-operator/how-to/api-server-proxy) currently runs as part of the same process as the Kubernetes operator. You can use [the available operator configuration options](/docs/features/kubernetes-operator#installation) to configure the API server proxy parameters.
### [Customizing tags](#customizing-tags)
All the proxies that the operator creates are [Tailscale devices](/docs/features/access-control/device-management) tagged by one or more [tags](/docs/features/tags).
The Tailscale operator must be a [tag owner](/docs/features/tags#define-tag-owners) of all the proxy tags: if you want to tag a proxy device with `tag:prod,tag:emea`, the [`tagOwners` section of the tailnet policy file](/docs/reference/syntax/policy-file#tag-owners) must list `tag:k8s-operator` as one of the owners of both `tag:prod` and `tag:emea`.
Currently, tags can not be modified after a proxy has been created.
#### [Default tags](#default-tags)
By default, a proxy device joins your tailnet tagged with the [tag](/docs/features/tags) `tag:k8s`. You can modify the default tag or tags when installing the operator.
If you install the operator [with Helm](/docs/features/kubernetes-operator#helm), you can use `.proxyConfig.defaultTags` in the Helm values file.
If you install the operator [with static manifests](/docs/features/kubernetes-operator#static-manifests), you can set the `PROXY\_TAGS` environment variable in the deployment manifest.
Multiple tags must be passed as a comma separated string, that is, `tag:prod,tag:emea`.
#### [Tags for individual proxies](#tags-for-individual-proxies)
To override the default tags for an individual proxy created for a Tailscale Service or Ingress, you can set the `tailscale.com/tags` annotation on the Service or Ingress resource to a comma separated list of the desired tags.
For example, setting `tailscale.com/tags: "tag:prod,tag:emea"` annotation will result in the proxy device having the tags `tag:prod` and `tag:emea`.
To override the default tags for the proxy created for a [`Connector`](/docs/features/kubernetes-operator/how-to/connector) custom resource, you can set tags by using the `spec.tags` field.
Refer to [Common patterns for tag names](/docs/features/tags#common-patterns-for-tag-names) for best practices around tag names.
### [Static endpoints](#static-endpoints)
This functionality is available in Tailscale v1.86 and later, and is only available to proxies within [`ProxyGroups`](/docs/features/kubernetes-operator#proxy-group).
Tailscale uses various [NAT traversal techniques](/blog/how-nat-traversal-works) to securely connect to other Tailscale nodes without manual intervention. Most of the time, you do not need to open any [firewall ports](/docs/integrations/firewalls) for Tailscale. However, in some scenarios where NAT Traversal is unsuccessful, Tailscale proxies deployed by the operator may have to rely on a [relayed connection](/blog/how-tailscale-works#encrypted-tcp-relays-derp), resulting in lower throughput and performance compared to direct connections. For example, when using AWS NAT Gateways, which are [hard NATs](/docs/reference/device-connectivity#hard-nat)).
In these scenarios, `ProxyClass` provides the configuration that lets users leverage [Kubernetes NodePort Services](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport) as extra endpoints to facilitate direct connections to `ProxyGroups`.
Once configured, these endpoints will only work for tailnet devices on the same network as that Kubernetes Node. If the Kubernetes Node has a public IP address, the configured static endpoint will be reachable by all Tailscale devices.
#### [Configure firewall rules](#configure-firewall-rules)
A maximum of two static endpoints are now allowed per `ProxyGroup`. To specify which nodes the operator uses for NodePort Services, configure the `spec.staticEndpoints.selector` field in the [ProxyClass resource](/docs/features/kubernetes-operator/how-to/customize#configuring-static-endpoints).
To leverage static endpoints, firewall rules will likely need to be configured to allow inbound traffic to be sent to each relevant Node's IP address.
Given the horizontally scalable nature of ProxyGroups, we recommend configuring a suitable number of ports on the firewall to reduce the chance of running out of ports when scaling the number of ProxyGroup replicas.
#### [Configure static endpoints](#configure-static-endpoints)
1. Create a ProxyClass.
The configuration for static endpoints is exposed as part of the [ProxyClass](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#proxyclass) custom resource, under `spec.staticEndpoints`:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: prod
spec:
staticEndpoints:
nodePort:
ports:
- "31667-31680"
selector:
kubernetes.io/os: linux
`
```
In this example, `ProxyClass` is configured to use [Kubernetes NodePort services](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport) for the static endpoints. Inside the `nodePortConfig`, a list of `ports` can be configured. It's also important to ensure that the specified ranges have the necessary firewall rules configured so that the endpoints are reachable from other tailnet devices. The `selector` field can also be used to select which Kubernetes node's `ExternalIP`s should be used for the static endpoints.
Once created, this ProxyClass can be referenced on a ProxyGroup to configure static endpoints for all its replicas:
2. Create a ProxyGroup.
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyGroup
metadata:
name: ingress
spec:
type: ingress
proxyClass: prod
replicas: 3
`
```
The example above (once applied) will create three proxy replicas, but given the configuration in the ProxyClass will also create three Kubernetes NodePort services to facilitate connections to the ProxyGroup from other tailnet devices:
```
`NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
prod-0-nodeport NodePort 172.20.123.3 \<none\> 22918:31669/UDP 84m
prod-1-nodeport NodePort 172.20.163.230 \<none\> 22918:31668/UDP 84m
prod-2-nodeport NodePort 172.20.84.83 \<none\> 22918:31667/UDP 84m
`
```
3. Test the connection.
Once the ProxyGroup has been created, a test Pod can be created and exposed using an [HA cluster ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress#expose-a-tailscale-service-in-ha-mode) to test the static endpoint:
```
`apiVersion: v1
kind: Pod
metadata:
name: test
namespace: default
labels:
app: test
spec:
containers:
- name: nginx
image: nginx:latest
ports:
- containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
name: test
namespace: default
annotations:
tailscale.com/proxy-group: prod
spec:
type: LoadBalancer
loadBalancerClass: tailscale
selector:
app: test
ports:
- port: 80
targetPort: 80
protocol: TCP
`
```
When applied, you can review the Tailscale Service IP address used to expose the Pod to the tailnet using the command `kubectl get service -n default`.
```
`NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
test LoadBalancer 172.20.50.164 100.112.194.186 80:31109/TCP 2m17s
`
```
Test for a direct connection to the Pod in your tailnet by using the Tailscale Service IP address:
```
`tailscale ping \<EXTERNAL-IP\>
`
```
If a direct connection is successful, you should notice a log output similar to:
```
`pong from prod-0 (100.80.195.111) via 44.213.106.32:31670 in 91ms
`
```
If unsuccessful, you might notice a log output similar to:
```
`pong from prod-0 (100.80.195.111) via DERP(nyc) in 90ms
`
```
If this log output is observed, ensure that:
* Inbound firewall rules are configured appropriately for traffic to flow to the correct Kubernetes nodes and port ranges, as configured in the ProxyClass.
* Selected nodes using `spec.staticEndpoints.nodePort.selector` have `ExternalIP`s in `status.addresses`.
* The `staticEndpoints` field on the ProxyGroup's `status.devices` is populated with the correct address using a valid `ExternalIP` and the correct `NodePort` for that replica's Service.
### [Expose metrics](#expose-metrics)
When specified for a resource, the following `ProxyClass` definition will enable [client metrics](/docs/reference/tailscale-client-metrics) at the path `/metrics` on a container port named "metrics":
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: prod
spec:
metrics:
enable: true
`
```
Additionally the operator will also create a metrics Service for the proxy in the operator's namespace that will also expose metrics on the path `/metrics` on a port named "metrics".
#### [Prometheus `ServiceMonitor`](#prometheus-servicemonitor)
The Kubernetes Operator can also create a [Prometheus `ServiceMonitor`](https://prometheus-operator.dev/docs/developer/getting-started/#using-servicemonitors) for proxy resources.
To enable it:
1. Ensure that [Prometheus operator](https://github.com/prometheus-operator/prometheus-operator) including its Custom Resource Definitions is installed
2. Apply `ProxyClass` that enables metrics and `ServiceMonitor` creation:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: prod
spec:
metrics:
enable: true
serviceMonitor:
enable: true
`
```
The ingested metrics will have [labels](https://prometheus.io/docs/practices/naming/#labels) that identify the proxy to which the `ProxyClass` was applied:
* `ts\_proxy\_type`: type of the proxy. Values can be `ingress\_service`, `ingress\_resource`, `connector` or `proxygroup`.
* `ts\_proxy\_parent\_name`: name of the proxy's parent resource. That is, name of the Ingress resource, Tailscale Service, `Connector` or `ProxyGroup`.
* `ts\_proxy\_parent\_namespace`: namespace of the proxy's parent resource. This only applies to namespaced resources.
Currently it is not possible to customize the created `ServiceMonitor`. We welcome your feedback as to what customization options would be useful for you.
### [Debug endpoints](#debug-endpoints)
Debug endpoints are unstable, may change without notice, and are not recommended for production use.
If you rely on the debug metrics (at `/debug/metrics`), you must explicitly enable the following debug option before upgrading to 1.82 which will always default debug to disabled.
If enabled, the debug endpoints will be available on a container port named "debug". The endpoints include `/debug/metrics` and `/debug/pprof/` paths from Go's [`net/http/pprof`](https://pkg.go.dev/net/http/pprof) library.
To maintain backward compatibility, debug endpoints default to enabled if `.spec.metrics.enable` is set to `true`. If `.spec.metrics.enable` is set to `false`, the debug endpoints default to disabled.
In Tailscale v1.82 and later, the debug endpoints always default to disabled. You can override the default for debug endpoints using `ProxyClass`:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: prod
spec:
metrics:
enable: true
statefulSet:
pod:
tailscaleContainer:
debug:
enable: false
`
```
### [Using custom machine names](#using-custom-machine-names)
Cluster ingress and egress proxies support overriding the hostname they announce while registering with Tailscale. For Services, you can set a custom hostname using a `tailscale.com/hostname` annotation. For Ingresses, you can set a custom hostname using the `.spec.tls.hosts` field (only the first value will be used).
Note that this only sets a custom operating system (OS) hostname reported by the device. The actual machine name [will differ](/docs/concepts/machine-names#how-machine-names-are-determined) if a device is on the network with the same name.
Machine names are subject to the constraints of DNS: they can be up to 63 characters long, must start and end with a letter, and consist of only letters, numbers, and `-`.
### [Customize permissions](#customize-permissions)
Pods for proxies created for [cluster ingress using Service](/docs/features/kubernetes-operator/how-to/cluster-ingress#ingress-service), [cluster egress](/docs/features/kubernetes-operator/how-to/cluster-egress), [`Connector`](/docs/features/kubernetes-operator/how-to/connector) and [`ProxyGroup`](/docs/features/kubernetes-operator#proxy-group) contain a main `tailscale` container and an `init` container.
Since Tailscale v1.78, both containers run as [privileged containers](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).
The main `tailscale` container requires privileged permissions to create a `/dev/net/tun` device.
As an alternative, you can restrict the main container's permissions and delegate the device creation to a [Kubernetes device plugin](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/device-plugins/):
1. Install the [generic device plugin](https://github.com/squat/generic-device-plugin) to your cluster. Pass a `--device` flag that configures the plugin to create `/dev/net/tun` devices:
```
`--device='{"name": "tun", "groups": [{"paths": [{"path": "/dev/net/tun"}]}, "count": 1000]}'
`
```
2. Apply a `ProxyClass` that restricts the `tailscale` container's permissions to `NET\_ADMIN` and `NET\_RAW` capabilities, and tells the device plugin to create a `/dev/net/tun` device:
```
`apiVersion: tailscale.com/v1alpha1
kind: ProxyClass
metadata:
name: tailscale-tun
spec:
statefulSet:
pod:
tailscaleContainer:
resources:
limits:
squat.ai/tun: "1"
securityContext:
allowPrivilegeEscalation: false
capabilities:
drop:
- ALL
add:
- NET\_ADMIN
- NET\_RAW
`
```
3. Ensure that the `ProxyClass` is applied to all proxies created for [Tailscale ingress Services](/docs/features/kubernetes-operator/how-to/cluster-ingress#ingress-service), [Tailscale egress Services](/docs/features/kubernetes-operator/how-to/cluster-egress), [`Connector`s](/docs/features/kubernetes-operator/how-to/connector) and [`ProxyGroup`s](/docs/features/kubernetes-operator#proxy-group).
Refer to the detailed instructions and discussion [on GitHub →](https://github.com/tailscale/tailscale/issues/10814#issuecomment-2479977752)
## [Limitations](#limitations)
* You cannot enable metrics for egress proxies that do not use a `ProxyGroup`.
On this page
* [Cluster resource customization using ProxyClass](#cluster-resource-customization-using-proxyclass)
* [Default ProxyClass](#default-proxyclass)
* [Proxy configuration](#proxy-configuration)
* [Customizing tags](#customizing-tags)
* [Default tags](#default-tags)
* [Tags for individual proxies](#tags-for-individual-proxies)
* [Static endpoints](#static-endpoints)
* [Configure firewall rules](#configure-firewall-rules)
* [Configure static endpoints](#configure-static-endpoints)
* [Expose metrics](#expose-metrics)
* [Prometheus ServiceMonitor](#prometheus-servicemonitor)
* [Debug endpoints](#debug-endpoints)
* [Using custom machine names](#using-custom-machine-names)
* [Customize permissions](#customize-permissions)
* [Limitations](#limitations)
Scroll to top