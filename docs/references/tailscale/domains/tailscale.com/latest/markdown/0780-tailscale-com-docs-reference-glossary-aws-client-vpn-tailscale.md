AWS Client VPN and Tailscale terminology mapping · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# AWS Client VPN and Tailscale terminology mapping
Last validated: Oct 8, 2025
When migrating from the AWS Client VPN ecosystem to Tailscale, the following relates AWS Client VPN terminology and concepts to the closest match in Tailscale.
## [AWS Client VPN client: Tailscale client](#aws-client-vpn-client-tailscale-client)
In AWS Client VPN terms, the client refers to the user who connects to an endpoint using software installed on their device. That software leverages the OpenVPN protocol and, along with a configuration file, is a requirement to establish a VPN session. The Tailscale equivalent is the Tailscale [client](/docs/reference/glossary#client).
## [AWS VPC console: Tailscale admin console](#aws-vpc-console-tailscale-admin-console)
The AWS VPC console is the administrative interface where you can create and modify endpoints. Tailscale's equivalent is the Tailscale [admin console](/docs/reference/glossary#admin-console).
## [AWS Client VPN endpoint: No Tailscale equivalent required](#aws-client-vpn-endpoint-no-tailscale-equivalent-required)
An AWS Client VPN endpoint is the main resource that you create and configure through the AWS VPC Console to enable and manage client VPN sessions. All remote-user VPN tunnels end at an endpoint. Tailscale does not require the explicit creation of endpoints or the management of certificates.
## [AWS Client VPN target network: No Tailscale equivalent required](#aws-client-vpn-target-network-no-tailscale-equivalent-required)
An AWS Client VPN target network is equivalent to a subnet from a VPC. These are networks you associate with a Client VPN endpoint. Associating a subnet with an endpoint is what enables you to establish VPN sessions. Much like AWS Client VPN endpoints, Tailscale automatically handles network associations.
## [AWS Client VPN route table: Tailscale control plane](#aws-client-vpn-route-table-tailscale-control-plane)
The AWS Client VPN route table exists on the endpoint and lists the destination networks that clients can access. Each entry tells the endpoint where to send traffic. This is the control plane. Tailscale's [control plane](/docs/concepts/control-data-planes#control-plane) exists as a [coordination server](/docs/concepts/control-data-planes#coordination-server), decoupled from the [data plane](/docs/concepts/control-data-planes#data-plane), and helps peers share public keys and addresses to establish direct connections.
## [AWS Client VPN authorization rules: Tailscale grants and ACLs](#aws-client-vpn-authorization-rules-tailscale-grants-and-acls)
AWS Client VPN authorization rules are network access restrictions on users. They let you configure identity provider groups to give that group access to a network, specifically a VPC Classless Inter-Domain Routing (CIDR) value. By default, there are no authorization rules, and you must add rules to enable access. Tailscale is also deny-by-default, and has robust access control in the form of grants and access control lists (ACLs). You manage grants and ACLs in the [tailnet policy file](/docs/features/tailnet-policy-file).
Tailscale now secures access to resources using [grants](/docs/features/access-control/grants), a next-generation access control policy syntax. Grants provide [all original ACL functionality plus additional capabilities](/docs/reference/grants-vs-acls).
ACLs will continue to work **indefinitely**; Tailscale will not remove support for this first-generation syntax from the product. However, Tailscale recommends [migrating to grants](/docs/reference/migrate-acls-grants) and using grants for all new tailnet policy file configurations because ACLs will not receive any new features.
## [AWS Client VPN client CIDR range: No Tailscale equivalent required](#aws-client-vpn-client-cidr-range-no-tailscale-equivalent-required)
The AWS Client VPN client CIDR range is the pool (such as `10.2.0.0/16`) from which each connected client receives a unique VPN IP address. Tailscale automates CIDR handling, like CIDR overlaps, removing the need for explicit CIDR management.
## [AWS CLI: Tailscale CLI](#aws-cli-tailscale-cli)
The AWS CLI is the command-line interface from which you can manage AWS Client VPN. The Tailscale equivalent is the [Tailscale CLI](/docs/reference/tailscale-cli).
## [Self-service portal: No Tailscale equivalent required](#self-service-portal-no-tailscale-equivalent-required)
The AWS Client VPN self-service portal is an optional web page that administrators can enable to let their users download the latest desktop software and configuration file. Tailscale lets users [download the Tailscale client](/download) without having to go through portal deployment hoops.
## [AWS Client VPN devices: Tailscale devices, nodes, peers](#aws-client-vpn-devices-tailscale-devices-nodes-peers)
While the definition of devices is identical between AWS Client VPN and Tailscale, Tailscale adds more related terminology due to being a mesh network. Every Tailscale device is also a node in the mesh network, and nodes within the network are peers to one another.
On this page
* [AWS Client VPN client: Tailscale client](#aws-client-vpn-client-tailscale-client)
* [AWS VPC console: Tailscale admin console](#aws-vpc-console-tailscale-admin-console)
* [AWS Client VPN endpoint: No Tailscale equivalent required](#aws-client-vpn-endpoint-no-tailscale-equivalent-required)
* [AWS Client VPN target network: No Tailscale equivalent required](#aws-client-vpn-target-network-no-tailscale-equivalent-required)
* [AWS Client VPN route table: Tailscale control plane](#aws-client-vpn-route-table-tailscale-control-plane)
* [AWS Client VPN authorization rules: Tailscale grants and ACLs](#aws-client-vpn-authorization-rules-tailscale-grants-and-acls)
* [AWS Client VPN client CIDR range: No Tailscale equivalent required](#aws-client-vpn-client-cidr-range-no-tailscale-equivalent-required)
* [AWS CLI: Tailscale CLI](#aws-cli-tailscale-cli)
* [Self-service portal: No Tailscale equivalent required](#self-service-portal-no-tailscale-equivalent-required)
* [AWS Client VPN devices: Tailscale devices, nodes, peers](#aws-client-vpn-devices-tailscale-devices-nodes-peers)
Scroll to top