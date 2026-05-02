Announcing session recording for Tailscale SSH in beta
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 11, 2023
# Announcing session recording for Tailscale SSH in beta
Today, we’re launching session recording for [Tailscale SSH](/tailscale-ssh/) in beta, allowing you to record the terminal output whenever someone on your tailnet initiates a Tailscale SSH connection. You can use these recordings to detect threats, investigate security incidents, and remain compliant with your network security policies. Let’s talk about how it works:
When a member of your tailnet initiates a connection over Tailscale SSH, our client on the server records all of the terminal output in [`asciinema` ](https://asciinema.org/)format, and streams it to a dedicated recorder node on your tailnet. Like all traffic in your tailnet, these streams are encrypted end-to-end, and Tailscale never sees this data.
### Dedicated recorder nodes
Instead of streaming your sensitive SSH recordings to our servers, we created a lightweight recorder that you deploy inside of your tailnet— this way, you’re always in control of your SSH recording data. It’s built on [`tsnet`](/blog/tsnet-virtual-private-services/), so it can be easily deployed to your tailnet as a Docker container with just an auth key. You can deploy multiple recorder nodes in a fallback configuration, and each recorder can save its data to the file system or store the data in AWS S3 (or another S3-compatible object storage service like MinIO, Wasabi, or Google Cloud Storage) for increased resilience.
### Privacy by design
When we started designing session recording for Tailscale SSH, we knew that we wanted to build a tool that let you retain complete control over these sensitive logs. You don’t have to trust us with this data because we never see it in the first place.
### Getting started with session recording
You can learn more about session recording for Tailscale SSH, including step-by-step instructions for setting up recorder nodes, in our [documentation](/kb/1246/tailscale-ssh-session-recording/).
Recorder nodes save SSH session recordings to the Docker host’s disk by default. In this video, we walk through how to set this up on a Linux virtual machine.
Sam introduces session recording for Tailscale SSH
#### Using Amazon S3 as a storage backend
Tailscale SSH session recording supports configuring S3 as a storage backend for increased scalability and resilience. In this video, we demonstrate how to properly configure an S3 bucket as the storage target for a session recorder node.
Sam configures Amazon S3 as the storage backend for session recording
### Free and Enterprise customers can get started today
Session recording for Tailscale SSH is available in beta on our Free and Enterprise plans. Any owner, admin, or network admin can set up session recording. Detailed setup instructions are available [in our documentation](/kb/1246/tailscale-session-recording).
*This feature replaces a *[*legacy version of local SSH session logging*](/kb/1011/log-mesh-traffic/)* that saves recordings directly to the SSH server’s filesystem. We are deprecating that feature, and anyone using it should migrate to the new SSH session recording feature. The legacy functionality will remain active until at least August 1, 2023.*
Share
Authors
Sam Linville
Jairo Camacho
Authors
Sam Linville
Jairo Camacho
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