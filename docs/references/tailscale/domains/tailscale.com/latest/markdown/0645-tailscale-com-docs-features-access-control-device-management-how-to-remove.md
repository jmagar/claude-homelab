Remove a device · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Remove a device
Last validated: Jan 5, 2026
If you no longer want a device in your Tailscale network (tailnet), you can remove it from either the [Machines](https://login.tailscale.com/admin/machines) page of the admin console or by using the [Tailscale API](/docs/reference/tailscale-api).
When removing a device from your tailnet, note the following:
* The device will immediately lose connection to all resources in the tailnet
* If [device approval](/docs/features/access-control/device-management/device-approval) is not enabled in your tailnet, the device can be added back to the tailnet without needing re-authorization by a tailnet admin
* If the Tailscale client is [uninstalled](/docs/features/client/uninstall) on a device without any removal action, the device will not be removed from the tailnet
## [Remove devices from the admin console](#remove-devices-from-the-admin-console)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to remove devices from the admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Locate the device by either typing the name of the device in the search bar or using the **Filters** option.
3. Select the menu next to the device, then select **Remove**.
4. In the confirmation dialog, select **Remove machine**.
## [Use API scripts to remove devices](#use-api-scripts-to-remove-devices)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to remove devices using the [Tailscale API](/docs/reference/tailscale-api).
You can use the Tailscale API to remove devices, as shown in the following script examples.
### [Remove devices using a CSV file](#remove-devices-using-a-csv-file)
To remove devices using a CSV file, modify and use the following script:
```
` for id in $(cat nodes.csv); do echo $id; curl -X DELETE "https://api.tailscale.com/api/v2/device/${id}" -u "$(cat \~/keys/tskey):"; sleep 0.1; done
`
```
### [Remove devices by tag](#remove-devices-by-tag)
To remove devices by a specified tag, modify and use the following script. Make sure to update the `apikey=$` line with the path to your Tailscale API key.
```
`#!/bin/bash
tailnet="example.com"
# Replace with a path to your Tailscale API key.
apikey=$(\<"/home/user/path/to/api.key"\>)
targetname="substring"
curl -s "https://api.tailscale.com/api/v2/tailnet/$tailnet/devices" -u "$apikey:" |jq -r '.devices[] | "\\(.id) \\(.name)"' |
while read id name; do
if [[ $name = \*"$targetname"\* ]]
then
echo $name $id " includes " $name " in its name - getting rid of it"
curl -s -X DELETE "https://api.tailscale.com/api/v2/device/$id" -u "$apikey:"
else
echo $name" does not have that string in its name, keeping it"
fi
done
`
```
### [Remove devices by last seen date](#remove-devices-by-last-seen-date)
To remove devices older than a specified last seen date, modify and use the following script. Make sure to update the `apikey=$` line with the path to your Tailscale API key.
```
` #!/bin/bash
tailnet="example.com"
# Replace with a path to your Tailscale API key.
apikey=$(\<"/home/user/path/to/api.key"\>)
oldenough=$(date -I --date="1 month ago")
curl -s "https://api.tailscale.com/api/v2/tailnet/$tailnet/devices" -u "$apikey:" |jq -r '.devices[] | "\\(.lastSeen) \\(.id)"' |
while read seen id; do
if [[ $seen \< $oldenough ]]
then
echo $id " was last seen " $seen " getting rid of it"
curl -s -X DELETE "https://api.tailscale.com/api/v2/device/$id" -u "$apikey:"
else
echo $id " was last seen " $seen " keeping it"
fi
done
`
```
On this page
* [Remove devices from the admin console](#remove-devices-from-the-admin-console)
* [Use API scripts to remove devices](#use-api-scripts-to-remove-devices)
* [Remove devices using a CSV file](#remove-devices-using-a-csv-file)
* [Remove devices by tag](#remove-devices-by-tag)
* [Remove devices by last seen date](#remove-devices-by-last-seen-date)
Scroll to top