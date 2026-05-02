Legacy VPN to Tailscale Pre-Migration Guide
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Planning a smooth migration from a legacy VPN to Tailscale
Start planning a seamless, incremental deployment.
### Who this will help
This guide is for existing users of traditional VPN services planning to migrate to Tailscale as their VPN or overall networking solution.
### What will be covered
This will explore what constitutes a migration, common problems you have to consider, and how Tailscale alleviates those issues.
### What you will get from this
You'll begin scoping a migration on an incremental basis, from your first installation to ramping up into Tailscale's deeper feature set.
A migration from a traditional VPN (Virtual Private Network) to Tailscale means moving away from a centralized server setup to a mesh overlay network. Being a mesh VPN without a central gateway server, and instead using encrypted peer-to-peer connections through the open-source WireGuard protocol, Tailscale is uniquely equipped for incremental deployments and migrations.
This means a lot of things you’re worried about in a migration won’t be an issue. In thinking and planning for such a migration, we’ll talk about:
1. What constitutes a migration and deployment with Tailscale
2. Start the thinking and self-assessment of your specific problems
3. Walk through common problems you won’t have to worry about with Tailscale
4. Planning to escalate the adoption of Tailscale’s features in your incremental migration and deployment
Although this may be a shift in how you think about networking, the actual migration can be done in a controlled, incremental manner. If you want to dive deeper into what Tailscale is all about, you can first [read about how Tailscale works](https://tailscale.com/blog/how-tailscale-works) and [why you should choose Tailscale](https://tailscale.com/why-tailscale).
## [Migration and deployment can be as basic as installing Tailscale on two machines](#migration-and-deployment-can-be-as-basic-as-installing-tailscale-on-two-machines)
Yes, every deployment needs a plan and a laundry list of considerations, but with Tailscale you can win with deployments early and often. The most basic deployment of Tailscale involves installing the node software onto two devices and logging in with the same user account or auth domain—you have implemented Tailscale.
Tailscale deployments and migrations aim to remove complications, instead opting for easy and incremental rollouts. Incremental deployment is born from Tailscale’s fundamental design—it’s not an extra layer of administration required on your part, but a natural user pattern given how Tailscale just works.
When you’re ready to add more devices, just repeat the process of installing Tailscale and logging in. When those devices grow in number and need more fine-tuned management, start using Tailscale’s granular access controls. And once you start recognizing the benefits of adding on optimizations, integrations, and automation, your deployment can take that next step.
Tailscale lets you move at your organization’s ideal pace, and successfully deploy often—installing Tailscale on two devices is as successful a milestone for productivity as doing a bespoke rollout integrated with Terraform.
Have a plan, but don’t worry about executing it all at once.
## [What do you actually need?](#what-do-you-actually-need)
So what exactly is the perfect VPN solution for you? A useful answer requires some self-assessment.
* Do you need a scalable solution that supports a growing number of users?
* Do you want to move away from closed, proprietary protocols?
* Do you need granular access control tools to control who gets access to what?
* Is security a big concern for you? Has it proven to be difficult with other solutions?
* Do you need high performance, reliability, and low latency?
* Do you need a modern solution for a modern workforce?
Then, follow up with more fine-tuned questions. If you need to support a large number of users, how many is that? If you have a protocol preference, which one is it? If you have security concerns, what are the exact levels of compliance you need to achieve?
The questions on what you need are endless, but we think it’s more useful to start from the other side—with Tailscale there are a lot of things you *don’t *need to worry about, to help simplify your decision-making.
## [What you won’t have to worry about](#what-you-wont-have-to-worry-about)
Let’s start by removing baggage you may be carrying—common assumptions about what makes migrations and deployments difficult with traditional VPNs are often a non-issue with Tailscale.
Most guides start with a list of prerequisites: everything you must worry about before starting. Instead here’s our *non-prerequisites* list of everything you *don’t* need to worry about. If these sound good to you, it’s probably an indicator that you’re experiencing some significant pain points in your existing setup, and it’s good that you’re considering migrating to Tailscale.
### [Existing hardware and network infrastructure](#existing-hardware-and-network-infrastructure)
In terms of required hardware, there is none! You don’t have to worry about going out to buy a network switch for your migration or setting up a traditional centralized gateway server like with OpenVPN. Tailscale uses a mesh network that overlays your existing network infrastructure, meaning direct peer-to-peer connections.
Your migration will not need a step where you migrate all your systems onto a specific OS or network architecture. Tailscale is infrastructure agnostic, and this includes playing nice with whatever network architecture you have, and whatever OS is running on all the devices on your network. This also makes your Tailscale setup future-proof—whatever underlying network architecture changes you want to make does not matter to Tailscale, it just works.
If you’re looking to migrate existing hardware that won’t be able to have the Tailscale client installed on it, this also won’t be a problem. Subnet routers were made specifically to address this problem and setup will be straightforward, whether it’s a printer or other legacy device.
### [Installation and configuration](#installation-and-configuration)
The most basic installation of Tailscale involves downloading the client, running the client, and logging in. There is no complexity or configuration beyond that for anyone just wanting something up and running.
However, in a migration, often there’s a need to deploy programmatically to automate things even further. Tailscale accounts for this with integrations into infrastructure as code tools like Terraform or Pulumi. There are also options to deploy with MDM solutions like Jamf Pro.
When planning a migration, consider your existing tools and ecosystem and what you want to integrate into. It’s up to you whether you want to do it all upfront, or incrementally after doing the basic Tailscale installation path to get things started quickly.
### [Authentication and identity](#authentication-and-identity)
Tailscale offers SSO and MFA through integrations with 23 providers. If you are already using an identity provider, chances are you don’t have to worry about setting up a complicated authentication system.
Migrating from a traditional VPN often involves moving from authentication solutions like SAML, LDAP, MFA, or traditional username and password setups, to authentication on Tailscale through options like Google SSO. Functionally this is a reduction of complexity most of the time, which means a simple migration effort—users can download the Tailscale client, log in with SSO, and have a complete setup. Any previous nightmares you’ve had standing up an authentication system are not a concern here.
And this benefit also comes in batches, not just individual users. Configuring SCIM and integrations with these identity providers allows user and group provisioning, automating user onboarding and offboarding. New employees automatically get access just by being added to certain groups, and those same permissions can be automatically removed when someone leaves the company.
Not having to build and maintain custom workflows for this streamlines your migration process, and makes it more secure without error-prone manual steps.
### [Firewalls](#firewalls)
It’s natural to start thinking about all the firewall settings and all the ports you have to open and close when approaching a networking project. In this migration, you can just leave your existing networking infrastructure as is.
[Tailscale’s NAT traversal](https://tailscale.com/blog/how-nat-traversal-works) lets everything just connect. No tinkering or migrating over to a new configuration.
### [Security, compliance, and privacy](#security-compliance-and-privacy)
For any deployment, there’s a risk of veering towards “make it work first, then make it secure later”. Tailscale staves off this pattern by always being secure by default. WireGuard is opinionated and can’t be user-configured, guaranteeing a compliant level of security. Every connection is encrypted end-to-end and the data is never seen along the path, even by Tailscale.
This means you won’t need an incremental step later in migration to “turn on the security”—with Tailscale you’re secure from the very first installation.
A migration to Tailscale is less about bringing things over from the current traditional VPN, and more about adopting new features to bolster security. Tailscale SSH makes the management of keys automatic and more secure. Configuration audit logs, log streaming, and their integrations are all unlocked options when you migrate to Tailscale.
## [Implementing best practices and incremental rollout](#implementing-best-practices-and-incremental-rollout)
Now that some common worries about migration are alleviated, let's dive further into what you get from migrating to Tailscale, and why you should consider slowly adding these in throughout your incremental migration.
### [Using Access Control Lists (ACLs) for granular control](#using-access-control-lists-acls-for-granular-control)
Most likely, you’ll quickly go from “just wanting to get everything onto the new network” to “controlling who has access to what”. Migrating from a legacy VPN means you’re familiar with access control rules that give access to certain users and groups depending on their IP addresses and subnets.
In planning for your migration to Tailscale, you’ll be familiarizing yourself with ACLs for granular access control. ACLs represent the traditional network layer approach to managing access. Not only does it handle the usual user groups, roles, and IP sets, but ACLs also come with a tagging system and support for identity and device postures. Tags in ACLs allow management of devices based on purpose, instead of owner.
Tailscale also uses a grant system that combines the network and application layers’ capabilities into a shared syntax. This gives enhanced flexibility and fine-grained control over resource access.
What you need for granular access control already exists in Tailscale, it’s just a matter of mapping over your existing understanding from the current VPN's perspective.
### [Bolstering security](#bolstering-security)
Tailscale understands [the shared responsibility we have in maintaining security best practices](https://tailscale.com/kb/1212/shared-responsibility). While a lot is done out of the box just by adopting WireGuard, there are multiple steps to [further harden your security](https://tailscale.com/kb/1196/security-hardening).
The use of ACLs mentioned in the previous section is actually an excellent first step in this. ACLs are deny-by-default, directional, locally enforced, and don't affect local network traffic.
Another example is setting default [source posture rules](https://tailscale.com/kb/1288/device-posture#default-source-posture) to require minimum operating system and Tailscale client versions, ensuring the latest security measures on the back end are always up to date.
### [Integrations](#integrations)
[Tailscale has a lot of integrations](https://tailscale.com/integrations), and most likely in the beginning a migration starts with only an identity provider for authentication. Migrating from a traditional VPN means bringing over the tool integrations you have, but luckily Tailscale has plenty:
* 23 Identity Providers like Okta, Google, Github
* 8 Cloud Providers like AWS, GCP, Azure
* 7 IaaC providers like Terraform, Pulumi, Ansible
* 6 Device Posture Integrations like SentinelOne, JamfPro, Kandji
* 6 Integrations for Log Streaming like Cribl, Datadog, Axiom
* 8 integrations for firewalls like Cisco, Fortinet, Palo Alto
* 6 integrations for mobile device management like Microsoft Intune, Jamf, Kandji
Looking ahead to make sure that the integrations you need are present is recommended, though we’re confident that we have integrations with almost anything you need.
### [Providing readiness and support](#providing-readiness-and-support)
It’s not enough to just roll something out, you’ll need to be ready to provide support to your users. Tailscale helps you provide internal support—provide documentation to your users on how to get internal support within your organization. See [end-user client configuration](https://tailscale.com/kb/1344/deployment-checklist#end-user-client-configuration) for ways to customize the Tailscale client to help with this.
You should also document how and when to [contact Tailscale support](https://tailscale.com/contact/support) in internal documentation and provide for relevant parties like the IT help desk or production operations teams. Include instructions to ask end-users to generate a [bug report](https://tailscale.com/bugreport) when reporting issues internally and share the bug report identifier when contacting Tailscale support.
Additionally, we highly recommend administrators the Tailscale [newsletter](https://info.tailscale.com/tailscale-newsletter-sign-up) and [blog](https://tailscale.com/blog#blog-newsletter) for general news, the Tailscale [changelog](https://tailscale.com/changelog) RSS feed to stay up-to-date on client and service changes, and the Tailscale [security bulletins](https://tailscale.com/security-bulletins) RSS feed for up-to-date security notifications.
### [Using every part of Tailscale](#using-every-part-of-tailscale)
Tailscale does so much more than provide a traditional VPN solution. Once you’ve migrated over from a legacy VPN, you might realize that Tailscale can be the one-stop shop for so many more networking problems you’re trying to solve.
If you’re interested in exploring other use cases of Tailscale, check out:
* [Zero-trust networking](https://tailscale.com/use-cases/zero-trust-networking): Authorize, authenticate, and verify every interaction on your network
* [Multi-cloud networking](https://tailscale.com/use-cases/multi-cloud-networking): Uniform connectivity across any cloud provider without toggling between VPNs
* [AI workloads](https://tailscale.com/use-cases/ai): Private networking to connect users, LLMs, and data across any infrastructure
* [Kubernetes operator](https://tailscale.com/use-cases/kubernetes): Secure remote access for ingress/egress, cross-cluster peering, and the Kubernetes control plane
* [IoT & edge devices](https://tailscale.com/use-cases/iot): Reliably connect to thousands of devices in any environment
Best of all, this all rolls into your incremental migration and deployment. You don’t have to do it all at once—but Tailscale is always ready when you’re ready.
## Trusted by 30,000+ companies like these
## Pricing that works for everyone
Personal
For individuals who want to securely connect personal devices, for free.
$0per active user/month
[
Get started for free
](https://login.tailscale.com/start?next_url=/admin/machines)
Starter
For small teams seeking an easy-to-use and quick-to-deploy secure network access solution.
$6per active user/month
[
Get started
](https://login.tailscale.com/start?next_url=/admin/welcome/checkout/starter)
Premium
For growing teams seeking advanced service/resource-level networking and identity-aware access controls.
$18per active user/month
[
Get started
](https://login.tailscale.com/start?next_url=/admin/welcome/checkout/premium)
Enterprise
For organizations seeking advanced user and posture management, robust compliance, and dedicated support.
Custom
[
Contact Sales
](/contact/sales)