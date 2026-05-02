Secure Device Access: Tailscale & 1Password Device Trust Integration
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productOctober 24, 2024
# Tailscale and 1Password Device Trust, now generally available
Tailscale is a zero-config VPN that makes networking easy and secure. We’re committed to providing the best-in-class solutions for secure networking — but even the best encrypted connections are only as secure as their endpoints, which can be complicated to manage. Today’s integration with 1Password Extended Access Management marks another milestone in making secure, trusted access easier and more effective for organizations of all sizes.
Tailscale’s device posture integration with 1Password Extended Access Management's device trust is designed to address the access-trust gap of devices in your network, and helps ensure that only trusted and compliant devices are accessing your company’s network and resources.
That’s especially important in today’s increasingly distributed and remote-first world, where the traditional concept of the network perimeter has dissolved. Employees are accessing sensitive company data from various locations, often using personal devices on untrusted networks. This has increased the need for better control over **who** and **what** gets access to sensitive resources.
For organizations prioritizing security and simplicity in managing access, this integration can help ensure that devices accessing your network are known and compliant with security policies. With the integration of Tailscale and 1Password Extended Access Management, you get a comprehensive solution that addresses both **identity-based access control** and **device-based security compliance**.
## [How does this integration work?](#how-does-this-integration-work)
This integration works by connecting 1Password Extended Access Management with your organization’s Okta, Microsoft Entra, or Google Workspace, you can configure a series of checks for the devices in your network to verify they are known and compliant. These checks are evaluated at authentication time and users are prompted to make any required corrective actions. You can also set your configuration to block devices from completing the authentication if they fail some checks.
[Tailscale’s device posture management](https://tailscale.com/kb/1288/device-posture) allows you to define a baseline for devices (e.g. OS version, auto-updates enabled, etc) in your Tailscale network, or tailnet, to be considered secure and trustworthy. The device posture checks get evaluated every time a device initiates a connection, offering continuous verification in a zero-trust environment.
When you configure [Tailscale’s device posture integration with 1Password](https://tailscale.com/kb/1407/kolide), Tailscale fetches the authorization status of each device and allows it access to the network based on the configured device posture conditions. For example:
```
`"posture:trusted":[
"kolide:authState != 'Blocked'"
]`
```
Taken together, this integration gives your team:
* **Device compliance assurance**: 1Password Extended Access Management ensures that only compliant devices can access the network. When you configure the 1Password integration in your tailnet and use device posture conditions to use the authorization status of devices as reported by 1Password, non-compliant devices will be blocked from accessing sensitive resources in the tailnet until the issue is resolved.
* **Device posture checks**: 1Password Extended Access Management provides real-time checks on device status, ensuring that users are always accessing the network from secure devices. Whether it’s enforcing updates, checking for encryption, or verifying security software, you can have confidence that each device that is permitted in your tailnet is trusted with this device posture integration with 1Password.
* **Streamlined user experience**: Users don’t have to wrestle with multiple layers of authentication or complicated VPN setups. With this integration, access is secure, simple, and smooth, powered by 1Password’s intuitive platform and Tailscale’s zero-config VPN.### [Get started today](#get-started-today)
Customers on our Enterprise plans can configure the [1Password Extended Access Management integration](https://tailscale.com/kb/1407/kolide) in the admin console. To learn more about Tailscale’s device posture management, check out [our documentation](https://tailscale.com/kb/1288/device-posture) and don't hesitate to [reach out to us](https://tailscale.com/contact/sales) with any questions.
Share
Author
Tinku Thomas
Contributors
Rachele Gyorffy
Anton Tolchanov
Kristoffer Dalby
Paul Scott
James Sanderson
Author
Tinku Thomas
Contributors
Rachele Gyorffy
Anton Tolchanov
Kristoffer Dalby
Paul Scott
James Sanderson
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