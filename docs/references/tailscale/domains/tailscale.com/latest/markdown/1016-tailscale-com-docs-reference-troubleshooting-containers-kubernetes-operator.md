Troubleshooting Kubernetes operator issues · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshooting Kubernetes operator issues
Last validated: Jan 5, 2026
The following sections provide suggestions and tips to help troubleshoot common Kubernetes operator issues.
## [Using logs](#using-logs)
If you are experiencing issues with your installation, it might be useful to take a look at the operator logs.
For [ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) and [egress](/docs/features/kubernetes-operator/how-to/cluster-egress) proxies and the `Connector`, the operator creates a single replica `StatefulSet` in the `tailscale` namespace that is responsible for proxying the traffic to and from the tailnet. If the `StatefulSet` has been successfully created, you should also look at the logs of its `Pod`.
### [Operator logs](#operator-logs)
You can increase operator's log level to get debug logs.
To set the log level to `debug` for an operator deployed using Helm, run:
```
`helm upgrade --install \\
operator tailscale/tailscale-operator \\
--set operatorConfig.logging=debug
`
```
If you deployed the operator using [static manifests](/docs/features/kubernetes-operator#static-manifests-with-kubectl), you can set `OPERATOR\_LOGGING` environment variable for the operator's `Deployment` to `debug`.
To review the logs, run:
```
`kubectl logs deployment/operator --namespace tailscale
`
```
### [Proxy logs and events](#proxy-logs-and-events)
To get logs and events for the proxy created for an [`Ingress`](/docs/features/kubernetes-operator/how-to/cluster-ingress#ingress-resource) resource, run:
```
`pod\_name=$(kubectl get pod --selector=tailscale.com/parent-resource-type=ingress,tailscale.com/parent-resource=\<ingress-name\>,tailscale.com/parent-resource-ns=\<ingress-namespace\> \\
--namespace tailscale -ojsonpath='{.items[0].metadata.name}')
kubectl logs ${pod\_name} --namespace tailscale
kubectl describe pod ${pod\_name} --namespace tailscale
`
```
To get logs and events for a proxy created for an [ingress](/docs/features/kubernetes-operator/how-to/cluster-ingress) or [egress](/docs/features/kubernetes-operator/how-to/cluster-egress) `Service`, run:
```
`pod\_name=$(kubectl get pod --selector=tailscale.com/parent-resource-type=svc,tailscale.com/parent-resource=\<service-name\>,tailscale.com/parent-resource-ns=\<service-namespace\> \\
--namespace tailscale -ojsonpath='{.items[0].metadata.name}')
kubectl logs ${pod\_name} --namespace tailscale
kubectl describe pod ${pod\_name} --namespace tailscale
`
```
To get logs and events for a proxy created for a `Connector`, run:
```
`pod\_name=$(kubectl get pod --selector=tailscale.com/parent-resource-type=connector,tailscale.com/parent-resource=\<connector-name\> \\
--namespace tailscale -ojsonpath='{.items[0].metadata.name}')
kubectl logs ${pod\_name} --namespace tailscale
kubectl describe pod ${pod\_name} --namespace tailscale
`
```
To get logs and events for a proxy created for a `ProxyGroup`, run:
```
`pod\_name=$(kubectl get pod --selector=tailscale.com/parent-resource-type=proxygroup,tailscale.com/parent-resource=\<proxy-group-name\> \\
--namespace tailscale -ojsonpath='{.items[0].metadata.name}')
kubectl logs ${pod\_name} --namespace tailscale
kubectl describe pod ${pod\_name} --namespace tailscale
`
```
## [Cluster egress/cluster ingress proxies](#cluster-egresscluster-ingress-proxies)
The proxy pod is deployed in the `tailscale` namespace, and will have a name of the form `ts-\<annotated-service-name\>-\<random-string\>`.
If there are issues reaching the external service, verify the proxy pod is properly deployed:
* Review the logs and events of the proxy pods.
* Review the logs of the operator. You can do this by running `kubectl logs deploy/operator --namespace tailscale`. The log level can be configured using the `OPERATOR\_LOGGING` environment variable in the operator's [manifest file](https://github.com/tailscale/tailscale/blob/main/cmd/k8s-operator/deploy/manifests/operator.yaml).
* Verify that the cluster workload can send traffic to the proxy pod in the `tailscale` namespace.
## [TLS connection errors](#tls-connection-errors)
If you are connecting to a workload exposed to the tailnet over `Ingress` or to the `kube` API server over the operator's API server proxy, you can sometimes run into TLS connection errors.
Check the following, in sequence:
1. HTTPS is not enabled for the tailnet.
To use Tailscale `Ingress` or API server proxy, you must ensure that [HTTPS is enabled for your tailnet](/docs/how-to/set-up-https-certificates).
2. Let's Encrypt certificate has not yet been provisioned.
If HTTPS is enabled, the errors are most likely related to Let's Encrypt certificate provisioning flow.
For each Tailscale `Ingress` resource, the operator deploys a Tailscale node that runs a TLS server. This server is provisioned with a Let's Encrypt certificate for the MagicDNS name of the node. For the API server proxy, the operator also runs an in-process TLS server that proxies tailnet traffic to the Kubernetes API server. This server gets provisioned with a Let's Encrypt certificate for the MagicDNS name of the operator.
In both cases, the certificates are provisioned lazily the first time a client connects to the server. Provisioning takes some time, so you might receive some TLS timeout errors.
You can examine the logs to follow the certificate provisioning process:
For API server proxy, review the operator's logs:
* For API server proxy, review the [operator logs](#operator-logs).
* For `Ingress`, review the [proxy logs](#proxy-logs).
There is nothing you can currently do to prevent the first client connection sometimes raising an error. Do [reach out](https://github.com/tailscale/tailscale/issues/new/choose) if this is causing issues for your workflow.
1. You have hit Let's Encrypt rate limits.
If the connection does not succeed even after first attempt to connect, you should verify that you have not hit [Let's Encrypt rate limits](https://letsencrypt.org/docs/rate-limits). If a limit has been hit, you will be able to find the error returned from Let's Encrypt in the logs.
We are currently working on making it less likely for users to hit Let's Encrypt rate limits. Refer to related discussion in [`tailscale/tailscale#11119`](https://github.com/tailscale/tailscale/issues/11119).
## [OAuth client and tagging issues](#oauth-client-and-tagging-issues)
If you're experiencing issues with the operator not being properly tagged or having permission issues, check the following:
1. **OAuth client scopes**: Ensure your OAuth client has both the `devices:core` and `auth\_keys` scopes with write permissions.
2. **OAuth client tag permissions**: The OAuth client must have permission to use all tags you want to apply to the operator. For example, if your `operatorConfig.defaultTags` specifies multiple tags like `tag:k8s-operator,tag:k8s-test`, your OAuth client must have permission to use`tag:k8s-operator`.
3. **Tag ownership in ACL**: Check that your tag ownership is properly configured in your tailnet policy file.
```
`"tagOwners": {
"tag:k8s-operator": [],
"tag:k8s-test": ["tag:k8s-operator"],
}
`
```
4. **Refresh operator state**:
* If you've updated your ACL policy, the changes will be applied automatically and don't require any restart.
* If you've created a new OAuth client to replace the previous one, you must reinstall the operator completely to ensure a new key is created. Follow the [installation instructions](/docs/features/kubernetes-operator#setup) again with the new OAuth client credentials.
* **Check OAuth client in console**: Verify in the Tailscale admin console that your OAuth client has the exact tags you want to apply to the operator. Remember that each tag's permissions are evaluated independently.
* **Inspect operator logs**: Look for authorization errors or tag-related messages in the [operator logs](#operator-logs).
## [Tailscale Ingress troubleshooting](#tailscale-ingress-troubleshooting)
This section contains additional information for troubleshooting Tailscale `Ingress`.
* Check that the operator has configured the ingress proxy correctly:
For example, if you have a Tailscale `Ingress` with a backend `Service` similar to these:
```
`apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: my-app
spec:
ingressClassName: tailscale
rules:
- http:
paths:
- backend:
service:
name: my-app
port:
number: 80
path: /login
pathType: Prefix
tls:
- hosts:
- my-app
---
apiVersion: v1
kind: Service
metadata:
name: my-app
spec:
clusterIP: 192.0.2.9
ports:
- port: 80
`
```
* Validate that the ingress proxy's configuration matches:
```
`INGRESS\_NAME=\<ingress-resource-name\> \\
INGRESS\_NAMESPACE=\<ingress-resource-namespace\> \\
secret\_name=$(kubectl get secret --selector=tailscale.com/parent-resource-type=ingress,tailscale.com/parent-resource=${INGRESS\_NAME},tailscale.com/parent-resource-ns=${INGRESS\_NAMESPACE} \\
--namespace tailscale -ojsonpath='{.items[0].metadata.name}')
kubectl get secret ${secret\_name} -n tailscale -ojsonpath={.data.serve-config} | base64 -d
'{"TCP":{"443":{"HTTPS":true}},"Web":{"${TS\_CERT\_DOMAIN}:443":{"Handlers":{"/login":{"Proxy":"http://192.0.2.9:80/"}}}}}'
`
```
If the configuration appears to be incorrect, check the operator logs for any errors relating to configuring the `Ingress`.
* Check that the ingress proxy has loaded the configuration.
Run the following command to review the current proxy's configuration:
```
`INGRESS\_NAME=\<ingress-resource-name\> \\
INGRESS\_NAMESPACE=\<ingress-resource-namespace\> \\
pod\_name=$(kubectl get pod --selector=tailscale.com/parent-resource-type=ingress,tailscale.com/parent-resource=${INGRESS\_NAME},tailscale.com/parent-resource-ns=${INGRESS\_NAMESPACE} \\
--namespace tailscale -ojsonpath='{.items[0].metadata.name}')
kubectl exec ${pod\_name} --namespace tailscale -- tailscale serve status
https://my-app.\<tailnetxyz\>.ts.net (tailnet only)
|-- / proxy http://192.0.2.9:80/
`
```
If the configuration appears to be incorrect, check the proxy `Pod`'s logs.
* Verify that the `Service` backend is reachable from the ingress proxy `Pod`:
```
`INGRESS\_NAME=\<ingress-resource-name\> \\
INGRESS\_NAMESPACE=\<ingress-resource-namespace\> \\
pod\_name=$(kubectl get pod --selector=tailscale.com/parent-resource-type=ingress,tailscale.com/parent-resource=${INGRESS\_NAME},tailscale.com/parent-resource-ns=${INGRESS\_NAMESPACE} \\
--namespace tailscale -ojsonpath='{.items[0].metadata.name}')
kubectl exec -it ${pod\_name} -n tailscale -- sh \\
apk add curl \\
curl http://192.0.2.9:80/
`
```
If the backend cannot be reached, the issue is likely related to cluster connectivity from `tailscale` namespace.
Verify that you don't have a `NetworkPolicy` in place that prevents `Pod`s in `tailscale` namespace to talk to the `Ingress` backend.
On this page
* [Using logs](#using-logs)
* [Operator logs](#operator-logs)
* [Proxy logs and events](#proxy-logs-and-events)
* [Cluster egress/cluster ingress proxies](#cluster-egresscluster-ingress-proxies)
* [TLS connection errors](#tls-connection-errors)
* [OAuth client and tagging issues](#oauth-client-and-tagging-issues)
* [Tailscale Ingress troubleshooting](#tailscale-ingress-troubleshooting)
Scroll to top