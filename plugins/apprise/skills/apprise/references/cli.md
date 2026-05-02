## `lab apprise`

```text
Apprise notification dispatcher

Usage: lab apprise [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, server.health, notify.send, notify.key.send, config.add, config.get, config.delete, config.urls, server.details]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```
