Tailscale Services configuration file · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale Services configuration file
Last validated: Jan 27, 2026
The Service configuration file defines how [Tailscale Services](/docs/features/tailscale-services) route traffic to on the devices hosting the resource associated with the Service. It contains a [`tailscale serve`](/docs/reference/tailscale-cli/serve) configuration in huJSON format. The configuration specifies Service endpoints, protocol mappings, and handler targets. It specifies which ports and protocols each Service accepts, where traffic routes, and whether to advertise Services to the Tailscale network (known as a tailnet). A Service host uses this configuration to advertise endpoints that match the Service resource definitions you've created in your tailnet.
The Service configuration file name does not matter as long as you use the correct name with the `tailscale serve` command to advertise a Service. The syntax uses `services` as the top-level field and contains an object with one or more Service definitions. Each Service definition contains an `endpoints` field that maps one or more port-protocol combinations to resources on the Service host (`\<local-target\>`).
```
`{
"version": "\<version\>",
"services": {
"svc:\<service-name\>": { // \<service-name\> is the name of the service (for example, `svc:web-server` or `svc:printer`)
"endpoints": { // Can contain one or more endpoint mappings
"\<protocol\>:\<port|port-range\>": "\<local-target\>" // Maps incoming traffic to a local target
}
}
}
}
`
```
Each endpoint mapping within the `endpoints` field uses the format `protocol:port` or `protocol:start-end` for incoming traffic. Currently, only the `tcp` protocol is supported. The `\<port\>` or `\<start-end\>` defines which ports the Service listens on.
The `\<local-target\>` defines where to forward traffic on the Service host and uses a URI-style syntax in the format `\<protocol\>://\<host:port\>`, where `\<protocol\>` is one of the following:
* `http`
* `https`
* `tcp`
This example configures an endpoint for a local web server exposed on port `443` over HTTPS:
```
`{
"version": "0.0.1",
"services": {
"svc:web-server": {
"endpoints": {
"tcp:443": "https://localhost:443"
}
}
}
}
`
```
The following table describes all available fields in the Service configuration file.
|Field|Level|Type|Required|Description|
|`version`|Root|String|Yes|The Service configuration file format version. Must be `"0.0.1"`.|
|`services`|Root|Object|Yes|The root object that contains one or more Services. Service names must use the format `svc:\<service-name\>`. Each key is a service name, and each value is a service configuration object, which contains one or more endpoint mappings.|
|`endpoints`|Service|Object|Yes|Contains one or more endpoint mappings for incoming traffic to local resources.|
|`advertised`|Service|Boolean|No|Whether the service can accept new connections. Defaults to `true` if not specified.|
Scroll to top