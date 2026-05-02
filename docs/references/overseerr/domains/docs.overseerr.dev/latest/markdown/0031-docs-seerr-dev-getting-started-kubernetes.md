Kubernetes (Advanced) | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
warning
This method is not recommended for most users. It is intended for advanced users who are using Kubernetes.
info
All official Seerr charts are cryptographically signed and include a verified [Software Bill of Materials (SBOM)](https://cyclonedx.org/).
To confirm that the chart you are using is authentic and unmodified, please refer to the [Verifying Signed Artifacts](/using-seerr/advanced/verifying-signed-artifacts#verifying-signed-helm-charts) guide.
## Installation[​](#installation)
```
`helm install seerr oci://ghcr.io/seerr-team/seerr/seerr-chart
`
```
Helm values can be found in the Seerr repository under [charts/seerr-chart/README.md](https://github.com/seerr-team/seerr/tree/develop/charts/seerr-chart).
Verify the signature with [cosign](https://docs.sigstore.dev/cosign/system_config/installation/) (replace [tag], with the TAG you want to verify) :
```
`cosign verify ghcr.io/seerr-team/seerr/seerr-chart:[tag] --certificate-identity=https://github.com/seerr-team/seerr/.github/workflows/helm.yml@refs/heads/main --certificate-oidc-issuer=https://token.actions.githubusercontent.com
`
```
* [Installation](#installation)