August Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 31, 2022
# August Tailscale newsletter
👉 We’d love to hear your thoughts on Tailscale. Filling out this feedback form helps us build a better product for you:[https://forms.gle/FA9UJwiTbdoRzKsK7](https://forms.gle/FA9UJwiTbdoRzKsK7?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Summer has come to an end in the northern hemisphere, and as we sharpen our pencils and compare Lisa Frank Trapper Keepers, we have some exciting updates to share. The team worked alongside some wonderful partners to extend on-demand access to your Tailscale resources with[Opal](https://tailscale.com/blog/opal?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io),[Indent](https://tailscale.com/blog/indent?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io),[Sym](https://tailscale.com/blog/sym?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io), and[ConductorOne](https://tailscale.com/blog/conductorone?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io).[Brad Fitzpatrick](https://twitter.com/bradfitz?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)did some moonlighting on the[9to5 Apple @ Work podcas](https://9to5mac.com/2022/08/02/tailscale/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)t talking about Tailscale SSH. Microsoft’s[Paul Yu detailed](https://dev.to/azure/securely-connect-to-your-azure-linux-virtual-machine-with-tailscale-ssh-dkf?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)how to access your Linux machine on Azure with Tailscale SSH.
We also have lots of community contributions and Tailscale improvements to spotlight. Let’s jump in:
### From the community
* [**Simple multi-user Jupyterlab using Docker and Tailscale**](https://github.com/vincenzon/simple-hub?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
GitHub user[@vincenzon](https://github.com/vincenzon?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)shares a simple JupyterHub-like setup and explains how he secures it with Tailscale: “With Tailscale, it is a simple matter to grant users secure access to a single port on a server.”
* [**Using Tailscale on Windows to network more easily with WSL2 and Visual Studio Code**](https://www.hanselman.com/blog/using-tailscale-on-windows-to-network-more-easily-with-wsl2-and-visual-studio-code?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
[Scott Hanselman](https://www.hanselman.com/about?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)’s blog walks through the steps for setting up Tailscale on WSL2 and notes that Tailscale “levels the playing field” between devices and networks.
* [**How to use the iPad as a development device**](https://dogukanaydogdu.medium.com/how-to-use-the-ipad-as-a-development-device-26c9357e71bc?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Medium.com writer[Doğukan Aydoğdu](https://dogukanaydogdu.medium.com/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)shares how to use SSH to connect to your MacBook Pro from your iPad and concludes, “It works very well with the VPN that was created from Tailscale.”
* [**We now have Tailscale for private VPNs**](https://enteratec.com/tailscale-vpn-privada-facil-a-rabiar/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)(Spanish)
Jorge Reyes Escaño from Enteratec.com recommends Tailscale for simplifying the creation and configuration of private VPNs.
* [**Using Tailscale and iptables to roll your own port forwarding**](https://siraben.dev/2022/08/01/tailscale-iptables.html?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
[Ben](https://siraben.dev/about/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)at Siraben’s Musings shares how to host a Minecraft server without extra hardware.
* [**Using Tailscale certificates in Kubernetes**](https://blog.amber.org/blog/2022/08/using-tailscale-certificates-in-kubernetes/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Chris at[Old Man Yells at Clouds](https://blog.amber.org/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)says, “I’m a huge fan of Tailscale. Last year, they added a beta ability to issue X.509v3 certificates (via Let’s Encrypt) to systems on your tailnet” — and then puts it to the test.
* [**4 ways to optimize your workflows with Docker Extensions**](https://thenewstack.io/4-ways-to-optimize-your-workflows-with-docker-extensions/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Felipe Cruz from Docker talks about Docker Extensions and the benefits of sharing your containers securely with Tailscale.
* [**Securely connect to your Azure Linux virtual machine with Tailscale SSH**](https://dev.to/azure/securely-connect-to-your-azure-linux-virtual-machine-with-tailscale-ssh-dkf?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Microsoft senior cloud advocate[Paul Yu](https://dev.to/pauldotyu?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)details how to use Tailscale SSH to securely connect to your VM without exposing it to the internet, and concludes: “It is simple to set up and can be used in a variety of environments, from enterprises to hobbyists.”
* [**Tailscale Pi-hole setup**](https://www.erraticbits.ca/post/2022/tailscale_pihole/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Over at Erraticbits,[Jeff Clement](https://www.erraticbits.ca/about/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)documents setting up an internal Pi-hole server and using that for DNS privacy and ad blocking across his tailnet.
* [**Gitpod demo with remote resources and gpg signing**](https://www.loom.com/share/60c0be2901664bfaa650c25de713a66f?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)(video)
Chris Barker explains how he used Tailscale to bridge his workspace to a VPC where a MySQL instance was running.
* [**Tailscale subnet router using Azure container instances and Terraform**](https://www.reddit.com/r/Tailscale/comments/wu5hcb/tailscale_subnet_router_using_azure_container/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Reddit user u/cocallaw shares: “Taking the concept from what u/danhermes created with AWS Fargate, I built out the Azure version using Azure Container Instances (ACI). The Tailscale container is deployed into an ACI container group that is injected into the subnet of the VNet specified.”
* [**Tailscale VPN in Docker without elevated privileges**](https://asselin.engineer/tailscale-docker?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Blog Asselin.Engineer details how to add Tailscale to a docker-compose.yml without elevated privileges for situations where you want only the container (not the entire host device) to be accessible in the VPN.
* [**TrueNAS: Full setup guide for setting up Portainer, containers, and Tailscale**](https://www.youtube.com/watch?v=R7BXEuKjJ0k&amp;utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)(video)
YouTube channel[Level1Techs](https://www.youtube.com/c/Level1Techs?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)walks through installing Portainer and Tailscale on TrueNAS for a home server.
* [**How to set up a private web site with Tailscale in 5 minutes**](https://www.youtube.com/watch?v=IhefP5TrLv8&amp;utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)(video)
YouTuber[Pat Maddox](https://www.youtube.com/c/PatMaddox?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)explains how he used Tailscale to set up a private website he can access on the go. His verdict? “Not only does it not suck, it works really well.”
* [**How I do computer things in 2022**](https://www.youtube.com/watch?v=EMN7r0PJhpk&amp;utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)(video)
“Listen to me ramble for a while about my computing setup in 2022,” says YouTube channel[endeavorance](https://www.youtube.com/c/endeavorance?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)in this video that includes a discussion of Tailscale.
Want to be included in future Tailscale newsletters? Tag us in your rant, guides, or tutorials on Twitter.
### From the team
* [**The Cloudcast — Cloud Computing**](https://twitter.com/thecloudcastnet/status/1560601570647179265?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Tailscale Head of Product[@MayaKaczorowski](https://twitter.com/MayaKaczorowski?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)talks about the new world of remote systems access, zero-config VPNs, and why everyone loves using Tailscale.
* [**Apple @ Work Podcast: Tailscale rethinks how VPN and SSH work for remote teams — 9to5Mac**](https://9to5mac.com/2022/08/02/tailscale/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
[Brad Fitzpatrick](https://twitter.com/bradfitz?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)from Tailscale joins the show to talk about creating a better VPN solution, the new SSH tool, and how the company got started.
### What’s new and improved
You can now use[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)to access tagged nodes that are shared with you.
On-demand access for your Tailscale resources with our new partners: Now you can limit access to the resources your team needs when they need them:
* [On-demand access to your Tailscale resources with Indent](https://tailscale.com/blog/indent/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
* [On-demand access to your Tailscale resources with ConductorOne](https://tailscale.com/blog/conductorone/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
* [On-demand access to your Tailscale resources with Sym](https://tailscale.com/blog/sym/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
* [On-demand access to your Tailscale resources with Opal](https://tailscale.com/blog/opal/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
* [**Ephemeral nodes… now more ephemeral!**](https://tailscale.com/blog/ephemeral-logout/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
[Maisem Ali](https://twitter.com/maisem_ali?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)explains you can run `tailscale logout` on an ephemeral node to remove it from your network immediately.
* [**Manage your Tailscale resources with Terraform**](https://tailscale.com/blog/terraform/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
Tailscale is adopting the[Tailscale Terraform provider](https://registry.terraform.io/providers/tailscale/tailscale/latest?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)and taking responsibility for ongoing support and development.The community, notably[David Bond](https://github.com/davidsbond?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io), originally created the Tailscale Terraform provider, and we are very thankful for the work they’ve done to provide this valuable tool to others.
### Tailscale learning library
We are building a learning library to help folks at any stage in their career. If you have a topic you’d like to see covered, send us a tweet @Tailscale.
* [How to generate SSH keys](https://tailscale.com/learn/generate-ssh-keys/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
* [How to SSH into Docker containers](https://tailscale.com/learn/ssh-into-docker-container/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
* [Understanding software-defined networking](https://tailscale.com/learn/software-defined-networking/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
* [How to provide secure remote access to Grafana dashboards](https://tailscale.com/learn/remote-access-to-grafana-dashboards/?utm_content=August+Newsletter&amp;utm_medium=email_action&amp;utm_source=customer.io)
That’s all for now. Stay well!
Share
Author
Laura Franzese
Author
Laura Franzese
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