Self-Hosted Prometheus Monitoring - Qdrant
* [Documentation](https://qdrant.tech/documentation/)
*
* [Monitoring & Telemetry](https://qdrant.tech/documentation/ops-monitoring/)
*
* Self-Hosted Prometheus Monitoring# Monitoring Hybrid/Private Cloud with Prometheus and Grafana
|Time: 30 min|Level: Intermediate|
This tutorial will guide you through the process of setting up Prometheus and Grafana to monitor Qdrant databases running in a Kubernetes cluster used for Hybrid or Private Cloud.
## Prerequisites
This tutorial assumes that you already have a Kubernetes cluster running and a Qdrant database deployed in it, using either a Hybrid Cloud or Private Cloud deployment. You should also have `kubectl` and `helm` configured to interact with your cluster.
## Step 1: Install Prometheus and Grafana
If you haven&rsquo;t installed Prometheus and Grafana yet, you can use the [kube-prometheus-stack](https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack) Helm chart to deploy them in your Kubernetes cluster.
A minimal example of installing the stack:
```
`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace
`
```
This command will install Prometheus, Grafana, and all necessary components into a new `monitoring` namespace.
## Step 2: Configure Prometheus to Scrape Qdrant Metrics
To monitor Qdrant, you need to configure Prometheus to scrape metrics from the Qdrant database(s). You can do this by creating a `ServiceMonitor` resource in the host Kubernetes cluster.
```
`apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
name: qdrant-cluster-exporter
namespace: qdrant
labels:
release: prometheus
spec:
endpoints:
- honorLabels: true
interval: 30s
port: metrics
scheme: http
scrapeTimeout: 55s
jobLabel: app.kubernetes.io/name
namespaceSelector:
matchNames:
- qdrant
selector:
matchLabels:
app.kubernetes.io/instance: qdrant-cluster-exporter
app.kubernetes.io/name: qdrant-cluster-exporter
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
name: qdrant-operator
namespace: qdrant
labels:
release: prometheus
spec:
endpoints:
- honorLabels: true
interval: 30s
port: metrics
scheme: http
scrapeTimeout: 55s
jobLabel: app.kubernetes.io/name
namespaceSelector:
matchNames:
- qdrant
selector:
matchLabels:
app.kubernetes.io/name: operator
`
```
The example above assumes that your Qdrant database and the cloud platform exporter are deployed in the `qdrant` namespace. Adjust the `namespaceSelector` and `namespace` fields according to your deployment.
## Step 3: Access Grafana
Once Prometheus is configured to scrape metrics from Qdrant, you can access Grafana to visualize the metrics.
Get the Grafana &lsquo;admin&rsquo; user password by running:
```
`kubectl --namespace monitoring get secrets prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo
`
```
Access the Grafana dashboard by port-forwarding:
```
`export POD\_NAME=$(kubectl --namespace monitoring get pod -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=prometheus" -oname)
kubectl --namespace monitoring port-forward $POD\_NAME 3000
`
```
Now you can open your web browser and go to `http://localhost:3000`. Log in with the username `admin` and the password you retrieved earlier.
## Step 4: Import Qdrant Dashboard
Qdrant Cloud offers an example Grafana dashboard in the [Qdrant GitHub repository](https://github.com/qdrant/qdrant-cloud-grafana-dashboard). This comes with built-in views and graphs to help you get started monitoring your Qdrant clusters.
To import the dashboard:
1. In Grafana, go to &ldquo;Dashboards&rdquo; and click on &ldquo;New&rdquo; -\> &ldquo;Import&rdquo;.
2. Copy and paste the dashboard JSON from the Qdrant GitHub repository.
3. Click &ldquo;Load&rdquo; and then &ldquo;Import&rdquo;.
##### Was this page useful?
Yes
No
Thank you for your feedback! 🙏
We are sorry to hear that. 😔 You can [edit](https:/github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/ops-monitoring/hybrid-cloud-prometheus.md) this page on GitHub, or [create](https://github.com/qdrant/landing_page/issues/new/choose) a GitHub issue.
On this page:
* [
View as Markdown](https://qdrant.tech/documentation/ops-monitoring/hybrid-cloud-prometheus/index.md)
* [
Edit on Github](https://github.com/qdrant/landing_page/tree/master/qdrant-landing/content/documentation/ops-monitoring/hybrid-cloud-prometheus.md)
* [
Create an issue](https://github.com/qdrant/landing_page/issues/new/choose)