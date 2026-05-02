Better node monitoring with new client metrics
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productDecember 17, 2024
# Better node monitoring with new client metrics
Tailscale client metrics are now available for local or remote examination, and can be directly ingested by Prometheus or any compatible monitoring system. These are especially useful for keeping tabs on the health and connectivity of [subnet routers](https://tailscale.com/kb/1019/subnets), and we think they’ll be an immediate upgrade for users that rely on those, such as deployments with [site-to-site network configurations](https://tailscale.com/kb/1214/site-to-site), setups with [Docker containers](https://tailscale.com/kb/1282/docker#ts_enable_metrics), or teams using [Tailscale with Kubernetes](https://tailscale.com/kb/1445/kubernetes-operator-customization#exposing-metrics).
A full list of the metrics available through this new feature is [available in our docs](https://tailscale.com/kb/1482/client-metrics), along with details on how to use the subcommands. If you’re using Tailscale 1.78 or later, you can see what’s available with the command `tailscale metrics print` in the terminal. Available metrics are displayed in the [standard Prometheus text exposition format](https://github.com/prometheus/docs/blob/main/content/docs/instrumenting/exposition_formats.md), which is relatively human-readable and handy for manual debugging. You can also use that command in scripts depending on your needs.
We’ve also implemented a command to write the available metrics to a file, with `tailscale metrics write`. The resulting text file can then be consumed and exported by the [textfile collector](https://github.com/prometheus/node_exporter#textfile-collector) provided by the Prometheus node exporter, which means this can plug right into your existing monitoring jobs.
For more flexibility though, we’ve built this feature such that these metrics are available over the network, including of course through your tailnet itself. To see how it works, you can poll locally using the local-only quad-100 address, like so:
```
`curl 100.100.100.100/metrics`
```
Or, if you must, `wget -qO- 100.100.100.100/metrics`.
To access the same information from [another device on your tailnet](https://tailscale.com/kb/1482/client-metrics#collect-metrics-over-tailscale), enable the Tailscale web client and grant your monitoring server access to that machine’s port `5252` in your ACLs. You can then poll the `/metrics` path under the device’s Tailscale IP address. If the machine has a public IP address and you want to expose the metrics for consumption over the non-Tailscale internet, you can [do so with the `tailscale web` command](https://tailscale.com/kb/1482/client-metrics#expose-metrics-to-other-networks).
Monitoring the health and connectivity of your services and devices is a critical part of network management, and we hope this new feature marks a real quality-of-life improvement for our users, from homelabbers up to IT and infrastructure teams. Previously, you might have gathered this information by parsing through logs, or (🤫) by poking through a debugging interface that wasn’t publicly documented or guaranteed to be stable. This is way better. Go forth and measure your traffic.
Share
Author
Parker Higgins
Contributor
Kristoffer Dalby
Author
Parker Higgins
Contributor
Kristoffer Dalby
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