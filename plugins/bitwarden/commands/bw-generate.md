---
description: Generate a Bitwarden password or passphrase through the Bitwarden MCP server
argument-hint: [length] [--passphrase] [--words N] [--no-special]
allowed-tools: Bash(plugins/bitwarden/scripts/session status), mcp__bitwarden__generate
---

Generate a password or passphrase using the Bitwarden MCP server.

Arguments: `$ARGUMENTS`

## Instructions

1. Verify the MCP session is usable:
   ```bash
   plugins/bitwarden/scripts/session status
   ```
   If it fails, tell the user to run `plugins/bitwarden/scripts/session unlock` or launch Claude through the configured shell wrapper.
2. Parse `$ARGUMENTS` into Bitwarden generate parameters:
   - Numeric first argument: password length.
   - `--passphrase`: generate a passphrase.
   - `--words N`: passphrase word count.
   - `--separator X`: passphrase separator.
   - `--capitalize`: capitalize passphrase words.
   - `--no-uppercase`, `--no-lowercase`, `--no-number`, `--no-special`: disable character classes.
3. Defaults when unspecified:
   - Password: length `32`, uppercase/lowercase/number/special all enabled.
   - Passphrase: words `5`, separator `-`, capitalize enabled.
4. Call the Bitwarden MCP `generate` tool with the parsed parameters.
5. Return only the generated value and a one-line summary of the generation policy. Do not store it unless the user explicitly asks.
