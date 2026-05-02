Tailscale on Fly.io · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale on Fly.io
Last validated: Dec 4, 2025
[Fly.io](https://fly.io) is a popular service to deploy full stack apps and databases all over the world, with Fly handling operations and scaling in each region according to demand. Adding Tailscale to a fly.io application is straightforward, allowing the App on Fly to communicate with other nodes and services in your tailnet.
## [Step 1: Generate an auth key to authenticate your App on Fly](#step-1-generate-an-auth-key-to-authenticate-your-app-on-fly)
First, we'll [generate an auth key](/docs/features/access-control/auth-keys) to allow fly.io to authenticate our app to join our network.
Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console and select **Generate auth key**. We recommend using a reusable and pre-authorized [ephemeral key](/docs/features/ephemeral-nodes) for this purpose, since it will automatically clean up devices after they shut down.
The **Pre-approved** option will only display in the dialog if [device approval](/docs/features/access-control/device-management/device-approval) is enabled in your Tailscale network.
Next, use `flyctl secrets set TAILSCALE\_AUTHKEY="tskey-\<key\>"` to securely store the auth key for the App on Fly to use.
## [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
Next, we'll use a [multistage Dockerfile](https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds), where the first stage builds your application, and the second stage pulls application code and Tailscale into the final image to be uploaded to Fly.
In your `Dockerfile`:
```
`FROM alpine:latest as builder
WORKDIR /app
COPY . ./
# This is where one could build the application code as well.
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM alpine:latest
RUN apk update && apk add ca-certificates iptables ip6tables && rm -rf /var/cache/apk/\*
# Copy binary to production image.
COPY --from=builder /app/start.sh /app/start.sh
# Copy Tailscale binaries from the tailscale image on Docker Hub.
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscaled /app/tailscaled
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscale /app/tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale
# Run on container startup.
CMD ["/app/start.sh"]
`
```
The Dockerfile specifies `/app/start.sh` as the initial process to run. This script needs to bring Tailscale up and then start the application binary. This is where we can use the `TAILSCALE\_AUTHKEY` variable we defined earlier.
Then, create a file named `start.sh` at the root of your app:
```
`#!/bin/sh
/app/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
/app/tailscale up --auth-key=${TAILSCALE\_AUTHKEY} --hostname=fly-app
/app/my-app
`
```
The next time your App on Fly deploys, it will be able to connect to your private Tailscale network.
If you are using an Alpine base image and an existing Fly machine, you may need to update the machine to ensure that it has kernel support for nftables. For more information, refer to [Fly community post](https://community.fly.io/t/kernel-nftables-support/17669) and [Tailscale issue #10540](https://github.com/tailscale/tailscale/issues/10540).
## [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
When an ephemeral node goes offline, it is automatically removed from your tailnet. You can also control ephemeral node removal using the [`tailscale logout`](/docs/reference/tailscale-cli#logout) command to either manually force the removal or incorporate the command into the [`tailscaled`](/docs/reference/tailscaled) Tailscale daemon. For more information, refer to [Ephemeral nodes](/docs/features/ephemeral-nodes#faq).
On this page
* [Step 1: Generate an auth key to authenticate your App on Fly](#step-1-generate-an-auth-key-to-authenticate-your-app-on-fly)
* [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
* [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
Scroll to top