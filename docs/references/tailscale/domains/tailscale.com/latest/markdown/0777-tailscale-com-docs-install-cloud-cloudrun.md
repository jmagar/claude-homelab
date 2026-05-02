Tailscale on Google Cloud Run · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale on Google Cloud Run
Last validated: Jan 5, 2026
Google Cloud Run is a popular method of deploying application using containers, rather than managing servers yourself. However, it can be difficult to use Tailscale on Google Cloud Run, since it doesn't provide a /dev/net/tun device that Tailscale needs.
You can use Tailscale's [userspace networking mode](/docs/concepts/userspace-networking) to connect your Cloud Run apps to your Tailscale network.
## [Step 1: Generate an auth key to authenticate your Cloud Run containers](#step-1-generate-an-auth-key-to-authenticate-your-cloud-run-containers)
First, we'll [generate an auth key](/docs/features/access-control/auth-keys) to allow Cloud Run to authenticate our container to join our network.
Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console and select **Generate auth key**. We recommend using an [ephemeral key](/docs/features/ephemeral-nodes) for this purpose, since it will automatically clean up devices after they shut down.
The **Pre-approved** option will only display in the dialog if [device approval](/docs/features/access-control/device-management/device-approval) is enabled in your Tailscale network.
Next, [go to Cloud Run's](https://console.cloud.google.com/run) **Edit & Deploy New Revision** page and select the **Variables & Secrets** tab. From here, add a new secret, use **Environment variable** as the reference method, and name it `TAILSCALE\_AUTHKEY`. Use the `tskey-\<key\>` value as the secret.
## [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
Next, we'll use a [multistage Dockerfile](https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds), where the first stage builds your application, and the second stage pulls application code and Tailscale into the final image to be uploaded to Google.
In your `Dockerfile`:
```
`FROM golang:1.16.2-alpine3.13 as builder
WORKDIR /app
COPY . ./
# This is where one could build the application code as well.
FROM alpine:latest
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/\*
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
/app/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
/app/tailscale up --auth-key=${TAILSCALE\_AUTHKEY} --hostname=cloudrun-app
echo Tailscale started
ALL\_PROXY=socks5://localhost:1055/ /app/my-app
`
```
The next time your Cloud Run container deploys, it will be able to connect to your private Tailscale network.
## [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
When an ephemeral node goes offline, it is automatically removed from your tailnet. You can also control ephemeral node removal using the [`tailscale logout`](/docs/reference/tailscale-cli#logout) command to either manually force the removal or incorporate the command into the [`tailscaled`](/docs/reference/tailscaled) Tailscale daemon. For more information, refer to [Ephemeral nodes](/docs/features/ephemeral-nodes#faq).
On this page
* [Step 1: Generate an auth key to authenticate your Cloud Run containers](#step-1-generate-an-auth-key-to-authenticate-your-cloud-run-containers)
* [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
* [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
Scroll to top