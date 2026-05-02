Exporting a list of tailnet users · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Exporting a list of tailnet users
Last validated: Jan 5, 2026
Using the [Users](https://login.tailscale.com/admin/users) page in the admin console, you can export a list of users in your
tailnet. You can choose to download a list of all users, or you can filter by criteria to download a
subset of users. Example of data in the download is user name, whether the user is active, when the user was last active.
The download file is in comma-separated values (CSV) format, which is recognized by many browsers
and spreadsheet programs. Each row in the CSV file represents one user.
If you want to know how to export a list of devices, refer to [Exporting a list of tailnet devices](/docs/features/access-control/device-management/how-to/export-list).
## [Exporting a list of users](#exporting-a-list-of-users)
You need to be an [Owner, Admin, Network admin, IT admin, or Auditor](/docs/reference/user-roles) of a tailnet in order
to access the admin console and export a list of users.
1. Open the [Users](https://login.tailscale.com/admin/users) page in the admin console.
2. (Optional) Select **Status** and/or **Role** to filter which users you want to list.
3. Select the download icon at the top right of the page. This opens the **Export users data to CSV** dialog.
4. If you have selected any filters, you have the option of either downloading all users or the subset
of users selected by the filter.
5. Select **Download**.
If your browser settings let you specify a file name:
1. Specify the name of the file to use for the download, or accept the default name.
2. Go to the location where you want to save the file.
3. Select **Save**.
If your browser settings instead automatically download the file, look for it in the
Downloads folder. The file name is of the form:
```
`\<organization-name\>-users-\<date-time\>.csv
`
```
where:
* `\<organization-name\>` is your [tailnet ID](/docs/concepts/tailnet-name#tailnet-id).
* `\<date-time\>` is the date and time the exported list was generated.
For example:
```
`example.com-users-2022-12-14T20-20-47-018Z.csv
`
```
## [Limitations](#limitations)
* The download is a point-in-time export based on the time that the download occurred. You cannot
specify an earlier time to capture historical data.
* You cannot select which columns to export.
* Columns may change as we add or update features.
On this page
* [Exporting a list of users](#exporting-a-list-of-users)
* [Limitations](#limitations)
Scroll to top