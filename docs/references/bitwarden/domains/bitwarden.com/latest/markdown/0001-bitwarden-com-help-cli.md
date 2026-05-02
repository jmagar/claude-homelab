Password Manager CLI | Bitwarden
DocsCourses

Password ManagerDeveloper ToolsCLI
[Docs](/help/)[Courses](/help/courses/)
Password ManagerDeveloper ToolsCLI
Contact support
Copy for LLM
# Password Manager CLI
The Bitwarden command-line interface (CLI) is a powerful, fully-featured tool for accessing and managing your vault. Most features that you find in other Bitwarden client applications (desktop, browser extension, etc.) are available from the CLI.
> Bitwarden CLI
The Bitwarden CLI is self-documented. From the command line, learn about the available commands using:
```
BashCopy
`bw --help`
```
Or, pass `--help `as an option on any `bw `command to see available options and examples:
```
BashCopy
`bw list --help
bw move --help`
```
Most information you'll need can be accessed using `--help`, however this article replicates all that information and goes into greater depth on some topics.
[](#download-and-install)## Download and install
The CLI can be used cross-platform on Windows, macOS, and Linux distributions. To download and install the Bitwarden CLI:
##### note
For arm64 devices, install the CLI using `npm`.
Native ExecutableNPMChocolateySnapFlatpak
Natively packaged versions of the CLI are available for each platform and have no dependencies. Download using one of these links:
* [Windows x64](https://bitwarden.com/download/?app=cli&amp;platform=windows)
* [macOS x64](https://bitwarden.com/download/?app=cli&amp;platform=macos)
* [Linux x64](https://bitwarden.com/download/?app=cli&amp;platform=linux)
Note that, when using the downloaded native executable, you'll need to add the executable to your PATH or else run commands from the directory the file is downloaded to.
##### tip
In Linux and UNIX systems, you might get a `Permission denied` message. If you do, grant permission by running:
```
BashCopy
`chmod +x \</path/to/executable\>`
```
For each bundle of the Password Manager CLI available on GitHub, there is an OSS (e.g. `bw-oss-windows-2024.12.0.zip`) and non-OSS build (e.g. `bw-windows-2024.12.0.zip`). The non-OSS version is the default package distributed on distribution platforms and includes features under a non-OSS license, such as [device approval](#device-approval) commands, that the OSS version lacks.
##### tip
The Bitwarden Password Manager CLI build pipeline creates SHA-256 checksum files that are available on GitHub. [Learn how to validate checksums for the CLI](/help/security-faqs/#tab-cli-4iwx6mhPS3Bgu3eLpNthUw/).
[](#log-in)## Log in
Before logging in, make sure your CLI is connected to the correct server (for example, [EU cloud](/help/server-geographies/) or self-hosted) using the config command ([learn more](#config)). There are three methods for logging in to the Bitwarden CLI using the `login` command, each of which is suited to different situations. Please review the following options to determine which method to use:
* [Using email and master password](#using-email-and-password)
* [Using an API key](#using-an-api-key)
* [Using SSO](#using-sso)
##### tip
No matter which option you use, a master password will be required to `unlock` the client in order to access data with a [session key](#unlock). The [email and master password](#using-email-and-password) option will authenticate your identity and generate a session key simultaneously, however the [API key](#using-an-api-key) or [SSO](#using-sso) will require you subsequent use of the `unlock` command to generate a session key if you will be working with data directly.
Users who [join an organization using trusted devices](/help/about-trusted-devices/#impact-on-master-passwords) will not be able to access data using the CLI. There are, however, a few commands that do not require decrypted data and therefore can be used without a master password, including `config`, `encode`, `generate`, `update`, and `status`.
[](#using-email-and-password)### Using email and password
Logging in with email and password is **recommended for interactive sessions**. To log in with email and password:
```
BashCopy
`bw login`
```
This will initiate a prompt for your **Email Address**, **Master Password**, and ([if enabled](/help/setup-two-step-login/)) at **Two-step Login code**. The CLI currently supports two-step login via [authenticator](/help/setup-two-step-login-authenticator/), [email](/help/setup-two-step-login-email/), or [Yubikey](/help/setup-two-step-login-yubikey/).
You *can* string these factors together into a single command as in the following example, however this isn't recommended for security reasons:
```
BashCopy
`bw login [email] [password] --method \<method\> --code \<code\>`
```
See [Enums](#enums) for two-step login `\<method\>` values.
##### tip
Getting prompted for additional authentication or getting a `Your authentication request appears to be coming from a bot.` error? Use your API Key `client\_secret` to answer the authentication challenge. [Learn more](/help/cli-auth-challenges/).
[](#using-an-api-key)### Using an API key
Using the [personal API key](/help/personal-api-key/) for CLI authentication is suitable for automated workflows, for providing access to an external application, or if your account uses a 2FA method not supported by the CLI (FIDO2 or Duo). The following command will prompt you for your personal `client\_id` and `client\_secret`:
```
BashCopy
`bw login --apikey`
```
While there are some commands that do not require your data be decrypted, to use many of the CLI commands you will need to subsequently decrypt your data using the `unlock` command ([learn more](#unlock)), unless you're a member of an organization using [Key Connector](/help/about-key-connector/). Your API key is **not a substitute for your master password.**
##### tip
If your organization [requires SSO](/help/policies/#single-sign-on-authentication), you can still use `--apikey` to log in to the CLI.
#### Using API key environment variables
In scenarios where automated work is being done with the Bitwarden CLI, you can save environment variables to prevent the need for manual intervention at authentication.
``
|
**Environment variable name**
|
**Required value**
|
|
BW\_CLIENTID
|
`client\_id`
|
|
BW\_CLIENTSECRET
|
`client\_secret`
|
[](#using-sso)### Using SSO
Logging in with [SSO](/help/about-sso/) is recommended if an organization requires SSO authentication. To log in with SSO:
```
BashCopy
`bw login --sso`
```
This will initiate the [SSO authentication flow](/help/using-sso/) in your web browser. Once your session is authenticated, you can use the `unlock` command. [Learn more](#unlock).
##### tip
If your organization [requires SSO](/help/policies/#single-sign-on-authentication), you may alternatively use` --apikey` to log in to the CLI.
[](#log-in-to-multiple-accounts)### Log in to multiple accounts
Like using [account switching](/help/account-switching/) on other Bitwarden apps, the CLI has the ability to log in to multiple accounts simultaneously using the `BITWARDENCLI\_APPDATA\_DIR` environment variable pointing to the location of a `bw` configuration file, usually named `data.json`. You can, for example, set aliases in a `.bashrc` profile for two separate configurations:
```
BashCopy
`alias bw-personal="BITWARDENCLI\_APPDATA\_DIR=\~/.config/Bitwarden\\ CLI\\ Personal /path/to/bw $@"
alias bw-work="BITWARDENCLI\_APPDATA\_DIR=\~/.config/Bitwarden\\ CLI\\ Work /path/to/bw $@"`
```
Using this example, you could then use login to two accounts by running first `source /path/to/.bashrc`, followed by `bw-personal login` and `bw-work login`.
[](#unlock)## Unlock
Using an [API key](#using-an-api-key) or [SSO](#using-sso) to log in will require you to follow-up the `login` command with an explicit `bw unlock` if you'll be working with vault data directly.
Unlocking your vault generates a **session key** which acts as a decryption key used to interact with data in your vault. The [session key must be used](#using-a-session-key) to perform any command that touches vault data (for example, `list`, `get`, `edit`). Session keys are valid until invalidated using `bw lock` or `bw logout`, however they will not persist if you open a new terminal window. Generate a new session key at any time using:
```
BashCopy
`bw unlock`
```
When you're finished, always end your session using the `bw lock` command.
[](#unlock-options)### Unlock options
You can use the `--passwordenv \<passwordenv\>` or `--passwordfile \<passwordfile\>` options with `bw unlock` to retrieve your master password rather than enter it manually, for example:
1. The following will look for an environment variable `BW\_PASSWORD`. If `BW\_PASSWORD` is non-empty and has correct values, the CLI will successfully unlock and return a session key:
```
BashCopy
`bw unlock --passwordenv BW\_PASSWORD`
```
2. The following will look for the file `\~Users/Me/Documents/mp.txt` (which must have your master password as the first line). If the file is non-empty and has a correct value, the CLI will successfully unlock and return a session key:
```
BashCopy
`bw unlock --passwordfile \~/Users/Me/Documents/mp.txt`
```
##### warning
If you use the `--passwordfile` option, protect your password file by locking access down to only the user who needs to run `bw unlock` and only providing read access to that user.
[](#using-a-session-key)### Using a session key
When you unlock your vault using `bw login` with [email and password](#using-email-and-password) or `bw unlock`, the CLI will return both an `export BW\_SESSION` (Bash) and `env:BW\_SESSION` (PowerShell) command, including your session key. Copy and paste the relevant entry to save the required environment variable.
With the BW\_SESSION environment variable set, `bw` commands will reference that variable and can be run cleanly, for example:
```
BashCopy
`export BW\_SESSION="5PBYGU+5yt3RHcCjoeJKx/wByU34vokGRZjXpSH7Ylo8w=="
bw list items`
```
Alternatively, if you don't set the environment variable, you can pass the session key as an option with each `bw` command:
```
BashCopy
`bw list items --session "5PBYGU+5yt3RHcCjoeJKx/wByU34vokGRZjXpSH7Ylo8w=="`
```
##### tip
When you're finished, always end your session using the `bw lock` or `bw logout` commands. This will invalidate the active session key.
[](#core-commands)## Core Commands
[](#create)### create
The `create` command creates a new object (`item`, `attachment`, and more) in your vault:
```
BashCopy
`bw create (item|attachment|folder|org-collection) \<encodedJson\> [options]`
```
The `create` command takes encoded JSON. A typical workflow for creating an object might look something like:
1. Use the `get template` command (see [get core commands](#get) for details) to output the appropriate JSON template for the object type.
2. Use a [command-line JSON processor like jq](https://stedolan.github.io/jq/) to manipulate the outputted template as required.
3. Use the `encode` command (see [details](#encode)) to encode the manipulated JSON.
4. Use the `create` command to create an object from the encoded JSON.
For example:
```
BashCopy
`bw get template folder | jq '.name="My First Folder"' | bw encode | bw create folder`
```
or
```
BashCopy
`bw get template item | jq ".name=\\"My Login Item\\" | .login=$(bw get template item.login | jq '.username="jdoe" | .password="myp@ssword123"')" | bw encode | bw create item`
```
Upon successful creation, the newly created object will be returned as JSON.
#### create other item types
The create command defaults to creating a login item, but you can use a[ command-line JSON processor like jq](https://stedolan.github.io/jq/) to change a `.type=` attribute to create other [item types](/help/managing-items/):
|
**Name**
|
**Value**
|
|
Login
|
`.type=1`
|
|
Secure note
|
`.type=2`
|
|
Card
|
`.type=3`
|
|
Identity
|
`.type=4`
|
|
SSH Key
|
.`type=5`
|
For example, the following command will create a secure note:
```
BashCopy
`bw get template item | jq '.type = 2 | .secureNote.type = 0 | .notes = "Contents of my Secure Note." | .name = "My Secure Note"' | bw encode | bw create item`
```
##### note
Notice in the above example that Secure Notes require a sub-template (`.secureNote.type`). You can view item type sub-templates using`bw get template`(see[here](#get-template)for details).
#### create attachment
The`create attachment`command attaches a file to an**existing**item.
Unlike other`create`operations, you don’t need to use a JSON processor or`encode`to create an attachment. Instead, use the`--file`option to specify the file to attach and the`--itemid`option to specify the item to attach it to. For example:
```
BashCopy
`bw create attachment --file ./path/to/file --itemid 16b15b89-65b3-4639-ad2a-95052a6d8f66`
```
##### tip
If you don’t know the exact`itemid`you want to use, use`bw get item \<search-term\>`to return the item (see[details](#get)), including its`id`.
[](#get)### get
The`get`command retrieves a single object (`item`,`username`,`password`, and more) from your vault:
```
BashCopy
`bw get (item|username|password|uri|totp|exposed|attachment|folder|collection|organization|org-collection|template|fingerprint) \<id\> [options]`
```
The`get`command takes an item`id`or string for its argument. If you use a string (for example, anything other than an exact`id`),`get`will search your vault objects for one with a value that matches. For example, the following command would return a Github password:
```
BashCopy
`bw get password Github`
```
##### note
The`get`command can**only return one result**, so you should use specific search terms. If multiple results are found, the CLI will return an error.
#### get attachment
The`get attachment`command downloads a file attachment:
```
BashCopy
`bw get attachment \<filename\> --itemid \<id\>`
```
The`get attachment`command takes a`filename`and**exact**`id`. By default,`get attachment`will download the attachment to the current working directory. You can use the`--output`option to specify a different output directory, for example:
```
BashCopy
`bw get attachment photo.png --itemid 99ee88d2-6046-4ea7-92c2-acac464b1412 --output /Users/myaccount/Pictures/`
```
##### note
When using`--output`, the path**must**end a forward slash (`/`) to specify a directory or a filename (`/Users/myaccount/Pictures/photo.png`).
#### get notes
The`get notes`command retrieves the note for any vault item:
```
BashCopy
`bw get notes \<id\>`
```
The `get notes`command takes an exact item`id`or string. If you use a string (for example, anything other than an exact`id`),`get notes`will search your vault objects for one with a value that matches. For example, the following command would return a Github note:
```
BashCopy
`bw get notes Github`
```
#### get template
The`get template`command returns the expected JSON formatting for an object (`item`,`item.field`,`item.login`, and more):
```
BashCopy
`bw get template (item|item.field|item.login|item.login.uri|item.card|item.identity|item.securenote|folder|collection|item-collections|org-collection)`
```
While youcanuse`get template`to output the format to your screen, the most common use-case is to pipe the output into a`bw create`operation, using a[command-line JSON processor like jq](https://stedolan.github.io/jq/)and`bw encode`to manipulate the values retrieved from the template, for example:
```
BashCopy
`bw get template folder | jq '.name="My First Folder"' | bw encode | bw create folder`
```
##### note
Any`item.xxx`template should be used as a sub-object to an`item`template, for example:
```
BashCopy
`bw get template item | jq ".name=\\"My Login Item\\" | .login=$(bw get template item.login | jq '.username="jdoe" | .password="myp@ssword123"')" | bw encode | bw create item`
```
#### get fingerprint
Retrieve the `fingerprint` phrase of a user. You may specify `userId` directly, or use the shortcut `me` to get your own fingerprint phrase:
```
Plain TextCopy
`bw get fingerprint \<userId\>`
```
```
Plain TextCopy
`bw get fingerprint me`
```
[](#edit)### edit
The`edit`command edits an object (`item`,`item-collections`, etc.) in your vault:
```
BashCopy
`bw edit (item|item-collections|folder|org-collection) \<id\> [encodedJson] [options]`
```
The`edit`command takes an**exact**`id`(the object to edit) and encoded JSON (edits to be made). A typical workflow might look something like:
1. Use the `get` command (see [details](#get)) to output the object to edit.
2. Use a[command-line JSON processor like jq](https://stedolan.github.io/jq/) to manipulate the outputted object as required.
3. Use the `encode` command (see [details](#encode)) to encode the manipulated JSON.
4. Use the `edit` command (including the object `id`) to edit the object.
For example, to edit the password of a login item:
```
BashCopy
`bw get item 7ac9cae8-5067-4faf-b6ab-acfd00e2c328 | jq '.login.password="newp@ssw0rd"' | bw encode | bw edit item 7ac9cae8-5067-4faf-b6ab-acfd00e2c328`
```
Or, to edit the collection(s) an item is in:
```
BashCopy
`echo '["5c926f4f-de9c-449b-8d5f-aec1011c48f6"]' | bw encode | bw edit item-collections 28399a57-73a0-45a3-80f8-aec1011c48f6 --organizationid 4016326f-98b6-42ff-b9fc-ac63014988f5`
```
Or, to edit a collection:
```
BashCopy
`bw get org-collection ee9f9dc2-ec29-4b7f-9afb-aac8010631a1 --organizationid 4016326f-98b6-42ff-b9fc-ac63014988f5 | jq '.name="My Collection"' | bw encode | bw edit org-collection ee9f9dc2-ec29-4b7f-9afb-aac8010631a1 --organizationid 4016326f-98b6-42ff-b9fc-ac63014988f5`
```
The`edit`command will perform a**replace**operation on the object. Once completed, the updated object will be returned as JSON.
[](#list)### list
The`list`command retrieves an array of objects (`items`,`folders`,`collections`, and more) from your vault:
```
BashCopy
`bw list (items|folders|collections|organizations|org-collections|org-members) [options]`
```
You can add **filters** to the `list` command to narrow down what's returned:
* `--url \<url\>`
* `--folderid \<folderid\>`
* `--collectionid \<collectionid\>`
* `--organizationid \<organizationid\>`
* `--trash`
Any filter will accept`null`or`notnull`. Combining multiple filters in one command will perform an OR operation, for example:
```
BashCopy
`bw list items --folderid null --collectionid null`
```
This command will return items that aren'tin a folderorcollection.
Additionally, you can**search**for specific objects using`--search \<search-term\>`. Combining filter and search in one command will perform an AND operation, like:
```
BashCopy
`bw list items --search github --folderid 9742101e-68b8-4a07-b5b1-9578b5f88e6f`
```
This command will search for items with the string`github`in the specified folder.
[](#delete)### delete
The`delete`command deletes an object from your vault.`delete`takes**only an exact**`id`for its argument.
```
BashCopy
`bw delete (item|attachment|folder|org-collection) \<id\> [options]`
```
By default,`delete`will send an item to the[Trash](/help/managing-items/#items-in-the-trash), where it will remain for 30 days. You can permanently delete an item using the`-p, --permanent`option.
```
BashCopy
`bw delete item 7063feab-4b10-472e-b64c-785e2b870b92 --permanent`
```
To delete an`org-collection`, you'll also need to specify`--organizationid \<organizationid\>`. See[Organization IDs](#organization-ids).
##### warning
While items that are deleted using`delete`can be recovered using the`restore`command for up to 30 days (see[details](#restore)), items that are deleted using`delete --permanent`**are completely removed and irrecoverable.**
[](#restore)### restore
The`restore`command restores a deleted object from your trash.`restore`takes**only an exact**`id`for its argument.
```
BashCopy
`bw restore (item) \<id\> [options]`
```
For example:
```
BashCopy
`bw restore item 7063feab-4b10-472e-b64c-785e2b870b92`
```
[](#send)### send
The`send`command creates a[Bitwarden Send](/help/about-send/)object for ephemeral sharing. This section will detail simple`send`operations, however send is a highly flexible tool and we recommend referring to the dedicated article on[Send from CLI](/help/send-cli/).
To create a simple text Send:
```
BashCopy
`bw send -n "My First Send" -d 7 --hidden "The contents of my first text Send."`
```
To create a simple file Send:
```
BashCopy
`bw send -n "A Sensitive File" -d 14 -f /Users/my\_account/Documents/sensitive\_file.pdf`
```
[](#receive)### receive
The`receive`command accesses a[Bitwarden Send](/help/about-send/)object. To receive a Send object:
```
BashCopy
`bw receive --password passwordforaccess https://vault.bitwarden.com/#/send/yawoill8rk6VM6zCATXv2A/9WN8wD-hzsDJjfnXLeNc2Q`
```
[](#organizations-commands)## Organizations commands
[](#organization-ids)### Organization IDs
Accessing an organization from the CLI requires knowledge of an ID for your organization, as well as IDs for individual[members](/help/managing-users/)and[collections](/help/about-collections/).
Retrieve this information directly from the CLI using`bw list`, for example:
```
BashCopy
`bw list organizations
bw list org-members --organizationid 4016326f-98b6-42ff-b9fc-ac63014988f5
bw list org-collections --organizationid 4016326f-98b6-42ff-b9fc-ac63014988f5`
```
##### tip
You can`bw list`both`collections`and`org-collections`. The`bw list collections`command will list allcollections, agnostic of which organization they belong to.`bw list org-collections`will listonlycollections that belong to the organization specified using`--organizationid`.
[](#move)### move
##### note
**August 2021**: The`share`command has been changed to`move`.[Find out more](/help/releasenotes/).
The`move`command transfers a vault item[to an organization](/help/sharing/):
```
BashCopy
`bw move \<itemid\> \<organizationid\> [encodedJson]`
```
The`move`command requires you to`encode`a collection ID, and takes an**exact**`id`(the object to share) and an**exact**`organizationid`(the organization to share the object to). For example:
```
BashCopy
`echo '["bq209461-4129-4b8d-b760-acd401474va2"]' | bw encode | bw move ed42f44c-f81f-48de-a123-ad01013132ca dfghbc921-04eb-43a7-84b1-ac74013bqb2e`
```
Once completed, the updated item will be returned.
[](#confirm)### confirm
The`confirm`command confirms[invited members](/help/managing-users/#confirm-invited-users)to your organization who have accepted their invitation:
##### warning
Before administering the `confirm` command, it is strongly advised that administrators validate the legitimacy of a request by ensuring that the fingerprint phrase self-reported by the user matches the fingerprint phrase associated with the user you expect to be confirmed:
* From the Admin Console, you can view a user's associated fingerprint phrase [during the confirm step](/help/managing-users/#confirm).
* From the CLI, you can view a user's associated fingerprint phrase with the command `bw get fingerprint \<id\>`, where `\<id\>` is that member's user identifier. User identifiers can be retrieved [with the Public API](/help/api/).
Once a user is confirmed, they have the ability to decrypt organization data, so ensuring users' self-reported fingerprint phrases match expected values is an important step prior to confirming.
```
BashCopy
`bw confirm org-member \<id\> --organizationid \<orgid\>`
```
The`confirm`command takes an**exact**member`id`and an**exact**`organizationID`, for example:
```
BashCopy
`bw confirm org-member 7063feab-4b10-472e-b64c-785e2b870b92 --organizationid 310d5ffd-e9a2-4451-af87-ea054dce0f78`
```
[](#device-approval)### Device approval
Allows admins and owners to manage device approval requests where a user has requested admin approval.
##### note
At this time, bulk device approval is only available for the Bitwarden CLI client downloaded from [Bitwarden.com](/download/#command-line-interface).
##### warning
In most scenarios, users are able to approve their own login requests, and admin device approval is not necessary. See [Add a trusted device](/help/add-a-trusted-device/). Automatic or bulk approval of admin device approval requests neglect verification steps that administrators can perform in order to ensure a request is legitimate, such as checking the user's reported Fingerprint Phrase.
Bitwarden recommends that significant security controls such as IdP credential standards, IdP MFA, and IdP device registration and trust be reviewed before enabling and using bulk device approval.
The `list` command will show all pending device approval requests for an organization:
```
Plain TextCopy
`bw device-approval list --organizationid \<organization\_Id\>`
```
The `approve` command is used to approve pending device authorization requests for an organization:
```
Plain TextCopy
`bw device-approval approve --organizationid \<organizationId\> \<requestId\>`
```
Similarly, `approve-all` command can be used to approve all current pending requests:
```
Plain TextCopy
`bw device-approval approve-all --organization \<organizationId\>`
```
To `deny` a pending authorization request:
```
Plain TextCopy
`bw device-approval deny --organizationid \<organizationId\> \<requestId\>`
```
To `deny-all` pending authorization requests:
```
Plain TextCopy
`bw device-approval deny-all --organizationid \<organizationId\>`
```
[](#other-commands)## Other commands
[](#config)### config
The`config`command specifies settings for the Bitwarden CLI to use:
```
BashCopy
`bw config server \<setting\> [value]`
```
A primary use of`bw config`is to[connect your CLI to a self-hosted](/help/change-client-environment/#tab-cli-4dQ4hW1QAwVBuReXk2Txx0)Bitwarden server:
```
BashCopy
`bw config server https://your.bw.domain.com`
```
##### tip
Connect to the Bitwarden [EU server](/help/server-geographies/) by running the following command:
```
BashCopy
`bw config server https://vault.bitwarden.eu`
```
Pass`bw config server`without a value to read the server you're connected to.
Users with unique setups may elect to specify the URL of each service independently. Note that any subsequent use of the config command will overwrite all previous specifications, so this must be run as a single command each time you make a change:
```
BashCopy
`bw config server --web-vault \<url\> \\
--api \<url\> \\
--identity \<url\> \\
--icons \<url\> \\
--notifications \<url\> \\
--events \<url\> \\
--key-connector \<url\>`
```
##### note
The`bw config server --key-connector \<url\>`command is required if your organization uses[Key Connector](/help/about-key-connector/)and you’re using the`--apikey`option to login after having[removed your master password](/help/using-sso/#login-using-sso).
Contact an organization owner to get the required URL.
[](#sync)### sync
The`sync`command downloads your encrypted vault from the Bitwarden server. This command is most useful when you have changed something in your Bitwarden vault on another client application (for example web vault, browser extension, mobile app) since[logging in](#log-in)on the CLI.
```
BashCopy
`bw sync`
```
You can pass the`--last`option to return only the timestamp ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)) of the last time a sync was performed.
##### tip
It’s important to know that`sync`**only performs a pull**from the server. Data is automatically pushed to the server any time you make a change to your vault (for example,`create`,`edit`,`delete`).
[](#encode)### encode
The`encode`command Base 64 encodes stdin. This command is typically used in combination with a[command-line JSON processor like jq](https://stedolan.github.io/jq/)when performing`create`and`edit`operations, for example:
```
BashCopy
`bw get template folder | jq '.name="My First Folder"' | bw encode | bw create folder
bw get item 7ac9cae8-5067-4faf-b6ab-acfd00e2c328 | jq '.login.password="newp@ssw0rd"' | bw encode | bw edit item 7ac9cae8-5067-4faf-b6ab-acfd00e2c328`
```
[](#import)### import
The`import`command imports data from a Bitwarden export or other[supported password management application](/help/import-data/). The command must be pointed to afileand include the following arguments:
```
BashCopy
`bw import \<format\> \<path\>`
```
For example:
```
BashCopy
`bw import lastpasscsv /Users/myaccount/Documents/mydata.csv`
```
##### tip
Bitwarden supports lots of formats for import, too many to list here! Use`bw import --formats`to return the list in your CLI, or[see here](/help/import-faqs/#q-what-file-formats-does-bitwarden-support-for-import).
If you are importing an [encrypted .json file that you've created with a password](/help/encrypted-export/), you will be prompted to enter the password before import completes.
#### import to an organization vault
Using the import command with the --organizationid option, you can import data to an organization vault:
```
Plain TextCopy
`bw import --organizationid cf14adc3-aca5-4573-890a-f6fa231436d9 bitwardencsv ./from/source.csv`
```
[](#export)### export
The`export`command exports vault data as a`.json`or`.csv`,[encrypted .json](/help/encrypted-export/), or as a `.zip` with [attachments](/help/attachments/):
```
BashCopy
`bw export [--output \<filePath\>] [--format \<format\>] [--password \<password\>] [--organizationid \<orgid\>]`
```
By default, the`export`command will generate a`.csv`(equivalent to specifying`--format csv`) to the current working directory, however you can specify:
* `--format json` to export a `.json` file
* `--format encrypted\_json` to export an [encrypted .json](/help/encrypted-export/)file
* `--password \<password\>` to specify a password to use to encrypt `encrypted\_json` exports instead of your [account encryption key](/help/account-encryption-key/)
* `--format zip` to export a `.zip` that includes your [attachments](/help/attachments/)
* `--output \<path\>` to export to a specific location
* `--raw` to return the export to stdout instead of to a file
#### export from an organization vault
Using the`export`command with the`--organizationid`option, you can export an organization vault:
```
BashCopy
`bw export --organizationid 7063feab-4b10-472e-b64c-785e2b870b92 --format json --output /Users/myaccount/Downloads/`
```
[](#generate)### generate
The`generate`command generates a strong password or[passphrase](#generate-a-passphrase):
```
BashCopy
`bw generate [--lowercase --uppercase --number --special --length \<length\> --passphrase --separator \<separator\> --words \<words\>]`
```
By default, the`generate`command will generate a 14-character password with uppercase characters, lowercase characters, and numbers. This is the equivalent of passing:
```
BashCopy
`bw generate -uln --length 14`
```
You can generate more complex passwords using the options available to the command, including:
* `--uppercase`, `-u` (include uppercase)
* `--lowercase`, `-l` (include lowercase)
* `--number`, `-n` (include numbers)
* `--special`, `-s` (include special characters)
* `--length \<length\>` (length of the password, min of 5)
#### generate a passphrase
Using the`generate`command with the`--passphrase`option, you can generate a passphrase instead of a password:
```
BashCopy
`bw generate --passphrase --words \<words\> --separator \<separator\>`
```
By default,`bw generate --passphrase`will generate a three-word passphrase separated by a dash (`-`). This is the equivalent of passing:
```
BashCopy
`bw generate --passphrase --words 3 --separator -`
```
You can generate a complex passphrase using the options available to the command, including:
* `--words \<words\>` (number of words)
* `--separator \<separator\>` (separator character)
* `--capitalize`, `-c` (include to title-case the passphrase)
* `--includeNumber` (Include a single numerical character in your passphrase)
[](#update)### update
The`update`command checks whether your Bitwarden CLI is running the most recent version.`update`**doesn't automatically update the CLI for you.**
```
BashCopy
`bw update`
```
If a new version is detected, you'll need to download the new version of the CLI using the printed URL for the executable, or using the tools available for the package manager you used to[download the CLI](#download-and-install)(for example, `npm install -g @bitwarden/cli`).
[](#status)### status
The`status`command returns status information about the Bitwarden CLI, including[configured](#config)server URL, timestamp for the last sync ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)), user email and ID, and the vault status.
```
BashCopy
`bw status`
```
Status will return information as a JSON object, for example:
```
BashCopy
`{
"serverUrl": "https://bitwarden.example.com",
"lastSync": "2020-06-16T06:33:51.419Z",
"userEmail": "user@example.com",
"userId": "00000000-0000-0000-0000-000000000000",
"status": "unlocked"
}`
```
`status` may be one of the following:
* `"unlocked"`, indicating you are logged in and your vault is unlocked (a `BW\_SESSION` key environment variable is saved with an [active session key](#using-a-session-key))
* `"locked"`, indicating you are logged in but your vault is locked (**no** `BW\_SESSION` key environment variable is saved with an [active session key](#using-a-session-key))
* `"unauthenticated"`, indicating you aren't logged in
##### tip
When`"status": "unauthenticated"`,`lastSync`,`userEmail`, and`userID`will always return`null`.
[](#serve)### serve
The `serve` command starts a local express web server that can be used to take all actions accessible from the CLI in the form of RESTful API calls from an HTTP interface.
```
BashCopy
`bw serve --port \<port\> --hostname \<hostname\>`
```
By default, `serve` will start the web server at port 8087 however you can specify an alternate port with the `--port` option.
By default, `serve` will bind your API web server to `localhost` however you can specify an alternate hostname with the `--hostname` option. API requests can only be made from the bound hostname.
By default, `serve` will block any request with an `Origin` header. You can circumvent this protection using the `--disable-origin-protection` option, however **this is not recommended**.
##### warning
You can specify `--hostname all` for no hostname binding, however this will allow any machine on the network to make API requests.
[View the API spec ](/help/vault-management-api/)for help making calls with `serve`.
[](#debug)### Debug
The debug environment variable can be added for additional troubleshooting information.
```
Plain TextCopy
`export BITWARDENCLI\_DEBUG=true`
```
[](#appendices)## Appendices
[](#global-options)### Global options
The following options are available globally:
|
**Option**
|
**Description**
|
|
`--pretty`
|
Format output. JSON is tabbed with two spaces.
|
|
`--raw`
|
Return raw output instead of a descriptive message.
|
|
`--response`
|
Return a JSON formatted version of response output.
|
|
`--quiet`
|
Don't return anything to stdout. You might use this option, for example, when piping a credential value to a file or application.
|
|
`--nointeraction`
|
Do not prompt for interactive user input.
|
|
`--session \<session\>`
|
Pass session key instead of reading from an environment variable.
|
|
`-v, --version`
|
Output the Bitwarden CLI version number.
|
|
`-h, --help`
|
Display help text for the command.
|
[](#zsh-shell-completion)### ZSH shell completion
The Bitwarden CLI includes support for ZSH shell completion. To setup shell completion, use one of the following methods:
1. **Vanilla ZSH: **Add the following line to your `.zshrc` file:
```
BashCopy
`eval "$(bw completion --shell zsh); compdef \_bw bw;"`
```
2. **Vanilla (vendor-completions):** Run the following command:
```
BashCopy
`bw completion --shell zsh | sudo tee /usr/share/zsh/vendor-completions/\_bw`
```
3. [zinit:](https://github.com/zdharma/zinit) Run the following commands:
```
BashCopy
`bw completion --shell zsh \> \~/.local/share/zsh/completions/\_bw
zinit creinstall \~/.local/share/zsh/completions`
```
[](#using-self-signed-certificates)### Using self-signed certificates
If your self-hosted Bitwarden server exposes a self-signed TLS certificate, specify the Node.js environment variable [NODE\_EXTRA\_CA\_CERTS](https://nodejs.org/api/cli.html#cli_node_extra_ca_certs_file):
 Bash
```
BashCopy
`export NODE\_EXTRA\_CA\_CERTS="absolute/path/to/your/certificates.pem"`
```
 PowerShell
```
BashCopy
`$env:NODE\_EXTRA\_CA\_CERTS="absolute/path/to/your/certificates.pem"`
```
[](#enums)### Enums
The following tables enumerate values required in documented scenarios:
#### Two-step login methods
Used to specify which [two-step login method](/help/setup-two-step-login/) to use when [logging in](#log-in):
|
**Name**
|
**Value**
|
|
Authenticator
|
0
|
|
Email
|
1
|
|
YubiKey
|
3
|
##### note
FIDO2 and Duo are not supported by the CLI.
#### Item types
Used with the `create` command to specify a [vault item type](/help/managing-items/):
|
**Name**
|
**Value**
|
|
Login
|
1
|
|
Secure Note
|
2
|
|
Card
|
3
|
|
Identity
|
4
|
#### Login URI match types
Used with the `create` and `edit` command to specify [URI match detection](/help/uri-match-detection/) behavior for a login item:
|
**Name**
|
**Value**
|
|
Domain
|
0
|
|
Host
|
1
|
|
Starts With
|
2
|
|
Exact
|
3
|
|
Regular Expression
|
4
|
|
Never
|
5
|
#### Field types
Used with the `create` and `edit` commands to configure [custom fields](/help/custom-fields/):
|
**Name**
|
**Value**
|
|
Text
|
0
|
|
Hidden
|
1
|
|
Boolean
|
2
|
#### Organization user types
Indicates a [user's type](/help/user-types-access-control/):
|
**Name**
|
**Value**
|
|
Owner
|
0
|
|
Admin
|
1
|
|
User
|
2
|
|
Manager
|
3
|
|
Custom
|
4
|
#### Organization user statuses
Indicates a user's [status within the organization](/help/managing-users/):
|
**Name**
|
**Value**
|
|
Invited
|
0
|
|
Accepted
|
1
|
|
Confirmed
|
2
|
|
Revoked
|
-1
|
Suggest changes to this page
Copy for LLM
Contact support
* [Download Bitwarden](/download/)
* [Feature Request](https://community.bitwarden.com/t/about-the-feature-requests-category/12)
* [Ask the Community](https://community.bitwarden.com/c/support/)
* [Contributor Guidelines](https://contributing.bitwarden.com/)
*
* Copy for LLM
* Open AI Chat
* [Open page as Markdown](/help/cli.md)
* [Download as PDF](/help/cli.pdf)
### Cloud Status
Operational
**Issues**
100% UptimeNo events for 16 days!
There are currently no reported issues.
[View Status Page](https://status.bitwarden.com)
[Check status](https://status.bitwarden.com/)