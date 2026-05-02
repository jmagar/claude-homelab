## `apprise`

Universal notification dispatcher (100+ services behind one URL scheme)

Category: `notifications`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `server.health` | Check whether the Apprise API is healthy | false | - | `HealthStatus` |
| `notify.send` | Send a stateless notification to the supplied URLs | false | `body: string`<br>`urls: json`<br>`title: string`<br>`type: string`<br>`format: string`<br>`tag: string`<br>`payload: json` | `void` |
| `notify.key.send` | Send a notification using a stored config key | false | `key*: string`<br>`body: string`<br>`title: string`<br>`type: string`<br>`format: string`<br>`tag: string`<br>`payload: json` | `void` |
| `config.add` | Persist a YAML/text Apprise config blob under a named key | false | `key*: string`<br>`config*: string`<br>`format: string` | `void` |
| `config.get` | Retrieve the stored config blob for a named key | false | `key*: string` | `{config: string}` |
| `config.delete` | Delete the stored config for a named key | true | `key*: string` | `void` |
| `config.urls` | List the notification URLs stored under a named key | false | `key*: string` | `Vec<{url: string, tags: Vec<string>}>` |
| `server.details` | Retrieve server details listing all loaded Apprise plugins | false | - | `json` |
