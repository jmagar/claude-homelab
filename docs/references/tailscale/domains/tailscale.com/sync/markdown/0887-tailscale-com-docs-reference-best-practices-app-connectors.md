Best practices for using app connectors · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Best practices for using app connectors
Last validated: Dec 4, 2025
App connectors are available for [all plans](/pricing).
To ensure reliable performance of your app connectors, we recommend several best practices. Approaches like preconfiguring settings and using deferred approvals can streamline setup and reduce potential disruptions. Understanding how traffic routes, especially in complex or multi-tenant environments can also help prevent issues related to performance and unintended access to your applications.
## [Configure apps for route discovery](#configure-apps-for-route-discovery)
You can optimize route discovery and efficiency for your app connectors using domain names, CNAME records, and wildcards.
### [Domains](#domains)
You can configure app connectors with a list of valid, fully qualified domain names (FQDNs). Tailscale routes DNS records like `A` for IPv4 addresses and `AAAA` for IPv6 addresses through app connectors.
App connectors automatically discover routes when you add a domain to their configuration. Without pre-configured routes, the app connector enters a learning period where it proxies DNS requests for configured domains from end-users. The app connector identifies routing records from these requests and advertises them as routes.
With [auto approval](/docs/reference/syntax/policy-file#autoapprovers) enabled, newly discovered routes are automatically accepted by the tailnet and instantly advertised to devices. If the tailnet uses [regional routing](/docs/how-to/set-up-high-availability), it sends traffic through an app connector in the same region. The learning period ends when the app connector discovers all routes. This typically completes quickly for smaller domains, but may take longer for large domain lists or domains with wildcards.
### [DNS lookups](#dns-lookups)
App connectors work by acting as the authoritative nameserver for the domains configured on an app. For example, when you configure an app for a domain (such as `\*.example.com`), it creates an invisible [split DNS](/docs/reference/dns-in-tailscale) entry. Tailscale sends any subsequent DNS lookups for `\*.example.com` to the appropriate app connectors. Each app connector performs the DNS lookup. If the lookup succeeds, it introduces a new subnet route for the resolved IP address before returning the response to the device that initiated the DNS lookup.
### [Port access for DNS discovery](#port-access-for-dns-discovery)
Client devices require access to the app connector tag for DNS discovery to function. The discovery mechanism uses the PeerAPI, which requires the app connector to be visible as a peer.
Grant minimal access, such as TCP or UDP on port `53` (`tcp:53` or `udp:53`), to enable peer discovery. Without this access, DNS lookups won't reach the app connector, and route discovery won't occur.
### [CNAME records](#cname-records)
App connectors support (CNAME) records by resolving them to their target addresses and automatically advertising the resulting routes. Since CNAMEs are DNS aliases (not routing records), the connector follows the chain and automatically advertise the resulting routes. A CNAME chain is a sequence of DNS records where each CNAME points to another domain name, until it resolves to an A record that indicates destination's IP address.
Use the [`dig`](https://en.wikipedia.org/wiki/Dig_(command)) command to verify CNAME configuration. The following code block contains an example of the expected output:
```
`.1. app.acme.com IN CNAME acme.backend.com
.2. acme.backend.com A ...
`
```
In the above example, the target of the `CNAME` chain, `acme.backend.com`, will route advertisements instead of `app.acme.com`.
If a web service uses geographic DNS load balancing, `CNAME` records might return different results in different locations. In these cases, it's best practice to deploy your app connectors in locations that closely mirror your organization's global footprint, and to leverage Tailscale's [regional routing](/docs/how-to/set-up-high-availability).
### [Wildcards](#wildcards)
Your app connector configuration can include wildcards (`\*`). Wildcard behavior is non-inclusive of the parent domain. For example:
* To include all of `acme.com` and its subdomains, use both `acme.com` and `\*.acme.com`.
* To only include the top-level domain, include `acme.com` and omit `\*.acme.com`.
* To include only subdomains, include `\*.acme.com` and omit `acme.com`.
## [Access control policy-driven route configuration](#access-control-policy-driven-route-configuration)
You can manually pre-configure routes as [access control policies](/docs/features/access-control) in your [tailnet policy file](/docs/features/tailnet-policy-file) inside the `nodeAttrs` top-level field, including domain configuration. For example:
```
`{
"target": ["\*"],
"app": {
"tailscale.com/app-connectors": [
{
"name": "example-app",
"connectors": ["tag:example-connector"],
"domains": ["example.com"],
"routes": ["192.0.2.0/24"],
}
],
},
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
The app connector devices in your tailnet automatically advertise these routes as soon as you apply the [access control policy](/docs/features/access-control) change to the tailnet policy file. App connectors for the application will immediately advertise these routes, and routes added using the access control policy section of the tailnet policy file are implicitly approved and do not require a sibling [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) entry.
This maintains strict routing control as part of the access control and approval process. In many instances, it also removes the need to use large `--advertise-routes` arguments for device configurations to avoid lengthy discovery periods with disruptive routing changes.
## [Route coalescing](#route-coalescing)
Routes populated by access control policy-driven route configuration coalesce or replace routes that are a sub-route of the new advertisement. For example, if the app connector previously discovered `192.0.2.5/32` and `192.0.2.67/32`, and you update the [access control policy](/docs/features/access-control) to include `192.0.2.0/24`, the connector replaces both `/32` routes with the single `192.0.2.0/24` entry.
## [Reduce reconfiguration during route discovery](#reduce-reconfiguration-during-route-discovery)
App connector route discovery can be disruptive in environments with strict firewall configurations. In these environments, new routes can disrupt route-aware software like Google Chrome.
App connectors immediately advertise all discovered IPs for a single domain resolution as a single route change containing all newly discovered routes for that domain resolution.
To reduce reconfiguration time during discovery, we recommend you choose one of the following strategies:
* Use [preconfigurations](#preconfiguration) and access control policy-driven route configurations as extensively as possible.
* Use [deferred approvals](#deferred-approvals). With deferred approvals, you delay enabling app firewalls until you discover the routes in an unapproved state, then approve them all in batches.
## [Configure apps with multi-tenant IP space](#configure-apps-with-multi-tenant-ip-space)
Some apps use content delivery networks (CDNs) or shared IP space to serve static assets. For example, `\*.static.example.com` or `\*.assets.acme.com`.
Publishing these routes to your app connectors might force unrelated traffic through the app connector, as CDNs often share IPs and can include traffic to other content on those same public IP addresses. As a side effect, this can cause high bandwidth through those connectors for sites unrelated to the target app. Therefore, we recommend serving CDN and multi-tenant content outside app connectors.
## [Connect large SaaS services](#connect-large-saas-services)
New route advertisements trigger client network modifications that might raise errors. For example, Google Chrome might report errors like `ERR\_NETWORK\_CHANGED`. You can reduce the frequency of these events using [deferred approvals](#deferred-approvals) or [preconfigurations](#preconfiguration).
### [Deferred approvals](#deferred-approvals)
The deferred approvals approach builds in a non-disruptive learning period for new app connectors. You can defer approvals by temporarily disabling route approval or using upstream IP firewalls.
Install app connectors separately to prevent overlapping [autoApprovers](/docs/reference/syntax/policy-file#autoapprovers). The app connectors receive DNS queries from the client fleet and configure advertised routes. But routes remain unapproved, and traffic maintains its regular pattern. Running in this state for a representative sample of business operations (such as a week) collects the bulk of affected routes. You can then transfer the routes to an `autoApprovers` clause.
Deferred approval blocks users from accessing an application until you approve the routes.
### [Preconfiguration](#preconfiguration)
You can preconfigure apps if you can't run apps in a non-disruptive learning period long enough to collect all the affected routes for the [deferred approvals](#deferred-approvals) approach. We recommend you configure routes when setting up app connectors and configure known subdomains when configuring applications.
Even in cases where deferred approval is possible, preconfiguration can reduce the learning phase.
#### [Routes](#routes)
Many services, such as GitHub and Okta, publish IP address lists that you can collect into `--advertise-routes` preferences for the app connectors. Preconfiguring routes optimizes them in the following ways:
* It reduces the routing table size and costs by using address ranges rather than single IP addresses.
* You can enable upstream WAF immediately because most service-used routes are configured at boot.
#### [Domains](#domains-1)
Many applications have wildcard domains that the app connector cannot pre-flight because it does not know all the subdomains it needs to resolve. If you know all the subdomains, you can explicitly add them alongside the wildcard domains to generate a list of preconfigured routes.
Tip: You can gather subdomains from browser histories, DNS server histories, and DNS logs.
#### [Automate preconfiguration](#automate-preconfiguration)
You can automate preconfiguration with a tool Tailscale offers called [connector-gen](https://github.com/tailscale/tailscale/tree/main/cmd/connector-gen). It provides a simple example of parsing some common providers and producing [tailnet policy file](/docs/features/tailnet-policy-file) snippets and [`--advertise-routes`](/docs/features/subnet-routers#connect-to-tailscale-as-a-subnet-router) flags that you can use to manually perform the preconfiguration of routes strategy.
To run the connector-gen tool:
```
` ./tool/go run ./cmd/connector-gen github
`
```
The example above produces snippets of JSON for the access control policy and an `--advertise-routes` flag.
#### [Automation with Terraform](#automation-with-terraform)
Using Terraform to manage your tailnet policy file will overwrite any manual changes made in the admin console during the next sync. Ensure that all app connector configurations are managed through Terraform to prevent loss of settings.
Terraform has an HTTP data provider that you can use to consume IP address lists from upstream providers. You can then use the IP address lists to preconfigure routes when you deploy an app connector.
The following example shows preconfigurations for services like Okta, GitHub, and Amazon Web Services (AWS).
```
`data "http" "okta\_ip\_range\_json" {
url = "https://s3.amazonaws.com/okta-ip-ranges/ip\_ranges.json"
}
locals {
okta\_ip\_range\_data = jsondecode(data.http.okta\_ip\_range\_json.response\_body)
okta\_cell\_ranges = [for key in keys(local.okta\_ip\_range\_data) : local.okta\_ip\_range\_data["${key}"].ip\_ranges if key == "us\_cell\_1"]
okta\_ip\_ranges = sort(distinct(flatten(local.okta\_cell\_ranges)))
}
data "http", "github\_meta\_json" {
url = "https://api.github.com/meta"
}
locals {
github\_meta = jsondecode(data.http.github\_meta\_json.response\_body)
github\_ips = concat(local.github\_meta.hooks, local.github\_meta.web, local.github\_meta.api, local.github\_meta.git, local.github\_meta.github\_enterprise\_importer, local.github.meta.packages, local.github\_meta.pages, local.github\_meta.importer, local.github\_meta.actions, local.github\_meta.dependabot)
github\_domains = concat(local.github\_meta.domains.website, local.github\_meta.domains.codespaces, local.github\_meta.domains.copilot, local.github\_meta.domains.packages, local.github\_meta.domains.actions)
}
data "http", "aws\_ip\_ranges\_json" {
url = "https://ip-ranges.amazonaws.com/ip-ranges.json"
}
locals {
aws\_ip\_range\_data = jsondecode(data.http.aws\_ip\_ranges\_json.response\_body)
aws\_ip\_ranges = sort(distinct(concat([for prefix in local.aws\_ip\_range\_data.prefixes : prefix.ip\_prefix], [for prefix in local.aws\_ip\_range\_data.ipv6\_prefixes : prefix.ipv6\_prefix])))
}
locals {
all\_ip\_ranges = conact(local.okta\_ip\_ranges, local.github\_ips, local.aws\_ip\_ranges)
}
`
```
On this page
* [Configure apps for route discovery](#configure-apps-for-route-discovery)
* [Domains](#domains)
* [DNS lookups](#dns-lookups)
* [Port access for DNS discovery](#port-access-for-dns-discovery)
* [CNAME records](#cname-records)
* [Wildcards](#wildcards)
* [Access control policy-driven route configuration](#access-control-policy-driven-route-configuration)
* [Route coalescing](#route-coalescing)
* [Reduce reconfiguration during route discovery](#reduce-reconfiguration-during-route-discovery)
* [Configure apps with multi-tenant IP space](#configure-apps-with-multi-tenant-ip-space)
* [Connect large SaaS services](#connect-large-saas-services)
* [Deferred approvals](#deferred-approvals)
* [Preconfiguration](#preconfiguration)
* [Routes](#routes)
* [Domains](#domains-1)
* [Automate preconfiguration](#automate-preconfiguration)
* [Automation with Terraform](#automation-with-terraform)
Scroll to top