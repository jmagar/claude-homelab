Send Tailscale SSH session recordings to S3 · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Send Tailscale SSH session recordings to S3
Last validated: Jan 9, 2026
By default, Tailscale SSH session recording will save recordings to the Docker host's filesystem. While this is a fast and straightforward way to deploy session recorders, you may want to use a more scalable and resilient storage solution like Amazon S3.
Tailscale SSH session recording is currently [in beta](/docs/reference/tailscale-release-stages#beta). To try it, follow the steps below to enable it for your network using Tailscale v1.40.1 or later.
Tailscale SSH session recording is available for [the Personal and Enterprise plans](/pricing).
You can configure session recorder nodes to send recordings to Amazon S3 or another S3-compatible object storage service such as MinIO, Wasabi, Google Cloud Storage, or [Cloudflare R2](#cloudflare-r2-compatibility).
If you deploy recorder nodes with the built-in web UI enabled, users can access recordings stored in S3 in the web UI.
## [Configure S3 as storage for session recording nodes](#configure-s3-as-storage-for-session-recording-nodes)
### [Prerequisites](#prerequisites)
To configure S3 as the backend storage for session recording, you must have access to an AWS account with permission to create:
* S3 buckets
* IAM policies
and *either*
* IAM users
* IAM user access keys
or
* an IAM role
### [Create an IAM policy and user/role](#create-an-iam-policy-and-userrole)
[Create the following IAM policy](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_create-console.html) in your AWS account. Replace `\<bucket-name\>` with the name of your S3 bucket on both lines of the `Resource` section.
```
`{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Action": [
"s3:PutObject",
"s3:GetBucketLocation",
"s3:GetObject",
"s3:ListBucket"
],
"Resource": [
"arn:aws:s3:::\<bucket-name\>/\*",
"arn:aws:s3:::\<bucket-name\>"
]
}
]
}
`
```
If you are running the recorder nodes without the built-in web UI, you can omit `s3:GetObject` and `s3:ListBucket` from this policy. `s3:PutObject` and `s3:GetBucketLocation` are always required.
If you plan to use IAM access keys for permission to write to the bucket, assign this policy a new IAM user, and [create an access key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey) for this user. If you plan to use an IAM role, [create an IAM role](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create.html) and attach the previously defined policy to the role.
### [Deploy the recorder node](#deploy-the-recorder-node)
Deploying a recorder node with S3 as the storage backend is similar to the standard filesystem deployment. You'll need to add your IAM credentials or role, and the S3 bucket information.
#### [Deploy with AWS access keys](#deploy-with-aws-access-keys)
For AWS access keys, specify the AWS access key and secret key:
```
`docker run --name tsrecorder --rm -it \\
-e TS\_AUTHKEY=$TS\_AUTHKEY \\
-e AWS\_ACCESS\_KEY=$AWS\_ACCESS\_KEY \\
-e AWS\_SECRET\_ACCESS\_KEY=$AWS\_SECRET\_ACCESS\_KEY \\
-v $HOME/tsrecorder:/data \\
tailscale/tsrecorder:stable \\
/tsrecorder --dst='s3://s3.us-east-2.amazonaws.com' --statedir=/data/state \\
--bucket=$S3\_BUCKET\_NAME --ui \\
`
```
#### [Deploy with attached IAM roles](#deploy-with-attached-iam-roles)
For IAM roles, the credentials are retrieved from the AWS metadata service. You'll need to assign an IAM role (and if using an EC2 instance, an [IAM instance profile](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)) to the container.
```
`docker run --name tsrecorder --rm -it \\
-e TS\_AUTHKEY=$TS\_AUTHKEY \\
-v $HOME/tsrecorder:/data \\
tailscale/tsrecorder:stable \\
/tsrecorder --dst='s3://s3.us-east-2.amazonaws.com' --statedir=/data/state \\
--bucket=$S3\_BUCKET\_NAME --ui \\
`
```
If the instance you're provisioning the Docker container is using [Instance Metadata v2](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/configuring-instance-metadata-service.html), the default `PUT` response hop limit is 1 (that is, from the EC2 instance to the metadata service). For IAM instance profiles to work with Docker, you must first configure the limit to account for the extra hop through the EC2 instance, [so 2 at minimum](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/configuring-IMDS-existing-instances.html#modify-PUT-response-hop-limit).
Required flags:
* `--dst` Specifies where recordings will be saved. Accepts a local file path or an S3 region URL. The value must begin with `s3://` if you intend to use S3 storage for storing the recordings. You can alternatively define the value as an environment variable, `TSRECORDER\_DST`.
* `--statedir` Specifies where the recorder should store its internal state. Accepts a local file path.
Optional flags:
* `--hostname` Specifies a hostname to use for the recorder node. Defaults to `recorder`. You can alternatively define the value as an environment variable, `TSRECORDER\_HOSTNAME`.
* `--access-key` The AWS access key for an IAM user that can upload recordings to an S3 bucket. Required when using S3 as a storage backend if no IAM role is passed to the instance. You can alternatively define the secret access key as an environment variable, `AWS\_ACCESS\_KEY\_ID`.
* `--secret-key` The AWS secret access key for an IAM user that can upload recordings to an S3 bucket. Required when using S3 as a storage backend if no IAM role is passed to the instance. You can alternatively define the secret access key as an environment variable, `AWS\_SECRET\_ACCESS\_KEY`.
* `--bucket` The name of the S3 bucket where the recorder should upload recordings. Required when using S3 as a storage backend. You can alternatively define the secret access key as an environment variable, `TSRECORDER\_BUCKET`.
* `--state` Path to Tailscale state file, used to persist recorder state across container restarts. This can be a persistent volume or a Kubernetes [`Secret`](https://kubernetes.io/docs/concepts/configuration/secret/). You can alternatively define this value as an environment variable, `TS\_STATE`.
* To use a `Secret`, specify `kube:\<secret-name\>`. If set to use a `Secret` for state storage, the recorder must have permissions to read, update, and patch the `Secret`. If the `Secret` does not exist, the recorder will create it, and must have permissions to do so.
* If `--state` is unset, the state will be stored in the directory set using `--statedir`.
* `--ui` Enables the recorder container web UI for viewing recorded SSH sessions. Defaults to `false` if this flag is not present. You can alternatively define this value as an environment variable, `TSRECORDER\_UI`.
* If you deploy the recorder with the UI, you must have HTTPS enabled in your tailnet.
* If you enable the recorder container web UI, you should restrict access to port `443` on the recorder in your access control policies to prevent unauthorized members of your tailnet from viewing sensitive recordings.
There are multiple ways to define the AWS IAM credentials needed to connect to an S3 bucket. In order of precedence, they are:
1. Specify `--access-key` and `--secret-key`
2. Set `AWS\_ACCESS\_KEY\_ID` and `AWS\_SECRET\_ACCESS\_KEY`
3. Specify none of the above, and be on an EC2 instance with the right permissions.
#### [Cloudflare R2 Compatibility](#cloudflare-r2-compatibility)
Cloudflare R2 Storage provides an [S3-compatible API](https://developers.cloudflare.com/r2/api/s3/api); however, an additional setting is needed due to differences in their implementation. To use Cloudflare R2 as the storage service for session recordings set the environment variable `S3\_SEND\_CONTENT\_MD5` to `true` in addition to any environment variables you are already passing.
```
`S3\_SEND\_CONTENT\_MD5=true
`
```
On this page
* [Configure S3 as storage for session recording nodes](#configure-s3-as-storage-for-session-recording-nodes)
* [Prerequisites](#prerequisites)
* [Create an IAM policy and user/role](#create-an-iam-policy-and-userrole)
* [Deploy the recorder node](#deploy-the-recorder-node)
* [Deploy with AWS access keys](#deploy-with-aws-access-keys)
* [Deploy with attached IAM roles](#deploy-with-attached-iam-roles)
* [Cloudflare R2 Compatibility](#cloudflare-r2-compatibility)
Scroll to top