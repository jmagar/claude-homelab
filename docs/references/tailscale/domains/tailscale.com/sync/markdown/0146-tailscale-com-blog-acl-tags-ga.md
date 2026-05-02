How to Use ACL Tags for Device Access in Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|February 01, 2022
# ACL Tags: Simplify Device Access in Tailscale Networks
[ACL tags](/kb/1068/acl-tags/) can be applied to a Tailscale device in order to manage access permissions based on its tag. Tailscale already allows you to manage access to devices based on their names, rather than IP addresses; and tags take this a step further, so you can manage access to devices based on their purpose. For example, you might tag a production server `prod` and a production database `prod`, and allow all `prod` devices to communicate with each other in your network, rather than specifying each device individually.
**We’re excited to announce ACL tags are now generally available!** What does this mean for you? You can include tags as part of an authentication key, you can tag devices from the admin console, and tags can be owners of other tags. And we’ve further locked down ACL tags, so that authentication is required when re-tagging a device. ACL tags are a free feature, available in all pricing tiers.
### An ACL tag is a bit like a service account, but you can have more than one
A service account, or role account, is a common concept in many infrastructure tools. It allows you to generate and assign a new identity to entities in your infrastructure, rather than use a human identity.
Tailscale handles service accounts a bit differently with ACL tags. ACL tags provide a way to assign an identity to a device which is separate from your user identities. When an ACL tag is added to a device, it replaces the prior user authentication on that device. An authorized user in your identity provider must first authenticate a tag on a device; then the tagged device’s connections are authorized based on the tag’s permissions.
ACL tags are similar to role accounts, but more flexible: you can assign many tags to a device, to account for multiple different uses, whereas a device can only be signed in as a single user. Instead of fine-tuning per-device permissions to match a multi-purpose device, with ACL tags, simply define permissions for a tag consistent with its intent, and change the tags on the device. A device’s identity in Tailscale is then the combination of all of its tags (not the intersection). For example, you might have a device that is both a `server` and part of your `prod` network. You could assign both tags to the device to manage permissions for these tags separately and independently.
To generate an ACL tag, first define a tag as part of the ACL file in the admin console and specify `tagOwners`. This tells Tailscale which users are authorized to use the ACL tag. Then, tag the devices. This can be done by using `tailscale up` with the option `--advertise-tags`, and can also be done in the list of devices in the admin console.
The more complex your network, the more you want to make sure that you’re correctly managing access to your resources. To verify that you’ve set up access to your servers correctly, write an [ACL test](/kb/1018/acls/#tests) including an ACL tag. You can write a test to verify that your ACL policy `deny` `user:eve` on `tag:server:80`. If your tests fail, you’re unable to save your ACL policy file, so that you know your controls aren’t working as intended.
### ACL tags let you easily manage servers
You should use an ACL tag when authenticating servers in your network, and user authentication when authenticating end user devices.
ACL tags are [ACL’d by `tagOwners`](/kb/1068/acl-tags#define-a-tag)—this means that only an authenticated and authorized user can make a change to tags. **As ACL tags become generally available, we’ve addressed how re-tagging works: re-tagging a device, including removing, changing, or adding a tag, requires reauthentication.** You can safely define a permission based on the device having a particular tag, without worrying that a user who doesn’t want their device to be restricted will just remove the tag. When suspending or deleting a user, the devices they provisioned and tagged are not affected.
### Include an ACL tag as part of an auth key
You can use [auth keys](/kb/1085/auth-keys/) to register new devices without needing to authenticate with a web browser on the device—whether it be a static server or an ephemeral resource like a container or function. Previously, if you wanted to add a new server to your environment and manage its access with ACL tags, this was two steps: first authenticate and add the device, then re-authenticate to add an ACL tag.
**As part of ACL tags general availability, this is now just one step: you can include an ACL tag binding as part of any new auth key you generate.** That means that by passing `tailscale up --authkey` with a tagged auth key, your devices will not only authenticate to Tailscale and join your network, but will join them already managed by the ACL tag, and so restricted by any relevant ACLs. See [our documentation](/kb/1068/acl-tags/#using-an-acl-tag-with-an-auth-key) for instructions on generating an auth key with ACL tags in both the admin console and the API.
Generate an auth key with an ACL tag from the Settings section of the admin console. Auth keys should be kept secret—this one has already been invalidated.
### Assign an ACL tag in the admin console
ACL tags were previously only available in the CLI, so that you needed to have root access to a device to tag it, by running `tailscale up --advertise-tags`. **Now, as part of ACL tags general availability, authorized users can tag devices from [the machines page of the admin console](https://login.tailscale.com/admin/machines)**. A tailnet’s [Owner, Admins, and Network admins](/kb/1138/user-roles/) can apply any tag from the admin console.
An Admin can tag a device from the Machines tab of the admin console.
### Delegate tags by letting an ACL tag own another ACL tag
Tagging things manually is fine, if you’re setting up a few servers yourself. However, with larger infrastructure deployments, then you’re likely not doing things manually, but using a deployment tool.
One way to manage a deployment of tags across your servers is for your deployment tool to have a tag, and for that tag to be a tagOwner on another tag. For example, you could have your deployment system with the tag `tag:deployment` which owns both `tag:prod` and `tag:test`. Then, depending on what workload you deploy, the tagged system can authenticate as the appropriate infrastructure tag, which enforces the correct access controls.
```
` "TagOwners": {
"tag:deployment": ["alice@tailscale.com"],
"tag:prod”: ["tag:deployment", “group:sre”],
"tag:test": ["tag:deployment", “group:engineering”],
},
`
```
Tag your servers to more easily manage their access. To learn more, watch [our discussion with Maisem Ali](https://www.youtube.com/watch?v=xKfBeaEUvWk), and check out [our documentation on how to use ACL tags](/kb/1068/acl-tags).
Share
Authors
Maisem Ali
Joe Tsai
Alessandro Mingione
Sonia Appasamy
Authors
Maisem Ali
Joe Tsai
Alessandro Mingione
Sonia Appasamy
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