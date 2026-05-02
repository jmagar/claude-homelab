Taildrop with NAS devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Taildrop with NAS devices
Last validated: Jan 5, 2026
Taildrop is currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
Taildrop is available for [all plans](/pricing).
Taildrop lets you send files between your personal devices on a Tailscale network (known as a tailnet).
Except for network access storage (NAS) devices, Taildrop does not require client setup other than [installing Tailscale](/docs/install). For NAS devices, additional setup is required, as documented in this topic.
## [Set up Taildrop on Synology](#set-up-taildrop-on-synology)
If you haven't already, [install Tailscale on your Synology device](/docs/integrations/synology#install-tailscale-on-dsm-manually).
To set up your Synology device to receive Taildrop files:
1. In the Synology DSM web UI, go to **Main Menu** \> **File Station**.
2. Select **Create** and then select **Create New Shared Folder**.
3. In the **Shared Folder Creation Wizard**, use `Taildrop` for the name of the folder.
4. Set other values per your choice and continue through the wizard until you have created the `Taildrop` Shared Folder.
5. In **File Station**, right-click the `Taildrop` folder and select **Properties**.
6. Select **Permission**.
7. Select the **tailscale** system user and select **Edit**. Note that the **tailscale** system user is shown with the name **tailscale**; it is not the name of a user in your tailnet.
8. Grant read/write access to **tailscale**.
9. Select **Done** and then select **Save**.
10. After you have completed the above steps, restart Tailscale on your Synology device.
You should now be able to receive Taildrop files on your Synology device.
## [Set up Taildrop on QNAP](#set-up-taildrop-on-qnap)
If you haven't already, [install Tailscale on your QNAP device](/docs/integrations/qnap#installation-steps).
To set up your QNAP device to receive Taildrop files:
1. Open QNAP File Station.
2. Select the **New Folder** icon, then select **Shared Folder**.
3. In the **Folder Name** field, enter the folder name `Taildrop`.
4. Save your changes.
You should now be able to receive Taildrop files on your QNAP device.
## [Receive files with a NAS device](#receive-files-with-a-nas-device)
When devices in your tailnet send files to your NAS device, they will automatically be added to the `Taildrop` folder.
On this page
* [Set up Taildrop on Synology](#set-up-taildrop-on-synology)
* [Set up Taildrop on QNAP](#set-up-taildrop-on-qnap)
* [Receive files with a NAS device](#receive-files-with-a-nas-device)
Scroll to top