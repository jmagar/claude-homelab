Tailscale Authentication for NGINX
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 27, 2022
# Tailscale Authentication for NGINX
Previously on the Tailscale blog, I walked through how authentication works
with Tailscale [for Grafana](https://tailscale.com/blog/grafana-auth/) and even
[for Minecraft](https://tailscale.com/blog/tailscale-auth-minecraft/). Today
we’re going to take that basic concept and show how to extend it to services
that you have proxied behind [NGINX](https://nginx.org).
The Grafana/Minecraft authentication proxy trick works because we set up a whole
new node on your tailnet to proxy traffic directly to Grafana or Minecraft. This
does work, but there’s a nonzero setup cost every time you add a new service to
the mix. If you have an existing NGINX configuration for all your internal
services, it may be easier to just use NGINX to proxy access to everything.
I have created
[`nginx-auth`](https://github.com/tailscale/tailscale/tree/main/cmd/nginx-auth)
to implement the [NGINX HTTP subrequest authentication
protocol](https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-subrequest-authentication/).
You can use this to authenticate every request to your internal services and
then decorate requests to them with the right HTTP headers.
Like what you see here? Want to help us focus future efforts in making DevOps
tools easier to use with Tailscale? Fill out our [survey](https://forms.gle/J37SELFSzXQJxAwB8)! Our future efforts will be guided by this feedback.
## Setup
I have added `nginx-auth` to the Tailscale repositories for `x86\_64` Linux
machines. To install it on an Ubuntu machine, run this command:
```
`sudo apt-get update && sudo apt-get install tailscale-nginx-auth
`
```
At the time of writing, this autoinstall strategy isn’t supported on
non-Debian/Ubuntu. You can work around this by going into a checkout of
[tailscale/tailscale](https://github.com/tailscale/tailscale) and checking out
`cmd/nginx-auth`’s
[documentation](https://github.com/tailscale/tailscale/tree/main/cmd/nginx-auth#building)
on how to build packages.
This will automatically download the `nginx-auth` tool and other metadata needed
to run it in [systemd](https://systemd.io).
Once it is installed, you need to activate it in systemd with the following
command:
```
`sudo systemctl enable --now tailscale.nginx-auth.socket
`
```
This uses [systemd socket
activation](https://mgdm.net/weblog/systemd-socket-activation/) to automatically
start the service when it is needed. This lets systemd dynamically activate
`tailscale.nginx-auth.service` on-demand instead of having it always run. This
also automatically restarts the service if it crashes.
### NGINX configuration
Once the `tailscale.nginx-auth` service is set up in your system, you need to
configure NGINX to use it. This works in the `server` block, meaning that you
can set up separate authentication logic for services listening over Tailscale
vs services listening to the internet.
Set up an internal route named `/auth` (you can change this path should you need
to):
```
`location /auth {
internal;
proxy\_pass http://unix:/run/tailscale.nginx-auth.sock;
proxy\_pass\_request\_body off;
proxy\_set\_header Host $http\_host;
proxy\_set\_header Remote-Addr $remote\_addr;
proxy\_set\_header Remote-Port $remote\_port;
proxy\_set\_header Original-URI $request\_uri;
}
`
```
And then in your `location` block that reverse proxies to your service, add this
just before the `proxy\_pass` instruction to use it:
```
`auth\_request /auth;
auth\_request\_set $auth\_user $upstream\_http\_tailscale\_user;
auth\_request\_set $auth\_name $upstream\_http\_tailscale\_name;
auth\_request\_set $auth\_login $upstream\_http\_tailscale\_login;
auth\_request\_set $auth\_tailnet $upstream\_http\_tailscale\_tailnet;
auth\_request\_set $auth\_profile\_picture $upstream\_http\_tailscale\_profile\_picture;
proxy\_set\_header X-Webauth-User "$auth\_user";
proxy\_set\_header X-Webauth-Name "$auth\_name";
proxy\_set\_header X-Webauth-Login "$auth\_login";
proxy\_set\_header X-Webauth-Tailnet "$auth\_tailnet";
proxy\_set\_header X-Webauth-Profile-Picture "$auth\_profile\_picture";
`
```
From here you can configure your applications to use the contents of
`X-Webauth-User` or the other headers to use that for authentication logic. For
a full list of options that are exposed in these response headers, check the
[documentation
table](https://github.com/tailscale/tailscale/tree/main/cmd/nginx-auth#headers)
which includes header names, example values and descriptions.
## Security benefits
Overall the security benefits of doing this are similar to setting up a
corporate SSO system. By moving authentication into the Tailscale level, you
no longer need to handle authentication yourself. You don’t need to have internal
tools maintain their own account systems with their own passwords. People
connect to the server over Tailscale, and Tailscale already knows who they are.
This will give you a Single-Sign-On (SSO) experience without having the
installation and maintenance overhead of setting up a new OAuth2 client, nor
enduring the toil involved with getting administrative approval to try things
out.
This proxy listens over a UNIX socket instead of a network-facing TCP socket.
This makes it impossible to accidentally expose the proxy to the network. When
you have the ability to, you should have your services listen over UNIX sockets
like this. It allows you to use normal filesystem permissions to limit access to
services instead of having to configure firewall rules.
## Get in touch
Did you try this? How did you like it? Ping us on Twitter
[@Tailscale](https://twitter.com/Tailscale) or let us know on [the
forum](https://forum.tailscale.com). If you want to check out the source code of
this authentication sidecar, check it out [on
GitHub](https://github.com/tailscale/tailscale/tree/main/cmd/nginx-auth).
Many thanks to [@zrail](https://twitter.com/zrail) for pointing out this NGINX
feature. Their examples helped guide the development of this service.
Share
Author
Xe Iaso
Author
Xe Iaso
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