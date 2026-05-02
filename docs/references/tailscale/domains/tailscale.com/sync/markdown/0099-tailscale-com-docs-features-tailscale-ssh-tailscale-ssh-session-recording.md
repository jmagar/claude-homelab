Tailscale SSH session recording · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale SSH session recording
Last validated: Jan 5, 2026
Tailscale SSH session recording lets you stream logs of [Tailscale SSH](/docs/features/tailscale-ssh) sessions to another node in your tailnet. These recordings are encrypted end-to-end just like all other Tailscale traffic.
Tailscale SSH session recording is currently [in beta](/docs/reference/tailscale-release-stages#beta). To try it, follow the steps below to enable it for your network using Tailscale v1.40.1 or later.
Tailscale SSH session recording is available for [the Personal and Enterprise plans](/pricing).
The Tailscale session recorder now supports recording all [Kubernetes sessions and API requests](/docs/features/kubernetes-operator/how-to/session-recording).
## [How it works](#how-it-works)
Tailscale SSH session recording lets you stream recordings of Tailscale SSH sessions from the destination node to a recorder node in your tailnet. The recorder is a [`tsnet` binary](/blog/tsnet-virtual-private-services), which you deploy to a machine or [Kubernetes cluster](/docs/features/kubernetes-operator/how-to/tsrecorder) you manage. Logs are streamed over your tailnet to your node, so they are end-to-end encrypted and not visible to Tailscale. The recorder can either store the log files on the host filesystem, or export them to Amazon S3 or another S3-compatible storage service.
Tailscale SSH session recording captures terminal sessions in [`asciinema`](https://asciinema.org) format. These recordings are newline-delimited JSON files that can be searched as text, and replayed from the recorder node's optional web UI or the `asciinema` CLI.
Session recording captures all terminal output, meaning any text that appears on the terminal screen during a Tailscale SSH session. This could include sensitive data. No keystrokes are captured.
When using binary protocols like older versions of `scp`, session recording will capture the transmitted binary data. This could include sensitive data.
## [Set up session recording for Tailscale SSH](#set-up-session-recording-for-tailscale-ssh)
### [Prerequisites](#prerequisites)
Session recording is only available for SSH connections over Tailscale SSH.
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles)
of a tailnet to set up session recording.
To enable session recording, you must:
* Ensure that Tailscale SSH is properly configured in your tailnet.
* Deploy a recorder node in your tailnet.
* Turn on session recording in your tailnet policy file by adding a `recorder:["tag:\<tag-name\>"]` field to each SSH policy entry. SSH sessions permitted by that stanza will be streamed to any recorder with the named tag.
The recorder node binary will run on any platform as a Docker container. Because the binary uses [`tsnet`](/blog/tsnet-virtual-private-services) to join your tailnet as a node, the Docker host does not need to be a member of your tailnet. The application listens on port `80` to receive session recordings, and provides an optional, built-in web application for viewing session recordings at port `443`.
### [Create a tag and auth key for session recorders](#create-a-tag-and-auth-key-for-session-recorders)
A recorder node must be associated with a tag. We recommend that you create a new [tag](/docs/features/tags) specifically to use with SSH session recording. You can do this by visiting the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console and defining an owner of the tag in access control policies.
```
`// Example tag for SSH session recorders
"tagOwners": {
"tag:session-recorder": [
"\<tag-owner\>",
],
}
`
```
Next, visit the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console to create an auth key. Assign the new tag you created to this auth key. If your tailnet has device approval enabled, use a pre-approved key. Be sure to copy this auth key to your clipboard.
On the host where you will deploy the recorder node container, set the `TS\_AUTHKEY` environment variable to the auth key. This is only necessary the first time you start the recorder application.
```
`export TS\_AUTHKEY=\<your-auth-key\>
`
```
### [Deploy a recorder node](#deploy-a-recorder-node)
The recorder is provided as a Docker container, and you can find it on [Tailscale's DockerHub profile](https://hub.docker.com/r/tailscale/tsrecorder/tags).
If you use Tailscale's Kubernetes operator, you can also deploy the recorder using the [`Recorder` Custom Resource](/docs/features/kubernetes-operator/how-to/tsrecorder).
```
`docker pull tailscale/tsrecorder:stable
`
```
To run the container and save recordings to the Docker host's filesystem:
```
`docker run --name tsrecorder --rm -it \\
-e TS\_AUTHKEY=$TS\_AUTHKEY \\
-v $HOME/tsrecorder:/data \\
tailscale/tsrecorder:stable \\
/tsrecorder --dst=/data/recordings --statedir=/data/state --ui
`
```
Required flags:
* `--dst` Specifies where recordings will be saved. Accepts a local file path or an S3 region URL. You can alternatively define the value as an environment variable, `TSRECORDER\_DST`.
Optional flags:
* `--hostname` Specifies a hostname to use for the recorder node. Defaults to `recorder`. You can alternatively define the value as an environment variable, `TSRECORDER\_HOSTNAME`.
* `--access-key` The AWS access key for an IAM user that can upload recordings to an S3 bucket. Required when using S3 as a storage backend if no IAM role is passed to the instance. You can alternatively define the secret access key as an environment variable, `AWS\_ACCESS\_KEY\_ID`.
* `--secret-key` The AWS secret access key for an IAM user that can upload recordings to an S3 bucket. Required when using S3 as a storage backend if no IAM role is passed to the instance. You can alternatively define the secret access key as an environment variable, `AWS\_SECRET\_ACCESS\_KEY`.
* `--bucket` The name of the S3 bucket where the recorder should upload recordings. Required when using S3 as a storage backend. You can alternatively define the secret access key as an environment variable, `TSRECORDER\_BUCKET`.
* `--state` Path to Tailscale state file, used to persist recorder state across container restarts. This can be a persistent volume or a Kubernetes [`Secret`](https://kubernetes.io/docs/concepts/configuration/secret/). You can alternatively define this value as an environment variable, `TS\_STATE`.
* To use a `Secret`, specify `kube:\<secret-name\>`. If set to use a `Secret` for state storage, the recorder must have permissions to read, update, and patch the `Secret`. If the `Secret` does not exist, the recorder will create it, and must have permissions to do so.
* If `--state` is unset, the state will be stored in the directory set by using `--statedir`.
* `--statedir` Specifies where the recorder should store its internal state. Accepts a local file path. If storage backend is filesystem, defaults to `\<recordings-destination\>/state`. Required unless statefile path is set. Alternatively can be set by using `TS\_STATE\_DIR` environment variable.
* `--ui` Enables the recorder container web UI for viewing recorded SSH sessions. Defaults to `false` if this flag is not present. You can alternatively define this value as an environment variable, `TSRECORDER\_UI`.
* If you deploy the recorder with the UI, you must have HTTPS enabled in your tailnet.
* If you enable the recorder container web UI, you should restrict access to port `443` on the recorder in your access control policies to prevent unauthorized members of your tailnet from viewing sensitive recordings.
### [Turn on session recording in your tailnet policy file](#turn-on-session-recording-in-your-tailnet-policy-file)
You can turn on session recording on a per-access rule basis for SSH [access rules](/docs/reference/syntax/policy-file#acls) in your tailnet policy file. For each rule, add a `recorder` field and specify the tag (`["tag:\<tag-name\>"]`) that is attached to the recorder node. If no `recorder` is specified, the session is not recorded.
By default, Tailscale will allow a Tailscale SSH session to connect when session recording is enabled for its SSH access rule even if the recorder nodes are unreachable. We refer to this as "failing open." You can adjust this behavior by adding the `enforceRecorder` field and setting it to `true`. This will deny and/or stop any Tailscale SSH session that should be recorded when the recorder nodes are unreachable. We refer to this behavior as "failing closed".
If an SSH connection is allowed by two or more SSH access rules, and the access rules specify different values for `enforceRecorder`, Tailscale will follow the behavior that is listed first in the tailnet policy file.
```
`{
"action": "check", // "accept" or "check"
"src": [list-of-sources],
"dst": [list-of-destinations],
"users": [list-of-ssh-users],
"recorder": ["tag:\<tag-name\>"], // optional field; specify the tag attached to your recorder node.
"enforceRecorder": false, // optional field; defaults to false; if session recorder node is unavailable, should the session be denied?
},
`
```
If `enforceRecorder` is `true` and the recorder node becomes unavailable after session recording is enabled in access control policies, Tailscale SSH sessions will be refused. Any active Tailscale SSH sessions will be terminated. To establish a Tailscale SSH session when the recorder node is unreachable and set to fail closed, remove the `recorder` field in access control policies.
## [Scope access to the recorder node and host](#scope-access-to-the-recorder-node-and-host)
Each Tailscale SSH server sends its SSH session recordings to the recorder node on port `80`. Tailscale will automatically ensure that traffic is permitted between Tailscale SSH servers and the recorder nodes to which they send sessions. You don't need to make any changes in access control policies to allow this.
If you enabled the recorder container web UI, you should be sure to allow access to port `443` for the appropriate users. Like before, use the associated tag to write this access rule.
Because the recorder stores the session recordings on the host disk, you should ensure that you have restricted access to these environments to the right users. We recommend scoping access to the recorder node and its host to the fewest number of users necessary, and recall that Owners, Admins, and Network admins will all have access to change access rules for this feature.
## [Disable session recording](#disable-session-recording)
You can disable Tailscale SSH session recording for specific SSH access rules, or for the whole tailnet.
### [Disable session recording for specific Tailscale SSH access rules](#disable-session-recording-for-specific-tailscale-ssh-access-rules)
To disable Tailscale SSH session recording for specific SSH access rules, remove the `recorder` line from the SSH access rule. SSH sessions that meet that rule will no longer be recorded.
Previous recordings will not be removed, and need to be deleted from the recorder node.
### [Disable session recording for all Tailscale SSH sessions](#disable-session-recording-for-all-tailscale-ssh-sessions)
To disable Tailscale SSH session recording for all Tailscale SSH sessions in the tailnet:
* Remove the `recorder` rule from all SSH access rules in the `ssh` section of your tailnet policy file
* Remove the recorder node from your tailnet. This can be done by removing the device from the [Machines](https://login.tailscale.com/admin/machines) tab of the admin console.
## [Session recordings](#session-recordings)
Recordings are stored at the directory you specified, as `/dir/\<stablenodeid\>/\<timestamp\>.cast`. The `\<stablenodeid\>` directory corresponds to the [stable node ID](/api#tag/devices) of the SSH servers being accessed.
If you run out of disk on the host, the recorder can no longer store sessions and will fail. This will cause open sessions to be terminated and new sessions to be refused. To fix this, remove the `recorder` field from the SSH access rule for your machine, access the node host, clear space or add storage, and replace the `recorder` field.
### [Reviewing recordings](#reviewing-recordings)
Tailscale SSH session recording captures each SSH session in `asciinema` format. This format can be played to review what occurred in a session.
If you are deploying the recorder with the built-in web UI turned on, you can review your recordings from a web browser at the URL. You can find your [tailnet DNS name](/docs/concepts/tailnet-name#tailnet-dns-name) in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
`https://{recorder-name}.{tailnet-dns-name}.ts.net`
From the CLI, you can access the recording data using the command:
```
`cat \<session-recording.cast\>
`
```
You can also watch recordings from the CLI with `asciinema` using the command:
```
`play \<session-recording.cast\>
`
```
To install `asciinema` locally, refer to the [installation docs](https://docs.asciinema.org/manual/cli/installation) for your platform.
You can also convert the recording to a GIF using [`agg`](https://github.com/asciinema/agg).
### [Analyzing recordings](#analyzing-recordings)
Recordings use the `asciinema` format, so they are newline-delimited JSON files that can be searched as text. For example, to search a recording for `sudo`:
```
`grep "sudo" \<session-recording.cast\>
`
```
### [Example recording](#example-recording)
Here's an example of a short session recording being replayed using `asciinema`:
A demo of the asciinema session recording playback.
This is how the same recording is represented in the `asciinema` file. It's easy to search this file for keywords or patterns that interest you.
```
`{"version":2,"width":203,"height":38,"timestamp":1679441819,"env":{"TERM":"xterm-256color"},"srcNode":"srcnode.ts.net","srcNodeID":"nguedK2CNTRL","srcNodeTags":null,"sshUser":"alice","localUser":"alice","srcNodeUserID":30585448562688899,"srcNodeUser":"alice@tailscale.com"}
[0.456997416,"o","Last login: Tue Mar 21 16:35:14 from 1.2.3.4\\r\\n"]
[0.552500666,"o","\\u001b[1m\\u001b[7m%\\u001b[27m\\u001b[1m\\u001b[0m \\r \\r"]
[0.557596708,"o","\\u001b]2;alice@laptop:\~\\u0007\\u001b]1;\~\\u0007"]
[0.567016125,"o","\\r\\u001b[0m\\u001b[27m\\u001b[24m\\u001b[J\\u001b[01;32m➜ \\u001b[36m\~\\u001b[00m \\u001b[K"]
[0.567112833,"o","\\u001b[?1h\\u001b=\\u001b[?2004h"]
[1.500827583,"o","e"]
[1.58455025,"o","\\u0008ec"]
[1.6682777500000001,"o","h"]
[1.7546742499999999,"o","o"]
[1.896455708,"o"," "]
[2.020248958,"o","h"]
[2.08789675,"o","i"]
[2.323278875,"o","\\u001b[?1l\\u001b\\u003e"]
[2.323438208,"o","\\u001b[?2004l\\r\\r\\n"]
[2.324209,"o","\\u001b]2;echo hi\\u0007"]
[2.324296291,"o","\\u001b]1;echo\\u0007hi\\r\\n\\u001b[1m\\u001b[7m%\\u001b[27m\\u001b[1m\\u001b[0m \\r \\r"]
[2.334692083,"o","\\u001b]2;alice@laptop:\~\\u0007\\u001b]1;\~\\u0007"]
[2.349814583,"o","\\r\\u001b[0m\\u001b[27m\\u001b[24m\\u001b[J\\u001b[01;32m➜ \\u001b[36m\~\\u001b[00m \\u001b[K"]
[2.349910875,"o","\\u001b[?1h\\u001b=\\u001b[?2004h"]
[2.89156075,"o","\\u001b[?2004l\\r\\r\\n"]
`
```
### [(Optional) Deploy multiple recorders for failover](#optional-deploy-multiple-recorders-for-failover)
If you are running Tailscale SSH session recording in a production environment, you may want to [deploy multiple recorders in a failover configuration](/docs/reference/multiple-recorder-nodes) to prevent unwanted downtime.
## [Limitations](#limitations)
* Recordings are only available for Tailscale SSH sessions, not other SSH sessions over Tailscale.
* Recordings are streamed from the destination node of the Tailscale SSH connection, and cannot be configured to be streamed from the source node.
* Session recording only records outputs from an SSH session, not inputs.
* All outputs are logged, including any sensitive data that might be in the output.
On this page
* [How it works](#how-it-works)
* [Set up session recording for Tailscale SSH](#set-up-session-recording-for-tailscale-ssh)
* [Prerequisites](#prerequisites)
* [Create a tag and auth key for session recorders](#create-a-tag-and-auth-key-for-session-recorders)
* [Deploy a recorder node](#deploy-a-recorder-node)
* [Turn on session recording in your tailnet policy file](#turn-on-session-recording-in-your-tailnet-policy-file)
* [Scope access to the recorder node and host](#scope-access-to-the-recorder-node-and-host)
* [Disable session recording](#disable-session-recording)
* [Disable session recording for specific Tailscale SSH access rules](#disable-session-recording-for-specific-tailscale-ssh-access-rules)
* [Disable session recording for all Tailscale SSH sessions](#disable-session-recording-for-all-tailscale-ssh-sessions)
* [Session recordings](#session-recordings)
* [Reviewing recordings](#reviewing-recordings)
* [Analyzing recordings](#analyzing-recordings)
* [Example recording](#example-recording)
* [(Optional) Deploy multiple recorders for failover](#optional-deploy-multiple-recorders-for-failover)
* [Limitations](#limitations)
Scroll to top