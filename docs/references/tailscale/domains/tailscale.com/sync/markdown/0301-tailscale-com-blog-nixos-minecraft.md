Tailscale on NixOS: A new Minecraft server in ten minutes
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 19, 2021
# Tailscale on NixOS: A new Minecraft server in ten minutes
NixOS is a Linux distribution built from the ground up to make it easy to deploy
services. Tailscale is a peer-to-peer VPN built to make it easy to connect
machines. In this article I will show how to set up a Java Edition
Minecraft server (exposed only over Tailscale) in ten minutes on Digital Ocean.
Before you begin this guide, you’ll need the following:
* A [Digital Ocean](https://www.digitalocean.com/) account
* A [Minecraft](https://www.minecraft.net/en-us/) Java Edition account
You’ll also need [a Tailscale account](https://login.tailscale.com/start). You can
make a free personal account using an `@gmail.com` address.
In NixOS one of the core principles is that the entire system is configurable
with a modular language called Nix. This allows you to configure everything
using a common syntax so you don’t need to remember every configuration file
format for every service you use. As such, you can configure an entire system
from a single file.
Let’s make a new configuration file called `host.nix` and set up a system that
has Tailscale start up on boot:
```
`{ config, pkgs, ... }:
{
# make the tailscale command usable to users
environment.systemPackages = [ pkgs.tailscale ];
# enable the tailscale service
services.tailscale.enable = true;
}
`
```
This will have Tailscale start up, however to authenticate to Tailscale we need
to take a few more steps. First, head to the [Pre-Auth Keys page in the admin
panel](https://login.tailscale.com/admin/settings/keys).
Create a new one-time use key and then copy it to your notes. We will use it
below.
With this key we can write a [systemd oneshot
unit](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files#the-service-section)
that will log in to Tailscale using this key.
A systemd oneshot job is something that systemd expects to be run once as
opposed to being a persistent service. The above Digital Ocean link explains
this in more detail.
Copy this configuration below the `services.tailscale.enable` line in your
`host.nix` file:
```
` # ...
# create a oneshot job to authenticate to Tailscale
systemd.services.tailscale-autoconnect = {
description = "Automatic connection to Tailscale";
# make sure tailscale is running before trying to connect to tailscale
after = [ "network-pre.target" "tailscale.service" ];
wants = [ "network-pre.target" "tailscale.service" ];
wantedBy = [ "multi-user.target" ];
# set this service as a oneshot job
serviceConfig.Type = "oneshot";
# have the job run this shell script
script = with pkgs; ''
# wait for tailscaled to settle
sleep 2
# check if we are already authenticated to tailscale
status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
if [ $status = "Running" ]; then # if so, then do nothing
exit 0
fi
# otherwise authenticate with tailscale
${tailscale}/bin/tailscale up -authkey tskey-examplekeyhere
'';
};
`
```
Make sure to replace `tskey-examplekeyhere` with the key you got from the Admin
panel. Without this key your VPS cannot connect to Tailscale.
Now that we have Tailscale configured to authenticate and connect to your
network, let’s enable the lightweight NixOS firewall so that we can only allow
Minecraft traffic over Tailscale. The [NixOS
manual](https://nixos.org/manual/nixos/stable/index.html#sec-firewall) has more
details, but at a high level we need to:
* Enable the firewall
* Mark tailscale0 as a trusted interface
* Allow anyone on the internet to connect to Tailscale’s UDP port (don’t worry,
they will be rejected if they are not a part of your network)
* Allow anyone on the internet to connect to your server’s SSH port (this will
also work over Tailscale, but having it exposed over the public internet can
help when debugging issues that happen before tailscale starts)
We can do that with the following configuration added to the end of your
`host.nix` file:
```
` # ...
networking.firewall = {
# enable the firewall
enable = true;
# always allow traffic from your Tailscale network
trustedInterfaces = [ "tailscale0" ];
# allow the Tailscale UDP port through the firewall
allowedUDPPorts = [ config.services.tailscale.port ];
# allow you to SSH in over the public internet
allowedTCPPorts = [ 22 ];
};
`
```
Now we can configure the Minecraft server. The [Minecraft
options](https://search.nixos.org/options?channel=20.09&amp;show=services.minecraft-server.dataDir&amp;from=0&amp;size=30&amp;sort=relevance&amp;query=services.minecraft-server)
expose a number of settings you can use to configure your server however you
want. Please note that you *must* set the EULA agreement to `true` yourself. The
Minecraft server is a closed-source program, so you must give NixOS permission
to use closed source packages.
```
` # ...
services.minecraft-server = {
enable = true;
eula = false; # set to true if you agree to Mojang's EULA: https://account.mojang.com/documents/minecraft\_eula
declarative = true;
# see here for more info: https://minecraft.gamepedia.com/Server.properties#server.properties
serverProperties = {
server-port = 25565;
gamemode = "survival";
motd = "NixOS Minecraft server on Tailscale!";
max-players = 5;
enable-rcon = true;
# This password can be used to administer your minecraft server.
# Exact details as to how will be explained later. If you want
# you can replace this with another password.
"rcon.password" = "hunter2";
level-seed = "10292992";
};
};
# enable closed source packages such as the minecraft server
nixpkgs.config.allowUnfree = true;
`
```
Now we have everything we need. We set up Tailscale, we configured an automatic
login to Tailscale, we set up the firewall so that it rejects all incoming
traffic (except for traffic from your Tailscale network) and finally we
configured the Minecraft server so that your can play in survival mode.
Now let’s get this put into a new Digital Ocean server. Open a new text editor
window and create a file called `user-data.yaml`. Copy this template into it:
```
`#cloud-config
write\_files:
- path: /etc/nixos/host.nix
permissions: "0644"
content: |
{ pkgs, config, ... }:
{
}
runcmd:
- curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | PROVIDER=digitalocean NIXOS\_IMPORT=./host.nix NIX\_CHANNEL=nixos-20.09 bash 2\>&1 | tee /tmp/infect.log
`
```
At the time of this article being written, Digital Ocean doesn’t have a NixOS
image by default. So we will use
[nixos-infect](https://github.com/elitak/nixos-infect) in order
to automatically replace an Ubuntu installation with a NixOS one. We are also
going to use it to automatically configure the server with the `host.nix` file
we just made.
Copy the contents of `host.nix` into the `content` value of the `write\_files`
block. Be sure to indent the file by four spaces so that it will work as yaml
user data. When you are done you should have a file that looks something like
[this reference file](https://gist.github.com/Xe/b2f26ae62e7ff6f6030e4a94ed3e2707).
Now that you have the cloud config, let’s launch the server in the cloud.
Open the Digital Ocean control panel and click Create and then click Droplets.
Choose an Ubuntu 20.04 image and a plan with at least 4 GB of ram (the Minecraft
server needs a lot of resources, unfortunately).
Then choose a datacenter near you and enable the IPv6 and User Data options.
Paste the contents of your `user-data.yaml` file into the text box that shows
up. Choose your SSH key in the list of SSH keys that shows up and then give the
droplet a hostname, such as “minecraft”. If you want you can enable backups.
Once you have everything set up, click the large green button labeled Create
Droplet. It may take up to 10 minutes to install and configure NixOS, however
you will be able to see the machine in your Tailscale network once everything is
done setting up. Go grab a cup of your favorite caffeinated beverage.
After it shows up in your network list, you can fire up your Minecraft
client and connect to your new server. You may need to select a slightly older
version of Minecraft if the in-game UI tells you to use an older version of
Minecraft. You can adjust the Minecraft version you are running using
[the launcher UI](https://help.minecraft.net/hc/en-us/articles/360034754852-Changing-game-versions-).
If you want to administer your minecraft server, you can add the `mcrcon`
package to your system config next to the `tailscale` package:
```
`environment.systemPackages = with pkgs; [ tailscale mcrcon ];
`
```
Then you can connect to the Minecraft server command line with this command:
```
`$ mcrcon -p hunter2
`
```
If you adjusted the rcon password above, you will need to adjust this command to
include that new password. From there you can change gamemodes, adjust the time
of day and anything else you want.
Once [node sharing](https://tailscale.com/kb/1084/sharing) is generally
available, you can use it to invite people you trust to your server. (Node
sharing is still in private beta.) Generate an invite link in the admin console
and they can use that to join your adventure.
If you want to make configuration changes to your server after you provision it,
edit the `/etc/nixos/host.nix` file in your favorite text editor (such as nano).
The [NixOS
manual](https://nixos.org/manual/nixos/stable/index.html#ch-configuration)
should help guide you if you want to install more services (such as backups
using [borgbackup](https://christine.website/blog/borg-backup-2021-01-09) or
anything else listed in the [options](https://search.nixos.org/options)). The
cloud’s the limit!
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