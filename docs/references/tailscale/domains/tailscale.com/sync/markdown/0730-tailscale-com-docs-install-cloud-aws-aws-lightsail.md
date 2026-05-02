Tailscale on AWS Lightsail · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale on AWS Lightsail
Last validated: Jan 5, 2026
AWS Lightsail is a low cost means of running either virtual machines or containers. The container deployments in Lightsail can make it difficult to use Tailscale, since it doesn't provide a /dev/net/tun device that Tailscale needs.
In Tailscale v1.12 or later, you can use Tailscale's [userspace networking mode](/docs/concepts/userspace-networking) to connect your AWS Lightsail apps to your Tailscale network.
## [Step 1: Generate an auth key to authenticate your AWS Lightsail containers](#step-1-generate-an-auth-key-to-authenticate-your-aws-lightsail-containers)
First, we'll [generate an auth key](/docs/features/access-control/auth-keys) to allow AWS Lightsail to authenticate our container to join our network.
Open the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console and select **Generate auth key**. We recommend using an [ephemeral key](/docs/features/ephemeral-nodes) for this purpose, since it will automatically clean up devices after they shut down.
Next, [select the AWS Lightsail](https://lightsail.aws.amazon.com) Containers tab, and create a new deployment for a container service. In the Containers section of the configuration is an **Add environment variables** link. Make the variable key `TAILSCALE\_AUTHKEY` with a value of the `tskey-\<key\>` string generated earlier.
## [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
Next, we'll use a [multistage Dockerfile](https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds), where the first stage builds your application, and the second stage pulls application code and Tailscale into the final image to be uploaded to AWS.
In your `Dockerfile`:
```
`FROM alpine:latest as builder
WORKDIR /app
COPY . ./
# This is where one could build the application code as well.
FROM alpine:latest
# Copy binary to production image.
COPY --from=builder /app/bootstrap /var/runtime/bootstrap
# Copy Tailscale binaries from the tailscale image on Docker Hub.
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscaled /var/runtime/tailscaled
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscale /var/runtime/tailscale
RUN mkdir -p /var/run && ln -s /tmp/tailscale /var/run/tailscale && \\
mkdir -p /var/cache && ln -s /tmp/tailscale /var/cache/tailscale && \\
mkdir -p /var/lib && ln -s /tmp/tailscale /var/lib/tailscale && \\
mkdir -p /var/task && ln -s /tmp/tailscale /var/task/tailscale
EXPOSE 8080
# Run on container startup.
ENTRYPOINT ["/var/runtime/bootstrap"]
`
```
The Dockerfile specifies `/var/runtime/bootstrap` as the initial process to run. This script needs to bring Tailscale up and then start the application binary. This is where we can use the `TAILSCALE\_AUTHKEY` variable we defined earlier.
Then, create a file named `bootstrap` at the root of your app:
```
`#!/bin/sh
mkdir -p /tmp/tailscale
/var/runtime/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
/var/runtime/tailscale up --auth-key=${TAILSCALE\_AUTHKEY} --hostname=aws-lightsail-app
echo Tailscale started
ALL\_PROXY=socks5://localhost:1055/ /var/runtime/my-app
`
```
When your AWS Lightsail container deploys, it will be able to connect to your private Tailscale network.
## [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
When an ephemeral node goes offline, it is automatically removed from your tailnet. You can also control ephemeral node removal using the [`tailscale logout`](/docs/reference/tailscale-cli#logout) command to either manually force the removal or incorporate the command into the [`tailscaled`](/docs/reference/tailscaled) Tailscale daemon. For more information, refer to [Ephemeral nodes](/docs/features/ephemeral-nodes#faq).
On this page
* [Step 1: Generate an auth key to authenticate your AWS Lightsail containers](#step-1-generate-an-auth-key-to-authenticate-your-aws-lightsail-containers)
* [Step 2: Configure your Dockerfile to install Tailscale](#step-2-configure-your-dockerfile-to-install-tailscale)
* [Remove ephemeral nodes from a tailnet](#remove-ephemeral-nodes-from-a-tailnet)
Scroll to top