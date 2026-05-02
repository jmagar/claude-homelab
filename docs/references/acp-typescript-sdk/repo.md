This file is a merged representation of the entire codebase, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
.github/
  ISSUE_TEMPLATE/
    05_bug_report.yml
    10_accepted_protocol_changes.yml
    config.yml
  workflows/
    ci.yml
    publish.yml
  dependabot.yml
schema/
  meta.json
  schema.json
scripts/
  generate.js
  spellcheck.sh
src/
  examples/
    agent.ts
    client.ts
    README.md
  schema/
    index.ts
    types.gen.ts
    zod.gen.ts
  acp.test.ts
  acp.ts
  jsonrpc.ts
  stream.test.ts
  stream.ts
  typedoc.json
.gitignore
.prettierignore
.prettierrc
.release-please-manifest.json
AGENTS.md
CHANGELOG.md
eslint.config.js
LICENSE
package.json
README.md
release-please-config.json
tsconfig.json
typos.toml
```

# Files

## File: .github/ISSUE_TEMPLATE/05_bug_report.yml
````yaml
name: Bug Report
description: |
  Something is not working as expected in ACP
type: "Bug"
body:
  - type: textarea
    attributes:
      label: Summary
      description: Provide a one sentence summary and detailed reproduction steps
      value: |
        <!-- Begin your issue with a one sentence summary -->
        SUMMARY_SENTENCE_HERE

        ### Description
        <!--  Describe with sufficient detail the bug
          - Issues with insufficient detail may be summarily closed.
        -->

        DESCRIPTION_HERE

        **Expected Behavior**:
        **Actual Behavior**:

    validations:
      required: true

  - type: textarea
    id: environment
    attributes:
      label: ACP Version
    validations:
      required: true
````

## File: .github/ISSUE_TEMPLATE/10_accepted_protocol_changes.yml
````yaml
name: Accepted Protocol Changes [Staff Only]
description: Zed Staff Only
type: "Feature"
body:
  - type: textarea
    attributes:
      label: Summary
      value: |
        <!-- Please add a link to the Discussion related to the protocol changes that were accepted by the Zed staff -->
        DISCUSSION_LINK_HERE

        ### Description

        IF YOU DO NOT WORK FOR ZED INDUSTRIES DO NOT CREATE ISSUES WITH THIS TEMPLATE.
        THEY WILL BE AUTO-CLOSED AND MAY RESULT IN YOU BEING BANNED FROM THE ZED ISSUE TRACKER.

        PROPOSALS TO ADD ADDITIONAL CAPABILITIES / CHANGE EXISTING ONES SHOULD BE PROPOSED IN DISCUSSIONS FIRST:
          https://github.com/agentclientprotocol/typescript-sdk/discussions/categories/protocol-suggestions
    validations:
      required: true
````

## File: .github/ISSUE_TEMPLATE/config.yml
````yaml
# yaml-language-server: $schema=https://json.schemastore.org/github-issue-config.json
blank_issues_enabled: false
contact_links:
  - name: Propose Protocol Changes
    url: https://github.com/agentclientprotocol/typescript-sdk/discussions/categories/protocol-suggestions
    about: Propose additions or changes to the protocol
````

## File: .github/workflows/ci.yml
````yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "ci-${{ github.ref }}"
  cancel-in-progress: ${{ github.event_name == 'pull_request' }}

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    timeout-minutes: 5

    steps:
      - uses: actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd

      - name: Use Node.js
        uses: actions/setup-node@48b55a011bda9f5d6aeb4c2d9c7362e8dae4041e
        with:
          node-version: "lts/*"
          cache: "npm"

      - name: Install dependencies
        run: npm ci

      - name: Check formatting
        run: npm run format:check

      - name: Check for typos
        uses: crate-ci/typos@cf5f1c29a8ac336af8568821ec41919923b05a83
        with:
          config: ./typos.toml

      - name: Lint
        run: npm run lint

      - name: Build
        run: npm run build

      - name: Run tests
        run: npm test

      - name: Generate TypeDoc documentation
        run: npm run docs:ts:build

      - name: Upload documentation artifact
        if: github.event_name == 'push' && github.ref == 'refs/heads/main'
        uses: actions/upload-pages-artifact@fc324d3547104276b827a68afc52ff2a11cc49c9
        with:
          path: ./src/docs

  deploy-docs:
    name: Deploy Documentation
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build

    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@cd2ce8fcbc39b97be8ca5fce6e763baed58fa128
````

## File: .github/workflows/publish.yml
````yaml
name: release-please

on:
  push:
    branches:
      - main

jobs:
  release-please:
    runs-on: ubuntu-latest
    environment: release # Optional: for enhanced security
    permissions:
      contents: write
      issues: write
      pull-requests: write
    steps:
      # Generating a GitHub token, so that PRs and tags created by
      # the release-please-action can trigger actions workflows.
      - name: Generate GitHub token
        uses: actions/create-github-app-token@1b10c78c7865c340bc4f6099eb2f838309f1e8c3
        id: generate-token
        with:
          # GitHub App ID secret name
          app-id: ${{ secrets.RELEASE_PLZ_APP_ID }}
          # GitHub App private key secret name
          private-key: ${{ secrets.RELEASE_PLZ_APP_PRIVATE_KEY }}
      - uses: googleapis/release-please-action@45996ed1f6d02564a971a2fa1b5860e934307cf7
        id: release
        with:
          token: ${{ steps.generate-token.outputs.token }}
          release-type: node
          config-file: release-please-config.json
          manifest-file: .release-please-manifest.json
    outputs:
      release_created: ${{ steps.release.outputs.release_created }}
  publish:
    runs-on: ubuntu-latest
    environment: release # Optional: for enhanced security
    permissions:
      contents: read
      id-token: write
    needs: [release-please]
    if: ${{ needs.release-please.outputs.release_created }}
    steps:
      - uses: actions/checkout@de0fac2e4500dabe0009e67214ff5f5447ce83dd
      # Setup .npmrc file to publish to npm
      - uses: actions/setup-node@48b55a011bda9f5d6aeb4c2d9c7362e8dae4041e
        with:
          node-version: "lts/*"
          registry-url: "https://registry.npmjs.org"
      - name: Update npm
        run: npm install -g npm@latest
      - run: npm ci
      - run: npm run build
      - run: npm publish
````

## File: .github/dependabot.yml
````yaml
version: 2
updates:
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      # Check for updates to GitHub Actions every week
      interval: "weekly"
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    allow:
      - dependency-type: "all"
    groups:
      minor:
        update-types:
          - "minor"
          - "patch"
````

## File: schema/meta.json
````json
{
  "agentMethods": {
    "authenticate": "authenticate",
    "document_did_change": "document/didChange",
    "document_did_close": "document/didClose",
    "document_did_focus": "document/didFocus",
    "document_did_open": "document/didOpen",
    "document_did_save": "document/didSave",
    "initialize": "initialize",
    "logout": "logout",
    "nes_accept": "nes/accept",
    "nes_close": "nes/close",
    "nes_reject": "nes/reject",
    "nes_start": "nes/start",
    "nes_suggest": "nes/suggest",
    "providers_disable": "providers/disable",
    "providers_list": "providers/list",
    "providers_set": "providers/set",
    "session_cancel": "session/cancel",
    "session_close": "session/close",
    "session_fork": "session/fork",
    "session_list": "session/list",
    "session_load": "session/load",
    "session_new": "session/new",
    "session_prompt": "session/prompt",
    "session_resume": "session/resume",
    "session_set_config_option": "session/set_config_option",
    "session_set_mode": "session/set_mode",
    "session_set_model": "session/set_model"
  },
  "clientMethods": {
    "elicitation_complete": "elicitation/complete",
    "elicitation_create": "elicitation/create",
    "fs_read_text_file": "fs/read_text_file",
    "fs_write_text_file": "fs/write_text_file",
    "session_request_permission": "session/request_permission",
    "session_update": "session/update",
    "terminal_create": "terminal/create",
    "terminal_kill": "terminal/kill",
    "terminal_output": "terminal/output",
    "terminal_release": "terminal/release",
    "terminal_wait_for_exit": "terminal/wait_for_exit"
  },
  "protocolMethods": {
    "cancel_request": "$/cancel_request"
  },
  "version": 1
}
````

## File: schema/schema.json
````json
{
  "$defs": {
    "AcceptNesNotification": {
      "description": "Notification sent when a suggestion is accepted.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "id": {
          "description": "The ID of the accepted suggestion.",
          "type": "string"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this notification."
        }
      },
      "required": ["sessionId", "id"],
      "type": "object",
      "x-method": "nes/accept",
      "x-side": "agent"
    },
    "AgentAuthCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAuthentication-related capabilities supported by the agent.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "logout": {
          "anyOf": [
            {
              "$ref": "#/$defs/LogoutCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent supports the logout method.\n\nBy supplying `{}` it means that the agent supports the logout method."
        }
      },
      "type": "object"
    },
    "AgentCapabilities": {
      "description": "Capabilities supported by the agent.\n\nAdvertised during initialization to inform the client about\navailable features and content types.\n\nSee protocol docs: [Agent Capabilities](https://agentclientprotocol.com/protocol/initialization#agent-capabilities)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "auth": {
          "allOf": [
            {
              "$ref": "#/$defs/AgentAuthCapabilities"
            }
          ],
          "default": {},
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAuthentication-related capabilities supported by the agent."
        },
        "loadSession": {
          "default": false,
          "description": "Whether the agent supports `session/load`.",
          "type": "boolean"
        },
        "mcpCapabilities": {
          "allOf": [
            {
              "$ref": "#/$defs/McpCapabilities"
            }
          ],
          "default": {
            "http": false,
            "sse": false
          },
          "description": "MCP capabilities supported by the agent."
        },
        "nes": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nNES (Next Edit Suggestions) capabilities supported by the agent."
        },
        "positionEncoding": {
          "anyOf": [
            {
              "$ref": "#/$defs/PositionEncodingKind"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe position encoding selected by the agent from the client's supported encodings."
        },
        "promptCapabilities": {
          "allOf": [
            {
              "$ref": "#/$defs/PromptCapabilities"
            }
          ],
          "default": {
            "audio": false,
            "embeddedContext": false,
            "image": false
          },
          "description": "Prompt capabilities supported by the agent."
        },
        "providers": {
          "anyOf": [
            {
              "$ref": "#/$defs/ProvidersCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nProvider configuration capabilities supported by the agent.\n\nBy supplying `{}` it means that the agent supports provider configuration methods."
        },
        "sessionCapabilities": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionCapabilities"
            }
          ],
          "default": {}
        }
      },
      "type": "object"
    },
    "AgentNotification": {
      "properties": {
        "method": {
          "type": "string"
        },
        "params": {
          "anyOf": [
            {
              "anyOf": [
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SessionNotification"
                    }
                  ],
                  "description": "Handles session update notifications from the agent.\n\nThis is a notification endpoint (no response expected) that receives\nreal-time updates about session progress, including message chunks,\ntool calls, and execution plans.\n\nNote: Clients SHOULD continue accepting tool call updates even after\nsending a `session/cancel` notification, as the agent may send final\nupdates before responding with the cancelled stop reason.\n\nSee protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)",
                  "title": "SessionNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CompleteElicitationNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nNotification that a URL-based elicitation has completed.",
                  "title": "CompleteElicitationNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ExtNotification"
                    }
                  ],
                  "description": "Handles extension notifications from the agent.\n\nAllows the Agent to send an arbitrary notification that is not part of the ACP spec.\nExtension notifications provide a way to send one-way messages for custom functionality\nwhile maintaining protocol compatibility.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
                  "title": "ExtNotification"
                }
              ],
              "description": "All possible notifications that an agent can send to a client.\n\nThis enum is used internally for routing RPC notifications. You typically won't need\nto use this directly - use the notification methods on the [`Client`] trait instead.\n\nNotifications do not expect a response."
            },
            {
              "type": "null"
            }
          ]
        }
      },
      "required": ["method"],
      "type": "object",
      "x-docs-ignore": true
    },
    "AgentRequest": {
      "properties": {
        "id": {
          "$ref": "#/$defs/RequestId"
        },
        "method": {
          "type": "string"
        },
        "params": {
          "anyOf": [
            {
              "anyOf": [
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/WriteTextFileRequest"
                    }
                  ],
                  "description": "Writes content to a text file in the client's file system.\n\nOnly available if the client advertises the `fs.writeTextFile` capability.\nAllows the agent to create or modify files within the client's environment.\n\nSee protocol docs: [Client](https://agentclientprotocol.com/protocol/overview#client)",
                  "title": "WriteTextFileRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ReadTextFileRequest"
                    }
                  ],
                  "description": "Reads content from a text file in the client's file system.\n\nOnly available if the client advertises the `fs.readTextFile` capability.\nAllows the agent to access file contents within the client's environment.\n\nSee protocol docs: [Client](https://agentclientprotocol.com/protocol/overview#client)",
                  "title": "ReadTextFileRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/RequestPermissionRequest"
                    }
                  ],
                  "description": "Requests permission from the user for a tool call operation.\n\nCalled by the agent when it needs user authorization before executing\na potentially sensitive operation. The client should present the options\nto the user and return their decision.\n\nIf the client cancels the prompt turn via `session/cancel`, it MUST\nrespond to this request with `RequestPermissionOutcome::Cancelled`.\n\nSee protocol docs: [Requesting Permission](https://agentclientprotocol.com/protocol/tool-calls#requesting-permission)",
                  "title": "RequestPermissionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CreateTerminalRequest"
                    }
                  ],
                  "description": "Executes a command in a new terminal\n\nOnly available if the `terminal` Client capability is set to `true`.\n\nReturns a `TerminalId` that can be used with other terminal methods\nto get the current output, wait for exit, and kill the command.\n\nThe `TerminalId` can also be used to embed the terminal in a tool call\nby using the `ToolCallContent::Terminal` variant.\n\nThe Agent is responsible for releasing the terminal by using the `terminal/release`\nmethod.\n\nSee protocol docs: [Terminals](https://agentclientprotocol.com/protocol/terminals)",
                  "title": "CreateTerminalRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/TerminalOutputRequest"
                    }
                  ],
                  "description": "Gets the terminal output and exit status\n\nReturns the current content in the terminal without waiting for the command to exit.\nIf the command has already exited, the exit status is included.\n\nSee protocol docs: [Terminals](https://agentclientprotocol.com/protocol/terminals)",
                  "title": "TerminalOutputRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ReleaseTerminalRequest"
                    }
                  ],
                  "description": "Releases a terminal\n\nThe command is killed if it hasn't exited yet. Use `terminal/wait_for_exit`\nto wait for the command to exit before releasing the terminal.\n\nAfter release, the `TerminalId` can no longer be used with other `terminal/*` methods,\nbut tool calls that already contain it, continue to display its output.\n\nThe `terminal/kill` method can be used to terminate the command without releasing\nthe terminal, allowing the Agent to call `terminal/output` and other methods.\n\nSee protocol docs: [Terminals](https://agentclientprotocol.com/protocol/terminals)",
                  "title": "ReleaseTerminalRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/WaitForTerminalExitRequest"
                    }
                  ],
                  "description": "Waits for the terminal command to exit and return its exit status\n\nSee protocol docs: [Terminals](https://agentclientprotocol.com/protocol/terminals)",
                  "title": "WaitForTerminalExitRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/KillTerminalRequest"
                    }
                  ],
                  "description": "Kills the terminal command without releasing the terminal\n\nWhile `terminal/release` will also kill the command, this method will keep\nthe `TerminalId` valid so it can be used with other methods.\n\nThis method can be helpful when implementing command timeouts which terminate\nthe command as soon as elapsed, and then get the final output so it can be sent\nto the model.\n\nNote: Call `terminal/release` when `TerminalId` is no longer needed.\n\nSee protocol docs: [Terminals](https://agentclientprotocol.com/protocol/terminals)",
                  "title": "KillTerminalRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CreateElicitationRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequests structured user input via a form or URL.",
                  "title": "CreateElicitationRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ExtRequest"
                    }
                  ],
                  "description": "Handles extension method requests from the agent.\n\nAllows the Agent to send an arbitrary request that is not part of the ACP spec.\nExtension methods provide a way to add custom functionality while maintaining\nprotocol compatibility.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
                  "title": "ExtMethodRequest"
                }
              ],
              "description": "All possible requests that an agent can send to a client.\n\nThis enum is used internally for routing RPC requests. You typically won't need\nto use this directly - instead, use the methods on the [`Client`] trait.\n\nThis enum encompasses all method calls from agent to client."
            },
            {
              "type": "null"
            }
          ]
        }
      },
      "required": ["id", "method"],
      "type": "object",
      "x-docs-ignore": true
    },
    "AgentResponse": {
      "anyOf": [
        {
          "properties": {
            "id": {
              "$ref": "#/$defs/RequestId"
            },
            "result": {
              "anyOf": [
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/InitializeResponse"
                    }
                  ],
                  "title": "InitializeResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/AuthenticateResponse"
                    }
                  ],
                  "title": "AuthenticateResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ListProvidersResponse"
                    }
                  ],
                  "title": "ListProvidersResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetProvidersResponse"
                    }
                  ],
                  "title": "SetProvidersResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/DisableProvidersResponse"
                    }
                  ],
                  "title": "DisableProvidersResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/LogoutResponse"
                    }
                  ],
                  "title": "LogoutResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/NewSessionResponse"
                    }
                  ],
                  "title": "NewSessionResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/LoadSessionResponse"
                    }
                  ],
                  "title": "LoadSessionResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ListSessionsResponse"
                    }
                  ],
                  "title": "ListSessionsResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ForkSessionResponse"
                    }
                  ],
                  "title": "ForkSessionResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ResumeSessionResponse"
                    }
                  ],
                  "title": "ResumeSessionResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CloseSessionResponse"
                    }
                  ],
                  "title": "CloseSessionResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetSessionModeResponse"
                    }
                  ],
                  "title": "SetSessionModeResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetSessionConfigOptionResponse"
                    }
                  ],
                  "title": "SetSessionConfigOptionResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/PromptResponse"
                    }
                  ],
                  "title": "PromptResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetSessionModelResponse"
                    }
                  ],
                  "title": "SetSessionModelResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/StartNesResponse"
                    }
                  ],
                  "title": "StartNesResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SuggestNesResponse"
                    }
                  ],
                  "title": "SuggestNesResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CloseNesResponse"
                    }
                  ],
                  "title": "CloseNesResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ExtResponse"
                    }
                  ],
                  "title": "ExtMethodResponse"
                }
              ],
              "description": "All possible responses that an agent can send to a client.\n\nThis enum is used internally for routing RPC responses. You typically won't need\nto use this directly - the responses are handled automatically by the connection.\n\nThese are responses to the corresponding `ClientRequest` variants."
            }
          },
          "required": ["id", "result"],
          "title": "Result",
          "type": "object"
        },
        {
          "properties": {
            "error": {
              "$ref": "#/$defs/Error"
            },
            "id": {
              "$ref": "#/$defs/RequestId"
            }
          },
          "required": ["id", "error"],
          "title": "Error",
          "type": "object"
        }
      ],
      "x-docs-ignore": true
    },
    "Annotations": {
      "description": "Optional annotations for the client. The client can use annotations to inform how objects are used or displayed",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "audience": {
          "items": {
            "$ref": "#/$defs/Role"
          },
          "type": ["array", "null"]
        },
        "lastModified": {
          "type": ["string", "null"]
        },
        "priority": {
          "format": "double",
          "type": ["number", "null"]
        }
      },
      "type": "object"
    },
    "AudioContent": {
      "description": "Audio provided to or from an LLM.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "annotations": {
          "anyOf": [
            {
              "$ref": "#/$defs/Annotations"
            },
            {
              "type": "null"
            }
          ]
        },
        "data": {
          "type": "string"
        },
        "mimeType": {
          "type": "string"
        }
      },
      "required": ["data", "mimeType"],
      "type": "object"
    },
    "AuthCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAuthentication capabilities supported by the client.\n\nAdvertised during initialization to inform the agent which authentication\nmethod types the client can handle. This governs opt-in types that require\nadditional client-side support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "terminal": {
          "default": false,
          "description": "Whether the client supports `terminal` authentication methods.\n\nWhen `true`, the agent may include `terminal` entries in its authentication methods.",
          "type": "boolean"
        }
      },
      "type": "object"
    },
    "AuthEnvVar": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nDescribes a single environment variable for an [`AuthMethodEnvVar`] authentication method.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "label": {
          "description": "Human-readable label for this variable, displayed in client UI.",
          "type": ["string", "null"]
        },
        "name": {
          "description": "The environment variable name (e.g. `\"OPENAI_API_KEY\"`).",
          "type": "string"
        },
        "optional": {
          "default": false,
          "description": "Whether this variable is optional.\n\nDefaults to `false`.",
          "type": "boolean"
        },
        "secret": {
          "default": true,
          "description": "Whether this value is a secret (e.g. API key, token).\nClients should use a password-style input for secret vars.\n\nDefaults to `true`.",
          "type": "boolean"
        }
      },
      "required": ["name"],
      "type": "object"
    },
    "AuthMethod": {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/AuthMethodEnvVar"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nUser provides a key that the client passes to the agent as an environment variable.",
          "properties": {
            "type": {
              "const": "env_var",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/AuthMethodTerminal"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nClient runs an interactive terminal for the user to authenticate via a TUI.",
          "properties": {
            "type": {
              "const": "terminal",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/AuthMethodAgent"
            }
          ],
          "description": "Agent handles authentication itself.\n\nThis is the default when no `type` is specified.",
          "title": "agent"
        }
      ],
      "description": "Describes an available authentication method.\n\nThe `type` field acts as the discriminator in the serialized JSON form.\nWhen no `type` is present, the method is treated as `agent`."
    },
    "AuthMethodAgent": {
      "description": "Agent handles authentication itself.\n\nThis is the default authentication method type.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "description": {
          "description": "Optional description providing more details about this authentication method.",
          "type": ["string", "null"]
        },
        "id": {
          "description": "Unique identifier for this authentication method.",
          "type": "string"
        },
        "name": {
          "description": "Human-readable name of the authentication method.",
          "type": "string"
        }
      },
      "required": ["id", "name"],
      "type": "object"
    },
    "AuthMethodEnvVar": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nEnvironment variable authentication method.\n\nThe user provides credentials that the client passes to the agent as environment variables.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "description": {
          "description": "Optional description providing more details about this authentication method.",
          "type": ["string", "null"]
        },
        "id": {
          "description": "Unique identifier for this authentication method.",
          "type": "string"
        },
        "link": {
          "description": "Optional link to a page where the user can obtain their credentials.",
          "type": ["string", "null"]
        },
        "name": {
          "description": "Human-readable name of the authentication method.",
          "type": "string"
        },
        "vars": {
          "description": "The environment variables the client should set.",
          "items": {
            "$ref": "#/$defs/AuthEnvVar"
          },
          "type": "array"
        }
      },
      "required": ["id", "name", "vars"],
      "type": "object"
    },
    "AuthMethodTerminal": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nTerminal-based authentication method.\n\nThe client runs an interactive terminal for the user to authenticate via a TUI.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "args": {
          "description": "Additional arguments to pass when running the agent binary for terminal auth.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "description": {
          "description": "Optional description providing more details about this authentication method.",
          "type": ["string", "null"]
        },
        "env": {
          "additionalProperties": {
            "type": "string"
          },
          "description": "Additional environment variables to set when running the agent binary for terminal auth.",
          "type": "object"
        },
        "id": {
          "description": "Unique identifier for this authentication method.",
          "type": "string"
        },
        "name": {
          "description": "Human-readable name of the authentication method.",
          "type": "string"
        }
      },
      "required": ["id", "name"],
      "type": "object"
    },
    "AuthenticateRequest": {
      "description": "Request parameters for the authenticate method.\n\nSpecifies which authentication method to use.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "methodId": {
          "description": "The ID of the authentication method to use.\nMust be one of the methods advertised in the initialize response.",
          "type": "string"
        }
      },
      "required": ["methodId"],
      "type": "object",
      "x-method": "authenticate",
      "x-side": "agent"
    },
    "AuthenticateResponse": {
      "description": "Response to the `authenticate` method.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "authenticate",
      "x-side": "agent"
    },
    "AvailableCommand": {
      "description": "Information about a command.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "description": {
          "description": "Human-readable description of what the command does.",
          "type": "string"
        },
        "input": {
          "anyOf": [
            {
              "$ref": "#/$defs/AvailableCommandInput"
            },
            {
              "type": "null"
            }
          ],
          "description": "Input for the command if required"
        },
        "name": {
          "description": "Command name (e.g., `create_plan`, `research_codebase`).",
          "type": "string"
        }
      },
      "required": ["name", "description"],
      "type": "object"
    },
    "AvailableCommandInput": {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/UnstructuredCommandInput"
            }
          ],
          "description": "All text that was typed after the command name is provided as input.",
          "title": "unstructured"
        }
      ],
      "description": "The input specification for a command."
    },
    "AvailableCommandsUpdate": {
      "description": "Available commands are ready or have changed",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "availableCommands": {
          "description": "Commands the agent can execute",
          "items": {
            "$ref": "#/$defs/AvailableCommand"
          },
          "type": "array"
        }
      },
      "required": ["availableCommands"],
      "type": "object"
    },
    "BlobResourceContents": {
      "description": "Binary resource contents.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "blob": {
          "type": "string"
        },
        "mimeType": {
          "type": ["string", "null"]
        },
        "uri": {
          "type": "string"
        }
      },
      "required": ["blob", "uri"],
      "type": "object"
    },
    "BooleanPropertySchema": {
      "description": "Schema for boolean properties in an elicitation form.",
      "properties": {
        "default": {
          "description": "Default value.",
          "type": ["boolean", "null"]
        },
        "description": {
          "description": "Human-readable description.",
          "type": ["string", "null"]
        },
        "title": {
          "description": "Optional title for the property.",
          "type": ["string", "null"]
        }
      },
      "type": "object"
    },
    "CancelNotification": {
      "description": "Notification to cancel ongoing operations for a session.\n\nSee protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to cancel operations for."
        }
      },
      "required": ["sessionId"],
      "type": "object",
      "x-method": "session/cancel",
      "x-side": "agent"
    },
    "CancelRequestNotification": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nNotification to cancel an ongoing request.\n\nSee protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/cancellation)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "requestId": {
          "allOf": [
            {
              "$ref": "#/$defs/RequestId"
            }
          ],
          "description": "The ID of the request to cancel."
        }
      },
      "required": ["requestId"],
      "type": "object",
      "x-method": "$/cancel_request",
      "x-side": "protocol"
    },
    "ClientCapabilities": {
      "description": "Capabilities supported by the client.\n\nAdvertised during initialization to inform the agent about\navailable features and methods.\n\nSee protocol docs: [Client Capabilities](https://agentclientprotocol.com/protocol/initialization#client-capabilities)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "auth": {
          "allOf": [
            {
              "$ref": "#/$defs/AuthCapabilities"
            }
          ],
          "default": {
            "terminal": false
          },
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAuthentication capabilities supported by the client.\nDetermines which authentication method types the agent may include\nin its `InitializeResponse`."
        },
        "elicitation": {
          "anyOf": [
            {
              "$ref": "#/$defs/ElicitationCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nElicitation capabilities supported by the client.\nDetermines which elicitation modes the agent may use."
        },
        "fs": {
          "allOf": [
            {
              "$ref": "#/$defs/FileSystemCapabilities"
            }
          ],
          "default": {
            "readTextFile": false,
            "writeTextFile": false
          },
          "description": "File system capabilities supported by the client.\nDetermines which file operations the agent can request."
        },
        "nes": {
          "anyOf": [
            {
              "$ref": "#/$defs/ClientNesCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nNES (Next Edit Suggestions) capabilities supported by the client."
        },
        "positionEncodings": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe position encodings supported by the client, in order of preference.",
          "items": {
            "$ref": "#/$defs/PositionEncodingKind"
          },
          "type": "array"
        },
        "terminal": {
          "default": false,
          "description": "Whether the Client support all `terminal/*` methods.",
          "type": "boolean"
        }
      },
      "type": "object"
    },
    "ClientNesCapabilities": {
      "description": "NES capabilities advertised by the client during initialization.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "jump": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesJumpCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the client supports the `jump` suggestion kind."
        },
        "rename": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesRenameCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the client supports the `rename` suggestion kind."
        },
        "searchAndReplace": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesSearchAndReplaceCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the client supports the `searchAndReplace` suggestion kind."
        }
      },
      "type": "object"
    },
    "ClientNotification": {
      "properties": {
        "method": {
          "type": "string"
        },
        "params": {
          "anyOf": [
            {
              "anyOf": [
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CancelNotification"
                    }
                  ],
                  "description": "Cancels ongoing operations for a session.\n\nThis is a notification sent by the client to cancel an ongoing prompt turn.\n\nUpon receiving this notification, the Agent SHOULD:\n- Stop all language model requests as soon as possible\n- Abort all tool call invocations in progress\n- Send any pending `session/update` notifications\n- Respond to the original `session/prompt` request with `StopReason::Cancelled`\n\nSee protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)",
                  "title": "CancelNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/DidOpenDocumentNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nNotification sent when a file is opened in the editor.",
                  "title": "DidOpenDocumentNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/DidChangeDocumentNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nNotification sent when a file is edited.",
                  "title": "DidChangeDocumentNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/DidCloseDocumentNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nNotification sent when a file is closed.",
                  "title": "DidCloseDocumentNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/DidSaveDocumentNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nNotification sent when a file is saved.",
                  "title": "DidSaveDocumentNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/DidFocusDocumentNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nNotification sent when a file becomes the active editor tab.",
                  "title": "DidFocusDocumentNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/AcceptNesNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nNotification sent when a suggestion is accepted.",
                  "title": "AcceptNesNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/RejectNesNotification"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nNotification sent when a suggestion is rejected.",
                  "title": "RejectNesNotification"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ExtNotification"
                    }
                  ],
                  "description": "Handles extension notifications from the client.\n\nExtension notifications provide a way to send one-way messages for custom functionality\nwhile maintaining protocol compatibility.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
                  "title": "ExtNotification"
                }
              ],
              "description": "All possible notifications that a client can send to an agent.\n\nThis enum is used internally for routing RPC notifications. You typically won't need\nto use this directly - use the notification methods on the [`Agent`] trait instead.\n\nNotifications do not expect a response."
            },
            {
              "type": "null"
            }
          ]
        }
      },
      "required": ["method"],
      "type": "object",
      "x-docs-ignore": true
    },
    "ClientRequest": {
      "properties": {
        "id": {
          "$ref": "#/$defs/RequestId"
        },
        "method": {
          "type": "string"
        },
        "params": {
          "anyOf": [
            {
              "anyOf": [
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/InitializeRequest"
                    }
                  ],
                  "description": "Establishes the connection with a client and negotiates protocol capabilities.\n\nThis method is called once at the beginning of the connection to:\n- Negotiate the protocol version to use\n- Exchange capability information between client and agent\n- Determine available authentication methods\n\nThe agent should respond with its supported protocol version and capabilities.\n\nSee protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)",
                  "title": "InitializeRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/AuthenticateRequest"
                    }
                  ],
                  "description": "Authenticates the client using the specified authentication method.\n\nCalled when the agent requires authentication before allowing session creation.\nThe client provides the authentication method ID that was advertised during initialization.\n\nAfter successful authentication, the client can proceed to create sessions with\n`new_session` without receiving an `auth_required` error.\n\nSee protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)",
                  "title": "AuthenticateRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ListProvidersRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nLists providers that can be configured by the client.",
                  "title": "ListProvidersRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetProvidersRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nReplaces the configuration for a provider.",
                  "title": "SetProvidersRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/DisableProvidersRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nDisables a provider.",
                  "title": "DisableProvidersRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/LogoutRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nLogs out of the current authenticated state.\n\nAfter a successful logout, all new sessions will require authentication.\nThere is no guarantee about the behavior of already running sessions.",
                  "title": "LogoutRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/NewSessionRequest"
                    }
                  ],
                  "description": "Creates a new conversation session with the agent.\n\nSessions represent independent conversation contexts with their own history and state.\n\nThe agent should:\n- Create a new session context\n- Connect to any specified MCP servers\n- Return a unique session ID for future requests\n\nMay return an `auth_required` error if the agent requires authentication.\n\nSee protocol docs: [Session Setup](https://agentclientprotocol.com/protocol/session-setup)",
                  "title": "NewSessionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/LoadSessionRequest"
                    }
                  ],
                  "description": "Loads an existing session to resume a previous conversation.\n\nThis method is only available if the agent advertises the `loadSession` capability.\n\nThe agent should:\n- Restore the session context and conversation history\n- Connect to the specified MCP servers\n- Stream the entire conversation history back to the client via notifications\n\nSee protocol docs: [Loading Sessions](https://agentclientprotocol.com/protocol/session-setup#loading-sessions)",
                  "title": "LoadSessionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ListSessionsRequest"
                    }
                  ],
                  "description": "Lists existing sessions known to the agent.\n\nThis method is only available if the agent advertises the `sessionCapabilities.list` capability.\n\nThe agent should return metadata about sessions with optional filtering and pagination support.",
                  "title": "ListSessionsRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ForkSessionRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nForks an existing session to create a new independent session.\n\nThis method is only available if the agent advertises the `session.fork` capability.\n\nThe agent should create a new session with the same conversation context as the\noriginal, allowing operations like generating summaries without affecting the\noriginal session's history.",
                  "title": "ForkSessionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ResumeSessionRequest"
                    }
                  ],
                  "description": "Resumes an existing session without returning previous messages.\n\nThis method is only available if the agent advertises the `sessionCapabilities.resume` capability.\n\nThe agent should resume the session context, allowing the conversation to continue\nwithout replaying the message history (unlike `session/load`).",
                  "title": "ResumeSessionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CloseSessionRequest"
                    }
                  ],
                  "description": "Closes an active session and frees up any resources associated with it.\n\nThis method is only available if the agent advertises the `sessionCapabilities.close` capability.\n\nThe agent must cancel any ongoing work (as if `session/cancel` was called)\nand then free up any resources associated with the session.",
                  "title": "CloseSessionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetSessionModeRequest"
                    }
                  ],
                  "description": "Sets the current mode for a session.\n\nAllows switching between different agent modes (e.g., \"ask\", \"architect\", \"code\")\nthat affect system prompts, tool availability, and permission behaviors.\n\nThe mode must be one of the modes advertised in `availableModes` during session\ncreation or loading. Agents may also change modes autonomously and notify the\nclient via `current_mode_update` notifications.\n\nThis method can be called at any time during a session, whether the Agent is\nidle or actively generating a response.\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)",
                  "title": "SetSessionModeRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetSessionConfigOptionRequest"
                    }
                  ],
                  "description": "Sets the current value for a session configuration option.",
                  "title": "SetSessionConfigOptionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/PromptRequest"
                    }
                  ],
                  "description": "Processes a user prompt within a session.\n\nThis method handles the whole lifecycle of a prompt:\n- Receives user messages with optional context (files, images, etc.)\n- Processes the prompt using language models\n- Reports language model content and tool calls to the Clients\n- Requests permission to run tools\n- Executes any requested tool calls\n- Returns when the turn is complete with a stop reason\n\nSee protocol docs: [Prompt Turn](https://agentclientprotocol.com/protocol/prompt-turn)",
                  "title": "PromptRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SetSessionModelRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nSelect a model for a given session.",
                  "title": "SetSessionModelRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/StartNesRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nStarts an NES session.",
                  "title": "StartNesRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/SuggestNesRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequests a code suggestion.",
                  "title": "SuggestNesRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CloseNesRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCloses an active NES session and frees up any resources associated with it.\n\nThe agent must cancel any ongoing work and then free up any resources\nassociated with the NES session.",
                  "title": "CloseNesRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ExtRequest"
                    }
                  ],
                  "description": "Handles extension method requests from the client.\n\nExtension methods provide a way to add custom functionality while maintaining\nprotocol compatibility.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
                  "title": "ExtMethodRequest"
                }
              ],
              "description": "All possible requests that a client can send to an agent.\n\nThis enum is used internally for routing RPC requests. You typically won't need\nto use this directly - instead, use the methods on the [`Agent`] trait.\n\nThis enum encompasses all method calls from client to agent."
            },
            {
              "type": "null"
            }
          ]
        }
      },
      "required": ["id", "method"],
      "type": "object",
      "x-docs-ignore": true
    },
    "ClientResponse": {
      "anyOf": [
        {
          "properties": {
            "id": {
              "$ref": "#/$defs/RequestId"
            },
            "result": {
              "anyOf": [
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/WriteTextFileResponse"
                    }
                  ],
                  "title": "WriteTextFileResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ReadTextFileResponse"
                    }
                  ],
                  "title": "ReadTextFileResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/RequestPermissionResponse"
                    }
                  ],
                  "title": "RequestPermissionResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CreateTerminalResponse"
                    }
                  ],
                  "title": "CreateTerminalResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/TerminalOutputResponse"
                    }
                  ],
                  "title": "TerminalOutputResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ReleaseTerminalResponse"
                    }
                  ],
                  "title": "ReleaseTerminalResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/WaitForTerminalExitResponse"
                    }
                  ],
                  "title": "WaitForTerminalExitResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/KillTerminalResponse"
                    }
                  ],
                  "title": "KillTerminalResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CreateElicitationResponse"
                    }
                  ],
                  "title": "CreateElicitationResponse"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/ExtResponse"
                    }
                  ],
                  "title": "ExtMethodResponse"
                }
              ],
              "description": "All possible responses that a client can send to an agent.\n\nThis enum is used internally for routing RPC responses. You typically won't need\nto use this directly - the responses are handled automatically by the connection.\n\nThese are responses to the corresponding `AgentRequest` variants."
            }
          },
          "required": ["id", "result"],
          "title": "Result",
          "type": "object"
        },
        {
          "properties": {
            "error": {
              "$ref": "#/$defs/Error"
            },
            "id": {
              "$ref": "#/$defs/RequestId"
            }
          },
          "required": ["id", "error"],
          "title": "Error",
          "type": "object"
        }
      ],
      "x-docs-ignore": true
    },
    "CloseNesRequest": {
      "description": "Request to close an NES session.\n\nThe agent **must** cancel any ongoing work related to the NES session\nand then free up any resources associated with the session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the NES session to close."
        }
      },
      "required": ["sessionId"],
      "type": "object",
      "x-method": "nes/close",
      "x-side": "agent"
    },
    "CloseNesResponse": {
      "description": "Response from closing an NES session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "nes/close",
      "x-side": "agent"
    },
    "CloseSessionRequest": {
      "description": "Request parameters for closing an active session.\n\nIf supported, the agent **must** cancel any ongoing work related to the session\n(treat it as if `session/cancel` was called) and then free up any resources\nassociated with the session.\n\nOnly available if the Agent supports the `sessionCapabilities.close` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to close."
        }
      },
      "required": ["sessionId"],
      "type": "object",
      "x-method": "session/close",
      "x-side": "agent"
    },
    "CloseSessionResponse": {
      "description": "Response from closing a session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "session/close",
      "x-side": "agent"
    },
    "CompleteElicitationNotification": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nNotification sent by the agent when a URL-based elicitation is complete.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "elicitationId": {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationId"
            }
          ],
          "description": "The ID of the elicitation that completed."
        }
      },
      "required": ["elicitationId"],
      "type": "object",
      "x-method": "elicitation/complete",
      "x-side": "client"
    },
    "ConfigOptionUpdate": {
      "description": "Session configuration options have been updated.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "configOptions": {
          "description": "The full set of configuration options and their current values.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": "array"
        }
      },
      "required": ["configOptions"],
      "type": "object"
    },
    "Content": {
      "description": "Standard content block (text, images, resources).",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "content": {
          "allOf": [
            {
              "$ref": "#/$defs/ContentBlock"
            }
          ],
          "description": "The actual content block."
        }
      },
      "required": ["content"],
      "type": "object"
    },
    "ContentBlock": {
      "description": "Content blocks represent displayable information in the Agent Client Protocol.\n\nThey provide a structured way to handle various types of user-facing content—whether\nit's text from language models, images for analysis, or embedded resources for context.\n\nContent blocks appear in:\n- User prompts sent via `session/prompt`\n- Language model output streamed through `session/update` notifications\n- Progress updates and results from tool calls\n\nThis structure is compatible with the Model Context Protocol (MCP), enabling\nagents to seamlessly forward content from MCP tool outputs without transformation.\n\nSee protocol docs: [Content](https://agentclientprotocol.com/protocol/content)",
      "discriminator": {
        "propertyName": "type"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/TextContent"
            }
          ],
          "description": "Text content. May be plain text or formatted with Markdown.\n\nAll agents MUST support text content blocks in prompts.\nClients SHOULD render this text as Markdown.",
          "properties": {
            "type": {
              "const": "text",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ImageContent"
            }
          ],
          "description": "Images for visual context or analysis.\n\nRequires the `image` prompt capability when included in prompts.",
          "properties": {
            "type": {
              "const": "image",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/AudioContent"
            }
          ],
          "description": "Audio data for transcription or analysis.\n\nRequires the `audio` prompt capability when included in prompts.",
          "properties": {
            "type": {
              "const": "audio",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ResourceLink"
            }
          ],
          "description": "References to resources that the agent can access.\n\nAll agents MUST support resource links in prompts.",
          "properties": {
            "type": {
              "const": "resource_link",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/EmbeddedResource"
            }
          ],
          "description": "Complete resource contents embedded directly in the message.\n\nPreferred for including context as it avoids extra round-trips.\n\nRequires the `embeddedContext` prompt capability when included in prompts.",
          "properties": {
            "type": {
              "const": "resource",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        }
      ]
    },
    "ContentChunk": {
      "description": "A streamed item of content",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "content": {
          "allOf": [
            {
              "$ref": "#/$defs/ContentBlock"
            }
          ],
          "description": "A single item of content"
        },
        "messageId": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nA unique identifier for the message this chunk belongs to.\n\nAll chunks belonging to the same message share the same `messageId`.\nA change in `messageId` indicates a new message has started.\nBoth clients and agents MUST use UUID format for message IDs.",
          "type": ["string", "null"]
        }
      },
      "required": ["content"],
      "type": "object"
    },
    "Cost": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCost information for a session.",
      "properties": {
        "amount": {
          "description": "Total cumulative cost for session.",
          "format": "double",
          "type": "number"
        },
        "currency": {
          "description": "ISO 4217 currency code (e.g., \"USD\", \"EUR\").",
          "type": "string"
        }
      },
      "required": ["amount", "currency"],
      "type": "object"
    },
    "CreateElicitationRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest from the agent to elicit structured user input.\n\nThe agent sends this to the client to request information from the user,\neither via a form or by directing them to a URL.\nElicitations are tied to a session (optionally a tool call) or a request.",
      "discriminator": {
        "propertyName": "mode"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationFormMode"
            }
          ],
          "description": "Form-based elicitation where the client renders a form from the provided schema.",
          "properties": {
            "mode": {
              "const": "form",
              "type": "string"
            }
          },
          "required": ["mode"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationUrlMode"
            }
          ],
          "description": "URL-based elicitation where the client directs the user to a URL.",
          "properties": {
            "mode": {
              "const": "url",
              "type": "string"
            }
          },
          "required": ["mode"],
          "type": "object"
        }
      ],
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "message": {
          "description": "A human-readable message describing what input is needed.",
          "type": "string"
        }
      },
      "required": ["message"],
      "type": "object",
      "x-method": "elicitation/create",
      "x-side": "client"
    },
    "CreateElicitationResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse from the client to an elicitation request.",
      "discriminator": {
        "propertyName": "action"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationAcceptAction"
            }
          ],
          "description": "The user accepted and provided content.",
          "properties": {
            "action": {
              "const": "accept",
              "type": "string"
            }
          },
          "required": ["action"],
          "type": "object"
        },
        {
          "description": "The user declined the elicitation.",
          "properties": {
            "action": {
              "const": "decline",
              "type": "string"
            }
          },
          "required": ["action"],
          "type": "object"
        },
        {
          "description": "The elicitation was cancelled.",
          "properties": {
            "action": {
              "const": "cancel",
              "type": "string"
            }
          },
          "required": ["action"],
          "type": "object"
        }
      ],
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "elicitation/create",
      "x-side": "client"
    },
    "CreateTerminalRequest": {
      "description": "Request to create a new terminal and execute a command.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "args": {
          "description": "Array of command arguments.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "command": {
          "description": "The command to execute.",
          "type": "string"
        },
        "cwd": {
          "description": "Working directory for the command (absolute path).",
          "type": ["string", "null"]
        },
        "env": {
          "description": "Environment variables for the command.",
          "items": {
            "$ref": "#/$defs/EnvVariable"
          },
          "type": "array"
        },
        "outputByteLimit": {
          "description": "Maximum number of output bytes to retain.\n\nWhen the limit is exceeded, the Client truncates from the beginning of the output\nto stay within the limit.\n\nThe Client MUST ensure truncation happens at a character boundary to maintain valid\nstring output, even if this means the retained output is slightly less than the\nspecified limit.",
          "format": "uint64",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        }
      },
      "required": ["sessionId", "command"],
      "type": "object",
      "x-method": "terminal/create",
      "x-side": "client"
    },
    "CreateTerminalResponse": {
      "description": "Response containing the ID of the created terminal.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "terminalId": {
          "description": "The unique identifier for the created terminal.",
          "type": "string"
        }
      },
      "required": ["terminalId"],
      "type": "object",
      "x-method": "terminal/create",
      "x-side": "client"
    },
    "CurrentModeUpdate": {
      "description": "The current mode of the session has changed\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "currentModeId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionModeId"
            }
          ],
          "description": "The ID of the current mode"
        }
      },
      "required": ["currentModeId"],
      "type": "object"
    },
    "DidChangeDocumentNotification": {
      "description": "Notification sent when a file is edited.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "contentChanges": {
          "description": "The content changes.",
          "items": {
            "$ref": "#/$defs/TextDocumentContentChangeEvent"
          },
          "type": "array"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this notification."
        },
        "uri": {
          "description": "The URI of the changed document.",
          "type": "string"
        },
        "version": {
          "description": "The new version number of the document.",
          "format": "int64",
          "type": "integer"
        }
      },
      "required": ["sessionId", "uri", "version", "contentChanges"],
      "type": "object",
      "x-method": "document/didChange",
      "x-side": "agent"
    },
    "DidCloseDocumentNotification": {
      "description": "Notification sent when a file is closed.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this notification."
        },
        "uri": {
          "description": "The URI of the closed document.",
          "type": "string"
        }
      },
      "required": ["sessionId", "uri"],
      "type": "object",
      "x-method": "document/didClose",
      "x-side": "agent"
    },
    "DidFocusDocumentNotification": {
      "description": "Notification sent when a file becomes the active editor tab.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "position": {
          "allOf": [
            {
              "$ref": "#/$defs/Position"
            }
          ],
          "description": "The current cursor position."
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this notification."
        },
        "uri": {
          "description": "The URI of the focused document.",
          "type": "string"
        },
        "version": {
          "description": "The version number of the document.",
          "format": "int64",
          "type": "integer"
        },
        "visibleRange": {
          "allOf": [
            {
              "$ref": "#/$defs/Range"
            }
          ],
          "description": "The portion of the file currently visible in the editor viewport."
        }
      },
      "required": ["sessionId", "uri", "version", "position", "visibleRange"],
      "type": "object",
      "x-method": "document/didFocus",
      "x-side": "agent"
    },
    "DidOpenDocumentNotification": {
      "description": "Notification sent when a file is opened in the editor.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "languageId": {
          "description": "The language identifier of the document (e.g., \"rust\", \"python\").",
          "type": "string"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this notification."
        },
        "text": {
          "description": "The full text content of the document.",
          "type": "string"
        },
        "uri": {
          "description": "The URI of the opened document.",
          "type": "string"
        },
        "version": {
          "description": "The version number of the document.",
          "format": "int64",
          "type": "integer"
        }
      },
      "required": ["sessionId", "uri", "languageId", "version", "text"],
      "type": "object",
      "x-method": "document/didOpen",
      "x-side": "agent"
    },
    "DidSaveDocumentNotification": {
      "description": "Notification sent when a file is saved.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this notification."
        },
        "uri": {
          "description": "The URI of the saved document.",
          "type": "string"
        }
      },
      "required": ["sessionId", "uri"],
      "type": "object",
      "x-method": "document/didSave",
      "x-side": "agent"
    },
    "Diff": {
      "description": "A diff representing file modifications.\n\nShows changes to files in a format suitable for display in the client UI.\n\nSee protocol docs: [Content](https://agentclientprotocol.com/protocol/tool-calls#content)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "newText": {
          "description": "The new content after modification.",
          "type": "string"
        },
        "oldText": {
          "description": "The original content (None for new files).",
          "type": ["string", "null"]
        },
        "path": {
          "description": "The file path being modified.",
          "type": "string"
        }
      },
      "required": ["path", "newText"],
      "type": "object"
    },
    "DisableProvidersRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for `providers/disable`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "id": {
          "description": "Provider id to disable.",
          "type": "string"
        }
      },
      "required": ["id"],
      "type": "object",
      "x-method": "providers/disable",
      "x-side": "agent"
    },
    "DisableProvidersResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse to `providers/disable`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "providers/disable",
      "x-side": "agent"
    },
    "ElicitationAcceptAction": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe user accepted the elicitation and provided content.",
      "properties": {
        "content": {
          "additionalProperties": {
            "$ref": "#/$defs/ElicitationContentValue"
          },
          "description": "The user-provided content, if any, as an object matching the requested schema.",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "ElicitationCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nElicitation capabilities supported by the client.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "form": {
          "anyOf": [
            {
              "$ref": "#/$defs/ElicitationFormCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the client supports form-based elicitation."
        },
        "url": {
          "anyOf": [
            {
              "$ref": "#/$defs/ElicitationUrlCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the client supports URL-based elicitation."
        }
      },
      "type": "object"
    },
    "ElicitationContentValue": {
      "anyOf": [
        {
          "title": "String",
          "type": "string"
        },
        {
          "format": "int64",
          "title": "Integer",
          "type": "integer"
        },
        {
          "format": "double",
          "title": "Number",
          "type": "number"
        },
        {
          "title": "Boolean",
          "type": "boolean"
        },
        {
          "items": {
            "type": "string"
          },
          "title": "StringArray",
          "type": "array"
        }
      ]
    },
    "ElicitationFormCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nForm-based elicitation capabilities.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "ElicitationFormMode": {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationSessionScope"
            }
          ],
          "description": "Tied to a session, optionally to a specific tool call within that session.",
          "title": "Session"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationRequestScope"
            }
          ],
          "description": "Tied to a specific JSON-RPC request outside of a session\n(e.g., during auth/configuration phases before any session is started).",
          "title": "Request"
        }
      ],
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nForm-based elicitation mode where the client renders a form from the provided schema.",
      "properties": {
        "requestedSchema": {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationSchema"
            }
          ],
          "description": "A JSON Schema describing the form fields to present to the user."
        }
      },
      "required": ["requestedSchema"],
      "type": "object"
    },
    "ElicitationId": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nUnique identifier for an elicitation.",
      "type": "string"
    },
    "ElicitationPropertySchema": {
      "description": "Property schema for elicitation form fields.\n\nEach variant corresponds to a JSON Schema `\"type\"` value.\nSingle-select enums use the `String` variant with `enum` or `oneOf` set.\nMulti-select enums use the `Array` variant.",
      "discriminator": {
        "propertyName": "type"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/StringPropertySchema"
            }
          ],
          "description": "String property (or single-select enum when `enum`/`oneOf` is set).",
          "properties": {
            "type": {
              "const": "string",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/NumberPropertySchema"
            }
          ],
          "description": "Number (floating-point) property.",
          "properties": {
            "type": {
              "const": "number",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/IntegerPropertySchema"
            }
          ],
          "description": "Integer property.",
          "properties": {
            "type": {
              "const": "integer",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/BooleanPropertySchema"
            }
          ],
          "description": "Boolean property.",
          "properties": {
            "type": {
              "const": "boolean",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/MultiSelectPropertySchema"
            }
          ],
          "description": "Multi-select array property.",
          "properties": {
            "type": {
              "const": "array",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        }
      ]
    },
    "ElicitationRequestScope": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest-scoped elicitation, tied to a specific JSON-RPC request outside of a session\n(e.g., during auth/configuration phases before any session is started).",
      "properties": {
        "requestId": {
          "allOf": [
            {
              "$ref": "#/$defs/RequestId"
            }
          ],
          "description": "The request this elicitation is tied to."
        }
      },
      "required": ["requestId"],
      "type": "object"
    },
    "ElicitationSchema": {
      "description": "Type-safe elicitation schema for requesting structured user input.\n\nThis represents a JSON Schema object with primitive-typed properties,\nas required by the elicitation specification.",
      "properties": {
        "description": {
          "description": "Optional description of what this schema represents.",
          "type": ["string", "null"]
        },
        "properties": {
          "additionalProperties": {
            "$ref": "#/$defs/ElicitationPropertySchema"
          },
          "default": {},
          "description": "Property definitions (must be primitive types).",
          "type": "object"
        },
        "required": {
          "description": "List of required property names.",
          "items": {
            "type": "string"
          },
          "type": ["array", "null"]
        },
        "title": {
          "description": "Optional title for the schema.",
          "type": ["string", "null"]
        },
        "type": {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationSchemaType"
            }
          ],
          "default": "object",
          "description": "Type discriminator. Always `\"object\"`."
        }
      },
      "type": "object"
    },
    "ElicitationSchemaType": {
      "description": "Type discriminator for elicitation schemas.",
      "oneOf": [
        {
          "const": "object",
          "description": "Object schema type.",
          "type": "string"
        }
      ]
    },
    "ElicitationSessionScope": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nSession-scoped elicitation, optionally tied to a specific tool call.\n\nWhen `tool_call_id` is set, the elicitation is tied to a specific tool call.\nThis is useful when an agent receives an elicitation from an MCP server\nduring a tool call and needs to redirect it to the user.",
      "properties": {
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session this elicitation is tied to."
        },
        "toolCallId": {
          "anyOf": [
            {
              "$ref": "#/$defs/ToolCallId"
            },
            {
              "type": "null"
            }
          ],
          "description": "Optional tool call within the session."
        }
      },
      "required": ["sessionId"],
      "type": "object"
    },
    "ElicitationStringType": {
      "description": "Items definition for untitled multi-select enum properties.",
      "oneOf": [
        {
          "const": "string",
          "description": "String schema type.",
          "type": "string"
        }
      ]
    },
    "ElicitationUrlCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nURL-based elicitation capabilities.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "ElicitationUrlMode": {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationSessionScope"
            }
          ],
          "description": "Tied to a session, optionally to a specific tool call within that session.",
          "title": "Session"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationRequestScope"
            }
          ],
          "description": "Tied to a specific JSON-RPC request outside of a session\n(e.g., during auth/configuration phases before any session is started).",
          "title": "Request"
        }
      ],
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nURL-based elicitation mode where the client directs the user to a URL.",
      "properties": {
        "elicitationId": {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationId"
            }
          ],
          "description": "The unique identifier for this elicitation."
        },
        "url": {
          "description": "The URL to direct the user to.",
          "format": "uri",
          "type": "string"
        }
      },
      "required": ["elicitationId", "url"],
      "type": "object"
    },
    "EmbeddedResource": {
      "description": "The contents of a resource, embedded into a prompt or tool call result.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "annotations": {
          "anyOf": [
            {
              "$ref": "#/$defs/Annotations"
            },
            {
              "type": "null"
            }
          ]
        },
        "resource": {
          "$ref": "#/$defs/EmbeddedResourceResource"
        }
      },
      "required": ["resource"],
      "type": "object"
    },
    "EmbeddedResourceResource": {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/TextResourceContents"
            }
          ],
          "title": "TextResourceContents"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/BlobResourceContents"
            }
          ],
          "title": "BlobResourceContents"
        }
      ],
      "description": "Resource content that can be embedded in a message."
    },
    "EnumOption": {
      "description": "A titled enum option with a const value and human-readable title.",
      "properties": {
        "const": {
          "description": "The constant value for this option.",
          "type": "string"
        },
        "title": {
          "description": "Human-readable title for this option.",
          "type": "string"
        }
      },
      "required": ["const", "title"],
      "type": "object"
    },
    "EnvVariable": {
      "description": "An environment variable to set when launching an MCP server.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "name": {
          "description": "The name of the environment variable.",
          "type": "string"
        },
        "value": {
          "description": "The value to set for the environment variable.",
          "type": "string"
        }
      },
      "required": ["name", "value"],
      "type": "object"
    },
    "Error": {
      "description": "JSON-RPC error object.\n\nRepresents an error that occurred during method execution, following the\nJSON-RPC 2.0 error object specification with optional additional data.\n\nSee protocol docs: [JSON-RPC Error Object](https://www.jsonrpc.org/specification#error_object)",
      "properties": {
        "code": {
          "allOf": [
            {
              "$ref": "#/$defs/ErrorCode"
            }
          ],
          "description": "A number indicating the error type that occurred.\nThis must be an integer as defined in the JSON-RPC specification."
        },
        "data": {
          "description": "Optional primitive or structured value that contains additional information about the error.\nThis may include debugging information or context-specific details."
        },
        "message": {
          "description": "A string providing a short description of the error.\nThe message should be limited to a concise single sentence.",
          "type": "string"
        }
      },
      "required": ["code", "message"],
      "type": "object"
    },
    "ErrorCode": {
      "anyOf": [
        {
          "const": -32700,
          "description": "**Parse error**: Invalid JSON was received by the server.\nAn error occurred on the server while parsing the JSON text.",
          "format": "int32",
          "title": "Parse error",
          "type": "integer"
        },
        {
          "const": -32600,
          "description": "**Invalid request**: The JSON sent is not a valid Request object.",
          "format": "int32",
          "title": "Invalid request",
          "type": "integer"
        },
        {
          "const": -32601,
          "description": "**Method not found**: The method does not exist or is not available.",
          "format": "int32",
          "title": "Method not found",
          "type": "integer"
        },
        {
          "const": -32602,
          "description": "**Invalid params**: Invalid method parameter(s).",
          "format": "int32",
          "title": "Invalid params",
          "type": "integer"
        },
        {
          "const": -32603,
          "description": "**Internal error**: Internal JSON-RPC error.\nReserved for implementation-defined server errors.",
          "format": "int32",
          "title": "Internal error",
          "type": "integer"
        },
        {
          "const": -32800,
          "description": "**Request cancelled**: **UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nExecution of the method was aborted either due to a cancellation request from the caller or\nbecause of resource constraints or shutdown.",
          "format": "int32",
          "title": "Request cancelled",
          "type": "integer"
        },
        {
          "const": -32000,
          "description": "**Authentication required**: Authentication is required before this operation can be performed.",
          "format": "int32",
          "title": "Authentication required",
          "type": "integer"
        },
        {
          "const": -32002,
          "description": "**Resource not found**: A given resource, such as a file, was not found.",
          "format": "int32",
          "title": "Resource not found",
          "type": "integer"
        },
        {
          "const": -32042,
          "description": "**URL elicitation required**: **UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe agent requires user input via a URL-based elicitation before it can proceed.",
          "format": "int32",
          "title": "URL elicitation required",
          "type": "integer"
        },
        {
          "description": "Other undefined error code.",
          "format": "int32",
          "title": "Other",
          "type": "integer"
        }
      ],
      "description": "Predefined error codes for common JSON-RPC and ACP-specific errors.\n\nThese codes follow the JSON-RPC 2.0 specification for standard errors\nand use the reserved range (-32000 to -32099) for protocol-specific errors."
    },
    "ExtNotification": {
      "description": "Allows the Agent to send an arbitrary notification that is not part of the ACP spec.\nExtension notifications provide a way to send one-way messages for custom functionality\nwhile maintaining protocol compatibility.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)"
    },
    "ExtRequest": {
      "description": "Allows for sending an arbitrary request that is not part of the ACP spec.\nExtension methods provide a way to add custom functionality while maintaining\nprotocol compatibility.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)"
    },
    "ExtResponse": {
      "description": "Allows for sending an arbitrary response to an [`ExtRequest`] that is not part of the ACP spec.\nExtension methods provide a way to add custom functionality while maintaining\nprotocol compatibility.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)"
    },
    "FileSystemCapabilities": {
      "description": "File system capabilities that a client may support.\n\nSee protocol docs: [FileSystem](https://agentclientprotocol.com/protocol/initialization#filesystem)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "readTextFile": {
          "default": false,
          "description": "Whether the Client supports `fs/read_text_file` requests.",
          "type": "boolean"
        },
        "writeTextFile": {
          "default": false,
          "description": "Whether the Client supports `fs/write_text_file` requests.",
          "type": "boolean"
        }
      },
      "type": "object"
    },
    "ForkSessionRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for forking an existing session.\n\nCreates a new session based on the context of an existing one, allowing\noperations like generating summaries without affecting the original session's history.\n\nOnly available if the Agent supports the `session.fork` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "additionalDirectories": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAdditional workspace roots to activate for this session. Each path must be absolute.\n\nWhen omitted or empty, no additional roots are activated. When non-empty,\nthis is the complete resulting additional-root list for the forked\nsession.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "cwd": {
          "description": "The working directory for this session.",
          "type": "string"
        },
        "mcpServers": {
          "description": "List of MCP servers to connect to for this session.",
          "items": {
            "$ref": "#/$defs/McpServer"
          },
          "type": "array"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to fork."
        }
      },
      "required": ["sessionId", "cwd"],
      "type": "object",
      "x-method": "session/fork",
      "x-side": "agent"
    },
    "ForkSessionResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse from forking an existing session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": ["array", "null"]
        },
        "models": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModelState"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        },
        "modes": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModeState"
            },
            {
              "type": "null"
            }
          ],
          "description": "Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "Unique identifier for the newly created forked session."
        }
      },
      "required": ["sessionId"],
      "type": "object",
      "x-method": "session/fork",
      "x-side": "agent"
    },
    "HttpHeader": {
      "description": "An HTTP header to set when making requests to the MCP server.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "name": {
          "description": "The name of the HTTP header.",
          "type": "string"
        },
        "value": {
          "description": "The value to set for the HTTP header.",
          "type": "string"
        }
      },
      "required": ["name", "value"],
      "type": "object"
    },
    "ImageContent": {
      "description": "An image provided to or from an LLM.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "annotations": {
          "anyOf": [
            {
              "$ref": "#/$defs/Annotations"
            },
            {
              "type": "null"
            }
          ]
        },
        "data": {
          "type": "string"
        },
        "mimeType": {
          "type": "string"
        },
        "uri": {
          "type": ["string", "null"]
        }
      },
      "required": ["data", "mimeType"],
      "type": "object"
    },
    "Implementation": {
      "description": "Metadata about the implementation of the client or agent.\nDescribes the name and version of an MCP implementation, with an optional\ntitle for UI representation.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "name": {
          "description": "Intended for programmatic or logical use, but can be used as a display\nname fallback if title isn’t present.",
          "type": "string"
        },
        "title": {
          "description": "Intended for UI and end-user contexts — optimized to be human-readable\nand easily understood.\n\nIf not provided, the name should be used for display.",
          "type": ["string", "null"]
        },
        "version": {
          "description": "Version of the implementation. Can be displayed to the user or used\nfor debugging or metrics purposes. (e.g. \"1.0.0\").",
          "type": "string"
        }
      },
      "required": ["name", "version"],
      "type": "object"
    },
    "InitializeRequest": {
      "description": "Request parameters for the initialize method.\n\nSent by the client to establish connection and negotiate capabilities.\n\nSee protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "clientCapabilities": {
          "allOf": [
            {
              "$ref": "#/$defs/ClientCapabilities"
            }
          ],
          "default": {
            "auth": {
              "terminal": false
            },
            "fs": {
              "readTextFile": false,
              "writeTextFile": false
            },
            "terminal": false
          },
          "description": "Capabilities supported by the client."
        },
        "clientInfo": {
          "anyOf": [
            {
              "$ref": "#/$defs/Implementation"
            },
            {
              "type": "null"
            }
          ],
          "description": "Information about the Client name and version sent to the Agent.\n\nNote: in future versions of the protocol, this will be required."
        },
        "protocolVersion": {
          "allOf": [
            {
              "$ref": "#/$defs/ProtocolVersion"
            }
          ],
          "description": "The latest protocol version supported by the client."
        }
      },
      "required": ["protocolVersion"],
      "type": "object",
      "x-method": "initialize",
      "x-side": "agent"
    },
    "InitializeResponse": {
      "description": "Response to the `initialize` method.\n\nContains the negotiated protocol version and agent capabilities.\n\nSee protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "agentCapabilities": {
          "allOf": [
            {
              "$ref": "#/$defs/AgentCapabilities"
            }
          ],
          "default": {
            "auth": {},
            "loadSession": false,
            "mcpCapabilities": {
              "http": false,
              "sse": false
            },
            "promptCapabilities": {
              "audio": false,
              "embeddedContext": false,
              "image": false
            },
            "sessionCapabilities": {}
          },
          "description": "Capabilities supported by the agent."
        },
        "agentInfo": {
          "anyOf": [
            {
              "$ref": "#/$defs/Implementation"
            },
            {
              "type": "null"
            }
          ],
          "description": "Information about the Agent name and version sent to the Client.\n\nNote: in future versions of the protocol, this will be required."
        },
        "authMethods": {
          "default": [],
          "description": "Authentication methods supported by the agent.",
          "items": {
            "$ref": "#/$defs/AuthMethod"
          },
          "type": "array"
        },
        "protocolVersion": {
          "allOf": [
            {
              "$ref": "#/$defs/ProtocolVersion"
            }
          ],
          "description": "The protocol version the client specified if supported by the agent,\nor the latest protocol version supported by the agent.\n\nThe client should disconnect, if it doesn't support this version."
        }
      },
      "required": ["protocolVersion"],
      "type": "object",
      "x-method": "initialize",
      "x-side": "agent"
    },
    "IntegerPropertySchema": {
      "description": "Schema for integer properties in an elicitation form.",
      "properties": {
        "default": {
          "description": "Default value.",
          "format": "int64",
          "type": ["integer", "null"]
        },
        "description": {
          "description": "Human-readable description.",
          "type": ["string", "null"]
        },
        "maximum": {
          "description": "Maximum value (inclusive).",
          "format": "int64",
          "type": ["integer", "null"]
        },
        "minimum": {
          "description": "Minimum value (inclusive).",
          "format": "int64",
          "type": ["integer", "null"]
        },
        "title": {
          "description": "Optional title for the property.",
          "type": ["string", "null"]
        }
      },
      "type": "object"
    },
    "KillTerminalRequest": {
      "description": "Request to kill a terminal without releasing it.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        },
        "terminalId": {
          "description": "The ID of the terminal to kill.",
          "type": "string"
        }
      },
      "required": ["sessionId", "terminalId"],
      "type": "object",
      "x-method": "terminal/kill",
      "x-side": "client"
    },
    "KillTerminalResponse": {
      "description": "Response to `terminal/kill` method",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "terminal/kill",
      "x-side": "client"
    },
    "ListProvidersRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for `providers/list`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "providers/list",
      "x-side": "agent"
    },
    "ListProvidersResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse to `providers/list`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "providers": {
          "description": "Configurable providers with current routing info suitable for UI display.",
          "items": {
            "$ref": "#/$defs/ProviderInfo"
          },
          "type": "array"
        }
      },
      "required": ["providers"],
      "type": "object",
      "x-method": "providers/list",
      "x-side": "agent"
    },
    "ListSessionsRequest": {
      "description": "Request parameters for listing existing sessions.\n\nOnly available if the Agent supports the `sessionCapabilities.list` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "additionalDirectories": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nFilter sessions by the exact ordered additional workspace roots. Each path must be absolute.\n\nThis filter applies only when the field is present and non-empty. When\nomitted or empty, no additional-root filter is applied.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "cursor": {
          "description": "Opaque cursor token from a previous response's nextCursor field for cursor-based pagination",
          "type": ["string", "null"]
        },
        "cwd": {
          "description": "Filter sessions by working directory. Must be an absolute path.",
          "type": ["string", "null"]
        }
      },
      "type": "object",
      "x-method": "session/list",
      "x-side": "agent"
    },
    "ListSessionsResponse": {
      "description": "Response from listing sessions.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "nextCursor": {
          "description": "Opaque cursor token. If present, pass this in the next request's cursor parameter\nto fetch the next page. If absent, there are no more results.",
          "type": ["string", "null"]
        },
        "sessions": {
          "description": "Array of session information objects",
          "items": {
            "$ref": "#/$defs/SessionInfo"
          },
          "type": "array"
        }
      },
      "required": ["sessions"],
      "type": "object",
      "x-method": "session/list",
      "x-side": "agent"
    },
    "LlmProtocol": {
      "anyOf": [
        {
          "const": "anthropic",
          "description": "Anthropic API protocol.",
          "type": "string"
        },
        {
          "const": "openai",
          "description": "OpenAI API protocol.",
          "type": "string"
        },
        {
          "const": "azure",
          "description": "Azure OpenAI API protocol.",
          "type": "string"
        },
        {
          "const": "vertex",
          "description": "Google Vertex AI API protocol.",
          "type": "string"
        },
        {
          "const": "bedrock",
          "description": "AWS Bedrock API protocol.",
          "type": "string"
        },
        {
          "description": "Unknown or custom protocol.",
          "title": "other",
          "type": "string"
        }
      ],
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWell-known API protocol identifiers for LLM providers.\n\nAgents and clients MUST handle unknown protocol identifiers gracefully.\n\nProtocol names beginning with `_` are free for custom use, like other ACP extension methods.\nProtocol names that do not begin with `_` are reserved for the ACP spec."
    },
    "LoadSessionRequest": {
      "description": "Request parameters for loading an existing session.\n\nOnly available if the Agent supports the `loadSession` capability.\n\nSee protocol docs: [Loading Sessions](https://agentclientprotocol.com/protocol/session-setup#loading-sessions)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "additionalDirectories": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAdditional workspace roots to activate for this session. Each path must be absolute.\n\nWhen omitted or empty, no additional roots are activated. When non-empty,\nthis is the complete resulting additional-root list for the loaded\nsession.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "cwd": {
          "description": "The working directory for this session.",
          "type": "string"
        },
        "mcpServers": {
          "description": "List of MCP servers to connect to for this session.",
          "items": {
            "$ref": "#/$defs/McpServer"
          },
          "type": "array"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to load."
        }
      },
      "required": ["mcpServers", "cwd", "sessionId"],
      "type": "object",
      "x-method": "session/load",
      "x-side": "agent"
    },
    "LoadSessionResponse": {
      "description": "Response from loading an existing session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": ["array", "null"]
        },
        "models": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModelState"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        },
        "modes": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModeState"
            },
            {
              "type": "null"
            }
          ],
          "description": "Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        }
      },
      "type": "object",
      "x-method": "session/load",
      "x-side": "agent"
    },
    "LogoutCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nLogout capabilities supported by the agent.\n\nBy supplying `{}` it means that the agent supports the logout method.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "LogoutRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for the logout method.\n\nTerminates the current authenticated session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "logout",
      "x-side": "agent"
    },
    "LogoutResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse to the `logout` method.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "logout",
      "x-side": "agent"
    },
    "McpCapabilities": {
      "description": "MCP capabilities supported by the agent",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "http": {
          "default": false,
          "description": "Agent supports [`McpServer::Http`].",
          "type": "boolean"
        },
        "sse": {
          "default": false,
          "description": "Agent supports [`McpServer::Sse`].",
          "type": "boolean"
        }
      },
      "type": "object"
    },
    "McpServer": {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/McpServerHttp"
            }
          ],
          "description": "HTTP transport configuration\n\nOnly available when the Agent capabilities indicate `mcp_capabilities.http` is `true`.",
          "properties": {
            "type": {
              "const": "http",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/McpServerSse"
            }
          ],
          "description": "SSE transport configuration\n\nOnly available when the Agent capabilities indicate `mcp_capabilities.sse` is `true`.",
          "properties": {
            "type": {
              "const": "sse",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/McpServerStdio"
            }
          ],
          "description": "Stdio transport configuration\n\nAll Agents MUST support this transport.",
          "title": "stdio"
        }
      ],
      "description": "Configuration for connecting to an MCP (Model Context Protocol) server.\n\nMCP servers provide tools and context that the agent can use when\nprocessing prompts.\n\nSee protocol docs: [MCP Servers](https://agentclientprotocol.com/protocol/session-setup#mcp-servers)"
    },
    "McpServerHttp": {
      "description": "HTTP transport configuration for MCP.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "headers": {
          "description": "HTTP headers to set when making requests to the MCP server.",
          "items": {
            "$ref": "#/$defs/HttpHeader"
          },
          "type": "array"
        },
        "name": {
          "description": "Human-readable name identifying this MCP server.",
          "type": "string"
        },
        "url": {
          "description": "URL to the MCP server.",
          "type": "string"
        }
      },
      "required": ["name", "url", "headers"],
      "type": "object"
    },
    "McpServerSse": {
      "description": "SSE transport configuration for MCP.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "headers": {
          "description": "HTTP headers to set when making requests to the MCP server.",
          "items": {
            "$ref": "#/$defs/HttpHeader"
          },
          "type": "array"
        },
        "name": {
          "description": "Human-readable name identifying this MCP server.",
          "type": "string"
        },
        "url": {
          "description": "URL to the MCP server.",
          "type": "string"
        }
      },
      "required": ["name", "url", "headers"],
      "type": "object"
    },
    "McpServerStdio": {
      "description": "Stdio transport configuration for MCP.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "args": {
          "description": "Command-line arguments to pass to the MCP server.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "command": {
          "description": "Path to the MCP server executable.",
          "type": "string"
        },
        "env": {
          "description": "Environment variables to set when launching the MCP server.",
          "items": {
            "$ref": "#/$defs/EnvVariable"
          },
          "type": "array"
        },
        "name": {
          "description": "Human-readable name identifying this MCP server.",
          "type": "string"
        }
      },
      "required": ["name", "command", "args", "env"],
      "type": "object"
    },
    "ModelId": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nA unique identifier for a model.",
      "type": "string"
    },
    "ModelInfo": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInformation about a selectable model.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "description": {
          "description": "Optional description of the model.",
          "type": ["string", "null"]
        },
        "modelId": {
          "allOf": [
            {
              "$ref": "#/$defs/ModelId"
            }
          ],
          "description": "Unique identifier for the model."
        },
        "name": {
          "description": "Human-readable name of the model.",
          "type": "string"
        }
      },
      "required": ["modelId", "name"],
      "type": "object"
    },
    "MultiSelectItems": {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/UntitledMultiSelectItems"
            }
          ],
          "description": "Untitled multi-select items with plain string values.",
          "title": "Untitled"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/TitledMultiSelectItems"
            }
          ],
          "description": "Titled multi-select items with human-readable labels.",
          "title": "Titled"
        }
      ],
      "description": "Items for a multi-select (array) property schema."
    },
    "MultiSelectPropertySchema": {
      "description": "Schema for multi-select (array) properties in an elicitation form.",
      "properties": {
        "default": {
          "description": "Default selected values.",
          "items": {
            "type": "string"
          },
          "type": ["array", "null"]
        },
        "description": {
          "description": "Human-readable description.",
          "type": ["string", "null"]
        },
        "items": {
          "allOf": [
            {
              "$ref": "#/$defs/MultiSelectItems"
            }
          ],
          "description": "The items definition describing allowed values."
        },
        "maxItems": {
          "description": "Maximum number of items to select.",
          "format": "uint64",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "minItems": {
          "description": "Minimum number of items to select.",
          "format": "uint64",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "title": {
          "description": "Optional title for the property.",
          "type": ["string", "null"]
        }
      },
      "required": ["items"],
      "type": "object"
    },
    "NesCapabilities": {
      "description": "NES capabilities advertised by the agent during initialization.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "context": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesContextCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Context the agent wants attached to each suggestion request."
        },
        "events": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesEventCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Events the agent wants to receive."
        }
      },
      "type": "object"
    },
    "NesContextCapabilities": {
      "description": "Context capabilities the agent wants attached to each suggestion request.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "diagnostics": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesDiagnosticsCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants diagnostics context."
        },
        "editHistory": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesEditHistoryCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants edit history context."
        },
        "openFiles": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesOpenFilesCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants open files context."
        },
        "recentFiles": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesRecentFilesCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants recent files context."
        },
        "relatedSnippets": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesRelatedSnippetsCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants related snippets context."
        },
        "userActions": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesUserActionsCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants user actions context."
        }
      },
      "type": "object"
    },
    "NesDiagnostic": {
      "description": "A diagnostic (error, warning, etc.).",
      "properties": {
        "message": {
          "description": "The diagnostic message.",
          "type": "string"
        },
        "range": {
          "allOf": [
            {
              "$ref": "#/$defs/Range"
            }
          ],
          "description": "The range of the diagnostic."
        },
        "severity": {
          "allOf": [
            {
              "$ref": "#/$defs/NesDiagnosticSeverity"
            }
          ],
          "description": "The severity of the diagnostic."
        },
        "uri": {
          "description": "The URI of the file containing the diagnostic.",
          "type": "string"
        }
      },
      "required": ["uri", "range", "severity", "message"],
      "type": "object"
    },
    "NesDiagnosticSeverity": {
      "description": "Severity of a diagnostic.",
      "oneOf": [
        {
          "const": "error",
          "description": "An error.",
          "type": "string"
        },
        {
          "const": "warning",
          "description": "A warning.",
          "type": "string"
        },
        {
          "const": "information",
          "description": "An informational message.",
          "type": "string"
        },
        {
          "const": "hint",
          "description": "A hint.",
          "type": "string"
        }
      ]
    },
    "NesDiagnosticsCapabilities": {
      "description": "Capabilities for diagnostics context.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesDocumentDidChangeCapabilities": {
      "description": "Capabilities for `document/didChange` events.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "syncKind": {
          "allOf": [
            {
              "$ref": "#/$defs/TextDocumentSyncKind"
            }
          ],
          "description": "The sync kind the agent wants: `\"full\"` or `\"incremental\"`."
        }
      },
      "required": ["syncKind"],
      "type": "object"
    },
    "NesDocumentDidCloseCapabilities": {
      "description": "Marker for `document/didClose` capability support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesDocumentDidFocusCapabilities": {
      "description": "Marker for `document/didFocus` capability support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesDocumentDidOpenCapabilities": {
      "description": "Marker for `document/didOpen` capability support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesDocumentDidSaveCapabilities": {
      "description": "Marker for `document/didSave` capability support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesDocumentEventCapabilities": {
      "description": "Document event capabilities the agent wants to receive.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "didChange": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesDocumentDidChangeCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants `document/didChange` events, and the sync kind."
        },
        "didClose": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesDocumentDidCloseCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants `document/didClose` events."
        },
        "didFocus": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesDocumentDidFocusCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants `document/didFocus` events."
        },
        "didOpen": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesDocumentDidOpenCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants `document/didOpen` events."
        },
        "didSave": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesDocumentDidSaveCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent wants `document/didSave` events."
        }
      },
      "type": "object"
    },
    "NesEditHistoryCapabilities": {
      "description": "Capabilities for edit history context.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "maxCount": {
          "description": "Maximum number of edit history entries the agent can use.",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        }
      },
      "type": "object"
    },
    "NesEditHistoryEntry": {
      "description": "An entry in the edit history.",
      "properties": {
        "diff": {
          "description": "A diff representing the edit.",
          "type": "string"
        },
        "uri": {
          "description": "The URI of the edited file.",
          "type": "string"
        }
      },
      "required": ["uri", "diff"],
      "type": "object"
    },
    "NesEditSuggestion": {
      "description": "A text edit suggestion.",
      "properties": {
        "cursorPosition": {
          "anyOf": [
            {
              "$ref": "#/$defs/Position"
            },
            {
              "type": "null"
            }
          ],
          "description": "Optional suggested cursor position after applying edits."
        },
        "edits": {
          "description": "The text edits to apply.",
          "items": {
            "$ref": "#/$defs/NesTextEdit"
          },
          "type": "array"
        },
        "id": {
          "description": "Unique identifier for accept/reject tracking.",
          "type": "string"
        },
        "uri": {
          "description": "The URI of the file to edit.",
          "type": "string"
        }
      },
      "required": ["id", "uri", "edits"],
      "type": "object"
    },
    "NesEventCapabilities": {
      "description": "Event capabilities the agent can consume.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "document": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesDocumentEventCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Document event capabilities."
        }
      },
      "type": "object"
    },
    "NesExcerpt": {
      "description": "A code excerpt from a file.",
      "properties": {
        "endLine": {
          "description": "The end line of the excerpt (zero-based).",
          "format": "uint32",
          "minimum": 0,
          "type": "integer"
        },
        "startLine": {
          "description": "The start line of the excerpt (zero-based).",
          "format": "uint32",
          "minimum": 0,
          "type": "integer"
        },
        "text": {
          "description": "The text content of the excerpt.",
          "type": "string"
        }
      },
      "required": ["startLine", "endLine", "text"],
      "type": "object"
    },
    "NesJumpCapabilities": {
      "description": "Marker for jump suggestion support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesJumpSuggestion": {
      "description": "A jump-to-location suggestion.",
      "properties": {
        "id": {
          "description": "Unique identifier for accept/reject tracking.",
          "type": "string"
        },
        "position": {
          "allOf": [
            {
              "$ref": "#/$defs/Position"
            }
          ],
          "description": "The target position within the file."
        },
        "uri": {
          "description": "The file to navigate to.",
          "type": "string"
        }
      },
      "required": ["id", "uri", "position"],
      "type": "object"
    },
    "NesOpenFile": {
      "description": "An open file in the editor.",
      "properties": {
        "languageId": {
          "description": "The language identifier.",
          "type": "string"
        },
        "lastFocusedMs": {
          "description": "Timestamp in milliseconds since epoch of when the file was last focused.",
          "format": "uint64",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "uri": {
          "description": "The URI of the file.",
          "type": "string"
        },
        "visibleRange": {
          "anyOf": [
            {
              "$ref": "#/$defs/Range"
            },
            {
              "type": "null"
            }
          ],
          "description": "The visible range in the editor, if any."
        }
      },
      "required": ["uri", "languageId"],
      "type": "object"
    },
    "NesOpenFilesCapabilities": {
      "description": "Capabilities for open files context.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesRecentFile": {
      "description": "A recently accessed file.",
      "properties": {
        "languageId": {
          "description": "The language identifier.",
          "type": "string"
        },
        "text": {
          "description": "The full text content of the file.",
          "type": "string"
        },
        "uri": {
          "description": "The URI of the file.",
          "type": "string"
        }
      },
      "required": ["uri", "languageId", "text"],
      "type": "object"
    },
    "NesRecentFilesCapabilities": {
      "description": "Capabilities for recent files context.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "maxCount": {
          "description": "Maximum number of recent files the agent can use.",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        }
      },
      "type": "object"
    },
    "NesRejectReason": {
      "description": "The reason a suggestion was rejected.",
      "oneOf": [
        {
          "const": "rejected",
          "description": "The user explicitly dismissed the suggestion.",
          "type": "string"
        },
        {
          "const": "ignored",
          "description": "The suggestion was shown but the user continued editing without interacting.",
          "type": "string"
        },
        {
          "const": "replaced",
          "description": "The suggestion was superseded by a newer suggestion.",
          "type": "string"
        },
        {
          "const": "cancelled",
          "description": "The request was cancelled before the agent returned a response.",
          "type": "string"
        }
      ]
    },
    "NesRelatedSnippet": {
      "description": "A related code snippet from a file.",
      "properties": {
        "excerpts": {
          "description": "The code excerpts.",
          "items": {
            "$ref": "#/$defs/NesExcerpt"
          },
          "type": "array"
        },
        "uri": {
          "description": "The URI of the file containing the snippets.",
          "type": "string"
        }
      },
      "required": ["uri", "excerpts"],
      "type": "object"
    },
    "NesRelatedSnippetsCapabilities": {
      "description": "Capabilities for related snippets context.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesRenameCapabilities": {
      "description": "Marker for rename suggestion support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesRenameSuggestion": {
      "description": "A rename symbol suggestion.",
      "properties": {
        "id": {
          "description": "Unique identifier for accept/reject tracking.",
          "type": "string"
        },
        "newName": {
          "description": "The new name for the symbol.",
          "type": "string"
        },
        "position": {
          "allOf": [
            {
              "$ref": "#/$defs/Position"
            }
          ],
          "description": "The position of the symbol to rename."
        },
        "uri": {
          "description": "The file URI containing the symbol.",
          "type": "string"
        }
      },
      "required": ["id", "uri", "position", "newName"],
      "type": "object"
    },
    "NesRepository": {
      "description": "Repository metadata for an NES session.",
      "properties": {
        "name": {
          "description": "The repository name.",
          "type": "string"
        },
        "owner": {
          "description": "The repository owner.",
          "type": "string"
        },
        "remoteUrl": {
          "description": "The remote URL of the repository.",
          "type": "string"
        }
      },
      "required": ["name", "owner", "remoteUrl"],
      "type": "object"
    },
    "NesSearchAndReplaceCapabilities": {
      "description": "Marker for search and replace suggestion support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "NesSearchAndReplaceSuggestion": {
      "description": "A search-and-replace suggestion.",
      "properties": {
        "id": {
          "description": "Unique identifier for accept/reject tracking.",
          "type": "string"
        },
        "isRegex": {
          "description": "Whether `search` is a regular expression. Defaults to `false`.",
          "type": ["boolean", "null"]
        },
        "replace": {
          "description": "The replacement text.",
          "type": "string"
        },
        "search": {
          "description": "The text or pattern to find.",
          "type": "string"
        },
        "uri": {
          "description": "The file URI to search within.",
          "type": "string"
        }
      },
      "required": ["id", "uri", "search", "replace"],
      "type": "object"
    },
    "NesSuggestContext": {
      "description": "Context attached to a suggestion request.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "diagnostics": {
          "description": "Current diagnostics (errors, warnings).",
          "items": {
            "$ref": "#/$defs/NesDiagnostic"
          },
          "type": ["array", "null"]
        },
        "editHistory": {
          "description": "Recent edit history.",
          "items": {
            "$ref": "#/$defs/NesEditHistoryEntry"
          },
          "type": ["array", "null"]
        },
        "openFiles": {
          "description": "Currently open files in the editor.",
          "items": {
            "$ref": "#/$defs/NesOpenFile"
          },
          "type": ["array", "null"]
        },
        "recentFiles": {
          "description": "Recently accessed files.",
          "items": {
            "$ref": "#/$defs/NesRecentFile"
          },
          "type": ["array", "null"]
        },
        "relatedSnippets": {
          "description": "Related code snippets.",
          "items": {
            "$ref": "#/$defs/NesRelatedSnippet"
          },
          "type": ["array", "null"]
        },
        "userActions": {
          "description": "Recent user actions (typing, navigation, etc.).",
          "items": {
            "$ref": "#/$defs/NesUserAction"
          },
          "type": ["array", "null"]
        }
      },
      "type": "object"
    },
    "NesSuggestion": {
      "description": "A suggestion returned by the agent.",
      "discriminator": {
        "propertyName": "kind"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/NesEditSuggestion"
            }
          ],
          "description": "A text edit suggestion.",
          "properties": {
            "kind": {
              "const": "edit",
              "type": "string"
            }
          },
          "required": ["kind"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/NesJumpSuggestion"
            }
          ],
          "description": "A jump-to-location suggestion.",
          "properties": {
            "kind": {
              "const": "jump",
              "type": "string"
            }
          },
          "required": ["kind"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/NesRenameSuggestion"
            }
          ],
          "description": "A rename symbol suggestion.",
          "properties": {
            "kind": {
              "const": "rename",
              "type": "string"
            }
          },
          "required": ["kind"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/NesSearchAndReplaceSuggestion"
            }
          ],
          "description": "A search-and-replace suggestion.",
          "properties": {
            "kind": {
              "const": "searchAndReplace",
              "type": "string"
            }
          },
          "required": ["kind"],
          "type": "object"
        }
      ]
    },
    "NesTextEdit": {
      "description": "A text edit within a suggestion.",
      "properties": {
        "newText": {
          "description": "The replacement text.",
          "type": "string"
        },
        "range": {
          "allOf": [
            {
              "$ref": "#/$defs/Range"
            }
          ],
          "description": "The range to replace."
        }
      },
      "required": ["range", "newText"],
      "type": "object"
    },
    "NesTriggerKind": {
      "description": "What triggered the suggestion request.",
      "oneOf": [
        {
          "const": "automatic",
          "description": "Triggered by user typing or cursor movement.",
          "type": "string"
        },
        {
          "const": "diagnostic",
          "description": "Triggered by a diagnostic appearing at or near the cursor.",
          "type": "string"
        },
        {
          "const": "manual",
          "description": "Triggered by an explicit user action (keyboard shortcut).",
          "type": "string"
        }
      ]
    },
    "NesUserAction": {
      "description": "A user action (typing, cursor movement, etc.).",
      "properties": {
        "action": {
          "description": "The kind of action (e.g., \"insertChar\", \"cursorMovement\").",
          "type": "string"
        },
        "position": {
          "allOf": [
            {
              "$ref": "#/$defs/Position"
            }
          ],
          "description": "The position where the action occurred."
        },
        "timestampMs": {
          "description": "Timestamp in milliseconds since epoch.",
          "format": "uint64",
          "minimum": 0,
          "type": "integer"
        },
        "uri": {
          "description": "The URI of the file where the action occurred.",
          "type": "string"
        }
      },
      "required": ["action", "uri", "position", "timestampMs"],
      "type": "object"
    },
    "NesUserActionsCapabilities": {
      "description": "Capabilities for user actions context.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "maxCount": {
          "description": "Maximum number of user actions the agent can use.",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        }
      },
      "type": "object"
    },
    "NewSessionRequest": {
      "description": "Request parameters for creating a new session.\n\nSee protocol docs: [Creating a Session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "additionalDirectories": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAdditional workspace roots for this session. Each path must be absolute.\n\nThese expand the session's filesystem scope without changing `cwd`, which\nremains the base for relative paths. When omitted or empty, no\nadditional roots are activated for the new session.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "cwd": {
          "description": "The working directory for this session. Must be an absolute path.",
          "type": "string"
        },
        "mcpServers": {
          "description": "List of MCP (Model Context Protocol) servers the agent should connect to.",
          "items": {
            "$ref": "#/$defs/McpServer"
          },
          "type": "array"
        }
      },
      "required": ["cwd", "mcpServers"],
      "type": "object",
      "x-method": "session/new",
      "x-side": "agent"
    },
    "NewSessionResponse": {
      "description": "Response from creating a new session.\n\nSee protocol docs: [Creating a Session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": ["array", "null"]
        },
        "models": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModelState"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        },
        "modes": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModeState"
            },
            {
              "type": "null"
            }
          ],
          "description": "Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "Unique identifier for the created session.\n\nUsed in all subsequent requests for this conversation."
        }
      },
      "required": ["sessionId"],
      "type": "object",
      "x-method": "session/new",
      "x-side": "agent"
    },
    "NumberPropertySchema": {
      "description": "Schema for number (floating-point) properties in an elicitation form.",
      "properties": {
        "default": {
          "description": "Default value.",
          "format": "double",
          "type": ["number", "null"]
        },
        "description": {
          "description": "Human-readable description.",
          "type": ["string", "null"]
        },
        "maximum": {
          "description": "Maximum value (inclusive).",
          "format": "double",
          "type": ["number", "null"]
        },
        "minimum": {
          "description": "Minimum value (inclusive).",
          "format": "double",
          "type": ["number", "null"]
        },
        "title": {
          "description": "Optional title for the property.",
          "type": ["string", "null"]
        }
      },
      "type": "object"
    },
    "PermissionOption": {
      "description": "An option presented to the user when requesting permission.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "kind": {
          "allOf": [
            {
              "$ref": "#/$defs/PermissionOptionKind"
            }
          ],
          "description": "Hint about the nature of this permission option."
        },
        "name": {
          "description": "Human-readable label to display to the user.",
          "type": "string"
        },
        "optionId": {
          "allOf": [
            {
              "$ref": "#/$defs/PermissionOptionId"
            }
          ],
          "description": "Unique identifier for this permission option."
        }
      },
      "required": ["optionId", "name", "kind"],
      "type": "object"
    },
    "PermissionOptionId": {
      "description": "Unique identifier for a permission option.",
      "type": "string"
    },
    "PermissionOptionKind": {
      "description": "The type of permission option being presented to the user.\n\nHelps clients choose appropriate icons and UI treatment.",
      "oneOf": [
        {
          "const": "allow_once",
          "description": "Allow this operation only this time.",
          "type": "string"
        },
        {
          "const": "allow_always",
          "description": "Allow this operation and remember the choice.",
          "type": "string"
        },
        {
          "const": "reject_once",
          "description": "Reject this operation only this time.",
          "type": "string"
        },
        {
          "const": "reject_always",
          "description": "Reject this operation and remember the choice.",
          "type": "string"
        }
      ]
    },
    "Plan": {
      "description": "An execution plan for accomplishing complex tasks.\n\nPlans consist of multiple entries representing individual tasks or goals.\nAgents report plans to clients to provide visibility into their execution strategy.\nPlans can evolve during execution as the agent discovers new requirements or completes tasks.\n\nSee protocol docs: [Agent Plan](https://agentclientprotocol.com/protocol/agent-plan)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "entries": {
          "description": "The list of tasks to be accomplished.\n\nWhen updating a plan, the agent must send a complete list of all entries\nwith their current status. The client replaces the entire plan with each update.",
          "items": {
            "$ref": "#/$defs/PlanEntry"
          },
          "type": "array"
        }
      },
      "required": ["entries"],
      "type": "object"
    },
    "PlanEntry": {
      "description": "A single entry in the execution plan.\n\nRepresents a task or goal that the assistant intends to accomplish\nas part of fulfilling the user's request.\nSee protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "content": {
          "description": "Human-readable description of what this task aims to accomplish.",
          "type": "string"
        },
        "priority": {
          "allOf": [
            {
              "$ref": "#/$defs/PlanEntryPriority"
            }
          ],
          "description": "The relative importance of this task.\nUsed to indicate which tasks are most critical to the overall goal."
        },
        "status": {
          "allOf": [
            {
              "$ref": "#/$defs/PlanEntryStatus"
            }
          ],
          "description": "Current execution status of this task."
        }
      },
      "required": ["content", "priority", "status"],
      "type": "object"
    },
    "PlanEntryPriority": {
      "description": "Priority levels for plan entries.\n\nUsed to indicate the relative importance or urgency of different\ntasks in the execution plan.\nSee protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)",
      "oneOf": [
        {
          "const": "high",
          "description": "High priority task - critical to the overall goal.",
          "type": "string"
        },
        {
          "const": "medium",
          "description": "Medium priority task - important but not critical.",
          "type": "string"
        },
        {
          "const": "low",
          "description": "Low priority task - nice to have but not essential.",
          "type": "string"
        }
      ]
    },
    "PlanEntryStatus": {
      "description": "Status of a plan entry in the execution flow.\n\nTracks the lifecycle of each task from planning through completion.\nSee protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)",
      "oneOf": [
        {
          "const": "pending",
          "description": "The task has not started yet.",
          "type": "string"
        },
        {
          "const": "in_progress",
          "description": "The task is currently being worked on.",
          "type": "string"
        },
        {
          "const": "completed",
          "description": "The task has been successfully completed.",
          "type": "string"
        }
      ]
    },
    "Position": {
      "description": "A zero-based position in a text document.\n\nThe meaning of `character` depends on the negotiated position encoding.",
      "properties": {
        "character": {
          "description": "Zero-based character offset (encoding-dependent).",
          "format": "uint32",
          "minimum": 0,
          "type": "integer"
        },
        "line": {
          "description": "Zero-based line number.",
          "format": "uint32",
          "minimum": 0,
          "type": "integer"
        }
      },
      "required": ["line", "character"],
      "type": "object"
    },
    "PositionEncodingKind": {
      "description": "The encoding used for character offsets in positions.\n\nFollows the same conventions as LSP 3.17. The default is UTF-16.",
      "oneOf": [
        {
          "const": "utf-16",
          "description": "Character offsets count UTF-16 code units. This is the default.",
          "type": "string"
        },
        {
          "const": "utf-32",
          "description": "Character offsets count Unicode code points.",
          "type": "string"
        },
        {
          "const": "utf-8",
          "description": "Character offsets count UTF-8 code units (bytes).",
          "type": "string"
        }
      ]
    },
    "PromptCapabilities": {
      "description": "Prompt capabilities supported by the agent in `session/prompt` requests.\n\nBaseline agent functionality requires support for [`ContentBlock::Text`]\nand [`ContentBlock::ResourceLink`] in prompt requests.\n\nOther variants must be explicitly opted in to.\nCapabilities for different types of content in prompt requests.\n\nIndicates which content types beyond the baseline (text and resource links)\nthe agent can process.\n\nSee protocol docs: [Prompt Capabilities](https://agentclientprotocol.com/protocol/initialization#prompt-capabilities)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "audio": {
          "default": false,
          "description": "Agent supports [`ContentBlock::Audio`].",
          "type": "boolean"
        },
        "embeddedContext": {
          "default": false,
          "description": "Agent supports embedded context in `session/prompt` requests.\n\nWhen enabled, the Client is allowed to include [`ContentBlock::Resource`]\nin prompt requests for pieces of context that are referenced in the message.",
          "type": "boolean"
        },
        "image": {
          "default": false,
          "description": "Agent supports [`ContentBlock::Image`].",
          "type": "boolean"
        }
      },
      "type": "object"
    },
    "PromptRequest": {
      "description": "Request parameters for sending a user prompt to the agent.\n\nContains the user's message and any additional context.\n\nSee protocol docs: [User Message](https://agentclientprotocol.com/protocol/prompt-turn#1-user-message)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "messageId": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nA client-generated unique identifier for this user message.\n\nIf provided, the Agent SHOULD echo this value as `userMessageId` in the\n[`PromptResponse`] to confirm it was recorded.\nBoth clients and agents MUST use UUID format for message IDs.",
          "type": ["string", "null"]
        },
        "prompt": {
          "description": "The blocks of content that compose the user's message.\n\nAs a baseline, the Agent MUST support [`ContentBlock::Text`] and [`ContentBlock::ResourceLink`],\nwhile other variants are optionally enabled via [`PromptCapabilities`].\n\nThe Client MUST adapt its interface according to [`PromptCapabilities`].\n\nThe client MAY include referenced pieces of context as either\n[`ContentBlock::Resource`] or [`ContentBlock::ResourceLink`].\n\nWhen available, [`ContentBlock::Resource`] is preferred\nas it avoids extra round-trips and allows the message to include\npieces of context from sources the agent may not have access to.",
          "items": {
            "$ref": "#/$defs/ContentBlock"
          },
          "type": "array"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to send this user message to"
        }
      },
      "required": ["sessionId", "prompt"],
      "type": "object",
      "x-method": "session/prompt",
      "x-side": "agent"
    },
    "PromptResponse": {
      "description": "Response from processing a user prompt.\n\nSee protocol docs: [Check for Completion](https://agentclientprotocol.com/protocol/prompt-turn#4-check-for-completion)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "stopReason": {
          "allOf": [
            {
              "$ref": "#/$defs/StopReason"
            }
          ],
          "description": "Indicates why the agent stopped processing the turn."
        },
        "usage": {
          "anyOf": [
            {
              "$ref": "#/$defs/Usage"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nToken usage for this turn (optional)."
        },
        "userMessageId": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe acknowledged user message ID.\n\nIf the client provided a `messageId` in the [`PromptRequest`], the agent echoes it here\nto confirm it was recorded. If the client did not provide one, the agent MAY assign one\nand return it here. Absence of this field indicates the agent did not record a message ID.",
          "type": ["string", "null"]
        }
      },
      "required": ["stopReason"],
      "type": "object",
      "x-method": "session/prompt",
      "x-side": "agent"
    },
    "ProtocolVersion": {
      "description": "Protocol version identifier.\n\nThis version is only bumped for breaking changes.\nNon-breaking changes should be introduced via capabilities.",
      "format": "uint16",
      "maximum": 65535,
      "minimum": 0,
      "type": "integer"
    },
    "ProviderCurrentConfig": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCurrent effective non-secret routing configuration for a provider.",
      "properties": {
        "apiType": {
          "allOf": [
            {
              "$ref": "#/$defs/LlmProtocol"
            }
          ],
          "description": "Protocol currently used by this provider."
        },
        "baseUrl": {
          "description": "Base URL currently used by this provider.",
          "type": "string"
        }
      },
      "required": ["apiType", "baseUrl"],
      "type": "object"
    },
    "ProviderInfo": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInformation about a configurable LLM provider.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "current": {
          "anyOf": [
            {
              "$ref": "#/$defs/ProviderCurrentConfig"
            },
            {
              "type": "null"
            }
          ],
          "description": "Current effective non-secret routing config.\nNull or omitted means provider is disabled."
        },
        "id": {
          "description": "Provider identifier, for example \"main\" or \"openai\".",
          "type": "string"
        },
        "required": {
          "description": "Whether this provider is mandatory and cannot be disabled via `providers/disable`.\nIf true, clients must not call `providers/disable` for this id.",
          "type": "boolean"
        },
        "supported": {
          "description": "Supported protocol types for this provider.",
          "items": {
            "$ref": "#/$defs/LlmProtocol"
          },
          "type": "array"
        }
      },
      "required": ["id", "supported", "required"],
      "type": "object"
    },
    "ProvidersCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nProvider configuration capabilities supported by the agent.\n\nBy supplying `{}` it means that the agent supports provider configuration methods.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "Range": {
      "description": "A range in a text document, expressed as start and end positions.",
      "properties": {
        "end": {
          "allOf": [
            {
              "$ref": "#/$defs/Position"
            }
          ],
          "description": "The end position (exclusive)."
        },
        "start": {
          "allOf": [
            {
              "$ref": "#/$defs/Position"
            }
          ],
          "description": "The start position (inclusive)."
        }
      },
      "required": ["start", "end"],
      "type": "object"
    },
    "ReadTextFileRequest": {
      "description": "Request to read content from a text file.\n\nOnly available if the client supports the `fs.readTextFile` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "limit": {
          "description": "Maximum number of lines to read.",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "line": {
          "description": "Line number to start reading from (1-based).",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "path": {
          "description": "Absolute path to the file to read.",
          "type": "string"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        }
      },
      "required": ["sessionId", "path"],
      "type": "object",
      "x-method": "fs/read_text_file",
      "x-side": "client"
    },
    "ReadTextFileResponse": {
      "description": "Response containing the contents of a text file.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "content": {
          "type": "string"
        }
      },
      "required": ["content"],
      "type": "object",
      "x-method": "fs/read_text_file",
      "x-side": "client"
    },
    "RejectNesNotification": {
      "description": "Notification sent when a suggestion is rejected.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "id": {
          "description": "The ID of the rejected suggestion.",
          "type": "string"
        },
        "reason": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesRejectReason"
            },
            {
              "type": "null"
            }
          ],
          "description": "The reason for rejection."
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this notification."
        }
      },
      "required": ["sessionId", "id"],
      "type": "object",
      "x-method": "nes/reject",
      "x-side": "agent"
    },
    "ReleaseTerminalRequest": {
      "description": "Request to release a terminal and free its resources.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        },
        "terminalId": {
          "description": "The ID of the terminal to release.",
          "type": "string"
        }
      },
      "required": ["sessionId", "terminalId"],
      "type": "object",
      "x-method": "terminal/release",
      "x-side": "client"
    },
    "ReleaseTerminalResponse": {
      "description": "Response to terminal/release method",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "terminal/release",
      "x-side": "client"
    },
    "RequestId": {
      "anyOf": [
        {
          "title": "Null",
          "type": "null"
        },
        {
          "format": "int64",
          "title": "Number",
          "type": "integer"
        },
        {
          "title": "Str",
          "type": "string"
        }
      ],
      "description": "JSON RPC Request Id\n\nAn identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]\n\nThe Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.\n\n[1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.\n\n[2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions."
    },
    "RequestPermissionOutcome": {
      "description": "The outcome of a permission request.",
      "discriminator": {
        "propertyName": "outcome"
      },
      "oneOf": [
        {
          "description": "The prompt turn was cancelled before the user responded.\n\nWhen a client sends a `session/cancel` notification to cancel an ongoing\nprompt turn, it MUST respond to all pending `session/request_permission`\nrequests with this `Cancelled` outcome.\n\nSee protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)",
          "properties": {
            "outcome": {
              "const": "cancelled",
              "type": "string"
            }
          },
          "required": ["outcome"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/SelectedPermissionOutcome"
            }
          ],
          "description": "The user selected one of the provided options.",
          "properties": {
            "outcome": {
              "const": "selected",
              "type": "string"
            }
          },
          "required": ["outcome"],
          "type": "object"
        }
      ]
    },
    "RequestPermissionRequest": {
      "description": "Request for user permission to execute a tool call.\n\nSent when the agent needs authorization before performing a sensitive operation.\n\nSee protocol docs: [Requesting Permission](https://agentclientprotocol.com/protocol/tool-calls#requesting-permission)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "options": {
          "description": "Available permission options for the user to choose from.",
          "items": {
            "$ref": "#/$defs/PermissionOption"
          },
          "type": "array"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        },
        "toolCall": {
          "allOf": [
            {
              "$ref": "#/$defs/ToolCallUpdate"
            }
          ],
          "description": "Details about the tool call requiring permission."
        }
      },
      "required": ["sessionId", "toolCall", "options"],
      "type": "object",
      "x-method": "session/request_permission",
      "x-side": "client"
    },
    "RequestPermissionResponse": {
      "description": "Response to a permission request.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "outcome": {
          "allOf": [
            {
              "$ref": "#/$defs/RequestPermissionOutcome"
            }
          ],
          "description": "The user's decision on the permission request."
        }
      },
      "required": ["outcome"],
      "type": "object",
      "x-method": "session/request_permission",
      "x-side": "client"
    },
    "ResourceLink": {
      "description": "A resource that the server is capable of reading, included in a prompt or tool call result.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "annotations": {
          "anyOf": [
            {
              "$ref": "#/$defs/Annotations"
            },
            {
              "type": "null"
            }
          ]
        },
        "description": {
          "type": ["string", "null"]
        },
        "mimeType": {
          "type": ["string", "null"]
        },
        "name": {
          "type": "string"
        },
        "size": {
          "format": "int64",
          "type": ["integer", "null"]
        },
        "title": {
          "type": ["string", "null"]
        },
        "uri": {
          "type": "string"
        }
      },
      "required": ["name", "uri"],
      "type": "object"
    },
    "ResumeSessionRequest": {
      "description": "Request parameters for resuming an existing session.\n\nResumes an existing session without returning previous messages (unlike `session/load`).\nThis is useful for agents that can resume sessions but don't implement full session loading.\n\nOnly available if the Agent supports the `sessionCapabilities.resume` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "additionalDirectories": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAdditional workspace roots to activate for this session. Each path must be absolute.\n\nWhen omitted or empty, no additional roots are activated. When non-empty,\nthis is the complete resulting additional-root list for the resumed\nsession.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "cwd": {
          "description": "The working directory for this session.",
          "type": "string"
        },
        "mcpServers": {
          "description": "List of MCP servers to connect to for this session.",
          "items": {
            "$ref": "#/$defs/McpServer"
          },
          "type": "array"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to resume."
        }
      },
      "required": ["sessionId", "cwd"],
      "type": "object",
      "x-method": "session/resume",
      "x-side": "agent"
    },
    "ResumeSessionResponse": {
      "description": "Response from resuming an existing session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": ["array", "null"]
        },
        "models": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModelState"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        },
        "modes": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionModeState"
            },
            {
              "type": "null"
            }
          ],
          "description": "Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        }
      },
      "type": "object",
      "x-method": "session/resume",
      "x-side": "agent"
    },
    "Role": {
      "description": "The sender or recipient of messages and data in a conversation.",
      "enum": ["assistant", "user"],
      "type": "string"
    },
    "SelectedPermissionOutcome": {
      "description": "The user selected one of the provided options.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "optionId": {
          "allOf": [
            {
              "$ref": "#/$defs/PermissionOptionId"
            }
          ],
          "description": "The ID of the option the user selected."
        }
      },
      "required": ["optionId"],
      "type": "object"
    },
    "SessionAdditionalDirectoriesCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCapabilities for additional session directories support.\n\nBy supplying `{}` it means that the agent supports the `additionalDirectories` field on\nsupported session lifecycle requests and `session/list`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "SessionCapabilities": {
      "description": "Session capabilities supported by the agent.\n\nAs a baseline, all Agents **MUST** support `session/new`, `session/prompt`, `session/cancel`, and `session/update`.\n\nOptionally, they **MAY** support other session methods and notifications by specifying additional capabilities.\n\nNote: `session/load` is still handled by the top-level `load_session` capability. This will be unified in future versions of the protocol.\n\nSee protocol docs: [Session Capabilities](https://agentclientprotocol.com/protocol/initialization#session-capabilities)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "additionalDirectories": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionAdditionalDirectoriesCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWhether the agent supports `additionalDirectories` on supported session lifecycle requests and `session/list`."
        },
        "close": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionCloseCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent supports `session/close`."
        },
        "fork": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionForkCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWhether the agent supports `session/fork`."
        },
        "list": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionListCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent supports `session/list`."
        },
        "resume": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionResumeCapabilities"
            },
            {
              "type": "null"
            }
          ],
          "description": "Whether the agent supports `session/resume`."
        }
      },
      "type": "object"
    },
    "SessionCloseCapabilities": {
      "description": "Capabilities for the `session/close` method.\n\nBy supplying `{}` it means that the agent supports closing of sessions.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "SessionConfigBoolean": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nA boolean on/off toggle session configuration option payload.",
      "properties": {
        "currentValue": {
          "description": "The current value of the boolean option.",
          "type": "boolean"
        }
      },
      "required": ["currentValue"],
      "type": "object"
    },
    "SessionConfigGroupId": {
      "description": "Unique identifier for a session configuration option value group.",
      "type": "string"
    },
    "SessionConfigId": {
      "description": "Unique identifier for a session configuration option.",
      "type": "string"
    },
    "SessionConfigOption": {
      "description": "A session configuration option selector and its current state.",
      "discriminator": {
        "propertyName": "type"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigSelect"
            }
          ],
          "description": "Single-value selector (dropdown).",
          "properties": {
            "type": {
              "const": "select",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigBoolean"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nBoolean on/off toggle.",
          "properties": {
            "type": {
              "const": "boolean",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        }
      ],
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "category": {
          "anyOf": [
            {
              "$ref": "#/$defs/SessionConfigOptionCategory"
            },
            {
              "type": "null"
            }
          ],
          "description": "Optional semantic category for this option (UX only)."
        },
        "description": {
          "description": "Optional description for the Client to display to the user.",
          "type": ["string", "null"]
        },
        "id": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigId"
            }
          ],
          "description": "Unique identifier for the configuration option."
        },
        "name": {
          "description": "Human-readable label for the option.",
          "type": "string"
        }
      },
      "required": ["id", "name"],
      "type": "object"
    },
    "SessionConfigOptionCategory": {
      "anyOf": [
        {
          "const": "mode",
          "description": "Session mode selector.",
          "type": "string"
        },
        {
          "const": "model",
          "description": "Model selector.",
          "type": "string"
        },
        {
          "const": "thought_level",
          "description": "Thought/reasoning level selector.",
          "type": "string"
        },
        {
          "description": "Unknown / uncategorized selector.",
          "title": "other",
          "type": "string"
        }
      ],
      "description": "Semantic category for a session configuration option.\n\nThis is intended to help Clients distinguish broadly common selectors (e.g. model selector vs\nsession mode selector vs thought/reasoning level) for UX purposes (keyboard shortcuts, icons,\nplacement). It MUST NOT be required for correctness. Clients MUST handle missing or unknown\ncategories gracefully.\n\nCategory names beginning with `_` are free for custom use, like other ACP extension methods.\nCategory names that do not begin with `_` are reserved for the ACP spec."
    },
    "SessionConfigSelect": {
      "description": "A single-value selector (dropdown) session configuration option payload.",
      "properties": {
        "currentValue": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigValueId"
            }
          ],
          "description": "The currently selected value."
        },
        "options": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigSelectOptions"
            }
          ],
          "description": "The set of selectable options."
        }
      },
      "required": ["currentValue", "options"],
      "type": "object"
    },
    "SessionConfigSelectGroup": {
      "description": "A group of possible values for a session configuration option.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "group": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigGroupId"
            }
          ],
          "description": "Unique identifier for this group."
        },
        "name": {
          "description": "Human-readable label for this group.",
          "type": "string"
        },
        "options": {
          "description": "The set of option values in this group.",
          "items": {
            "$ref": "#/$defs/SessionConfigSelectOption"
          },
          "type": "array"
        }
      },
      "required": ["group", "name", "options"],
      "type": "object"
    },
    "SessionConfigSelectOption": {
      "description": "A possible value for a session configuration option.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "description": {
          "description": "Optional description for this option value.",
          "type": ["string", "null"]
        },
        "name": {
          "description": "Human-readable label for this option value.",
          "type": "string"
        },
        "value": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigValueId"
            }
          ],
          "description": "Unique identifier for this option value."
        }
      },
      "required": ["value", "name"],
      "type": "object"
    },
    "SessionConfigSelectOptions": {
      "anyOf": [
        {
          "description": "A flat list of options with no grouping.",
          "items": {
            "$ref": "#/$defs/SessionConfigSelectOption"
          },
          "title": "Ungrouped",
          "type": "array"
        },
        {
          "description": "A list of options grouped under headers.",
          "items": {
            "$ref": "#/$defs/SessionConfigSelectGroup"
          },
          "title": "Grouped",
          "type": "array"
        }
      ],
      "description": "Possible values for a session configuration option."
    },
    "SessionConfigValueId": {
      "description": "Unique identifier for a session configuration option value.",
      "type": "string"
    },
    "SessionForkCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCapabilities for the `session/fork` method.\n\nBy supplying `{}` it means that the agent supports forking of sessions.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "SessionId": {
      "description": "A unique identifier for a conversation session between a client and agent.\n\nSessions maintain their own context, conversation history, and state,\nallowing multiple independent interactions with the same agent.\n\nSee protocol docs: [Session ID](https://agentclientprotocol.com/protocol/session-setup#session-id)",
      "type": "string"
    },
    "SessionInfo": {
      "description": "Information about a session returned by session/list",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "additionalDirectories": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAuthoritative ordered additional workspace roots for this session. Each path must be absolute.\n\nWhen omitted or empty, there are no additional roots for the session.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "cwd": {
          "description": "The working directory for this session. Must be an absolute path.",
          "type": "string"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "Unique identifier for the session"
        },
        "title": {
          "description": "Human-readable title for the session",
          "type": ["string", "null"]
        },
        "updatedAt": {
          "description": "ISO 8601 timestamp of last activity",
          "type": ["string", "null"]
        }
      },
      "required": ["sessionId", "cwd"],
      "type": "object"
    },
    "SessionInfoUpdate": {
      "description": "Update to session metadata. All fields are optional to support partial updates.\n\nAgents send this notification to update session information like title or custom metadata.\nThis allows clients to display dynamic session names and track session state changes.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "title": {
          "description": "Human-readable title for the session. Set to null to clear.",
          "type": ["string", "null"]
        },
        "updatedAt": {
          "description": "ISO 8601 timestamp of last activity. Set to null to clear.",
          "type": ["string", "null"]
        }
      },
      "type": "object"
    },
    "SessionListCapabilities": {
      "description": "Capabilities for the `session/list` method.\n\nBy supplying `{}` it means that the agent supports listing of sessions.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "SessionMode": {
      "description": "A mode the agent can operate in.\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "description": {
          "type": ["string", "null"]
        },
        "id": {
          "$ref": "#/$defs/SessionModeId"
        },
        "name": {
          "type": "string"
        }
      },
      "required": ["id", "name"],
      "type": "object"
    },
    "SessionModeId": {
      "description": "Unique identifier for a Session Mode.",
      "type": "string"
    },
    "SessionModeState": {
      "description": "The set of modes and the one currently active.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "availableModes": {
          "description": "The set of modes that the Agent can operate in",
          "items": {
            "$ref": "#/$defs/SessionMode"
          },
          "type": "array"
        },
        "currentModeId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionModeId"
            }
          ],
          "description": "The current mode the Agent is in."
        }
      },
      "required": ["currentModeId", "availableModes"],
      "type": "object"
    },
    "SessionModelState": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe set of models and the one currently active.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "availableModels": {
          "description": "The set of models that the Agent can use",
          "items": {
            "$ref": "#/$defs/ModelInfo"
          },
          "type": "array"
        },
        "currentModelId": {
          "allOf": [
            {
              "$ref": "#/$defs/ModelId"
            }
          ],
          "description": "The current model the Agent is in."
        }
      },
      "required": ["currentModelId", "availableModels"],
      "type": "object"
    },
    "SessionNotification": {
      "description": "Notification containing a session update from the agent.\n\nUsed to stream real-time progress and results during prompt processing.\n\nSee protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session this update pertains to."
        },
        "update": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionUpdate"
            }
          ],
          "description": "The actual update content."
        }
      },
      "required": ["sessionId", "update"],
      "type": "object",
      "x-method": "session/update",
      "x-side": "client"
    },
    "SessionResumeCapabilities": {
      "description": "Capabilities for the `session/resume` method.\n\nBy supplying `{}` it means that the agent supports resuming of sessions.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object"
    },
    "SessionUpdate": {
      "description": "Different types of updates that can be sent during session processing.\n\nThese updates provide real-time feedback about the agent's progress.\n\nSee protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)",
      "discriminator": {
        "propertyName": "sessionUpdate"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/ContentChunk"
            }
          ],
          "description": "A chunk of the user's message being streamed.",
          "properties": {
            "sessionUpdate": {
              "const": "user_message_chunk",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ContentChunk"
            }
          ],
          "description": "A chunk of the agent's response being streamed.",
          "properties": {
            "sessionUpdate": {
              "const": "agent_message_chunk",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ContentChunk"
            }
          ],
          "description": "A chunk of the agent's internal reasoning being streamed.",
          "properties": {
            "sessionUpdate": {
              "const": "agent_thought_chunk",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ToolCall"
            }
          ],
          "description": "Notification that a new tool call has been initiated.",
          "properties": {
            "sessionUpdate": {
              "const": "tool_call",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ToolCallUpdate"
            }
          ],
          "description": "Update on the status or results of a tool call.",
          "properties": {
            "sessionUpdate": {
              "const": "tool_call_update",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/Plan"
            }
          ],
          "description": "The agent's execution plan for complex tasks.\nSee protocol docs: [Agent Plan](https://agentclientprotocol.com/protocol/agent-plan)",
          "properties": {
            "sessionUpdate": {
              "const": "plan",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/AvailableCommandsUpdate"
            }
          ],
          "description": "Available commands are ready or have changed",
          "properties": {
            "sessionUpdate": {
              "const": "available_commands_update",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/CurrentModeUpdate"
            }
          ],
          "description": "The current mode of the session has changed\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)",
          "properties": {
            "sessionUpdate": {
              "const": "current_mode_update",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ConfigOptionUpdate"
            }
          ],
          "description": "Session configuration options have been updated.",
          "properties": {
            "sessionUpdate": {
              "const": "config_option_update",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/SessionInfoUpdate"
            }
          ],
          "description": "Session metadata has been updated (title, timestamps, custom metadata)",
          "properties": {
            "sessionUpdate": {
              "const": "session_info_update",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/UsageUpdate"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nContext window and cost update for the session.",
          "properties": {
            "sessionUpdate": {
              "const": "usage_update",
              "type": "string"
            }
          },
          "required": ["sessionUpdate"],
          "type": "object"
        }
      ]
    },
    "SetProvidersRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for `providers/set`.\n\nReplaces the full configuration for one provider id.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "apiType": {
          "allOf": [
            {
              "$ref": "#/$defs/LlmProtocol"
            }
          ],
          "description": "Protocol type for this provider."
        },
        "baseUrl": {
          "description": "Base URL for requests sent through this provider.",
          "type": "string"
        },
        "headers": {
          "additionalProperties": {
            "type": "string"
          },
          "description": "Full headers map for this provider.\nMay include authorization, routing, or other integration-specific headers.",
          "type": "object"
        },
        "id": {
          "description": "Provider id to configure.",
          "type": "string"
        }
      },
      "required": ["id", "apiType", "baseUrl"],
      "type": "object",
      "x-method": "providers/set",
      "x-side": "agent"
    },
    "SetProvidersResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse to `providers/set`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "providers/set",
      "x-side": "agent"
    },
    "SetSessionConfigOptionRequest": {
      "anyOf": [
        {
          "description": "A boolean value (`type: \"boolean\"`).",
          "properties": {
            "type": {
              "const": "boolean",
              "type": "string"
            },
            "value": {
              "description": "The boolean value.",
              "type": "boolean"
            }
          },
          "required": ["type", "value"],
          "type": "object"
        },
        {
          "description": "A [`SessionConfigValueId`] string value.\n\nThis is the default when `type` is absent on the wire. Unknown `type`\nvalues with string payloads also gracefully deserialize into this\nvariant.",
          "properties": {
            "value": {
              "allOf": [
                {
                  "$ref": "#/$defs/SessionConfigValueId"
                }
              ],
              "description": "The value ID."
            }
          },
          "required": ["value"],
          "title": "value_id",
          "type": "object"
        }
      ],
      "description": "Request parameters for setting a session configuration option.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "configId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionConfigId"
            }
          ],
          "description": "The ID of the configuration option to set."
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to set the configuration option for."
        }
      },
      "required": ["sessionId", "configId"],
      "type": "object",
      "x-method": "session/set_config_option",
      "x-side": "agent"
    },
    "SetSessionConfigOptionResponse": {
      "description": "Response to `session/set_config_option` method.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "configOptions": {
          "description": "The full set of configuration options and their current values.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": "array"
        }
      },
      "required": ["configOptions"],
      "type": "object",
      "x-method": "session/set_config_option",
      "x-side": "agent"
    },
    "SetSessionModeRequest": {
      "description": "Request parameters for setting a session mode.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "modeId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionModeId"
            }
          ],
          "description": "The ID of the mode to set."
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to set the mode for."
        }
      },
      "required": ["sessionId", "modeId"],
      "type": "object",
      "x-method": "session/set_mode",
      "x-side": "agent"
    },
    "SetSessionModeResponse": {
      "description": "Response to `session/set_mode` method.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "session/set_mode",
      "x-side": "agent"
    },
    "SetSessionModelRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for setting a session model.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "modelId": {
          "allOf": [
            {
              "$ref": "#/$defs/ModelId"
            }
          ],
          "description": "The ID of the model to set."
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The ID of the session to set the model for."
        }
      },
      "required": ["sessionId", "modelId"],
      "type": "object",
      "x-method": "session/set_model",
      "x-side": "agent"
    },
    "SetSessionModelResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse to `session/set_model` method.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "session/set_model",
      "x-side": "agent"
    },
    "StartNesRequest": {
      "description": "Request to start an NES session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "repository": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesRepository"
            },
            {
              "type": "null"
            }
          ],
          "description": "Repository metadata, if the workspace is a git repository."
        },
        "workspaceFolders": {
          "description": "The workspace folders.",
          "items": {
            "$ref": "#/$defs/WorkspaceFolder"
          },
          "type": ["array", "null"]
        },
        "workspaceUri": {
          "description": "The root URI of the workspace.",
          "type": ["string", "null"]
        }
      },
      "type": "object",
      "x-method": "nes/start",
      "x-side": "agent"
    },
    "StartNesResponse": {
      "description": "Response to `nes/start`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for the newly started NES session."
        }
      },
      "required": ["sessionId"],
      "type": "object",
      "x-method": "nes/start",
      "x-side": "agent"
    },
    "StopReason": {
      "description": "Reasons why an agent stops processing a prompt turn.\n\nSee protocol docs: [Stop Reasons](https://agentclientprotocol.com/protocol/prompt-turn#stop-reasons)",
      "oneOf": [
        {
          "const": "end_turn",
          "description": "The turn ended successfully.",
          "type": "string"
        },
        {
          "const": "max_tokens",
          "description": "The turn ended because the agent reached the maximum number of tokens.",
          "type": "string"
        },
        {
          "const": "max_turn_requests",
          "description": "The turn ended because the agent reached the maximum number of allowed\nagent requests between user turns.",
          "type": "string"
        },
        {
          "const": "refusal",
          "description": "The turn ended because the agent refused to continue. The user prompt\nand everything that comes after it won't be included in the next\nprompt, so this should be reflected in the UI.",
          "type": "string"
        },
        {
          "const": "cancelled",
          "description": "The turn was cancelled by the client via `session/cancel`.\n\nThis stop reason MUST be returned when the client sends a `session/cancel`\nnotification, even if the cancellation causes exceptions in underlying operations.\nAgents should catch these exceptions and return this semantically meaningful\nresponse to confirm successful cancellation.",
          "type": "string"
        }
      ]
    },
    "StringFormat": {
      "description": "String format types for string properties in elicitation schemas.",
      "oneOf": [
        {
          "const": "email",
          "description": "Email address format.",
          "type": "string"
        },
        {
          "const": "uri",
          "description": "URI format.",
          "type": "string"
        },
        {
          "const": "date",
          "description": "Date format (YYYY-MM-DD).",
          "type": "string"
        },
        {
          "const": "date-time",
          "description": "Date-time format (ISO 8601).",
          "type": "string"
        }
      ]
    },
    "StringPropertySchema": {
      "description": "Schema for string properties in an elicitation form.\n\nWhen `enum` or `oneOf` is set, this represents a single-select enum\nwith `\"type\": \"string\"`.",
      "properties": {
        "default": {
          "description": "Default value.",
          "type": ["string", "null"]
        },
        "description": {
          "description": "Human-readable description.",
          "type": ["string", "null"]
        },
        "enum": {
          "description": "Enum values for untitled single-select enums.",
          "items": {
            "type": "string"
          },
          "type": ["array", "null"]
        },
        "format": {
          "anyOf": [
            {
              "$ref": "#/$defs/StringFormat"
            },
            {
              "type": "null"
            }
          ],
          "description": "String format."
        },
        "maxLength": {
          "description": "Maximum string length.",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "minLength": {
          "description": "Minimum string length.",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "oneOf": {
          "description": "Titled enum options for titled single-select enums.",
          "items": {
            "$ref": "#/$defs/EnumOption"
          },
          "type": ["array", "null"]
        },
        "pattern": {
          "description": "Pattern the string must match.",
          "type": ["string", "null"]
        },
        "title": {
          "description": "Optional title for the property.",
          "type": ["string", "null"]
        }
      },
      "type": "object"
    },
    "SuggestNesRequest": {
      "description": "Request for a code suggestion.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "context": {
          "anyOf": [
            {
              "$ref": "#/$defs/NesSuggestContext"
            },
            {
              "type": "null"
            }
          ],
          "description": "Context for the suggestion, included based on agent capabilities."
        },
        "position": {
          "allOf": [
            {
              "$ref": "#/$defs/Position"
            }
          ],
          "description": "The current cursor position."
        },
        "selection": {
          "anyOf": [
            {
              "$ref": "#/$defs/Range"
            },
            {
              "type": "null"
            }
          ],
          "description": "The current text selection range, if any."
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        },
        "triggerKind": {
          "allOf": [
            {
              "$ref": "#/$defs/NesTriggerKind"
            }
          ],
          "description": "What triggered this suggestion request."
        },
        "uri": {
          "description": "The URI of the document to suggest for.",
          "type": "string"
        },
        "version": {
          "description": "The version number of the document.",
          "format": "int64",
          "type": "integer"
        }
      },
      "required": ["sessionId", "uri", "version", "position", "triggerKind"],
      "type": "object",
      "x-method": "nes/suggest",
      "x-side": "agent"
    },
    "SuggestNesResponse": {
      "description": "Response to `nes/suggest`.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "suggestions": {
          "description": "The list of suggestions.",
          "items": {
            "$ref": "#/$defs/NesSuggestion"
          },
          "type": "array"
        }
      },
      "required": ["suggestions"],
      "type": "object",
      "x-method": "nes/suggest",
      "x-side": "agent"
    },
    "Terminal": {
      "description": "Embed a terminal created with `terminal/create` by its id.\n\nThe terminal must be added before calling `terminal/release`.\n\nSee protocol docs: [Terminal](https://agentclientprotocol.com/protocol/terminals)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "terminalId": {
          "type": "string"
        }
      },
      "required": ["terminalId"],
      "type": "object"
    },
    "TerminalExitStatus": {
      "description": "Exit status of a terminal command.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "exitCode": {
          "description": "The process exit code (may be null if terminated by signal).",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "signal": {
          "description": "The signal that terminated the process (may be null if exited normally).",
          "type": ["string", "null"]
        }
      },
      "type": "object"
    },
    "TerminalOutputRequest": {
      "description": "Request to get the current output and status of a terminal.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        },
        "terminalId": {
          "description": "The ID of the terminal to get output from.",
          "type": "string"
        }
      },
      "required": ["sessionId", "terminalId"],
      "type": "object",
      "x-method": "terminal/output",
      "x-side": "client"
    },
    "TerminalOutputResponse": {
      "description": "Response containing the terminal output and exit status.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "exitStatus": {
          "anyOf": [
            {
              "$ref": "#/$defs/TerminalExitStatus"
            },
            {
              "type": "null"
            }
          ],
          "description": "Exit status if the command has completed."
        },
        "output": {
          "description": "The terminal output captured so far.",
          "type": "string"
        },
        "truncated": {
          "description": "Whether the output was truncated due to byte limits.",
          "type": "boolean"
        }
      },
      "required": ["output", "truncated"],
      "type": "object",
      "x-method": "terminal/output",
      "x-side": "client"
    },
    "TextContent": {
      "description": "Text provided to or from an LLM.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "annotations": {
          "anyOf": [
            {
              "$ref": "#/$defs/Annotations"
            },
            {
              "type": "null"
            }
          ]
        },
        "text": {
          "type": "string"
        }
      },
      "required": ["text"],
      "type": "object"
    },
    "TextDocumentContentChangeEvent": {
      "description": "A content change event for a document.\n\nWhen `range` is `None`, `text` is the full content of the document.\nWhen `range` is `Some`, `text` replaces the given range.",
      "properties": {
        "range": {
          "anyOf": [
            {
              "$ref": "#/$defs/Range"
            },
            {
              "type": "null"
            }
          ],
          "description": "The range of the document that changed. If `None`, the entire content is replaced."
        },
        "text": {
          "description": "The new text for the range, or the full document content if `range` is `None`.",
          "type": "string"
        }
      },
      "required": ["text"],
      "type": "object"
    },
    "TextDocumentSyncKind": {
      "description": "How the agent wants document changes delivered.",
      "oneOf": [
        {
          "const": "full",
          "description": "Client sends the entire file content on each change.",
          "type": "string"
        },
        {
          "const": "incremental",
          "description": "Client sends only the changed ranges.",
          "type": "string"
        }
      ]
    },
    "TextResourceContents": {
      "description": "Text-based resource contents.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "mimeType": {
          "type": ["string", "null"]
        },
        "text": {
          "type": "string"
        },
        "uri": {
          "type": "string"
        }
      },
      "required": ["text", "uri"],
      "type": "object"
    },
    "TitledMultiSelectItems": {
      "description": "Items definition for titled multi-select enum properties.",
      "properties": {
        "anyOf": {
          "description": "Titled enum options.",
          "items": {
            "$ref": "#/$defs/EnumOption"
          },
          "type": "array"
        }
      },
      "required": ["anyOf"],
      "type": "object"
    },
    "ToolCall": {
      "description": "Represents a tool call that the language model has requested.\n\nTool calls are actions that the agent executes on behalf of the language model,\nsuch as reading files, executing code, or fetching data from external sources.\n\nSee protocol docs: [Tool Calls](https://agentclientprotocol.com/protocol/tool-calls)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "content": {
          "description": "Content produced by the tool call.",
          "items": {
            "$ref": "#/$defs/ToolCallContent"
          },
          "type": "array"
        },
        "kind": {
          "allOf": [
            {
              "$ref": "#/$defs/ToolKind"
            }
          ],
          "description": "The category of tool being invoked.\nHelps clients choose appropriate icons and UI treatment."
        },
        "locations": {
          "description": "File locations affected by this tool call.\nEnables \"follow-along\" features in clients.",
          "items": {
            "$ref": "#/$defs/ToolCallLocation"
          },
          "type": "array"
        },
        "rawInput": {
          "description": "Raw input parameters sent to the tool."
        },
        "rawOutput": {
          "description": "Raw output returned by the tool."
        },
        "status": {
          "allOf": [
            {
              "$ref": "#/$defs/ToolCallStatus"
            }
          ],
          "description": "Current execution status of the tool call."
        },
        "title": {
          "description": "Human-readable title describing what the tool is doing.",
          "type": "string"
        },
        "toolCallId": {
          "allOf": [
            {
              "$ref": "#/$defs/ToolCallId"
            }
          ],
          "description": "Unique identifier for this tool call within the session."
        }
      },
      "required": ["toolCallId", "title"],
      "type": "object"
    },
    "ToolCallContent": {
      "description": "Content produced by a tool call.\n\nTool calls can produce different types of content including\nstandard content blocks (text, images) or file diffs.\n\nSee protocol docs: [Content](https://agentclientprotocol.com/protocol/tool-calls#content)",
      "discriminator": {
        "propertyName": "type"
      },
      "oneOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/Content"
            }
          ],
          "description": "Standard content block (text, images, resources).",
          "properties": {
            "type": {
              "const": "content",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/Diff"
            }
          ],
          "description": "File modification shown as a diff.",
          "properties": {
            "type": {
              "const": "diff",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/Terminal"
            }
          ],
          "description": "Embed a terminal created with `terminal/create` by its id.\n\nThe terminal must be added before calling `terminal/release`.\n\nSee protocol docs: [Terminal](https://agentclientprotocol.com/protocol/terminals)",
          "properties": {
            "type": {
              "const": "terminal",
              "type": "string"
            }
          },
          "required": ["type"],
          "type": "object"
        }
      ]
    },
    "ToolCallId": {
      "description": "Unique identifier for a tool call within a session.",
      "type": "string"
    },
    "ToolCallLocation": {
      "description": "A file location being accessed or modified by a tool.\n\nEnables clients to implement \"follow-along\" features that track\nwhich files the agent is working with in real-time.\n\nSee protocol docs: [Following the Agent](https://agentclientprotocol.com/protocol/tool-calls#following-the-agent)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "line": {
          "description": "Optional line number within the file.",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "path": {
          "description": "The file path being accessed or modified.",
          "type": "string"
        }
      },
      "required": ["path"],
      "type": "object"
    },
    "ToolCallStatus": {
      "description": "Execution status of a tool call.\n\nTool calls progress through different statuses during their lifecycle.\n\nSee protocol docs: [Status](https://agentclientprotocol.com/protocol/tool-calls#status)",
      "oneOf": [
        {
          "const": "pending",
          "description": "The tool call hasn't started running yet because the input is either\nstreaming or we're awaiting approval.",
          "type": "string"
        },
        {
          "const": "in_progress",
          "description": "The tool call is currently running.",
          "type": "string"
        },
        {
          "const": "completed",
          "description": "The tool call completed successfully.",
          "type": "string"
        },
        {
          "const": "failed",
          "description": "The tool call failed with an error.",
          "type": "string"
        }
      ]
    },
    "ToolCallUpdate": {
      "description": "An update to an existing tool call.\n\nUsed to report progress and results as tools execute. All fields except\nthe tool call ID are optional - only changed fields need to be included.\n\nSee protocol docs: [Updating](https://agentclientprotocol.com/protocol/tool-calls#updating)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "content": {
          "description": "Replace the content collection.",
          "items": {
            "$ref": "#/$defs/ToolCallContent"
          },
          "type": ["array", "null"]
        },
        "kind": {
          "anyOf": [
            {
              "$ref": "#/$defs/ToolKind"
            },
            {
              "type": "null"
            }
          ],
          "description": "Update the tool kind."
        },
        "locations": {
          "description": "Replace the locations collection.",
          "items": {
            "$ref": "#/$defs/ToolCallLocation"
          },
          "type": ["array", "null"]
        },
        "rawInput": {
          "description": "Update the raw input."
        },
        "rawOutput": {
          "description": "Update the raw output."
        },
        "status": {
          "anyOf": [
            {
              "$ref": "#/$defs/ToolCallStatus"
            },
            {
              "type": "null"
            }
          ],
          "description": "Update the execution status."
        },
        "title": {
          "description": "Update the human-readable title.",
          "type": ["string", "null"]
        },
        "toolCallId": {
          "allOf": [
            {
              "$ref": "#/$defs/ToolCallId"
            }
          ],
          "description": "The ID of the tool call being updated."
        }
      },
      "required": ["toolCallId"],
      "type": "object"
    },
    "ToolKind": {
      "description": "Categories of tools that can be invoked.\n\nTool kinds help clients choose appropriate icons and optimize how they\ndisplay tool execution progress.\n\nSee protocol docs: [Creating](https://agentclientprotocol.com/protocol/tool-calls#creating)",
      "oneOf": [
        {
          "const": "read",
          "description": "Reading files or data.",
          "type": "string"
        },
        {
          "const": "edit",
          "description": "Modifying files or content.",
          "type": "string"
        },
        {
          "const": "delete",
          "description": "Removing files or data.",
          "type": "string"
        },
        {
          "const": "move",
          "description": "Moving or renaming files.",
          "type": "string"
        },
        {
          "const": "search",
          "description": "Searching for information.",
          "type": "string"
        },
        {
          "const": "execute",
          "description": "Running commands or code.",
          "type": "string"
        },
        {
          "const": "think",
          "description": "Internal reasoning or planning.",
          "type": "string"
        },
        {
          "const": "fetch",
          "description": "Retrieving external data.",
          "type": "string"
        },
        {
          "const": "switch_mode",
          "description": "Switching the current session mode.",
          "type": "string"
        },
        {
          "const": "other",
          "description": "Other tool types (default).",
          "type": "string"
        }
      ]
    },
    "UnstructuredCommandInput": {
      "description": "All text that was typed after the command name is provided as input.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "hint": {
          "description": "A hint to display when the input hasn't been provided yet",
          "type": "string"
        }
      },
      "required": ["hint"],
      "type": "object"
    },
    "UntitledMultiSelectItems": {
      "description": "Items definition for untitled multi-select enum properties.",
      "properties": {
        "enum": {
          "description": "Allowed enum values.",
          "items": {
            "type": "string"
          },
          "type": "array"
        },
        "type": {
          "allOf": [
            {
              "$ref": "#/$defs/ElicitationStringType"
            }
          ],
          "description": "Item type discriminator. Must be `\"string\"`."
        }
      },
      "required": ["type", "enum"],
      "type": "object"
    },
    "Usage": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nToken usage information for a prompt turn.",
      "properties": {
        "cachedReadTokens": {
          "description": "Total cache read tokens.",
          "format": "uint64",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "cachedWriteTokens": {
          "description": "Total cache write tokens.",
          "format": "uint64",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "inputTokens": {
          "description": "Total input tokens across all turns.",
          "format": "uint64",
          "minimum": 0,
          "type": "integer"
        },
        "outputTokens": {
          "description": "Total output tokens across all turns.",
          "format": "uint64",
          "minimum": 0,
          "type": "integer"
        },
        "thoughtTokens": {
          "description": "Total thought/reasoning tokens",
          "format": "uint64",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "totalTokens": {
          "description": "Sum of all token types across session.",
          "format": "uint64",
          "minimum": 0,
          "type": "integer"
        }
      },
      "required": ["totalTokens", "inputTokens", "outputTokens"],
      "type": "object"
    },
    "UsageUpdate": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nContext window and cost update for a session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "cost": {
          "anyOf": [
            {
              "$ref": "#/$defs/Cost"
            },
            {
              "type": "null"
            }
          ],
          "description": "Cumulative session cost (optional)."
        },
        "size": {
          "description": "Total context window size in tokens.",
          "format": "uint64",
          "minimum": 0,
          "type": "integer"
        },
        "used": {
          "description": "Tokens currently in context.",
          "format": "uint64",
          "minimum": 0,
          "type": "integer"
        }
      },
      "required": ["used", "size"],
      "type": "object"
    },
    "WaitForTerminalExitRequest": {
      "description": "Request to wait for a terminal command to exit.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        },
        "terminalId": {
          "description": "The ID of the terminal to wait for.",
          "type": "string"
        }
      },
      "required": ["sessionId", "terminalId"],
      "type": "object",
      "x-method": "terminal/wait_for_exit",
      "x-side": "client"
    },
    "WaitForTerminalExitResponse": {
      "description": "Response containing the exit status of a terminal command.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "exitCode": {
          "description": "The process exit code (may be null if terminated by signal).",
          "format": "uint32",
          "minimum": 0,
          "type": ["integer", "null"]
        },
        "signal": {
          "description": "The signal that terminated the process (may be null if exited normally).",
          "type": ["string", "null"]
        }
      },
      "type": "object",
      "x-method": "terminal/wait_for_exit",
      "x-side": "client"
    },
    "WorkspaceFolder": {
      "description": "A workspace folder.",
      "properties": {
        "name": {
          "description": "The display name of the folder.",
          "type": "string"
        },
        "uri": {
          "description": "The URI of the folder.",
          "type": "string"
        }
      },
      "required": ["uri", "name"],
      "type": "object"
    },
    "WriteTextFileRequest": {
      "description": "Request to write content to a text file.\n\nOnly available if the client supports the `fs.writeTextFile` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        },
        "content": {
          "description": "The text content to write to the file.",
          "type": "string"
        },
        "path": {
          "description": "Absolute path to the file to write.",
          "type": "string"
        },
        "sessionId": {
          "allOf": [
            {
              "$ref": "#/$defs/SessionId"
            }
          ],
          "description": "The session ID for this request."
        }
      },
      "required": ["sessionId", "path", "content"],
      "type": "object",
      "x-method": "fs/write_text_file",
      "x-side": "client"
    },
    "WriteTextFileResponse": {
      "description": "Response to `fs/write_text_file`",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": ["object", "null"]
        }
      },
      "type": "object",
      "x-method": "fs/write_text_file",
      "x-side": "client"
    }
  },
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "anyOf": [
    {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/AgentRequest"
            }
          ],
          "title": "Request"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/AgentResponse"
            }
          ],
          "title": "Response"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/AgentNotification"
            }
          ],
          "title": "Notification"
        }
      ],
      "description": "A message (request, response, or notification) with `\"jsonrpc\": \"2.0\"` specified as\n[required by JSON-RPC 2.0 Specification][1].\n\n[1]: https://www.jsonrpc.org/specification#compatibility",
      "properties": {
        "jsonrpc": {
          "enum": ["2.0"],
          "type": "string"
        }
      },
      "required": ["jsonrpc"],
      "title": "Agent",
      "type": "object"
    },
    {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/ClientRequest"
            }
          ],
          "title": "Request"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ClientResponse"
            }
          ],
          "title": "Response"
        },
        {
          "allOf": [
            {
              "$ref": "#/$defs/ClientNotification"
            }
          ],
          "title": "Notification"
        }
      ],
      "description": "A message (request, response, or notification) with `\"jsonrpc\": \"2.0\"` specified as\n[required by JSON-RPC 2.0 Specification][1].\n\n[1]: https://www.jsonrpc.org/specification#compatibility",
      "properties": {
        "jsonrpc": {
          "enum": ["2.0"],
          "type": "string"
        }
      },
      "required": ["jsonrpc"],
      "title": "Client",
      "type": "object"
    },
    {
      "anyOf": [
        {
          "allOf": [
            {
              "$ref": "#/$defs/CancelRequestNotification"
            }
          ],
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or\nchanged at any point.\n\nCancels an ongoing request.\n\nThis is a notification sent by the side that sent a request to cancel that request.\n\nUpon receiving this notification, the receiver:\n\n1. MUST cancel the corresponding request activity and all nested activities\n2. MAY send any pending notifications.\n3. MUST send one of these responses for the original request:\n  - Valid response with appropriate data (partial results or cancellation marker)\n  - Error response with code `-32800` (Cancelled)\n\nSee protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/cancellation)",
          "title": "CancelRequestNotification"
        }
      ],
      "description": "General protocol-level notifications that all sides are expected to\nimplement.\n\nNotifications whose methods start with '$/' are messages which\nare protocol implementation dependent and might not be implementable in all\nclients or agents. For example if the implementation uses a single threaded\nsynchronous programming language then there is little it can do to react to\na `$/cancel_request` notification. If an agent or client receives\nnotifications starting with '$/' it is free to ignore the notification.\n\nNotifications do not expect a response.",
      "title": "ProtocolLevel"
    }
  ],
  "title": "Agent Client Protocol"
}
````

## File: scripts/generate.js
````javascript
#!/usr/bin/env node

import { createClient } from "@hey-api/openapi-ts";
import * as fs from "fs/promises";
import { dirname } from "path";
import * as prettier from "prettier";

const CURRENT_SCHEMA_RELEASE = "v0.12.2";

await main();

async function main() {
  if (!process.argv.includes("--skip-download")) {
    await downloadSchemas(CURRENT_SCHEMA_RELEASE);
  }

  const metadata = JSON.parse(await fs.readFile("./schema/meta.json", "utf8"));

  const schemaSrc = await fs.readFile("./schema/schema.json", "utf8");
  const jsonSchema = JSON.parse(
    schemaSrc.replaceAll("#/$defs/", "#/components/schemas/"),
  );
  await createClient({
    input: {
      openapi: "3.1.0",
      info: {
        title: "Agent Client Protocol",
        version: "1.0.0",
      },
      components: {
        schemas: jsonSchema.$defs,
      },
    },
    output: {
      path: "./src/schema",
      postProcess: ["prettier"],
    },
    plugins: [
      "zod",
      { bigInt: false, name: "@hey-api/transformers" },
      "@hey-api/typescript",
    ],
  });

  const schemaDefs = JSON.parse(
    await fs.readFile("./schema/schema.json", "utf8"),
  ).$defs;

  const zodPath = "./src/schema/zod.gen.ts";
  const zodSrc = await fs.readFile(zodPath, "utf8");
  const zod = await prettier.format(
    updateDocs(
      zodSrc
        .replace(`from "zod"`, `from "zod/v4"`)
        // Weird type issue
        .replaceAll(
          /z\.record\((?!z\.string\(\),\s*)([^)]+)\)/g,
          "z.record(z.string(), $1)",
        )
        .replaceAll(
          /z\.coerce\s*\.bigint\(\)\s*\.min\(BigInt\("-9223372036854775808"\),\s*\{\s*message:\s*"Invalid value: Expected int64 to be >= -9223372036854775808",\s*\}\s*\)\s*\.max\(BigInt\("9223372036854775807"\),\s*\{\s*message:\s*"Invalid value: Expected int64 to be <= 9223372036854775807",\s*\}\s*\)/gm,
          "z.number()",
        )
        .replaceAll(
          /z\.coerce\s*\.bigint\(\)\s*\.gte\(BigInt\(0\)\)\s*\.max\(BigInt\("18446744073709551615"\),\s*\{\s*message:\s*"Invalid value: Expected uint64 to be <= 18446744073709551615",\s*\}\s*\)/gm,
          "z.number()",
        ),
      schemaDefs,
    ),
    { parser: "typescript" },
  );
  await fs.writeFile(zodPath, zod);

  const tsPath = "./src/schema/types.gen.ts";
  const tsSrc = await fs.readFile(tsPath, "utf8");
  const ts = await prettier.format(
    updateDocs(
      tsSrc.replace(
        `export type ClientOptions`,
        `// eslint-disable-next-line @typescript-eslint/no-unused-vars\ntype ClientOptions`,
      ),
      schemaDefs,
    ),
    { parser: "typescript" },
  );
  await fs.writeFile(tsPath, ts);

  const meta = await prettier.format(
    `export const AGENT_METHODS = ${JSON.stringify(metadata.agentMethods, null, 2)} as const;

export const CLIENT_METHODS = ${JSON.stringify(metadata.clientMethods, null, 2)} as const;

export const PROTOCOL_VERSION = ${metadata.version};
`,
    { parser: "typescript" },
  );
  const indexPath = "./src/schema/index.ts";
  const indexSrc = await fs.readFile(indexPath, "utf8");
  await fs.writeFile(
    indexPath,
    `${indexSrc.replace(/\s*ClientOptions,/, "")}\n${meta}`,
  );
}

/**
 * Downloads a file from a URL to a local path
 * @param {string} url - The URL to download from
 * @param {string} outputPath - The local path to save the file
 */
async function downloadFile(url, outputPath) {
  await fs.mkdir(dirname(outputPath), { recursive: true });

  const response = await fetch(url);

  if (response.status === 302 || response.status === 301) {
    // Follow redirects
    await downloadFile(response.headers.location, outputPath);
    return;
  }

  if (response.status !== 200) {
    throw new Error(`Failed to download ${url}: ${response.status}`);
  }

  await fs.writeFile(outputPath, response.body);
}

/**
 * Downloads schema files from a GitHub release
 * @param {string} tag - The GitHub release tag (e.g., "v0.5.0")
 */
async function downloadSchemas(tag) {
  const baseUrl = `https://github.com/agentclientprotocol/agent-client-protocol/releases/download/${tag}`;
  const files = [
    { url: `${baseUrl}/schema.unstable.json`, path: "./schema/schema.json" },
    { url: `${baseUrl}/meta.unstable.json`, path: "./schema/meta.json" },
  ];

  console.log(`Downloading schemas from release ${tag}...`);

  for (const file of files) {
    await downloadFile(file.url, file.path);
  }

  console.log("Schema files downloaded successfully\n");
}

function updateDocs(src, schemaDefs) {
  let result = src;

  // Inject missing doc comments from schema descriptions.
  // The code generator drops JSDoc for types that produce intersection types
  // (schemas using oneOf/anyOf combined with properties).
  if (schemaDefs) {
    for (const [name, def] of Object.entries(schemaDefs)) {
      if (!def.description) continue;

      result = injectDocIfMissing(
        result,
        `export type ${name} =`,
        def.description,
      );
      result = injectDocIfMissing(
        result,
        `export const z${name} =`,
        def.description,
      );
    }
  }

  // Replace UNSTABLE comments with @experimental at the end of the comment block
  result = result.replace(
    /(\/\*\*[\s\S]*?\*\*UNSTABLE\*\*[\s\S]*?)(\n\s*)\*\//g,
    "$1$2*$2* @experimental$2*/",
  );

  return result;
}

function injectDocIfMissing(src, exportStr, description) {
  const idx = src.indexOf(exportStr);
  if (idx === -1) return src;

  const before = src.substring(0, idx);
  if (/\*\/\s*$/.test(before)) return src;

  const lines = description.split("\n");
  const jsdoc =
    "/**\n" + lines.map((l) => (l ? ` * ${l}` : " *")).join("\n") + "\n */\n";

  return src.slice(0, idx) + jsdoc + src.slice(idx);
}
````

## File: scripts/spellcheck.sh
````bash
#!/bin/bash

# Check if typos is installed
if ! command -v typos &> /dev/null; then
    echo "Error: typos is not installed."
    echo "Please install it using one of the following methods:"
    echo ""
    echo "  Using Cargo:"
    echo "    cargo install typos-cli"
    echo ""
    echo ""
    echo "For more installation options, see: https://github.com/crate-ci/typos"
    exit 1
fi

# Run typos with the provided arguments, defaulting to current directory
if [ $# -eq 0 ]; then
    typos --config ./typos.toml
else
    typos --config ./typos.toml "$@"
fi
````

## File: src/examples/agent.ts
````typescript
#!/usr/bin/env node

import * as acp from "../acp.js";
import { Readable, Writable } from "node:stream";

interface AgentSession {
  pendingPrompt: AbortController | null;
}

class ExampleAgent implements acp.Agent {
  private connection: acp.AgentSideConnection;
  private sessions: Map<string, AgentSession>;

  constructor(connection: acp.AgentSideConnection) {
    this.connection = connection;
    this.sessions = new Map();
  }

  async initialize(
    _params: acp.InitializeRequest,
  ): Promise<acp.InitializeResponse> {
    return {
      protocolVersion: acp.PROTOCOL_VERSION,
      agentCapabilities: {
        loadSession: false,
      },
    };
  }

  async newSession(
    _params: acp.NewSessionRequest,
  ): Promise<acp.NewSessionResponse> {
    const sessionId = Array.from(crypto.getRandomValues(new Uint8Array(16)))
      .map((b) => b.toString(16).padStart(2, "0"))
      .join("");

    this.sessions.set(sessionId, {
      pendingPrompt: null,
    });

    return {
      sessionId,
    };
  }

  async authenticate(
    _params: acp.AuthenticateRequest,
  ): Promise<acp.AuthenticateResponse | void> {
    // No auth needed - return empty response
    return {};
  }

  async setSessionMode(
    _params: acp.SetSessionModeRequest,
  ): Promise<acp.SetSessionModeResponse> {
    // Session mode changes not implemented in this example
    return {};
  }

  async prompt(params: acp.PromptRequest): Promise<acp.PromptResponse> {
    const session = this.sessions.get(params.sessionId);

    if (!session) {
      throw new Error(`Session ${params.sessionId} not found`);
    }

    session.pendingPrompt?.abort();
    session.pendingPrompt = new AbortController();

    try {
      await this.simulateTurn(params.sessionId, session.pendingPrompt.signal);
    } catch (err) {
      if (session.pendingPrompt.signal.aborted) {
        return { stopReason: "cancelled" };
      }

      throw err;
    }

    session.pendingPrompt = null;

    return {
      stopReason: "end_turn",
    };
  }

  private async simulateTurn(
    sessionId: string,
    abortSignal: AbortSignal,
  ): Promise<void> {
    // Send initial text chunk
    await this.connection.sessionUpdate({
      sessionId,
      update: {
        sessionUpdate: "agent_message_chunk",
        content: {
          type: "text",
          text: "I'll help you with that. Let me start by reading some files to understand the current situation.",
        },
      },
    });

    await this.simulateModelInteraction(abortSignal);

    // Send a tool call that doesn't need permission
    await this.connection.sessionUpdate({
      sessionId,
      update: {
        sessionUpdate: "tool_call",
        toolCallId: "call_1",
        title: "Reading project files",
        kind: "read",
        status: "pending",
        locations: [{ path: "/project/README.md" }],
        rawInput: { path: "/project/README.md" },
      },
    });

    await this.simulateModelInteraction(abortSignal);

    // Update tool call to completed
    await this.connection.sessionUpdate({
      sessionId,
      update: {
        sessionUpdate: "tool_call_update",
        toolCallId: "call_1",
        status: "completed",
        content: [
          {
            type: "content",
            content: {
              type: "text",
              text: "# My Project\n\nThis is a sample project...",
            },
          },
        ],
        rawOutput: { content: "# My Project\n\nThis is a sample project..." },
      },
    });

    await this.simulateModelInteraction(abortSignal);

    // Send more text
    await this.connection.sessionUpdate({
      sessionId,
      update: {
        sessionUpdate: "agent_message_chunk",
        content: {
          type: "text",
          text: " Now I understand the project structure. I need to make some changes to improve it.",
        },
      },
    });

    await this.simulateModelInteraction(abortSignal);

    // Send a tool call that DOES need permission
    await this.connection.sessionUpdate({
      sessionId,
      update: {
        sessionUpdate: "tool_call",
        toolCallId: "call_2",
        title: "Modifying critical configuration file",
        kind: "edit",
        status: "pending",
        locations: [{ path: "/project/config.json" }],
        rawInput: {
          path: "/project/config.json",
          content: '{"database": {"host": "new-host"}}',
        },
      },
    });

    // Request permission for the sensitive operation
    const permissionResponse = await this.connection.requestPermission({
      sessionId,
      toolCall: {
        toolCallId: "call_2",
        title: "Modifying critical configuration file",
        kind: "edit",
        status: "pending",
        locations: [{ path: "/home/user/project/config.json" }],
        rawInput: {
          path: "/home/user/project/config.json",
          content: '{"database": {"host": "new-host"}}',
        },
      },
      options: [
        {
          kind: "allow_once",
          name: "Allow this change",
          optionId: "allow",
        },
        {
          kind: "reject_once",
          name: "Skip this change",
          optionId: "reject",
        },
      ],
    });

    if (permissionResponse.outcome.outcome === "cancelled") {
      return;
    }

    switch (permissionResponse.outcome.optionId) {
      case "allow": {
        await this.connection.sessionUpdate({
          sessionId,
          update: {
            sessionUpdate: "tool_call_update",
            toolCallId: "call_2",
            status: "completed",
            rawOutput: { success: true, message: "Configuration updated" },
          },
        });

        await this.simulateModelInteraction(abortSignal);

        await this.connection.sessionUpdate({
          sessionId,
          update: {
            sessionUpdate: "agent_message_chunk",
            content: {
              type: "text",
              text: " Perfect! I've successfully updated the configuration. The changes have been applied.",
            },
          },
        });
        break;
      }
      case "reject": {
        await this.simulateModelInteraction(abortSignal);

        await this.connection.sessionUpdate({
          sessionId,
          update: {
            sessionUpdate: "agent_message_chunk",
            content: {
              type: "text",
              text: " I understand you prefer not to make that change. I'll skip the configuration update.",
            },
          },
        });
        break;
      }
      default:
        throw new Error(
          `Unexpected permission outcome ${permissionResponse.outcome}`,
        );
    }
  }

  private simulateModelInteraction(abortSignal: AbortSignal): Promise<void> {
    return new Promise((resolve, reject) =>
      setTimeout(() => {
        // In a real agent, you'd pass this abort signal to the LLM client
        if (abortSignal.aborted) {
          reject();
        } else {
          resolve();
        }
      }, 1000),
    );
  }

  async cancel(params: acp.CancelNotification): Promise<void> {
    this.sessions.get(params.sessionId)?.pendingPrompt?.abort();
  }
}

const input = Writable.toWeb(process.stdout);
const output = Readable.toWeb(process.stdin) as ReadableStream<Uint8Array>;

const stream = acp.ndJsonStream(input, output);
new acp.AgentSideConnection((conn) => new ExampleAgent(conn), stream);
````

## File: src/examples/client.ts
````typescript
#!/usr/bin/env node

import { spawn } from "node:child_process";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";
import { Writable, Readable } from "node:stream";
import readline from "node:readline/promises";

import * as acp from "../acp.js";

class ExampleClient implements acp.Client {
  async requestPermission(
    params: acp.RequestPermissionRequest,
  ): Promise<acp.RequestPermissionResponse> {
    console.log(`\n🔐 Permission requested: ${params.toolCall.title}`);

    console.log(`\nOptions:`);
    params.options.forEach((option, index) => {
      console.log(`   ${index + 1}. ${option.name} (${option.kind})`);
    });

    while (true) {
      const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout,
      });

      const answer = await rl.question("\nChoose an option: ");
      const trimmedAnswer = answer.trim();

      const optionIndex = parseInt(trimmedAnswer) - 1;
      if (optionIndex >= 0 && optionIndex < params.options.length) {
        return {
          outcome: {
            outcome: "selected",
            optionId: params.options[optionIndex].optionId,
          },
        };
      } else {
        console.log("Invalid option. Please try again.");
      }
    }
  }

  async sessionUpdate(params: acp.SessionNotification): Promise<void> {
    const update = params.update;

    switch (update.sessionUpdate) {
      case "agent_message_chunk":
        if (update.content.type === "text") {
          console.log(update.content.text);
        } else {
          console.log(`[${update.content.type}]`);
        }
        break;
      case "tool_call":
        console.log(`\n🔧 ${update.title} (${update.status})`);
        break;
      case "tool_call_update":
        console.log(
          `\n🔧 Tool call \`${update.toolCallId}\` updated: ${update.status}\n`,
        );
        break;
      case "plan":
      case "agent_thought_chunk":
      case "user_message_chunk":
        console.log(`[${update.sessionUpdate}]`);
        break;
      default:
        break;
    }
  }

  async writeTextFile(
    params: acp.WriteTextFileRequest,
  ): Promise<acp.WriteTextFileResponse> {
    console.error(
      "[Client] Write text file called with:",
      JSON.stringify(params, null, 2),
    );

    return {};
  }

  async readTextFile(
    params: acp.ReadTextFileRequest,
  ): Promise<acp.ReadTextFileResponse> {
    console.error(
      "[Client] Read text file called with:",
      JSON.stringify(params, null, 2),
    );

    return {
      content: "Mock file content",
    };
  }
}

async function main() {
  // Get the current file's directory to find agent.ts
  const __filename = fileURLToPath(import.meta.url);
  const __dirname = dirname(__filename);
  const agentPath = join(__dirname, "agent.ts");

  // Spawn the agent as a subprocess via npx (npx.cmd on Windows) using tsx
  const npxCmd = process.platform === "win32" ? "npx.cmd" : "npx";
  const agentProcess = spawn(npxCmd, ["tsx", agentPath], {
    stdio: ["pipe", "pipe", "inherit"],
  });

  // Create streams to communicate with the agent
  const input = Writable.toWeb(agentProcess.stdin!);
  const output = Readable.toWeb(
    agentProcess.stdout!,
  ) as ReadableStream<Uint8Array>;

  // Create the client connection
  const client = new ExampleClient();
  const stream = acp.ndJsonStream(input, output);
  const connection = new acp.ClientSideConnection((_agent) => client, stream);

  try {
    // Initialize the connection
    const initResult = await connection.initialize({
      protocolVersion: acp.PROTOCOL_VERSION,
      clientCapabilities: {
        fs: {
          readTextFile: true,
          writeTextFile: true,
        },
      },
    });

    console.log(
      `✅ Connected to agent (protocol v${initResult.protocolVersion})`,
    );

    // Create a new session
    const sessionResult = await connection.newSession({
      cwd: process.cwd(),
      mcpServers: [],
    });

    console.log(`📝 Created session: ${sessionResult.sessionId}`);
    console.log(`💬 User: Hello, agent!\n`);
    process.stdout.write(" ");

    // Send a test prompt
    const promptResult = await connection.prompt({
      sessionId: sessionResult.sessionId,
      prompt: [
        {
          type: "text",
          text: "Hello, agent!",
        },
      ],
    });

    console.log(`\n\n✅ Agent completed with: ${promptResult.stopReason}`);
  } catch (error) {
    console.error("[Client] Error:", error);
  } finally {
    agentProcess.kill();
    process.exit(0);
  }
}

main().catch(console.error);
````

## File: src/examples/README.md
````markdown
# ACP TypeScript Examples

This directory contains examples using the [ACP](https://agentclientprotocol.com) library for TypeScript:

- [`agent.ts`](./agent.ts) - A minimal agent implementation that simulates LLM interaction
- [`client.ts`](./client.ts) - A minimal client implementation that spawns the [`agent.ts`](./agent.ts) as a subprocess

## Running the Agent

### In Zed

While minimal, [`agent.ts`](./agent.ts) implements a compliant [ACP](https://agentclientprotocol.com) Agent. This means we can connect to it from an ACP client like [Zed](https://zed.dev)!

1. Clone this repo

```sh
$ git clone https://github.com/agentclientprotocol/typescript-sdk.git
```

2. Add the following at the root of your [Zed](https://zed.dev) settings:

```json
  "agent_servers": {
    "Example Agent": {
      "command": "npx",
      "args": [
        "tsx",
        "/path/to/agent-client-protocol/src/examples/agent.ts"
      ]
  }
```

❕ Make sure to replace `/path/to/agent-client-protocol` with the path to your clone of this repository.

Note: This configuration assumes you have [npx](https://docs.npmjs.com/cli/v8/commands/npx) in your `PATH`.

3. Run the `acp: open acp logs` action from the command palette (<kbd>⌘⇧P</kbd> on macOS, <kbd>ctrl-shift-p</kbd> on Windows/Linux) to see the messages exchanged between the example agent and Zed.

4. Then open the Agent Panel, and click "New Example Agent Thread" from the `+` menu on the top-right.

![Agent menu](./img/menu.png)

5. Finally, send a message and see the Agent respond!

![Final state](./img/final.png)

### By itself

You can also run the Agent directly and send messages to it:

```bash
npx tsx src/examples/agent.ts
```

Paste this into your terminal and press <kbd>enter</kbd>:

```json
{"jsonrpc":"2.0","id":0,"method":"initialize","params":{"protocolVersion":1}}
```

You should see it respond with something like:

```json
{"jsonrpc":"2.0","id":0,"result":{"protocolVersion":1,"agentCapabilities":{"loadSession":false}}}
```

From there, you can try making a [new session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session) and [sending a prompt](https://agentclientprotocol.com/protocol/prompt-turn#1-user-message).

## Running the Client

Run the client example from the root directory:

```bash
npx tsx src/examples/client.ts
```

This client will spawn the example agent as a subprocess, send a message, and print the content it receives from it.
````

## File: src/schema/index.ts
````typescript
// This file is auto-generated by @hey-api/openapi-ts

export type {
  AcceptNesNotification,
  AgentAuthCapabilities,
  AgentCapabilities,
  AgentNotification,
  AgentRequest,
  AgentResponse,
  Annotations,
  AudioContent,
  AuthCapabilities,
  AuthenticateRequest,
  AuthenticateResponse,
  AuthEnvVar,
  AuthMethod,
  AuthMethodAgent,
  AuthMethodEnvVar,
  AuthMethodTerminal,
  AvailableCommand,
  AvailableCommandInput,
  AvailableCommandsUpdate,
  BlobResourceContents,
  BooleanPropertySchema,
  CancelNotification,
  CancelRequestNotification,
  ClientCapabilities,
  ClientNesCapabilities,
  ClientNotification,
  ClientRequest,
  ClientResponse,
  CloseNesRequest,
  CloseNesResponse,
  CloseSessionRequest,
  CloseSessionResponse,
  CompleteElicitationNotification,
  ConfigOptionUpdate,
  Content,
  ContentBlock,
  ContentChunk,
  Cost,
  CreateElicitationRequest,
  CreateElicitationResponse,
  CreateTerminalRequest,
  CreateTerminalResponse,
  CurrentModeUpdate,
  DidChangeDocumentNotification,
  DidCloseDocumentNotification,
  DidFocusDocumentNotification,
  DidOpenDocumentNotification,
  DidSaveDocumentNotification,
  Diff,
  DisableProvidersRequest,
  DisableProvidersResponse,
  ElicitationAcceptAction,
  ElicitationCapabilities,
  ElicitationContentValue,
  ElicitationFormCapabilities,
  ElicitationFormMode,
  ElicitationId,
  ElicitationPropertySchema,
  ElicitationRequestScope,
  ElicitationSchema,
  ElicitationSchemaType,
  ElicitationSessionScope,
  ElicitationStringType,
  ElicitationUrlCapabilities,
  ElicitationUrlMode,
  EmbeddedResource,
  EmbeddedResourceResource,
  EnumOption,
  EnvVariable,
  Error,
  ErrorCode,
  ExtNotification,
  ExtRequest,
  ExtResponse,
  FileSystemCapabilities,
  ForkSessionRequest,
  ForkSessionResponse,
  HttpHeader,
  ImageContent,
  Implementation,
  InitializeRequest,
  InitializeResponse,
  IntegerPropertySchema,
  KillTerminalRequest,
  KillTerminalResponse,
  ListProvidersRequest,
  ListProvidersResponse,
  ListSessionsRequest,
  ListSessionsResponse,
  LlmProtocol,
  LoadSessionRequest,
  LoadSessionResponse,
  LogoutCapabilities,
  LogoutRequest,
  LogoutResponse,
  McpCapabilities,
  McpServer,
  McpServerHttp,
  McpServerSse,
  McpServerStdio,
  ModelId,
  ModelInfo,
  MultiSelectItems,
  MultiSelectPropertySchema,
  NesCapabilities,
  NesContextCapabilities,
  NesDiagnostic,
  NesDiagnosticsCapabilities,
  NesDiagnosticSeverity,
  NesDocumentDidChangeCapabilities,
  NesDocumentDidCloseCapabilities,
  NesDocumentDidFocusCapabilities,
  NesDocumentDidOpenCapabilities,
  NesDocumentDidSaveCapabilities,
  NesDocumentEventCapabilities,
  NesEditHistoryCapabilities,
  NesEditHistoryEntry,
  NesEditSuggestion,
  NesEventCapabilities,
  NesExcerpt,
  NesJumpCapabilities,
  NesJumpSuggestion,
  NesOpenFile,
  NesOpenFilesCapabilities,
  NesRecentFile,
  NesRecentFilesCapabilities,
  NesRejectReason,
  NesRelatedSnippet,
  NesRelatedSnippetsCapabilities,
  NesRenameCapabilities,
  NesRenameSuggestion,
  NesRepository,
  NesSearchAndReplaceCapabilities,
  NesSearchAndReplaceSuggestion,
  NesSuggestContext,
  NesSuggestion,
  NesTextEdit,
  NesTriggerKind,
  NesUserAction,
  NesUserActionsCapabilities,
  NewSessionRequest,
  NewSessionResponse,
  NumberPropertySchema,
  PermissionOption,
  PermissionOptionId,
  PermissionOptionKind,
  Plan,
  PlanEntry,
  PlanEntryPriority,
  PlanEntryStatus,
  Position,
  PositionEncodingKind,
  PromptCapabilities,
  PromptRequest,
  PromptResponse,
  ProtocolVersion,
  ProviderCurrentConfig,
  ProviderInfo,
  ProvidersCapabilities,
  Range,
  ReadTextFileRequest,
  ReadTextFileResponse,
  RejectNesNotification,
  ReleaseTerminalRequest,
  ReleaseTerminalResponse,
  RequestId,
  RequestPermissionOutcome,
  RequestPermissionRequest,
  RequestPermissionResponse,
  ResourceLink,
  ResumeSessionRequest,
  ResumeSessionResponse,
  Role,
  SelectedPermissionOutcome,
  SessionAdditionalDirectoriesCapabilities,
  SessionCapabilities,
  SessionCloseCapabilities,
  SessionConfigBoolean,
  SessionConfigGroupId,
  SessionConfigId,
  SessionConfigOption,
  SessionConfigOptionCategory,
  SessionConfigSelect,
  SessionConfigSelectGroup,
  SessionConfigSelectOption,
  SessionConfigSelectOptions,
  SessionConfigValueId,
  SessionForkCapabilities,
  SessionId,
  SessionInfo,
  SessionInfoUpdate,
  SessionListCapabilities,
  SessionMode,
  SessionModeId,
  SessionModelState,
  SessionModeState,
  SessionNotification,
  SessionResumeCapabilities,
  SessionUpdate,
  SetProvidersRequest,
  SetProvidersResponse,
  SetSessionConfigOptionRequest,
  SetSessionConfigOptionResponse,
  SetSessionModelRequest,
  SetSessionModelResponse,
  SetSessionModeRequest,
  SetSessionModeResponse,
  StartNesRequest,
  StartNesResponse,
  StopReason,
  StringFormat,
  StringPropertySchema,
  SuggestNesRequest,
  SuggestNesResponse,
  Terminal,
  TerminalExitStatus,
  TerminalOutputRequest,
  TerminalOutputResponse,
  TextContent,
  TextDocumentContentChangeEvent,
  TextDocumentSyncKind,
  TextResourceContents,
  TitledMultiSelectItems,
  ToolCall,
  ToolCallContent,
  ToolCallId,
  ToolCallLocation,
  ToolCallStatus,
  ToolCallUpdate,
  ToolKind,
  UnstructuredCommandInput,
  UntitledMultiSelectItems,
  Usage,
  UsageUpdate,
  WaitForTerminalExitRequest,
  WaitForTerminalExitResponse,
  WorkspaceFolder,
  WriteTextFileRequest,
  WriteTextFileResponse,
} from "./types.gen";

export const AGENT_METHODS = {
  authenticate: "authenticate",
  document_did_change: "document/didChange",
  document_did_close: "document/didClose",
  document_did_focus: "document/didFocus",
  document_did_open: "document/didOpen",
  document_did_save: "document/didSave",
  initialize: "initialize",
  logout: "logout",
  nes_accept: "nes/accept",
  nes_close: "nes/close",
  nes_reject: "nes/reject",
  nes_start: "nes/start",
  nes_suggest: "nes/suggest",
  providers_disable: "providers/disable",
  providers_list: "providers/list",
  providers_set: "providers/set",
  session_cancel: "session/cancel",
  session_close: "session/close",
  session_fork: "session/fork",
  session_list: "session/list",
  session_load: "session/load",
  session_new: "session/new",
  session_prompt: "session/prompt",
  session_resume: "session/resume",
  session_set_config_option: "session/set_config_option",
  session_set_mode: "session/set_mode",
  session_set_model: "session/set_model",
} as const;

export const CLIENT_METHODS = {
  elicitation_complete: "elicitation/complete",
  elicitation_create: "elicitation/create",
  fs_read_text_file: "fs/read_text_file",
  fs_write_text_file: "fs/write_text_file",
  session_request_permission: "session/request_permission",
  session_update: "session/update",
  terminal_create: "terminal/create",
  terminal_kill: "terminal/kill",
  terminal_output: "terminal/output",
  terminal_release: "terminal/release",
  terminal_wait_for_exit: "terminal/wait_for_exit",
} as const;

export const PROTOCOL_VERSION = 1;
````

## File: src/schema/types.gen.ts
````typescript
// This file is auto-generated by @hey-api/openapi-ts

// eslint-disable-next-line @typescript-eslint/no-unused-vars
type ClientOptions = {
  baseUrl: `${string}://${string}` | (string & {});
};

/**
 * Notification sent when a suggestion is accepted.
 */
export type AcceptNesNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the accepted suggestion.
   */
  id: string;
  /**
   * The session ID for this notification.
   */
  sessionId: SessionId;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Authentication-related capabilities supported by the agent.
 *
 * @experimental
 */
export type AgentAuthCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Whether the agent supports the logout method.
   *
   * By supplying `{}` it means that the agent supports the logout method.
   */
  logout?: LogoutCapabilities | null;
};

/**
 * Capabilities supported by the agent.
 *
 * Advertised during initialization to inform the client about
 * available features and content types.
 *
 * See protocol docs: [Agent Capabilities](https://agentclientprotocol.com/protocol/initialization#agent-capabilities)
 */
export type AgentCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Authentication-related capabilities supported by the agent.
   *
   * @experimental
   */
  auth?: AgentAuthCapabilities;
  /**
   * Whether the agent supports `session/load`.
   */
  loadSession?: boolean;
  /**
   * MCP capabilities supported by the agent.
   */
  mcpCapabilities?: McpCapabilities;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * NES (Next Edit Suggestions) capabilities supported by the agent.
   *
   * @experimental
   */
  nes?: NesCapabilities | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * The position encoding selected by the agent from the client's supported encodings.
   *
   * @experimental
   */
  positionEncoding?: PositionEncodingKind | null;
  /**
   * Prompt capabilities supported by the agent.
   */
  promptCapabilities?: PromptCapabilities;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Provider configuration capabilities supported by the agent.
   *
   * By supplying `{}` it means that the agent supports provider configuration methods.
   *
   * @experimental
   */
  providers?: ProvidersCapabilities | null;
  sessionCapabilities?: SessionCapabilities;
};

export type AgentNotification = {
  method: string;
  params?:
    | SessionNotification
    | CompleteElicitationNotification
    | ExtNotification
    | null;
};

export type AgentRequest = {
  id: RequestId;
  method: string;
  params?:
    | WriteTextFileRequest
    | ReadTextFileRequest
    | RequestPermissionRequest
    | CreateTerminalRequest
    | TerminalOutputRequest
    | ReleaseTerminalRequest
    | WaitForTerminalExitRequest
    | KillTerminalRequest
    | CreateElicitationRequest
    | ExtRequest
    | null;
};

export type AgentResponse =
  | {
      id: RequestId;
      /**
       * All possible responses that an agent can send to a client.
       *
       * This enum is used internally for routing RPC responses. You typically won't need
       * to use this directly - the responses are handled automatically by the connection.
       *
       * These are responses to the corresponding `ClientRequest` variants.
       */
      result:
        | InitializeResponse
        | AuthenticateResponse
        | ListProvidersResponse
        | SetProvidersResponse
        | DisableProvidersResponse
        | LogoutResponse
        | NewSessionResponse
        | LoadSessionResponse
        | ListSessionsResponse
        | ForkSessionResponse
        | ResumeSessionResponse
        | CloseSessionResponse
        | SetSessionModeResponse
        | SetSessionConfigOptionResponse
        | PromptResponse
        | SetSessionModelResponse
        | StartNesResponse
        | SuggestNesResponse
        | CloseNesResponse
        | ExtResponse;
    }
  | {
      error: Error;
      id: RequestId;
    };

/**
 * Optional annotations for the client. The client can use annotations to inform how objects are used or displayed
 */
export type Annotations = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  audience?: Array<Role> | null;
  lastModified?: string | null;
  priority?: number | null;
};

/**
 * Audio provided to or from an LLM.
 */
export type AudioContent = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  annotations?: Annotations | null;
  data: string;
  mimeType: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Authentication capabilities supported by the client.
 *
 * Advertised during initialization to inform the agent which authentication
 * method types the client can handle. This governs opt-in types that require
 * additional client-side support.
 *
 * @experimental
 */
export type AuthCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Whether the client supports `terminal` authentication methods.
   *
   * When `true`, the agent may include `terminal` entries in its authentication methods.
   */
  terminal?: boolean;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Describes a single environment variable for an [`AuthMethodEnvVar`] authentication method.
 *
 * @experimental
 */
export type AuthEnvVar = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Human-readable label for this variable, displayed in client UI.
   */
  label?: string | null;
  /**
   * The environment variable name (e.g. `"OPENAI_API_KEY"`).
   */
  name: string;
  /**
   * Whether this variable is optional.
   *
   * Defaults to `false`.
   */
  optional?: boolean;
  /**
   * Whether this value is a secret (e.g. API key, token).
   * Clients should use a password-style input for secret vars.
   *
   * Defaults to `true`.
   */
  secret?: boolean;
};

/**
 * Describes an available authentication method.
 *
 * The `type` field acts as the discriminator in the serialized JSON form.
 * When no `type` is present, the method is treated as `agent`.
 */
export type AuthMethod =
  | (AuthMethodEnvVar & {
      type: "env_var";
    })
  | (AuthMethodTerminal & {
      type: "terminal";
    })
  | AuthMethodAgent;

/**
 * Agent handles authentication itself.
 *
 * This is the default authentication method type.
 */
export type AuthMethodAgent = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Optional description providing more details about this authentication method.
   */
  description?: string | null;
  /**
   * Unique identifier for this authentication method.
   */
  id: string;
  /**
   * Human-readable name of the authentication method.
   */
  name: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Environment variable authentication method.
 *
 * The user provides credentials that the client passes to the agent as environment variables.
 *
 * @experimental
 */
export type AuthMethodEnvVar = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Optional description providing more details about this authentication method.
   */
  description?: string | null;
  /**
   * Unique identifier for this authentication method.
   */
  id: string;
  /**
   * Optional link to a page where the user can obtain their credentials.
   */
  link?: string | null;
  /**
   * Human-readable name of the authentication method.
   */
  name: string;
  /**
   * The environment variables the client should set.
   */
  vars: Array<AuthEnvVar>;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Terminal-based authentication method.
 *
 * The client runs an interactive terminal for the user to authenticate via a TUI.
 *
 * @experimental
 */
export type AuthMethodTerminal = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Additional arguments to pass when running the agent binary for terminal auth.
   */
  args?: Array<string>;
  /**
   * Optional description providing more details about this authentication method.
   */
  description?: string | null;
  /**
   * Additional environment variables to set when running the agent binary for terminal auth.
   */
  env?: {
    [key: string]: string;
  };
  /**
   * Unique identifier for this authentication method.
   */
  id: string;
  /**
   * Human-readable name of the authentication method.
   */
  name: string;
};

/**
 * Request parameters for the authenticate method.
 *
 * Specifies which authentication method to use.
 */
export type AuthenticateRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the authentication method to use.
   * Must be one of the methods advertised in the initialize response.
   */
  methodId: string;
};

/**
 * Response to the `authenticate` method.
 */
export type AuthenticateResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Information about a command.
 */
export type AvailableCommand = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Human-readable description of what the command does.
   */
  description: string;
  /**
   * Input for the command if required
   */
  input?: AvailableCommandInput | null;
  /**
   * Command name (e.g., `create_plan`, `research_codebase`).
   */
  name: string;
};

/**
 * unstructured
 *
 * All text that was typed after the command name is provided as input.
 */
export type AvailableCommandInput = UnstructuredCommandInput;

/**
 * Available commands are ready or have changed
 */
export type AvailableCommandsUpdate = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Commands the agent can execute
   */
  availableCommands: Array<AvailableCommand>;
};

/**
 * Binary resource contents.
 */
export type BlobResourceContents = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  blob: string;
  mimeType?: string | null;
  uri: string;
};

/**
 * Schema for boolean properties in an elicitation form.
 */
export type BooleanPropertySchema = {
  /**
   * Default value.
   */
  default?: boolean | null;
  /**
   * Human-readable description.
   */
  description?: string | null;
  /**
   * Optional title for the property.
   */
  title?: string | null;
};

/**
 * Notification to cancel ongoing operations for a session.
 *
 * See protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)
 */
export type CancelNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the session to cancel operations for.
   */
  sessionId: SessionId;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Notification to cancel an ongoing request.
 *
 * See protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/cancellation)
 *
 * @experimental
 */
export type CancelRequestNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the request to cancel.
   */
  requestId: RequestId;
};

/**
 * Capabilities supported by the client.
 *
 * Advertised during initialization to inform the agent about
 * available features and methods.
 *
 * See protocol docs: [Client Capabilities](https://agentclientprotocol.com/protocol/initialization#client-capabilities)
 */
export type ClientCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Authentication capabilities supported by the client.
   * Determines which authentication method types the agent may include
   * in its `InitializeResponse`.
   *
   * @experimental
   */
  auth?: AuthCapabilities;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Elicitation capabilities supported by the client.
   * Determines which elicitation modes the agent may use.
   *
   * @experimental
   */
  elicitation?: ElicitationCapabilities | null;
  /**
   * File system capabilities supported by the client.
   * Determines which file operations the agent can request.
   */
  fs?: FileSystemCapabilities;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * NES (Next Edit Suggestions) capabilities supported by the client.
   *
   * @experimental
   */
  nes?: ClientNesCapabilities | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * The position encodings supported by the client, in order of preference.
   *
   * @experimental
   */
  positionEncodings?: Array<PositionEncodingKind>;
  /**
   * Whether the Client support all `terminal*` methods.
   */
  terminal?: boolean;
};

/**
 * NES capabilities advertised by the client during initialization.
 */
export type ClientNesCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Whether the client supports the `jump` suggestion kind.
   */
  jump?: NesJumpCapabilities | null;
  /**
   * Whether the client supports the `rename` suggestion kind.
   */
  rename?: NesRenameCapabilities | null;
  /**
   * Whether the client supports the `searchAndReplace` suggestion kind.
   */
  searchAndReplace?: NesSearchAndReplaceCapabilities | null;
};

export type ClientNotification = {
  method: string;
  params?:
    | CancelNotification
    | DidOpenDocumentNotification
    | DidChangeDocumentNotification
    | DidCloseDocumentNotification
    | DidSaveDocumentNotification
    | DidFocusDocumentNotification
    | AcceptNesNotification
    | RejectNesNotification
    | ExtNotification
    | null;
};

export type ClientRequest = {
  id: RequestId;
  method: string;
  params?:
    | InitializeRequest
    | AuthenticateRequest
    | ListProvidersRequest
    | SetProvidersRequest
    | DisableProvidersRequest
    | LogoutRequest
    | NewSessionRequest
    | LoadSessionRequest
    | ListSessionsRequest
    | ForkSessionRequest
    | ResumeSessionRequest
    | CloseSessionRequest
    | SetSessionModeRequest
    | SetSessionConfigOptionRequest
    | PromptRequest
    | SetSessionModelRequest
    | StartNesRequest
    | SuggestNesRequest
    | CloseNesRequest
    | ExtRequest
    | null;
};

export type ClientResponse =
  | {
      id: RequestId;
      /**
       * All possible responses that a client can send to an agent.
       *
       * This enum is used internally for routing RPC responses. You typically won't need
       * to use this directly - the responses are handled automatically by the connection.
       *
       * These are responses to the corresponding `AgentRequest` variants.
       */
      result:
        | WriteTextFileResponse
        | ReadTextFileResponse
        | RequestPermissionResponse
        | CreateTerminalResponse
        | TerminalOutputResponse
        | ReleaseTerminalResponse
        | WaitForTerminalExitResponse
        | KillTerminalResponse
        | CreateElicitationResponse
        | ExtResponse;
    }
  | {
      error: Error;
      id: RequestId;
    };

/**
 * Request to close an NES session.
 *
 * The agent **must** cancel any ongoing work related to the NES session
 * and then free up any resources associated with the session.
 */
export type CloseNesRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the NES session to close.
   */
  sessionId: SessionId;
};

/**
 * Response from closing an NES session.
 */
export type CloseNesResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Request parameters for closing an active session.
 *
 * If supported, the agent **must** cancel any ongoing work related to the session
 * (treat it as if `session/cancel` was called) and then free up any resources
 * associated with the session.
 *
 * Only available if the Agent supports the `sessionCapabilities.close` capability.
 */
export type CloseSessionRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the session to close.
   */
  sessionId: SessionId;
};

/**
 * Response from closing a session.
 */
export type CloseSessionResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Notification sent by the agent when a URL-based elicitation is complete.
 *
 * @experimental
 */
export type CompleteElicitationNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the elicitation that completed.
   */
  elicitationId: ElicitationId;
};

/**
 * Session configuration options have been updated.
 */
export type ConfigOptionUpdate = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The full set of configuration options and their current values.
   */
  configOptions: Array<SessionConfigOption>;
};

/**
 * Standard content block (text, images, resources).
 */
export type Content = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The actual content block.
   */
  content: ContentBlock;
};

/**
 * Content blocks represent displayable information in the Agent Client Protocol.
 *
 * They provide a structured way to handle various types of user-facing content—whether
 * it's text from language models, images for analysis, or embedded resources for context.
 *
 * Content blocks appear in:
 * - User prompts sent via `session/prompt`
 * - Language model output streamed through `session/update` notifications
 * - Progress updates and results from tool calls
 *
 * This structure is compatible with the Model Context Protocol (MCP), enabling
 * agents to seamlessly forward content from MCP tool outputs without transformation.
 *
 * See protocol docs: [Content](https://agentclientprotocol.com/protocol/content)
 */
export type ContentBlock =
  | (TextContent & {
      type: "text";
    })
  | (ImageContent & {
      type: "image";
    })
  | (AudioContent & {
      type: "audio";
    })
  | (ResourceLink & {
      type: "resource_link";
    })
  | (EmbeddedResource & {
      type: "resource";
    });

/**
 * A streamed item of content
 */
export type ContentChunk = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * A single item of content
   */
  content: ContentBlock;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * A unique identifier for the message this chunk belongs to.
   *
   * All chunks belonging to the same message share the same `messageId`.
   * A change in `messageId` indicates a new message has started.
   * Both clients and agents MUST use UUID format for message IDs.
   *
   * @experimental
   */
  messageId?: string | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Cost information for a session.
 *
 * @experimental
 */
export type Cost = {
  /**
   * Total cumulative cost for session.
   */
  amount: number;
  /**
   * ISO 4217 currency code (e.g., "USD", "EUR").
   */
  currency: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request from the agent to elicit structured user input.
 *
 * The agent sends this to the client to request information from the user,
 * either via a form or by directing them to a URL.
 * Elicitations are tied to a session (optionally a tool call) or a request.
 *
 * @experimental
 */
export type CreateElicitationRequest = (
  | (ElicitationFormMode & {
      mode: "form";
    })
  | (ElicitationUrlMode & {
      mode: "url";
    })
) & {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * A human-readable message describing what input is needed.
   */
  message: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response from the client to an elicitation request.
 *
 * @experimental
 */
export type CreateElicitationResponse = (
  | (ElicitationAcceptAction & {
      action: "accept";
    })
  | {
      action: "decline";
    }
  | {
      action: "cancel";
    }
) & {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Request to create a new terminal and execute a command.
 */
export type CreateTerminalRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Array of command arguments.
   */
  args?: Array<string>;
  /**
   * The command to execute.
   */
  command: string;
  /**
   * Working directory for the command (absolute path).
   */
  cwd?: string | null;
  /**
   * Environment variables for the command.
   */
  env?: Array<EnvVariable>;
  /**
   * Maximum number of output bytes to retain.
   *
   * When the limit is exceeded, the Client truncates from the beginning of the output
   * to stay within the limit.
   *
   * The Client MUST ensure truncation happens at a character boundary to maintain valid
   * string output, even if this means the retained output is slightly less than the
   * specified limit.
   */
  outputByteLimit?: number | null;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
};

/**
 * Response containing the ID of the created terminal.
 */
export type CreateTerminalResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The unique identifier for the created terminal.
   */
  terminalId: string;
};

/**
 * The current mode of the session has changed
 *
 * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
 */
export type CurrentModeUpdate = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the current mode
   */
  currentModeId: SessionModeId;
};

/**
 * Notification sent when a file is edited.
 */
export type DidChangeDocumentNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The content changes.
   */
  contentChanges: Array<TextDocumentContentChangeEvent>;
  /**
   * The session ID for this notification.
   */
  sessionId: SessionId;
  /**
   * The URI of the changed document.
   */
  uri: string;
  /**
   * The new version number of the document.
   */
  version: number;
};

/**
 * Notification sent when a file is closed.
 */
export type DidCloseDocumentNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The session ID for this notification.
   */
  sessionId: SessionId;
  /**
   * The URI of the closed document.
   */
  uri: string;
};

/**
 * Notification sent when a file becomes the active editor tab.
 */
export type DidFocusDocumentNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The current cursor position.
   */
  position: Position;
  /**
   * The session ID for this notification.
   */
  sessionId: SessionId;
  /**
   * The URI of the focused document.
   */
  uri: string;
  /**
   * The version number of the document.
   */
  version: number;
  /**
   * The portion of the file currently visible in the editor viewport.
   */
  visibleRange: Range;
};

/**
 * Notification sent when a file is opened in the editor.
 */
export type DidOpenDocumentNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The language identifier of the document (e.g., "rust", "python").
   */
  languageId: string;
  /**
   * The session ID for this notification.
   */
  sessionId: SessionId;
  /**
   * The full text content of the document.
   */
  text: string;
  /**
   * The URI of the opened document.
   */
  uri: string;
  /**
   * The version number of the document.
   */
  version: number;
};

/**
 * Notification sent when a file is saved.
 */
export type DidSaveDocumentNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The session ID for this notification.
   */
  sessionId: SessionId;
  /**
   * The URI of the saved document.
   */
  uri: string;
};

/**
 * A diff representing file modifications.
 *
 * Shows changes to files in a format suitable for display in the client UI.
 *
 * See protocol docs: [Content](https://agentclientprotocol.com/protocol/tool-calls#content)
 */
export type Diff = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The new content after modification.
   */
  newText: string;
  /**
   * The original content (None for new files).
   */
  oldText?: string | null;
  /**
   * The file path being modified.
   */
  path: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for `providers/disable`.
 *
 * @experimental
 */
export type DisableProvidersRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Provider id to disable.
   */
  id: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `providers/disable`.
 *
 * @experimental
 */
export type DisableProvidersResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * The user accepted the elicitation and provided content.
 *
 * @experimental
 */
export type ElicitationAcceptAction = {
  /**
   * The user-provided content, if any, as an object matching the requested schema.
   */
  content?: {
    [key: string]: ElicitationContentValue;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Elicitation capabilities supported by the client.
 *
 * @experimental
 */
export type ElicitationCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Whether the client supports form-based elicitation.
   */
  form?: ElicitationFormCapabilities | null;
  /**
   * Whether the client supports URL-based elicitation.
   */
  url?: ElicitationUrlCapabilities | null;
};

export type ElicitationContentValue =
  | string
  | number
  | number
  | boolean
  | Array<string>;

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Form-based elicitation capabilities.
 *
 * @experimental
 */
export type ElicitationFormCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Form-based elicitation mode where the client renders a form from the provided schema.
 *
 * @experimental
 */
export type ElicitationFormMode = (
  | ElicitationSessionScope
  | ElicitationRequestScope
) & {
  /**
   * A JSON Schema describing the form fields to present to the user.
   */
  requestedSchema: ElicitationSchema;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Unique identifier for an elicitation.
 *
 * @experimental
 */
export type ElicitationId = string;

/**
 * Property schema for elicitation form fields.
 *
 * Each variant corresponds to a JSON Schema `"type"` value.
 * Single-select enums use the `String` variant with `enum` or `oneOf` set.
 * Multi-select enums use the `Array` variant.
 */
export type ElicitationPropertySchema =
  | (StringPropertySchema & {
      type: "string";
    })
  | (NumberPropertySchema & {
      type: "number";
    })
  | (IntegerPropertySchema & {
      type: "integer";
    })
  | (BooleanPropertySchema & {
      type: "boolean";
    })
  | (MultiSelectPropertySchema & {
      type: "array";
    });

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request-scoped elicitation, tied to a specific JSON-RPC request outside of a session
 * (e.g., during auth/configuration phases before any session is started).
 *
 * @experimental
 */
export type ElicitationRequestScope = {
  /**
   * The request this elicitation is tied to.
   */
  requestId: RequestId;
};

/**
 * Type-safe elicitation schema for requesting structured user input.
 *
 * This represents a JSON Schema object with primitive-typed properties,
 * as required by the elicitation specification.
 */
export type ElicitationSchema = {
  /**
   * Optional description of what this schema represents.
   */
  description?: string | null;
  /**
   * Property definitions (must be primitive types).
   */
  properties?: {
    [key: string]: ElicitationPropertySchema;
  };
  /**
   * List of required property names.
   */
  required?: Array<string> | null;
  /**
   * Optional title for the schema.
   */
  title?: string | null;
  /**
   * Type discriminator. Always `"object"`.
   */
  type?: ElicitationSchemaType;
};

/**
 * Object schema type.
 */
export type ElicitationSchemaType = "object";

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Session-scoped elicitation, optionally tied to a specific tool call.
 *
 * When `tool_call_id` is set, the elicitation is tied to a specific tool call.
 * This is useful when an agent receives an elicitation from an MCP server
 * during a tool call and needs to redirect it to the user.
 *
 * @experimental
 */
export type ElicitationSessionScope = {
  /**
   * The session this elicitation is tied to.
   */
  sessionId: SessionId;
  /**
   * Optional tool call within the session.
   */
  toolCallId?: ToolCallId | null;
};

/**
 * String schema type.
 */
export type ElicitationStringType = "string";

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * URL-based elicitation capabilities.
 *
 * @experimental
 */
export type ElicitationUrlCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * URL-based elicitation mode where the client directs the user to a URL.
 *
 * @experimental
 */
export type ElicitationUrlMode = (
  | ElicitationSessionScope
  | ElicitationRequestScope
) & {
  /**
   * The unique identifier for this elicitation.
   */
  elicitationId: ElicitationId;
  /**
   * The URL to direct the user to.
   */
  url: string;
};

/**
 * The contents of a resource, embedded into a prompt or tool call result.
 */
export type EmbeddedResource = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  annotations?: Annotations | null;
  resource: EmbeddedResourceResource;
};

/**
 * Resource content that can be embedded in a message.
 */
export type EmbeddedResourceResource =
  | TextResourceContents
  | BlobResourceContents;

/**
 * A titled enum option with a const value and human-readable title.
 */
export type EnumOption = {
  /**
   * The constant value for this option.
   */
  const: string;
  /**
   * Human-readable title for this option.
   */
  title: string;
};

/**
 * An environment variable to set when launching an MCP server.
 */
export type EnvVariable = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The name of the environment variable.
   */
  name: string;
  /**
   * The value to set for the environment variable.
   */
  value: string;
};

/**
 * JSON-RPC error object.
 *
 * Represents an error that occurred during method execution, following the
 * JSON-RPC 2.0 error object specification with optional additional data.
 *
 * See protocol docs: [JSON-RPC Error Object](https://www.jsonrpc.org/specification#error_object)
 */
export type Error = {
  /**
   * A number indicating the error type that occurred.
   * This must be an integer as defined in the JSON-RPC specification.
   */
  code: ErrorCode;
  /**
   * Optional primitive or structured value that contains additional information about the error.
   * This may include debugging information or context-specific details.
   */
  data?: unknown;
  /**
   * A string providing a short description of the error.
   * The message should be limited to a concise single sentence.
   */
  message: string;
};

/**
 * Predefined error codes for common JSON-RPC and ACP-specific errors.
 *
 * These codes follow the JSON-RPC 2.0 specification for standard errors
 * and use the reserved range (-32000 to -32099) for protocol-specific errors.
 */
export type ErrorCode =
  | -32700
  | -32600
  | -32601
  | -32602
  | -32603
  | -32800
  | -32000
  | -32002
  | -32042
  | number;

/**
 * Allows the Agent to send an arbitrary notification that is not part of the ACP spec.
 * Extension notifications provide a way to send one-way messages for custom functionality
 * while maintaining protocol compatibility.
 *
 * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
 */
export type ExtNotification = unknown;

/**
 * Allows for sending an arbitrary request that is not part of the ACP spec.
 * Extension methods provide a way to add custom functionality while maintaining
 * protocol compatibility.
 *
 * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
 */
export type ExtRequest = unknown;

/**
 * Allows for sending an arbitrary response to an [`ExtRequest`] that is not part of the ACP spec.
 * Extension methods provide a way to add custom functionality while maintaining
 * protocol compatibility.
 *
 * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
 */
export type ExtResponse = unknown;

/**
 * File system capabilities that a client may support.
 *
 * See protocol docs: [FileSystem](https://agentclientprotocol.com/protocol/initialization#filesystem)
 */
export type FileSystemCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Whether the Client supports `fs/read_text_file` requests.
   */
  readTextFile?: boolean;
  /**
   * Whether the Client supports `fs/write_text_file` requests.
   */
  writeTextFile?: boolean;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for forking an existing session.
 *
 * Creates a new session based on the context of an existing one, allowing
 * operations like generating summaries without affecting the original session's history.
 *
 * Only available if the Agent supports the `session.fork` capability.
 *
 * @experimental
 */
export type ForkSessionRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Additional workspace roots to activate for this session. Each path must be absolute.
   *
   * When omitted or empty, no additional roots are activated. When non-empty,
   * this is the complete resulting additional-root list for the forked
   * session.
   *
   * @experimental
   */
  additionalDirectories?: Array<string>;
  /**
   * The working directory for this session.
   */
  cwd: string;
  /**
   * List of MCP servers to connect to for this session.
   */
  mcpServers?: Array<McpServer>;
  /**
   * The ID of the session to fork.
   */
  sessionId: SessionId;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response from forking an existing session.
 *
 * @experimental
 */
export type ForkSessionResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Initial session configuration options if supported by the Agent.
   */
  configOptions?: Array<SessionConfigOption> | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Initial model state if supported by the Agent
   *
   * @experimental
   */
  models?: SessionModelState | null;
  /**
   * Initial mode state if supported by the Agent
   *
   * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
   */
  modes?: SessionModeState | null;
  /**
   * Unique identifier for the newly created forked session.
   */
  sessionId: SessionId;
};

/**
 * An HTTP header to set when making requests to the MCP server.
 */
export type HttpHeader = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The name of the HTTP header.
   */
  name: string;
  /**
   * The value to set for the HTTP header.
   */
  value: string;
};

/**
 * An image provided to or from an LLM.
 */
export type ImageContent = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  annotations?: Annotations | null;
  data: string;
  mimeType: string;
  uri?: string | null;
};

/**
 * Metadata about the implementation of the client or agent.
 * Describes the name and version of an MCP implementation, with an optional
 * title for UI representation.
 */
export type Implementation = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Intended for programmatic or logical use, but can be used as a display
   * name fallback if title isn’t present.
   */
  name: string;
  /**
   * Intended for UI and end-user contexts — optimized to be human-readable
   * and easily understood.
   *
   * If not provided, the name should be used for display.
   */
  title?: string | null;
  /**
   * Version of the implementation. Can be displayed to the user or used
   * for debugging or metrics purposes. (e.g. "1.0.0").
   */
  version: string;
};

/**
 * Request parameters for the initialize method.
 *
 * Sent by the client to establish connection and negotiate capabilities.
 *
 * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
 */
export type InitializeRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Capabilities supported by the client.
   */
  clientCapabilities?: ClientCapabilities;
  /**
   * Information about the Client name and version sent to the Agent.
   *
   * Note: in future versions of the protocol, this will be required.
   */
  clientInfo?: Implementation | null;
  /**
   * The latest protocol version supported by the client.
   */
  protocolVersion: ProtocolVersion;
};

/**
 * Response to the `initialize` method.
 *
 * Contains the negotiated protocol version and agent capabilities.
 *
 * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
 */
export type InitializeResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Capabilities supported by the agent.
   */
  agentCapabilities?: AgentCapabilities;
  /**
   * Information about the Agent name and version sent to the Client.
   *
   * Note: in future versions of the protocol, this will be required.
   */
  agentInfo?: Implementation | null;
  /**
   * Authentication methods supported by the agent.
   */
  authMethods?: Array<AuthMethod>;
  /**
   * The protocol version the client specified if supported by the agent,
   * or the latest protocol version supported by the agent.
   *
   * The client should disconnect, if it doesn't support this version.
   */
  protocolVersion: ProtocolVersion;
};

/**
 * Schema for integer properties in an elicitation form.
 */
export type IntegerPropertySchema = {
  /**
   * Default value.
   */
  default?: number | null;
  /**
   * Human-readable description.
   */
  description?: string | null;
  /**
   * Maximum value (inclusive).
   */
  maximum?: number | null;
  /**
   * Minimum value (inclusive).
   */
  minimum?: number | null;
  /**
   * Optional title for the property.
   */
  title?: string | null;
};

/**
 * Request to kill a terminal without releasing it.
 */
export type KillTerminalRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
  /**
   * The ID of the terminal to kill.
   */
  terminalId: string;
};

/**
 * Response to `terminal/kill` method
 */
export type KillTerminalResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for `providers/list`.
 *
 * @experimental
 */
export type ListProvidersRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `providers/list`.
 *
 * @experimental
 */
export type ListProvidersResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Configurable providers with current routing info suitable for UI display.
   */
  providers: Array<ProviderInfo>;
};

/**
 * Request parameters for listing existing sessions.
 *
 * Only available if the Agent supports the `sessionCapabilities.list` capability.
 */
export type ListSessionsRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Filter sessions by the exact ordered additional workspace roots. Each path must be absolute.
   *
   * This filter applies only when the field is present and non-empty. When
   * omitted or empty, no additional-root filter is applied.
   *
   * @experimental
   */
  additionalDirectories?: Array<string>;
  /**
   * Opaque cursor token from a previous response's nextCursor field for cursor-based pagination
   */
  cursor?: string | null;
  /**
   * Filter sessions by working directory. Must be an absolute path.
   */
  cwd?: string | null;
};

/**
 * Response from listing sessions.
 */
export type ListSessionsResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Opaque cursor token. If present, pass this in the next request's cursor parameter
   * to fetch the next page. If absent, there are no more results.
   */
  nextCursor?: string | null;
  /**
   * Array of session information objects
   */
  sessions: Array<SessionInfo>;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Well-known API protocol identifiers for LLM providers.
 *
 * Agents and clients MUST handle unknown protocol identifiers gracefully.
 *
 * Protocol names beginning with `_` are free for custom use, like other ACP extension methods.
 * Protocol names that do not begin with `_` are reserved for the ACP spec.
 *
 * @experimental
 */
export type LlmProtocol =
  | "anthropic"
  | "openai"
  | "azure"
  | "vertex"
  | "bedrock"
  | string;

/**
 * Request parameters for loading an existing session.
 *
 * Only available if the Agent supports the `loadSession` capability.
 *
 * See protocol docs: [Loading Sessions](https://agentclientprotocol.com/protocol/session-setup#loading-sessions)
 */
export type LoadSessionRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Additional workspace roots to activate for this session. Each path must be absolute.
   *
   * When omitted or empty, no additional roots are activated. When non-empty,
   * this is the complete resulting additional-root list for the loaded
   * session.
   *
   * @experimental
   */
  additionalDirectories?: Array<string>;
  /**
   * The working directory for this session.
   */
  cwd: string;
  /**
   * List of MCP servers to connect to for this session.
   */
  mcpServers: Array<McpServer>;
  /**
   * The ID of the session to load.
   */
  sessionId: SessionId;
};

/**
 * Response from loading an existing session.
 */
export type LoadSessionResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Initial session configuration options if supported by the Agent.
   */
  configOptions?: Array<SessionConfigOption> | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Initial model state if supported by the Agent
   *
   * @experimental
   */
  models?: SessionModelState | null;
  /**
   * Initial mode state if supported by the Agent
   *
   * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
   */
  modes?: SessionModeState | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Logout capabilities supported by the agent.
 *
 * By supplying `{}` it means that the agent supports the logout method.
 *
 * @experimental
 */
export type LogoutCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for the logout method.
 *
 * Terminates the current authenticated session.
 *
 * @experimental
 */
export type LogoutRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to the `logout` method.
 *
 * @experimental
 */
export type LogoutResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * MCP capabilities supported by the agent
 */
export type McpCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Agent supports [`McpServer::Http`].
   */
  http?: boolean;
  /**
   * Agent supports [`McpServer::Sse`].
   */
  sse?: boolean;
};

/**
 * Configuration for connecting to an MCP (Model Context Protocol) server.
 *
 * MCP servers provide tools and context that the agent can use when
 * processing prompts.
 *
 * See protocol docs: [MCP Servers](https://agentclientprotocol.com/protocol/session-setup#mcp-servers)
 */
export type McpServer =
  | (McpServerHttp & {
      type: "http";
    })
  | (McpServerSse & {
      type: "sse";
    })
  | McpServerStdio;

/**
 * HTTP transport configuration for MCP.
 */
export type McpServerHttp = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * HTTP headers to set when making requests to the MCP server.
   */
  headers: Array<HttpHeader>;
  /**
   * Human-readable name identifying this MCP server.
   */
  name: string;
  /**
   * URL to the MCP server.
   */
  url: string;
};

/**
 * SSE transport configuration for MCP.
 */
export type McpServerSse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * HTTP headers to set when making requests to the MCP server.
   */
  headers: Array<HttpHeader>;
  /**
   * Human-readable name identifying this MCP server.
   */
  name: string;
  /**
   * URL to the MCP server.
   */
  url: string;
};

/**
 * Stdio transport configuration for MCP.
 */
export type McpServerStdio = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Command-line arguments to pass to the MCP server.
   */
  args: Array<string>;
  /**
   * Path to the MCP server executable.
   */
  command: string;
  /**
   * Environment variables to set when launching the MCP server.
   */
  env: Array<EnvVariable>;
  /**
   * Human-readable name identifying this MCP server.
   */
  name: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * A unique identifier for a model.
 *
 * @experimental
 */
export type ModelId = string;

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Information about a selectable model.
 *
 * @experimental
 */
export type ModelInfo = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Optional description of the model.
   */
  description?: string | null;
  /**
   * Unique identifier for the model.
   */
  modelId: ModelId;
  /**
   * Human-readable name of the model.
   */
  name: string;
};

/**
 * Items for a multi-select (array) property schema.
 */
export type MultiSelectItems =
  | UntitledMultiSelectItems
  | TitledMultiSelectItems;

/**
 * Schema for multi-select (array) properties in an elicitation form.
 */
export type MultiSelectPropertySchema = {
  /**
   * Default selected values.
   */
  default?: Array<string> | null;
  /**
   * Human-readable description.
   */
  description?: string | null;
  /**
   * The items definition describing allowed values.
   */
  items: MultiSelectItems;
  /**
   * Maximum number of items to select.
   */
  maxItems?: number | null;
  /**
   * Minimum number of items to select.
   */
  minItems?: number | null;
  /**
   * Optional title for the property.
   */
  title?: string | null;
};

/**
 * NES capabilities advertised by the agent during initialization.
 */
export type NesCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Context the agent wants attached to each suggestion request.
   */
  context?: NesContextCapabilities | null;
  /**
   * Events the agent wants to receive.
   */
  events?: NesEventCapabilities | null;
};

/**
 * Context capabilities the agent wants attached to each suggestion request.
 */
export type NesContextCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Whether the agent wants diagnostics context.
   */
  diagnostics?: NesDiagnosticsCapabilities | null;
  /**
   * Whether the agent wants edit history context.
   */
  editHistory?: NesEditHistoryCapabilities | null;
  /**
   * Whether the agent wants open files context.
   */
  openFiles?: NesOpenFilesCapabilities | null;
  /**
   * Whether the agent wants recent files context.
   */
  recentFiles?: NesRecentFilesCapabilities | null;
  /**
   * Whether the agent wants related snippets context.
   */
  relatedSnippets?: NesRelatedSnippetsCapabilities | null;
  /**
   * Whether the agent wants user actions context.
   */
  userActions?: NesUserActionsCapabilities | null;
};

/**
 * A diagnostic (error, warning, etc.).
 */
export type NesDiagnostic = {
  /**
   * The diagnostic message.
   */
  message: string;
  /**
   * The range of the diagnostic.
   */
  range: Range;
  /**
   * The severity of the diagnostic.
   */
  severity: NesDiagnosticSeverity;
  /**
   * The URI of the file containing the diagnostic.
   */
  uri: string;
};

/**
 * Severity of a diagnostic.
 */
export type NesDiagnosticSeverity =
  | "error"
  | "warning"
  | "information"
  | "hint";

/**
 * Capabilities for diagnostics context.
 */
export type NesDiagnosticsCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Capabilities for `document/didChange` events.
 */
export type NesDocumentDidChangeCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The sync kind the agent wants: `"full"` or `"incremental"`.
   */
  syncKind: TextDocumentSyncKind;
};

/**
 * Marker for `document/didClose` capability support.
 */
export type NesDocumentDidCloseCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Marker for `document/didFocus` capability support.
 */
export type NesDocumentDidFocusCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Marker for `document/didOpen` capability support.
 */
export type NesDocumentDidOpenCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Marker for `document/didSave` capability support.
 */
export type NesDocumentDidSaveCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Document event capabilities the agent wants to receive.
 */
export type NesDocumentEventCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Whether the agent wants `document/didChange` events, and the sync kind.
   */
  didChange?: NesDocumentDidChangeCapabilities | null;
  /**
   * Whether the agent wants `document/didClose` events.
   */
  didClose?: NesDocumentDidCloseCapabilities | null;
  /**
   * Whether the agent wants `document/didFocus` events.
   */
  didFocus?: NesDocumentDidFocusCapabilities | null;
  /**
   * Whether the agent wants `document/didOpen` events.
   */
  didOpen?: NesDocumentDidOpenCapabilities | null;
  /**
   * Whether the agent wants `document/didSave` events.
   */
  didSave?: NesDocumentDidSaveCapabilities | null;
};

/**
 * Capabilities for edit history context.
 */
export type NesEditHistoryCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Maximum number of edit history entries the agent can use.
   */
  maxCount?: number | null;
};

/**
 * An entry in the edit history.
 */
export type NesEditHistoryEntry = {
  /**
   * A diff representing the edit.
   */
  diff: string;
  /**
   * The URI of the edited file.
   */
  uri: string;
};

/**
 * A text edit suggestion.
 */
export type NesEditSuggestion = {
  /**
   * Optional suggested cursor position after applying edits.
   */
  cursorPosition?: Position | null;
  /**
   * The text edits to apply.
   */
  edits: Array<NesTextEdit>;
  /**
   * Unique identifier for accept/reject tracking.
   */
  id: string;
  /**
   * The URI of the file to edit.
   */
  uri: string;
};

/**
 * Event capabilities the agent can consume.
 */
export type NesEventCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Document event capabilities.
   */
  document?: NesDocumentEventCapabilities | null;
};

/**
 * A code excerpt from a file.
 */
export type NesExcerpt = {
  /**
   * The end line of the excerpt (zero-based).
   */
  endLine: number;
  /**
   * The start line of the excerpt (zero-based).
   */
  startLine: number;
  /**
   * The text content of the excerpt.
   */
  text: string;
};

/**
 * Marker for jump suggestion support.
 */
export type NesJumpCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * A jump-to-location suggestion.
 */
export type NesJumpSuggestion = {
  /**
   * Unique identifier for accept/reject tracking.
   */
  id: string;
  /**
   * The target position within the file.
   */
  position: Position;
  /**
   * The file to navigate to.
   */
  uri: string;
};

/**
 * An open file in the editor.
 */
export type NesOpenFile = {
  /**
   * The language identifier.
   */
  languageId: string;
  /**
   * Timestamp in milliseconds since epoch of when the file was last focused.
   */
  lastFocusedMs?: number | null;
  /**
   * The URI of the file.
   */
  uri: string;
  /**
   * The visible range in the editor, if any.
   */
  visibleRange?: Range | null;
};

/**
 * Capabilities for open files context.
 */
export type NesOpenFilesCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * A recently accessed file.
 */
export type NesRecentFile = {
  /**
   * The language identifier.
   */
  languageId: string;
  /**
   * The full text content of the file.
   */
  text: string;
  /**
   * The URI of the file.
   */
  uri: string;
};

/**
 * Capabilities for recent files context.
 */
export type NesRecentFilesCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Maximum number of recent files the agent can use.
   */
  maxCount?: number | null;
};

/**
 * The reason a suggestion was rejected.
 */
export type NesRejectReason = "rejected" | "ignored" | "replaced" | "cancelled";

/**
 * A related code snippet from a file.
 */
export type NesRelatedSnippet = {
  /**
   * The code excerpts.
   */
  excerpts: Array<NesExcerpt>;
  /**
   * The URI of the file containing the snippets.
   */
  uri: string;
};

/**
 * Capabilities for related snippets context.
 */
export type NesRelatedSnippetsCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Marker for rename suggestion support.
 */
export type NesRenameCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * A rename symbol suggestion.
 */
export type NesRenameSuggestion = {
  /**
   * Unique identifier for accept/reject tracking.
   */
  id: string;
  /**
   * The new name for the symbol.
   */
  newName: string;
  /**
   * The position of the symbol to rename.
   */
  position: Position;
  /**
   * The file URI containing the symbol.
   */
  uri: string;
};

/**
 * Repository metadata for an NES session.
 */
export type NesRepository = {
  /**
   * The repository name.
   */
  name: string;
  /**
   * The repository owner.
   */
  owner: string;
  /**
   * The remote URL of the repository.
   */
  remoteUrl: string;
};

/**
 * Marker for search and replace suggestion support.
 */
export type NesSearchAndReplaceCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * A search-and-replace suggestion.
 */
export type NesSearchAndReplaceSuggestion = {
  /**
   * Unique identifier for accept/reject tracking.
   */
  id: string;
  /**
   * Whether `search` is a regular expression. Defaults to `false`.
   */
  isRegex?: boolean | null;
  /**
   * The replacement text.
   */
  replace: string;
  /**
   * The text or pattern to find.
   */
  search: string;
  /**
   * The file URI to search within.
   */
  uri: string;
};

/**
 * Context attached to a suggestion request.
 */
export type NesSuggestContext = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Current diagnostics (errors, warnings).
   */
  diagnostics?: Array<NesDiagnostic> | null;
  /**
   * Recent edit history.
   */
  editHistory?: Array<NesEditHistoryEntry> | null;
  /**
   * Currently open files in the editor.
   */
  openFiles?: Array<NesOpenFile> | null;
  /**
   * Recently accessed files.
   */
  recentFiles?: Array<NesRecentFile> | null;
  /**
   * Related code snippets.
   */
  relatedSnippets?: Array<NesRelatedSnippet> | null;
  /**
   * Recent user actions (typing, navigation, etc.).
   */
  userActions?: Array<NesUserAction> | null;
};

/**
 * A suggestion returned by the agent.
 */
export type NesSuggestion =
  | (NesEditSuggestion & {
      kind: "edit";
    })
  | (NesJumpSuggestion & {
      kind: "jump";
    })
  | (NesRenameSuggestion & {
      kind: "rename";
    })
  | (NesSearchAndReplaceSuggestion & {
      kind: "searchAndReplace";
    });

/**
 * A text edit within a suggestion.
 */
export type NesTextEdit = {
  /**
   * The replacement text.
   */
  newText: string;
  /**
   * The range to replace.
   */
  range: Range;
};

/**
 * What triggered the suggestion request.
 */
export type NesTriggerKind = "automatic" | "diagnostic" | "manual";

/**
 * A user action (typing, cursor movement, etc.).
 */
export type NesUserAction = {
  /**
   * The kind of action (e.g., "insertChar", "cursorMovement").
   */
  action: string;
  /**
   * The position where the action occurred.
   */
  position: Position;
  /**
   * Timestamp in milliseconds since epoch.
   */
  timestampMs: number;
  /**
   * The URI of the file where the action occurred.
   */
  uri: string;
};

/**
 * Capabilities for user actions context.
 */
export type NesUserActionsCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Maximum number of user actions the agent can use.
   */
  maxCount?: number | null;
};

/**
 * Request parameters for creating a new session.
 *
 * See protocol docs: [Creating a Session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session)
 */
export type NewSessionRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Additional workspace roots for this session. Each path must be absolute.
   *
   * These expand the session's filesystem scope without changing `cwd`, which
   * remains the base for relative paths. When omitted or empty, no
   * additional roots are activated for the new session.
   *
   * @experimental
   */
  additionalDirectories?: Array<string>;
  /**
   * The working directory for this session. Must be an absolute path.
   */
  cwd: string;
  /**
   * List of MCP (Model Context Protocol) servers the agent should connect to.
   */
  mcpServers: Array<McpServer>;
};

/**
 * Response from creating a new session.
 *
 * See protocol docs: [Creating a Session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session)
 */
export type NewSessionResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Initial session configuration options if supported by the Agent.
   */
  configOptions?: Array<SessionConfigOption> | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Initial model state if supported by the Agent
   *
   * @experimental
   */
  models?: SessionModelState | null;
  /**
   * Initial mode state if supported by the Agent
   *
   * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
   */
  modes?: SessionModeState | null;
  /**
   * Unique identifier for the created session.
   *
   * Used in all subsequent requests for this conversation.
   */
  sessionId: SessionId;
};

/**
 * Schema for number (floating-point) properties in an elicitation form.
 */
export type NumberPropertySchema = {
  /**
   * Default value.
   */
  default?: number | null;
  /**
   * Human-readable description.
   */
  description?: string | null;
  /**
   * Maximum value (inclusive).
   */
  maximum?: number | null;
  /**
   * Minimum value (inclusive).
   */
  minimum?: number | null;
  /**
   * Optional title for the property.
   */
  title?: string | null;
};

/**
 * An option presented to the user when requesting permission.
 */
export type PermissionOption = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Hint about the nature of this permission option.
   */
  kind: PermissionOptionKind;
  /**
   * Human-readable label to display to the user.
   */
  name: string;
  /**
   * Unique identifier for this permission option.
   */
  optionId: PermissionOptionId;
};

/**
 * Unique identifier for a permission option.
 */
export type PermissionOptionId = string;

/**
 * The type of permission option being presented to the user.
 *
 * Helps clients choose appropriate icons and UI treatment.
 */
export type PermissionOptionKind =
  | "allow_once"
  | "allow_always"
  | "reject_once"
  | "reject_always";

/**
 * An execution plan for accomplishing complex tasks.
 *
 * Plans consist of multiple entries representing individual tasks or goals.
 * Agents report plans to clients to provide visibility into their execution strategy.
 * Plans can evolve during execution as the agent discovers new requirements or completes tasks.
 *
 * See protocol docs: [Agent Plan](https://agentclientprotocol.com/protocol/agent-plan)
 */
export type Plan = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The list of tasks to be accomplished.
   *
   * When updating a plan, the agent must send a complete list of all entries
   * with their current status. The client replaces the entire plan with each update.
   */
  entries: Array<PlanEntry>;
};

/**
 * A single entry in the execution plan.
 *
 * Represents a task or goal that the assistant intends to accomplish
 * as part of fulfilling the user's request.
 * See protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)
 */
export type PlanEntry = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Human-readable description of what this task aims to accomplish.
   */
  content: string;
  /**
   * The relative importance of this task.
   * Used to indicate which tasks are most critical to the overall goal.
   */
  priority: PlanEntryPriority;
  /**
   * Current execution status of this task.
   */
  status: PlanEntryStatus;
};

/**
 * Priority levels for plan entries.
 *
 * Used to indicate the relative importance or urgency of different
 * tasks in the execution plan.
 * See protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)
 */
export type PlanEntryPriority = "high" | "medium" | "low";

/**
 * Status of a plan entry in the execution flow.
 *
 * Tracks the lifecycle of each task from planning through completion.
 * See protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)
 */
export type PlanEntryStatus = "pending" | "in_progress" | "completed";

/**
 * A zero-based position in a text document.
 *
 * The meaning of `character` depends on the negotiated position encoding.
 */
export type Position = {
  /**
   * Zero-based character offset (encoding-dependent).
   */
  character: number;
  /**
   * Zero-based line number.
   */
  line: number;
};

/**
 * The encoding used for character offsets in positions.
 *
 * Follows the same conventions as LSP 3.17. The default is UTF-16.
 */
export type PositionEncodingKind = "utf-16" | "utf-32" | "utf-8";

/**
 * Prompt capabilities supported by the agent in `session/prompt` requests.
 *
 * Baseline agent functionality requires support for [`ContentBlock::Text`]
 * and [`ContentBlock::ResourceLink`] in prompt requests.
 *
 * Other variants must be explicitly opted in to.
 * Capabilities for different types of content in prompt requests.
 *
 * Indicates which content types beyond the baseline (text and resource links)
 * the agent can process.
 *
 * See protocol docs: [Prompt Capabilities](https://agentclientprotocol.com/protocol/initialization#prompt-capabilities)
 */
export type PromptCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Agent supports [`ContentBlock::Audio`].
   */
  audio?: boolean;
  /**
   * Agent supports embedded context in `session/prompt` requests.
   *
   * When enabled, the Client is allowed to include [`ContentBlock::Resource`]
   * in prompt requests for pieces of context that are referenced in the message.
   */
  embeddedContext?: boolean;
  /**
   * Agent supports [`ContentBlock::Image`].
   */
  image?: boolean;
};

/**
 * Request parameters for sending a user prompt to the agent.
 *
 * Contains the user's message and any additional context.
 *
 * See protocol docs: [User Message](https://agentclientprotocol.com/protocol/prompt-turn#1-user-message)
 */
export type PromptRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * A client-generated unique identifier for this user message.
   *
   * If provided, the Agent SHOULD echo this value as `userMessageId` in the
   * [`PromptResponse`] to confirm it was recorded.
   * Both clients and agents MUST use UUID format for message IDs.
   *
   * @experimental
   */
  messageId?: string | null;
  /**
   * The blocks of content that compose the user's message.
   *
   * As a baseline, the Agent MUST support [`ContentBlock::Text`] and [`ContentBlock::ResourceLink`],
   * while other variants are optionally enabled via [`PromptCapabilities`].
   *
   * The Client MUST adapt its interface according to [`PromptCapabilities`].
   *
   * The client MAY include referenced pieces of context as either
   * [`ContentBlock::Resource`] or [`ContentBlock::ResourceLink`].
   *
   * When available, [`ContentBlock::Resource`] is preferred
   * as it avoids extra round-trips and allows the message to include
   * pieces of context from sources the agent may not have access to.
   */
  prompt: Array<ContentBlock>;
  /**
   * The ID of the session to send this user message to
   */
  sessionId: SessionId;
};

/**
 * Response from processing a user prompt.
 *
 * See protocol docs: [Check for Completion](https://agentclientprotocol.com/protocol/prompt-turn#4-check-for-completion)
 */
export type PromptResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Indicates why the agent stopped processing the turn.
   */
  stopReason: StopReason;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Token usage for this turn (optional).
   *
   * @experimental
   */
  usage?: Usage | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * The acknowledged user message ID.
   *
   * If the client provided a `messageId` in the [`PromptRequest`], the agent echoes it here
   * to confirm it was recorded. If the client did not provide one, the agent MAY assign one
   * and return it here. Absence of this field indicates the agent did not record a message ID.
   *
   * @experimental
   */
  userMessageId?: string | null;
};

/**
 * Protocol version identifier.
 *
 * This version is only bumped for breaking changes.
 * Non-breaking changes should be introduced via capabilities.
 */
export type ProtocolVersion = number;

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Current effective non-secret routing configuration for a provider.
 *
 * @experimental
 */
export type ProviderCurrentConfig = {
  /**
   * Protocol currently used by this provider.
   */
  apiType: LlmProtocol;
  /**
   * Base URL currently used by this provider.
   */
  baseUrl: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Information about a configurable LLM provider.
 *
 * @experimental
 */
export type ProviderInfo = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Current effective non-secret routing config.
   * Null or omitted means provider is disabled.
   */
  current?: ProviderCurrentConfig | null;
  /**
   * Provider identifier, for example "main" or "openai".
   */
  id: string;
  /**
   * Whether this provider is mandatory and cannot be disabled via `providers/disable`.
   * If true, clients must not call `providers/disable` for this id.
   */
  required: boolean;
  /**
   * Supported protocol types for this provider.
   */
  supported: Array<LlmProtocol>;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Provider configuration capabilities supported by the agent.
 *
 * By supplying `{}` it means that the agent supports provider configuration methods.
 *
 * @experimental
 */
export type ProvidersCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * A range in a text document, expressed as start and end positions.
 */
export type Range = {
  /**
   * The end position (exclusive).
   */
  end: Position;
  /**
   * The start position (inclusive).
   */
  start: Position;
};

/**
 * Request to read content from a text file.
 *
 * Only available if the client supports the `fs.readTextFile` capability.
 */
export type ReadTextFileRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Maximum number of lines to read.
   */
  limit?: number | null;
  /**
   * Line number to start reading from (1-based).
   */
  line?: number | null;
  /**
   * Absolute path to the file to read.
   */
  path: string;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
};

/**
 * Response containing the contents of a text file.
 */
export type ReadTextFileResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  content: string;
};

/**
 * Notification sent when a suggestion is rejected.
 */
export type RejectNesNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the rejected suggestion.
   */
  id: string;
  /**
   * The reason for rejection.
   */
  reason?: NesRejectReason | null;
  /**
   * The session ID for this notification.
   */
  sessionId: SessionId;
};

/**
 * Request to release a terminal and free its resources.
 */
export type ReleaseTerminalRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
  /**
   * The ID of the terminal to release.
   */
  terminalId: string;
};

/**
 * Response to terminal/release method
 */
export type ReleaseTerminalResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * JSON RPC Request Id
 *
 * An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
 *
 * The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
 *
 * [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
 *
 * [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
 */
export type RequestId = null | number | string;

/**
 * The outcome of a permission request.
 */
export type RequestPermissionOutcome =
  | {
      outcome: "cancelled";
    }
  | (SelectedPermissionOutcome & {
      outcome: "selected";
    });

/**
 * Request for user permission to execute a tool call.
 *
 * Sent when the agent needs authorization before performing a sensitive operation.
 *
 * See protocol docs: [Requesting Permission](https://agentclientprotocol.com/protocol/tool-calls#requesting-permission)
 */
export type RequestPermissionRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Available permission options for the user to choose from.
   */
  options: Array<PermissionOption>;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
  /**
   * Details about the tool call requiring permission.
   */
  toolCall: ToolCallUpdate;
};

/**
 * Response to a permission request.
 */
export type RequestPermissionResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The user's decision on the permission request.
   */
  outcome: RequestPermissionOutcome;
};

/**
 * A resource that the server is capable of reading, included in a prompt or tool call result.
 */
export type ResourceLink = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  annotations?: Annotations | null;
  description?: string | null;
  mimeType?: string | null;
  name: string;
  size?: number | null;
  title?: string | null;
  uri: string;
};

/**
 * Request parameters for resuming an existing session.
 *
 * Resumes an existing session without returning previous messages (unlike `session/load`).
 * This is useful for agents that can resume sessions but don't implement full session loading.
 *
 * Only available if the Agent supports the `sessionCapabilities.resume` capability.
 */
export type ResumeSessionRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Additional workspace roots to activate for this session. Each path must be absolute.
   *
   * When omitted or empty, no additional roots are activated. When non-empty,
   * this is the complete resulting additional-root list for the resumed
   * session.
   *
   * @experimental
   */
  additionalDirectories?: Array<string>;
  /**
   * The working directory for this session.
   */
  cwd: string;
  /**
   * List of MCP servers to connect to for this session.
   */
  mcpServers?: Array<McpServer>;
  /**
   * The ID of the session to resume.
   */
  sessionId: SessionId;
};

/**
 * Response from resuming an existing session.
 */
export type ResumeSessionResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Initial session configuration options if supported by the Agent.
   */
  configOptions?: Array<SessionConfigOption> | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Initial model state if supported by the Agent
   *
   * @experimental
   */
  models?: SessionModelState | null;
  /**
   * Initial mode state if supported by the Agent
   *
   * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
   */
  modes?: SessionModeState | null;
};

/**
 * The sender or recipient of messages and data in a conversation.
 */
export type Role = "assistant" | "user";

/**
 * The user selected one of the provided options.
 */
export type SelectedPermissionOutcome = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the option the user selected.
   */
  optionId: PermissionOptionId;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Capabilities for additional session directories support.
 *
 * By supplying `{}` it means that the agent supports the `additionalDirectories` field on
 * supported session lifecycle requests and `session/list`.
 *
 * @experimental
 */
export type SessionAdditionalDirectoriesCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Session capabilities supported by the agent.
 *
 * As a baseline, all Agents **MUST** support `session/new`, `session/prompt`, `session/cancel`, and `session/update`.
 *
 * Optionally, they **MAY** support other session methods and notifications by specifying additional capabilities.
 *
 * Note: `session/load` is still handled by the top-level `load_session` capability. This will be unified in future versions of the protocol.
 *
 * See protocol docs: [Session Capabilities](https://agentclientprotocol.com/protocol/initialization#session-capabilities)
 */
export type SessionCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Whether the agent supports `additionalDirectories` on supported session lifecycle requests and `session/list`.
   *
   * @experimental
   */
  additionalDirectories?: SessionAdditionalDirectoriesCapabilities | null;
  /**
   * Whether the agent supports `session/close`.
   */
  close?: SessionCloseCapabilities | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Whether the agent supports `session/fork`.
   *
   * @experimental
   */
  fork?: SessionForkCapabilities | null;
  /**
   * Whether the agent supports `session/list`.
   */
  list?: SessionListCapabilities | null;
  /**
   * Whether the agent supports `session/resume`.
   */
  resume?: SessionResumeCapabilities | null;
};

/**
 * Capabilities for the `session/close` method.
 *
 * By supplying `{}` it means that the agent supports closing of sessions.
 */
export type SessionCloseCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * A boolean on/off toggle session configuration option payload.
 *
 * @experimental
 */
export type SessionConfigBoolean = {
  /**
   * The current value of the boolean option.
   */
  currentValue: boolean;
};

/**
 * Unique identifier for a session configuration option value group.
 */
export type SessionConfigGroupId = string;

/**
 * Unique identifier for a session configuration option.
 */
export type SessionConfigId = string;

/**
 * A session configuration option selector and its current state.
 */
export type SessionConfigOption = (
  | (SessionConfigSelect & {
      type: "select";
    })
  | (SessionConfigBoolean & {
      type: "boolean";
    })
) & {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Optional semantic category for this option (UX only).
   */
  category?: SessionConfigOptionCategory | null;
  /**
   * Optional description for the Client to display to the user.
   */
  description?: string | null;
  /**
   * Unique identifier for the configuration option.
   */
  id: SessionConfigId;
  /**
   * Human-readable label for the option.
   */
  name: string;
};

/**
 * Semantic category for a session configuration option.
 *
 * This is intended to help Clients distinguish broadly common selectors (e.g. model selector vs
 * session mode selector vs thought/reasoning level) for UX purposes (keyboard shortcuts, icons,
 * placement). It MUST NOT be required for correctness. Clients MUST handle missing or unknown
 * categories gracefully.
 *
 * Category names beginning with `_` are free for custom use, like other ACP extension methods.
 * Category names that do not begin with `_` are reserved for the ACP spec.
 */
export type SessionConfigOptionCategory =
  | "mode"
  | "model"
  | "thought_level"
  | string;

/**
 * A single-value selector (dropdown) session configuration option payload.
 */
export type SessionConfigSelect = {
  /**
   * The currently selected value.
   */
  currentValue: SessionConfigValueId;
  /**
   * The set of selectable options.
   */
  options: SessionConfigSelectOptions;
};

/**
 * A group of possible values for a session configuration option.
 */
export type SessionConfigSelectGroup = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Unique identifier for this group.
   */
  group: SessionConfigGroupId;
  /**
   * Human-readable label for this group.
   */
  name: string;
  /**
   * The set of option values in this group.
   */
  options: Array<SessionConfigSelectOption>;
};

/**
 * A possible value for a session configuration option.
 */
export type SessionConfigSelectOption = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Optional description for this option value.
   */
  description?: string | null;
  /**
   * Human-readable label for this option value.
   */
  name: string;
  /**
   * Unique identifier for this option value.
   */
  value: SessionConfigValueId;
};

/**
 * Possible values for a session configuration option.
 */
export type SessionConfigSelectOptions =
  | Array<SessionConfigSelectOption>
  | Array<SessionConfigSelectGroup>;

/**
 * Unique identifier for a session configuration option value.
 */
export type SessionConfigValueId = string;

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Capabilities for the `session/fork` method.
 *
 * By supplying `{}` it means that the agent supports forking of sessions.
 *
 * @experimental
 */
export type SessionForkCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * A unique identifier for a conversation session between a client and agent.
 *
 * Sessions maintain their own context, conversation history, and state,
 * allowing multiple independent interactions with the same agent.
 *
 * See protocol docs: [Session ID](https://agentclientprotocol.com/protocol/session-setup#session-id)
 */
export type SessionId = string;

/**
 * Information about a session returned by session/list
 */
export type SessionInfo = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Authoritative ordered additional workspace roots for this session. Each path must be absolute.
   *
   * When omitted or empty, there are no additional roots for the session.
   *
   * @experimental
   */
  additionalDirectories?: Array<string>;
  /**
   * The working directory for this session. Must be an absolute path.
   */
  cwd: string;
  /**
   * Unique identifier for the session
   */
  sessionId: SessionId;
  /**
   * Human-readable title for the session
   */
  title?: string | null;
  /**
   * ISO 8601 timestamp of last activity
   */
  updatedAt?: string | null;
};

/**
 * Update to session metadata. All fields are optional to support partial updates.
 *
 * Agents send this notification to update session information like title or custom metadata.
 * This allows clients to display dynamic session names and track session state changes.
 */
export type SessionInfoUpdate = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Human-readable title for the session. Set to null to clear.
   */
  title?: string | null;
  /**
   * ISO 8601 timestamp of last activity. Set to null to clear.
   */
  updatedAt?: string | null;
};

/**
 * Capabilities for the `session/list` method.
 *
 * By supplying `{}` it means that the agent supports listing of sessions.
 */
export type SessionListCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * A mode the agent can operate in.
 *
 * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
 */
export type SessionMode = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  description?: string | null;
  id: SessionModeId;
  name: string;
};

/**
 * Unique identifier for a Session Mode.
 */
export type SessionModeId = string;

/**
 * The set of modes and the one currently active.
 */
export type SessionModeState = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The set of modes that the Agent can operate in
   */
  availableModes: Array<SessionMode>;
  /**
   * The current mode the Agent is in.
   */
  currentModeId: SessionModeId;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * The set of models and the one currently active.
 *
 * @experimental
 */
export type SessionModelState = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The set of models that the Agent can use
   */
  availableModels: Array<ModelInfo>;
  /**
   * The current model the Agent is in.
   */
  currentModelId: ModelId;
};

/**
 * Notification containing a session update from the agent.
 *
 * Used to stream real-time progress and results during prompt processing.
 *
 * See protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)
 */
export type SessionNotification = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the session this update pertains to.
   */
  sessionId: SessionId;
  /**
   * The actual update content.
   */
  update: SessionUpdate;
};

/**
 * Capabilities for the `session/resume` method.
 *
 * By supplying `{}` it means that the agent supports resuming of sessions.
 */
export type SessionResumeCapabilities = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Different types of updates that can be sent during session processing.
 *
 * These updates provide real-time feedback about the agent's progress.
 *
 * See protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)
 */
export type SessionUpdate =
  | (ContentChunk & {
      sessionUpdate: "user_message_chunk";
    })
  | (ContentChunk & {
      sessionUpdate: "agent_message_chunk";
    })
  | (ContentChunk & {
      sessionUpdate: "agent_thought_chunk";
    })
  | (ToolCall & {
      sessionUpdate: "tool_call";
    })
  | (ToolCallUpdate & {
      sessionUpdate: "tool_call_update";
    })
  | (Plan & {
      sessionUpdate: "plan";
    })
  | (AvailableCommandsUpdate & {
      sessionUpdate: "available_commands_update";
    })
  | (CurrentModeUpdate & {
      sessionUpdate: "current_mode_update";
    })
  | (ConfigOptionUpdate & {
      sessionUpdate: "config_option_update";
    })
  | (SessionInfoUpdate & {
      sessionUpdate: "session_info_update";
    })
  | (UsageUpdate & {
      sessionUpdate: "usage_update";
    });

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for `providers/set`.
 *
 * Replaces the full configuration for one provider id.
 *
 * @experimental
 */
export type SetProvidersRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Protocol type for this provider.
   */
  apiType: LlmProtocol;
  /**
   * Base URL for requests sent through this provider.
   */
  baseUrl: string;
  /**
   * Full headers map for this provider.
   * May include authorization, routing, or other integration-specific headers.
   */
  headers?: {
    [key: string]: string;
  };
  /**
   * Provider id to configure.
   */
  id: string;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `providers/set`.
 *
 * @experimental
 */
export type SetProvidersResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Request parameters for setting a session configuration option.
 */
export type SetSessionConfigOptionRequest = (
  | {
      type: "boolean";
      /**
       * The boolean value.
       */
      value: boolean;
    }
  | {
      /**
       * The value ID.
       */
      value: SessionConfigValueId;
    }
) & {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the configuration option to set.
   */
  configId: SessionConfigId;
  /**
   * The ID of the session to set the configuration option for.
   */
  sessionId: SessionId;
};

/**
 * Response to `session/set_config_option` method.
 */
export type SetSessionConfigOptionResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The full set of configuration options and their current values.
   */
  configOptions: Array<SessionConfigOption>;
};

/**
 * Request parameters for setting a session mode.
 */
export type SetSessionModeRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the mode to set.
   */
  modeId: SessionModeId;
  /**
   * The ID of the session to set the mode for.
   */
  sessionId: SessionId;
};

/**
 * Response to `session/set_mode` method.
 */
export type SetSessionModeResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for setting a session model.
 *
 * @experimental
 */
export type SetSessionModelRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The ID of the model to set.
   */
  modelId: ModelId;
  /**
   * The ID of the session to set the model for.
   */
  sessionId: SessionId;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `session/set_model` method.
 *
 * @experimental
 */
export type SetSessionModelResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};

/**
 * Request to start an NES session.
 */
export type StartNesRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Repository metadata, if the workspace is a git repository.
   */
  repository?: NesRepository | null;
  /**
   * The workspace folders.
   */
  workspaceFolders?: Array<WorkspaceFolder> | null;
  /**
   * The root URI of the workspace.
   */
  workspaceUri?: string | null;
};

/**
 * Response to `nes/start`.
 */
export type StartNesResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The session ID for the newly started NES session.
   */
  sessionId: SessionId;
};

/**
 * Reasons why an agent stops processing a prompt turn.
 *
 * See protocol docs: [Stop Reasons](https://agentclientprotocol.com/protocol/prompt-turn#stop-reasons)
 */
export type StopReason =
  | "end_turn"
  | "max_tokens"
  | "max_turn_requests"
  | "refusal"
  | "cancelled";

/**
 * String format types for string properties in elicitation schemas.
 */
export type StringFormat = "email" | "uri" | "date" | "date-time";

/**
 * Schema for string properties in an elicitation form.
 *
 * When `enum` or `oneOf` is set, this represents a single-select enum
 * with `"type": "string"`.
 */
export type StringPropertySchema = {
  /**
   * Default value.
   */
  default?: string | null;
  /**
   * Human-readable description.
   */
  description?: string | null;
  /**
   * Enum values for untitled single-select enums.
   */
  enum?: Array<string> | null;
  /**
   * String format.
   */
  format?: StringFormat | null;
  /**
   * Maximum string length.
   */
  maxLength?: number | null;
  /**
   * Minimum string length.
   */
  minLength?: number | null;
  /**
   * Titled enum options for titled single-select enums.
   */
  oneOf?: Array<EnumOption> | null;
  /**
   * Pattern the string must match.
   */
  pattern?: string | null;
  /**
   * Optional title for the property.
   */
  title?: string | null;
};

/**
 * Request for a code suggestion.
 */
export type SuggestNesRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Context for the suggestion, included based on agent capabilities.
   */
  context?: NesSuggestContext | null;
  /**
   * The current cursor position.
   */
  position: Position;
  /**
   * The current text selection range, if any.
   */
  selection?: Range | null;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
  /**
   * What triggered this suggestion request.
   */
  triggerKind: NesTriggerKind;
  /**
   * The URI of the document to suggest for.
   */
  uri: string;
  /**
   * The version number of the document.
   */
  version: number;
};

/**
 * Response to `nes/suggest`.
 */
export type SuggestNesResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The list of suggestions.
   */
  suggestions: Array<NesSuggestion>;
};

/**
 * Embed a terminal created with `terminal/create` by its id.
 *
 * The terminal must be added before calling `terminal/release`.
 *
 * See protocol docs: [Terminal](https://agentclientprotocol.com/protocol/terminals)
 */
export type Terminal = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  terminalId: string;
};

/**
 * Exit status of a terminal command.
 */
export type TerminalExitStatus = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The process exit code (may be null if terminated by signal).
   */
  exitCode?: number | null;
  /**
   * The signal that terminated the process (may be null if exited normally).
   */
  signal?: string | null;
};

/**
 * Request to get the current output and status of a terminal.
 */
export type TerminalOutputRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
  /**
   * The ID of the terminal to get output from.
   */
  terminalId: string;
};

/**
 * Response containing the terminal output and exit status.
 */
export type TerminalOutputResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Exit status if the command has completed.
   */
  exitStatus?: TerminalExitStatus | null;
  /**
   * The terminal output captured so far.
   */
  output: string;
  /**
   * Whether the output was truncated due to byte limits.
   */
  truncated: boolean;
};

/**
 * Text provided to or from an LLM.
 */
export type TextContent = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  annotations?: Annotations | null;
  text: string;
};

/**
 * A content change event for a document.
 *
 * When `range` is `None`, `text` is the full content of the document.
 * When `range` is `Some`, `text` replaces the given range.
 */
export type TextDocumentContentChangeEvent = {
  /**
   * The range of the document that changed. If `None`, the entire content is replaced.
   */
  range?: Range | null;
  /**
   * The new text for the range, or the full document content if `range` is `None`.
   */
  text: string;
};

/**
 * How the agent wants document changes delivered.
 */
export type TextDocumentSyncKind = "full" | "incremental";

/**
 * Text-based resource contents.
 */
export type TextResourceContents = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  mimeType?: string | null;
  text: string;
  uri: string;
};

/**
 * Items definition for titled multi-select enum properties.
 */
export type TitledMultiSelectItems = {
  /**
   * Titled enum options.
   */
  anyOf: Array<EnumOption>;
};

/**
 * Represents a tool call that the language model has requested.
 *
 * Tool calls are actions that the agent executes on behalf of the language model,
 * such as reading files, executing code, or fetching data from external sources.
 *
 * See protocol docs: [Tool Calls](https://agentclientprotocol.com/protocol/tool-calls)
 */
export type ToolCall = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Content produced by the tool call.
   */
  content?: Array<ToolCallContent>;
  /**
   * The category of tool being invoked.
   * Helps clients choose appropriate icons and UI treatment.
   */
  kind?: ToolKind;
  /**
   * File locations affected by this tool call.
   * Enables "follow-along" features in clients.
   */
  locations?: Array<ToolCallLocation>;
  /**
   * Raw input parameters sent to the tool.
   */
  rawInput?: unknown;
  /**
   * Raw output returned by the tool.
   */
  rawOutput?: unknown;
  /**
   * Current execution status of the tool call.
   */
  status?: ToolCallStatus;
  /**
   * Human-readable title describing what the tool is doing.
   */
  title: string;
  /**
   * Unique identifier for this tool call within the session.
   */
  toolCallId: ToolCallId;
};

/**
 * Content produced by a tool call.
 *
 * Tool calls can produce different types of content including
 * standard content blocks (text, images) or file diffs.
 *
 * See protocol docs: [Content](https://agentclientprotocol.com/protocol/tool-calls#content)
 */
export type ToolCallContent =
  | (Content & {
      type: "content";
    })
  | (Diff & {
      type: "diff";
    })
  | (Terminal & {
      type: "terminal";
    });

/**
 * Unique identifier for a tool call within a session.
 */
export type ToolCallId = string;

/**
 * A file location being accessed or modified by a tool.
 *
 * Enables clients to implement "follow-along" features that track
 * which files the agent is working with in real-time.
 *
 * See protocol docs: [Following the Agent](https://agentclientprotocol.com/protocol/tool-calls#following-the-agent)
 */
export type ToolCallLocation = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Optional line number within the file.
   */
  line?: number | null;
  /**
   * The file path being accessed or modified.
   */
  path: string;
};

/**
 * Execution status of a tool call.
 *
 * Tool calls progress through different statuses during their lifecycle.
 *
 * See protocol docs: [Status](https://agentclientprotocol.com/protocol/tool-calls#status)
 */
export type ToolCallStatus = "pending" | "in_progress" | "completed" | "failed";

/**
 * An update to an existing tool call.
 *
 * Used to report progress and results as tools execute. All fields except
 * the tool call ID are optional - only changed fields need to be included.
 *
 * See protocol docs: [Updating](https://agentclientprotocol.com/protocol/tool-calls#updating)
 */
export type ToolCallUpdate = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Replace the content collection.
   */
  content?: Array<ToolCallContent> | null;
  /**
   * Update the tool kind.
   */
  kind?: ToolKind | null;
  /**
   * Replace the locations collection.
   */
  locations?: Array<ToolCallLocation> | null;
  /**
   * Update the raw input.
   */
  rawInput?: unknown;
  /**
   * Update the raw output.
   */
  rawOutput?: unknown;
  /**
   * Update the execution status.
   */
  status?: ToolCallStatus | null;
  /**
   * Update the human-readable title.
   */
  title?: string | null;
  /**
   * The ID of the tool call being updated.
   */
  toolCallId: ToolCallId;
};

/**
 * Categories of tools that can be invoked.
 *
 * Tool kinds help clients choose appropriate icons and optimize how they
 * display tool execution progress.
 *
 * See protocol docs: [Creating](https://agentclientprotocol.com/protocol/tool-calls#creating)
 */
export type ToolKind =
  | "read"
  | "edit"
  | "delete"
  | "move"
  | "search"
  | "execute"
  | "think"
  | "fetch"
  | "switch_mode"
  | "other";

/**
 * All text that was typed after the command name is provided as input.
 */
export type UnstructuredCommandInput = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * A hint to display when the input hasn't been provided yet
   */
  hint: string;
};

/**
 * Items definition for untitled multi-select enum properties.
 */
export type UntitledMultiSelectItems = {
  /**
   * Allowed enum values.
   */
  enum: Array<string>;
  /**
   * Item type discriminator. Must be `"string"`.
   */
  type: ElicitationStringType;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Token usage information for a prompt turn.
 *
 * @experimental
 */
export type Usage = {
  /**
   * Total cache read tokens.
   */
  cachedReadTokens?: number | null;
  /**
   * Total cache write tokens.
   */
  cachedWriteTokens?: number | null;
  /**
   * Total input tokens across all turns.
   */
  inputTokens: number;
  /**
   * Total output tokens across all turns.
   */
  outputTokens: number;
  /**
   * Total thought/reasoning tokens
   */
  thoughtTokens?: number | null;
  /**
   * Sum of all token types across session.
   */
  totalTokens: number;
};

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Context window and cost update for a session.
 *
 * @experimental
 */
export type UsageUpdate = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * Cumulative session cost (optional).
   */
  cost?: Cost | null;
  /**
   * Total context window size in tokens.
   */
  size: number;
  /**
   * Tokens currently in context.
   */
  used: number;
};

/**
 * Request to wait for a terminal command to exit.
 */
export type WaitForTerminalExitRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
  /**
   * The ID of the terminal to wait for.
   */
  terminalId: string;
};

/**
 * Response containing the exit status of a terminal command.
 */
export type WaitForTerminalExitResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The process exit code (may be null if terminated by signal).
   */
  exitCode?: number | null;
  /**
   * The signal that terminated the process (may be null if exited normally).
   */
  signal?: string | null;
};

/**
 * A workspace folder.
 */
export type WorkspaceFolder = {
  /**
   * The display name of the folder.
   */
  name: string;
  /**
   * The URI of the folder.
   */
  uri: string;
};

/**
 * Request to write content to a text file.
 *
 * Only available if the client supports the `fs.writeTextFile` capability.
 */
export type WriteTextFileRequest = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
  /**
   * The text content to write to the file.
   */
  content: string;
  /**
   * Absolute path to the file to write.
   */
  path: string;
  /**
   * The session ID for this request.
   */
  sessionId: SessionId;
};

/**
 * Response to `fs/write_text_file`
 */
export type WriteTextFileResponse = {
  /**
   * The _meta property is reserved by ACP to allow clients and agents to attach additional
   * metadata to their interactions. Implementations MUST NOT make assumptions about values at
   * these keys.
   *
   * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
   */
  _meta?: {
    [key: string]: unknown;
  } | null;
};
````

## File: src/schema/zod.gen.ts
````typescript
// This file is auto-generated by @hey-api/openapi-ts

import { z } from "zod/v4";

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Authentication capabilities supported by the client.
 *
 * Advertised during initialization to inform the agent which authentication
 * method types the client can handle. This governs opt-in types that require
 * additional client-side support.
 *
 * @experimental
 */
export const zAuthCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  terminal: z.boolean().optional().default(false),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Describes a single environment variable for an [`AuthMethodEnvVar`] authentication method.
 *
 * @experimental
 */
export const zAuthEnvVar = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  label: z.string().nullish(),
  name: z.string(),
  optional: z.boolean().optional().default(false),
  secret: z.boolean().optional().default(true),
});

/**
 * Agent handles authentication itself.
 *
 * This is the default authentication method type.
 */
export const zAuthMethodAgent = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  description: z.string().nullish(),
  id: z.string(),
  name: z.string(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Environment variable authentication method.
 *
 * The user provides credentials that the client passes to the agent as environment variables.
 *
 * @experimental
 */
export const zAuthMethodEnvVar = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  description: z.string().nullish(),
  id: z.string(),
  link: z.string().nullish(),
  name: z.string(),
  vars: z.array(zAuthEnvVar),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Terminal-based authentication method.
 *
 * The client runs an interactive terminal for the user to authenticate via a TUI.
 *
 * @experimental
 */
export const zAuthMethodTerminal = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  args: z.array(z.string()).optional(),
  description: z.string().nullish(),
  env: z.record(z.string(), z.string()).optional(),
  id: z.string(),
  name: z.string(),
});

/**
 * Describes an available authentication method.
 *
 * The `type` field acts as the discriminator in the serialized JSON form.
 * When no `type` is present, the method is treated as `agent`.
 */
export const zAuthMethod = z.union([
  zAuthMethodEnvVar.and(
    z.object({
      type: z.literal("env_var"),
    }),
  ),
  zAuthMethodTerminal.and(
    z.object({
      type: z.literal("terminal"),
    }),
  ),
  zAuthMethodAgent,
]);

/**
 * Request parameters for the authenticate method.
 *
 * Specifies which authentication method to use.
 */
export const zAuthenticateRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  methodId: z.string(),
});

/**
 * Response to the `authenticate` method.
 */
export const zAuthenticateResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Binary resource contents.
 */
export const zBlobResourceContents = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  blob: z.string(),
  mimeType: z.string().nullish(),
  uri: z.string(),
});

/**
 * Schema for boolean properties in an elicitation form.
 */
export const zBooleanPropertySchema = z.object({
  default: z.boolean().nullish(),
  description: z.string().nullish(),
  title: z.string().nullish(),
});

/**
 * Response from closing an NES session.
 */
export const zCloseNesResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Response from closing a session.
 */
export const zCloseSessionResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Cost information for a session.
 *
 * @experimental
 */
export const zCost = z.object({
  amount: z.number(),
  currency: z.string(),
});

/**
 * Response containing the ID of the created terminal.
 */
export const zCreateTerminalResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  terminalId: z.string(),
});

/**
 * A diff representing file modifications.
 *
 * Shows changes to files in a format suitable for display in the client UI.
 *
 * See protocol docs: [Content](https://agentclientprotocol.com/protocol/tool-calls#content)
 */
export const zDiff = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  newText: z.string(),
  oldText: z.string().nullish(),
  path: z.string(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for `providers/disable`.
 *
 * @experimental
 */
export const zDisableProvidersRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  id: z.string(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `providers/disable`.
 *
 * @experimental
 */
export const zDisableProvidersResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

export const zElicitationContentValue = z.union([
  z.string(),
  z.number(),
  z.number(),
  z.boolean(),
  z.array(z.string()),
]);

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * The user accepted the elicitation and provided content.
 *
 * @experimental
 */
export const zElicitationAcceptAction = z.object({
  content: z.record(z.string(), zElicitationContentValue).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response from the client to an elicitation request.
 *
 * @experimental
 */
export const zCreateElicitationResponse = z.intersection(
  z.union([
    zElicitationAcceptAction.and(
      z.object({
        action: z.literal("accept"),
      }),
    ),
    z.object({
      action: z.literal("decline"),
    }),
    z.object({
      action: z.literal("cancel"),
    }),
  ]),
  z.object({
    _meta: z.record(z.string(), z.unknown()).nullish(),
  }),
);

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Form-based elicitation capabilities.
 *
 * @experimental
 */
export const zElicitationFormCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Unique identifier for an elicitation.
 *
 * @experimental
 */
export const zElicitationId = z.string();

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Notification sent by the agent when a URL-based elicitation is complete.
 *
 * @experimental
 */
export const zCompleteElicitationNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  elicitationId: zElicitationId,
});

/**
 * Object schema type.
 */
export const zElicitationSchemaType = z.literal("object");

/**
 * String schema type.
 */
export const zElicitationStringType = z.literal("string");

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * URL-based elicitation capabilities.
 *
 * @experimental
 */
export const zElicitationUrlCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Elicitation capabilities supported by the client.
 *
 * @experimental
 */
export const zElicitationCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  form: zElicitationFormCapabilities.nullish(),
  url: zElicitationUrlCapabilities.nullish(),
});

/**
 * A titled enum option with a const value and human-readable title.
 */
export const zEnumOption = z.object({
  const: z.string(),
  title: z.string(),
});

/**
 * An environment variable to set when launching an MCP server.
 */
export const zEnvVariable = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  name: z.string(),
  value: z.string(),
});

/**
 * Predefined error codes for common JSON-RPC and ACP-specific errors.
 *
 * These codes follow the JSON-RPC 2.0 specification for standard errors
 * and use the reserved range (-32000 to -32099) for protocol-specific errors.
 */
export const zErrorCode = z.union([
  z.literal(-32700),
  z.literal(-32600),
  z.literal(-32601),
  z.literal(-32602),
  z.literal(-32603),
  z.literal(-32800),
  z.literal(-32000),
  z.literal(-32002),
  z.literal(-32042),
  z
    .number()
    .int()
    .min(-2147483648, {
      message: "Invalid value: Expected int32 to be >= -2147483648",
    })
    .max(2147483647, {
      message: "Invalid value: Expected int32 to be <= 2147483647",
    }),
]);

/**
 * JSON-RPC error object.
 *
 * Represents an error that occurred during method execution, following the
 * JSON-RPC 2.0 error object specification with optional additional data.
 *
 * See protocol docs: [JSON-RPC Error Object](https://www.jsonrpc.org/specification#error_object)
 */
export const zError = z.object({
  code: zErrorCode,
  data: z.unknown().optional(),
  message: z.string(),
});

/**
 * Allows the Agent to send an arbitrary notification that is not part of the ACP spec.
 * Extension notifications provide a way to send one-way messages for custom functionality
 * while maintaining protocol compatibility.
 *
 * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
 */
export const zExtNotification = z.unknown();

/**
 * Allows for sending an arbitrary request that is not part of the ACP spec.
 * Extension methods provide a way to add custom functionality while maintaining
 * protocol compatibility.
 *
 * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
 */
export const zExtRequest = z.unknown();

/**
 * Allows for sending an arbitrary response to an [`ExtRequest`] that is not part of the ACP spec.
 * Extension methods provide a way to add custom functionality while maintaining
 * protocol compatibility.
 *
 * See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
 */
export const zExtResponse = z.unknown();

/**
 * File system capabilities that a client may support.
 *
 * See protocol docs: [FileSystem](https://agentclientprotocol.com/protocol/initialization#filesystem)
 */
export const zFileSystemCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  readTextFile: z.boolean().optional().default(false),
  writeTextFile: z.boolean().optional().default(false),
});

/**
 * An HTTP header to set when making requests to the MCP server.
 */
export const zHttpHeader = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  name: z.string(),
  value: z.string(),
});

/**
 * Metadata about the implementation of the client or agent.
 * Describes the name and version of an MCP implementation, with an optional
 * title for UI representation.
 */
export const zImplementation = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  name: z.string(),
  title: z.string().nullish(),
  version: z.string(),
});

/**
 * Schema for integer properties in an elicitation form.
 */
export const zIntegerPropertySchema = z.object({
  default: z.number().nullish(),
  description: z.string().nullish(),
  maximum: z.number().nullish(),
  minimum: z.number().nullish(),
  title: z.string().nullish(),
});

/**
 * Response to `terminal/kill` method
 */
export const zKillTerminalResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for `providers/list`.
 *
 * @experimental
 */
export const zListProvidersRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Request parameters for listing existing sessions.
 *
 * Only available if the Agent supports the `sessionCapabilities.list` capability.
 */
export const zListSessionsRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  additionalDirectories: z.array(z.string()).optional(),
  cursor: z.string().nullish(),
  cwd: z.string().nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Well-known API protocol identifiers for LLM providers.
 *
 * Agents and clients MUST handle unknown protocol identifiers gracefully.
 *
 * Protocol names beginning with `_` are free for custom use, like other ACP extension methods.
 * Protocol names that do not begin with `_` are reserved for the ACP spec.
 *
 * @experimental
 */
export const zLlmProtocol = z.union([
  z.literal("anthropic"),
  z.literal("openai"),
  z.literal("azure"),
  z.literal("vertex"),
  z.literal("bedrock"),
  z.string(),
]);

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Logout capabilities supported by the agent.
 *
 * By supplying `{}` it means that the agent supports the logout method.
 *
 * @experimental
 */
export const zLogoutCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Authentication-related capabilities supported by the agent.
 *
 * @experimental
 */
export const zAgentAuthCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  logout: zLogoutCapabilities.nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for the logout method.
 *
 * Terminates the current authenticated session.
 *
 * @experimental
 */
export const zLogoutRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to the `logout` method.
 *
 * @experimental
 */
export const zLogoutResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * MCP capabilities supported by the agent
 */
export const zMcpCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  http: z.boolean().optional().default(false),
  sse: z.boolean().optional().default(false),
});

/**
 * HTTP transport configuration for MCP.
 */
export const zMcpServerHttp = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  headers: z.array(zHttpHeader),
  name: z.string(),
  url: z.string(),
});

/**
 * SSE transport configuration for MCP.
 */
export const zMcpServerSse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  headers: z.array(zHttpHeader),
  name: z.string(),
  url: z.string(),
});

/**
 * Stdio transport configuration for MCP.
 */
export const zMcpServerStdio = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  args: z.array(z.string()),
  command: z.string(),
  env: z.array(zEnvVariable),
  name: z.string(),
});

/**
 * Configuration for connecting to an MCP (Model Context Protocol) server.
 *
 * MCP servers provide tools and context that the agent can use when
 * processing prompts.
 *
 * See protocol docs: [MCP Servers](https://agentclientprotocol.com/protocol/session-setup#mcp-servers)
 */
export const zMcpServer = z.union([
  zMcpServerHttp.and(
    z.object({
      type: z.literal("http"),
    }),
  ),
  zMcpServerSse.and(
    z.object({
      type: z.literal("sse"),
    }),
  ),
  zMcpServerStdio,
]);

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * A unique identifier for a model.
 *
 * @experimental
 */
export const zModelId = z.string();

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Information about a selectable model.
 *
 * @experimental
 */
export const zModelInfo = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  description: z.string().nullish(),
  modelId: zModelId,
  name: z.string(),
});

/**
 * Severity of a diagnostic.
 */
export const zNesDiagnosticSeverity = z.union([
  z.literal("error"),
  z.literal("warning"),
  z.literal("information"),
  z.literal("hint"),
]);

/**
 * Capabilities for diagnostics context.
 */
export const zNesDiagnosticsCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Marker for `document/didClose` capability support.
 */
export const zNesDocumentDidCloseCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Marker for `document/didFocus` capability support.
 */
export const zNesDocumentDidFocusCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Marker for `document/didOpen` capability support.
 */
export const zNesDocumentDidOpenCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Marker for `document/didSave` capability support.
 */
export const zNesDocumentDidSaveCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Capabilities for edit history context.
 */
export const zNesEditHistoryCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  maxCount: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
});

/**
 * An entry in the edit history.
 */
export const zNesEditHistoryEntry = z.object({
  diff: z.string(),
  uri: z.string(),
});

/**
 * A code excerpt from a file.
 */
export const zNesExcerpt = z.object({
  endLine: z.number().int().gte(0).max(4294967295, {
    message: "Invalid value: Expected uint32 to be <= 4294967295",
  }),
  startLine: z.number().int().gte(0).max(4294967295, {
    message: "Invalid value: Expected uint32 to be <= 4294967295",
  }),
  text: z.string(),
});

/**
 * Marker for jump suggestion support.
 */
export const zNesJumpCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Capabilities for open files context.
 */
export const zNesOpenFilesCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * A recently accessed file.
 */
export const zNesRecentFile = z.object({
  languageId: z.string(),
  text: z.string(),
  uri: z.string(),
});

/**
 * Capabilities for recent files context.
 */
export const zNesRecentFilesCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  maxCount: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
});

/**
 * The reason a suggestion was rejected.
 */
export const zNesRejectReason = z.union([
  z.literal("rejected"),
  z.literal("ignored"),
  z.literal("replaced"),
  z.literal("cancelled"),
]);

/**
 * A related code snippet from a file.
 */
export const zNesRelatedSnippet = z.object({
  excerpts: z.array(zNesExcerpt),
  uri: z.string(),
});

/**
 * Capabilities for related snippets context.
 */
export const zNesRelatedSnippetsCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Marker for rename suggestion support.
 */
export const zNesRenameCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Repository metadata for an NES session.
 */
export const zNesRepository = z.object({
  name: z.string(),
  owner: z.string(),
  remoteUrl: z.string(),
});

/**
 * Marker for search and replace suggestion support.
 */
export const zNesSearchAndReplaceCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * NES capabilities advertised by the client during initialization.
 */
export const zClientNesCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  jump: zNesJumpCapabilities.nullish(),
  rename: zNesRenameCapabilities.nullish(),
  searchAndReplace: zNesSearchAndReplaceCapabilities.nullish(),
});

/**
 * A search-and-replace suggestion.
 */
export const zNesSearchAndReplaceSuggestion = z.object({
  id: z.string(),
  isRegex: z.boolean().nullish(),
  replace: z.string(),
  search: z.string(),
  uri: z.string(),
});

/**
 * What triggered the suggestion request.
 */
export const zNesTriggerKind = z.union([
  z.literal("automatic"),
  z.literal("diagnostic"),
  z.literal("manual"),
]);

/**
 * Capabilities for user actions context.
 */
export const zNesUserActionsCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  maxCount: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
});

/**
 * Context capabilities the agent wants attached to each suggestion request.
 */
export const zNesContextCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  diagnostics: zNesDiagnosticsCapabilities.nullish(),
  editHistory: zNesEditHistoryCapabilities.nullish(),
  openFiles: zNesOpenFilesCapabilities.nullish(),
  recentFiles: zNesRecentFilesCapabilities.nullish(),
  relatedSnippets: zNesRelatedSnippetsCapabilities.nullish(),
  userActions: zNesUserActionsCapabilities.nullish(),
});

/**
 * Request parameters for creating a new session.
 *
 * See protocol docs: [Creating a Session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session)
 */
export const zNewSessionRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  additionalDirectories: z.array(z.string()).optional(),
  cwd: z.string(),
  mcpServers: z.array(zMcpServer),
});

/**
 * Schema for number (floating-point) properties in an elicitation form.
 */
export const zNumberPropertySchema = z.object({
  default: z.number().nullish(),
  description: z.string().nullish(),
  maximum: z.number().nullish(),
  minimum: z.number().nullish(),
  title: z.string().nullish(),
});

/**
 * Unique identifier for a permission option.
 */
export const zPermissionOptionId = z.string();

/**
 * The type of permission option being presented to the user.
 *
 * Helps clients choose appropriate icons and UI treatment.
 */
export const zPermissionOptionKind = z.union([
  z.literal("allow_once"),
  z.literal("allow_always"),
  z.literal("reject_once"),
  z.literal("reject_always"),
]);

/**
 * An option presented to the user when requesting permission.
 */
export const zPermissionOption = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  kind: zPermissionOptionKind,
  name: z.string(),
  optionId: zPermissionOptionId,
});

/**
 * Priority levels for plan entries.
 *
 * Used to indicate the relative importance or urgency of different
 * tasks in the execution plan.
 * See protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)
 */
export const zPlanEntryPriority = z.union([
  z.literal("high"),
  z.literal("medium"),
  z.literal("low"),
]);

/**
 * Status of a plan entry in the execution flow.
 *
 * Tracks the lifecycle of each task from planning through completion.
 * See protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)
 */
export const zPlanEntryStatus = z.union([
  z.literal("pending"),
  z.literal("in_progress"),
  z.literal("completed"),
]);

/**
 * A single entry in the execution plan.
 *
 * Represents a task or goal that the assistant intends to accomplish
 * as part of fulfilling the user's request.
 * See protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)
 */
export const zPlanEntry = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  content: z.string(),
  priority: zPlanEntryPriority,
  status: zPlanEntryStatus,
});

/**
 * An execution plan for accomplishing complex tasks.
 *
 * Plans consist of multiple entries representing individual tasks or goals.
 * Agents report plans to clients to provide visibility into their execution strategy.
 * Plans can evolve during execution as the agent discovers new requirements or completes tasks.
 *
 * See protocol docs: [Agent Plan](https://agentclientprotocol.com/protocol/agent-plan)
 */
export const zPlan = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  entries: z.array(zPlanEntry),
});

/**
 * A zero-based position in a text document.
 *
 * The meaning of `character` depends on the negotiated position encoding.
 */
export const zPosition = z.object({
  character: z.number().int().gte(0).max(4294967295, {
    message: "Invalid value: Expected uint32 to be <= 4294967295",
  }),
  line: z.number().int().gte(0).max(4294967295, {
    message: "Invalid value: Expected uint32 to be <= 4294967295",
  }),
});

/**
 * A jump-to-location suggestion.
 */
export const zNesJumpSuggestion = z.object({
  id: z.string(),
  position: zPosition,
  uri: z.string(),
});

/**
 * A rename symbol suggestion.
 */
export const zNesRenameSuggestion = z.object({
  id: z.string(),
  newName: z.string(),
  position: zPosition,
  uri: z.string(),
});

/**
 * A user action (typing, cursor movement, etc.).
 */
export const zNesUserAction = z.object({
  action: z.string(),
  position: zPosition,
  timestampMs: z.number(),
  uri: z.string(),
});

/**
 * The encoding used for character offsets in positions.
 *
 * Follows the same conventions as LSP 3.17. The default is UTF-16.
 */
export const zPositionEncodingKind = z.union([
  z.literal("utf-16"),
  z.literal("utf-32"),
  z.literal("utf-8"),
]);

/**
 * Capabilities supported by the client.
 *
 * Advertised during initialization to inform the agent about
 * available features and methods.
 *
 * See protocol docs: [Client Capabilities](https://agentclientprotocol.com/protocol/initialization#client-capabilities)
 */
export const zClientCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  auth: zAuthCapabilities.optional().default({ terminal: false }),
  elicitation: zElicitationCapabilities.nullish(),
  fs: zFileSystemCapabilities
    .optional()
    .default({ readTextFile: false, writeTextFile: false }),
  nes: zClientNesCapabilities.nullish(),
  positionEncodings: z.array(zPositionEncodingKind).optional(),
  terminal: z.boolean().optional().default(false),
});

/**
 * Prompt capabilities supported by the agent in `session/prompt` requests.
 *
 * Baseline agent functionality requires support for [`ContentBlock::Text`]
 * and [`ContentBlock::ResourceLink`] in prompt requests.
 *
 * Other variants must be explicitly opted in to.
 * Capabilities for different types of content in prompt requests.
 *
 * Indicates which content types beyond the baseline (text and resource links)
 * the agent can process.
 *
 * See protocol docs: [Prompt Capabilities](https://agentclientprotocol.com/protocol/initialization#prompt-capabilities)
 */
export const zPromptCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  audio: z.boolean().optional().default(false),
  embeddedContext: z.boolean().optional().default(false),
  image: z.boolean().optional().default(false),
});

/**
 * Protocol version identifier.
 *
 * This version is only bumped for breaking changes.
 * Non-breaking changes should be introduced via capabilities.
 */
export const zProtocolVersion = z.number().int().gte(0).lte(65535);

/**
 * Request parameters for the initialize method.
 *
 * Sent by the client to establish connection and negotiate capabilities.
 *
 * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
 */
export const zInitializeRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  clientCapabilities: zClientCapabilities.optional().default({
    auth: { terminal: false },
    fs: { readTextFile: false, writeTextFile: false },
    terminal: false,
  }),
  clientInfo: zImplementation.nullish(),
  protocolVersion: zProtocolVersion,
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Current effective non-secret routing configuration for a provider.
 *
 * @experimental
 */
export const zProviderCurrentConfig = z.object({
  apiType: zLlmProtocol,
  baseUrl: z.string(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Information about a configurable LLM provider.
 *
 * @experimental
 */
export const zProviderInfo = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  current: zProviderCurrentConfig.nullish(),
  id: z.string(),
  required: z.boolean(),
  supported: z.array(zLlmProtocol),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `providers/list`.
 *
 * @experimental
 */
export const zListProvidersResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  providers: z.array(zProviderInfo),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Provider configuration capabilities supported by the agent.
 *
 * By supplying `{}` it means that the agent supports provider configuration methods.
 *
 * @experimental
 */
export const zProvidersCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * A range in a text document, expressed as start and end positions.
 */
export const zRange = z.object({
  end: zPosition,
  start: zPosition,
});

/**
 * A diagnostic (error, warning, etc.).
 */
export const zNesDiagnostic = z.object({
  message: z.string(),
  range: zRange,
  severity: zNesDiagnosticSeverity,
  uri: z.string(),
});

/**
 * An open file in the editor.
 */
export const zNesOpenFile = z.object({
  languageId: z.string(),
  lastFocusedMs: z.number().nullish(),
  uri: z.string(),
  visibleRange: zRange.nullish(),
});

/**
 * Context attached to a suggestion request.
 */
export const zNesSuggestContext = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  diagnostics: z.array(zNesDiagnostic).nullish(),
  editHistory: z.array(zNesEditHistoryEntry).nullish(),
  openFiles: z.array(zNesOpenFile).nullish(),
  recentFiles: z.array(zNesRecentFile).nullish(),
  relatedSnippets: z.array(zNesRelatedSnippet).nullish(),
  userActions: z.array(zNesUserAction).nullish(),
});

/**
 * A text edit within a suggestion.
 */
export const zNesTextEdit = z.object({
  newText: z.string(),
  range: zRange,
});

/**
 * A text edit suggestion.
 */
export const zNesEditSuggestion = z.object({
  cursorPosition: zPosition.nullish(),
  edits: z.array(zNesTextEdit),
  id: z.string(),
  uri: z.string(),
});

/**
 * A suggestion returned by the agent.
 */
export const zNesSuggestion = z.union([
  zNesEditSuggestion.and(
    z.object({
      kind: z.literal("edit"),
    }),
  ),
  zNesJumpSuggestion.and(
    z.object({
      kind: z.literal("jump"),
    }),
  ),
  zNesRenameSuggestion.and(
    z.object({
      kind: z.literal("rename"),
    }),
  ),
  zNesSearchAndReplaceSuggestion.and(
    z.object({
      kind: z.literal("searchAndReplace"),
    }),
  ),
]);

/**
 * Response containing the contents of a text file.
 */
export const zReadTextFileResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  content: z.string(),
});

/**
 * Response to terminal/release method
 */
export const zReleaseTerminalResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * JSON RPC Request Id
 *
 * An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
 *
 * The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
 *
 * [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
 *
 * [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
 */
export const zRequestId = z.union([z.number(), z.string()]).nullable();

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Notification to cancel an ongoing request.
 *
 * See protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/cancellation)
 *
 * @experimental
 */
export const zCancelRequestNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  requestId: zRequestId,
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request-scoped elicitation, tied to a specific JSON-RPC request outside of a session
 * (e.g., during auth/configuration phases before any session is started).
 *
 * @experimental
 */
export const zElicitationRequestScope = z.object({
  requestId: zRequestId,
});

/**
 * The sender or recipient of messages and data in a conversation.
 */
export const zRole = z.enum(["assistant", "user"]);

/**
 * Optional annotations for the client. The client can use annotations to inform how objects are used or displayed
 */
export const zAnnotations = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  audience: z.array(zRole).nullish(),
  lastModified: z.string().nullish(),
  priority: z.number().nullish(),
});

/**
 * Audio provided to or from an LLM.
 */
export const zAudioContent = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  annotations: zAnnotations.nullish(),
  data: z.string(),
  mimeType: z.string(),
});

/**
 * An image provided to or from an LLM.
 */
export const zImageContent = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  annotations: zAnnotations.nullish(),
  data: z.string(),
  mimeType: z.string(),
  uri: z.string().nullish(),
});

/**
 * A resource that the server is capable of reading, included in a prompt or tool call result.
 */
export const zResourceLink = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  annotations: zAnnotations.nullish(),
  description: z.string().nullish(),
  mimeType: z.string().nullish(),
  name: z.string(),
  size: z.number().nullish(),
  title: z.string().nullish(),
  uri: z.string(),
});

/**
 * The user selected one of the provided options.
 */
export const zSelectedPermissionOutcome = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  optionId: zPermissionOptionId,
});

/**
 * The outcome of a permission request.
 */
export const zRequestPermissionOutcome = z.union([
  z.object({
    outcome: z.literal("cancelled"),
  }),
  zSelectedPermissionOutcome.and(
    z.object({
      outcome: z.literal("selected"),
    }),
  ),
]);

/**
 * Response to a permission request.
 */
export const zRequestPermissionResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  outcome: zRequestPermissionOutcome,
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Capabilities for additional session directories support.
 *
 * By supplying `{}` it means that the agent supports the `additionalDirectories` field on
 * supported session lifecycle requests and `session/list`.
 *
 * @experimental
 */
export const zSessionAdditionalDirectoriesCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Capabilities for the `session/close` method.
 *
 * By supplying `{}` it means that the agent supports closing of sessions.
 */
export const zSessionCloseCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * A boolean on/off toggle session configuration option payload.
 *
 * @experimental
 */
export const zSessionConfigBoolean = z.object({
  currentValue: z.boolean(),
});

/**
 * Unique identifier for a session configuration option value group.
 */
export const zSessionConfigGroupId = z.string();

/**
 * Unique identifier for a session configuration option.
 */
export const zSessionConfigId = z.string();

/**
 * Semantic category for a session configuration option.
 *
 * This is intended to help Clients distinguish broadly common selectors (e.g. model selector vs
 * session mode selector vs thought/reasoning level) for UX purposes (keyboard shortcuts, icons,
 * placement). It MUST NOT be required for correctness. Clients MUST handle missing or unknown
 * categories gracefully.
 *
 * Category names beginning with `_` are free for custom use, like other ACP extension methods.
 * Category names that do not begin with `_` are reserved for the ACP spec.
 */
export const zSessionConfigOptionCategory = z.union([
  z.literal("mode"),
  z.literal("model"),
  z.literal("thought_level"),
  z.string(),
]);

/**
 * Unique identifier for a session configuration option value.
 */
export const zSessionConfigValueId = z.string();

/**
 * A possible value for a session configuration option.
 */
export const zSessionConfigSelectOption = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  description: z.string().nullish(),
  name: z.string(),
  value: zSessionConfigValueId,
});

/**
 * A group of possible values for a session configuration option.
 */
export const zSessionConfigSelectGroup = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  group: zSessionConfigGroupId,
  name: z.string(),
  options: z.array(zSessionConfigSelectOption),
});

/**
 * Possible values for a session configuration option.
 */
export const zSessionConfigSelectOptions = z.union([
  z.array(zSessionConfigSelectOption),
  z.array(zSessionConfigSelectGroup),
]);

/**
 * A single-value selector (dropdown) session configuration option payload.
 */
export const zSessionConfigSelect = z.object({
  currentValue: zSessionConfigValueId,
  options: zSessionConfigSelectOptions,
});

/**
 * A session configuration option selector and its current state.
 */
export const zSessionConfigOption = z.intersection(
  z.union([
    zSessionConfigSelect.and(
      z.object({
        type: z.literal("select"),
      }),
    ),
    zSessionConfigBoolean.and(
      z.object({
        type: z.literal("boolean"),
      }),
    ),
  ]),
  z.object({
    _meta: z.record(z.string(), z.unknown()).nullish(),
    category: zSessionConfigOptionCategory.nullish(),
    description: z.string().nullish(),
    id: zSessionConfigId,
    name: z.string(),
  }),
);

/**
 * Session configuration options have been updated.
 */
export const zConfigOptionUpdate = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  configOptions: z.array(zSessionConfigOption),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Capabilities for the `session/fork` method.
 *
 * By supplying `{}` it means that the agent supports forking of sessions.
 *
 * @experimental
 */
export const zSessionForkCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * A unique identifier for a conversation session between a client and agent.
 *
 * Sessions maintain their own context, conversation history, and state,
 * allowing multiple independent interactions with the same agent.
 *
 * See protocol docs: [Session ID](https://agentclientprotocol.com/protocol/session-setup#session-id)
 */
export const zSessionId = z.string();

/**
 * Notification sent when a suggestion is accepted.
 */
export const zAcceptNesNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  id: z.string(),
  sessionId: zSessionId,
});

/**
 * Notification to cancel ongoing operations for a session.
 *
 * See protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)
 */
export const zCancelNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
});

/**
 * Request to close an NES session.
 *
 * The agent **must** cancel any ongoing work related to the NES session
 * and then free up any resources associated with the session.
 */
export const zCloseNesRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
});

/**
 * Request parameters for closing an active session.
 *
 * If supported, the agent **must** cancel any ongoing work related to the session
 * (treat it as if `session/cancel` was called) and then free up any resources
 * associated with the session.
 *
 * Only available if the Agent supports the `sessionCapabilities.close` capability.
 */
export const zCloseSessionRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
});

/**
 * Request to create a new terminal and execute a command.
 */
export const zCreateTerminalRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  args: z.array(z.string()).optional(),
  command: z.string(),
  cwd: z.string().nullish(),
  env: z.array(zEnvVariable).optional(),
  outputByteLimit: z.number().nullish(),
  sessionId: zSessionId,
});

/**
 * Notification sent when a file is closed.
 */
export const zDidCloseDocumentNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
  uri: z.string(),
});

/**
 * Notification sent when a file becomes the active editor tab.
 */
export const zDidFocusDocumentNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  position: zPosition,
  sessionId: zSessionId,
  uri: z.string(),
  version: z.number(),
  visibleRange: zRange,
});

/**
 * Notification sent when a file is opened in the editor.
 */
export const zDidOpenDocumentNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  languageId: z.string(),
  sessionId: zSessionId,
  text: z.string(),
  uri: z.string(),
  version: z.number(),
});

/**
 * Notification sent when a file is saved.
 */
export const zDidSaveDocumentNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
  uri: z.string(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for forking an existing session.
 *
 * Creates a new session based on the context of an existing one, allowing
 * operations like generating summaries without affecting the original session's history.
 *
 * Only available if the Agent supports the `session.fork` capability.
 *
 * @experimental
 */
export const zForkSessionRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  additionalDirectories: z.array(z.string()).optional(),
  cwd: z.string(),
  mcpServers: z.array(zMcpServer).optional(),
  sessionId: zSessionId,
});

/**
 * Request to kill a terminal without releasing it.
 */
export const zKillTerminalRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
  terminalId: z.string(),
});

/**
 * Request parameters for loading an existing session.
 *
 * Only available if the Agent supports the `loadSession` capability.
 *
 * See protocol docs: [Loading Sessions](https://agentclientprotocol.com/protocol/session-setup#loading-sessions)
 */
export const zLoadSessionRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  additionalDirectories: z.array(z.string()).optional(),
  cwd: z.string(),
  mcpServers: z.array(zMcpServer),
  sessionId: zSessionId,
});

/**
 * Request to read content from a text file.
 *
 * Only available if the client supports the `fs.readTextFile` capability.
 */
export const zReadTextFileRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  limit: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
  line: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
  path: z.string(),
  sessionId: zSessionId,
});

/**
 * Notification sent when a suggestion is rejected.
 */
export const zRejectNesNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  id: z.string(),
  reason: zNesRejectReason.nullish(),
  sessionId: zSessionId,
});

/**
 * Request to release a terminal and free its resources.
 */
export const zReleaseTerminalRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
  terminalId: z.string(),
});

/**
 * Request parameters for resuming an existing session.
 *
 * Resumes an existing session without returning previous messages (unlike `session/load`).
 * This is useful for agents that can resume sessions but don't implement full session loading.
 *
 * Only available if the Agent supports the `sessionCapabilities.resume` capability.
 */
export const zResumeSessionRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  additionalDirectories: z.array(z.string()).optional(),
  cwd: z.string(),
  mcpServers: z.array(zMcpServer).optional(),
  sessionId: zSessionId,
});

/**
 * Information about a session returned by session/list
 */
export const zSessionInfo = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  additionalDirectories: z.array(z.string()).optional(),
  cwd: z.string(),
  sessionId: zSessionId,
  title: z.string().nullish(),
  updatedAt: z.string().nullish(),
});

/**
 * Response from listing sessions.
 */
export const zListSessionsResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  nextCursor: z.string().nullish(),
  sessions: z.array(zSessionInfo),
});

/**
 * Update to session metadata. All fields are optional to support partial updates.
 *
 * Agents send this notification to update session information like title or custom metadata.
 * This allows clients to display dynamic session names and track session state changes.
 */
export const zSessionInfoUpdate = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  title: z.string().nullish(),
  updatedAt: z.string().nullish(),
});

/**
 * Capabilities for the `session/list` method.
 *
 * By supplying `{}` it means that the agent supports listing of sessions.
 */
export const zSessionListCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Unique identifier for a Session Mode.
 */
export const zSessionModeId = z.string();

/**
 * The current mode of the session has changed
 *
 * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
 */
export const zCurrentModeUpdate = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  currentModeId: zSessionModeId,
});

/**
 * A mode the agent can operate in.
 *
 * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
 */
export const zSessionMode = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  description: z.string().nullish(),
  id: zSessionModeId,
  name: z.string(),
});

/**
 * The set of modes and the one currently active.
 */
export const zSessionModeState = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  availableModes: z.array(zSessionMode),
  currentModeId: zSessionModeId,
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * The set of models and the one currently active.
 *
 * @experimental
 */
export const zSessionModelState = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  availableModels: z.array(zModelInfo),
  currentModelId: zModelId,
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response from forking an existing session.
 *
 * @experimental
 */
export const zForkSessionResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  configOptions: z.array(zSessionConfigOption).nullish(),
  models: zSessionModelState.nullish(),
  modes: zSessionModeState.nullish(),
  sessionId: zSessionId,
});

/**
 * Response from loading an existing session.
 */
export const zLoadSessionResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  configOptions: z.array(zSessionConfigOption).nullish(),
  models: zSessionModelState.nullish(),
  modes: zSessionModeState.nullish(),
});

/**
 * Response from creating a new session.
 *
 * See protocol docs: [Creating a Session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session)
 */
export const zNewSessionResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  configOptions: z.array(zSessionConfigOption).nullish(),
  models: zSessionModelState.nullish(),
  modes: zSessionModeState.nullish(),
  sessionId: zSessionId,
});

/**
 * Response from resuming an existing session.
 */
export const zResumeSessionResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  configOptions: z.array(zSessionConfigOption).nullish(),
  models: zSessionModelState.nullish(),
  modes: zSessionModeState.nullish(),
});

/**
 * Capabilities for the `session/resume` method.
 *
 * By supplying `{}` it means that the agent supports resuming of sessions.
 */
export const zSessionResumeCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Session capabilities supported by the agent.
 *
 * As a baseline, all Agents **MUST** support `session/new`, `session/prompt`, `session/cancel`, and `session/update`.
 *
 * Optionally, they **MAY** support other session methods and notifications by specifying additional capabilities.
 *
 * Note: `session/load` is still handled by the top-level `load_session` capability. This will be unified in future versions of the protocol.
 *
 * See protocol docs: [Session Capabilities](https://agentclientprotocol.com/protocol/initialization#session-capabilities)
 */
export const zSessionCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  additionalDirectories: zSessionAdditionalDirectoriesCapabilities.nullish(),
  close: zSessionCloseCapabilities.nullish(),
  fork: zSessionForkCapabilities.nullish(),
  list: zSessionListCapabilities.nullish(),
  resume: zSessionResumeCapabilities.nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for `providers/set`.
 *
 * Replaces the full configuration for one provider id.
 *
 * @experimental
 */
export const zSetProvidersRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  apiType: zLlmProtocol,
  baseUrl: z.string(),
  headers: z.record(z.string(), z.string()).optional(),
  id: z.string(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `providers/set`.
 *
 * @experimental
 */
export const zSetProvidersResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Request parameters for setting a session configuration option.
 */
export const zSetSessionConfigOptionRequest = z.intersection(
  z.union([
    z.object({
      type: z.literal("boolean"),
      value: z.boolean(),
    }),
    z.object({
      value: zSessionConfigValueId,
    }),
  ]),
  z.object({
    _meta: z.record(z.string(), z.unknown()).nullish(),
    configId: zSessionConfigId,
    sessionId: zSessionId,
  }),
);

/**
 * Response to `session/set_config_option` method.
 */
export const zSetSessionConfigOptionResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  configOptions: z.array(zSessionConfigOption),
});

/**
 * Request parameters for setting a session mode.
 */
export const zSetSessionModeRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  modeId: zSessionModeId,
  sessionId: zSessionId,
});

/**
 * Response to `session/set_mode` method.
 */
export const zSetSessionModeResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request parameters for setting a session model.
 *
 * @experimental
 */
export const zSetSessionModelRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  modelId: zModelId,
  sessionId: zSessionId,
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Response to `session/set_model` method.
 *
 * @experimental
 */
export const zSetSessionModelResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

/**
 * Response to `nes/start`.
 */
export const zStartNesResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
});

/**
 * Reasons why an agent stops processing a prompt turn.
 *
 * See protocol docs: [Stop Reasons](https://agentclientprotocol.com/protocol/prompt-turn#stop-reasons)
 */
export const zStopReason = z.union([
  z.literal("end_turn"),
  z.literal("max_tokens"),
  z.literal("max_turn_requests"),
  z.literal("refusal"),
  z.literal("cancelled"),
]);

/**
 * String format types for string properties in elicitation schemas.
 */
export const zStringFormat = z.union([
  z.literal("email"),
  z.literal("uri"),
  z.literal("date"),
  z.literal("date-time"),
]);

/**
 * Schema for string properties in an elicitation form.
 *
 * When `enum` or `oneOf` is set, this represents a single-select enum
 * with `"type": "string"`.
 */
export const zStringPropertySchema = z.object({
  default: z.string().nullish(),
  description: z.string().nullish(),
  enum: z.array(z.string()).nullish(),
  format: zStringFormat.nullish(),
  maxLength: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
  minLength: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
  oneOf: z.array(zEnumOption).nullish(),
  pattern: z.string().nullish(),
  title: z.string().nullish(),
});

/**
 * Request for a code suggestion.
 */
export const zSuggestNesRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  context: zNesSuggestContext.nullish(),
  position: zPosition,
  selection: zRange.nullish(),
  sessionId: zSessionId,
  triggerKind: zNesTriggerKind,
  uri: z.string(),
  version: z.number(),
});

/**
 * Response to `nes/suggest`.
 */
export const zSuggestNesResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  suggestions: z.array(zNesSuggestion),
});

/**
 * Embed a terminal created with `terminal/create` by its id.
 *
 * The terminal must be added before calling `terminal/release`.
 *
 * See protocol docs: [Terminal](https://agentclientprotocol.com/protocol/terminals)
 */
export const zTerminal = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  terminalId: z.string(),
});

/**
 * Exit status of a terminal command.
 */
export const zTerminalExitStatus = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  exitCode: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
  signal: z.string().nullish(),
});

/**
 * Request to get the current output and status of a terminal.
 */
export const zTerminalOutputRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
  terminalId: z.string(),
});

/**
 * Response containing the terminal output and exit status.
 */
export const zTerminalOutputResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  exitStatus: zTerminalExitStatus.nullish(),
  output: z.string(),
  truncated: z.boolean(),
});

/**
 * Text provided to or from an LLM.
 */
export const zTextContent = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  annotations: zAnnotations.nullish(),
  text: z.string(),
});

/**
 * A content change event for a document.
 *
 * When `range` is `None`, `text` is the full content of the document.
 * When `range` is `Some`, `text` replaces the given range.
 */
export const zTextDocumentContentChangeEvent = z.object({
  range: zRange.nullish(),
  text: z.string(),
});

/**
 * Notification sent when a file is edited.
 */
export const zDidChangeDocumentNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  contentChanges: z.array(zTextDocumentContentChangeEvent),
  sessionId: zSessionId,
  uri: z.string(),
  version: z.number(),
});

export const zClientNotification = z.object({
  method: z.string(),
  params: z
    .union([
      zCancelNotification,
      zDidOpenDocumentNotification,
      zDidChangeDocumentNotification,
      zDidCloseDocumentNotification,
      zDidSaveDocumentNotification,
      zDidFocusDocumentNotification,
      zAcceptNesNotification,
      zRejectNesNotification,
      zExtNotification,
    ])
    .nullish(),
});

/**
 * How the agent wants document changes delivered.
 */
export const zTextDocumentSyncKind = z.union([
  z.literal("full"),
  z.literal("incremental"),
]);

/**
 * Capabilities for `document/didChange` events.
 */
export const zNesDocumentDidChangeCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  syncKind: zTextDocumentSyncKind,
});

/**
 * Document event capabilities the agent wants to receive.
 */
export const zNesDocumentEventCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  didChange: zNesDocumentDidChangeCapabilities.nullish(),
  didClose: zNesDocumentDidCloseCapabilities.nullish(),
  didFocus: zNesDocumentDidFocusCapabilities.nullish(),
  didOpen: zNesDocumentDidOpenCapabilities.nullish(),
  didSave: zNesDocumentDidSaveCapabilities.nullish(),
});

/**
 * Event capabilities the agent can consume.
 */
export const zNesEventCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  document: zNesDocumentEventCapabilities.nullish(),
});

/**
 * NES capabilities advertised by the agent during initialization.
 */
export const zNesCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  context: zNesContextCapabilities.nullish(),
  events: zNesEventCapabilities.nullish(),
});

/**
 * Capabilities supported by the agent.
 *
 * Advertised during initialization to inform the client about
 * available features and content types.
 *
 * See protocol docs: [Agent Capabilities](https://agentclientprotocol.com/protocol/initialization#agent-capabilities)
 */
export const zAgentCapabilities = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  auth: zAgentAuthCapabilities.optional().default({}),
  loadSession: z.boolean().optional().default(false),
  mcpCapabilities: zMcpCapabilities
    .optional()
    .default({ http: false, sse: false }),
  nes: zNesCapabilities.nullish(),
  positionEncoding: zPositionEncodingKind.nullish(),
  promptCapabilities: zPromptCapabilities.optional().default({
    audio: false,
    embeddedContext: false,
    image: false,
  }),
  providers: zProvidersCapabilities.nullish(),
  sessionCapabilities: zSessionCapabilities.optional().default({}),
});

/**
 * Response to the `initialize` method.
 *
 * Contains the negotiated protocol version and agent capabilities.
 *
 * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
 */
export const zInitializeResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  agentCapabilities: zAgentCapabilities.optional().default({
    auth: {},
    loadSession: false,
    mcpCapabilities: { http: false, sse: false },
    promptCapabilities: {
      audio: false,
      embeddedContext: false,
      image: false,
    },
    sessionCapabilities: {},
  }),
  agentInfo: zImplementation.nullish(),
  authMethods: z.array(zAuthMethod).optional().default([]),
  protocolVersion: zProtocolVersion,
});

/**
 * Text-based resource contents.
 */
export const zTextResourceContents = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  mimeType: z.string().nullish(),
  text: z.string(),
  uri: z.string(),
});

/**
 * Resource content that can be embedded in a message.
 */
export const zEmbeddedResourceResource = z.union([
  zTextResourceContents,
  zBlobResourceContents,
]);

/**
 * The contents of a resource, embedded into a prompt or tool call result.
 */
export const zEmbeddedResource = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  annotations: zAnnotations.nullish(),
  resource: zEmbeddedResourceResource,
});

/**
 * Content blocks represent displayable information in the Agent Client Protocol.
 *
 * They provide a structured way to handle various types of user-facing content—whether
 * it's text from language models, images for analysis, or embedded resources for context.
 *
 * Content blocks appear in:
 * - User prompts sent via `session/prompt`
 * - Language model output streamed through `session/update` notifications
 * - Progress updates and results from tool calls
 *
 * This structure is compatible with the Model Context Protocol (MCP), enabling
 * agents to seamlessly forward content from MCP tool outputs without transformation.
 *
 * See protocol docs: [Content](https://agentclientprotocol.com/protocol/content)
 */
export const zContentBlock = z.union([
  zTextContent.and(
    z.object({
      type: z.literal("text"),
    }),
  ),
  zImageContent.and(
    z.object({
      type: z.literal("image"),
    }),
  ),
  zAudioContent.and(
    z.object({
      type: z.literal("audio"),
    }),
  ),
  zResourceLink.and(
    z.object({
      type: z.literal("resource_link"),
    }),
  ),
  zEmbeddedResource.and(
    z.object({
      type: z.literal("resource"),
    }),
  ),
]);

/**
 * Standard content block (text, images, resources).
 */
export const zContent = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  content: zContentBlock,
});

/**
 * A streamed item of content
 */
export const zContentChunk = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  content: zContentBlock,
  messageId: z.string().nullish(),
});

/**
 * Request parameters for sending a user prompt to the agent.
 *
 * Contains the user's message and any additional context.
 *
 * See protocol docs: [User Message](https://agentclientprotocol.com/protocol/prompt-turn#1-user-message)
 */
export const zPromptRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  messageId: z.string().nullish(),
  prompt: z.array(zContentBlock),
  sessionId: zSessionId,
});

/**
 * Items definition for titled multi-select enum properties.
 */
export const zTitledMultiSelectItems = z.object({
  anyOf: z.array(zEnumOption),
});

/**
 * Content produced by a tool call.
 *
 * Tool calls can produce different types of content including
 * standard content blocks (text, images) or file diffs.
 *
 * See protocol docs: [Content](https://agentclientprotocol.com/protocol/tool-calls#content)
 */
export const zToolCallContent = z.union([
  zContent.and(
    z.object({
      type: z.literal("content"),
    }),
  ),
  zDiff.and(
    z.object({
      type: z.literal("diff"),
    }),
  ),
  zTerminal.and(
    z.object({
      type: z.literal("terminal"),
    }),
  ),
]);

/**
 * Unique identifier for a tool call within a session.
 */
export const zToolCallId = z.string();

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Session-scoped elicitation, optionally tied to a specific tool call.
 *
 * When `tool_call_id` is set, the elicitation is tied to a specific tool call.
 * This is useful when an agent receives an elicitation from an MCP server
 * during a tool call and needs to redirect it to the user.
 *
 * @experimental
 */
export const zElicitationSessionScope = z.object({
  sessionId: zSessionId,
  toolCallId: zToolCallId.nullish(),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * URL-based elicitation mode where the client directs the user to a URL.
 *
 * @experimental
 */
export const zElicitationUrlMode = z.intersection(
  z.union([zElicitationSessionScope, zElicitationRequestScope]),
  z.object({
    elicitationId: zElicitationId,
    url: z.string().url(),
  }),
);

/**
 * A file location being accessed or modified by a tool.
 *
 * Enables clients to implement "follow-along" features that track
 * which files the agent is working with in real-time.
 *
 * See protocol docs: [Following the Agent](https://agentclientprotocol.com/protocol/tool-calls#following-the-agent)
 */
export const zToolCallLocation = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  line: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
  path: z.string(),
});

/**
 * Execution status of a tool call.
 *
 * Tool calls progress through different statuses during their lifecycle.
 *
 * See protocol docs: [Status](https://agentclientprotocol.com/protocol/tool-calls#status)
 */
export const zToolCallStatus = z.union([
  z.literal("pending"),
  z.literal("in_progress"),
  z.literal("completed"),
  z.literal("failed"),
]);

/**
 * Categories of tools that can be invoked.
 *
 * Tool kinds help clients choose appropriate icons and optimize how they
 * display tool execution progress.
 *
 * See protocol docs: [Creating](https://agentclientprotocol.com/protocol/tool-calls#creating)
 */
export const zToolKind = z.union([
  z.literal("read"),
  z.literal("edit"),
  z.literal("delete"),
  z.literal("move"),
  z.literal("search"),
  z.literal("execute"),
  z.literal("think"),
  z.literal("fetch"),
  z.literal("switch_mode"),
  z.literal("other"),
]);

/**
 * Represents a tool call that the language model has requested.
 *
 * Tool calls are actions that the agent executes on behalf of the language model,
 * such as reading files, executing code, or fetching data from external sources.
 *
 * See protocol docs: [Tool Calls](https://agentclientprotocol.com/protocol/tool-calls)
 */
export const zToolCall = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  content: z.array(zToolCallContent).optional(),
  kind: zToolKind.optional(),
  locations: z.array(zToolCallLocation).optional(),
  rawInput: z.unknown().optional(),
  rawOutput: z.unknown().optional(),
  status: zToolCallStatus.optional(),
  title: z.string(),
  toolCallId: zToolCallId,
});

/**
 * An update to an existing tool call.
 *
 * Used to report progress and results as tools execute. All fields except
 * the tool call ID are optional - only changed fields need to be included.
 *
 * See protocol docs: [Updating](https://agentclientprotocol.com/protocol/tool-calls#updating)
 */
export const zToolCallUpdate = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  content: z.array(zToolCallContent).nullish(),
  kind: zToolKind.nullish(),
  locations: z.array(zToolCallLocation).nullish(),
  rawInput: z.unknown().optional(),
  rawOutput: z.unknown().optional(),
  status: zToolCallStatus.nullish(),
  title: z.string().nullish(),
  toolCallId: zToolCallId,
});

/**
 * Request for user permission to execute a tool call.
 *
 * Sent when the agent needs authorization before performing a sensitive operation.
 *
 * See protocol docs: [Requesting Permission](https://agentclientprotocol.com/protocol/tool-calls#requesting-permission)
 */
export const zRequestPermissionRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  options: z.array(zPermissionOption),
  sessionId: zSessionId,
  toolCall: zToolCallUpdate,
});

/**
 * All text that was typed after the command name is provided as input.
 */
export const zUnstructuredCommandInput = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  hint: z.string(),
});

/**
 * unstructured
 *
 * All text that was typed after the command name is provided as input.
 */
export const zAvailableCommandInput = zUnstructuredCommandInput;

/**
 * Information about a command.
 */
export const zAvailableCommand = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  description: z.string(),
  input: zAvailableCommandInput.nullish(),
  name: z.string(),
});

/**
 * Available commands are ready or have changed
 */
export const zAvailableCommandsUpdate = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  availableCommands: z.array(zAvailableCommand),
});

/**
 * Items definition for untitled multi-select enum properties.
 */
export const zUntitledMultiSelectItems = z.object({
  enum: z.array(z.string()),
  type: zElicitationStringType,
});

/**
 * Items for a multi-select (array) property schema.
 */
export const zMultiSelectItems = z.union([
  zUntitledMultiSelectItems,
  zTitledMultiSelectItems,
]);

/**
 * Schema for multi-select (array) properties in an elicitation form.
 */
export const zMultiSelectPropertySchema = z.object({
  default: z.array(z.string()).nullish(),
  description: z.string().nullish(),
  items: zMultiSelectItems,
  maxItems: z.number().nullish(),
  minItems: z.number().nullish(),
  title: z.string().nullish(),
});

/**
 * Property schema for elicitation form fields.
 *
 * Each variant corresponds to a JSON Schema `"type"` value.
 * Single-select enums use the `String` variant with `enum` or `oneOf` set.
 * Multi-select enums use the `Array` variant.
 */
export const zElicitationPropertySchema = z.union([
  zStringPropertySchema.and(
    z.object({
      type: z.literal("string"),
    }),
  ),
  zNumberPropertySchema.and(
    z.object({
      type: z.literal("number"),
    }),
  ),
  zIntegerPropertySchema.and(
    z.object({
      type: z.literal("integer"),
    }),
  ),
  zBooleanPropertySchema.and(
    z.object({
      type: z.literal("boolean"),
    }),
  ),
  zMultiSelectPropertySchema.and(
    z.object({
      type: z.literal("array"),
    }),
  ),
]);

/**
 * Type-safe elicitation schema for requesting structured user input.
 *
 * This represents a JSON Schema object with primitive-typed properties,
 * as required by the elicitation specification.
 */
export const zElicitationSchema = z.object({
  description: z.string().nullish(),
  properties: z
    .record(z.string(), zElicitationPropertySchema)
    .optional()
    .default({}),
  required: z.array(z.string()).nullish(),
  title: z.string().nullish(),
  type: zElicitationSchemaType.optional().default("object"),
});

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Form-based elicitation mode where the client renders a form from the provided schema.
 *
 * @experimental
 */
export const zElicitationFormMode = z.intersection(
  z.union([zElicitationSessionScope, zElicitationRequestScope]),
  z.object({
    requestedSchema: zElicitationSchema,
  }),
);

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Request from the agent to elicit structured user input.
 *
 * The agent sends this to the client to request information from the user,
 * either via a form or by directing them to a URL.
 * Elicitations are tied to a session (optionally a tool call) or a request.
 *
 * @experimental
 */
export const zCreateElicitationRequest = z.intersection(
  z.union([
    zElicitationFormMode.and(
      z.object({
        mode: z.literal("form"),
      }),
    ),
    zElicitationUrlMode.and(
      z.object({
        mode: z.literal("url"),
      }),
    ),
  ]),
  z.object({
    _meta: z.record(z.string(), z.unknown()).nullish(),
    message: z.string(),
  }),
);

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Token usage information for a prompt turn.
 *
 * @experimental
 */
export const zUsage = z.object({
  cachedReadTokens: z.number().nullish(),
  cachedWriteTokens: z.number().nullish(),
  inputTokens: z.number(),
  outputTokens: z.number(),
  thoughtTokens: z.number().nullish(),
  totalTokens: z.number(),
});

/**
 * Response from processing a user prompt.
 *
 * See protocol docs: [Check for Completion](https://agentclientprotocol.com/protocol/prompt-turn#4-check-for-completion)
 */
export const zPromptResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  stopReason: zStopReason,
  usage: zUsage.nullish(),
  userMessageId: z.string().nullish(),
});

export const zAgentResponse = z.union([
  z.object({
    id: zRequestId,
    result: z.union([
      zInitializeResponse,
      zAuthenticateResponse,
      zListProvidersResponse,
      zSetProvidersResponse,
      zDisableProvidersResponse,
      zLogoutResponse,
      zNewSessionResponse,
      zLoadSessionResponse,
      zListSessionsResponse,
      zForkSessionResponse,
      zResumeSessionResponse,
      zCloseSessionResponse,
      zSetSessionModeResponse,
      zSetSessionConfigOptionResponse,
      zPromptResponse,
      zSetSessionModelResponse,
      zStartNesResponse,
      zSuggestNesResponse,
      zCloseNesResponse,
      zExtResponse,
    ]),
  }),
  z.object({
    error: zError,
    id: zRequestId,
  }),
]);

/**
 * **UNSTABLE**
 *
 * This capability is not part of the spec yet, and may be removed or changed at any point.
 *
 * Context window and cost update for a session.
 *
 * @experimental
 */
export const zUsageUpdate = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  cost: zCost.nullish(),
  size: z.number(),
  used: z.number(),
});

/**
 * Different types of updates that can be sent during session processing.
 *
 * These updates provide real-time feedback about the agent's progress.
 *
 * See protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)
 */
export const zSessionUpdate = z.union([
  zContentChunk.and(
    z.object({
      sessionUpdate: z.literal("user_message_chunk"),
    }),
  ),
  zContentChunk.and(
    z.object({
      sessionUpdate: z.literal("agent_message_chunk"),
    }),
  ),
  zContentChunk.and(
    z.object({
      sessionUpdate: z.literal("agent_thought_chunk"),
    }),
  ),
  zToolCall.and(
    z.object({
      sessionUpdate: z.literal("tool_call"),
    }),
  ),
  zToolCallUpdate.and(
    z.object({
      sessionUpdate: z.literal("tool_call_update"),
    }),
  ),
  zPlan.and(
    z.object({
      sessionUpdate: z.literal("plan"),
    }),
  ),
  zAvailableCommandsUpdate.and(
    z.object({
      sessionUpdate: z.literal("available_commands_update"),
    }),
  ),
  zCurrentModeUpdate.and(
    z.object({
      sessionUpdate: z.literal("current_mode_update"),
    }),
  ),
  zConfigOptionUpdate.and(
    z.object({
      sessionUpdate: z.literal("config_option_update"),
    }),
  ),
  zSessionInfoUpdate.and(
    z.object({
      sessionUpdate: z.literal("session_info_update"),
    }),
  ),
  zUsageUpdate.and(
    z.object({
      sessionUpdate: z.literal("usage_update"),
    }),
  ),
]);

/**
 * Notification containing a session update from the agent.
 *
 * Used to stream real-time progress and results during prompt processing.
 *
 * See protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)
 */
export const zSessionNotification = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
  update: zSessionUpdate,
});

export const zAgentNotification = z.object({
  method: z.string(),
  params: z
    .union([
      zSessionNotification,
      zCompleteElicitationNotification,
      zExtNotification,
    ])
    .nullish(),
});

/**
 * Request to wait for a terminal command to exit.
 */
export const zWaitForTerminalExitRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  sessionId: zSessionId,
  terminalId: z.string(),
});

/**
 * Response containing the exit status of a terminal command.
 */
export const zWaitForTerminalExitResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  exitCode: z
    .number()
    .int()
    .gte(0)
    .max(4294967295, {
      message: "Invalid value: Expected uint32 to be <= 4294967295",
    })
    .nullish(),
  signal: z.string().nullish(),
});

/**
 * A workspace folder.
 */
export const zWorkspaceFolder = z.object({
  name: z.string(),
  uri: z.string(),
});

/**
 * Request to start an NES session.
 */
export const zStartNesRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  repository: zNesRepository.nullish(),
  workspaceFolders: z.array(zWorkspaceFolder).nullish(),
  workspaceUri: z.string().nullish(),
});

export const zClientRequest = z.object({
  id: zRequestId,
  method: z.string(),
  params: z
    .union([
      zInitializeRequest,
      zAuthenticateRequest,
      zListProvidersRequest,
      zSetProvidersRequest,
      zDisableProvidersRequest,
      zLogoutRequest,
      zNewSessionRequest,
      zLoadSessionRequest,
      zListSessionsRequest,
      zForkSessionRequest,
      zResumeSessionRequest,
      zCloseSessionRequest,
      zSetSessionModeRequest,
      zSetSessionConfigOptionRequest,
      zPromptRequest,
      zSetSessionModelRequest,
      zStartNesRequest,
      zSuggestNesRequest,
      zCloseNesRequest,
      zExtRequest,
    ])
    .nullish(),
});

/**
 * Request to write content to a text file.
 *
 * Only available if the client supports the `fs.writeTextFile` capability.
 */
export const zWriteTextFileRequest = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
  content: z.string(),
  path: z.string(),
  sessionId: zSessionId,
});

export const zAgentRequest = z.object({
  id: zRequestId,
  method: z.string(),
  params: z
    .union([
      zWriteTextFileRequest,
      zReadTextFileRequest,
      zRequestPermissionRequest,
      zCreateTerminalRequest,
      zTerminalOutputRequest,
      zReleaseTerminalRequest,
      zWaitForTerminalExitRequest,
      zKillTerminalRequest,
      zCreateElicitationRequest,
      zExtRequest,
    ])
    .nullish(),
});

/**
 * Response to `fs/write_text_file`
 */
export const zWriteTextFileResponse = z.object({
  _meta: z.record(z.string(), z.unknown()).nullish(),
});

export const zClientResponse = z.union([
  z.object({
    id: zRequestId,
    result: z.union([
      zWriteTextFileResponse,
      zReadTextFileResponse,
      zRequestPermissionResponse,
      zCreateTerminalResponse,
      zTerminalOutputResponse,
      zReleaseTerminalResponse,
      zWaitForTerminalExitResponse,
      zKillTerminalResponse,
      zCreateElicitationResponse,
      zExtResponse,
    ]),
  }),
  z.object({
    error: zError,
    id: zRequestId,
  }),
]);
````

## File: src/acp.test.ts
````typescript
import { describe, it, expect, beforeEach, vi } from "vitest";
import {
  zCreateElicitationRequest,
  zCreateElicitationResponse,
} from "./schema/zod.gen.js";
import {
  Agent,
  ClientSideConnection,
  Client,
  AgentSideConnection,
  InitializeRequest,
  InitializeResponse,
  NewSessionRequest,
  NewSessionResponse,
  LoadSessionRequest,
  LoadSessionResponse,
  AuthenticateRequest,
  AuthenticateResponse,
  PromptRequest,
  PromptResponse,
  WriteTextFileRequest,
  WriteTextFileResponse,
  ReadTextFileRequest,
  ReadTextFileResponse,
  RequestPermissionRequest,
  RequestPermissionResponse,
  CancelNotification,
  SessionNotification,
  PROTOCOL_VERSION,
  ndJsonStream,
  StartNesRequest,
  StartNesResponse,
  SuggestNesRequest,
  SuggestNesResponse,
  CloseNesRequest,
  CloseNesResponse,
  AcceptNesNotification,
  RejectNesNotification,
  DidOpenDocumentNotification,
  DidChangeDocumentNotification,
  DidCloseDocumentNotification,
  DidSaveDocumentNotification,
  DidFocusDocumentNotification,
  ForkSessionRequest,
  ForkSessionResponse,
  ListProvidersRequest,
  ListProvidersResponse,
  ListSessionsRequest,
  ListSessionsResponse,
  ResumeSessionRequest,
  ResumeSessionResponse,
  SetProvidersRequest,
  DisableProvidersRequest,
  DisableProvidersResponse,
  CreateElicitationRequest,
  CreateElicitationResponse,
  CompleteElicitationNotification,
} from "./acp.js";
import type { AnyMessage } from "./acp.js";

describe("Connection", () => {
  let clientToAgent: TransformStream<Uint8Array, Uint8Array>;
  let agentToClient: TransformStream<Uint8Array, Uint8Array>;

  beforeEach(() => {
    clientToAgent = new TransformStream();
    agentToClient = new TransformStream();
  });

  it("handles errors in bidirectional communication", async () => {
    // Create client that throws errors
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        throw new Error("Write failed");
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        throw new Error("Read failed");
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        throw new Error("Permission denied");
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {
        // no-op
      }
    }

    // Create agent that throws errors
    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        throw new Error("Failed to initialize");
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        throw new Error("Failed to create session");
      }
      async loadSession(_: LoadSessionRequest): Promise<LoadSessionResponse> {
        throw new Error("Failed to load session");
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        throw new Error("Authentication failed");
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        throw new Error("Prompt failed");
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Test error handling in client->agent direction
    await expect(
      clientConnection.writeTextFile({
        path: "/test.txt",
        content: "test",
        sessionId: "test-session",
      }),
    ).rejects.toThrow();

    // Test error handling in agent->client direction
    await expect(
      agentConnection.newSession({
        cwd: "/test",
        mcpServers: [],
      }),
    ).rejects.toThrow();
  });

  it("handles concurrent requests", async () => {
    let requestCount = 0;

    // Create client
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        requestCount++;
        const currentCount = requestCount;
        await new Promise((resolve) => setTimeout(resolve, 40));
        console.log(`Write request ${currentCount} completed`);
        return {};
      }
      async readTextFile(
        params: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: `Content of ${params.path}` };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {
        // no-op
      }
    }

    // Create agent
    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }

      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return {
          sessionId: "test-session",
        };
      }
      async loadSession(_: LoadSessionRequest): Promise<LoadSessionResponse> {
        return {};
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
    }

    // Set up connections
    new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Send multiple concurrent requests
    const promises = [
      clientConnection.writeTextFile({
        path: "/file1.txt",
        content: "content1",
        sessionId: "session1",
      }),
      clientConnection.writeTextFile({
        path: "/file2.txt",
        content: "content2",
        sessionId: "session1",
      }),
      clientConnection.writeTextFile({
        path: "/file3.txt",
        content: "content3",
        sessionId: "session1",
      }),
    ];

    const results = await Promise.all(promises);

    // Verify all requests completed successfully
    expect(results).toHaveLength(3);
    expect(results[0]).toEqual({});
    expect(results[1]).toEqual({});
    expect(results[2]).toEqual({});
    expect(requestCount).toBe(3);
  });

  it("handles message ordering correctly", async () => {
    const messageLog: string[] = [];

    // Create client
    class TestClient implements Client {
      async writeTextFile(
        params: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        messageLog.push(`writeTextFile called: ${params.path}`);
        return {};
      }
      async readTextFile(
        params: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        messageLog.push(`readTextFile called: ${params.path}`);
        return { content: "test content" };
      }
      async requestPermission(
        params: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        messageLog.push(`requestPermission called: ${params.toolCall.title}`);
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_params: SessionNotification): Promise<void> {
        messageLog.push("sessionUpdate called");
      }
    }

    // Create agent
    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(
        request: NewSessionRequest,
      ): Promise<NewSessionResponse> {
        messageLog.push(`newSession called: ${request.cwd}`);
        return {
          sessionId: "test-session",
        };
      }
      async loadSession(
        params: LoadSessionRequest,
      ): Promise<LoadSessionResponse> {
        messageLog.push(`loadSession called: ${params.sessionId}`);
        return {};
      }
      async authenticate(params: AuthenticateRequest): Promise<void> {
        messageLog.push(`authenticate called: ${params.methodId}`);
      }
      async prompt(params: PromptRequest): Promise<PromptResponse> {
        messageLog.push(`prompt called: ${params.sessionId}`);
        return { stopReason: "end_turn" };
      }
      async cancel(params: CancelNotification): Promise<void> {
        messageLog.push(`cancelled called: ${params.sessionId}`);
      }
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Send requests in specific order
    await agentConnection.newSession({
      cwd: "/test",
      mcpServers: [],
    });
    await clientConnection.writeTextFile({
      path: "/test.txt",
      content: "test",
      sessionId: "test-session",
    });
    await clientConnection.readTextFile({
      path: "/test.txt",
      sessionId: "test-session",
    });
    await clientConnection.requestPermission({
      sessionId: "test-session",
      toolCall: {
        title: "Execute command",
        kind: "execute",
        status: "pending",
        toolCallId: "tool-123",
        content: [
          {
            type: "content",
            content: {
              type: "text",
              text: "ls -la",
            },
          },
        ],
      },
      options: [
        {
          kind: "allow_once",
          name: "Allow",
          optionId: "allow",
        },
        {
          kind: "reject_once",
          name: "Reject",
          optionId: "reject",
        },
      ],
    });

    // Verify order
    expect(messageLog).toEqual([
      "newSession called: /test",
      "writeTextFile called: /test.txt",
      "readTextFile called: /test.txt",
      "requestPermission called: Execute command",
    ]);
  });

  it("handles notifications correctly", async () => {
    const notificationLog: string[] = [];

    // Create client
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(notification: SessionNotification): Promise<void> {
        if (
          notification.update &&
          "sessionUpdate" in notification.update &&
          notification.update.sessionUpdate === "agent_message_chunk"
        ) {
          notificationLog.push(
            `agent message: ${(notification.update.content as any).text}`,
          );
        }
      }
    }

    // Create agent
    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return {
          sessionId: "test-session",
        };
      }
      async loadSession(_: LoadSessionRequest): Promise<LoadSessionResponse> {
        return {};
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(params: CancelNotification): Promise<void> {
        notificationLog.push(`cancelled: ${params.sessionId}`);
      }
    }

    // Create shared instances
    const testClient = () => new TestClient();
    const testAgent = () => new TestAgent();

    // Set up connections
    const agentConnection = new ClientSideConnection(
      testClient,
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      testAgent,
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Send notifications
    await clientConnection.sessionUpdate({
      sessionId: "test-session",
      update: {
        sessionUpdate: "agent_message_chunk",
        content: {
          type: "text",
          text: "Hello from agent",
        },
      },
    });

    await agentConnection.cancel({
      sessionId: "test-session",
    });

    // Verify notifications were received
    await vi.waitFor(() => {
      expect(notificationLog).toContain("agent message: Hello from agent");
      expect(notificationLog).toContain("cancelled: test-session");
    });
  });

  it("handles requests from inside a request handler without deadlocking", async () => {
    let agentConnection: ClientSideConnection | null = null;

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        const listResponse = await agentConnection!.listSessions({});
        expect(listResponse.sessions).toEqual([]);
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}
      async listSessions(
        _: ListSessionsRequest,
      ): Promise<ListSessionsResponse> {
        return { sessions: [] };
      }
    }

    agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    const permissionResponse = await clientConnection.requestPermission({
      sessionId: "test-session",
      toolCall: {
        title: "Execute command",
        kind: "execute",
        status: "pending",
        toolCallId: "tool-123",
        content: [
          { type: "content", content: { type: "text", text: "ls -la" } },
        ],
      },
      options: [
        { kind: "allow_once", name: "Allow", optionId: "allow" },
        { kind: "reject_once", name: "Reject", optionId: "reject" },
      ],
    });

    expect(permissionResponse.outcome.outcome).toBe("selected");
  });

  it("processes notification after response when both arrive in quick succession", async () => {
    const events: string[] = [];
    const {
      promise: sessionNotification,
      resolve: resolveSessionNotification,
    } = Promise.withResolvers<void>();

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_params: SessionNotification): Promise<void> {
        // Record the session notification
        events.push("SessionNotification");
        resolveSessionNotification();
      }
    }

    const connection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const newSessionResponse = connection
      .newSession({ cwd: "/test", mcpServers: [] })
      .then((result) => {
        // Record the new session response event
        events.push("NewSessionResponse");
        return result;
      });

    // Get the NewSessionRequest ID
    const requestReader = clientToAgent.readable.getReader();
    const { value: requestChunk } = await requestReader.read();
    requestReader.releaseLock();
    const { id: requestId } = JSON.parse(
      new TextDecoder().decode(requestChunk),
    );

    // Write response and notification in quick succession
    const sessionId = "test-session";
    const writer = agentToClient.writable.getWriter();
    await writer.write(
      new TextEncoder().encode(
        JSON.stringify({
          jsonrpc: "2.0",
          id: requestId,
          result: { sessionId },
        }) + "\n",
      ),
    );
    await writer.write(
      new TextEncoder().encode(
        JSON.stringify({
          jsonrpc: "2.0",
          method: "session/update",
          params: {
            sessionId,
            update: {
              sessionUpdate: "available_commands_update",
              availableCommands: [],
            },
          },
        }) + "\n",
      ),
    );
    writer.releaseLock();

    await newSessionResponse;
    await sessionNotification;

    expect(events).toEqual(["NewSessionResponse", "SessionNotification"]);
  });

  it("handles initialize method", async () => {
    // Create client
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {
        // no-op
      }
    }

    // Create agent
    class TestAgent implements Agent {
      async initialize(params: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: params.protocolVersion,
          agentCapabilities: { loadSession: true },
          authMethods: [
            {
              id: "oauth",
              name: "OAuth",
              description: "Authenticate with OAuth",
            },
          ],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async loadSession(_: LoadSessionRequest): Promise<LoadSessionResponse> {
        return {};
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Test initialize request
    const response = await agentConnection.initialize({
      protocolVersion: PROTOCOL_VERSION,
      clientCapabilities: {
        fs: {
          readTextFile: false,
          writeTextFile: false,
        },
      },
    });

    expect(response.protocolVersion).toBe(PROTOCOL_VERSION);
    expect(response.agentCapabilities?.loadSession).toBe(true);
    expect(response.authMethods).toHaveLength(1);
    expect(response.authMethods?.[0].id).toBe("oauth");
  });

  it("strips unknown properties on known incoming params", async () => {
    let receivedInitializeParams: Record<string, unknown> | undefined;
    let receivedSessionUpdate: Record<string, unknown> | undefined;

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(params: SessionNotification): Promise<void> {
        receivedSessionUpdate = params as unknown as Record<string, unknown>;
      }
    }

    class TestAgent implements Agent {
      async initialize(params: InitializeRequest): Promise<InitializeResponse> {
        receivedInitializeParams = params as unknown as Record<string, unknown>;
        return {
          protocolVersion: PROTOCOL_VERSION,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async loadSession(_: LoadSessionRequest): Promise<LoadSessionResponse> {
        return {};
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
    }

    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    await agentConnection.initialize({
      protocolVersion: PROTOCOL_VERSION,
      clientCapabilities: {
        fs: {
          readTextFile: false,
          writeTextFile: false,
          experimentalFs: true,
        },
        customCapability: {
          enabled: true,
        },
      },
      extraTopLevel: "keep me",
    } as any);

    await clientConnection.sessionUpdate({
      sessionId: "test-session",
      update: {
        sessionUpdate: "agent_message_chunk",
        content: {
          type: "text",
          text: "Hello from agent",
        },
        extraUpdateField: {
          keep: true,
        },
      },
      extraNotificationField: "keep this too",
    } as any);

    await vi.waitFor(() => {
      expect(receivedInitializeParams).not.toHaveProperty("extraTopLevel");
      expect(receivedInitializeParams).not.toHaveProperty(
        "clientCapabilities.customCapability",
      );
      expect(receivedInitializeParams).not.toHaveProperty(
        "clientCapabilities.fs.experimentalFs",
      );

      expect(receivedSessionUpdate).not.toHaveProperty(
        "extraNotificationField",
      );
      expect(receivedSessionUpdate).not.toHaveProperty(
        "update.extraUpdateField",
      );
    });
  });

  it("handles extension methods and notifications", async () => {
    const extensionLog: string[] = [];

    // Create client with extension method support
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {
        // no-op
      }
      async extMethod(
        method: string,
        params: Record<string, unknown>,
      ): Promise<Record<string, unknown>> {
        if (method === "example.com/ping") {
          return { response: "pong", params };
        }
        throw new Error(`Unknown method: ${method}`);
      }
      async extNotification(
        method: string,
        _params: Record<string, unknown>,
      ): Promise<void> {
        extensionLog.push(`client extNotification: ${method}`);
      }
    }

    // Create agent with extension method support
    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: PROTOCOL_VERSION,
          agentCapabilities: { loadSession: false },
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
      async extMethod(
        method: string,
        params: Record<string, unknown>,
      ): Promise<Record<string, unknown>> {
        if (method === "example.com/echo") {
          return { echo: params };
        }
        throw new Error(`Unknown method: ${method}`);
      }
      async extNotification(
        method: string,
        _params: Record<string, unknown>,
      ): Promise<void> {
        extensionLog.push(`agent extNotification: ${method}`);
      }
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Test agent calling client extension method
    const clientResponse = await clientConnection.extMethod(
      "example.com/ping",
      {
        data: "test",
      },
    );
    expect(clientResponse).toEqual({
      response: "pong",
      params: { data: "test" },
    });

    // Test client calling agent extension method
    const agentResponse = await agentConnection.extMethod("example.com/echo", {
      message: "hello",
    });
    expect(agentResponse).toEqual({ echo: { message: "hello" } });

    // Test extension notifications
    await clientConnection.extNotification("example.com/client/notify", {
      info: "client notification",
    });
    await agentConnection.extNotification("example.com/agent/notify", {
      info: "agent notification",
    });

    // Verify notifications were logged
    await vi.waitFor(() => {
      expect(extensionLog).toContain(
        "client extNotification: example.com/client/notify",
      );
      expect(extensionLog).toContain(
        "agent extNotification: example.com/agent/notify",
      );
    });
  });

  it("handles optional extension methods correctly", async () => {
    // Create client WITHOUT extension methods
    class TestClientWithoutExtensions implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {
        // no-op
      }
      // Note: No extMethod or extNotification implemented
    }

    // Create agent WITHOUT extension methods
    class TestAgentWithoutExtensions implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: PROTOCOL_VERSION,
          agentCapabilities: { loadSession: false },
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
      // Note: No extMethod or extNotification implemented
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClientWithoutExtensions(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgentWithoutExtensions(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Test that calling extension methods on connections without them throws method not found
    try {
      await clientConnection.extMethod("_example.com/ping", { data: "test" });
      expect.fail("Should have thrown method not found error");
    } catch (error: any) {
      expect(error.code).toBe(-32601); // Method not found
      expect(error.data.method).toBe("_example.com/ping");
    }

    try {
      await agentConnection.extMethod("_example.com/echo", {
        message: "hello",
      });
      expect.fail("Should have thrown method not found error");
    } catch (error: any) {
      expect(error.code).toBe(-32601); // Method not found
      expect(error.data.method).toBe("_example.com/echo");
    }

    // Notifications should be ignored when not implemented (no error thrown)
    await clientConnection.extNotification("example.com/notify", {
      info: "test",
    });
    await agentConnection.extNotification("example.com/notify", {
      info: "test",
    });
  });

  it("resolves closed promise when stream ends", async () => {
    const closeLog: string[] = [];

    // Create simple client and agent
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {
        // no-op
      }
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: PROTOCOL_VERSION,
          agentCapabilities: { loadSession: false },
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Listen for close via signal
    agentConnection.signal.addEventListener("abort", () => {
      closeLog.push("agent connection closed (signal)");
    });

    clientConnection.signal.addEventListener("abort", () => {
      closeLog.push("client connection closed (signal)");
    });

    // Verify connections are not closed yet
    expect(agentConnection.signal.aborted).toBe(false);
    expect(clientConnection.signal.aborted).toBe(false);
    expect(closeLog).toHaveLength(0);

    // Close the streams by closing the writable ends
    await clientToAgent.writable.close();
    await agentToClient.writable.close();

    // Wait for closed promises to resolve
    await agentConnection.closed;
    await clientConnection.closed;

    // Verify connections are now closed
    expect(agentConnection.signal.aborted).toBe(true);
    expect(clientConnection.signal.aborted).toBe(true);
    expect(closeLog).toContain("agent connection closed (signal)");
    expect(closeLog).toContain("client connection closed (signal)");
  });

  class MinimalTestClient implements Client {
    async writeTextFile(
      _: WriteTextFileRequest,
    ): Promise<WriteTextFileResponse> {
      return {};
    }
    async readTextFile(_: ReadTextFileRequest): Promise<ReadTextFileResponse> {
      return { content: "test" };
    }
    async requestPermission(
      _: RequestPermissionRequest,
    ): Promise<RequestPermissionResponse> {
      return {
        outcome: {
          outcome: "selected",
          optionId: "allow",
        },
      };
    }
    async sessionUpdate(_: SessionNotification): Promise<void> {
      // no-op
    }
  }

  it("propagates input stream errors through ndJsonStream", async () => {
    const inputStream = new ReadableStream<Uint8Array>({
      start(controller) {
        // Simulate a process crash after partial data
        controller.error(new Error("process exited with code 1"));
      },
    });
    const outputStream = new WritableStream<Uint8Array>();

    const connection = new ClientSideConnection(
      () => new MinimalTestClient(),
      ndJsonStream(outputStream, inputStream),
    );

    await expect(connection.closed).resolves.toBeUndefined();
    expect(connection.signal.aborted).toBe(true);
  });

  it("rejects pending requests when input stream errors via ndJsonStream", async () => {
    let errorController!: ReadableStreamDefaultController<Uint8Array>;

    const inputStream = new ReadableStream<Uint8Array>({
      start(controller) {
        errorController = controller;
      },
    });
    const outputStream = new WritableStream<Uint8Array>();

    const connection = new ClientSideConnection(
      () => new MinimalTestClient(),
      ndJsonStream(outputStream, inputStream),
    );

    const requestPromise = connection.newSession({
      cwd: "/test",
      mcpServers: [],
    });

    errorController.error(new Error("process exited with code 1"));

    await expect(requestPromise).rejects.toThrow("process exited with code 1");
  });

  it("rejects pending requests when the stream errors", async () => {
    let readableController!: ReadableStreamDefaultController<AnyMessage>;

    const connection = new ClientSideConnection(() => new MinimalTestClient(), {
      readable: new ReadableStream<AnyMessage>({
        start(controller) {
          readableController = controller;
        },
      }),
      writable: new WritableStream<AnyMessage>({
        async write() {
          // no-op
        },
      }),
    });

    const requestPromise = connection.newSession({
      cwd: "/test",
      mcpServers: [],
    });
    const error = new Error("stream exploded");

    readableController.error(error);

    await expect(requestPromise).rejects.toThrow("stream exploded");
    await expect(connection.closed).resolves.toBeUndefined();
    expect(connection.signal.aborted).toBe(true);
  });

  it("rejects pending requests when the writable stream errors", async () => {
    const writeError = new Error("write failed");

    const connection = new ClientSideConnection(() => new MinimalTestClient(), {
      readable: new ReadableStream<AnyMessage>({
        // Never produces messages; stays open.
        start() {},
      }),
      writable: new WritableStream<AnyMessage>({
        async write() {
          throw writeError;
        },
      }),
    });

    const requestPromise = connection.newSession({
      cwd: "/test",
      mcpServers: [],
    });

    await expect(requestPromise).rejects.toThrow("write failed");
    await expect(connection.closed).resolves.toBeUndefined();
    expect(connection.signal.aborted).toBe(true);
  });

  it("rejects requests issued after the connection is closed", async () => {
    const connection = new ClientSideConnection(() => new MinimalTestClient(), {
      readable: new ReadableStream<AnyMessage>({
        start(controller) {
          // Close the readable stream immediately so the connection closes.
          controller.close();
        },
      }),
      writable: new WritableStream<AnyMessage>({
        async write() {
          // no-op
        },
      }),
    });

    await connection.closed;
    expect(connection.signal.aborted).toBe(true);

    await expect(
      connection.newSession({ cwd: "/test", mcpServers: [] }),
    ).rejects.toThrow("ACP connection closed");
  });

  it("supports removing signal event listeners", async () => {
    const closeLog: string[] = [];

    // Create simple client and agent
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "test" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
        };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {
        // no-op
      }
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: PROTOCOL_VERSION,
          agentCapabilities: { loadSession: false },
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {
        // no-op
      }
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {
        // no-op
      }
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Register and then remove a listener
    const listener = () => {
      closeLog.push("this should not be called");
    };

    agentConnection.signal.addEventListener("abort", listener);
    agentConnection.signal.removeEventListener("abort", listener);

    // Register another listener that should be called
    agentConnection.signal.addEventListener("abort", () => {
      closeLog.push("agent connection closed");
    });

    // Close the streams
    await clientToAgent.writable.close();
    await agentToClient.writable.close();

    // Wait for closed promise
    await agentConnection.closed;

    // Verify only the non-removed listener was called
    expect(closeLog).toEqual(["agent connection closed"]);
    expect(closeLog).not.toContain("this should not be called");
  });

  it("handles methods returning response objects with _meta or void", async () => {
    // Create client that returns both response objects and void
    class TestClient implements Client {
      async writeTextFile(
        _params: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        // Return response object with _meta
        return {
          _meta: {
            timestamp: new Date().toISOString(),
            version: "1.0.0",
          },
        };
      }
      async readTextFile(
        _params: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return {
          content: "test content",
          _meta: {
            encoding: "utf-8",
          },
        };
      }
      async requestPermission(
        _params: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return {
          outcome: {
            outcome: "selected",
            optionId: "allow",
          },
          _meta: {
            userId: "test-user",
          },
        };
      }
      async sessionUpdate(_params: SessionNotification): Promise<void> {
        // Returns void
      }
    }

    // Create agent that returns both response objects and void
    class TestAgent implements Agent {
      async initialize(params: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: params.protocolVersion,
          agentCapabilities: { loadSession: true },
          _meta: {
            agentVersion: "2.0.0",
          },
        };
      }
      async newSession(
        _params: NewSessionRequest,
      ): Promise<NewSessionResponse> {
        return {
          sessionId: "test-session",
          _meta: {
            sessionType: "ephemeral",
          },
        };
      }
      async loadSession(
        _params: LoadSessionRequest,
      ): Promise<LoadSessionResponse> {
        // Test returning minimal response
        return {};
      }
      async authenticate(
        params: AuthenticateRequest,
      ): Promise<AuthenticateResponse | void> {
        if (params.methodId === "none") {
          // Test returning void
          return;
        }
        // Test returning response with _meta
        return {
          _meta: {
            authenticated: true,
            method: params.methodId,
          },
        };
      }
      async prompt(_params: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_params: CancelNotification): Promise<void> {
        // Returns void
      }
    }

    // Set up connections
    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );

    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Test writeTextFile returns response with _meta
    const writeResponse = await clientConnection.writeTextFile({
      path: "/test.txt",
      content: "test",
      sessionId: "test-session",
    });
    expect(writeResponse).toEqual({
      _meta: {
        timestamp: expect.any(String),
        version: "1.0.0",
      },
    });

    // Test readTextFile returns response with content and _meta
    const readResponse = await clientConnection.readTextFile({
      path: "/test.txt",
      sessionId: "test-session",
    });
    expect(readResponse.content).toBe("test content");
    expect(readResponse._meta).toEqual({
      encoding: "utf-8",
    });

    // Test initialize with _meta
    const initResponse = await agentConnection.initialize({
      protocolVersion: PROTOCOL_VERSION,
      clientCapabilities: {},
    });
    expect(initResponse._meta).toEqual({
      agentVersion: "2.0.0",
    });

    // Test authenticate returning void
    const authResponseVoid = await agentConnection.authenticate({
      methodId: "none",
    });
    expect(authResponseVoid).toEqual({});

    // Test authenticate returning response with _meta
    const authResponse = await agentConnection.authenticate({
      methodId: "oauth",
    });
    expect(authResponse).toEqual({
      _meta: {
        authenticated: true,
        method: "oauth",
      },
    });

    // Test newSession with _meta
    const sessionResponse = await agentConnection.newSession({
      cwd: "/test",
      mcpServers: [],
    });
    expect(sessionResponse._meta).toEqual({
      sessionType: "ephemeral",
    });

    // Test loadSession returning minimal response
    const loadResponse = await agentConnection.loadSession({
      sessionId: "test-session",
      mcpServers: [],
      cwd: "/test",
    });
    expect(loadResponse).toEqual({});
  });

  it("handles NES request lifecycle", async () => {
    let receivedStartRequest: StartNesRequest | undefined;

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}

      async unstable_startNes(
        params: StartNesRequest,
      ): Promise<StartNesResponse> {
        receivedStartRequest = params;
        return { sessionId: "nes-session-1" };
      }
      async unstable_suggestNes(
        _: SuggestNesRequest,
      ): Promise<SuggestNesResponse> {
        return {
          suggestions: [
            {
              kind: "edit",
              id: "sug-1",
              uri: "file:///test.ts",
              edits: [
                {
                  range: {
                    start: { line: 0, character: 0 },
                    end: { line: 0, character: 5 },
                  },
                  newText: "hello",
                },
              ],
            },
          ],
        };
      }
      async unstable_closeNes(_: CloseNesRequest): Promise<CloseNesResponse> {
        return {};
      }
    }

    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    void clientConnection;

    const startResponse = await agentConnection.unstable_startNes({
      workspaceUri: "file:///workspace",
      workspaceFolders: [
        { uri: "file:///workspace/frontend", name: "frontend" },
        { uri: "file:///workspace/backend", name: "backend" },
      ],
      repository: {
        name: "my-repo",
        owner: "my-org",
        remoteUrl: "https://github.com/my-org/my-repo.git",
      },
    });
    expect(startResponse).toEqual({ sessionId: "nes-session-1" });
    expect(receivedStartRequest?.workspaceUri).toEqual("file:///workspace");
    expect(receivedStartRequest?.workspaceFolders).toEqual([
      { uri: "file:///workspace/frontend", name: "frontend" },
      { uri: "file:///workspace/backend", name: "backend" },
    ]);
    expect(receivedStartRequest?.repository).toEqual({
      name: "my-repo",
      owner: "my-org",
      remoteUrl: "https://github.com/my-org/my-repo.git",
    });

    const suggestResponse = await agentConnection.unstable_suggestNes({
      sessionId: "nes-session-1",
      position: { line: 0, character: 5 },
      triggerKind: "manual",
      uri: "file:///test.ts",
      version: 1,
    });
    expect(suggestResponse).toEqual({
      suggestions: [
        {
          kind: "edit",
          id: "sug-1",
          uri: "file:///test.ts",
          edits: [
            {
              range: {
                start: { line: 0, character: 0 },
                end: { line: 0, character: 5 },
              },
              newText: "hello",
            },
          ],
        },
      ],
    });

    const closeResponse = await agentConnection.unstable_closeNes({
      sessionId: "nes-session-1",
    });
    expect(closeResponse).toEqual({});
  });

  it("handles providers request lifecycle", async () => {
    let receivedSetRequest: SetProvidersRequest | undefined;
    let receivedDisableRequest: DisableProvidersRequest | undefined;

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false, providers: {} },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}

      async unstable_listProviders(
        _: ListProvidersRequest,
      ): Promise<ListProvidersResponse> {
        return {
          providers: [
            {
              id: "main",
              supported: ["anthropic", "openai"],
              required: true,
              current: {
                apiType: "anthropic",
                baseUrl: "https://api.anthropic.com",
              },
            },
            {
              id: "openai",
              supported: ["openai"],
              required: false,
            },
            {
              id: "azure",
              supported: ["azure"],
              required: false,
              current: null,
            },
          ],
        };
      }

      async unstable_setProvider(params: SetProvidersRequest): Promise<void> {
        receivedSetRequest = params;
      }

      async unstable_disableProvider(
        params: DisableProvidersRequest,
      ): Promise<DisableProvidersResponse> {
        receivedDisableRequest = params;
        return {};
      }
    }

    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    void clientConnection;

    const listResponse = await agentConnection.unstable_listProviders({});
    expect(listResponse.providers).toEqual([
      {
        id: "main",
        supported: ["anthropic", "openai"],
        required: true,
        current: {
          apiType: "anthropic",
          baseUrl: "https://api.anthropic.com",
        },
      },
      {
        id: "openai",
        supported: ["openai"],
        required: false,
      },
      {
        id: "azure",
        supported: ["azure"],
        required: false,
        current: null,
      },
    ]);
    expect("current" in listResponse.providers[1]).toBe(false);

    const setResponse = await agentConnection.unstable_setProvider({
      id: "main",
      apiType: "openai",
      baseUrl: "https://llm-gateway.corp.example.com/openai/v1",
      headers: {
        Authorization: "Bearer token",
        "X-Request-Source": "test-client",
      },
    });
    expect(setResponse).toEqual({});
    expect(receivedSetRequest).toEqual({
      id: "main",
      apiType: "openai",
      baseUrl: "https://llm-gateway.corp.example.com/openai/v1",
      headers: {
        Authorization: "Bearer token",
        "X-Request-Source": "test-client",
      },
    });

    const disableResponse = await agentConnection.unstable_disableProvider({
      id: "openai",
    });
    expect(disableResponse).toEqual({});
    expect(receivedDisableRequest).toEqual({ id: "openai" });
  });

  it("rejects providers requests when agent does not implement handlers", async () => {
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}
    }

    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    void clientConnection;

    await expect(
      agentConnection.unstable_listProviders({}),
    ).rejects.toMatchObject({
      code: -32601,
      data: { method: "providers/list" },
    });

    await expect(
      agentConnection.unstable_setProvider({
        id: "main",
        apiType: "openai",
        baseUrl: "https://api.openai.com/v1",
      }),
    ).rejects.toMatchObject({
      code: -32601,
      data: { method: "providers/set" },
    });

    await expect(
      agentConnection.unstable_disableProvider({ id: "main" }),
    ).rejects.toMatchObject({
      code: -32601,
      data: { method: "providers/disable" },
    });
  });

  it("handles NES notifications", async () => {
    const notificationLog: unknown[] = [];

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}

      async unstable_acceptNes(params: AcceptNesNotification): Promise<void> {
        notificationLog.push({ type: "acceptNes", params });
      }
      async unstable_rejectNes(params: RejectNesNotification): Promise<void> {
        notificationLog.push({ type: "rejectNes", params });
      }
    }

    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    void clientConnection;

    await agentConnection.unstable_acceptNes({
      sessionId: "nes-session-1",
      id: "sug-1",
    });
    await agentConnection.unstable_rejectNes({
      sessionId: "nes-session-1",
      id: "sug-2",
      reason: "rejected",
    });

    await vi.waitFor(() => {
      expect(notificationLog).toEqual([
        {
          type: "acceptNes",
          params: { sessionId: "nes-session-1", id: "sug-1" },
        },
        {
          type: "rejectNes",
          params: {
            sessionId: "nes-session-1",
            id: "sug-2",
            reason: "rejected",
          },
        },
      ]);
    });
  });

  it("handles document notifications", async () => {
    const notificationLog: unknown[] = [];

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}

      async unstable_didOpenDocument(
        params: DidOpenDocumentNotification,
      ): Promise<void> {
        notificationLog.push({ type: "didOpen", params });
      }
      async unstable_didChangeDocument(
        params: DidChangeDocumentNotification,
      ): Promise<void> {
        notificationLog.push({ type: "didChange", params });
      }
      async unstable_didCloseDocument(
        params: DidCloseDocumentNotification,
      ): Promise<void> {
        notificationLog.push({ type: "didClose", params });
      }
      async unstable_didSaveDocument(
        params: DidSaveDocumentNotification,
      ): Promise<void> {
        notificationLog.push({ type: "didSave", params });
      }
      async unstable_didFocusDocument(
        params: DidFocusDocumentNotification,
      ): Promise<void> {
        notificationLog.push({ type: "didFocus", params });
      }
    }

    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    void clientConnection;

    await agentConnection.unstable_didOpenDocument({
      sessionId: "s1",
      uri: "file:///test.ts",
      languageId: "typescript",
      version: 1,
      text: "const x = 1;",
    });
    await agentConnection.unstable_didChangeDocument({
      sessionId: "s1",
      uri: "file:///test.ts",
      version: 2,
      contentChanges: [{ text: "const x = 2;" }],
    });
    await agentConnection.unstable_didSaveDocument({
      sessionId: "s1",
      uri: "file:///test.ts",
    });
    await agentConnection.unstable_didFocusDocument({
      sessionId: "s1",
      uri: "file:///test.ts",
      version: 2,
      position: { line: 0, character: 5 },
      visibleRange: {
        start: { line: 0, character: 0 },
        end: { line: 10, character: 0 },
      },
    });
    await agentConnection.unstable_didCloseDocument({
      sessionId: "s1",
      uri: "file:///test.ts",
    });

    await vi.waitFor(() => {
      expect(notificationLog).toEqual([
        {
          type: "didOpen",
          params: {
            sessionId: "s1",
            uri: "file:///test.ts",
            languageId: "typescript",
            version: 1,
            text: "const x = 1;",
          },
        },
        {
          type: "didChange",
          params: {
            sessionId: "s1",
            uri: "file:///test.ts",
            version: 2,
            contentChanges: [{ text: "const x = 2;" }],
          },
        },
        {
          type: "didSave",
          params: {
            sessionId: "s1",
            uri: "file:///test.ts",
          },
        },
        {
          type: "didFocus",
          params: {
            sessionId: "s1",
            uri: "file:///test.ts",
            version: 2,
            position: { line: 0, character: 5 },
            visibleRange: {
              start: { line: 0, character: 0 },
              end: { line: 10, character: 0 },
            },
          },
        },
        {
          type: "didClose",
          params: {
            sessionId: "s1",
            uri: "file:///test.ts",
          },
        },
      ]);
    });
  });

  it("propagates additionalDirectories on session lifecycle methods", async () => {
    let receivedNewSession: NewSessionRequest | undefined;
    let receivedLoadSession: LoadSessionRequest | undefined;
    let receivedForkSession: ForkSessionRequest | undefined;
    let receivedResumeSession: ResumeSessionRequest | undefined;
    let receivedListSessions: ListSessionsRequest | undefined;

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(params: NewSessionRequest): Promise<NewSessionResponse> {
        receivedNewSession = params;
        return { sessionId: "new-s1" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}

      async loadSession(
        params: LoadSessionRequest,
      ): Promise<LoadSessionResponse> {
        receivedLoadSession = params;
        return {};
      }
      async unstable_forkSession(
        params: ForkSessionRequest,
      ): Promise<ForkSessionResponse> {
        receivedForkSession = params;
        return { sessionId: "forked-s1" };
      }
      async resumeSession(
        params: ResumeSessionRequest,
      ): Promise<ResumeSessionResponse> {
        receivedResumeSession = params;
        return {};
      }
      async listSessions(
        params: ListSessionsRequest,
      ): Promise<ListSessionsResponse> {
        receivedListSessions = params;
        return { sessions: [] };
      }
    }

    const agentConnection = new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    void clientConnection;

    const newSessionResponse = await agentConnection.newSession({
      cwd: "/test",
      mcpServers: [],
      additionalDirectories: ["/extra/root1", "/extra/root2"],
    });
    expect(newSessionResponse).toEqual({ sessionId: "new-s1" });
    expect(receivedNewSession?.additionalDirectories).toEqual([
      "/extra/root1",
      "/extra/root2",
    ]);

    const loadResponse = await agentConnection.loadSession({
      sessionId: "s1",
      cwd: "/test",
      mcpServers: [],
      additionalDirectories: ["/extra/root1", "/extra/root2"],
    });
    expect(loadResponse).toEqual({});
    expect(receivedLoadSession?.additionalDirectories).toEqual([
      "/extra/root1",
      "/extra/root2",
    ]);

    const forkResponse = await agentConnection.unstable_forkSession({
      sessionId: "s1",
      cwd: "/test",
      additionalDirectories: ["/extra/root1", "/extra/root2"],
    });
    expect(forkResponse).toEqual({ sessionId: "forked-s1" });
    expect(receivedForkSession?.additionalDirectories).toEqual([
      "/extra/root1",
      "/extra/root2",
    ]);

    const resumeResponse = await agentConnection.resumeSession({
      sessionId: "s1",
      cwd: "/test",
      additionalDirectories: ["/extra/root1", "/extra/root2"],
    });
    expect(resumeResponse).toEqual({});
    expect(receivedResumeSession?.additionalDirectories).toEqual([
      "/extra/root1",
      "/extra/root2",
    ]);

    const listResponse = await agentConnection.listSessions({
      additionalDirectories: ["/extra/root1", "/extra/root2"],
    });
    expect(listResponse).toEqual({ sessions: [] });
    expect(receivedListSessions?.additionalDirectories).toEqual([
      "/extra/root1",
      "/extra/root2",
    ]);
  });

  it("handles elicitation request lifecycle", async () => {
    let receivedRequest: CreateElicitationRequest | undefined;
    let receivedNotification: CompleteElicitationNotification | undefined;

    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}

      async unstable_createElicitation(
        params: CreateElicitationRequest,
      ): Promise<CreateElicitationResponse> {
        receivedRequest = params;
        return {
          action: "accept",
          content: { name: "Alice" },
        };
      }
      async unstable_completeElicitation(
        params: CompleteElicitationNotification,
      ): Promise<void> {
        receivedNotification = params;
      }
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}
    }

    new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    // Test form-mode elicitation request
    const response = await clientConnection.unstable_createElicitation({
      sessionId: "test-session",
      mode: "form",
      message: "Please enter your name",
      requestedSchema: {
        type: "object",
        properties: {
          name: { type: "string", description: "Your name" },
        },
      },
    });

    expect(response.action).toBe("accept");
    expect(receivedRequest?.message).toBe("Please enter your name");
    expect((receivedRequest as any)?.sessionId).toBe("test-session");
    expect((receivedRequest as any)?.mode).toBe("form");

    // Test url-mode elicitation request
    receivedRequest = undefined;
    const urlResponse = await clientConnection.unstable_createElicitation({
      sessionId: "test-session",
      mode: "url",
      message: "Please authenticate",
      elicitationId: "elic-url-1",
      url: "https://example.com/auth",
    });

    expect(urlResponse.action).toBe("accept");
    expect((receivedRequest as any)?.message).toBe("Please authenticate");
    expect((receivedRequest as any)?.mode).toBe("url");
    expect((receivedRequest as any)?.url).toBe("https://example.com/auth");
    expect((receivedRequest as any)?.elicitationId).toBe("elic-url-1");

    // Test elicitation complete notification
    await clientConnection.unstable_completeElicitation({
      elicitationId: "elic-1",
    });

    await vi.waitFor(() => {
      expect(receivedNotification?.elicitationId).toBe("elic-1");
    });
  });

  it("silently ignores completeElicitation when client does not implement handler", async () => {
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}
    }

    new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    await clientConnection.unstable_completeElicitation({
      elicitationId: "elic-1",
    });
  });

  it("rejects elicitation request when client does not implement handler", async () => {
    // Client WITHOUT unstable_createElicitation
    class TestClient implements Client {
      async writeTextFile(
        _: WriteTextFileRequest,
      ): Promise<WriteTextFileResponse> {
        return {};
      }
      async readTextFile(
        _: ReadTextFileRequest,
      ): Promise<ReadTextFileResponse> {
        return { content: "" };
      }
      async requestPermission(
        _: RequestPermissionRequest,
      ): Promise<RequestPermissionResponse> {
        return { outcome: { outcome: "selected", optionId: "allow" } };
      }
      async sessionUpdate(_: SessionNotification): Promise<void> {}
    }

    class TestAgent implements Agent {
      async initialize(_: InitializeRequest): Promise<InitializeResponse> {
        return {
          protocolVersion: 1,
          agentCapabilities: { loadSession: false },
          authMethods: [],
        };
      }
      async newSession(_: NewSessionRequest): Promise<NewSessionResponse> {
        return { sessionId: "test-session" };
      }
      async authenticate(_: AuthenticateRequest): Promise<void> {}
      async prompt(_: PromptRequest): Promise<PromptResponse> {
        return { stopReason: "end_turn" };
      }
      async cancel(_: CancelNotification): Promise<void> {}
    }

    new ClientSideConnection(
      () => new TestClient(),
      ndJsonStream(clientToAgent.writable, agentToClient.readable),
    );
    const clientConnection = new AgentSideConnection(
      () => new TestAgent(),
      ndJsonStream(agentToClient.writable, clientToAgent.readable),
    );

    await expect(
      clientConnection.unstable_createElicitation({
        sessionId: "test-session",
        mode: "form",
        message: "Enter your name",
        requestedSchema: {
          type: "object",
          properties: {
            name: { type: "string" },
          },
        },
      }),
    ).rejects.toMatchObject({ code: -32601 });
  });
});

describe("CreateElicitationRequest schema", () => {
  // These tests verify the post-processed zod schema correctly enforces
  // both the scope union (session vs request) and mode discriminator (form vs url).
  // If the generate.js patches stop applying, these will fail.

  const formSessionRequest = {
    sessionId: "sess-1",
    mode: "form" as const,
    message: "Enter your name",
    requestedSchema: { type: "object" as const, properties: {} },
  };

  it("accepts form-mode request scoped to a session", () => {
    const result = zCreateElicitationRequest.safeParse(formSessionRequest);
    expect(result.success).toBe(true);
  });

  it("accepts form-mode request with optional toolCallId", () => {
    const result = zCreateElicitationRequest.safeParse({
      ...formSessionRequest,
      toolCallId: "tc-1",
    });
    expect(result.success).toBe(true);
  });

  it("accepts form-mode request scoped to a request", () => {
    const result = zCreateElicitationRequest.safeParse({
      requestId: "req-1",
      mode: "form",
      message: "Enter your name",
      requestedSchema: { type: "object", properties: {} },
    });
    expect(result.success).toBe(true);
  });

  it("accepts url-mode request scoped to a session", () => {
    const result = zCreateElicitationRequest.safeParse({
      sessionId: "sess-1",
      mode: "url",
      message: "Please authenticate",
      elicitationId: "elic-1",
      url: "https://example.com/auth",
    });
    expect(result.success).toBe(true);
  });

  it("accepts url-mode request with optional toolCallId", () => {
    const result = zCreateElicitationRequest.safeParse({
      sessionId: "sess-1",
      toolCallId: "tc-1",
      mode: "url",
      message: "Please authenticate",
      elicitationId: "elic-1",
      url: "https://example.com/auth",
    });
    expect(result.success).toBe(true);
  });

  it("accepts url-mode request scoped to a request", () => {
    const result = zCreateElicitationRequest.safeParse({
      requestId: "req-1",
      mode: "url",
      message: "Please authenticate",
      elicitationId: "elic-1",
      url: "https://example.com/auth",
    });
    expect(result.success).toBe(true);
  });

  it("rejects request without mode", () => {
    const result = zCreateElicitationRequest.safeParse({
      sessionId: "sess-1",
      message: "Enter your name",
      requestedSchema: { type: "object", properties: {} },
    });
    expect(result.success).toBe(false);
  });

  it("rejects request with invalid mode", () => {
    const result = zCreateElicitationRequest.safeParse({
      sessionId: "sess-1",
      mode: "invalid",
      message: "Enter your name",
    });
    expect(result.success).toBe(false);
  });

  it("rejects request without message", () => {
    const result = zCreateElicitationRequest.safeParse({
      sessionId: "sess-1",
      mode: "form",
      requestedSchema: { type: "object", properties: {} },
    });
    expect(result.success).toBe(false);
  });

  it("rejects form-mode request without scope (no sessionId or requestId)", () => {
    const result = zCreateElicitationRequest.safeParse({
      mode: "form",
      message: "Enter your name",
      requestedSchema: { type: "object", properties: {} },
    });
    expect(result.success).toBe(false);
  });

  it("rejects url-mode request without scope (no sessionId or requestId)", () => {
    const result = zCreateElicitationRequest.safeParse({
      mode: "url",
      message: "Please authenticate",
      elicitationId: "elic-1",
      url: "https://example.com/auth",
    });
    expect(result.success).toBe(false);
  });

  it("strips unknown properties", () => {
    const result = zCreateElicitationRequest.safeParse({
      ...formSessionRequest,
      customField: "custom-value",
    });
    expect(result.success).toBe(true);
    if (result.success) {
      expect((result.data as any).customField).toBeUndefined();
    }
  });
});

describe("CreateElicitationResponse schema", () => {
  it("accepts accept action with content", () => {
    const result = zCreateElicitationResponse.safeParse({
      action: "accept",
      content: { name: "Alice" },
    });
    expect(result.success).toBe(true);
  });

  it("accepts decline action", () => {
    const result = zCreateElicitationResponse.safeParse({
      action: "decline",
    });
    expect(result.success).toBe(true);
  });

  it("accepts cancel action", () => {
    const result = zCreateElicitationResponse.safeParse({
      action: "cancel",
    });
    expect(result.success).toBe(true);
  });

  it("rejects response without action", () => {
    const result = zCreateElicitationResponse.safeParse({
      content: { name: "Alice" },
    });
    expect(result.success).toBe(false);
  });

  it("rejects response with invalid action", () => {
    const result = zCreateElicitationResponse.safeParse({
      action: "invalid",
    });
    expect(result.success).toBe(false);
  });
});
````

## File: src/acp.ts
````typescript
import { z } from "zod/v4";
import * as schema from "./schema/index.js";
import * as validate from "./schema/zod.gen.js";
export type * from "./schema/types.gen.js";
export * from "./schema/index.js";
export * from "./stream.js";

import type { Stream } from "./stream.js";
import type {
  AnyMessage,
  AnyResponse,
  Result,
  ErrorResponse,
  RequestHandler,
  NotificationHandler,
} from "./jsonrpc.js";

type ConnectionPendingResponse = {
  resolve: (response: unknown) => void;
  reject: (error: unknown) => void;
};

/**
 * An agent-side connection to a client.
 *
 * This class provides the agent's view of an ACP connection, allowing
 * agents to communicate with clients. It implements the {@link Client} interface
 * to provide methods for requesting permissions, accessing the file system,
 * and sending session updates.
 *
 * See protocol docs: [Agent](https://agentclientprotocol.com/protocol/overview#agent)
 */
export class AgentSideConnection {
  private connection: Connection;

  /**
   * Creates a new agent-side connection to a client.
   *
   * This establishes the communication channel from the agent's perspective
   * following the ACP specification.
   *
   * @param toAgent - A function that creates an Agent handler to process incoming client requests
   * @param stream - The bidirectional message stream for communication. Typically created using
   *                 {@link ndJsonStream} for stdio-based connections.
   *
   * See protocol docs: [Communication Model](https://agentclientprotocol.com/protocol/overview#communication-model)
   */
  constructor(toAgent: (conn: AgentSideConnection) => Agent, stream: Stream) {
    const agent = toAgent(this);

    const requestHandler = async (
      method: string,
      params: unknown,
    ): Promise<unknown> => {
      switch (method) {
        case schema.AGENT_METHODS.initialize: {
          const validatedParams = validate.zInitializeRequest.parse(params);
          return agent.initialize(validatedParams);
        }
        case schema.AGENT_METHODS.session_new: {
          const validatedParams = validate.zNewSessionRequest.parse(params);
          return agent.newSession(validatedParams);
        }
        case schema.AGENT_METHODS.session_load: {
          if (!agent.loadSession) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zLoadSessionRequest.parse(params);
          return agent.loadSession(validatedParams);
        }
        case schema.AGENT_METHODS.session_list: {
          if (!agent.listSessions) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zListSessionsRequest.parse(params);
          return agent.listSessions(validatedParams);
        }
        case schema.AGENT_METHODS.session_fork: {
          if (!agent.unstable_forkSession) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zForkSessionRequest.parse(params);
          return agent.unstable_forkSession(validatedParams);
        }
        case schema.AGENT_METHODS.session_resume: {
          if (!agent.resumeSession) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zResumeSessionRequest.parse(params);
          return agent.resumeSession(validatedParams);
        }
        case schema.AGENT_METHODS.session_close: {
          if (!agent.closeSession) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zCloseSessionRequest.parse(params);
          const result = await agent.closeSession(validatedParams);
          return result ?? {};
        }
        case schema.AGENT_METHODS.session_set_mode: {
          if (!agent.setSessionMode) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zSetSessionModeRequest.parse(params);
          const result = await agent.setSessionMode(validatedParams);
          return result ?? {};
        }
        case schema.AGENT_METHODS.authenticate: {
          const validatedParams = validate.zAuthenticateRequest.parse(params);
          const result = await agent.authenticate(validatedParams);
          return result ?? {};
        }
        case schema.AGENT_METHODS.providers_list: {
          if (!agent.unstable_listProviders) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zListProvidersRequest.parse(params);
          return agent.unstable_listProviders(validatedParams);
        }
        case schema.AGENT_METHODS.providers_set: {
          if (!agent.unstable_setProvider) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zSetProvidersRequest.parse(params);
          const result = await agent.unstable_setProvider(validatedParams);
          return result ?? {};
        }
        case schema.AGENT_METHODS.providers_disable: {
          if (!agent.unstable_disableProvider) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams =
            validate.zDisableProvidersRequest.parse(params);
          const result = await agent.unstable_disableProvider(validatedParams);
          return result ?? {};
        }
        case schema.AGENT_METHODS.logout: {
          if (!agent.unstable_logout) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zLogoutRequest.parse(params);
          const result = await agent.unstable_logout(validatedParams);
          return result ?? {};
        }
        case schema.AGENT_METHODS.session_prompt: {
          const validatedParams = validate.zPromptRequest.parse(params);
          return agent.prompt(validatedParams);
        }
        case schema.AGENT_METHODS.session_set_model: {
          if (!agent.unstable_setSessionModel) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams =
            validate.zSetSessionModelRequest.parse(params);
          const result = await agent.unstable_setSessionModel(validatedParams);
          return result ?? {};
        }
        case schema.AGENT_METHODS.session_set_config_option: {
          if (!agent.setSessionConfigOption) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams =
            validate.zSetSessionConfigOptionRequest.parse(params);
          return agent.setSessionConfigOption(validatedParams);
        }
        case schema.AGENT_METHODS.nes_start: {
          if (!agent.unstable_startNes) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zStartNesRequest.parse(params);
          return agent.unstable_startNes(validatedParams);
        }
        case schema.AGENT_METHODS.nes_suggest: {
          if (!agent.unstable_suggestNes) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zSuggestNesRequest.parse(params);
          return agent.unstable_suggestNes(validatedParams);
        }
        case schema.AGENT_METHODS.nes_close: {
          if (!agent.unstable_closeNes) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams = validate.zCloseNesRequest.parse(params);
          const result = await agent.unstable_closeNes(validatedParams);
          return result ?? {};
        }
        default:
          if (agent.extMethod) {
            return agent.extMethod(method, params as Record<string, unknown>);
          }
          throw RequestError.methodNotFound(method);
      }
    };

    const notificationHandler = async (
      method: string,
      params: unknown,
    ): Promise<void> => {
      switch (method) {
        case schema.AGENT_METHODS.session_cancel: {
          const validatedParams = validate.zCancelNotification.parse(params);
          return agent.cancel(validatedParams);
        }
        case schema.AGENT_METHODS.document_did_open: {
          if (!agent.unstable_didOpenDocument) return;
          const validatedParams =
            validate.zDidOpenDocumentNotification.parse(params);
          return agent.unstable_didOpenDocument(validatedParams);
        }
        case schema.AGENT_METHODS.document_did_change: {
          if (!agent.unstable_didChangeDocument) return;
          const validatedParams =
            validate.zDidChangeDocumentNotification.parse(params);
          return agent.unstable_didChangeDocument(validatedParams);
        }
        case schema.AGENT_METHODS.document_did_close: {
          if (!agent.unstable_didCloseDocument) return;
          const validatedParams =
            validate.zDidCloseDocumentNotification.parse(params);
          return agent.unstable_didCloseDocument(validatedParams);
        }
        case schema.AGENT_METHODS.document_did_save: {
          if (!agent.unstable_didSaveDocument) return;
          const validatedParams =
            validate.zDidSaveDocumentNotification.parse(params);
          return agent.unstable_didSaveDocument(validatedParams);
        }
        case schema.AGENT_METHODS.document_did_focus: {
          if (!agent.unstable_didFocusDocument) return;
          const validatedParams =
            validate.zDidFocusDocumentNotification.parse(params);
          return agent.unstable_didFocusDocument(validatedParams);
        }
        case schema.AGENT_METHODS.nes_accept: {
          if (!agent.unstable_acceptNes) return;
          const validatedParams = validate.zAcceptNesNotification.parse(params);
          return agent.unstable_acceptNes(validatedParams);
        }
        case schema.AGENT_METHODS.nes_reject: {
          if (!agent.unstable_rejectNes) return;
          const validatedParams = validate.zRejectNesNotification.parse(params);
          return agent.unstable_rejectNes(validatedParams);
        }
        default:
          if (agent.extNotification) {
            return agent.extNotification(
              method,
              params as Record<string, unknown>,
            );
          }
          throw RequestError.methodNotFound(method);
      }
    };

    this.connection = new Connection(
      requestHandler,
      notificationHandler,
      stream,
    );
  }

  /**
   * Handles session update notifications from the agent.
   *
   * This is a notification endpoint (no response expected) that sends
   * real-time updates about session progress, including message chunks,
   * tool calls, and execution plans.
   *
   * Note: Clients SHOULD continue accepting tool call updates even after
   * sending a `session/cancel` notification, as the agent may send final
   * updates before responding with the cancelled stop reason.
   *
   * See protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)
   */
  async sessionUpdate(params: schema.SessionNotification): Promise<void> {
    return await this.connection.sendNotification(
      schema.CLIENT_METHODS.session_update,
      params,
    );
  }

  /**
   * Requests permission from the user for a tool call operation.
   *
   * Called by the agent when it needs user authorization before executing
   * a potentially sensitive operation. The client should present the options
   * to the user and return their decision.
   *
   * If the client cancels the prompt turn via `session/cancel`, it MUST
   * respond to this request with `RequestPermissionOutcome::Cancelled`.
   *
   * See protocol docs: [Requesting Permission](https://agentclientprotocol.com/protocol/tool-calls#requesting-permission)
   */
  async requestPermission(
    params: schema.RequestPermissionRequest,
  ): Promise<schema.RequestPermissionResponse> {
    return await this.connection.sendRequest(
      schema.CLIENT_METHODS.session_request_permission,
      params,
    );
  }

  /**
   * Reads content from a text file in the client's file system.
   *
   * Only available if the client advertises the `fs.readTextFile` capability.
   * Allows the agent to access file contents within the client's environment.
   *
   * See protocol docs: [Client](https://agentclientprotocol.com/protocol/overview#client)
   */
  async readTextFile(
    params: schema.ReadTextFileRequest,
  ): Promise<schema.ReadTextFileResponse> {
    return await this.connection.sendRequest(
      schema.CLIENT_METHODS.fs_read_text_file,
      params,
    );
  }

  /**
   * Writes content to a text file in the client's file system.
   *
   * Only available if the client advertises the `fs.writeTextFile` capability.
   * Allows the agent to create or modify files within the client's environment.
   *
   * See protocol docs: [Client](https://agentclientprotocol.com/protocol/overview#client)
   */
  async writeTextFile(
    params: schema.WriteTextFileRequest,
  ): Promise<schema.WriteTextFileResponse> {
    return (
      (await this.connection.sendRequest(
        schema.CLIENT_METHODS.fs_write_text_file,
        params,
      )) ?? {}
    );
  }

  /**
   * Executes a command in a new terminal.
   *
   * Returns a `TerminalHandle` that can be used to get output, wait for exit,
   * kill the command, or release the terminal.
   *
   * The terminal can also be embedded in tool calls by using its ID in
   * `ToolCallContent` with type "terminal".
   *
   * @param params - The terminal creation parameters
   * @returns A handle to control and monitor the terminal
   */
  async createTerminal(
    params: schema.CreateTerminalRequest,
  ): Promise<TerminalHandle> {
    const response = await this.connection.sendRequest<
      schema.CreateTerminalRequest,
      schema.CreateTerminalResponse
    >(schema.CLIENT_METHODS.terminal_create, params);

    return new TerminalHandle(
      response.terminalId,
      params.sessionId,
      this.connection,
    );
  }

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Creates an elicitation to request input from the user.
   *
   * @experimental
   */
  async unstable_createElicitation(
    params: schema.CreateElicitationRequest,
  ): Promise<schema.CreateElicitationResponse> {
    return await this.connection.sendRequest(
      schema.CLIENT_METHODS.elicitation_create,
      params,
    );
  }

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the client that a URL-based elicitation is complete.
   *
   * @experimental
   */
  async unstable_completeElicitation(
    params: schema.CompleteElicitationNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.CLIENT_METHODS.elicitation_complete,
      params,
    );
  }

  /**
   * Extension method
   *
   * Allows the Agent to send an arbitrary request that is not part of the ACP spec.
   */
  async extMethod(
    method: string,
    params: Record<string, unknown>,
  ): Promise<Record<string, unknown>> {
    return await this.connection.sendRequest(method, params);
  }

  /**
   * Extension notification
   *
   * Allows the Agent to send an arbitrary notification that is not part of the ACP spec.
   */
  async extNotification(
    method: string,
    params: Record<string, unknown>,
  ): Promise<void> {
    return await this.connection.sendNotification(method, params);
  }

  /**
   * AbortSignal that aborts when the connection closes.
   *
   * This signal can be used to:
   * - Listen for connection closure: `connection.signal.addEventListener('abort', () => {...})`
   * - Check connection status synchronously: `if (connection.signal.aborted) {...}`
   * - Pass to other APIs (fetch, setTimeout) for automatic cancellation
   *
   * The connection closes when the underlying stream ends, either normally or due to an error.
   *
   * @example
   * ```typescript
   * const connection = new AgentSideConnection(agent, stream);
   *
   * // Listen for closure
   * connection.signal.addEventListener('abort', () => {
   *   console.log('Connection closed - performing cleanup');
   * });
   *
   * // Check status
   * if (connection.signal.aborted) {
   *   console.log('Connection is already closed');
   * }
   *
   * // Pass to other APIs
   * fetch(url, { signal: connection.signal });
   * ```
   */
  get signal(): AbortSignal {
    return this.connection.signal;
  }

  /**
   * Promise that resolves when the connection closes.
   *
   * The connection closes when the underlying stream ends, either normally or due to an error.
   * Once closed, the connection cannot send or receive any more messages.
   *
   * This is useful for async/await style cleanup:
   *
   * @example
   * ```typescript
   * const connection = new AgentSideConnection(agent, stream);
   * await connection.closed;
   * console.log('Connection closed - performing cleanup');
   * ```
   */
  get closed(): Promise<void> {
    return this.connection.closed;
  }
}

/**
 * Handle for controlling and monitoring a terminal created via `createTerminal`.
 *
 * Provides methods to:
 * - Get current output without waiting
 * - Wait for command completion
 * - Kill the running command
 * - Release terminal resources
 *
 * **Important:** Always call `release()` when done with the terminal to free resources.

 * The terminal supports async disposal via `Symbol.asyncDispose` for automatic cleanup.

 * You can use `await using` to ensure the terminal is automatically released when it
 * goes out of scope.
 */
export class TerminalHandle {
  private sessionId: string;
  private connection: Connection;

  constructor(
    public id: string,
    sessionId: string,
    conn: Connection,
  ) {
    this.sessionId = sessionId;
    this.connection = conn;
  }

  /**
   * Gets the current terminal output without waiting for the command to exit.
   */
  async currentOutput(): Promise<schema.TerminalOutputResponse> {
    return await this.connection.sendRequest(
      schema.CLIENT_METHODS.terminal_output,
      {
        sessionId: this.sessionId,
        terminalId: this.id,
      },
    );
  }

  /**
   * Waits for the terminal command to complete and returns its exit status.
   */
  async waitForExit(): Promise<schema.WaitForTerminalExitResponse> {
    return await this.connection.sendRequest(
      schema.CLIENT_METHODS.terminal_wait_for_exit,
      {
        sessionId: this.sessionId,
        terminalId: this.id,
      },
    );
  }

  /**
   * Kills the terminal command without releasing the terminal.
   *
   * The terminal remains valid after killing, allowing you to:
   * - Get the final output with `currentOutput()`
   * - Check the exit status
   * - Release the terminal when done
   *
   * Useful for implementing timeouts or cancellation.
   */
  async kill(): Promise<schema.KillTerminalResponse> {
    return (
      (await this.connection.sendRequest(schema.CLIENT_METHODS.terminal_kill, {
        sessionId: this.sessionId,
        terminalId: this.id,
      })) ?? {}
    );
  }

  /**
   * Releases the terminal and frees all associated resources.
   *
   * If the command is still running, it will be killed.
   * After release, the terminal ID becomes invalid and cannot be used
   * with other terminal methods.
   *
   * Tool calls that already reference this terminal will continue to
   * display its output.
   *
   * **Important:** Always call this method when done with the terminal.
   */
  async release(): Promise<schema.ReleaseTerminalResponse | void> {
    return (
      (await this.connection.sendRequest(
        schema.CLIENT_METHODS.terminal_release,
        {
          sessionId: this.sessionId,
          terminalId: this.id,
        },
      )) ?? {}
    );
  }

  async [Symbol.asyncDispose](): Promise<void> {
    await this.release();
  }
}

/**
 * A client-side connection to an agent.
 *
 * This class provides the client's view of an ACP connection, allowing
 * clients (such as code editors) to communicate with agents. It implements
 * the {@link Agent} interface to provide methods for initializing sessions, sending
 * prompts, and managing the agent lifecycle.
 *
 * See protocol docs: [Client](https://agentclientprotocol.com/protocol/overview#client)
 */
export class ClientSideConnection implements Agent {
  private connection: Connection;

  /**
   * Creates a new client-side connection to an agent.
   *
   * This establishes the communication channel between a client and agent
   * following the ACP specification.
   *
   * @param toClient - A function that creates a Client handler to process incoming agent requests
   * @param stream - The bidirectional message stream for communication. Typically created using
   *                 {@link ndJsonStream} for stdio-based connections.
   *
   * See protocol docs: [Communication Model](https://agentclientprotocol.com/protocol/overview#communication-model)
   */
  constructor(toClient: (agent: Agent) => Client, stream: Stream) {
    const client = toClient(this);

    const requestHandler = async (
      method: string,
      params: unknown,
    ): Promise<unknown> => {
      switch (method) {
        case schema.CLIENT_METHODS.fs_write_text_file: {
          const validatedParams = validate.zWriteTextFileRequest.parse(params);
          return client.writeTextFile?.(validatedParams);
        }
        case schema.CLIENT_METHODS.fs_read_text_file: {
          const validatedParams = validate.zReadTextFileRequest.parse(params);
          return client.readTextFile?.(validatedParams);
        }
        case schema.CLIENT_METHODS.session_request_permission: {
          const validatedParams =
            validate.zRequestPermissionRequest.parse(params);
          return client.requestPermission(validatedParams);
        }
        case schema.CLIENT_METHODS.terminal_create: {
          const validatedParams = validate.zCreateTerminalRequest.parse(params);
          return client.createTerminal?.(validatedParams);
        }
        case schema.CLIENT_METHODS.terminal_output: {
          const validatedParams = validate.zTerminalOutputRequest.parse(params);
          return client.terminalOutput?.(validatedParams);
        }
        case schema.CLIENT_METHODS.terminal_release: {
          const validatedParams =
            validate.zReleaseTerminalRequest.parse(params);
          const result = await client.releaseTerminal?.(validatedParams);
          return result ?? {};
        }
        case schema.CLIENT_METHODS.terminal_wait_for_exit: {
          const validatedParams =
            validate.zWaitForTerminalExitRequest.parse(params);
          return client.waitForTerminalExit?.(validatedParams);
        }
        case schema.CLIENT_METHODS.terminal_kill: {
          const validatedParams = validate.zKillTerminalRequest.parse(params);
          const result = await client.killTerminal?.(validatedParams);
          return result ?? {};
        }
        case schema.CLIENT_METHODS.elicitation_create: {
          if (!client.unstable_createElicitation) {
            throw RequestError.methodNotFound(method);
          }
          const validatedParams =
            validate.zCreateElicitationRequest.parse(params);
          return client.unstable_createElicitation(validatedParams);
        }
        default:
          if (client.extMethod) {
            return client.extMethod(method, params as Record<string, unknown>);
          }
          throw RequestError.methodNotFound(method);
      }
    };

    const notificationHandler = async (
      method: string,
      params: unknown,
    ): Promise<void> => {
      switch (method) {
        case schema.CLIENT_METHODS.session_update: {
          const validatedParams = validate.zSessionNotification.parse(params);
          return client.sessionUpdate(validatedParams);
        }
        case schema.CLIENT_METHODS.elicitation_complete: {
          if (!client.unstable_completeElicitation) return;
          const validatedParams =
            validate.zCompleteElicitationNotification.parse(params);
          return client.unstable_completeElicitation(validatedParams);
        }
        default:
          if (client.extNotification) {
            return client.extNotification(
              method,
              params as Record<string, unknown>,
            );
          }
          throw RequestError.methodNotFound(method);
      }
    };

    this.connection = new Connection(
      requestHandler,
      notificationHandler,
      stream,
    );
  }

  /**
   * Establishes the connection with a client and negotiates protocol capabilities.
   *
   * This method is called once at the beginning of the connection to:
   * - Negotiate the protocol version to use
   * - Exchange capability information between client and agent
   * - Determine available authentication methods
   *
   * The agent should respond with its supported protocol version and capabilities.
   *
   * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
   */
  async initialize(
    params: schema.InitializeRequest,
  ): Promise<schema.InitializeResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.initialize,
      params,
    );
  }

  /**
   * Creates a new conversation session with the agent.
   *
   * Sessions represent independent conversation contexts with their own history and state.
   *
   * The agent should:
   * - Create a new session context
   * - Connect to any specified MCP servers
   * - Return a unique session ID for future requests
   *
   * The request may include `additionalDirectories` to expand the session's filesystem
   * scope beyond `cwd` without changing the base for relative paths.
   *
   * May return an `auth_required` error if the agent requires authentication.
   *
   * See protocol docs: [Session Setup](https://agentclientprotocol.com/protocol/session-setup)
   */
  async newSession(
    params: schema.NewSessionRequest,
  ): Promise<schema.NewSessionResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.session_new,
      params,
    );
  }

  /**
   * Loads an existing session to resume a previous conversation.
   *
   * This method is only available if the agent advertises the `loadSession` capability.
   *
   * The agent should:
   * - Restore the session context and conversation history
   * - Connect to the specified MCP servers
   * - Stream the entire conversation history back to the client via notifications
   *
   * The request may include `additionalDirectories` to set the complete list of
   * additional workspace roots for the loaded session.
   *
   * See protocol docs: [Loading Sessions](https://agentclientprotocol.com/protocol/session-setup#loading-sessions)
   */
  async loadSession(
    params: schema.LoadSessionRequest,
  ): Promise<schema.LoadSessionResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.session_load,
        params,
      )) ?? {}
    );
  }

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Forks an existing session to create a new independent session.
   *
   * Creates a new session based on the context of an existing one, allowing
   * operations like generating summaries without affecting the original session's history.
   *
   * The request may include `additionalDirectories` to set the complete list of
   * additional workspace roots for the forked session.
   *
   * This method is only available if the agent advertises the `session.fork` capability.
   *
   * @experimental
   */
  async unstable_forkSession(
    params: schema.ForkSessionRequest,
  ): Promise<schema.ForkSessionResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.session_fork,
      params,
    );
  }

  /**
   * Lists existing sessions from the agent.
   *
   * This method is only available if the agent advertises the `listSessions` capability.
   *
   * Returns a list of sessions with metadata like session ID, working directory,
   * title, and last update time. Supports filtering by working directory,
   * `additionalDirectories`, and cursor-based pagination.
   */
  async listSessions(
    params: schema.ListSessionsRequest,
  ): Promise<schema.ListSessionsResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.session_list,
      params,
    );
  }

  /**
   * Resumes an existing session without returning previous messages.
   *
   * This method is only available if the agent advertises the `session.resume` capability.
   *
   * The agent should resume the session context, allowing the conversation to continue
   * without replaying the message history (unlike `session/load`).
   *
   * The request may include `additionalDirectories` to set the complete list of
   * additional workspace roots for the resumed session.
   */
  async resumeSession(
    params: schema.ResumeSessionRequest,
  ): Promise<schema.ResumeSessionResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.session_resume,
      params,
    );
  }

  /**
   * Closes an active session and frees up any resources associated with it.
   *
   * This method is only available if the agent advertises the `session.close` capability.
   *
   * The agent must cancel any ongoing work (as if `session/cancel` was called)
   * and then free up any resources associated with the session.
   */
  async closeSession(
    params: schema.CloseSessionRequest,
  ): Promise<schema.CloseSessionResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.session_close,
      params,
    );
  }

  /**
   * Sets the operational mode for a session.
   *
   * Allows switching between different agent modes (e.g., "ask", "architect", "code")
   * that affect system prompts, tool availability, and permission behaviors.
   *
   * The mode must be one of the modes advertised in `availableModes` during session
   * creation or loading. Agents may also change modes autonomously and notify the
   * client via `current_mode_update` notifications.
   *
   * This method can be called at any time during a session, whether the Agent is
   * idle or actively generating a turn.
   *
   * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
   */
  async setSessionMode(
    params: schema.SetSessionModeRequest,
  ): Promise<schema.SetSessionModeResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.session_set_mode,
        params,
      )) ?? {}
    );
  }

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Select a model for a given session.
   *
   * @experimental
   */
  async unstable_setSessionModel(
    params: schema.SetSessionModelRequest,
  ): Promise<schema.SetSessionModelResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.session_set_model,
        params,
      )) ?? {}
    );
  }

  /**
   * Set a configuration option for a given session.
   *
   * The response contains the full set of configuration options and their current values,
   * as changing one option may affect the available values or state of other options.
   */
  async setSessionConfigOption(
    params: schema.SetSessionConfigOptionRequest,
  ): Promise<schema.SetSessionConfigOptionResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.session_set_config_option,
      params,
    );
  }

  /**
   * Authenticates the client using the specified authentication method.
   *
   * Called when the agent requires authentication before allowing session creation.
   * The client provides the authentication method ID that was advertised during initialization.
   *
   * After successful authentication, the client can proceed to create sessions with
   * `newSession` without receiving an `auth_required` error.
   *
   * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
   */
  async authenticate(
    params: schema.AuthenticateRequest,
  ): Promise<schema.AuthenticateResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.authenticate,
        params,
      )) ?? {}
    );
  }

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Lists providers that can be configured by the client.
   *
   * This method is only available if the agent advertises the `providers` capability.
   *
   * @experimental
   */
  async unstable_listProviders(
    params: schema.ListProvidersRequest,
  ): Promise<schema.ListProvidersResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.providers_list,
      params,
    );
  }

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Replaces the configuration for a provider.
   *
   * This method is only available if the agent advertises the `providers` capability.
   *
   * @experimental
   */
  async unstable_setProvider(
    params: schema.SetProvidersRequest,
  ): Promise<schema.SetProvidersResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.providers_set,
        params,
      )) ?? {}
    );
  }

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Disables a provider.
   *
   * This method is only available if the agent advertises the `providers` capability.
   *
   * @experimental
   */
  async unstable_disableProvider(
    params: schema.DisableProvidersRequest,
  ): Promise<schema.DisableProvidersResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.providers_disable,
        params,
      )) ?? {}
    );
  }

  /**
   * Terminates the current authenticated session.
   *
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * @experimental
   */
  async unstable_logout(
    params: schema.LogoutRequest,
  ): Promise<schema.LogoutResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.logout,
        params,
      )) ?? {}
    );
  }

  /**
   * Processes a user prompt within a session.
   *
   * This method handles the whole lifecycle of a prompt:
   * - Receives user messages with optional context (files, images, etc.)
   * - Processes the prompt using language models
   * - Reports language model content and tool calls to the Clients
   * - Requests permission to run tools
   * - Executes any requested tool calls
   * - Returns when the turn is complete with a stop reason
   *
   * See protocol docs: [Prompt Turn](https://agentclientprotocol.com/protocol/prompt-turn)
   */
  async prompt(params: schema.PromptRequest): Promise<schema.PromptResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.session_prompt,
      params,
    );
  }

  /**
   * Cancels ongoing operations for a session.
   *
   * This is a notification sent by the client to cancel an ongoing prompt turn.
   *
   * Upon receiving this notification, the Agent SHOULD:
   * - Stop all language model requests as soon as possible
   * - Abort all tool call invocations in progress
   * - Send any pending `session/update` notifications
   * - Respond to the original `session/prompt` request with `StopReason::Cancelled`
   *
   * See protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)
   */
  async cancel(params: schema.CancelNotification): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.session_cancel,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Starts a NES (Next Edit Suggestions) session.
   *
   * @experimental
   */
  async unstable_startNes(
    params: schema.StartNesRequest,
  ): Promise<schema.StartNesResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.nes_start,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Sends a NES suggestion request.
   *
   * @experimental
   */
  async unstable_suggestNes(
    params: schema.SuggestNesRequest,
  ): Promise<schema.SuggestNesResponse> {
    return await this.connection.sendRequest(
      schema.AGENT_METHODS.nes_suggest,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Closes a NES session.
   *
   * @experimental
   */
  async unstable_closeNes(
    params: schema.CloseNesRequest,
  ): Promise<schema.CloseNesResponse> {
    return (
      (await this.connection.sendRequest(
        schema.AGENT_METHODS.nes_close,
        params,
      )) ?? {}
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the agent that a document was opened.
   *
   * @experimental
   */
  async unstable_didOpenDocument(
    params: schema.DidOpenDocumentNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.document_did_open,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the agent that a document was changed.
   *
   * @experimental
   */
  async unstable_didChangeDocument(
    params: schema.DidChangeDocumentNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.document_did_change,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the agent that a document was closed.
   *
   * @experimental
   */
  async unstable_didCloseDocument(
    params: schema.DidCloseDocumentNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.document_did_close,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the agent that a document was saved.
   *
   * @experimental
   */
  async unstable_didSaveDocument(
    params: schema.DidSaveDocumentNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.document_did_save,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the agent that a document received focus.
   *
   * @experimental
   */
  async unstable_didFocusDocument(
    params: schema.DidFocusDocumentNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.document_did_focus,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the agent that a NES suggestion was accepted.
   *
   * @experimental
   */
  async unstable_acceptNes(
    params: schema.AcceptNesNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.nes_accept,
      params,
    );
  }

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Notifies the agent that a NES suggestion was rejected.
   *
   * @experimental
   */
  async unstable_rejectNes(
    params: schema.RejectNesNotification,
  ): Promise<void> {
    return await this.connection.sendNotification(
      schema.AGENT_METHODS.nes_reject,
      params,
    );
  }

  /**
   * Extension method
   *
   * Allows the Client to send an arbitrary request that is not part of the ACP spec.
   */
  async extMethod(
    method: string,
    params: Record<string, unknown>,
  ): Promise<Record<string, unknown>> {
    return await this.connection.sendRequest(method, params);
  }

  /**
   * Extension notification
   *
   * Allows the Client to send an arbitrary notification that is not part of the ACP spec.
   */
  async extNotification(
    method: string,
    params: Record<string, unknown>,
  ): Promise<void> {
    return await this.connection.sendNotification(method, params);
  }

  /**
   * AbortSignal that aborts when the connection closes.
   *
   * This signal can be used to:
   * - Listen for connection closure: `connection.signal.addEventListener('abort', () => {...})`
   * - Check connection status synchronously: `if (connection.signal.aborted) {...}`
   * - Pass to other APIs (fetch, setTimeout) for automatic cancellation
   *
   * The connection closes when the underlying stream ends, either normally or due to an error.
   *
   * @example
   * ```typescript
   * const connection = new ClientSideConnection(client, stream);
   *
   * // Listen for closure
   * connection.signal.addEventListener('abort', () => {
   *   console.log('Connection closed - performing cleanup');
   * });
   *
   * // Check status
   * if (connection.signal.aborted) {
   *   console.log('Connection is already closed');
   * }
   *
   * // Pass to other APIs
   * fetch(url, { signal: connection.signal });
   * ```
   */
  get signal(): AbortSignal {
    return this.connection.signal;
  }

  /**
   * Promise that resolves when the connection closes.
   *
   * The connection closes when the underlying stream ends, either normally or due to an error.
   * Once closed, the connection cannot send or receive any more messages.
   *
   * This is useful for async/await style cleanup:
   *
   * @example
   * ```typescript
   * const connection = new ClientSideConnection(client, stream);
   * await connection.closed;
   * console.log('Connection closed - performing cleanup');
   * ```
   */
  get closed(): Promise<void> {
    return this.connection.closed;
  }
}

export type { AnyMessage } from "./jsonrpc.js";

class Connection {
  private pendingResponses: Map<
    string | number | null,
    ConnectionPendingResponse
  > = new Map();
  private nextRequestId: number = 0;
  private requestHandler: RequestHandler;
  private notificationHandler: NotificationHandler;
  private stream: Stream;
  private writeQueue: Promise<void> = Promise.resolve();
  private abortController = new AbortController();
  private closedPromise: Promise<void>;

  constructor(
    requestHandler: RequestHandler,
    notificationHandler: NotificationHandler,
    stream: Stream,
  ) {
    this.requestHandler = requestHandler;
    this.notificationHandler = notificationHandler;
    this.stream = stream;
    this.closedPromise = new Promise((resolve) => {
      this.abortController.signal.addEventListener("abort", () => resolve());
    });
    void this.receive();
  }

  /**
   * AbortSignal that aborts when the connection closes.
   *
   * This signal can be used to:
   * - Listen for connection closure via event listeners
   * - Check connection status synchronously with `signal.aborted`
   * - Pass to other APIs (fetch, setTimeout) for automatic cancellation
   */
  get signal(): AbortSignal {
    return this.abortController.signal;
  }

  /**
   * Promise that resolves when the connection closes.
   *
   * The connection closes when the underlying stream ends, either normally
   * or due to an error. Once closed, the connection cannot send or receive
   * any more messages.
   *
   * @example
   * ```typescript
   * const connection = new ClientSideConnection(client, stream);
   * await connection.closed;
   * console.log('Connection closed - performing cleanup');
   * ```
   */
  get closed(): Promise<void> {
    return this.closedPromise;
  }

  private async receive() {
    let closeError: unknown = undefined;

    try {
      const reader = this.stream.readable.getReader();
      try {
        while (!this.abortController.signal.aborted) {
          const { value: message, done } = await reader.read();
          if (done) {
            break;
          }
          if (!message) {
            continue;
          }

          try {
            this.processMessage(message);
          } catch (err) {
            console.error(
              "Unexpected error during message processing:",
              message,
              err,
            );
            // Only send error response if the message had an id (was a request)
            if ("id" in message && message.id !== undefined) {
              this.sendMessage({
                jsonrpc: "2.0",
                id: message.id,
                error: {
                  code: -32700,
                  message: "Parse error",
                },
              });
            }
          }
        }
      } finally {
        reader.releaseLock();
      }
    } catch (error) {
      closeError = error;
    } finally {
      this.close(closeError);
    }
  }

  private close(error?: unknown) {
    if (this.abortController.signal.aborted) {
      return;
    }

    const closeError: unknown = error ?? new Error("ACP connection closed");
    for (const pendingResponse of this.pendingResponses.values()) {
      pendingResponse.reject(closeError);
    }
    this.pendingResponses.clear();
    this.abortController.abort(closeError);
  }

  private async processMessage(message: AnyMessage) {
    if ("method" in message && "id" in message) {
      // It's a request
      const response = await this.tryCallRequestHandler(
        message.method,
        message.params,
      );
      if ("error" in response) {
        console.error("Error handling request", message, response.error);
      }

      await this.sendMessage({
        jsonrpc: "2.0",
        id: message.id,
        ...response,
      });
    } else if ("method" in message) {
      // It's a notification
      const response = await this.tryCallNotificationHandler(
        message.method,
        message.params,
      );
      if ("error" in response) {
        console.error("Error handling notification", message, response.error);
      }
    } else if ("id" in message) {
      // It's a response
      this.handleResponse(message);
    } else {
      console.error("Invalid message", { message });
    }
  }

  private async tryCallRequestHandler(
    method: string,
    params: unknown,
  ): Promise<Result<unknown>> {
    try {
      const result = await this.requestHandler(method, params);
      return { result: result ?? null };
    } catch (error: unknown) {
      if (error instanceof RequestError) {
        return error.toResult();
      }

      if (error instanceof z.ZodError) {
        return RequestError.invalidParams(error.format()).toResult();
      }

      let details;

      if (error instanceof Error) {
        details = error.message;
      } else if (
        typeof error === "object" &&
        error != null &&
        "message" in error &&
        typeof error.message === "string"
      ) {
        details = error.message;
      }

      try {
        return RequestError.internalError(
          details ? JSON.parse(details) : {},
        ).toResult();
      } catch {
        return RequestError.internalError({ details }).toResult();
      }
    }
  }

  private async tryCallNotificationHandler(
    method: string,
    params: unknown,
  ): Promise<Result<unknown>> {
    try {
      await this.notificationHandler(method, params);
      return { result: null };
    } catch (error: unknown) {
      if (error instanceof RequestError) {
        return error.toResult();
      }

      if (error instanceof z.ZodError) {
        return RequestError.invalidParams(error.format()).toResult();
      }

      let details;

      if (error instanceof Error) {
        details = error.message;
      } else if (
        typeof error === "object" &&
        error != null &&
        "message" in error &&
        typeof error.message === "string"
      ) {
        details = error.message;
      }

      try {
        return RequestError.internalError(
          details ? JSON.parse(details) : {},
        ).toResult();
      } catch {
        return RequestError.internalError({ details }).toResult();
      }
    }
  }

  private handleResponse(response: AnyResponse) {
    const pendingResponse = this.pendingResponses.get(response.id);
    if (pendingResponse) {
      if ("result" in response) {
        pendingResponse.resolve(response.result);
      } else if ("error" in response) {
        const { code, message, data } = response.error;
        pendingResponse.reject(new RequestError(code, message, data));
      }
      this.pendingResponses.delete(response.id);
    } else {
      console.error("Got response to unknown request", response.id);
    }
  }

  sendRequest<Req, Resp>(method: string, params?: Req): Promise<Resp> {
    this.throwIfClosed();
    const id = this.nextRequestId++;
    const responsePromise = new Promise((resolve, reject) => {
      this.pendingResponses.set(id, { resolve, reject });
    });
    // If the transport fails (or receive observes stream closure) during the
    // `sendMessage` below, close() will reject `responsePromise`
    // before the caller has had a chance to attach its own handler. Node then
    // reports a spurious `unhandledRejection`, even though the caller's
    // subsequent `await` does observe the rejection. Attach a noop catch so
    // the rejection is considered handled at the time it's raised; the
    // rejection is still delivered to the caller via `return responsePromise`.
    responsePromise.catch(() => {});
    void this.sendMessage({ jsonrpc: "2.0", id, method, params });
    return responsePromise as Promise<Resp>;
  }

  async sendNotification<N>(method: string, params?: N): Promise<void> {
    this.throwIfClosed();
    await this.sendMessage({ jsonrpc: "2.0", method, params });
  }

  private throwIfClosed() {
    if (this.abortController.signal.aborted) {
      throw (
        this.abortController.signal.reason ?? new Error("ACP connection closed")
      );
    }
  }

  private async sendMessage(message: AnyMessage) {
    this.writeQueue = this.writeQueue
      .then(async () => {
        const writer = this.stream.writable.getWriter();
        try {
          await writer.write(message);
        } finally {
          writer.releaseLock();
        }
      })
      .catch((error) => {
        this.close(error);
      });
    return this.writeQueue;
  }
}

/**
 * JSON-RPC error object.
 *
 * Represents an error that occurred during method execution, following the
 * JSON-RPC 2.0 error object specification with optional additional data.
 *
 * See protocol docs: [JSON-RPC Error Object](https://www.jsonrpc.org/specification#error_object)
 */
export class RequestError extends Error {
  data?: unknown;

  constructor(
    public code: number,
    message: string,
    data?: unknown,
  ) {
    super(message);
    this.name = "RequestError";
    this.data = data;
  }

  /**
   * Invalid JSON was received by the server. An error occurred on the server while parsing the JSON text.
   */
  static parseError(data?: unknown, additionalMessage?: string): RequestError {
    return new RequestError(
      -32700,
      `Parse error${additionalMessage ? `: ${additionalMessage}` : ""}`,
      data,
    );
  }

  /**
   * The JSON sent is not a valid Request object.
   */
  static invalidRequest(
    data?: unknown,
    additionalMessage?: string,
  ): RequestError {
    return new RequestError(
      -32600,
      `Invalid request${additionalMessage ? `: ${additionalMessage}` : ""}`,
      data,
    );
  }

  /**
   * The method does not exist / is not available.
   */
  static methodNotFound(method: string): RequestError {
    return new RequestError(-32601, `"Method not found": ${method}`, {
      method,
    });
  }

  /**
   * Invalid method parameter(s).
   */
  static invalidParams(
    data?: unknown,
    additionalMessage?: string,
  ): RequestError {
    return new RequestError(
      -32602,
      `Invalid params${additionalMessage ? `: ${additionalMessage}` : ""}`,
      data,
    );
  }

  /**
   * Internal JSON-RPC error.
   */
  static internalError(
    data?: unknown,
    additionalMessage?: string,
  ): RequestError {
    return new RequestError(
      -32603,
      `Internal error${additionalMessage ? `: ${additionalMessage}` : ""}`,
      data,
    );
  }

  /**
   * Authentication required.
   */
  static authRequired(
    data?: unknown,
    additionalMessage?: string,
  ): RequestError {
    return new RequestError(
      -32000,
      `Authentication required${additionalMessage ? `: ${additionalMessage}` : ""}`,
      data,
    );
  }

  /**
   * Resource, such as a file, was not found
   */
  static resourceNotFound(uri?: string): RequestError {
    return new RequestError(
      -32002,
      `Resource not found${uri ? `: ${uri}` : ""}`,
      uri && { uri },
    );
  }

  toResult<T>(): Result<T> {
    return {
      error: {
        code: this.code,
        message: this.message,
        data: this.data,
      },
    };
  }

  toErrorResponse(): ErrorResponse {
    return {
      code: this.code,
      message: this.message,
      data: this.data,
    };
  }
}

/**
 * The Client interface defines the interface that ACP-compliant clients must implement.
 *
 * Clients are typically code editors (IDEs, text editors) that provide the interface
 * between users and AI agents. They manage the environment, handle user interactions,
 * and control access to resources.
 */
export interface Client {
  /**
   * Requests permission from the user for a tool call operation.
   *
   * Called by the agent when it needs user authorization before executing
   * a potentially sensitive operation. The client should present the options
   * to the user and return their decision.
   *
   * If the client cancels the prompt turn via `session/cancel`, it MUST
   * respond to this request with `RequestPermissionOutcome::Cancelled`.
   *
   * See protocol docs: [Requesting Permission](https://agentclientprotocol.com/protocol/tool-calls#requesting-permission)
   */
  requestPermission(
    params: schema.RequestPermissionRequest,
  ): Promise<schema.RequestPermissionResponse>;
  /**
   * Handles session update notifications from the agent.
   *
   * This is a notification endpoint (no response expected) that receives
   * real-time updates about session progress, including message chunks,
   * tool calls, and execution plans.
   *
   * Note: Clients SHOULD continue accepting tool call updates even after
   * sending a `session/cancel` notification, as the agent may send final
   * updates before responding with the cancelled stop reason.
   *
   * See protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)
   */
  sessionUpdate(params: schema.SessionNotification): Promise<void>;
  /**
   * Writes content to a text file in the client's file system.
   *
   * Only available if the client advertises the `fs.writeTextFile` capability.
   * Allows the agent to create or modify files within the client's environment.
   *
   * See protocol docs: [Client](https://agentclientprotocol.com/protocol/overview#client)
   */
  writeTextFile?(
    params: schema.WriteTextFileRequest,
  ): Promise<schema.WriteTextFileResponse>;
  /**
   * Reads content from a text file in the client's file system.
   *
   * Only available if the client advertises the `fs.readTextFile` capability.
   * Allows the agent to access file contents within the client's environment.
   *
   * See protocol docs: [Client](https://agentclientprotocol.com/protocol/overview#client)
   */
  readTextFile?(
    params: schema.ReadTextFileRequest,
  ): Promise<schema.ReadTextFileResponse>;

  /**
   * Creates a new terminal to execute a command.
   *
   * Only available if the `terminal` capability is set to `true`.
   *
   * The Agent must call `releaseTerminal` when done with the terminal
   * to free resources.

   * @see {@link https://agentclientprotocol.com/protocol/terminals | Terminal Documentation}
   */
  createTerminal?(
    params: schema.CreateTerminalRequest,
  ): Promise<schema.CreateTerminalResponse>;

  /**
   * Gets the current output and exit status of a terminal.
   *
   * Returns immediately without waiting for the command to complete.
   * If the command has already exited, the exit status is included.
   *
   * @see {@link https://agentclientprotocol.com/protocol/terminals#getting-output | Getting Terminal Output}
   */
  terminalOutput?(
    params: schema.TerminalOutputRequest,
  ): Promise<schema.TerminalOutputResponse>;

  /**
   * Releases a terminal and frees all associated resources.
   *
   * The command is killed if it hasn't exited yet. After release,
   * the terminal ID becomes invalid for all other terminal methods.
   *
   * Tool calls that already contain the terminal ID continue to
   * display its output.
   *
   * @see {@link https://agentclientprotocol.com/protocol/terminals#releasing-terminals | Releasing Terminals}
   */
  releaseTerminal?(
    params: schema.ReleaseTerminalRequest,
  ): Promise<schema.ReleaseTerminalResponse | void>;

  /**
   * Waits for a terminal command to exit and returns its exit status.
   *
   * This method returns once the command completes, providing the
   * exit code and/or signal that terminated the process.
   *
   * @see {@link https://agentclientprotocol.com/protocol/terminals#waiting-for-exit | Waiting for Exit}
   */
  waitForTerminalExit?(
    params: schema.WaitForTerminalExitRequest,
  ): Promise<schema.WaitForTerminalExitResponse>;

  /**
   * Kills a terminal command without releasing the terminal.
   *
   * While `releaseTerminal` also kills the command, this method keeps
   * the terminal ID valid so it can be used with other methods.
   *
   * Useful for implementing command timeouts that terminate the command
   * and then retrieve the final output.
   *
   * Note: Call `releaseTerminal` when the terminal is no longer needed.
   *
   * @see {@link https://agentclientprotocol.com/protocol/terminals#killing-commands | Killing Commands}
   */
  killTerminal?(
    params: schema.KillTerminalRequest,
  ): Promise<schema.KillTerminalResponse | void>;

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Creates an elicitation to request input from the user.
   *
   * @experimental
   */
  unstable_createElicitation?(
    params: schema.CreateElicitationRequest,
  ): Promise<schema.CreateElicitationResponse>;

  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a URL-based elicitation is complete.
   *
   * @experimental
   */
  unstable_completeElicitation?(
    params: schema.CompleteElicitationNotification,
  ): Promise<void>;

  /**
   * Extension method
   *
   * Allows the Agent to send an arbitrary request that is not part of the ACP spec.
   *
   * To help avoid conflicts, it's a good practice to prefix extension
   * methods with a unique identifier such as domain name.
   */
  extMethod?(
    method: string,
    params: Record<string, unknown>,
  ): Promise<Record<string, unknown>>;

  /**
   * Extension notification
   *
   * Allows the Agent to send an arbitrary notification that is not part of the ACP spec.
   */
  extNotification?(
    method: string,
    params: Record<string, unknown>,
  ): Promise<void>;
}

/**
 * The Agent interface defines the interface that all ACP-compliant agents must implement.
 *
 * Agents are programs that use generative AI to autonomously modify code. They handle
 * requests from clients and execute tasks using language models and tools.
 */
export interface Agent {
  /**
   * Establishes the connection with a client and negotiates protocol capabilities.
   *
   * This method is called once at the beginning of the connection to:
   * - Negotiate the protocol version to use
   * - Exchange capability information between client and agent
   * - Determine available authentication methods
   *
   * The agent should respond with its supported protocol version and capabilities.
   *
   * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
   */
  initialize(
    params: schema.InitializeRequest,
  ): Promise<schema.InitializeResponse>;
  /**
   * Creates a new conversation session with the agent.
   *
   * Sessions represent independent conversation contexts with their own history and state.
   *
   * The agent should:
   * - Create a new session context
   * - Connect to any specified MCP servers
   * - Return a unique session ID for future requests
   *
   * The request may include `additionalDirectories` to expand the session's filesystem
   * scope beyond `cwd` without changing the base for relative paths.
   *
   * May return an `auth_required` error if the agent requires authentication.
   *
   * See protocol docs: [Session Setup](https://agentclientprotocol.com/protocol/session-setup)
   */
  newSession(
    params: schema.NewSessionRequest,
  ): Promise<schema.NewSessionResponse>;
  /**
   * Loads an existing session to resume a previous conversation.
   *
   * This method is only available if the agent advertises the `loadSession` capability.
   *
   * The agent should:
   * - Restore the session context and conversation history
   * - Connect to the specified MCP servers
   * - Stream the entire conversation history back to the client via notifications
   *
   * The request may include `additionalDirectories` to set the complete list of
   * additional workspace roots for the loaded session.
   *
   * See protocol docs: [Loading Sessions](https://agentclientprotocol.com/protocol/session-setup#loading-sessions)
   */
  loadSession?(
    params: schema.LoadSessionRequest,
  ): Promise<schema.LoadSessionResponse>;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Forks an existing session to create a new independent session.
   *
   * Creates a new session based on the context of an existing one, allowing
   * operations like generating summaries without affecting the original session's history.
   *
   * The request may include `additionalDirectories` to set the complete list of
   * additional workspace roots for the forked session.
   *
   * This method is only available if the agent advertises the `session.fork` capability.
   *
   * @experimental
   */
  unstable_forkSession?(
    params: schema.ForkSessionRequest,
  ): Promise<schema.ForkSessionResponse>;
  /**
   * Lists existing sessions from the agent.
   *
   * This method is only available if the agent advertises the `listSessions` capability.
   *
   * Returns a list of sessions with metadata like session ID, working directory,
   * title, and last update time. Supports filtering by working directory,
   * `additionalDirectories`, and cursor-based pagination.
   */
  listSessions?(
    params: schema.ListSessionsRequest,
  ): Promise<schema.ListSessionsResponse>;
  /**
   * Resumes an existing session without returning previous messages.
   *
   * This method is only available if the agent advertises the `session.resume` capability.
   *
   * The agent should resume the session context, allowing the conversation to continue
   * without replaying the message history (unlike `session/load`).
   *
   * The request may include `additionalDirectories` to set the complete list of
   * additional workspace roots for the resumed session.
   */
  resumeSession?(
    params: schema.ResumeSessionRequest,
  ): Promise<schema.ResumeSessionResponse>;
  /**
   * Closes an active session and frees up any resources associated with it.
   *
   * This method is only available if the agent advertises the `session.close` capability.
   *
   * The agent must cancel any ongoing work (as if `session/cancel` was called)
   * and then free up any resources associated with the session.
   */
  closeSession?(
    params: schema.CloseSessionRequest,
  ): Promise<schema.CloseSessionResponse | void>;
  /**
   * Sets the operational mode for a session.
   *
   * Allows switching between different agent modes (e.g., "ask", "architect", "code")
   * that affect system prompts, tool availability, and permission behaviors.
   *
   * The mode must be one of the modes advertised in `availableModes` during session
   * creation or loading. Agents may also change modes autonomously and notify the
   * client via `current_mode_update` notifications.
   *
   * This method can be called at any time during a session, whether the Agent is
   * idle or actively generating a turn.
   *
   * See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
   */
  setSessionMode?(
    params: schema.SetSessionModeRequest,
  ): Promise<schema.SetSessionModeResponse | void>;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Select a model for a given session.
   *
   * @experimental
   */
  unstable_setSessionModel?(
    params: schema.SetSessionModelRequest,
  ): Promise<schema.SetSessionModelResponse | void>;
  /**
   * Set a configuration option for a given session.
   *
   * The response contains the full set of configuration options and their current values,
   * as changing one option may affect the available values or state of other options.
   */
  setSessionConfigOption?(
    params: schema.SetSessionConfigOptionRequest,
  ): Promise<schema.SetSessionConfigOptionResponse>;
  /**
   * Authenticates the client using the specified authentication method.
   *
   * Called when the agent requires authentication before allowing session creation.
   * The client provides the authentication method ID that was advertised during initialization.
   *
   * After successful authentication, the client can proceed to create sessions with
   * `newSession` without receiving an `auth_required` error.
   *
   * See protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)
   */
  authenticate(
    params: schema.AuthenticateRequest,
  ): Promise<schema.AuthenticateResponse | void>;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Lists providers that can be configured by the client.
   *
   * This method is only available if the agent advertises the `providers` capability.
   *
   * @experimental
   */
  unstable_listProviders?(
    params: schema.ListProvidersRequest,
  ): Promise<schema.ListProvidersResponse>;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Replaces the configuration for a provider.
   *
   * This method is only available if the agent advertises the `providers` capability.
   *
   * @experimental
   */
  unstable_setProvider?(
    params: schema.SetProvidersRequest,
  ): Promise<schema.SetProvidersResponse | void>;
  /**
   * **UNSTABLE**
   *
   * This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Disables a provider.
   *
   * This method is only available if the agent advertises the `providers` capability.
   *
   * @experimental
   */
  unstable_disableProvider?(
    params: schema.DisableProvidersRequest,
  ): Promise<schema.DisableProvidersResponse | void>;
  /**
   * Terminates the current authenticated session.
   *
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * @experimental
   */

  unstable_logout?(
    params: schema.LogoutRequest,
  ): Promise<schema.LogoutResponse | void>;
  /**
   * Processes a user prompt within a session.
   *
   * This method handles the whole lifecycle of a prompt:
   * - Receives user messages with optional context (files, images, etc.)
   * - Processes the prompt using language models
   * - Reports language model content and tool calls to the Clients
   * - Requests permission to run tools
   * - Executes any requested tool calls
   * - Returns when the turn is complete with a stop reason
   *
   * See protocol docs: [Prompt Turn](https://agentclientprotocol.com/protocol/prompt-turn)
   */
  prompt(params: schema.PromptRequest): Promise<schema.PromptResponse>;
  /**
   * Cancels ongoing operations for a session.
   *
   * This is a notification sent by the client to cancel an ongoing prompt turn.
   *
   * Upon receiving this notification, the Agent SHOULD:
   * - Stop all language model requests as soon as possible
   * - Abort all tool call invocations in progress
   * - Send any pending `session/update` notifications
   * - Respond to the original `session/prompt` request with `StopReason::Cancelled`
   *
   * See protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)
   */
  cancel(params: schema.CancelNotification): Promise<void>;

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Starts a NES (Next Edit Suggestions) session.
   *
   * @experimental
   */
  unstable_startNes?(
    params: schema.StartNesRequest,
  ): Promise<schema.StartNesResponse>;
  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Sends a NES suggestion request.
   *
   * @experimental
   */
  unstable_suggestNes?(
    params: schema.SuggestNesRequest,
  ): Promise<schema.SuggestNesResponse>;
  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Closes a NES session.
   *
   * @experimental
   */
  unstable_closeNes?(
    params: schema.CloseNesRequest,
  ): Promise<schema.CloseNesResponse | void>;

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a document is opened.
   *
   * @experimental
   */
  unstable_didOpenDocument?(
    params: schema.DidOpenDocumentNotification,
  ): Promise<void>;
  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a document is changed.
   *
   * @experimental
   */
  unstable_didChangeDocument?(
    params: schema.DidChangeDocumentNotification,
  ): Promise<void>;
  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a document is closed.
   *
   * @experimental
   */
  unstable_didCloseDocument?(
    params: schema.DidCloseDocumentNotification,
  ): Promise<void>;
  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a document is saved.
   *
   * @experimental
   */
  unstable_didSaveDocument?(
    params: schema.DidSaveDocumentNotification,
  ): Promise<void>;
  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a document receives focus.
   *
   * @experimental
   */
  unstable_didFocusDocument?(
    params: schema.DidFocusDocumentNotification,
  ): Promise<void>;

  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a NES suggestion is accepted.
   *
   * @experimental
   */
  unstable_acceptNes?(params: schema.AcceptNesNotification): Promise<void>;
  /**
   * **UNSTABLE**: This capability is not part of the spec yet, and may be removed or changed at any point.
   *
   * Called when a NES suggestion is rejected.
   *
   * @experimental
   */
  unstable_rejectNes?(params: schema.RejectNesNotification): Promise<void>;

  /**
   * Extension method
   *
   * Allows the Client to send an arbitrary request that is not part of the ACP spec.
   *
   * To help avoid conflicts, it's a good practice to prefix extension
   * methods with a unique identifier such as domain name.
   */
  extMethod?(
    method: string,
    params: Record<string, unknown>,
  ): Promise<Record<string, unknown>>;

  /**
   * Extension notification
   *
   * Allows the Client to send an arbitrary notification that is not part of the ACP spec.
   */
  extNotification?(
    method: string,
    params: Record<string, unknown>,
  ): Promise<void>;
}
````

## File: src/jsonrpc.ts
````typescript
/**
 * JSON-RPC 2.0 type definitions for internal use.
 */

export type AnyMessage = AnyRequest | AnyResponse | AnyNotification;

export type AnyRequest = {
  jsonrpc: "2.0";
  id: string | number | null;
  method: string;
  params?: unknown;
};

export type AnyResponse = {
  jsonrpc: "2.0";
  id: string | number | null;
} & Result<unknown>;

export type AnyNotification = {
  jsonrpc: "2.0";
  method: string;
  params?: unknown;
};

export type Result<T> =
  | {
      result: T;
    }
  | {
      error: ErrorResponse;
    };

export type ErrorResponse = {
  code: number;
  message: string;
  data?: unknown;
};

export type RequestHandler = (
  method: string,
  params: unknown,
) => Promise<unknown>;
export type NotificationHandler = (
  method: string,
  params: unknown,
) => Promise<void>;
````

## File: src/stream.test.ts
````typescript
import { describe, it, expect } from "vitest";
import { ndJsonStream } from "./stream.js";
import type { AnyMessage } from "./jsonrpc.js";

function readableFromChunks(chunks: Uint8Array[]): ReadableStream<Uint8Array> {
  return new ReadableStream({
    start(controller) {
      for (const chunk of chunks) {
        controller.enqueue(chunk);
      }
      controller.close();
    },
  });
}

async function collectMessages(
  readable: ReadableStream<AnyMessage>,
): Promise<AnyMessage[]> {
  const messages: AnyMessage[] = [];
  const reader = readable.getReader();
  while (true) {
    const { value, done } = await reader.read();
    if (done) break;
    messages.push(value);
  }
  return messages;
}

describe("ndJsonStream", () => {
  const nullWritable = new WritableStream<Uint8Array>();

  it("parses a single message", async () => {
    const msg = { jsonrpc: "2.0" as const, id: 1, method: "test" };
    const input = readableFromChunks([
      new TextEncoder().encode(JSON.stringify(msg) + "\n"),
    ]);

    const { readable } = ndJsonStream(nullWritable, input);
    const messages = await collectMessages(readable);

    expect(messages).toEqual([msg]);
  });

  it("parses multiple messages", async () => {
    const msg1 = { jsonrpc: "2.0" as const, id: 1, method: "first" };
    const msg2 = { jsonrpc: "2.0" as const, id: 2, method: "second" };
    const input = readableFromChunks([
      new TextEncoder().encode(
        JSON.stringify(msg1) + "\n" + JSON.stringify(msg2) + "\n",
      ),
    ]);

    const { readable } = ndJsonStream(nullWritable, input);
    const messages = await collectMessages(readable);

    expect(messages).toEqual([msg1, msg2]);
  });

  it("parses a message split across chunks", async () => {
    const msg = { jsonrpc: "2.0" as const, id: 1, method: "split" };
    const full = JSON.stringify(msg) + "\n";
    const mid = Math.floor(full.length / 2);
    const encoder = new TextEncoder();

    const input = readableFromChunks([
      encoder.encode(full.slice(0, mid)),
      encoder.encode(full.slice(mid)),
    ]);

    const { readable } = ndJsonStream(nullWritable, input);
    const messages = await collectMessages(readable);

    expect(messages).toEqual([msg]);
  });

  it("handles multi-byte UTF-8 characters split across chunks", async () => {
    const msg = {
      jsonrpc: "2.0" as const,
      id: 1,
      method: "test",
      params: { text: "héllo wörld" },
    };
    const bytes = new TextEncoder().encode(JSON.stringify(msg) + "\n");

    // Find the byte offset of 'é' (0xC3 0xA9) and split between its two bytes
    const éOffset = bytes.indexOf(0xc3);
    expect(éOffset).toBeGreaterThan(0);

    const input = readableFromChunks([
      bytes.slice(0, éOffset + 1), // includes 0xC3 but not 0xA9
      bytes.slice(éOffset + 1), // starts with 0xA9
    ]);

    const { readable } = ndJsonStream(nullWritable, input);
    const messages = await collectMessages(readable);

    expect(messages).toEqual([msg]);
  });

  it("parses a final message without trailing newline", async () => {
    const msg = { jsonrpc: "2.0" as const, id: 1, method: "unterminated" };
    const input = readableFromChunks([
      new TextEncoder().encode(JSON.stringify(msg)), // no \n
    ]);

    const { readable } = ndJsonStream(nullWritable, input);
    const messages = await collectMessages(readable);

    expect(messages).toEqual([msg]);
  });

  it("parses a final message without trailing newline with multi-byte chars split across chunks", async () => {
    const msg = {
      jsonrpc: "2.0" as const,
      id: 1,
      method: "tëst",
    };
    const bytes = new TextEncoder().encode(JSON.stringify(msg)); // no \n
    const éOffset = bytes.indexOf(0xc3);
    expect(éOffset).toBeGreaterThan(0);

    const input = readableFromChunks([
      bytes.slice(0, éOffset + 1), // includes 0xC3 but not 0xAB
      bytes.slice(éOffset + 1),
    ]);

    const { readable } = ndJsonStream(nullWritable, input);
    const messages = await collectMessages(readable);

    expect(messages).toEqual([msg]);
  });

  it("skips malformed lines and continues parsing", async () => {
    const msg1 = { jsonrpc: "2.0" as const, id: 1, method: "before" };
    const msg2 = { jsonrpc: "2.0" as const, id: 2, method: "after" };
    const input = readableFromChunks([
      new TextEncoder().encode(
        JSON.stringify(msg1) +
          "\n" +
          "not valid json\n" +
          JSON.stringify(msg2) +
          "\n",
      ),
    ]);

    const { readable } = ndJsonStream(nullWritable, input);
    const messages = await collectMessages(readable);

    expect(messages).toEqual([msg1, msg2]);
  });
});
````

## File: src/stream.ts
````typescript
import type { AnyMessage } from "./jsonrpc.js";

/**
 * Stream interface for ACP connections.
 *
 * This type powers the bidirectional communication for an ACP connection,
 * providing readable and writable streams of messages.
 *
 * The most common way to create a Stream is using {@link ndJsonStream}.
 */
export type Stream = {
  writable: WritableStream<AnyMessage>;
  readable: ReadableStream<AnyMessage>;
};

/**
 * Creates an ACP Stream from a pair of newline-delimited JSON streams.
 *
 * This is the typical way to handle ACP connections over stdio, converting
 * between AnyMessage objects and newline-delimited JSON.
 *
 * @param output - The writable stream to send encoded messages to
 * @param input - The readable stream to receive encoded messages from
 * @returns A Stream for bidirectional ACP communication
 */
export function ndJsonStream(
  output: WritableStream<Uint8Array>,
  input: ReadableStream<Uint8Array>,
): Stream {
  const textEncoder = new TextEncoder();
  const textDecoder = new TextDecoder();

  const readable = new ReadableStream<AnyMessage>({
    async start(controller) {
      let content = "";
      const reader = input.getReader();
      try {
        while (true) {
          const { value, done } = await reader.read();
          if (done) {
            content += textDecoder.decode();
            break;
          }
          if (!value) {
            continue;
          }
          content += textDecoder.decode(value, { stream: true });
          const lines = content.split("\n");
          content = lines.pop() || "";

          for (const line of lines) {
            const trimmedLine = line.trim();
            if (trimmedLine) {
              try {
                const message = JSON.parse(trimmedLine) as AnyMessage;
                controller.enqueue(message);
              } catch (err) {
                console.error(
                  "Failed to parse JSON message:",
                  trimmedLine,
                  err,
                );
              }
            }
          }
        }
        const trimmedLine = content.trim();
        if (trimmedLine) {
          try {
            const message = JSON.parse(trimmedLine) as AnyMessage;
            controller.enqueue(message);
          } catch (err) {
            console.error("Failed to parse JSON message:", trimmedLine, err);
          }
        }
      } catch (err) {
        controller.error(err);
        return;
      } finally {
        reader.releaseLock();
      }
      controller.close();
    },
  });

  const writable = new WritableStream<AnyMessage>({
    async write(message) {
      const content = JSON.stringify(message) + "\n";
      const writer = output.getWriter();
      try {
        await writer.write(textEncoder.encode(content));
      } finally {
        writer.releaseLock();
      }
    },
  });

  return { readable, writable };
}
````

## File: src/typedoc.json
````json
{
  "$schema": "https://typedoc.org/schema.json",
  "name": "Agent Client Protocol",
  "entryPoints": ["./acp.ts"],
  "out": "./docs",
  "navigationLinks": {
    "Protocol Docs": "https://agentclientprotocol.com",
    "GitHub": "https://github.com/agentclientprotocol/typescript-sdk",
    "NPM": "https://www.npmjs.com/package/@agentclientprotocol/sdk"
  },
  "tsconfig": "../tsconfig.json",
  "excludePrivate": true,
  "excludeProtected": true,
  "excludeInternal": true,
  "excludeExternals": false,
  "includeVersion": true,
  "searchInComments": true,
  "categorizeByGroup": true,
  "sort": ["source-order"],
  "visibilityFilters": {
    "protected": false,
    "private": false,
    "inherited": true,
    "external": false
  },
  "plugin": ["typedoc-github-theme"],
  "theme": "typedoc-github-theme",
  "lightHighlightTheme": "github-light",
  "darkHighlightTheme": "github-dark",
  "readme": "../README.md",
  "exclude": [
    "**/node_modules/**",
    "**/dist/**",
    "**/tests/**",
    "**/test/**",
    "**/*.test.ts",
    "**/*.spec.ts",
    "**/scripts/**"
  ],
  "externalPattern": ["**/node_modules/**"],
  "excludeNotDocumented": false,
  "excludeReferences": false,
  "validation": {
    "notExported": true,
    "invalidLink": true,
    "notDocumented": false
  },
  "treatWarningsAsErrors": false,
  "skipErrorChecking": false,
  "disableSources": false,
  "gitRevision": "main",
  "gitRemote": "origin",
  "hideGenerator": false
}
````

## File: .gitignore
````
target
node_modules
dist
*.tsbuildinfo
.DS_Store

# TypeScript generated files
src/*.js
src/*.d.ts
src/*.js.map
# Exclude generator scripts
!scripts/generate.js

# TypeDoc generated documentation
src/docs/
````

## File: .prettierignore
````
src/examples/README.md

.release-please-manifest.json
release-please-config.json
CHANGELOG.md
````

## File: .prettierrc
````
{}
````

## File: .release-please-manifest.json
````json
{
  ".": "0.21.0"
}
````

## File: AGENTS.md
````markdown
All paths in the protocol should be absolute

## Adding new methods

- Create empty params and output structs in rust/client.rs or rust/agent.rs under the corresponding section. I'll add the fields myself.
- If the protocol method name is `noun/verb`, use `verb_noun` for the user facing methods and structs.

  Example 1 (`noun/noun`):
  Protocol method: `terminal/output`
  Trait method name: `terminal_output`
  Request/Response structs: `TerminalOutputRequest` / `TerminalOutputResponse`
  Method names struct: `terminal_output: &'static str`

  Example 2 (`noun/verb`):
  Protocol method: `terminal/new`
  Trait method name: `new_terminal`
  Request/Response structs: `NewTerminalRequest` / `NewTerminalResponse`
  Method names struct: `terminal_new: &'static str`

- Do not write any tests or docs at all!
- Add constants for the method names
- Add variants to {Agent|Client}{Request|Response} enums
- Add the methods to the Client/Agent impl of {Agent|Client}SideConnection in rust/acp.rs
- Handle the new method in the `Side::decode_request`/`Side::decode_notification` implementation
- Handle the new request in the blanket impl of MessageHandler<{Agent|Client}Side>
- Add the method to markdown_generator.rs SideDocs functions
- Run `npm run generate` and fix any issues that appear
- Add the method to src/acp.ts classes and handlers
- Run `npm run check`
- Update the example agents and clients in tests and examples in both libraries

## Updating existing methods, their params, or output

- Update the mintlify docs and guides in the `docs` directory
- Run `npm run check` to make sure the json and zod schemas gets generated properly
- Params and responses docs make it to the schema, but the method-level docs, so make sure to update the typescript library accordingly.

Never write readme files related to the conversation unless explicitly asked to.
````

## File: CHANGELOG.md
````markdown
# Changelog

## [0.21.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.20.0...v0.21.0) (2026-04-28)


### Features

* **unstable:** Add `providers/*` support ([#138](https://github.com/agentclientprotocol/typescript-sdk/issues/138)) ([e234c21](https://github.com/agentclientprotocol/typescript-sdk/commit/e234c213d362d2cd170f8215fa0758a62a59d54e))

## [0.20.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.19.2...v0.20.0) (2026-04-23)


### Features

* Stabilize `closeSession` and `resumeSession` ([#132](https://github.com/agentclientprotocol/typescript-sdk/issues/132)) ([806d307](https://github.com/agentclientprotocol/typescript-sdk/commit/806d307ba92e824e859075f3f72fe1e9b35b8f0b))

## [0.19.2](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.19.1...v0.19.2) (2026-04-23)


### Bug Fixes

* Avoid event loop timing causing out of order messages ([#130](https://github.com/agentclientprotocol/typescript-sdk/issues/130)) ([8f514f3](https://github.com/agentclientprotocol/typescript-sdk/commit/8f514f348decd2ed0f8a57b845c7e170aaa75376))

## [0.19.1](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.19.0...v0.19.1) (2026-04-21)


### Bug Fixes

* avoid spurious unhandledRejection when transport fails mid-sendRequest ([#122](https://github.com/agentclientprotocol/typescript-sdk/issues/122)) ([b6b2cb4](https://github.com/agentclientprotocol/typescript-sdk/commit/b6b2cb44650286b4dc9ea8097cef46d4c41b6f1f))
* Flush decoder state at end of NDJSON stream ([#119](https://github.com/agentclientprotocol/typescript-sdk/issues/119)) ([4e1b07a](https://github.com/agentclientprotocol/typescript-sdk/commit/4e1b07aab3fbbcc5b2c0bfbfa0adc63e1aa53f92))
* Use TypeScript private keyword instead of ES #private fields ([#127](https://github.com/agentclientprotocol/typescript-sdk/issues/127)) ([c6e6ee2](https://github.com/agentclientprotocol/typescript-sdk/commit/c6e6ee2f369fde017e0f4df48e509bf041ab8985))

## [0.19.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.18.2...v0.19.0) (2026-04-14)


### Features

* **unstable:** Initial unstable elicitation support ([#113](https://github.com/agentclientprotocol/typescript-sdk/issues/113)) ([bf259e9](https://github.com/agentclientprotocol/typescript-sdk/commit/bf259e9e36b38fc760397babe7f455cdf6665193))

## [0.18.2](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.18.1...v0.18.2) (2026-04-08)


### Bug Fixes

* propagate input stream errors through ndJsonStream ([#111](https://github.com/agentclientprotocol/typescript-sdk/issues/111)) ([f57a8d1](https://github.com/agentclientprotocol/typescript-sdk/commit/f57a8d1d4606c6f12684e7790b0c9cfaba0e319c))

## [0.18.1](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.18.0...v0.18.1) (2026-04-06)


### Bug Fixes

* Handle ACP connection transport failures cleanly ([#103](https://github.com/agentclientprotocol/typescript-sdk/issues/103)) ([028ee3f](https://github.com/agentclientprotocol/typescript-sdk/commit/028ee3f6c89a51b6e0cc41aea7db97b3f9639812))

## [0.18.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.17.1...v0.18.0) (2026-04-01)


### Features

* **unstable:** Add initial additionalDirectories and NES support ([#104](https://github.com/agentclientprotocol/typescript-sdk/issues/104)) ([43cde3b](https://github.com/agentclientprotocol/typescript-sdk/commit/43cde3ba20ee39040f5c28d4aa3e56adde3bbdae))

## [0.17.1](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.17.0...v0.17.1) (2026-03-27)


### Bug Fixes

* Make sure we use zod/v4 path for imports ([#99](https://github.com/agentclientprotocol/typescript-sdk/issues/99)) ([e632d3b](https://github.com/agentclientprotocol/typescript-sdk/commit/e632d3be54cc55421b9a1d22c07a5df0b1c89a9b))

## [0.17.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.16.1...v0.17.0) (2026-03-25)


### Features

* **schema:** Update schema to 0.11.3 ([#88](https://github.com/agentclientprotocol/typescript-sdk/issues/88)) ([0fe246e](https://github.com/agentclientprotocol/typescript-sdk/commit/0fe246e8e4979ac637fe7a0d14648ba03baecebf))

## [0.16.1](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.16.0...v0.16.1) (2026-03-11)


### Bug Fixes

* **unstable:** Fixes for session/close capabilities ([#85](https://github.com/agentclientprotocol/typescript-sdk/issues/85)) ([e8721b7](https://github.com/agentclientprotocol/typescript-sdk/commit/e8721b79505a0a8eae03380bb3029c6419f8f1e6))

## [0.16.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.15.0...v0.16.0) (2026-03-10)


### Features

* add unstable session/close ([#81](https://github.com/agentclientprotocol/typescript-sdk/issues/81)) ([2c9bc77](https://github.com/agentclientprotocol/typescript-sdk/commit/2c9bc77af971f22dc2c30f473f9f3e4b57c47621))
* Stabilize unstable_listSessions to listSessions ([#84](https://github.com/agentclientprotocol/typescript-sdk/issues/84)) ([9e89bbc](https://github.com/agentclientprotocol/typescript-sdk/commit/9e89bbc6907d5ae343448b4d98c492fb296d74cf))

## [0.15.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.14.1...v0.15.0) (2026-03-05)


### Features

* Update to 0.11.0 of the schema ([#79](https://github.com/agentclientprotocol/typescript-sdk/issues/79)) ([2763d63](https://github.com/agentclientprotocol/typescript-sdk/commit/2763d63fe53f25d9af66ff7265915a50e8449e7b))


### Bug Fixes

* use npx.cmd on Windows in client example ([#68](https://github.com/agentclientprotocol/typescript-sdk/issues/68)) ([fdc7815](https://github.com/agentclientprotocol/typescript-sdk/commit/fdc78155f8e917c6e3b854df26a69ec4e8024e74))

## [0.14.1](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.14.0...v0.14.1) (2026-02-05)


### Bug Fixes

* inconsistent bigint vs number in zod and schema ([#66](https://github.com/agentclientprotocol/typescript-sdk/issues/66)) ([5e3c342](https://github.com/agentclientprotocol/typescript-sdk/commit/5e3c34229279989b385bd26baddc1536202635c8))

## [0.14.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.13.1...v0.14.0) (2026-02-04)


### Features

* Stabilize Session Config Options ([#64](https://github.com/agentclientprotocol/typescript-sdk/issues/64)) ([15806a2](https://github.com/agentclientprotocol/typescript-sdk/commit/15806a212c7de266a87db8d265d53f2ecc4b8963))

## [0.13.1](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.13.0...v0.13.1) (2026-01-22)


### Bug Fixes

* **schema:** Update to schema v0.10.7 ([#58](https://github.com/agentclientprotocol/typescript-sdk/issues/58)) ([ade1b68](https://github.com/agentclientprotocol/typescript-sdk/commit/ade1b6842b12ac9acece6d4540e00bca8ce8cdb3))

## [0.13.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.12.0...v0.13.0) (2026-01-13)


### Features

* (breaking) no more auto underscoring of extension methods ([#55](https://github.com/agentclientprotocol/typescript-sdk/issues/55)) ([ec4b095](https://github.com/agentclientprotocol/typescript-sdk/commit/ec4b0950ff5bcdfa60826e720c25575929d1f034))
* add unstable session config option handling ([#56](https://github.com/agentclientprotocol/typescript-sdk/issues/56)) ([ec7bb47](https://github.com/agentclientprotocol/typescript-sdk/commit/ec7bb47628f2be505e8fe0f784674dc6573d2f15))
* Update to 0.10.6 of the schema ([#53](https://github.com/agentclientprotocol/typescript-sdk/issues/53)) ([766964e](https://github.com/agentclientprotocol/typescript-sdk/commit/766964e29df567a4725911002c3184b0c19ec99a))

## [0.12.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.11.0...v0.12.0) (2025-12-16)


### Features

* **unstable:** add list sessions method ([#47](https://github.com/agentclientprotocol/typescript-sdk/issues/47)) ([2efd404](https://github.com/agentclientprotocol/typescript-sdk/commit/2efd40492a5569cbe0f570731279dc8e9ebeb9d0))
* Update to 0.10.4 of the schema ([#49](https://github.com/agentclientprotocol/typescript-sdk/issues/49)) ([6c44fb2](https://github.com/agentclientprotocol/typescript-sdk/commit/6c44fb239c8420d0f797aa111d7d1ec6ec2d77da))

## [0.11.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.10.0...v0.11.0) (2025-12-12)


### Features

* **unstable:** add resumeSession support ([#41](https://github.com/agentclientprotocol/typescript-sdk/issues/41)) ([721c450](https://github.com/agentclientprotocol/typescript-sdk/commit/721c450c1eea1ec4ed2bcaf370a02b2ebfd2aa1c))

## [0.10.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.9.0...v0.10.0) (2025-12-11)


### Features

* Update to 0.10.2 of the schema ([#39](https://github.com/agentclientprotocol/typescript-sdk/issues/39)) ([0773dde](https://github.com/agentclientprotocol/typescript-sdk/commit/0773ddecc9881cbf18265c26ef422a51aeb7617b))

## [0.9.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.8.0...v0.9.0) (2025-12-11)


### Features

* Update to 0.10.1 of the schema ([#36](https://github.com/agentclientprotocol/typescript-sdk/issues/36)) ([210392b](https://github.com/agentclientprotocol/typescript-sdk/commit/210392bfdcb95d2f515784af914323d2606194f6))
* Unstable: add unstable forkSession support [#37](https://github.com/agentclientprotocol/typescript-sdk/pull/37)

## [0.8.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.7.0...v0.8.0) (2025-12-08)


### Features

* Update to 0.10 of the schema ([#31](https://github.com/agentclientprotocol/typescript-sdk/issues/31)) ([f026432](https://github.com/agentclientprotocol/typescript-sdk/commit/f02643202801a8947ce78710ded6f3f7f6fa7ee8))

## [0.7.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.6.0...v0.7.0) (2025-12-01)


### Features

* Update to v0.9.1 of the schema ([#28](https://github.com/agentclientprotocol/typescript-sdk/issues/28)) ([6166944](https://github.com/agentclientprotocol/typescript-sdk/commit/6166944f69a212a6db2d68f315d33ed3214668d4))

## [0.6.0](https://github.com/agentclientprotocol/typescript-sdk/compare/v0.5.1...v0.6.0) (2025-12-01)

Updates to the latest version of the ACP JSON Schema, [v0.8.0](https://github.com/agentclientprotocol/agent-client-protocol/releases/tag/v0.8.0)

This update provides much improved schema interfaces. The migration should be minimal because in TypeScript the interfaces should be functionally equivalent. But there may be some areas where the types are now more informative to the compiler and will hopefully help you catch errors earlier.

## 0.5.1 (2025-10-24)

- Add ability for agents and clients to provide information about their implementation
- Fix incorrectly serialized `_meta` field on `SetSessionModeResponse

## 0.5.0 (2025-10-24)

- Provide access to an `AbortSignal` and `closed` promise on connections so you can wait for the connection to close and handle any other cleanup tasks you need for a graceful shutdown. https://github.com/agentclientprotocol/typescript-sdk/pull/11
- Allow for more customization of error messages: https://github.com/agentclientprotocol/typescript-sdk/pull/12
- Update to latest ACP JSON Schema: https://github.com/agentclientprotocol/typescript-sdk/pull/10

## 0.4.9 (2025-10-21)

- Fix: incorrect method for session/set_model client implementation.

## 0.4.8 (2025-10-15)

- Fix: return valid setSessionModel response object

## 0.4.7 (2025-10-11)

- New repo: https://github.com/agentclientprotocol/typescript-sdk

## 0.4.6 (2025-10-10)

- No changes

## 0.4.5 (2025-10-02)

- **Unstable** initial support for model selection.

## 0.4.4 (2025-09-30)

### Protocol

- Correctly mark capability-based `Agent` and `Client` methods as optional.

## 0.4.3 (2025-09-25)

- No changes

## 0.4.2 (2025-09-22)

- No changes

## 0.4.1 (2025-09-22)

- No changes

## 0.4.0 (2025-09-17)

- Use Stream abstraction instead of raw byte streams [#93](https://github.com/agentclientprotocol/agent-client-protocol/pull/93)
  - Makes it easier to use with websockets instead of stdio
- Improve type safety for method map helpers [#94](https://github.com/agentclientprotocol/agent-client-protocol/pull/94)
````

## File: eslint.config.js
````javascript
import js from "@eslint/js";
import tseslint from "@typescript-eslint/eslint-plugin";
import tsparser from "@typescript-eslint/parser";
import prettierConfig from "eslint-config-prettier";
import globals from "globals";

export default [
  {
    ignores: [
      "node_modules/",
      "dist/",
      "scripts/",
      "coverage/",
      "*.min.js",
      "*.config.js",
      ".github/",
      "src/schema.ts",
    ],
  },
  js.configs.recommended,
  {
    files: ["src/**/*.ts"],
    languageOptions: {
      ecmaVersion: 2020,
      sourceType: "module",
      parser: tsparser,
      parserOptions: {
        project: "./tsconfig.json",
      },
      globals: {
        ...globals.node,
      },
    },
    plugins: {
      "@typescript-eslint": tseslint,
    },
    rules: {
      ...tseslint.configs.recommended.rules,
      "@typescript-eslint/explicit-function-return-type": "off",
      "@typescript-eslint/no-explicit-any": "off",
      "@typescript-eslint/no-unused-vars": [
        "error",
        {
          argsIgnorePattern: "^_",
        },
      ],
      "no-console": "off",
      "no-constant-condition": "off",
      "default-case": "error",
      "prefer-const": "error",
      "no-var": "error",
      eqeqeq: ["error", "smart"],
      curly: ["error", "all"],
    },
  },
  prettierConfig,
];
````

## File: LICENSE
````
Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   Copyright 2025 Zed Industries, Inc. and contributors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
````

## File: package.json
````json
{
  "name": "@agentclientprotocol/sdk",
  "version": "0.21.0",
  "publishConfig": {
    "access": "public"
  },
  "description": "The Agent Client Protocol (ACP) is a protocol that standardizes communication between *code editors* (interactive programs for viewing and editing source code) and *coding agents* (programs that use generative AI to autonomously modify code).",
  "homepage": "https://github.com/agentclientprotocol/typescript-sdk#readme",
  "bugs": {
    "url": "https://github.com/agentclientprotocol/typescript-sdk/issues"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/agentclientprotocol/typescript-sdk.git"
  },
  "license": "Apache-2.0",
  "author": "Zed Industries",
  "files": [
    "typescript",
    "dist",
    "schema/schema.json",
    "LICENSE-APACHE"
  ],
  "type": "module",
  "main": "dist/acp.js",
  "types": "dist/acp.d.ts",
  "directories": {
    "example": "examples"
  },
  "scripts": {
    "clean": "rm -rf dist tsconfig.tsbuildinfo",
    "test": "vitest run",
    "generate": "node scripts/generate.js",
    "build": "tsc",
    "format": "prettier --write .",
    "format:check": "prettier --check .",
    "lint": "eslint",
    "lint:fix": "eslint --fix",
    "spellcheck": "./scripts/spellcheck.sh",
    "spellcheck:fix": "./scripts/spellcheck.sh --write-changes",
    "check": "npm run lint && npm run format:check && npm run spellcheck && npm run build && npm run test && npm run docs:ts:verify",
    "docs:ts:build": "cd src && typedoc && echo 'TypeScript documentation generated in ./src/docs'",
    "docs:ts:dev": "concurrently \"cd src && typedoc --watch --preserveWatchOutput\" \"npx http-server src/docs -p 8081\"",
    "docs:ts:verify": "cd src && typedoc --emit none && echo 'TypeDoc verification passed'"
  },
  "peerDependencies": {
    "zod": "^3.25.0 || ^4.0.0"
  },
  "devDependencies": {
    "@eslint/js": "^10.0.1",
    "@hey-api/openapi-ts": "^0.96.0",
    "@types/node": "^25.5.0",
    "@typescript-eslint/eslint-plugin": "^8.57.1",
    "@typescript-eslint/parser": "^8.57.1",
    "concurrently": "^9.2.1",
    "eslint": "^10.0.3",
    "eslint-config-prettier": "^10.1.8",
    "globals": "^17.4.0",
    "http-server": "^14.1.1",
    "prettier": "^3.8.1",
    "tsx": "^4.21.0",
    "typedoc": "^0.28.16",
    "typedoc-github-theme": "^0.4.0",
    "typescript": "^6.0.2",
    "vitest": "^4.1.0",
    "zod": "^3.25.0 || ^4.0.0"
  }
}
````

## File: README.md
````markdown
<a href="https://agentclientprotocol.com/" >
  <img alt="Agent Client Protocol" src="https://zed.dev/img/acp/banner-dark.webp">
</a>

# ACP TypeScript Library

The official TypeScript implementation of the Agent Client Protocol (ACP) — a standardized communication protocol between code editors and AI-powered coding agents.

Learn more at https://agentclientprotocol.com

## Installation

```bash
npm install @agentclientprotocol/sdk
```

## Get Started

### Understand the Protocol

Start by reading the [official ACP documentation](https://agentclientprotocol.com) to understand the core concepts and protocol specification.

### Try the Examples

The [examples directory](https://github.com/agentclientprotocol/typescript-sdk/tree/main/src/examples) contains simple implementations of both Agents and Clients in TypeScript. These examples can be run from your terminal or from an ACP Client like [Zed](https://zed.dev), making them great starting points for your own integration!

### Explore the API

Browse the [TypeScript library reference](https://agentclientprotocol.github.io/typescript-sdk) for detailed API documentation.

If you're building an [Agent](https://agentclientprotocol.com/protocol/overview#agent), start with [AgentSideConnection](https://agentclientprotocol.github.io/typescript-sdk/classes/AgentSideConnection.html).

If you're building a [Client](https://agentclientprotocol.com/protocol/overview#client), start with [ClientSideConnection](https://agentclientprotocol.github.io/typescript-sdk/classes/ClientSideConnection.html).

### Study a Production Implementation

For a complete, production-ready implementation, check out the [Gemini CLI Agent](https://github.com/google-gemini/gemini-cli/blob/main/packages/cli/src/zed-integration/zedIntegration.ts).

## Resources

- [Library docs](https://agentclientprotocol.github.io/typescript-sdk)
- [Examples](https://github.com/agentclientprotocol/typescript-sdk/tree/main/src/examples)
- [Protocol Documentation](https://agentclientprotocol.com)
- [GitHub Repository](https://github.com/agentclientprotocol/typescript-sdk)
- [NPM Package](https://www.npmjs.com/package/@agentclientprotocol/sdk)

## Contributing

See the main [repository](https://github.com/agentclientprotocol/typescript-sdk) for contribution guidelines.

### License

By contributing, you agree that your contributions will be licensed under the Apache 2.0 License.
````

## File: release-please-config.json
````json
{
  "bump-minor-pre-major": true,
  "bump-patch-for-minor-pre-major": true,
  "packages": {
    ".": {
      "changelog-path": "CHANGELOG.md",
      "release-type": "node",
      "bump-minor-pre-major": true,
      "bump-patch-for-minor-pre-major": true
    }
  },
  "$schema": "https://raw.githubusercontent.com/googleapis/release-please/main/schemas/config.json"
}
````

## File: tsconfig.json
````json
{
  "compilerOptions": {
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "resolveJsonModule": true,
    "forceConsistentCasingInFileNames": true,
    "sourceMap": true,
    "declaration": true,
    "allowSyntheticDefaultImports": true,
    "lib": ["ESNext", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "moduleResolution": "bundler",
    "target": "es2022",
    "types": ["node"],
    "rootDir": "src",
    "outDir": "dist",
    "paths": {}
  },
  "include": ["src/**/*.ts"],
  "exclude": ["**/dist/**", "tests/**"]
}
````

## File: typos.toml
````toml
[files]
ignore-files = true
ignore-hidden = false
extend-exclude = [
    ".git/",
    "target/",
    "node_modules/",
    "dist/",

    # Generated schema files
    "schema/",

    # Package lock files contain hashes and encoded data
    "package-lock.json",
    "Cargo.lock",

    # TypeScript documentation output
    "src/docs/",

    # Build artifacts
    "tsconfig.tsbuildinfo",
]

[default]
extend-ignore-re = [
]
check-filename = true

[default.extend-identifiers]
ndJsonStream = "ndJsonStream"
````
