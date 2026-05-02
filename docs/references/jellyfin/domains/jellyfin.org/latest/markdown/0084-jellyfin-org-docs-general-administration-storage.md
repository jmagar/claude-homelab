Storage | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
Jellyfin is designed to directly read media from the filesystem. A network storage device that is using samba or NFS must be directly mounted to the OS. The Jellyfin database should also be stored locally and not on a network storage device.
caution
There are [scheduled maintenance tasks](/docs/general/server/tasks) which remove items from your library if triggered while your media storage is unavailable.
## NFS[​](#nfs)
In case you encounter performance issues where files take a long time to start playing while using NFSv3, you might be running in an issue with .NET locking without NFSv3 having locking enabled.
To solve this, you have the following options:
* Disable .NET locking using DOTNET\_SYSTEM\_IO\_DISABLEFILELOCKING (introduced in .NET 6).
* Disable locking for the mount using the nolock option.
* Enable the lock service.
* Use NFSv4 which has built-in lock support.
## Docker and VMs[​](#docker-and-vms)
A database for a moderate-sized library can grow anywhere from 10 to 100 GB.
The [transcoding](/docs/general/post-install/transcoding) folder typically requires about the same amount of space as the original media when transcoded at an equivalent bitrate. For example, a single 50 GB Blu-ray remux might consume as much as \~60 GB or as little as \~15 GB after transcoding. If the transcoding folder shares the same storage as the database, this should be accounted for to avoid any problems.
## Cloud Storage Providers[​](#cloud-storage-providers)
[rclone](https://rclone.org/downloads/) is a popular choice for integrating cloud storage with a Jellyfin Server. rclone is supported on most operating systems. To combine local and cloud filesystems, rclone can be paired with another program such as [mergerfs](https://github.com/trapexit/mergerfs).
When using cloud storage, it is recommended to disable image extraction as it requires downloading the entire file.
## MergerFS[​](#mergerfs)
MergerFS isn't meant for everything, [see here](https://github.com/trapexit/mergerfs#what-should-mergerfs-not-be-used-for) for more.
* rclone recommended [config](https://forum.rclone.org/t/my-best-rclone-config-mount-for-plex/7441).
To modify and examine your mergerfs mount, here's a quick [guide](https://zackreed.me/mergerfs-neat-tricks).
## Filesystem Considerations[​](#filesystem-considerations)
For certain filesystems, optimizations are highly recommended for acceptable performance.
### ZFS[​](#zfs)
Whilst development is being done on further database providers, in the current implementation of Jellyfin Server, the database uses SQLite. ZFS uses a default record size of `128 K`. This is sub-optimal for the SQLite database.
Ideally, you should use a record size of `4 K` or `8 K` on the dataset that contains your Jellyfin Server SQLite database. This is easily configured when running Jellyfin Server within a Docker container as you are able to easily change bind mounts and can set various datasets for each path as appropriate.
The record size for your media file dataset(s) must not be using `4 K` or `8 K`, otherwise you will likely encounter performance issues as your database scales.
For ZFS datasets containing large media files (i.e., not the dataset containing the Jellyfin Server SQLite database), a record size of `1 M` is likely appropriate for optimal performance.
Note that changing the record size on an existing ZFS dataset will not change the existing data within it, meaning performance will not be any different for anything but newly-written changes into the dataset. As such, it is recommended to rewrite your data into the dataset to take advantage of the change in record size; otherwise, the configuration change will not yield the expected change in performance.
As ZFS snapshots can use a lot of storage over time without a sensible `destroy` schedule, there may be a temptation to keep your data on a mechanical drive instead of an SSD. Do not use ZFS-formatted mechanical drives to store your Jellyfin Server data (everything except your media files), as this will result in poor performance. An SSD is strongly recommended.
* [NFS](#nfs)
* [Docker and VMs](#docker-and-vms)
* [Cloud Storage Providers](#cloud-storage-providers)
* [MergerFS](#mergerfs)
* [Filesystem Considerations](#filesystem-considerations)
* [ZFS](#zfs)