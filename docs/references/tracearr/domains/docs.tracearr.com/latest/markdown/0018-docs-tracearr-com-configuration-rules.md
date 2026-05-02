Rules - Automated Monitoring & Actions | Tracearr Docs[Skip to Content](#nextra-skip-nav)
CTRL K
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
[Configuration](/configuration)Rules
Copy page
# Rules
Rules let you automate how Tracearr responds to what’s happening on your media servers. You define the conditions to watch for, and the actions to take when those conditions are met.
**Common uses:**
* Limit how many streams a user can have at once
* Get notified when someone streams from an unusual country
* Detect account sharing by tracking impossible travel patterns
* Automatically terminate streams that have been paused too long
* Automatically terminate streams that violate your policies
Rules are evaluated in real-time as sessions start and change. When a rule’s conditions match, Tracearr automatically creates a violation and executes any additional actions you’ve configured — whether that’s logging the event, sending a notification, adjusting a user’s trust score, or terminating the stream.
Rules apply to all servers you’ve connected unless you scope them to a specific server.
## Building a Rule[](#building-a-rule)
Every rule has four parts:
1. **Name and description** — How you’ll identify the rule in your list
2. **Severity** — How serious a violation from this rule is: **Low**, **Warning**, or **High**
3. **Conditions** — What to look for (e.g., “more than 3 concurrent streams”)
4. **Actions** (optional) — Additional side-effects when conditions match (e.g., “send a notification”)
To create a rule, go to **Configuration → Rules** and click **New Rule**.
### Conditions[](#conditions)
Conditions define what triggers your rule. Each condition has three parts:
* **Field** — What you’re checking (like “concurrent streams” or “country”)
* **Operator** — How to compare (like “greater than” or “equals”)
* **Value** — What to compare against (like “3” or “United States”)
For example: `Concurrent Streams` `is greater than` `3`
#### Combining Conditions[](#combining-conditions)
You can add multiple conditions to a rule using AND/OR logic:
* **Conditions in the same group** use OR logic — any one of them can trigger the rule
* **Different groups** use AND logic — all groups must have at least one matching condition
**Example:** You want to detect users streaming from outside the US, but only if they’re also on a mobile device:
|Group 1|Group 2|
|Country is not US|Device Type is mobile|
||Device Type is tablet|
This triggers when the country isn’t US **AND** the device is mobile **OR** tablet.
### Available Fields[](#available-fields)
Here are all the fields you can use in conditions, grouped by category.
#### Session Behavior[](#session-behavior)
|Field|Description|Example Values|
|Concurrent Streams|Number of active streams from the same user|1, 2, 3…|
|Active Session Distance|Distance in kilometers between simultaneous sessions|100, 500, 1000…|
|Travel Speed|Calculated speed between consecutive sessions (km/h)|500, 1000…|
|Unique IPs in Window|Number of different IP addresses used within a time period|3, 5, 10…|
|Unique Devices in Window|Number of different devices used within a time period|2, 3, 5…|
|Inactive Days|Days since the user last streamed|30, 90, 180…|
|Current Pause Duration|How long the session has been continuously paused (minutes)|5, 15, 30…|
|Total Pause Duration|Total accumulated pause time across all pause/resume cycles (minutes)|15, 30, 60…|
Fields with “in Window” let you specify a time window (in hours) to check. For example, “more than 5 unique IPs in the last 24 hours.”
**Current vs Total Pause Duration:** Current Pause Duration measures how long the session has been paused *right now* — it resets when the user resumes playback. Total Pause Duration tracks all pause time across the entire session, including multiple pause/resume cycles. Use Current Pause Duration to catch users who walk away mid-stream. Use Total Pause Duration to detect sessions with excessive overall pausing.
##### Concurrent Streams Options[](#concurrent-streams-options)
The Concurrent Streams field has two modifier checkboxes:
|Option|Default|Description|
|Exclude same device|On|Don’t double-count if the same device appears multiple times. Usually leave this enabled.|
|Unique IPs|Off|Only count sessions from different IP addresses. Enable this to detect account sharing while allowing same-household usage (multiple devices on the same network).|
For example, if a user has 3 active sessions — 2 from the same home IP and 1 from a mobile network:
* With **Unique IPs off**: Concurrent Streams = 3
* With **Unique IPs on**: Concurrent Streams = 2 (only counts distinct IPs)
#### Stream Quality[](#stream-quality)
|Field|Description|Example Values|
|Source Resolution|Original media quality|4K, 1080p, 720p, 480p, SD|
|Output Resolution|What the user is actually receiving|4K, 1080p, 720p, 480p, SD|
|Is Transcoding|Whether the server is converting the stream|Yes / No|
|Is Transcode Downgrade|Output quality is lower than source|Yes / No|
|Source Bitrate|Original media bitrate in Mbps|5, 10, 20…|
#### User Attributes[](#user-attributes)
|Field|Description|Example Values|
|User|Specific user(s) to target|Select from dropdown|
|Trust Score|The user’s current trust score (0-100)|50, 75, 90…|
|Account Age|Days since the account was created|7, 30, 90…|
#### Device & Client[](#device--client)
|Field|Description|Example Values|
|Device Type|Category of device being used|Mobile, Tablet, TV, Desktop, Browser|
|Client Name|The media player application|Plex for iOS, Jellyfin Web, Infuse…|
|Platform|Operating system or platform|iOS, Android, Windows, macOS, Roku, Apple TV…|
#### Network & Location[](#network--location)
|Field|Description|Example Values|
|Is Local Network|Whether streaming from your home network|Yes / No|
|Country|Geographic location based on IP address|Select from dropdown|
|IP in Range|Check if IP falls within a CIDR range|192.168.1.0/24, 10.0.0.0/8…|
Country detection uses IP geolocation, which may not be accurate for users on VPNs or certain mobile networks.
#### Scope[](#scope)
|Field|Description|Example Values|
|Server|Which media server the session is on|Select from dropdown|
|Media Type|Type of content being played|Movie, Episode, Music Track, Photo, Live TV|
### Operators[](#operators)
Operators determine how the field is compared to your value. The available operators depend on the field type.
#### Comparison Operators[](#comparison-operators)
Used with numeric fields like concurrent streams, trust score, or travel speed.
|Operator|Meaning|Example|
|equals|Exactly matches|Trust Score equals 100|
|does not equal|Anything except this value|Concurrent Streams does not equal 1|
|greater than|More than (not including)|Travel Speed greater than 500|
|at least|This value or more|Concurrent Streams at least 3|
|less than|Fewer than (not including)|Trust Score less than 50|
|at most|This value or fewer|Account Age at most 7|
**Common mistake:** When limiting something like concurrent streams or unique IPs, use **“greater than”** or **“at least”** — not “at most”.
For example, to trigger when a user has too many unique IPs:
* Correct: `Unique IPs in Window greater than 3` — triggers at 4+ IPs
* Wrong: `Unique IPs in Window at most 3` — triggers at 1, 2, or 3 IPs (the opposite)
Think of it as: “trigger when the value **exceeds** my limit” — use **greater than** or **at least**.
#### Selection Operators[](#selection-operators)
Used with dropdown fields like country, device type, or platform.
|Operator|Meaning|Example|
|is|Matches the selected value|Country is United States|
|is not|Anything except this value|Device Type is not Desktop|
|is one of|Matches any in a list|Country is one of US, Canada, UK|
|is not one of|Doesn’t match any in a list|Platform is not one of iOS, Android|
#### Text Operators[](#text-operators)
Used with text fields like client name.
|Operator|Meaning|Example|
|contains|Includes this text anywhere|Client Name contains “Plex”|
|does not contain|Doesn’t include this text|Client Name does not contain “Web”|
### Severity[](#severity)
Every rule has a severity level that determines how the resulting violations are classified. Set this in the rule builder alongside the name and description.
|Severity|Use For|
|**Low**|Informational events you want to track but aren’t urgent|
|**Warning**|Potentially suspicious activity that should be reviewed (default)|
|**High**|Serious violations that need immediate attention|
Severity affects how prominently violations are displayed and can help you prioritize which issues to investigate first.
### Actions[](#actions)
When a rule’s conditions are met, Tracearr **automatically creates a violation** with the rule’s severity level. You don’t need to configure this — it happens for every rule.
Actions are optional side-effects you can add on top of the automatic violation. You can add multiple actions to a single rule — they all execute when the rule triggers.
#### Send Notification[](#send-notification)
Sends an alert through your configured notification channels.
|Setting|Description|
|Channels|Which channels to notify: Push, Discord, Email, or Webhook|
|Cooldown|Minutes to wait before sending another notification for the same trigger|
#### Log Only[](#log-only)
Records the event in the system log without taking any other action. Useful for testing rules before enabling more impactful actions.
|Setting|Description|
|Message|Optional custom message to include in the log|
#### Adjust Trust Score[](#adjust-trust-score)
Increases or decreases the user’s trust score by a specific amount.
|Setting|Description|
|Amount|Value from -100 to +100 (negative decreases, positive increases)|
#### Set Trust Score[](#set-trust-score)
Sets the user’s trust score to a specific value, regardless of their current score.
|Setting|Description|
|Value|Trust score to set (0-100)|
#### Reset Trust Score[](#reset-trust-score)
Resets the user’s trust score back to the default value of 100. No configuration needed.
#### Terminate Stream[](#terminate-stream)
Immediately stops the user’s active stream.
|Setting|Description|
|Target|Which session(s) to terminate (see options below)|
|Message|Optional message to display to the user when their stream is terminated (1-500 characters)|
|Cooldown|Minutes to wait before terminating another stream from the same user|
**Target options:**
|Target|Behavior|
|Triggering session|Only the session that triggered this rule (default)|
|Oldest session|The user’s longest-running active session|
|Newest session|The user’s most recently started session|
|All except one (keep oldest)|Terminates all sessions except the oldest, bringing the user down to 1 stream|
|All user sessions|Terminates every active session for the user|
Use this action carefully. Terminating streams can frustrate legitimate users if your rule conditions are too broad. The “All user sessions” target is especially aggressive.
#### Send Message to Client[](#send-message-to-client)
Displays a message on the user’s media player. Useful for warnings before taking stronger action.
|Setting|Description|
|Message|Text to display (1-500 characters)|
|Target|Which session(s) to message — same options as Terminate Stream (defaults to triggering session)|
This action only works with Jellyfin and Emby. Plex doesn’t support sending messages to clients except when terminating a stream.
### Multiple Actions[](#multiple-actions)
You can combine actions in a single rule. For example, you might want to:
1. Send a Discord notification
2. Send a message to the client
3. Adjust the user’s trust score
All actions execute when the rule triggers, in addition to the automatic violation creation.
## Managing Rules[](#managing-rules)
### Viewing Your Rules[](#viewing-your-rules)
The Rules page shows all your rules in a list. Each rule displays:
* **Name** and description
* **Severity** — the violation severity level (Low, Warning, High)
* **Status** — whether the rule is active or disabled
* **Summary** — a quick overview of conditions and actions
* **Violation count** — how many times the rule has triggered
### Enabling and Disabling Rules[](#enabling-and-disabling-rules)
You can toggle rules on and off without deleting them. This is useful for:
* Testing a new rule before fully enabling it
* Temporarily disabling a rule during maintenance
* Keeping rules you might want to use again later
To toggle a rule, click the switch next to it in the rules list. You can also select multiple rules and use **Bulk Actions → Enable** or **Disable**.
### Editing Rules[](#editing-rules)
Click on any rule to open the editor. You can change the name, description, severity, conditions, and actions. Changes take effect immediately after saving.
### Deleting Rules[](#deleting-rules)
To delete a rule, open it and click **Delete**, or select multiple rules and use **Bulk Actions → Delete**.
Deleting a rule is permanent. The rule’s violation history is preserved, but the rule itself cannot be recovered.
### Rule Scope[](#rule-scope)
By default, rules apply to all your servers. To limit a rule to a specific server, use the **Server** condition field in your rule’s conditions.
## Classic Rules[](#classic-rules)
If you used Tracearr before version 1.4.13, you may have had **Classic Rules** — predefined rule types with fixed logic:
* **Impossible Travel** — Detects physically impossible movement between sessions
* **Simultaneous Locations** — Flags concurrent sessions from distant locations
* **Device Velocity** — Watches for excessive IP changes in a time window
* **Concurrent Streams** — Limits how many streams a user can have at once
* **Geo Restriction** — Blocks or allows streaming from specific countries
* **Account Inactivity** — Detects accounts that haven’t streamed recently
Classic rules were automatically migrated to the V2 format when you upgraded to version 1.4.13. Your existing rules continue to work with the same behavior, but you can now edit and customize them using the full V2 rule builder.
If you had classic rules before upgrading, you’ll find them converted to V2 rules with equivalent conditions and actions. No action is needed on your part.
## Examples[](#examples)
Here are some common rules to get you started.
### Limit Concurrent Streams[](#limit-concurrent-streams)
Prevent users from streaming on more than 2 devices at once.
**Severity:** Warning
|Conditions|Actions|
|Concurrent Streams is greater than 2|Send Notification (Discord)|
**Tip:** Enable the “Unique IPs” checkbox to only count streams from different IP addresses. This lets household members share an account on multiple devices at home while still limiting external sharing.
### Terminate Idle Paused Streams[](#terminate-idle-paused-streams)
Free up server resources by terminating streams that have been paused for too long.
**Severity:** Low
|Conditions|Actions|
|Current Pause Duration is at least 15|Terminate Stream (message: “Stream terminated due to inactivity”)|
**Tip:** Pause rules are evaluated continuously while a session is paused — Tracearr checks every poll cycle, so the stream will be terminated shortly after the threshold is crossed. You can also use Total Pause Duration to catch users who repeatedly pause and resume throughout a long session.
### Detect Account Sharing[](#detect-account-sharing)
Flag users streaming from multiple distant locations at the same time.
**Severity:** High
|Conditions|Actions|
|Active Session Distance is greater than 500|Send Notification (Push)|
|Is Local Network is No||
The “Is Local Network is No” condition ensures you don’t flag someone streaming at home on multiple devices.
### Block Streaming From Specific Countries[](#block-streaming-from-specific-countries)
Restrict streaming to only your allowed countries.
**Severity:** High
|Conditions|Actions|
|Country is not one of US, Canada, UK|Terminate Stream|
### Warn New Users About Quality[](#warn-new-users-about-quality)
Send a message to new accounts if they’re causing transcoding.
**Severity:** Low
|Conditions|Actions|
|Account Age is less than 7|Send Message to Client: “Direct play is preferred when possible”|
|Is Transcoding is Yes|Log Only|
### Detect Suspicious New Accounts[](#detect-suspicious-new-accounts)
Flag new accounts showing multiple signs of potential abuse — streaming from an unusual country AND using multiple devices or IPs quickly.
**Group 1 (AND)**
|Conditions (OR within group)|
|Account Age is less than 14|
**Group 2 (AND)**
|Conditions (OR within group)|
|Country is not one of US, Canada, UK|
**Group 3 (AND)**
|Conditions (OR within group)|
|Unique IPs in Window is greater than 3 (24 hours)|
|Unique Devices in Window is greater than 2 (24 hours)|
**Severity:** Warning
**Actions:** Send Notification (Discord), Adjust Trust Score (-10)
This triggers when: Account is new **AND** country is unusual **AND** (too many IPs **OR** too many devices).
### Restrict Heavy Transcoding for Remote Users[](#restrict-heavy-transcoding-for-remote-users)
Limit resource-heavy transcoding to local network or trusted users only.
**Severity:** High
**Group 1 (AND)**
|Conditions (OR within group)|
|Is Transcoding is Yes|
|Is Transcode Downgrade is Yes|
**Group 2 (AND)**
|Conditions (OR within group)|
|Is Local Network is No|
**Group 3 (AND)**
|Conditions (OR within group)|
|Trust Score is less than 80|
**Actions:** Send Message to Client: “Please try a lower quality or direct play”, Terminate Stream
This triggers when: (Transcoding **OR** downgrading) **AND** remote user **AND** not highly trusted.
## Violation Evidence[](#violation-evidence)
When a rule triggers, Tracearr records detailed **condition evidence** on the violation. This shows exactly what values were evaluated and whether each condition matched, making it easy to understand why a rule fired.
You can view the evidence on any violation’s detail page under the **Condition Evidence** section. Each condition group shows:
* Whether the group as a whole matched
* Each individual condition with its **actual value**, the **operator and threshold**, and whether it matched
* How many **related sessions** contributed to the result (for conditions like concurrent streams or session distance)
The violation detail page also shows all **related sessions** in a table — for example, if a concurrent streams rule triggers at 5 streams, you’ll see the triggering session plus the 4 other active sessions that caused the match. Conditions like travel speed and session distance also link to the sessions involved, along with extra details like calculated distance or location data.
This is especially useful for:
* **Debugging rules** — Understanding why a rule triggered (or didn’t) for a specific session
* **Reviewing violations** — Seeing the exact values and related sessions before taking action
* **Tuning thresholds** — Checking actual values to decide if your thresholds are set appropriately
## Troubleshooting[](#troubleshooting)
### Rule isn’t triggering[](#rule-isnt-triggering)
* **Check if the rule is enabled** — Look for the toggle switch in the rules list
* **Verify your conditions** — Make sure the field, operator, and value match what you expect. For example, “greater than 3” won’t trigger when the value is exactly 3
* **Check condition grouping** — Remember that groups use AND logic. All groups must have at least one matching condition
* **Review the cooldown** — If you set a cooldown on an action, it won’t trigger again until the cooldown expires
* **Check the evidence** — If the rule has triggered before, look at the violation’s condition evidence to see what actual values were evaluated
### Rule is triggering too often[](#rule-is-triggering-too-often)
* **Add more conditions** — Narrow down when the rule applies by adding additional condition groups
* **Increase cooldown** — Add or increase the cooldown on actions like notifications to reduce noise
* **Exclude local network** — Add “Is Local Network is No” to ignore activity from your home network
### Country detection seems wrong[](#country-detection-seems-wrong)
IP-based geolocation isn’t perfect. It can be inaccurate when users are on:
* VPNs or proxy services
* Mobile networks (especially while traveling)
* Corporate networks that route traffic through another location
If you’re seeing unexpected countries, check if the user might be using a VPN. The IP address shown in the session details can help you investigate.
Last updated on March 15, 2026
[Environment Variables](/configuration/environment)[Tailscale VPN](/configuration/tailscale)