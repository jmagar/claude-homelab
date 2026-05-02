Connect private data sources to Grafana Cloud securely
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJuly 24, 2025
# Securely connect private data sources to Grafana Cloud with Tailscale
Securely connecting your critical internal data sources to monitoring tools is a notoriously tricky task for developer and operations teams. While platforms like Grafana Cloud provide the flexibility and power you need, exposing private data sources to the public internet, and moving that data between agents, SSH tunnels, and proxies, adds complexity and risk.
That's why Grafana Labs and Tailscale have partnered on a new integration that lets you securely connect data sources inside your tailnet directly to your [Grafana Cloud](https://grafana.com/products/cloud/?pg=blog&amp;plcmt=body-txt) stack, without exposing those data sources on the public internet. Using [Private data source connect ](https://grafana.com/docs/grafana-cloud/private-data-source-connect/?pg=blog&amp;plcmt=body-txt)(PDC), Grafana Cloud can securely query private data sources over your tailnet, with no exposed ports, no proxies, and no SSH tunnels. Your data remains private and remotely accessible via Grafana Cloud’s powerful visualization tools.
Under the hood, Grafana Cloud temporarily joins your Tailnet as an ephemeral node scoped by your [access controls](https://tailscale.com/kb/1393/access-control). You configure access using Tailscale [tags](https://tailscale.com/kb/1068/tags), and data sources are reachable via MagicDNS, making it seamless to connect [Prometheus](https://grafana.com/docs/grafana/latest/getting-started/get-started-grafana-prometheus/) or other tools without exposing anything publicly.
By combining Tailscale’s security and ease of use with Grafana Cloud’s fully managed observability platform, you get a simpler, safer way to monitor your infrastructure. It's a perfect fit for teams that want to stay flexible and keep their data private, without resorting to traditional networking workarounds. Your dashboards and the data they run on will travel with you, wherever you happen to be working, with no need for public IPs or exposed ports.
This integration, developed by Grafana Labs, is currently in private preview. You can [read more about it at Grafana Labs' blog](https://grafana.com/blog/2025/07/24/securely-query-data-sources-on-your-tailscale-network-using-private-data-source-connect-in-grafana-cloud/). If you run private infrastructure and want a simpler, more secure way to connect to Grafana Cloud, [sign up through this form](https://forms.gle/NgMvdnAMnQtNVrFw6), and Grafana Labs will reach out with onboarding details.
Share
Author
Smriti Sharma
Author
Smriti Sharma
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)