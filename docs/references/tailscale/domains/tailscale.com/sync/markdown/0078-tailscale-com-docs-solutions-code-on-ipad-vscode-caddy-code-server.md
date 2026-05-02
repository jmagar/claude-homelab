Code on iPad using Visual Studio Code, Caddy, and code-server · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Code on iPad using Visual Studio Code, Caddy, and code-server
Last validated: Oct 16, 2025
[Visual Studio Code](https://code.visualstudio.com) (VS Code) has quickly become the text editor many people use for their day-to-day work. Its cross-platform compatibility, speed, and vast library of extensions make it a popular choice.
Coder.com's [code-server](https://github.com/cdr/code-server) lets you run VS Code on a server and access it on any device, including an iPad. However, [code-server isn't safe to expose over the public internet](https://github.com/coder/code-server/blob/main/docs/guide.md#expose-code-server), which usually leads to installing a public-facing SSH proxy or an HTTP reverse proxy like nginx in front of it. Tailscale eliminates all that, giving you a fast, private connection no matter where you are.
In this guide you'll set up code-server and use Tailscale to connect to it securely from an iPad. When you're done, you'll have a secure development environment you can access anywhere.
## [Prerequisites](#prerequisites)
To complete this guide, you'll need the following:
* A Tailscale account. [Create a free Personal account](https://login.tailscale.com/start) if you don't have one already.
* A server to host code-server. This guide assumes you're using an Ubuntu 24.04 server and you have `sudo` access to install and run services. You can also install code-server on other platforms
* The Tailscale client installed and running on your server so you can connect to it securely. Follow the [Install Tailscale on Linux](/docs/install/linux) instructions if you're using Ubuntu, or [download and install Tailscale](/download) manually.
* An iPad with Tailscale installed and running to access your VS Code server through a web browser. [Download and install Tailscale](/download) on your device. You can also use an Android tablet or a laptop as long as they're running Tailscale.
* [MagicDNS](/docs/features/magicdns) enabled on your tailnet, so you can use your server's MagicDNS hostname and use HTTPS certificates.
## [Step 1: Verify your Tailscale setup](#step-1-verify-your-tailscale-setup)
Before you set up code-server, confirm you can connect to your server on your tailnet. Start by getting [your machine's Tailscale IP address](/docs/concepts/ip-and-dns-addresses).
If you're logged into your server already, you can find the Tailscale IP address with the following command:
```
`tailscale ip --4
`
```
Copy the 100.x.y.z address. After you've found it, type `exit` to end your session.
Now start a new session that uses your Tailscale IP address:
```
`ssh \<username\>@\<copied 100.x.y.z address\>
`
```
After you connect successfully, you can set up code-server.
## [Step 2: Install and secure code-server](#step-2-install-and-secure-code-server)
To use code-server with Tailscale, you'll install it on your server and then change its settings so it's only available to devices on your tailnet.
You can install code-server with a script or download pre-built binaries from their [GitHub releases page](https://github.com/cdr/code-server/releases). For this guide, you'll use the script.
On your server, run the following one-line command to install code-server:
```
`curl -fsSL https://code-server.dev/install.sh | sh
`
```
The installation program runs, eventually presenting the following output to indicate it's installed:
```
`To have systemd start code-server now and restart on boot:
sudo systemctl enable --now code-server@$USER
Or, if you don't want/need a background service you can run:
code-server
Deploy code-server for your team with Coder: https://github.com/coder/coder
`
```
Configure code-server to start on boot by running the following command:
```
`sudo systemctl enable --now code-server@$USER
`
```
The command completes with the following message:
```
`Created symlink /etc/systemd/system/default.target.wants/code-server@your-user.service → /usr/lib/systemd/system/code-server@.service.
`
```
code-server is now running on your local machine on port `8080`.
By default, code-server only accepts connections from the local device (`127.0.0.1`) and restricts access with a password. Because you'll only be accessing code-server over Tailscale, and Tailscale already uses your existing single sign-on (SSO) identity provider, there's no need for password-based authentication. You can already trust that you're authorized if you can even access the server. To do this, you'll update code-server's configuration to change how authentication works and the IP address code-server uses.
Open the code-server configuration file at `\~/.config/code-server/config.yaml` using `nano` or another text editor:
```
`nano \~/.config/code-server/config.yaml
`
```
The configuration file looks like the following example, with a `bind-address` set to the local device and password authentication:
```
`bind-addr: 127.0.0.1:8080
auth: password
password: \<random-password\>
cert: false
`
```
Update the `auth` field to `none`, remove the `password` field, and make the service available only on your Tailscale IP address by changing the `bind-addr` field to your Tailscale IP address:
```
`bind-addr: \<100.x.y.z address\>:8080
auth: none
cert: false
`
```
Save the file and exit your editor.
Apply the changes by restarting code-server:
```
`sudo systemctl restart code-server@$USER
`
```
The service is now listening, but only on the Tailscale IP address.
On your iPad, ensure you've connected to your tailnet and that your server appears in the Tailscale application's list of devices.
Open a browser and access your server by visiting `http://100.x.y.z:8080/`, using your IP address.
You've got a working environment, but you can't use all of its features until you enable HTTPS support.
## [Step 3: Use HTTPS with Caddy](#step-3-use-https-with-caddy)
code-server's basic features work well over plain HTTP. Your connection is secure as long as you're connecting over an encrypted and authenticated
Tailscale link. However, some features, like using the system clipboard, will be unavailable because web browsers require HTTPS for them to work. To make code-server fully functional, you'll need to set up an HTTPS connection with certificates.
Caddy automatically recognizes and uses certificates for your Tailscale network (`\*.ts.net`), and can use Tailscale's HTTPS certificates.
First, [ensure you've enabled HTTPS certificates for your tailnet](/docs/how-to/set-up-https-certificates).
Then, on your server, request a Let's Encrypt certificate. To do this, you need your machine name and your [tailnet name](/docs/concepts/tailnet-name). You can find your tailnet DNS name in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console. You can also run the `tailscale cert` command without arguments, and it will tell you the domain to use:
```
`tailscale cert
`
```
The usage message gives you the details you need:
```
`Usage: tailscale cert [flags] \<domain\>
For domain, use "machine-name.tailnet-name.ts.net".
`
```
Run `tailscale cert` with `sudo` and provide the domain:
```
`sudo tailscale cert machine-name.tailnet-name.ts.net
`
```
The command displays the following output, indicating it created the certificate files:
```
`Wrote public cert to machine-name.tailnet-name.ts.net.crt
Wrote private key to machine-name.tailnet-name.ts.net.key
`
```
Then, install Caddy on the server running code-server. On Ubuntu, install Caddy with the following commands:
```
`sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
chmod o+r /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
`
```
This installs Caddy's dependencies, adds Caddy's official package repository to your package manager sources, and installs Caddy as a service.
Now configure Caddy to use your Tailscale domain name. Edit `/etc/caddy/Caddyfile` with a text editor:
```
`sudo nano /etc/caddy/Caddyfile
`
```
Replace the contents of the file with the following, using your domain name and your Tailscale IP address:
```
`machine-name.tailnet-name.ts.net {
reverse\_proxy 100.x.y.z:8080
}
`
```
This defines a reverse proxy which forwards requests on to your code-server instance.
Save the file and exit the editor.
Installing Caddy on Ubuntu using the official scripts runs the Caddy server under the `caddy` user. For Tailscale to work with Caddy, you have to tell `tailscaled` to allow the `caddy` user to get the certificate.
Open the file `/etc/default/tailscaled` with your text editor:
```
`sudo nano /etc/default/tailscaled
`
```
Add the following line to the file to allow the `caddy` user access to fetch certificates:
```
`TS\_PERMIT\_CERT\_UID=caddy
`
```
Review the [tailscaled](/docs/reference/tailscaled) documentation for more information on its configuration options.
Save the file. Now restart the `tailscaled` service to apply the changes:
```
`sudo systemctl reload tailscaled
`
```
Reload Caddy to apply the configuration changes you made:
```
`sudo systemctl reload caddy
`
```
Visit `https://machine-name.domain-alias.ts.net` on your iPad to connect to code-server. This time, all features that require a valid HTTP certificate work as expected.
## [Conclusion](#conclusion)
You can now access your VS Code instance from anywhere. You can code from a café near your home or from the other side of the world. And it's only accessible over Tailscale.
Since you'll be developing on this device, it'll have access to sensitive information such as private code or private data. To keep things even more secure, you may want to restrict all access to the server to only be over Tailscale.
For more information on how to further lock down a server, [read our guide on Ubuntu and ufw](/docs/how-to/secure-ubuntu-server-with-ufw).
On this page
* [Prerequisites](#prerequisites)
* [Step 1: Verify your Tailscale setup](#step-1-verify-your-tailscale-setup)
* [Step 2: Install and secure code-server](#step-2-install-and-secure-code-server)
* [Step 3: Use HTTPS with Caddy](#step-3-use-https-with-caddy)
* [Conclusion](#conclusion)
Scroll to top