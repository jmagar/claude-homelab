Troubleshooting grants · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshooting grants
Last validated: Jan 12, 2026
[Grants](/docs/features/access-control/grants) are Tailscale's unified approach to defining access controls for both [network and application layers](/docs/features/access-control/grants/grants-app-capabilities) in your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)). This guide walks you through diagnosing and solving common grant-related problems, progressing from basic verification techniques to resolving complex authorization scenarios.
## [Diagnosing grant issues](#diagnosing-grant-issues)
This section covers the tools and methods available for inspecting your grant policies, verifying policy compilation, and examining how the Tailscale policy engine applies permissions to specific devices or users. Using these diagnostic techniques will help you identify the root cause of most grant-related problems.
Keep in mind that Tailscale validates the syntax of the [tailnet policy file](/docs/features/tailnet-policy-file), including the grants section, when you save it. You won't be able to save it if it has a syntax error. This is true for our admin console editor, [GitOps](/docs/gitops), [Terraform](/docs/integrations/terraform-provider), and our API. You also won't be able to save the tailnet policy file if it refers to a target (such as a group) that is not defined.
### [Verify your grants configuration](#verify-your-grants-configuration)
The first step in troubleshooting is to verify that your grants are correctly defined in your [tailnet policy file](/docs/features/tailnet-policy-file). You can use the [**Preview rules**](/docs/features/tailnet-policy-file/manage-tailnet-policies) tab from the [Access controls](/docs/features/access-control) page of the admin console to check how the rules apply to specific users or tags. This can help you ensure the policy configuration will work as you intend it to.
### [Inspect capabilities with `whois`](#inspect-capabilities-with-whois)
For diagnosing issues with [application layer capabilities](/docs/features/access-control/grants/grants-app-capabilities) granted to specific devices or users, the [`tailscale whois`](/docs/reference/tailscale-cli#whois) command is invaluable. This command provides detailed information about a node, including all capabilities granted to it through your tailnet policy.
To inspect the capabilities of a user or device, use its [Tailscale IP address](/docs/concepts/tailscale-ip-addresses):
```
`tailscale whois 100.100.123.123
`
```
The output includes:
* Basic device or user information.
* Network addresses associated with the device.
* A list of all capabilities granted to the device.
Pay special attention to the Capabilities section of the output, which details all application capabilities granted to the device. Each capability listing includes its full name and parameters, letting you verify that it is applying the correct permissions.
## [Resolve common issues](#resolve-common-issues)
Many grant-related issues stem from basic configuration problems or misunderstandings about [how grants work](/docs/reference/syntax/grants). This section addresses some common issues you might encounter when working with grants.
### [Selector matching issues](#selector-matching-issues)
[Selectors](/docs/reference/targets-and-selectors) might fail to match the intended targets. This happens when the selectors in your grants don't correctly identify the devices or users you're trying to permit.
Common selector matching problems include:
* Misspelling email addresses or domain names.
* Using [tag](/docs/features/tags) that have been created but not applied to any devices.
* Using group names that have been created but not populated with users.
* Forgetting to prefix group names with `group:` or tag names with `tag:`. This type of syntax error will be caught automatically unless there's also a host with the same name as the group or tag.
To troubleshoot selector matching issues:
1. Confirm that tags referenced in your grants have been applied to the appropriate devices.
2. Check for typos in email addresses, especially if you're granting access to specific users.
3. Use [`tailscale status`](/docs/reference/tailscale-cli#status) to verify the tags applied to your devices.
You must run this command on each device you're checking.
If you're using [autogroups](/docs/reference/targets-and-selectors#autogroups) (such as `autogroup:member`), make sure you understand the devices within each autogroup. For example, `autogroup:member` includes all users who are members of your tailnet, but not devices shared from other tailnets.
## [Less common and complex issues](#less-common-and-complex-issues)
Beyond basic configuration problems, you might encounter more complex issues with grants, especially when implementing sophisticated [access control policies](/docs/features/access-control) (such as posture checks, route filtering, or custom [application capabilities](/docs/features/access-control/grants/grants-app-capabilities)). These issues often require a deeper understanding of how the Tailscale policy engine processes and applies grants.
### [Problems with `via` field routing](#problems-with-via-field-routing)
The [`via` field in grants](/docs/features/access-control/grants/grants-via) lets you segment resource access through different routers based on specific criteria. However, misconfiguration can lead to routing failures or unexpected traffic paths.
Common `via` routing issues include:
* Specifying a `via` target that isn't reachable from the source.
* Using a `via` target with subnet routers that don't have the appropriate [subnet routes](/docs/features/subnet-routers) advertised.
* Using a `via` target with [app connectors](/docs/features/app-connectors) that have not been appropriately configured.
* Using a `via` target with exit nodes that have not been approved.
* Missing `via` field when intending to route traffic to subnet routes, app connectors, or [exit nodes](/docs/features/exit-nodes).
To troubleshoot `via` routing issues:
1. Verify that the device specified in the `via` field exists and is online using [`tailscale status`](/docs/reference/tailscale-cli#status).
2. Confirm that the `via` device has the appropriate configuration.
3. For [subnet routers](/docs/features/subnet-routers), check that subnet routes are advertised using `tailscale status --routes`.
4. For [app connectors](/docs/features/app-connectors), check that the app connector is properly configured.
5. For [exit nodes](/docs/features/exit-nodes), check that the exit node has been approved in the admin console.
6. Check that the `via` device is reachable from the source device using [`tailscale ping`](/docs/reference/tailscale-cli#ping).
7. Verify that the destination is reachable through the `via` device by examining logs on the `via` device.
Example of a correct `via` configuration:
```
`"grants": [
{
"src": ["group:eng"],
"dst": ["192.0.2.0/24"],
"ip": ["\*"],
"via": ["tag:subnet-router"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
In this example, make sure that a device with the `tag:subnet-router` tag exists, is online, and has the `192.0.2.0/24` subnet route advertised.
### [Device posture verification failures](#device-posture-verification-failures)
The `srcPosture` field lets you restrict access based on [device posture](/docs/features/device-posture) conditions.
Common device posture issues include:
* Devices running outdated [Tailscale versions](/docs/reference/tailscale-client-versions) that don't support posture checking.
* Posture conditions that are too restrictive or impossible to meet.
* Misconfigured posture conditions with syntax errors.
* Devices missing required attributes for posture checking.
To troubleshoot device posture issues:
1. Verify that all devices are running an up-to-date version of the Tailscale client. Versions prior to 1.52.0 don't support posture checking.
2. Review the posture conditions in your tailnet policy file for correctness.
3. Use [`tailscale status --self`](/docs/reference/tailscale-cli#status) to get the device attributes that are checked for posture verification.
4. Test with more permissive posture conditions first, then gradually tighten restrictions.
Example of device posture verification:
```
`"postures": {
"posture:latest": [
"node:tsVersion \>= '1.42.0'",
"node:os == 'linux'"
]
},
"grants": [
{
"src": ["group:eng"],
"dst": ["tag:prod"],
"ip": ["\*"]
"srcPosture": ["posture:latest"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
If devices are failing posture checks, temporarily remove the `srcPosture` field to verify that the grant works without posture conditions, then add them back one by one to identify the problematic condition.
### [Application capability integration issues](#application-capability-integration-issues)
Integrating [application capabilities](/docs/features/access-control/grants/grants-app-capabilities) with grants can introduce issues when applications don't correctly interpret the capabilities provided by the [Tailscale client](/docs/install).
Common application capability issues include:
* Applications not querying the local Tailscale client for capabilities.
* Incorrect capability names or parameter structures.
* Applications misinterpreting the capabilities returned by the Tailscale client.
To troubleshoot application capability issues:
1. Verify that your application is correctly querying the Tailscale client for capabilities using the [LocalAPI](https://pkg.go.dev/tailscale.com/ipn/localapi). This is only required if the application doesn't use the [`tsnet` library](/docs/features/tsnet).
2. Check that the capability name matches exactly what your application expects.
3. Confirm that the parameters in your grant match the schema expected by your application.
4. Test with simplified capability parameters first, then add complexity.
Example of a correct application capability grant:
```
`"grants": [
{
"src": ["group:eng"],
"dst": ["tag:tailsql"],
"ip": ["tcp:443"],
"app": {
"tailscale.com/cap/tailsql": [
{
"dataSrc": ["prod", "staging"]
}
]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
In this example, make sure that the application running on devices with the `tag:tailsql` tag is correctly checking for the `tailscale.com/cap/tailsql` capability and properly interpreting the `dataSrc` parameter.
## [Prevention strategies](#prevention-strategies)
This section outlines best practices for designing, implementing, and maintaining grants in your tailnet policy. By following these recommendations, you can minimize issues and streamline troubleshooting when problems do arise.
### [Design principles for effective grants](#design-principles-for-effective-grants)
* [**Least privilege**](/learn/principle-of-least-privilege): Grant only the minimum permissions needed for each source-destination pair. Be specific about ports and protocols in the `ip` field when appropriate.
* [**Logical grouping**](#design-principles-for-effective-grants): Organize related grants together and use comments to explain their purpose. This makes the policy file more readable and easier to maintain.
* [**Standardized naming**](#design-principles-for-effective-grants): Use consistent naming conventions for groups, tags, and IP sets referenced in your grants. This reduces the risk of typos and makes troubleshooting easier.
* [**Progressive refinement**](#design-principles-for-effective-grants): Start with broad grants and refine them over time as you better understand your access control requirements. This approach is less likely to cause unexpected denials.
* [**Documentation**](#design-principles-for-effective-grants): Document your grants with comments in the policy file, explaining why each grant exists and what it's intended to permit.
Following these principles will result in a more maintainable policy file that's less prone to issues and easier to troubleshoot when problems occur.
### [Testing strategies](#testing-strategies)
Consider using testing strategies before deploying changes to your grants:
* [Document test cases](#testing-strategies): Create a set of [tests](/docs/reference/syntax/policy-file#tests) in your tailnet policy file that cover all the permissions you need to verify.
* [Use the access control rules preview](/docs/features/tailnet-policy-file/manage-tailnet-policies): The admin console's policy file editor includes a preview feature that shows what changes your edits will make to the effective policy. Review this carefully before applying changes.
* [Staged rollout](#testing-strategies): For significant changes, consider a staged rollout to a subset of devices or users before applying the changes to your entire tailnet.
By thoroughly testing changes before deployment and monitoring for issues afterward, you can identify and resolve problems before they affect your users.
On this page
* [Diagnosing grant issues](#diagnosing-grant-issues)
* [Verify your grants configuration](#verify-your-grants-configuration)
* [Inspect capabilities with whois](#inspect-capabilities-with-whois)
* [Resolve common issues](#resolve-common-issues)
* [Selector matching issues](#selector-matching-issues)
* [Less common and complex issues](#less-common-and-complex-issues)
* [Problems with via field routing](#problems-with-via-field-routing)
* [Device posture verification failures](#device-posture-verification-failures)
* [Application capability integration issues](#application-capability-integration-issues)
* [Prevention strategies](#prevention-strategies)
* [Design principles for effective grants](#design-principles-for-effective-grants)
* [Testing strategies](#testing-strategies)
Scroll to top