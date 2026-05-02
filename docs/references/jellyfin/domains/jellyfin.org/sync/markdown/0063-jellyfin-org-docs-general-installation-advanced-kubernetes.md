Kubernetes Deployment | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
This guide covers deploying Jellyfin on Kubernetes using the [official Helm chart](https://github.com/jellyfin/jellyfin-helm/tree/master/charts/jellyfin).
## Prerequisites[​](#prerequisites)
* Kubernetes cluster (v1.19+)
* Helm 3.x installed
* `kubectl` configured for your cluster
* Sufficient storage for media and configuration
* Ingress controller (e.g. traefik) for external access (required for this tutorial, see [official docs](https://github.com/jellyfin/jellyfin-helm/tree/master/charts/jellyfin) for alternatives)
## Installation[​](#installation)
### 1. Add Helm Repository[​](#1-add-helm-repository)
```
`
helm repo add jellyfin https://jellyfin.github.io/jellyfin-helm
helm repo update
`
```
### 2. Custom Installation[​](#2-custom-installation)
For complete installation instructions and configuration options, see the [official Jellyfin Helm chart repository](https://github.com/jellyfin/jellyfin-helm/tree/master/charts/jellyfin).
Create a `values.yaml` file for customization:
```
`
# values.yaml
replicaCount: 1
image:
pullPolicy: IfNotPresent
persistence:
config:
enabled: true
size: 5Gi
storageClass: ''
media:
enabled: true
size: 100Gi
storageClass: ''
ingress:
enabled: true
className: 'traefik'
hosts:
- host: jellyfin.example.com
paths:
- path: /
pathType: Prefix
resources:
limits:
cpu: 2000m
memory: 4Gi
requests:
cpu: 500m
memory: 1Gi
nodeSelector: {}
tolerations: []
affinity: {}
`
```
Install with custom values:
```
`
helm install jellyfin jellyfin/jellyfin -f values.yaml
`
```
## Configuration Options[​](#configuration-options)
### Service Types[​](#service-types)
This guide covers ClusterIP service type (default) for internal access only, with external access via ingress controller. Alternatives include LoadBalancer and NodePort services.
### Persistence[​](#persistence)
#### Using Existing Persistent Volume Claims[​](#using-existing-persistent-volume-claims)
```
`
persistence:
config:
enabled: true
existingClaim: 'jellyfin-config-pvc'
media:
enabled: true
existingClaim: 'jellyfin-media-pvc'
`
```
#### Creating New PVCs via Helm[​](#creating-new-pvcs-via-helm)
```
`
persistence:
config:
enabled: true
size: 5Gi
storageClass: 'fast-ssd'
media:
enabled: true
size: 100Gi
storageClass: 'slow-hdd'
`
```
### Ingress[​](#ingress)
#### Basic Ingress Configuration[​](#basic-ingress-configuration)
```
`
ingress:
enabled: true
className: 'traefik'
hosts:
- host: jellyfin.example.com
paths:
- path: /
pathType: Prefix
`
```
#### Advanced Ingress with TLS[​](#advanced-ingress-with-tls)
```
`
ingress:
enabled: true
className: 'traefik'
annotations:
traefik.ingress.kubernetes.io/router.entrypoints: websecure
traefik.ingress.kubernetes.io/router.middlewares: default-jellyfin-buffering@kubernetescrd
hosts:
- host: jellyfin.example.com
paths:
- path: /
pathType: Prefix
tls:
- secretName: jellyfin-tls
hosts:
- jellyfin.example.com
apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
name: jellyfin-buffering
namespace: default
spec:
buffering:
maxRequestBodyBytes: 0
`
```
## Accessing Jellyfin[​](#accessing-jellyfin)
### Port Forwarding (Development)[​](#port-forwarding-development)
```
`
kubectl port-forward svc/jellyfin 8096:8096
`
```
Access at: `http://localhost:8096`
### External Access[​](#external-access)
Once ingress is configured, access Jellyfin at your configured domain (e.g., `https://jellyfin.example.com`).
## Monitoring[​](#monitoring)
### Health Checks[​](#health-checks)
The chart includes readiness and liveness probes:
```
`
livenessProbe:
httpGet:
path: /health
port: http
initialDelaySeconds: 30
periodSeconds: 10
readinessProbe:
httpGet:
path: /health
port: http
initialDelaySeconds: 5
periodSeconds: 5
`
```
### Metrics[​](#metrics)
Enable Prometheus metrics if available:
```
`
metrics:
enabled: true
serviceMonitor:
enabled: true
`
```
## Troubleshooting[​](#troubleshooting)
### Common Issues[​](#common-issues)
1. **Permission Denied**: Ensure proper security context for media access
2. **Storage Issues**: Verify persistent volume claims are bound
3. **Network Access**: Check service type and ingress configuration
### Debug Commands[​](#debug-commands)
```
`
# Check pod status
kubectl get pods -l app.kubernetes.io/name=jellyfin
# View logs
kubectl logs -f deployment/jellyfin
# Check service
kubectl get svc jellyfin
# Describe pod for events
kubectl describe pod -l app.kubernetes.io/name=jellyfin
`
```
## Upgrading[​](#upgrading)
```
`
# Update repository
helm repo update
# Upgrade installation
helm upgrade jellyfin jellyfin/jellyfin
# Check upgrade status
helm status jellyfin
`
```
## Uninstalling[​](#uninstalling)
```
`
# Remove Helm release
helm uninstall jellyfin
# Clean up persistent volumes (if needed)
kubectl delete pvc -l app.kubernetes.io/name=jellyfin
`
```
## Advanced Configuration[​](#advanced-configuration)
### Hardware Acceleration[​](#hardware-acceleration)
For GPU acceleration, add device access and security context:
```
`
securityContext:
privileged: true
resources:
limits:
gpu.intel.com/i915: 1
# or nvidia.com/gpu: 1
extraVolumes:
- name: dri
hostPath:
path: /dev/dri
extraVolumeMounts:
- name: dri
mountPath: /dev/dri
`
```
### Multiple Media Sources[​](#multiple-media-sources)
Mount multiple media sources using additional volumes:
```
`
volumes:
- name: movies
persistentVolumeClaim:
claimName: movies-pvc
- name: tv
persistentVolumeClaim:
claimName: tv-pvc
volumeMounts:
- name: movies
mountPath: /movies
- name: tv
mountPath: /tv
`
```
### Custom Environment Variables[​](#custom-environment-variables)
```
`
extraEnvVars:
- name: JELLYFIN\_PublishedServerUrl
value: 'https://jellyfin.example.com'
- name: JELLYFIN\_CACHE\_DIR
value: '/cache'
`
```
For more configuration options, see the [Jellyfin Helm chart documentation](https://github.com/jellyfin/jellyfin-helm/tree/master/charts/jellyfin).
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [1. Add Helm Repository](#1-add-helm-repository)
* [2. Custom Installation](#2-custom-installation)
* [Configuration Options](#configuration-options)
* [Service Types](#service-types)
* [Persistence](#persistence)
* [Ingress](#ingress)
* [Accessing Jellyfin](#accessing-jellyfin)
* [Port Forwarding (Development)](#port-forwarding-development)
* [External Access](#external-access)
* [Monitoring](#monitoring)
* [Health Checks](#health-checks)
* [Metrics](#metrics)
* [Troubleshooting](#troubleshooting)
* [Common Issues](#common-issues)
* [Debug Commands](#debug-commands)
* [Upgrading](#upgrading)
* [Uninstalling](#uninstalling)
* [Advanced Configuration](#advanced-configuration)
* [Hardware Acceleration](#hardware-acceleration)
* [Multiple Media Sources](#multiple-media-sources)
* [Custom Environment Variables](#custom-environment-variables)