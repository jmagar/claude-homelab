Install Tailscale on an AWS VM · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Install Tailscale on an AWS VM
Last validated: Jan 12, 2026
You can install the Tailscale client on an AWS EC2 VM to connect it to your Tailscale network (known as a tailnet) and configure common features such as subnet routers, exit nodes, and app connectors.
## [Install manually](#install-manually)
1. (Optional) Go to the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console and select **Generate auth key** to create an [authentication key](/docs/features/access-control/auth-keys). This lets you add the VM to the tailnet automatically without needing to manually authenticate using your credentials.
2. SSH into your EC2 VM.
3. [Install Tailscale](/docs/install/linux) using the following command:
```
`curl -fsSL https://tailscale.com/install.sh | sh
`
```
4. Start the Tailscale client using one of the following commands:
* If you want to use an auth key, use the command `sudo tailscale up --auth-key=foo` where `foo` is they auth key string that you generated in the first step.
* If you do not want to use an auth key, use the command `sudo tailscale up`, copy and paste the provided URL into your web browser, then authenticate to your tailnet with your credentials.
* In the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, verify that the VM is connected to the tailnet. If the VM you added is a server, you may want to consider [disabling key expiry](/docs/features/access-control/key-expiry) to prevent the need to periodically re-authenticate.
## [Install automatically](#install-automatically)
You can use our AWS installation wizard to deploy Tailscale on an AWS VM using an [AWS CloudFormation](https://aws.amazon.com/pm/cloudformation) template. To do this, you will need access to an account with AWS CloudFormation console and permission to create a new stack. You can use this to launch a user-owned node, or a tagged node. We recommend using tagged nodes for shared infrastructure. For more information, refer to [Group devices with tags](/docs/features/tags).
1. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console. In the **Add devices to your network** section, select **Add AWS VM**.
1. (Recommended) To make this a tagged node, toggle **Tags** to on, select **Add tags**, then choose the tag you want to use for the AWS VM.
2. (Optional) Toggle **Ephemeral** to on if you want the AWS VM to be removed from your tailnet when it goes offline.
3. (Optional) Toggle **Use as exit node** to on if you want to route tailnet traffic through your AWS VM. For more information, refer to [Advertise an exit node](/docs/features/exit-nodes/how-to/setup?tab=linux#advertise-a-device-as-an-exit-node).
4. Select **Continue to AWS**. You will be redirected to the AWS CloudFormation console. If you are already authenticated, the **Quick create stack** page will display.
5. From the CloudFormation console.
1. In the **Stack name** field, enter a name. This serves as a description of the stack you are creating.
2. (Optional) In the **ExtraArgs** field, specify functionality such as [Tailscale SSH](/docs/how-to/connect-ssh-linux-vm) (`--ssh`) and a [subnet router](/docs/features/subnet-routers/how-to/setup?tab=linux) (`--advertise-routes=192.0.1.0/24`), if applicable. Each functionality should be separated by a space.
3. (Optional) In the **Hostname** field, enter a name for the VM that will display in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
4. (Optional) In the **ImageId** field, change if you want to use another image ID for the VM. For more information about image IDs, refer to [Find an AMI that meets the requirements for your EC2 instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html).
5. (Optional) In the **InstanceType** field, change the VM size if you want to use a different Amazon EC2 instance.
6. (Optional) In the **VpcId** field, enter an Amazon Virtual Private Cloud (VPC) and subnet ID if you want the VM to be provisioned in a specific VPC.
7. Select **Create stack** to start provisioning.
8. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and verify that the VM is added. It may take up to 5 minutes for a provisioned VM to join your tailnet.
## [Next steps](#next-steps)
If you have not done so already, you can add the following tailnet functionality to your AWS VM.
* [SSH into your VM](/docs/how-to/connect-ssh-linux-vm) using Tailscale SSH.
* [Advertise an exit node](/docs/features/exit-nodes/how-to/setup?tab=linux#advertise-a-device-as-an-exit-node) to route traffic in your tailnet.
* [Use an existing exit node](/docs/features/exit-nodes/how-to/setup?tab=linux#use-an-exit-node) in your tailnet.
* [Configure a subnet router](/docs/features/subnet-routers/how-to/setup?tab=linux) to relay access in your network, including resources where Tailscale cannot be installed.
* [Configure an app connector](/docs/features/app-connectors) to route application-specific traffic from the tailnet through a selected device that serves as an app connector.
On this page
* [Install manually](#install-manually)
* [Install automatically](#install-automatically)
* [Next steps](#next-steps)
Scroll to top