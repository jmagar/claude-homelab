SSH into a Linux VM · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# SSH into a Linux VM
Last validated: Dec 8, 2025
This topic provides details about making an SSH session to a Linux VM on your Tailscale network (known as a tailnet).
## [Prerequisites](#prerequisites)
* You need a [Tailscale account](/docs/how-to/quickstart)
* You need a Linux VM. The following topics provide details for setting up a Linux VM using common cloud providers:
* [Create a Linux VM on Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal?tabs=ubuntu)
* [Create a Linux VM on AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html)
* [Create a Linux VM on GCP](https://cloud.google.com/compute/docs/create-linux-vm-instance)
* You need [Tailscale installed on your Linux VM](/docs/install/linux)
* You need [Tailscale installed on your local machine](/download)
## [Configure Tailscale SSH](#configure-tailscale-ssh)
1. Start by accessing your VM to install Tailscale.
This will most likely be the cloud-provided SSH mechanism and may require you to **temporarily** open up port `22` on that VM to your corporate network or the internet.
2. In a terminal window on the VM, run the [`tailscale set`](/docs/reference/tailscale-cli/up) command to advertise SSH for that VM:
```
`tailscale set --ssh
`
```
3. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the Tailscale admin console and add the following lines to your tailnet policy file to allow network connectivity to the VM:
```
`"grants": [
{
"src": ["\<your tailscale username\>"],
"dst": ["\<your vm's tailscale ip address\>"],
"ip": ["22"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You can find your VM's Tailscale IP address on the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, and you can find your Tailscale username on the [Users](https://login.tailscale.com/admin/users) page. You don't need to replace existing access control policies if you have any, just add this new rule. Here's an example:
```
`"grants": [
{
"src": ["john.doe@domain.com"],
"dst": ["100.64.65.66"],
"ip": ["22"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
4. In the same tab, add the following rules to the SSH section of your tailnet policy file to allow SSH access to the VM:
```
`"ssh": [
{ "action": "accept",
"src": ["your tailscale username"],
"dst": ["autogroup:self"],
"users": ["root","autogroup:nonroot", "\<your-local-username\>"]
}
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
5. If you have a local username (such as `local-user`) defined on the VM, you should add it to the `users` array in the `ssh` section. You don't need to replace existing SSH policies if you have any, just add this new rule. Here's an example:
```
`"ssh": [
{ "action": "accept",
"src": ["john.doe@example.com"],
"dst": ["autogroup:self"],
"users": ["root","autogroup:nonroot", "local-user"]
}
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Use Tailscale SSH](#use-tailscale-ssh)
1. In a terminal window on your local machine, SSH to your VM:
```
`ssh \<your-vm-ip-address\>
`
```
2. If you need to use your local account just reference it before the IP address (`user@IP`) when running the SSH command. You can also use the [MagicDNS](/docs/features/magicdns) hostname of the machine. For example:
```
`ssh local-user@100.64.65.66
`
```
3. If you haven't already, you can close the SSH port on your cloud VM and re-run the Tailscale SSH command to verify it is working.
We strongly recommend that you do not keep the SSH port exposed for prolonged periods of time especially to the internet. If you need to open this port for this test, after you are done testing, make sure you close the port or delete your test VM.
On this page
* [Prerequisites](#prerequisites)
* [Configure Tailscale SSH](#configure-tailscale-ssh)
* [Use Tailscale SSH](#use-tailscale-ssh)
Scroll to top