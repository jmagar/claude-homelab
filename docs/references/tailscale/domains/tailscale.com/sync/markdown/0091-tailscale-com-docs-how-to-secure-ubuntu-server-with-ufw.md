Use ufw to lock down an Ubuntu server · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use ufw to lock down an Ubuntu server
Last validated: Jan 5, 2026
Any server on the public internet is bound to be attacked by bots looking
for weak or leaked passwords and unsafely configured services. Even security
experts can misconfigure a database, or an unwitting member of the team can
accidentally open up a vulnerability, leaving your devices or network open to
attack.
If you have an existing server, you can view this bot traffic by running
`sudo less /var/log/auth.log`. If your server is like many on the web,
you'll see lots of "invalid user admin" or "invalid user test".
Tailscale simplifies network security by letting you keep your servers away
from the public web, while keeping it easy to connect.
The best way to secure a server with Tailscale is to accept connections from
Tailscale, and ignore any public internet traffic. Since your Tailscale network
is invisible, except to those in your network, attackers won't even be able to
find it.
## [Prerequisites](#prerequisites)
Before you begin this guide, you'll need an Ubuntu server to secure. This guide
assumes you're setting up a [DigitalOcean Ubuntu server](https://www.digitalocean.com/products/linux-distribution/ubuntu),
but the steps should be similar for most hosting providers and versions of Ubuntu.
You'll also need a Tailscale network, known as a tailnet. For information about creating a tailnet, refer to the [Tailscale quickstart](/docs/how-to/quickstart).
Next, you'll need to install the Tailscale client on your local machine and log in.
[Download Tailscale](/download)
We'll follow the same steps on the Ubuntu server next.
## [Step 1: SSH into your new Ubuntu server](#step-1-ssh-into-your-new-ubuntu-server)
After spinning up a new server, SSH into it with your account details.
```
`ssh \<username\>@\<server host ip\>
`
```
## [Step 2: Install Tailscale on your Ubuntu server](#step-2-install-tailscale-on-your-ubuntu-server)
1. Install Tailscale using the one-line script below, or read our [detailed install instructions for Ubuntu](/download/linux)
```
`curl -fsSL https://tailscale.com/install.sh | sh
`
```
2. Authenticate and connect your machine to
your Tailscale network
```
`sudo tailscale up
`
```
3. (Optional) If you signed in with a custom domain (not a `@gmail.com` address) visit the [admin console](https://login.tailscale.com/admin) and authorize your new endpoint.
4. (Optional) Disable key expiry for this server
As a security feature, Tailscale requires periodic reauthentication. To prevent getting locked out, you may want to disable expiry on certain endpoints, such as this trusted server. Disable key expiry by following [these instructions](/docs/features/access-control/key-expiry).
If you leave key expiry on, be familiar with how to regain server access. For example, DigitalOcean provides access via a [droplet console](https://www.digitalocean.com/docs/droplets/resources/console).
## [Step 3: SSH over Tailscale](#step-3-ssh-over-tailscale)
An important step — since we're about to restrict SSH access to be only over
Tailscale, we'll exit the machine and re-SSH with our Tailscale IP.
First, [find and copy your machine's Tailscale IP](/docs/concepts/ip-and-dns-addresses). The
easiest way to do this is to run
```
`tailscale ip -4
`
```
And copy the 100.x.y.z shown.
Once you've found it, `exit` your SSH session, and start a new one with your
newly copied Tailscale IP.
```
`ssh \<username\>@\<copied 100.x.y.z address\>
`
```
## [Step 4: Enable ufw](#step-4-enable-ufw)
For this guide, we'll use [ufw](https://help.ubuntu.com/community/UFW)
(Uncomplicated Firewall) to restrict non-Tailscale traffic to our server. It comes pre-installed on Ubuntu 18.04, so no installation is needed.
Before we continue editing rules, you'll need to enable ufw if it isn't already enabled.
```
`sudo ufw enable
`
```
## [Step 5: Restrict all other traffic](#step-5-restrict-all-other-traffic)
Next, we'll set up rules to reject all incoming non-Tailscale traffic, and allow all outgoing
traffic by default.
```
`sudo ufw default deny incoming
sudo ufw default allow outgoing
`
```
Now that we've set these defaults check your existing firewall rules you might
need to keep.
```
`sudo ufw status verbose
`
```
The output might display a list of firewall rules, like this:
```
`To Action From
-- ------ ----
22/tcp ALLOW IN Anywhere
80/tcp ALLOW IN Anywhere
443/tcp ALLOW IN Anywhere
Anywhere on tailscale0 ALLOW IN Anywhere
22/tcp (v6) ALLOW IN Anywhere (v6)
80/tcp (v6) ALLOW IN Anywhere (v6)
443/tcp (v6) ALLOW IN Anywhere (v6)
Anywhere (v6) on tailscale0 ALLOW IN Anywhere (v6)
`
```
If the output does not include an `Anywhere on tailscale0` rule, you can create one manually:
```
`sudo ufw allow in on tailscale0
`
```
All other connections are denied by default and so not listed above. We want to limit this list to the minimum set needed.
To completely lock down your server while retaining SSH access, you could delete
every rule except for the "Anywhere on tailscale0" rule.
For the example above, we'll delete all "22/tcp" rules, which will remove the
ability to SSH over regular connections:
```
`sudo ufw delete 22/tcp
`
```
Now, only "Anywhere on tailscale0" remains, meaning SSH can only occur over Tailscale.
```
`To Action From
-- ------ ----
80/tcp ALLOW Anywhere
443/tcp ALLOW Anywhere
Anywhere on tailscale0 ALLOW IN Anywhere
80/tcp (v6) ALLOW Anywhere (v6)
443/tcp (v6) ALLOW Anywhere (v6)
Anywhere (v6) on tailscale0 ALLOW IN Anywhere (v6)
`
```
If you expose a public web service (80/tcp, 443/tcp), you'll want to keep those rules around. For less public services like FTP (21/tcp) or a database, consider connecting devices that rely on those services over Tailscale too.
This guide assumes SSH is running on the default port, port 22. If you've changed
your SSH port, you may need to change these instructions as well.
## [Step 6: Restart ufw and SSH](#step-6-restart-ufw-and-ssh)
Once you've set up firewall rules to restrict all non-Tailscale connections,
restart ufw and SSH
```
`sudo ufw reload
sudo service ssh restart
`
```
Now your server will ignore any SSH requests that don't come from users authenticated
to your private Tailscale network.
## [Step 7: Test and verify](#step-7-test-and-verify)
Let's make sure that everything is working as expected.
First, let's `exit` the existing SSH session.
Then, let's try to connect with the public IP address from earlier.
The connection attempt fails and the operation times out.
```
`ssh \<username\>@\<server host ip\>
ssh: connect to host \<server host ip\> port 22: Operation timed out
`
```
Now, let's try to SSH in using the Tailscale IP address (starting with 100.x.y.z) from earlier.
```
`ssh \<username\>@\<copied 100.x.y.z address\>
`
```
Everything now works as expected. Type `exit` to close the SSH connection again.
This time, quit the Tailscale client on your local machine.
If you try to `ssh` to the Ubuntu server again, the operation times out and we are no longer able to connect.
```
`ssh \<username\>@\<copied 100.x.y.z address\>
ssh: connect to host \<copied 100.x.y.z address\> port 22: Operation timed out
`
```
We've now verified that we can only connect when we're successfully authenticated to the Tailscale client running on our local machine.
## [(Optional) enable multifactor authentication (MFA) for all SSH connections](#optional-enable-multifactor-authentication-mfa-for-all-ssh-connections)
Now that your server can only be accessed by using Tailscale, you can enforce login
rules in using your Tailscale network's [identity provider](/docs/integrations/identity),
knowing they will apply to all your SSH connections too.
For example, you may want to configure your identity provider to [require multifactor authentication (MFA)](/docs/multifactor-auth) for every sign-in.
Thanks to */u/mgozmovies* whose experimentation and
[write-up on /r/tailscale](https://old.reddit.com/r/Tailscale/comments/hwnc0l/restricting_ssh_access_to_tailscale_interface_on)
inspired this topic.
On this page
* [Prerequisites](#prerequisites)
* [Step 1: SSH into your new Ubuntu server](#step-1-ssh-into-your-new-ubuntu-server)
* [Step 2: Install Tailscale on your Ubuntu server](#step-2-install-tailscale-on-your-ubuntu-server)
* [Step 3: SSH over Tailscale](#step-3-ssh-over-tailscale)
* [Step 4: Enable ufw](#step-4-enable-ufw)
* [Step 5: Restrict all other traffic](#step-5-restrict-all-other-traffic)
* [Step 6: Restart ufw and SSH](#step-6-restart-ufw-and-ssh)
* [Step 7: Test and verify](#step-7-test-and-verify)
* [(Optional) enable multifactor authentication (MFA) for all SSH connections](#optional-enable-multifactor-authentication-mfa-for-all-ssh-connections)
Scroll to top