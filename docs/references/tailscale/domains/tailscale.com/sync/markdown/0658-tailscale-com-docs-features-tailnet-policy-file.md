Tailnet policy file · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailnet policy file
Last validated: May 21, 2025
The tailnet policy file is a centralized [human JSON (HuJSON)](https://github.com/tailscale/hujson) configuration file that stores parameters, policies, and settings for your Tailscale network (known as a tailnet). [Owners, Admins, and Network admins](/docs/reference/user-roles) can manage your tailnet policy file from the Tailscale admin console. You can also manage the tailnet policy file with [GitOps](/docs/gitops) using GitHub, GitLab, or Bitbucket.
The tailnet policy file is organized into multiple top-level [sections](#sections), each offering different functionality. You can use the various sections of the tailnet policy file to:
* Define named groupings of users, devices, and network segments with [tags](/docs/features/tags), [groups](/docs/reference/targets-and-selectors#groups), and [IP sets](/docs/features/tailnet-policy-file/ip-sets).
* Define access control policies at the [network layer](/docs/concepts/tailscale-osi#network-layer) using [ACLs](/docs/features/access-control/acls).
* Define access control policies at the [network layer](/docs/concepts/tailscale-osi#network-layer) and [application layer](/docs/concepts/tailscale-osi#application-layer) using [grants](/docs/features/access-control/grants).
* Assign aliases to IP addresses and [subnets](/docs/features/subnet-routers) (using the `hosts` section).
* Define [device posture](/docs/features/device-posture) rules.
* Specify who can use [Tailscale SSH](/docs/features/tailscale-ssh).
* Specify who can use which [tags](/docs/features/tags) to authenticate devices.
* Specify who can bypass the approval process to advertise [subnet routers](/docs/features/subnet-routers) and [exit nodes](/docs/features/exit-nodes).
* Apply additional attributes called [node attributes](/docs/reference/syntax/policy-file#node-attributes) to devices and users.
* Write tests to make assertions about access policies ([ACLs](/docs/features/access-control/acls) and [Tailscale SSH](/docs/features/tailscale-ssh)) that should not change.
* Define tailnet-wide policy options (such as disabling IPv4).
Using the different sections of the tailnet policy file in unison lets you manage your tailnet in a modular and fine-grained manner. For example, you can define a custom group of users, then create an access control policy to specify how the users in that group can traverse the resources in your tailnet.
## [Sections](#sections)
The following table provides an overview of each top-level section of the tailnet policy file.
|Section|Name|What it's for|Resources|
|`acls`|Access control lists (ACLs)|Create network-level access control policies.|[Syntax reference →](/docs/reference/syntax/policy-file#access-rules)|
|`autoApprovers`|Auto approvers|Specify who can bypass the approval process to advertise [subnet routers](/docs/features/subnet-routers), and [exit nodes](/docs/features/exit-nodes), and [app connectors](/docs/features/app-connectors).|[Syntax reference →](/docs/reference/syntax/policy-file#auto-approvers)|
|`grants`|Grants|Define network-level and application-level access control policies.|[Syntax reference →](/docs/reference/syntax/policy-file#grants)|
|`groups`|Groups|Define named groups of users, devices, and subnets to target in access control policies and other definitions.|[Syntax reference →](/docs/reference/syntax/policy-file#groups)|
|`hosts`|Hosts|Define named aliases for devices and subnets.|[Syntax reference →](/docs/reference/syntax/policy-file#hosts)|
|`ipsets`|IP sets|Define [named network segments](/docs/features/tailnet-policy-file/ip-sets) to target in access control policies and other definitions.|[Syntax reference →](/docs/reference/syntax/policy-file#ip-sets)|
|`nodeAttr`|Node attributes|Apply additional attributes to devices and users.|[Syntax reference →](/docs/reference/syntax/policy-file#node-attributes)|
|`postures`|Device posture policies|Define [device posture](/docs/features/device-posture) rules to target in access control policies.|[Syntax reference →](/docs/reference/syntax/policy-file#postures)|
|`ssh`|Tailscale SSH|Specify who can use [Tailscale SSH](/docs/features/tailscale-ssh).|[Syntax reference →](/docs/reference/syntax/policy-file#ssh)|
|`sshTests`|Tailscale SSH tests|Write tests to make assertions about [Tailscale SSH](/docs/features/tailscale-ssh) that should not change.|[Syntax reference →](/docs/reference/syntax/policy-file#ssh-tests)|
|`tagOwners`|Tag owners|Define who can assign which [tags](/docs/features/tags) to devices in your tailnet.|[Syntax reference →](/docs/reference/syntax/policy-file#tag-owners)|
|`tests`|Access control tests|Write tests to make assertions about access policies ([ACLs](/docs/features/access-control/acls) and network-level [grants](/docs/features/access-control/grants)) that should not change.|[Syntax reference →](/docs/reference/syntax/policy-file#tests)|
There's also additional sections for [network policy options](/docs/reference/syntax/policy-file#network-policy-options), such as disabling IPv4 and customizing the [DERP](/docs/reference/derp-servers) map. In most cases, these settings are unnecessary.
|Section|What it's for|Resources|
|`derpMap`|Customize the DERP servers that a tailnet uses.|[Syntax reference →](/docs/reference/syntax/policy-file#derpmap)|
|`disableIPv4`|Disable using IPv4 in a tailnet.|[Syntax reference →](/docs/reference/syntax/policy-file#disableipv4)|
|`OneCGNATRoute`|Modify the routes the Tailscale clients generate.|[Syntax reference →](/docs/reference/syntax/policy-file#onecgnatroute)|
|`randomizeClientPort`|Control whether devices prefer a random port number or the default `41641` for WireGuard traffic.|[Syntax reference →](/docs/reference/syntax/policy-file#randomizeclientport)|
On this page
* [Sections](#sections)
Scroll to top