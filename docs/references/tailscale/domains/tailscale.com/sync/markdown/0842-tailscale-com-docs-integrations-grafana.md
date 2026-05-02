Use Grafana with Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use Grafana with Tailscale
Last validated: Jul 31, 2025
Tailscale and [Grafana](https://grafana.com/) can work together in a variety of ways. For example, you can secure access to Grafana dashboards, use Tailscale as an identity provider, or create Grafana dashboards to monitor your Tailscale network (known as a tailnet).
## [Secure Grafana dashboards with Tailscale](#secure-grafana-dashboards-with-tailscale)
[Use Tailscale to secure remote access to Grafana dashboards](/learn/remote-access-to-grafana-dashboards). You can host your Grafana server within your tailnet to avoid exposing Grafana data to the public internet and control access to dashboards using [access control policies](/docs/features/access-control).
## [Authenticate Grafana users using Tailscale](#authenticate-grafana-users-using-tailscale)
[Configure Grafana to use Tailscale as its authentication mechanism](/blog/grafana-auth) using Tailscale's open source Grafana proxy ([`proxy-to-grafana`](https://github.com/tailscale/tailscale/tree/main/cmd/proxy-to-grafana)). Tailscale's Grafana proxy identifies users based on their [Tailscale identity](/docs/concepts/tailscale-identity) and uses Grafana's [AuthProxy](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/auth-proxy/) to map each user's Tailscale identity to the corresponding Grafana user.
## [Integrate with Grafana Cloud Private Data Source Connect](#integrate-with-grafana-cloud-private-data-source-connect)
[Use Private Data Source Connect in Grafana Cloud](https://grafana.com/blog/2025/07/24/securely-query-data-sources-on-your-tailscale-network-using-private-data-source-connect-in-grafana-cloud/) to securely query data sources in your tailnet.
## [Monitor your tailnet with Grafana](#monitor-your-tailnet-with-grafana)
Create a Grafana dashboard to monitor [Tailscale client metrics](/docs/reference/tailscale-client-metrics), such as subnet routes, device health, and connectivity data. You can use the data to:
* Gain insights into how your tailnet is performing.
* Identify [connectivity issues](/docs/reference/troubleshooting/connectivity) between devices.
* Track bandwidth usage and plan for capacity needs.
On this page
* [Secure Grafana dashboards with Tailscale](#secure-grafana-dashboards-with-tailscale)
* [Authenticate Grafana users using Tailscale](#authenticate-grafana-users-using-tailscale)
* [Integrate with Grafana Cloud Private Data Source Connect](#integrate-with-grafana-cloud-private-data-source-connect)
* [Monitor your tailnet with Grafana](#monitor-your-tailnet-with-grafana)
Scroll to top