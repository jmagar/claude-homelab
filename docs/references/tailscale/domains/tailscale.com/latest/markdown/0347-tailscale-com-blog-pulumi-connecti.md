Tailscale for DevOps: Connect to any subnet in your tailnet with Connecti (by Pulumi)
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 16, 2022
# Tailscale for DevOps: Connect to any subnet in your tailnet with Connecti (by Pulumi)
When setting up cloud infrastructure for your team, it often makes sense to provision sensitive services in private subnets. However, this usually means that those services are not easily accessible from your personal devices or CI/CD infrastructure. Tailscale already makes it possible to access those services by adding a private [subnet router](/kb/1019/subnets/) to your tailnet. But what happens if you need to quickly access something in a private subnet and then immediately terminate that connection?
Most organizations already have existing infrastructure, so the need to access or debug something in a private subnet is a relatively frequent problem. That’s why Pulumi has worked hard to create a way to quickly provision ephemeral VPN connections that you can spin up and tear down quickly. [Connecti](https://connecti.cloud/) is a command line tool written in the Go programming language using Pulumi’s automation API, that allows you to declaratively provision Tailscale subnet routers in seconds without writing a single line of infrastructure code.
[Pulumi](https://www.pulumi.com/) is an open source infrastructure as code platform for creating, deploying, and managing cloud infrastructure. Pulumi works with both traditional infrastructures like VMs, networks, and databases, in addition to modern architectures such as containers, Kubernetes clusters, and serverless functions.
Continue reading to learn more about Tailscale and Connecti from Pulumi software engineer and Connecti creator [Lee Briggs](https://www.pulumi.com/blog/author/lee-briggs/).
As with most things in life, “right” and “wrong” in cloud engineering terms exist on a continuum rather than as binary concepts. There are “best practices,” “what’s right for your org,” and “this is a bad idea but we’re in a time crunch.”
Something, however, that most people agree on is that exposing sensitive services to the public internet unnecessarily is a *bad idea*. Doing so can create challenges in the isolated network of your cloud provider and raise questions like, “How do I create tables in this private database?” and “How do I get into that random server to see why my service is failing?” These are both common questions in the Pulumi community that are ultimately *networking* problems, rather than *infrastructure* problems.
You can see this issue in practice with this Pulumi YAML code that provisions an AWS VPC and an AWS RDS database in private subnets:
```
`name: vpc\_rds
description: A minimal Pulumi YAML program
runtime: yaml
config:
vpcNetworkCidr:
type: string
default: 10.0.0.0/16
variables: {}
resources:
# Create a VPC for the RDS instance
vpc:
type: awsx:ec2:Vpc
properties:
enableDnsHostnames: true
cidrBlock: ${vpcNetworkCidr}
# generate a random password
password:
type: random:RandomPassword
properties:
length: 16
special: true
overrideSpecial: \_%@
# Create a subnet group for private subnets
subnetgroup:
type: aws:rds:SubnetGroup
properties:
subnetIds: ${vpc.privateSubnetIds}
# provision an RDS database
db:
type: aws:rds:Instance
properties:
instanceClass: db.t3.micro
allocatedStorage: 20
engine: "mysql"
username: "example"
password: ${password.result}
dbSubnetGroupName: ${subnetgroup.name}
skipFinalSnapshot: true
outputs:
dbAddress: ${db.endpoint}
vpcId: ${vpc.vpcId}
`
```
To access this database, or any other infrastructure that isn’t publically accessible, you need a way to connect to that private (not routed to the global internet) network. There are a few options to work around this: One of the most common ways is to provision a bastion host that has connectivity to both the public internet and that private network. This will let you jump through that host to your private network. You can also skip needing to use that bastion at all by setting up a virtual private network (VPN) and adding your machine to that network, which makes the bastion host unnecessary.
As a fan of Tailscale, I often find myself reaching for it in these circumstances. Tailscale’s [subnet router](/kb/1019/subnets/) feature gives you the ability to connect to all of the servers in your VPC as though they were on the same network as you. No custom TLS certificate authorities or arcane knowledge in tools such as OpenVPN or StrongSwan is required. It just works!
To make it easier to connect to the cloud providers that I use every day, supporting Pulumi customers and community members, I created a Pulumi Package that abstracts almost all of the complexity of setting this up away from end users. To revisit the private database example earlier, simply including the `pulumi-tailscalebastion` package automatically connects me to my cloud provider’s private network and allows Pulumi to provision infrastructure quickly and easily.
```
`name: vpc\_rds
description: A minimal Pulumi YAML program
runtime: yaml
config:
vpcNetworkCidr:
type: string
default: 10.0.0.0/16
variables: {}
resources:
# Create a VPC for the RDS instance
vpc:
type: awsx:ec2:Vpc
properties:
enableDnsHostnames: true
cidrBlock: ${vpcNetworkCidr}
# generate a random password
password:
type: random:RandomPassword
properties:
length: 16
special: true
overrideSpecial: \_%@
# Create a subnet group for private subnets
subnetgroup:
type: aws:rds:SubnetGroup
properties:
subnetIds: ${vpc.privateSubnetIds}
# add a bastion host so we can connect to the private address
bastion:
type: "tailscale-bastion:aws:Bastion"
properties:
vpcId: ${vpc.vpcId}
subnetIds: ${vpc.privateSubnetIds}
route: "10.0.0.0/16"
region: "us-west-2"
# provision an RDS database
db:
type: aws:rds:Instance
properties:
instanceClass: db.t3.micro
allocatedStorage: 20
engine: "mysql"
username: "example"
password: ${password.result}
dbSubnetGroupName: ${subnetgroup.name}
skipFinalSnapshot: true
outputs:
dbAddress: ${db.endpoint}
vpcId: ${vpc.vpcId}
`
```
This is great if you’re using [Pulumi](https://www.pulumi.com/) as your infrastructure as code solution (and if you’re not, you should be!) but what if you have existing infrastructure and need to debug something in a private network? What if you just want to quickly jump into your remote database to check why your application isn’t working, or verify why some user data hasn’t worked correctly from some logs?
This is a problem I run into on a regular basis. It comes up so often, that I wanted to create a way to quickly provision ephemeral VPN connections that I can spin up and tear down quickly.
[Connecti](https://connecti.cloud/) is a tool which does just that. Connecti is a command line tool written in the Go programming language using Pulumi’s automation API, that allows you to declaratively provision Tailscale subnet routers in seconds without writing a single line of infrastructure code.
Simply install connecti, install Pulumi and pass your credentials, and you can run a single command to provision a resilient subnet router that you can quickly tear down once you’re finished.
Connecti supports AWS, Azure, Google Cloud and Kubernetes, with plans to support other cloud providers like Digital Ocean and Scaleway in the future.
Here’s an example of using connecti to create an ephemeral VPN to an AWS VPC.
```
`connecti connect aws --subnet-ids subnet-034f1681dafc333f1 --subnet-ids subnet-09551c6c7c56bf98f --subnet-ids subnet-011348d6fbe4ef4be --routes 172.20.0.0/24
`
```
And here’s an example of connecting to a Kubernetes service network, allowing me to debug private services without needing to use `kubectl proxy` or a service of type load balancer.
```
`connecti connect kubernetes --routes 10.100.0.0/16
`
```
Destroying connections is as easy as running “disconnect” to remove the resources — Pulumi’s declarative engine removes the pain of keeping track of provisioned resources, allowing connecti to do what it needs to in just a couple of hundreds of lines of Go code.
Connecti works great with either Pulumi’s self-managed backends (which is usually an object store in your cloud provider) but if you leverage Pulumi’s free forever Individual tier in the Pulumi console, you can get full audit logs and historical records of every connecti bastion you ever create. Connecti will even print a handy link so you can follow along with its progress!
Connecti is available now for Windows, Linux and OS X. If you ever find yourself thinking “I need access to that database!”, Connecti is a quick, free solution you can reach for. We look forward to you giving it a try!
Join our upcoming workshop to [learn how to build virtual networks with Tailscale and Pulumi](https://www.pulumi.com/resources/building-virtual-networks-with-pulumi-and-tailscale/)
Share
Author
Jeff Spencer
Author
Jeff Spencer
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