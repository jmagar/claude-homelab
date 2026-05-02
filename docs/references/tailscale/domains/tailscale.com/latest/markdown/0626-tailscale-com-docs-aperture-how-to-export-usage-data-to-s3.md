Export usage data to S3 · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Export usage data to S3
Last validated: Apr 17, 2026
Aperture by Tailscale is currently [in beta](/docs/reference/tailscale-release-stages#beta).
The Aperture [dashboard](/docs/aperture/reference/dashboard) shows recent usage data, but it is not designed for long-term retention. You can configure a [retention policy](/docs/aperture/configuration#database) to control how long Aperture keeps capture data locally. Exporting usage data to S3-compatible storage gives you a durable record of every LLM session for compliance auditing, cost analysis, and custom reporting.
When `require\_export` is enabled in the [retention configuration](/docs/aperture/configuration#database), Aperture only purges local capture data after it has been successfully exported to S3.
Aperture's S3 exporter periodically writes usage records to the bucket you configure as CBOR-encoded, zstd-compressed files. It supports Amazon S3, Google Cloud Storage, MinIO, Backblaze B2, and other S3-compatible services.
## [Prerequisites](#prerequisites)
Before you begin, ensure you have the following:
* An [Aperture instance](/docs/aperture/get-started) with at least one provider configured.
* Admin access to the [Aperture configuration](/docs/aperture/configuration).
* An S3-compatible bucket with write access. You need the bucket name, region, and credentials (access key ID and secret).
## [Configure the S3 exporter](#configure-the-s3-exporter)
Open the **Settings** page in the [Aperture dashboard](/docs/aperture/reference/dashboard) and add an `exporters` section to your configuration:
```
`"exporters": {
"s3": {
"bucket\_name": "aperture-exports",
"region": "us-east-1",
"access\_key\_id": "\<aws-access-key-id\>",
"access\_secret": "\<aws-secret-access-key\>"
}
}
`
```
Setting `bucket\_name` to a non-empty value enables the S3 exporter. Aperture begins exporting usage records automatically on the next export cycle.
### [Use a non-Amazon S3-compatible service](#use-a-non-amazon-s3-compatible-service)
Aperture also supports S3-compatible storage services beyond AWS. For Google Cloud Storage, MinIO, Backblaze B2, or any service with an S3-compatible API, you can use the same configuration with the addition of an `endpoint` field.
For services other than Amazon S3 (such as Google Cloud Storage, MinIO, or Backblaze B2), add the `endpoint` field with the service's S3-compatible API URL:
```
`"exporters": {
"s3": {
"endpoint": "https://storage.googleapis.com",
"bucket\_name": "aperture-exports",
"region": "us-east-1",
"access\_key\_id": "\<access-key-id\>",
"access\_secret": "\<secret-key\>"
}
}
`
```
The `region` field is required even for non-AWS services because the AWS SDK validates it.
### [Customize export behavior](#customize-export-behavior)
You can adjust how frequently Aperture exports data and how many records it includes per batch using the `every` and `limit` fields:
```
`"exporters": {
"s3": {
"bucket\_name": "aperture-exports",
"region": "us-east-1",
"access\_key\_id": "\<aws-access-key-id\>",
"access\_secret": "\<aws-secret-access-key\>",
"prefix": "prod",
"every": 1800,
"limit": 2000
}
}
`
```
The following table summarizes these fields:
|Field|Default|Description|
|`prefix`|`""`|(Optional) Path prefix for S3 objects. Must not end with `/`.|
|`every`|`3600`|Seconds between export cycles. The example above exports every 30 minutes.|
|`limit`|`1000`|Maximum records per export batch. Aperture caps this at `10000`.|
## [Export file format](#export-file-format)
Aperture exports usage data as [CBOR](https://cbor.io/)-encoded, [zstd](https://facebook.github.io/zstd/)-compressed files. CBOR is a binary encoding, similar to JSON, that supports binary data such as images and audio from multimodal LLM requests.
Each export file is named `ts-aperture-export-\<unix-timestamp\>.cbor.zstd` and contains a sequence of CBOR-encoded records. Each record includes the following top-level fields:
|Field|Type|Description|
|`id`|integer|Record identifier.|
|`ver`|integer|Schema version. `2`.|
|`timestamp`|timestamp|When the LLM request occurred.|
|`identity`|object|User and node identification: login name, stable node ID, and tags.|
|`model`|string|LLM model name.|
|`api\_type`|string|API type, such as `oai\_completions` or `ant\_messages`.|
|`usage`|object|Token counts: input, output, cached, and reasoning tokens.|
|`estimated\_cost`|object|Estimated dollar cost of the request. Omitted if unavailable.|
|`duration\_ms`|integer|Request duration in milliseconds.|
|`capture\_id`|string|Unique identifier for this capture.|
|`session\_id`|string|Session grouping identifier.|
|`path`|string|API endpoint path.|
|`status\_code`|integer|HTTP response status code.|
|`capture`|object|Full request and response data, including headers, processed JSON bodies, tool use data, and, optionally, raw binary request and response bodies.|
To read export files, decompress with a zstd library, then decode the CBOR sequence. Common libraries include `cbor2` and `zstandard` for Python, `fxamacker/cbor` and `klauspost/compress` for Go, and the `zstd` CLI tool for decompression.
## [Verify the export](#verify-the-export)
After saving the configuration, wait for the next export cycle (based on your `every` setting) and check the S3 bucket for new objects. The objects appear under the configured prefix (if set) with the `.cbor.zstd` file extension.
If no objects appear after the expected interval, check the Aperture server logs for S3-related errors such as authentication failures or permission issues.
## [Next steps](#next-steps)
* [Build a custom webhook](/docs/aperture/how-to/build-custom-webhook) to send real-time event data to your own services.
* Review the [Aperture dashboard reference](/docs/aperture/reference/dashboard) for details on the built-in usage views.
* Refer to the [exporters configuration reference](/docs/aperture/configuration#exporters) for the complete field reference.
On this page
* [Prerequisites](#prerequisites)
* [Configure the S3 exporter](#configure-the-s3-exporter)
* [Use a non-Amazon S3-compatible service](#use-a-non-amazon-s3-compatible-service)
* [Customize export behavior](#customize-export-behavior)
* [Export file format](#export-file-format)
* [Verify the export](#verify-the-export)
* [Next steps](#next-steps)
Scroll to top