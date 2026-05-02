Deploy app connectors on Kubernetes using the Kubernetes Operator · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy app connectors on Kubernetes using the Kubernetes Operator
Last validated: Oct 29, 2025
Deploying app connectors on Kubernetes using the Kubernetes Operator is currently [in beta](/docs/reference/tailscale-release-stages#beta).
In Tailscale v1.78 and later, you can deploy [`app connector`](/docs/features/app-connectors) to your Kubernetes cluster using the Kubernetes Operator and its [`Connector` Custom Resource Definition](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#connector).
The only tested and supported use case is to deploy an app connector to access SaaS applications available on the public internet. Using the app connector to expose cluster workloads or other internal workloads might work, but this is not a use case that we have tested or optimized for.
If you are using the app connector to access SaaS applications because you need a predictable egress IP address that you can add to an allowlist, it's also your responsibility to ensure that cluster traffic from the connector flows using that predictable IP address. For example, by ensuring cluster egress traffic is routed using an egress NAT device with a static IP address.
## [Prerequisites](#prerequisites)
1. Set up the [Kubernetes operator](/docs/features/kubernetes-operator).
2. (Optional) Create a [tag](/docs/features/tags) (for example, `tag:github-connector`) to attach to the connector device.
If you do not specify a custom tag, the operator will tag the connector device with `tag:k8s`.
Make sure the operator is one of the [tag owners](/docs/reference/syntax/policy-file#tag-owners) for the connector tag:
```
`"tagOwners": {
"tag:k8s-operator": [],
"tag:github-connector": ["tag:k8s-operator"],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
3. Configure the domains that route through the app connector in [Apps](/docs/features/app-connectors#add-apps).
4. Follow steps three through five in [app connector policy configuration instructions](/docs/features/app-connectors#policy) to set up permissions to route traffic for the required domains using the app connector.
## [Deploy](#deploy)
1. Create your `Connector` resource based on the below and save it as `connector.yaml`.
```
`apiVersion: tailscale.com/v1alpha1
kind: Connector
metadata:
name: appc-github
spec:
appConnector: {}
`
```
2. (Optional) Add [preconfigured routes](/docs/reference/best-practices/app-connectors#preconfiguration)
```
`apiVersion: tailscale.com/v1alpha1
kind: Connector
metadata:
name: appc-github
spec:
appConnector:
routes:
- 140.82.114.4/32
`
```
You can find [all available `Connector` configuration options on GitHub →](https://github.com/tailscale/tailscale/blob/main/k8s-operator/api.md#connector)
3. Apply the file:
```
`kubectl apply -f connector.yaml
`
```
4. (Optional) Wait for the recorder to become ready:
```
`kubectl wait --for condition=ConnectorReady=true Connector appc-github
connector.tailscale.com/appc-github condition met
`
```
5. (Optional) [Add the app connector's egress IP address to an IP allowlist](/docs/features/app-connectors#ip-allowlist).
## [Known issues and limitations](#known-issues-and-limitations)
* The setup flow involves a large number of manual steps to configure the tailnet policy file and apps.
We welcome feedback for further improvements for automating this workflow.
* There is no way to auto-discover the egress IP of the app connector - you need to look it up in the admin console.
On this page
* [Prerequisites](#prerequisites)
* [Deploy](#deploy)
* [Known issues and limitations](#known-issues-and-limitations)
Scroll to top