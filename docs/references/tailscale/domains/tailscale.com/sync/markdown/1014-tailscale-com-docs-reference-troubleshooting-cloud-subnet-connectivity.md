Troubleshoot subnet connectivity in the cloud · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot subnet connectivity in the cloud
Last validated: Mar 20, 2026
The most common issue in Amazon Web Services, Microsoft Azure, and Google Cloud Platform that we've seen is a security group being too restrictive, and blocking connections. For troubleshooting purposes, try setting the internal security group to allow all traffic on the subnet, and the security group on the subnet router itself to allow all traffic to test if that unblocks connections.
Scroll to top