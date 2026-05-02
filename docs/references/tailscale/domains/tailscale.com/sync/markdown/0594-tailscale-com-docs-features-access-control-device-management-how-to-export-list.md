Exporting a list of tailnet devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Exporting a list of tailnet devices
Last validated: Jan 5, 2026
Using the [Machines](https://login.tailscale.com/admin/machines) page in the admin console, you can export a list of devices in your
tailnet. You can choose to download a list of all devices, or you can filter by criteria to download a
subset of devices. Example of data in the download is the device name, user, Tailscale client version, and when the device was last seen.
The download file is in comma-separated values (CSV) format, which is recognized by many browsers
and spreadsheet programs. Each row in the CSV file represents one device.
If you want to know how to export a list of users, refer to [Exporting a list of tailnet users](/docs/features/sharing/how-to/export-list).
## [Exporting a list of devices](#exporting-a-list-of-devices)
You need to be an [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) of a tailnet in order
to access the admin console and export a list of devices.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page in the admin console.
2. (Optional) Select **Filter** to [filter which devices](/docs/features/access-control/device-management/how-to/filter) you want to list.
3. Select the download icon at the top right of the page. This opens the **Export devices data to CSV** dialog.
4. If you have selected any filters, you have the option of either downloading all devices or the subset
of devices selected by the filter.
5. Select **Download**.
If your browser settings let you specify a file name:
1. Specify the name of the file to use for the download, or accept the default name.
2. Go to the location where you want to save the file.
3. Select **Save**.
If your browser settings instead automatically download the file, look for it in the
Downloads folder. The file name is of the form:
```
`\<organization-name\>-devices-\<date-time\>.csv
`
```
where:
* `\<organization-name\>` is your [tailnet ID](/docs/concepts/tailnet-name#tailnet-id).
* `\<date-time\>` is the date and time the exported list was generated.
For example:
```
`example.com-devices-2022-12-14T20-21-59-023Z.csv
`
```
## [Additional way to retrieve list of devices](#additional-way-to-retrieve-list-of-devices)
You can use the [`tailnet-devices-get`](/api#tag/devices/GET/tailnet/{tailnet}/devices) method in the [Tailscale API](/docs/reference/tailscale-api) to
retrieve a list of devices, and the [`device-get`](/api#tag/devices/GET/device/{deviceId}) method to retrieve details for a specific device.
## [Limitations](#limitations)
* The download is a point-in-time export based on the time that the download occurred. You cannot
specify an earlier time to capture historical data.
* You cannot select which columns to export.
* Columns may change as we add or update features.
On this page
* [Exporting a list of devices](#exporting-a-list-of-devices)
* [Additional way to retrieve list of devices](#additional-way-to-retrieve-list-of-devices)
* [Limitations](#limitations)
Scroll to top