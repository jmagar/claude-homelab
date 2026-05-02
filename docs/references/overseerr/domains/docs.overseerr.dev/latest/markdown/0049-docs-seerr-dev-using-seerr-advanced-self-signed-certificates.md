Self-Signed Certificates | Seerr
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
If your media server or services (Radarr, Sonarr, etc.) use self-signed SSL certificates, Seerr will reject the connection because it does not trust them by default. The fix is to add your CA certificate to Node.js.
## Add Your CA Certificate[​](#add-your-ca-certificate)
The `NODE\_EXTRA\_CA\_CERTS` environment variable tells Node.js to trust additional Certificate Authority (CA) certificates. This approach keeps certificate validation active while trusting your specific certificate.
You will need to mount your certificate file (in PEM format) into the container and set the environment variable to point to it.
note
These examples show only the certificate-related configuration. For a complete setup, see the [Getting Started](/getting-started) guide.
* Docker CLI
* Docker Compose
```
`docker run -d \\
--name seerr \\
-e NODE\_EXTRA\_CA\_CERTS=/certs/my-ca.pem \\
-v /path/to/my-ca.pem:/certs/my-ca.pem:ro \\
-p 5055:5055 \\
ghcr.io/seerr-team/seerr:latest
`
```
Replace `/path/to/my-ca.pem` with the actual path to your CA certificate on the host. The path after the colon (`/certs/my-ca.pem`) is where it will be available inside the container.
tip
The certificate must be in PEM format. Open it in a text editor — if it starts with `-----BEGIN CERTIFICATE-----`, it is PEM. If it contains binary data, convert it with `openssl x509 -inform DER -in cert.cer -out cert.pem`.
For more details, see the [Node.js documentation on adding CA certificates](https://nodejs.org/en/learn/http/enterprise-network-configuration#adding-additional-ca-certificates).
* [Add Your CA Certificate](#add-your-ca-certificate)