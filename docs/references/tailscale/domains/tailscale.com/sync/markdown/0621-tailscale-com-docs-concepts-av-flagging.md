Antivirus flagging of the Tailscale client · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Antivirus flagging of the Tailscale client
Last validated: Apr 1, 2025
The Tailscale client can sometimes be falsely flagged by antivirus software, especially with new Tailscale releases, because many antivirus engines use machine learning and other automated tools that can result in false positives.
Do not disregard your antivirus alerts. There are possible scenarios of a supply chain attack or malware masquerading as the Tailscale client, even though this has not yet happened.
You can compare the antivirus alert details to the recent changes in [our client changelog](/changelog#client) to determine when an alert corresponds to intended new behavior of Tailscale.
## [Manage false positives](#manage-false-positives)
If your antivirus software flags the Tailscale client, and you are confident that the warning is a false positive, you can take the following actions:
* Report the false positive to the antivirus vendor.
* Add Tailscale to your local allow list in your antivirus software settings. When Tailscale is upgraded, your antivirus may flag the new version again, and you may need to re-add the Tailscale client to your allow list, depending on which antivirus software you use.
* Email screenshots and information about the antivirus software you are using, including the name and version, to `security@tailscale.com`. This may result in us contacting the antivirus vendor directly to raise the urgency.
## [Manage true positives](#manage-true-positives)
If you believe the antivirus software is flagging a true positive, or you are not sure, you can email `security@tailscale.com` with the following information:
* Screenshots that display the flagged warning message in your antivirus software.
* Details about the antivirus product you are using, including the name and version.
* Information about recent Tailscale client upgrades or tailnet changes.
* A description of why you suspect that the flagging is a true positive.
On this page
* [Manage false positives](#manage-false-positives)
* [Manage true positives](#manage-true-positives)
Scroll to top