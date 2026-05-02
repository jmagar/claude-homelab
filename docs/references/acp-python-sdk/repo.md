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
  actions/
    setup-python-env/
      action.yml
  ISSUE_TEMPLATE/
    bug-report.yml
    config.yml
    feature-request.yml
  workflows/
    main.yml
    on-release-main.yml
  pull_request_template.md
docs/
  contrib.md
  index.md
  migration-guide-0.7.md
  migration-guide-0.8.md
  quickstart.md
  releasing.md
  use-cases.md
examples/
  agent.py
  client.py
  duet.py
  echo_agent.py
  gemini.py
schema/
  meta.json
  schema.json
  VERSION
scripts/
  __init__.py
  gen_all.py
  gen_meta.py
  gen_schema.py
  gen_signature.py
src/
  acp/
    agent/
      __init__.py
      connection.py
      router.py
    client/
      __init__.py
      connection.py
      router.py
    contrib/
      __init__.py
      permissions.py
      session_state.py
      tool_calls.py
    task/
      __init__.py
      dispatcher.py
      queue.py
      sender.py
      state.py
      supervisor.py
    __init__.py
    connection.py
    core.py
    exceptions.py
    helpers.py
    interfaces.py
    meta.py
    py.typed
    router.py
    schema.py
    stdio.py
    telemetry.py
    transports.py
    utils.py
tests/
  contrib/
    test_contrib_permissions.py
    test_contrib_session_state.py
    test_contrib_tool_calls.py
  golden/
    cancel_notification.json
    content_audio.json
    content_image.json
    content_resource_blob.json
    content_resource_link.json
    content_resource_text.json
    content_text.json
    fs_read_text_file_request.json
    fs_read_text_file_response.json
    fs_write_text_file_request.json
    initialize_request.json
    initialize_response.json
    new_session_request.json
    new_session_response.json
    permission_outcome_cancelled.json
    permission_outcome_selected.json
    prompt_request.json
    request_permission_request.json
    request_permission_response_selected.json
    session_update_agent_message_chunk.json
    session_update_agent_thought_chunk.json
    session_update_config_option_update.json
    session_update_plan.json
    session_update_tool_call_edit.json
    session_update_tool_call_locations_rawinput.json
    session_update_tool_call_read.json
    session_update_tool_call_update_content.json
    session_update_tool_call_update_more_fields.json
    session_update_tool_call.json
    session_update_user_message_chunk.json
    set_session_config_option_request.json
    set_session_config_option_response.json
    tool_content_content_text.json
    tool_content_diff_no_old.json
    tool_content_diff.json
    tool_content_terminal.json
  real_user/
    __init__.py
    test_cancel_prompt_flow.py
    test_mcp_servers_optional.py
    test_permission_flow.py
    test_stdio_limits.py
  conftest.py
  test_compatibility.py
  test_gemini_example.py
  test_golden.py
  test_rpc.py
  test_unstable.py
  test_utils.py
.gitignore
.pre-commit-config.yaml
AGENTS.md
CONTRIBUTING.md
LICENSE
Makefile
mkdocs.yml
pyproject.toml
README.md
tox.ini
```

# Files

## File: .github/actions/setup-python-env/action.yml
````yaml
name: "Setup Python Environment"
description: "Set up Python environment for the given Python version"

inputs:
  python-version:
    description: "Python version to use"
    required: true
    default: "3.12"
  uv-version:
    description: "uv version to use"
    required: true
    default: "0.6.14"

runs:
  using: "composite"
  steps:
    - uses: actions/setup-python@a26af69be951a213d495a4c3e4e4022e16d87065
      with:
        python-version: ${{ inputs.python-version }}

    - name: Install uv
      uses: astral-sh/setup-uv@d0cc045d04ccac9d8b7881df0226f9e82c39688e
      with:
        version: ${{ inputs.uv-version }}
        enable-cache: "true"
        cache-suffix: ${{ matrix.python-version }}

    - name: Install Python dependencies
      run: uv sync --all-extras --all-groups --frozen
      shell: bash
````

## File: .github/ISSUE_TEMPLATE/bug-report.yml
````yaml
name: Bug Report
description: Tell us about a regression or defect in the ACP Python SDK.
title: "bug: "
labels: ["bug"]
body:
  - type: markdown
    attributes:
      value: >
        Thanks for filing a detailed bug. Fill out every section so we can
        reproduce the issue quickly and keep the SDK solid.

  - type: textarea
    id: summary
    attributes:
      label: Summary
      description: What went wrong? Keep it short but specific.
      placeholder: "Streaming updates stop after the second prompt…"
    validations:
      required: true

  - type: textarea
    id: repro
    attributes:
      label: Reproduction steps
      description: >
        Commands, code, or payloads that trigger the bug. Include any relevant
        input files or snippets (redact secrets).
    validations:
      required: true

  - type: textarea
    id: expected
    attributes:
      label: Expected result
      placeholder: "Tool call should finish and emit a completed status…"
    validations:
      required: true

  - type: textarea
    id: actual
    attributes:
      label: Actual result
      placeholder: "Agent hangs and no further session/update payloads arrive…"
    validations:
      required: true

  - type: input
    id: versions
    attributes:
      label: Versions / environment
      description: >
        Include SDK version, ACP schema tag (if pinned), Python version, and OS.
      placeholder: "sdk 0.5.1 (schema v0.4.7), Python 3.12.2 on macOS 14.4"
    validations:
      required: true

  - type: textarea
    id: logs
    attributes:
      label: Logs & screenshots
      description: Paste relevant stack traces, JSON snippets, or console output.
      render: shell

  - type: checkboxes
    id: willing-to-pr
    attributes:
      label: Open to submitting a fix?
      options:
        - label: I’m willing to open a PR for this bug.
````

## File: .github/ISSUE_TEMPLATE/config.yml
````yaml
blank_issues_enabled: false
contact_links:
  - name: Ask a question
    url: https://github.com/agentclientprotocol/python-sdk/discussions/new?category=q-a
    about: Usage questions, architecture ideas, and doc clarifications live best in Discussions.
  - name: Read the docs
    url: https://agentclientprotocol.github.io/python-sdk/
    about: The published docs cover quickstart steps, contrib helpers, and release workflows.
````

## File: .github/ISSUE_TEMPLATE/feature-request.yml
````yaml
name: Feature Request
description: Pitch an improvement for the ACP Python SDK docs, runtime, or tooling.
title: "feat: "
labels: ["enhancement"]
body:
  - type: markdown
    attributes:
      value: >
        Feature requests work best when they focus on the problem first. Tell us
        what you’re trying to achieve and why existing APIs aren’t enough.

  - type: textarea
    id: problem
    attributes:
      label: Problem statement
      description: >
        What use case is blocked? Include relevant transports, helpers, or user
        journeys.
      placeholder: "Need a helper to batch tool call updates when streaming…"
    validations:
      required: true

  - type: textarea
    id: proposal
    attributes:
      label: Proposed solution
      description: >
        Sketch the API or behaviour you’d like to see. Code snippets welcome.
    validations:
      required: true

  - type: textarea
    id: alternatives
    attributes:
      label: Alternatives considered
      description: >
        Mention workarounds you’ve tried or other approaches we should weigh.

  - type: textarea
    id: extra
    attributes:
      label: Additional context
      description: Links, screenshots, related issues, etc.

  - type: checkboxes
    id: willing-to-help
    attributes:
      label: Can you help build it?
      options:
        - label: I can contribute code or docs for this request.
````

## File: .github/workflows/main.yml
````yaml
name: Main

on:
  push:
    branches:
      - main
  pull_request:
    types: [opened, synchronize, reopened, ready_for_review]

jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - name: Check out
        uses: actions/checkout@08eba0b27e820071cde6df949e0beb9ba4906955

      - uses: actions/cache@0057852bfaa89a56745cba8c7296529d2fc39830
        with:
          path: ~/.cache/prek
          key: prek-${{ hashFiles('.pre-commit-config.yaml') }}

      - name: Set up the environment
        uses: ./.github/actions/setup-python-env

      - name: Run checks
        run: make check

  tests-and-type-check:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ["3.10", "3.11", "3.12", "3.13", "3.14"]
      fail-fast: false
    defaults:
      run:
        shell: bash
    steps:
      - name: Check out
        uses: actions/checkout@08eba0b27e820071cde6df949e0beb9ba4906955

      - name: Set up the environment
        uses: ./.github/actions/setup-python-env
        with:
          python-version: ${{ matrix.python-version }}

      - name: Run tests
        run: make test

      - name: Check typing
        run: make check

  check-docs:
    runs-on: ubuntu-latest
    steps:
      - name: Check out
        uses: actions/checkout@08eba0b27e820071cde6df949e0beb9ba4906955

      - name: Set up the environment
        uses: ./.github/actions/setup-python-env

      - name: Check if documentation can be built
        run: make docs-test

  check-links:
    runs-on: ubuntu-latest
    steps:
      - name: Check out
        uses: actions/checkout@08eba0b27e820071cde6df949e0beb9ba4906955

      - name: Link Checker
        id: lychee
        uses: lycheeverse/lychee-action@1ef33e2493308e49729a7789ddd73e7f8bed8f45
        with:
          fail: false
````

## File: .github/workflows/on-release-main.yml
````yaml
name: release-main

on:
  release:
    types: [published]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  set-version:
    runs-on: ubuntu-24.04
    steps:
      - uses: actions/checkout@08eba0b27e820071cde6df949e0beb9ba4906955

      - name: Export tag
        id: vars
        run: echo tag=${GITHUB_REF#refs/*/} >> $GITHUB_OUTPUT
        if: ${{ github.event_name == 'release' }}

      - name: Update project version
        run: |
          sed -i "s/^version = \".*\"/version = \"$RELEASE_VERSION\"/" pyproject.toml
        env:
          RELEASE_VERSION: ${{ steps.vars.outputs.tag }}
        if: ${{ github.event_name == 'release' }}

      - name: Upload updated pyproject.toml
        uses: actions/upload-artifact@ea165f8d65b6e75b540449e92b4886f43607fa02
        with:
          name: pyproject-toml
          path: pyproject.toml

  publish:
    runs-on: ubuntu-latest
    needs: [set-version]
    steps:
      - name: Check out
        uses: actions/checkout@08eba0b27e820071cde6df949e0beb9ba4906955

      - name: Set up the environment
        uses: ./.github/actions/setup-python-env

      - name: Download updated pyproject.toml
        uses: actions/download-artifact@d3f86a106a0bac45b974a628896c90dbdf5c8093
        with:
          name: pyproject-toml

      - name: Build package
        run: uv build

      - name: Publish package
        run: uv publish
        env:
          UV_PUBLISH_TOKEN: ${{ secrets.PYPI_TOKEN }}

  build-docs:
    needs: publish
    runs-on: ubuntu-latest
    steps:
      - name: Check out
        uses: actions/checkout@08eba0b27e820071cde6df949e0beb9ba4906955

      - name: Set up the environment
        uses: ./.github/actions/setup-python-env

      - name: Build site
        run: uv run mkdocs build -f mkdocs.yml --clean

      - name: Upload Pages artifact
        uses: actions/upload-pages-artifact@56afc609e74202658d3ffba0e8f6dda462b719fa # v3.0.1
        with:
          path: site

  deploy-docs:
    needs: build-docs
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@d6db90164ac5ed86f2b6aed7e0febac5b3c0c03e # v4.0.5
````

## File: .github/pull_request_template.md
````markdown
## Summary

<!-- What does this change do? Keep it short. -->


## Related issues

<!--
Link the tracked issue(s) using the GitHub syntax, e.g. "Closes #123".
If the work only partially addresses an issue, use "Relates to #123".
-->


## Testing

<!--
List the checks you ran (e.g. `make check`, `make test`, targeted pytest files, manual CLI steps).
Include output snippets when helpful.
-->


## Docs & screenshots

<!--
Note any documentation or example updates included (or explain why none are needed).
Attach screenshots/GIFs when the change affects UX.
-->


## Checklist

- [ ] Conventional Commit title (e.g. `feat:`, `fix:`).
- [ ] Tests cover the change or are not required (explain above).
- [ ] Docs/examples updated when behaviour is user-facing.
- [ ] Schema regenerations (`make gen-all`) are called out if applicable.
````

## File: docs/contrib.md
````markdown
# Experimental Contrib Modules

The helpers under `acp.contrib` package recurring patterns we saw in integrations such as Toad, kimi-cli, and Gemini. Keep in mind they are experimental—APIs can still shift as we learn. Use this page as a menu:

- **`session_state.SessionAccumulator`** — build a canonical, immutable snapshot of every session update so UIs can render tool calls and plans without re-implementing state machines.
- **`tool_calls.ToolCallTracker` + `permissions.PermissionBroker`** — coordinate streamed tool call updates and permission prompts from one place.

## SessionAccumulator (`acp.contrib.session_state`)

**Use it when:** you need a live, merged view of `SessionNotification` events (e.g. tool calls, plan entries, user/agent messages) to drive UI widgets.

**Key capabilities**

- `SessionAccumulator.apply(notification)` reconciles `tool_call` and `tool_call_update` payloads, even if the start event arrives late.
- `snapshot()` returns an immutable `SessionSnapshot` Pydantic model containing the plan, current mode, commands, and ordered message history.
- `subscribe(callback)` lets you push snapshots into stores or UI components whenever state changes.
- Automatic reset on session-change (toggle with `auto_reset_on_session_change`).

> Tip: Create one accumulator per UI controller. Feed every raw `SessionNotification` into it and render from `snapshot.tool_calls` / `snapshot.user_messages` instead of mutating state manually.

## ToolCallTracker & PermissionBroker (`acp.contrib.tool_calls`, `acp.contrib.permissions`)

**Use them when:** your agent runtime synthesises tool call IDs, streams arguments, and prompts the user for approval. The helpers centralise the bookkeeping so you don’t juggle raw Pydantic models.

- `ToolCallTracker.start()/progress()/append_stream_text()` emits canonical `ToolCallStart` / `ToolCallProgress` updates and keeps an in-memory view via `view()` or `tool_call_model()`.
- `PermissionBroker.request_for()` wraps `requestPermission` RPCs. It reuses tracker state (or a provided `ToolCall`), lets you append extra content, and defaults to Approve / Approve for session / Reject options.
- `default_permission_options()` exposes that canonical option triple if you need to customise it.

> Tip: Keep one tracker near the agent event loop. Emit notifications through it and share the tracker with `PermissionBroker` so permission prompts always match the latest tool call state.

## Design Guardrails

To stay aligned with the ACP schema, the contrib layer follows a few rules:

- Schema data classes continue to live in `acp.schema`. Contrib helpers clone them with `.model_copy(deep=True)` before mutation.
- The core runtime never imports contrib modules implicitly—you opt in when they help.
- Helpers focus on painful bookkeeping (tool call aggregation, permission UX) and leave product-specific policy to your application.

Try the contrib modules, then open an issue or PR with feedback so we know which APIs should graduate into the stable surface.
````

## File: docs/index.md
````markdown
<a href="https://agentclientprotocol.com/">
  <img alt="Agent Client Protocol" src="https://zed.dev/img/acp/banner-dark.webp">
</a>

# Agent Client Protocol SDK (Python)

Ship ACP-compatible agents and clients in Python without rebuilding JSON-RPC transports or schema models. This SDK mirrors each ACP release so your integrations stay interoperable with editors, CLIs, and hosted clients.

## Install & verify

```bash
pip install agent-client-protocol
# or
uv add agent-client-protocol
```

Next steps live in the [Quickstart](quickstart.md): launch the echo agent, wire it to Zed (or another ACP client), and exercise the programmatic spawn helpers.

## ACP at a glance

- ACP is the stdio protocol that lets “clients” (editors, shells, CLIs) orchestrate AI “agents.”
- Sessions exchange structured payloads (`session/update`, permission prompts, tool calls) defined in the upstream schema.
- Matching the schema version keeps your Python integrations compatible with tools such as Zed, Gemini CLI, or kimi-cli.

## SDK building blocks

- `acp.schema`: generated Pydantic models that validate every payload against the canonical specification.
- `acp.agent` / `acp.client`: async base classes, JSON-RPC supervision, and lifecycle orchestration.
- `acp.helpers`: builders for content blocks, tool calls, permissions, and notifications.
- `acp.contrib`: experimental utilities (session accumulators, permission brokers, tool call trackers) harvested from production deployments.
- `examples/`: runnable agents, clients, duet demos, and the Gemini CLI bridge.

## Quick links

| Need | Link |
| --- | --- |
| Quickstart walkthrough | [quickstart.md](quickstart.md) |
| Real-world adopters | [use-cases.md](use-cases.md) |
| Contrib helpers | [contrib.md](contrib.md) |
| Releasing workflow | [releasing.md](releasing.md) |
| Example scripts | [github.com/agentclientprotocol/python-sdk/tree/main/examples](https://github.com/agentclientprotocol/python-sdk/tree/main/examples) |

## Choose a path

- **Just exploring?** Skim [use-cases.md](use-cases.md) to see how kimi-cli, agent-client-kernel, and others use the SDK.
- **Building agents?** Copy `examples/echo_agent.py` or `examples/agent.py`, then layer in `acp.helpers` for tool calls and permissions.
- **Embedding clients?** Start with `examples/client.py` or the `spawn_agent_process` / `spawn_client_process` helpers in the [Quickstart](quickstart.md#programmatic-launch).

## Reference material

- [Quickstart](quickstart.md) — installation, editor wiring, and programmatic launch walkthroughs.
- [Use Cases](use-cases.md) — real adopters with succinct descriptions of what they build.
- [Experimental Contrib](contrib.md) — deep dives on the `acp.contrib` utilities.
- [Releasing](releasing.md) — schema upgrade process, versioning policy, and publishing checklist.

Need API-level details? Browse the source in `src/acp/` or generate docs with `mkdocstrings`.

## Feedback & support

- Open issues or discussions on GitHub for bugs, feature requests, or integration help.
- Join [GitHub Discussions](https://github.com/agentclientprotocol/python-sdk/discussions) to swap ideas.
- Chat with the community on [agentclientprotocol.zulipchat.com](https://agentclientprotocol.zulipchat.com/).
- Follow ACP roadmap updates at [agentclientprotocol.com](https://agentclientprotocol.com/).
````

## File: docs/migration-guide-0.7.md
````markdown
# Migrating to ACP Python SDK 0.7

ACP 0.7 reshapes the public surface so that Python-facing names, runtime helpers, and schema models line up with the evolving Agent Client Protocol schema. This guide covers the major changes in 0.7.0 and calls out the mechanical steps you need to apply in downstream agents, clients, and transports.

## 1. `acp.schema` models now expose `snake_case` fields

- Every generated model in `acp.schema` (see `src/acp/schema.py`) now uses Pythonic attribute names such as `session_id`, `stop_reason`, and `field_meta`. The JSON aliases (e.g., `alias="sessionId"`) stay intact so over-the-wire payloads remain camelCase.
- Instantiating a model or accessing response values must now use the `snake_case` form:

```python
# Before (0.6 and earlier)
PromptResponse(stopReason="end_turn")
params.sessionId

# After (0.7 and later)
PromptResponse(stop_reason="end_turn")
params.session_id
```

- If you relied on `model_dump()` to emit camelCase keys automatically, switch to `model_dump(by_alias=True)` (or use helpers such as `text_block`, `start_tool_call`, etc.) so responses continue to match the protocol.
- `field_meta` stays available for extension data. Any extra keys that were nested under `_meta` should now be provided via keyword arguments when constructing the schema models (see section 3).

## 2. `acp.run_agent` and `acp.connect_to_agent` replace manual connection wiring

`AgentSideConnection` and `ClientSideConnection` still exist internally, but the top-level entry points now prefer the helper functions implemented in `src/acp/core.py`.

### Updating agents

- Old pattern:

```python
conn = AgentSideConnection(lambda conn: Agent(), writer, reader)
await asyncio.Event().wait()  # keep running
```

- New pattern:

```python
await run_agent(MyAgent(), input_stream=writer, output_stream=reader)
```

- When your agent just runs over stdio, call `await run_agent(MyAgent())` and the helper will acquire asyncio streams via `stdio_streams()` for you.

### Updating clients and tests

- Old pattern:

```python
conn = ClientSideConnection(lambda conn: MyClient(), proc.stdin, proc.stdout)
```

- New pattern:

```python
conn = connect_to_agent(MyClient(), proc.stdin, proc.stdout)
```

- `spawn_agent_process` / `spawn_client_process` now accept concrete `Agent`/`Client` instances instead of factories that received the connection. Instantiate your implementation first and pass it in.
- Importing the legacy connection classes via `acp.AgentSideConnection` / `acp.ClientSideConnection` issues a `DeprecationWarning` (see `src/acp/__init__.py:82-96`). Update your imports to `run_agent` and `connect_to_agent` to silence the warning.

## 3. `Agent` and `Client` interface methods take explicit parameters

Both interfaces in `src/acp/interfaces.py` now look like idiomatic Python protocols: methods use `snake_case` names and receive the individual schema fields rather than a single request model.

### What changed

- Method names follow `snake_case` (`request_permission`, `session_update`, `new_session`, `set_session_model`, etc.).
- Parameters represent the schema fields, so there is no need to unpack `params` manually.
- Each method is decorated with `@param_model(...)`. Combined with the `compatible_class` helper (see `src/acp/utils.py`), this keeps the camelCase wrappers alive for callers that still pass a full Pydantic request object—but those wrappers now emit `DeprecationWarning`s to encourage migration.

### How to update your implementations

1. Rename your method overrides to their `snake_case` equivalents.
2. Replace `params: Model` arguments with the concrete fields plus `**kwargs` to collect future `_meta` keys.
3. Access schema data directly via those parameters.

Example migration for an agent:

```python
# Before
class EchoAgent:
    async def prompt(self, params: PromptRequest) -> PromptResponse:
        text = params.prompt[0].text
        return PromptResponse(stopReason="end_turn")

# After
class EchoAgent:
    async def prompt(self, prompt, session_id, **kwargs) -> PromptResponse:
        text = prompt[0].text
        return PromptResponse(stop_reason="end_turn")
```

Similarly, a client method such as `requestPermission` becomes:

```python
class RecordingClient(Client):
    async def request_permission(self, options, session_id, tool_call, **kwargs):
        ...
```

### Additional notes

- The connection layers automatically assemble the right request/response models using the `param_model` metadata, so callers do not need to build Pydantic objects manually anymore.
- For extension points (`field_meta`), pass keyword arguments from the connection into your handler signature: they arrive inside `**kwargs`.

### Backward compatibility

- The change should be 100% backward compatible as long as you update your method names and signatures. The `compatible_class` wrapper ensures that existing callers passing full request models continue to work. The old style API will remain functional before the next major release(1.0).
- Because camelCase wrappers remain for now, you can migrate file-by-file while still running against ACP 0.7. Just watch for the new deprecation warnings in your logs/tests.
````

## File: docs/migration-guide-0.8.md
````markdown
# Migrating to ACP Python SDK 0.8

ACP 0.8 keeps the 0.7 public surface but aligns the SDK with the latest ACP schema and tightens a few runtime behaviors. Most teams only need to review the updated schema and terminal helpers. This guide calls out the changes that can affect downstream agents, clients, and tests.

## 1. ACP schema bumped to 0.10.8

- Regenerate any internal copies of ACP schema-derived artifacts against 0.10.8.
- If you vendor schema types, run `make gen-all` or your equivalent pipeline.
- Helper types now include `SessionInfoUpdate` in the `SessionUpdate` union, so downstream code that exhaustively matches update variants should include it.

## 2. `TerminalHandle` removal

`TerminalHandle` is no longer part of the public API. If you referenced it directly, switch to the request/response models and terminal IDs returned by `CreateTerminalRequest`/`CreateTerminalResponse`.

Typical adjustment:

```python
# Before (0.7.x)
handle = await conn.create_terminal(...)
await conn.terminal_output(session_id=..., terminal_id=handle.id)

# After (0.8.x)
resp = await conn.create_terminal(...)
await conn.terminal_output(session_id=..., terminal_id=resp.terminal_id)
```

## 3. Larger default stdio buffer limits

The default stdio reader limit is now 50MB to support multimodal payloads. If you run in memory-constrained environments, explicitly set `stdio_buffer_limit_bytes` when calling `run_agent`.

```python
await run_agent(agent, stdio_buffer_limit_bytes=2 * 1024 * 1024)
```

## 4. Documentation and quickstart updates

Docs and settings examples have been refreshed for ACP 0.10.8. If you maintain internal onboarding material, sync it with the latest docs in `docs/`.
````

## File: docs/quickstart.md
````markdown
# Quickstart

Spin up a working ACP agent/client loop in minutes. Keep this page beside the terminal and check off each section as you go. Want inspiration? Hop to the [Use Cases](use-cases.md) list to see how teams like kimi-cli or Zed apply the SDK in production.

## Quick checklist

| Goal                                | Command / Link                                                        |
| ----------------------------------- | --------------------------------------------------------------------- |
| Install the SDK                     | `pip install agent-client-protocol` or `uv add agent-client-protocol` |
| Run the echo agent                  | `python examples/echo_agent.py`                                       |
| Point Zed (or another client) at it | Update `settings.json` as shown below                                 |
| Programmatically drive an agent     | Copy the `spawn_agent_process` example                                |
| Run tests before hacking further    | `make check && make test`                                             |

## Before you begin

- Python 3.10–3.14 with `pip` or `uv`
- An ACP-capable client such as Zed (recommended for validation)
- Optional: the Gemini CLI (`gemini --experimental-acp`) for the bridge example

## Step 1 — Install the SDK

_Install the library from PyPI or add it to your uv workspace._

```bash
pip install agent-client-protocol
# or
uv add agent-client-protocol
```

## Step 2 — Launch the Echo agent

_Run the provided streaming agent so clients have something to talk to._

Start the ready-made echo example; it streams text blocks back to any ACP client. Leave it running in a terminal:

```bash
python examples/echo_agent.py
```

## Step 3 — Connect from an ACP-aware client

_Point a client at the script and confirm you can exchange streamed updates._

### Zed

Add an Agent Server entry in `settings.json` (Zed → Settings → Agents panel):

```json
{
  "agent_servers": {
    "Echo Agent (Python)": {
      "type": "custom",
      "command": "/abs/path/to/python",
      "args": [
        "/abs/path/to/agentclientprotocol/python-sdk/examples/echo_agent.py"
      ]
    }
  }
}
```

Or, if using `uv`:

```json
{
  "agent_servers": {
    "Echo Agent (Python)": {
      "type": "custom",
      "command": "uv",
      "args": [
        "run",
        "/abs/path/to/agentclientprotocol/python-sdk/examples/echo_agent.py"
      ],
    }
  }
}
```

Open the Agents panel and start the session. Each message you send should be echoed back via streamed `session/update` notifications.

### Other clients

Any ACP client that communicates over stdio can spawn the same script; no additional transport configuration is required.

### Programmatic launch

Prefer to drive agents directly from Python? The `spawn_agent_process` helper wires stdio and lifecycle management for you:

```python
import asyncio
import sys
from pathlib import Path
from typing import Any

from acp import spawn_agent_process, text_block
from acp.interfaces import Client


class SimpleClient(Client):
    async def request_permission(
        self, options, session_id, tool_call, **kwargs: Any
    ):
        return {"outcome": {"outcome": "cancelled"}}

    async def session_update(self, session_id, update, **kwargs):
        print("update:", session_id, update)


async def main() -> None:
    script = Path("examples/echo_agent.py")
    async with spawn_agent_process(SimpleClient(), sys.executable, str(script)) as (conn, _proc):
        await conn.initialize(protocol_version=1)
        session = await conn.new_session(cwd=str(script.parent), mcp_servers=[])
        await conn.prompt(
            session_id=session.session_id,
            prompt=[text_block("Hello from spawn!")],
        )

asyncio.run(main())
```

`spawn_agent_process` manages the child process, wires its stdio into ACP framing, and closes everything when the block exits. The mirror helper `spawn_client_process` lets you drive an ACP client from Python as well.

## Step 4 — Extend the agent

_Swap the echo demo for your own `Agent` subclass._

Create your own agent by subclassing `acp.Agent`. The pattern mirrors the echo example:

```python
from acp import Agent, PromptResponse


class MyAgent(Agent):
    async def prompt(self, prompt, session_id, **kwargs) -> PromptResponse:
        # inspect prompt, stream updates, then finish the turn
        return PromptResponse(stop_reason="end_turn")
```

Run it with `run_agent()` inside an async entrypoint and wire it to your client. Refer to:

- [`examples/echo_agent.py`](https://github.com/agentclientprotocol/python-sdk/blob/main/examples/echo_agent.py) for the smallest streaming agent
- [`examples/agent.py`](https://github.com/agentclientprotocol/python-sdk/blob/main/examples/agent.py) for an implementation that negotiates capabilities and streams richer updates
- [`examples/duet.py`](https://github.com/agentclientprotocol/python-sdk/blob/main/examples/duet.py) to see `spawn_agent_process` in action alongside the interactive client
- [`examples/gemini.py`](https://github.com/agentclientprotocol/python-sdk/blob/main/examples/gemini.py) to drive the Gemini CLI (`--experimental-acp`) directly from Python

Need builders for common payloads? `acp.helpers` mirrors the Go/TS helper APIs:

```python
from acp import start_tool_call, update_tool_call, text_block, tool_content

start_update = start_tool_call("call-42", "Open file", kind="read", status="pending")
finish_update = update_tool_call(
    "call-42",
    status="completed",
    content=[tool_content(text_block("File opened."))],
)
```

Each helper wraps the generated Pydantic models in `acp.schema`, so the right discriminator fields (`type`, `sessionUpdate`, and friends) are always populated. That keeps examples readable while maintaining the same validation guarantees as constructing the models directly. Golden fixtures in `tests/test_golden.py` ensure the helpers stay in sync with future schema revisions.

## Optional — Talk to the Gemini CLI

_Have the Gemini CLI installed? Run the bridge to exercise permission flows._

If you have the Gemini CLI installed and authenticated:

```bash
python examples/gemini.py --yolo                # auto-approve permission prompts
python examples/gemini.py --sandbox --model gemini-1.5-pro
```

Environment helpers:

- `ACP_GEMINI_BIN` — override the CLI path (defaults to `PATH` lookup)
- `ACP_GEMINI_TEST_ARGS` — extra flags forwarded during the smoke test
- `ACP_ENABLE_GEMINI_TESTS=1` — opt-in toggle for `tests/test_gemini_example.py`

Authentication hiccups (e.g. missing `GOOGLE_CLOUD_PROJECT`) are surfaced but treated as skips during testing so the suite stays green on machines without credentials.

## Next steps

- Compare what you built with the real integrations listed on the [Use Cases](use-cases.md) page.
- Explore `docs/contrib.md` for higher-level utilities like session accumulators and permission brokers.
- Run `make check` / `make test` before committing changes, and regenerate schema artifacts with `make gen-all` when ACP versions advance.
- Need help? Start a thread in [GitHub Discussions](https://github.com/agentclientprotocol/python-sdk/discussions) or chat with other ACP developers at [agentclientprotocol.zulipchat.com](https://agentclientprotocol.zulipchat.com/).
````

## File: docs/releasing.md
````markdown
# Releasing

Every package release tracks an upstream ACP schema tag from [`agentclientprotocol/agent-client-protocol`](https://github.com/agentclientprotocol/agent-client-protocol). Follow this checklist to stay in lockstep.

## Prep checklist

1. **Choose the schema tag** (e.g. `v0.4.5`) and regenerate artifacts:
   ```bash
   ACP_SCHEMA_VERSION=v0.4.5 make gen-all
   ```
   This refreshes `schema/` and the generated `src/acp/schema.py`.
2. **Bump the SDK version** in `pyproject.toml` using a PEP 440 version string (for example `0.9.0a1` for an alpha release), and sync `uv.lock` if the lockfile is tracked.
3. **Run the standard gates:**
   ```bash
   make check   # Ruff format/lint, type analysis, dep hygiene
   make test    # pytest + doctests
   ```
4. **Refresh docs + examples** so user-facing flows (e.g. Gemini bridge) reflect behaviour in the new schema.

## Commit & review

- Keep the diff tight: regenerated schema files, version bumps, doc updates, and any required fixture refresh (goldens, RPC tests, etc.).
- Use a Conventional Commit such as `release: 0.9.0a1`.
- In the PR description, capture:
  - The ACP schema tag you targeted.
  - Output from `make check` / `make test` (and optional Gemini tests if you ran them).
  - Behavioural or API highlights that reviewers should focus on.

## Publish via GitHub Release

Releases are automated by `on-release-main.yml` once the PR lands on `main`.

1. Draft a GitHub Release for the new tag (the UI creates the tag if missing).
   Use the exact package version as the tag, for example `0.9.0a1` or `0.9.0`.
2. Publishing the release triggers the workflow, which:
   - Syncs the tag back into `pyproject.toml`.
   - Builds and uploads to PyPI via `uv publish` using `PYPI_TOKEN`.
   - Deploys updated docs with `mkdocs gh-deploy`.

No local build/publish steps are needed—just provide a clear release summary (highlights, compatibility notes, migration tips).

## Extra tips

- Breaking schema bumps often mean updating `tests/test_golden.py`, `tests/test_rpc.py`, and any examples touched by new fields.
- Use `make clean` if you need a fresh slate before re-running `make gen-all`.
- When available, run the Gemini smoke test (`ACP_ENABLE_GEMINI_TESTS=1`, set `ACP_GEMINI_BIN`) to catch regressions early.
````

## File: docs/use-cases.md
````markdown
# Use Cases

This page mirrors the quick-read style of the README/index: skim the tables, copy links, and see how others apply the SDK. For the protocol overview itself, visit the official [agent](https://agentclientprotocol.com/overview/agents) and [client](https://agentclientprotocol.com/overview/clients) guides.

## Agents

| Project | What it showcases |
| --- | --- |
| [MoonshotAI/kimi-cli](https://github.com/MoonshotAI/kimi-cli) | A CLI-first ACP+MCP agent that helps with software dev and terminal workflows. Highlights streaming updates, permission prompts, and tool call UX. |
| [MiniMax-AI/Mini-Agent](https://github.com/MiniMax-AI/Mini-Agent) | A minimal yet professional single agent demo project that showcases the core execution pipeline and production-grade features of agents. |
| [OpenHands/OpenHands-CLI](https://github.com/OpenHands/OpenHands-CLI) | A lightweight, modern CLI to interact with the OpenHands agent. |
| [evalstate/fast-agent](https://github.com/evalstate/fast-agent) | Define, Prompt and Test MCP enabled Agents and Workflows |

## Clients

| Project | What it showcases |
| --- | --- |
| [wiki3-ai/agent-client-kernel](https://github.com/wiki3-ai/agent-client-kernel) | A Jupyter kernel that speaks ACP so notebooks can chat with external agents. Great reference if you’re embedding ACP in notebook tooling. |
| [OhadRubin/simple-acp-client](https://github.com/OhadRubin/simple-acp-client) | A Claude Agent SDK–style Python client that wraps ACP executables with a friendly API. Use it as a starting point for bespoke clients. |

## Add your integration

Shipping something with this SDK? Tell us!

- Open an issue or PR with a short blurb and link.
- Start a thread in [GitHub Discussions](https://github.com/agentclientprotocol/python-sdk/discussions).
- Drop a note in [agentclientprotocol.zulipchat.com](https://agentclientprotocol.zulipchat.com/).

We’ll keep this list current so newcomers can see what’s possible.
````

## File: examples/agent.py
````python
import asyncio
import logging
from typing import Any

from acp import (
    PROTOCOL_VERSION,
    Agent,
    AuthenticateResponse,
    InitializeResponse,
    LoadSessionResponse,
    NewSessionResponse,
    PromptResponse,
    SetSessionModeResponse,
    run_agent,
    text_block,
    update_agent_message,
)
from acp.interfaces import Client
from acp.schema import (
    AgentCapabilities,
    AgentMessageChunk,
    AudioContentBlock,
    ClientCapabilities,
    EmbeddedResourceContentBlock,
    HttpMcpServer,
    ImageContentBlock,
    Implementation,
    McpServerStdio,
    ResourceContentBlock,
    SseMcpServer,
    TextContentBlock,
)


class ExampleAgent(Agent):
    _conn: Client

    def __init__(self) -> None:
        self._next_session_id = 0
        self._sessions: set[str] = set()

    def on_connect(self, conn: Client) -> None:
        self._conn = conn

    async def _send_agent_message(self, session_id: str, content: Any) -> None:
        update = content if isinstance(content, AgentMessageChunk) else update_agent_message(content)
        await self._conn.session_update(session_id, update)

    async def initialize(
        self,
        protocol_version: int,
        client_capabilities: ClientCapabilities | None = None,
        client_info: Implementation | None = None,
        **kwargs: Any,
    ) -> InitializeResponse:
        logging.info("Received initialize request")
        return InitializeResponse(
            protocol_version=PROTOCOL_VERSION,
            agent_capabilities=AgentCapabilities(),
            agent_info=Implementation(name="example-agent", title="Example Agent", version="0.1.0"),
        )

    async def authenticate(self, method_id: str, **kwargs: Any) -> AuthenticateResponse | None:
        logging.info("Received authenticate request %s", method_id)
        return AuthenticateResponse()

    async def new_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio], **kwargs: Any
    ) -> NewSessionResponse:
        logging.info("Received new session request")
        session_id = str(self._next_session_id)
        self._next_session_id += 1
        self._sessions.add(session_id)
        return NewSessionResponse(session_id=session_id, modes=None)

    async def load_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio], session_id: str, **kwargs: Any
    ) -> LoadSessionResponse | None:
        logging.info("Received load session request %s", session_id)
        self._sessions.add(session_id)
        return LoadSessionResponse()

    async def set_session_mode(self, mode_id: str, session_id: str, **kwargs: Any) -> SetSessionModeResponse | None:
        logging.info("Received set session mode request %s -> %s", session_id, mode_id)
        return SetSessionModeResponse()

    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        **kwargs: Any,
    ) -> PromptResponse:
        logging.info("Received prompt request for session %s", session_id)
        if session_id not in self._sessions:
            self._sessions.add(session_id)

        await self._send_agent_message(session_id, text_block("Client sent:"))
        for block in prompt:
            await self._send_agent_message(session_id, block)
        return PromptResponse(stop_reason="end_turn")

    async def cancel(self, session_id: str, **kwargs: Any) -> None:
        logging.info("Received cancel notification for session %s", session_id)

    async def ext_method(self, method: str, params: dict[str, Any]) -> dict[str, Any]:
        logging.info("Received extension method call: %s", method)
        return {"example": "response"}

    async def ext_notification(self, method: str, params: dict[str, Any]) -> None:
        logging.info("Received extension notification: %s", method)


async def main() -> None:
    logging.basicConfig(level=logging.INFO)
    await run_agent(ExampleAgent())


if __name__ == "__main__":
    asyncio.run(main())
````

## File: examples/client.py
````python
import asyncio
import asyncio.subprocess as aio_subprocess
import contextlib
import logging
import os
import sys
from pathlib import Path
from typing import Any

from acp import (
    PROTOCOL_VERSION,
    Client,
    RequestError,
    connect_to_agent,
    text_block,
)
from acp.core import ClientSideConnection
from acp.schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AudioContentBlock,
    AvailableCommandsUpdate,
    ClientCapabilities,
    CreateTerminalResponse,
    CurrentModeUpdate,
    EmbeddedResourceContentBlock,
    EnvVariable,
    ImageContentBlock,
    Implementation,
    KillTerminalResponse,
    PermissionOption,
    ReadTextFileResponse,
    ReleaseTerminalResponse,
    RequestPermissionResponse,
    ResourceContentBlock,
    TerminalOutputResponse,
    TextContentBlock,
    ToolCall,
    ToolCallProgress,
    ToolCallStart,
    UserMessageChunk,
    WaitForTerminalExitResponse,
    WriteTextFileResponse,
)


class ExampleClient(Client):
    async def request_permission(
        self, options: list[PermissionOption], session_id: str, tool_call: ToolCall, **kwargs: Any
    ) -> RequestPermissionResponse:
        raise RequestError.method_not_found("session/request_permission")

    async def write_text_file(
        self, content: str, path: str, session_id: str, **kwargs: Any
    ) -> WriteTextFileResponse | None:
        raise RequestError.method_not_found("fs/write_text_file")

    async def read_text_file(
        self, path: str, session_id: str, limit: int | None = None, line: int | None = None, **kwargs: Any
    ) -> ReadTextFileResponse:
        raise RequestError.method_not_found("fs/read_text_file")

    async def create_terminal(
        self,
        command: str,
        session_id: str,
        args: list[str] | None = None,
        cwd: str | None = None,
        env: list[EnvVariable] | None = None,
        output_byte_limit: int | None = None,
        **kwargs: Any,
    ) -> CreateTerminalResponse:
        raise RequestError.method_not_found("terminal/create")

    async def terminal_output(self, session_id: str, terminal_id: str, **kwargs: Any) -> TerminalOutputResponse:
        raise RequestError.method_not_found("terminal/output")

    async def release_terminal(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> ReleaseTerminalResponse | None:
        raise RequestError.method_not_found("terminal/release")

    async def wait_for_terminal_exit(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> WaitForTerminalExitResponse:
        raise RequestError.method_not_found("terminal/wait_for_exit")

    async def kill_terminal(self, session_id: str, terminal_id: str, **kwargs: Any) -> KillTerminalResponse | None:
        raise RequestError.method_not_found("terminal/kill")

    async def session_update(
        self,
        session_id: str,
        update: UserMessageChunk
        | AgentMessageChunk
        | AgentThoughtChunk
        | ToolCallStart
        | ToolCallProgress
        | AgentPlanUpdate
        | AvailableCommandsUpdate
        | CurrentModeUpdate,
        **kwargs: Any,
    ) -> None:
        if not isinstance(update, AgentMessageChunk):
            return

        content = update.content
        text: str
        if isinstance(content, TextContentBlock):
            text = content.text
        elif isinstance(content, ImageContentBlock):
            text = "<image>"
        elif isinstance(content, AudioContentBlock):
            text = "<audio>"
        elif isinstance(content, ResourceContentBlock):
            text = content.uri or "<resource>"
        elif isinstance(content, EmbeddedResourceContentBlock):
            text = "<resource>"
        else:
            text = "<content>"

        print(f"| Agent: {text}")

    async def ext_method(self, method: str, params: dict) -> dict:
        raise RequestError.method_not_found(method)

    async def ext_notification(self, method: str, params: dict) -> None:
        raise RequestError.method_not_found(method)


async def read_console(prompt: str) -> str:
    loop = asyncio.get_running_loop()
    return await loop.run_in_executor(None, lambda: input(prompt))


async def interactive_loop(conn: ClientSideConnection, session_id: str) -> None:
    while True:
        try:
            line = await read_console("> ")
        except EOFError:
            break
        except KeyboardInterrupt:
            print("", file=sys.stderr)
            break

        if not line:
            continue

        try:
            await conn.prompt(
                session_id=session_id,
                prompt=[text_block(line)],
            )
        except Exception as exc:
            logging.error("Prompt failed: %s", exc)  # noqa: TRY400


async def main(argv: list[str]) -> int:
    logging.basicConfig(level=logging.INFO)

    if len(argv) < 2:
        print("Usage: python examples/client.py AGENT_PROGRAM [ARGS...]", file=sys.stderr)
        return 2

    program = argv[1]
    args = argv[2:]

    program_path = Path(program)
    spawn_program = program
    spawn_args = args

    if program_path.exists() and not os.access(program_path, os.X_OK):
        spawn_program = sys.executable
        spawn_args = [str(program_path), *args]

    proc = await asyncio.create_subprocess_exec(
        spawn_program,
        *spawn_args,
        stdin=aio_subprocess.PIPE,
        stdout=aio_subprocess.PIPE,
    )

    if proc.stdin is None or proc.stdout is None:
        print("Agent process does not expose stdio pipes", file=sys.stderr)
        return 1

    client_impl = ExampleClient()
    conn = connect_to_agent(client_impl, proc.stdin, proc.stdout)

    await conn.initialize(
        protocol_version=PROTOCOL_VERSION,
        client_capabilities=ClientCapabilities(),
        client_info=Implementation(name="example-client", title="Example Client", version="0.1.0"),
    )
    session = await conn.new_session(mcp_servers=[], cwd=os.getcwd())

    await interactive_loop(conn, session.session_id)

    if proc.returncode is None:
        proc.terminate()
        with contextlib.suppress(ProcessLookupError):
            await proc.wait()

    return 0


if __name__ == "__main__":
    raise SystemExit(asyncio.run(main(sys.argv)))
````

## File: examples/duet.py
````python
import asyncio
import importlib.util
import os
import sys
from pathlib import Path

from acp import PROTOCOL_VERSION, spawn_agent_process


def _load_client_module(path: Path):
    spec = importlib.util.spec_from_file_location("examples_client", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"Unable to load client module from {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules.setdefault("examples_client", module)
    spec.loader.exec_module(module)
    return module


async def main() -> int:
    root = Path(__file__).resolve().parent
    agent_path = root / "agent.py"

    env = os.environ.copy()
    src_dir = str((root.parent / "src").resolve())
    env["PYTHONPATH"] = src_dir + os.pathsep + env.get("PYTHONPATH", "")

    client_module = _load_client_module(root / "client.py")
    client = client_module.ExampleClient()

    async with spawn_agent_process(client, sys.executable, str(agent_path), env=env) as (
        conn,
        process,
    ):
        await conn.initialize(protocol_version=PROTOCOL_VERSION, client_capabilities=None)
        session = await conn.new_session(mcp_servers=[], cwd=str(root))
        await client_module.interactive_loop(conn, session.session_id)

    return process.returncode or 0


if __name__ == "__main__":
    raise SystemExit(asyncio.run(main()))
````

## File: examples/echo_agent.py
````python
# /// script
# requires-python = ">=3.10,<3.15"
# dependencies = [
#     "agent-client-protocol",
# ]
# ///
import asyncio
from typing import Any
from uuid import uuid4

from acp import (
    Agent,
    InitializeResponse,
    NewSessionResponse,
    PromptResponse,
    run_agent,
    text_block,
    update_agent_message,
)
from acp.interfaces import Client
from acp.schema import (
    AudioContentBlock,
    ClientCapabilities,
    EmbeddedResourceContentBlock,
    HttpMcpServer,
    ImageContentBlock,
    Implementation,
    McpServerStdio,
    ResourceContentBlock,
    SseMcpServer,
    TextContentBlock,
)


class EchoAgent(Agent):
    _conn: Client

    def on_connect(self, conn: Client) -> None:
        self._conn = conn

    async def initialize(
        self,
        protocol_version: int,
        client_capabilities: ClientCapabilities | None = None,
        client_info: Implementation | None = None,
        **kwargs: Any,
    ) -> InitializeResponse:
        return InitializeResponse(protocol_version=protocol_version)

    async def new_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio], **kwargs: Any
    ) -> NewSessionResponse:
        return NewSessionResponse(session_id=uuid4().hex)

    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        **kwargs: Any,
    ) -> PromptResponse:
        for block in prompt:
            text = block.get("text", "") if isinstance(block, dict) else getattr(block, "text", "")
            chunk = update_agent_message(text_block(text))
            chunk.field_meta = {"echo": True}
            chunk.content.field_meta = {"echo": True}

            await self._conn.session_update(session_id=session_id, update=chunk, source="echo_agent")
        return PromptResponse(stop_reason="end_turn")


async def main() -> None:
    await run_agent(EchoAgent())


if __name__ == "__main__":
    asyncio.run(main())
````

## File: examples/gemini.py
````python
from __future__ import annotations

import argparse
import asyncio
import asyncio.subprocess
import contextlib
import json
import os
import shutil
import sys
from collections.abc import Iterable
from pathlib import Path
from typing import Any

from acp import (
    PROTOCOL_VERSION,
    Client,
    RequestError,
    connect_to_agent,
    text_block,
)
from acp.core import ClientSideConnection
from acp.schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AllowedOutcome,
    AvailableCommandsUpdate,
    ClientCapabilities,
    CreateTerminalResponse,
    CurrentModeUpdate,
    DeniedOutcome,
    EmbeddedResourceContentBlock,
    EnvVariable,
    FileEditToolCallContent,
    FileSystemCapabilities,
    KillTerminalResponse,
    PermissionOption,
    ReadTextFileResponse,
    ReleaseTerminalResponse,
    RequestPermissionResponse,
    ResourceContentBlock,
    TerminalOutputResponse,
    TerminalToolCallContent,
    TextContentBlock,
    ToolCall,
    ToolCallProgress,
    ToolCallStart,
    UserMessageChunk,
    WaitForTerminalExitResponse,
    WriteTextFileResponse,
)


class GeminiClient(Client):
    """Minimal client implementation that can drive the Gemini CLI over ACP."""

    def __init__(self, auto_approve: bool) -> None:
        self._auto_approve = auto_approve

    async def request_permission(
        self, options: list[PermissionOption], session_id: str, tool_call: ToolCall, **kwargs: Any
    ) -> RequestPermissionResponse:
        if self._auto_approve:
            option = _pick_preferred_option(options)
            if option is None:
                return RequestPermissionResponse(outcome=DeniedOutcome(outcome="cancelled"))
            return RequestPermissionResponse(outcome=AllowedOutcome(option_id=option.option_id, outcome="selected"))

        title = tool_call.title or "<permission>"
        if not options:
            print(f"\n🔐 Permission requested: {title} (no options, cancelling)")
            return RequestPermissionResponse(outcome=DeniedOutcome(outcome="cancelled"))
        print(f"\n🔐 Permission requested: {title}")
        for idx, opt in enumerate(options, start=1):
            print(f"  {idx}. {opt.name} ({opt.kind})")

        loop = asyncio.get_running_loop()
        while True:
            choice = await loop.run_in_executor(None, lambda: input("Select option: ").strip())
            if not choice:
                continue
            if choice.isdigit():
                idx = int(choice) - 1
                if 0 <= idx < len(options):
                    opt = options[idx]
                    return RequestPermissionResponse(
                        outcome=AllowedOutcome(option_id=opt.option_id, outcome="selected")
                    )
            print("Invalid selection, try again.")

    async def write_text_file(
        self, content: str, path: str, session_id: str, **kwargs: Any
    ) -> WriteTextFileResponse | None:
        pathlib_path = Path(path)
        if not pathlib_path.is_absolute():
            raise RequestError.invalid_params({"path": pathlib_path, "reason": "path must be absolute"})
        pathlib_path.parent.mkdir(parents=True, exist_ok=True)
        pathlib_path.write_text(content)
        print(f"[Client] Wrote {pathlib_path} ({len(content)} bytes)")
        return WriteTextFileResponse()

    async def read_text_file(
        self, path: str, session_id: str, limit: int | None = None, line: int | None = None, **kwargs: Any
    ) -> ReadTextFileResponse:
        pathlib_path = Path(path)
        if not pathlib_path.is_absolute():
            raise RequestError.invalid_params({"path": pathlib_path, "reason": "path must be absolute"})
        text = pathlib_path.read_text()
        print(f"[Client] Read {pathlib_path} ({len(text)} bytes)")
        if line is not None or limit is not None:
            text = _slice_text(text, line, limit)
        return ReadTextFileResponse(content=text)

    async def session_update(  # noqa: C901
        self,
        session_id: str,
        update: UserMessageChunk
        | AgentMessageChunk
        | AgentThoughtChunk
        | ToolCallStart
        | ToolCallProgress
        | AgentPlanUpdate
        | AvailableCommandsUpdate
        | CurrentModeUpdate,
        **kwargs: Any,
    ) -> None:
        if isinstance(update, AgentMessageChunk):
            _print_text_content(update.content)
        elif isinstance(update, AgentThoughtChunk):
            print("\n[agent_thought]")
            _print_text_content(update.content)
        elif isinstance(update, UserMessageChunk):
            print("\n[user_message]")
            _print_text_content(update.content)
        elif isinstance(update, AgentPlanUpdate):
            print("\n[plan]")
            for entry in update.entries:
                print(f" - {entry.status.upper():<10} {entry.content}")
        elif isinstance(update, ToolCallStart):
            print(f"\n🔧 {update.title} ({update.status or 'pending'})")
        elif isinstance(update, ToolCallProgress):
            status = update.status or "in_progress"
            print(f"\n🔧 Tool call `{update.tool_call_id}` → {status}")
            if update.content:
                for item in update.content:
                    if isinstance(item, FileEditToolCallContent):
                        print(f"  diff: {item.path}")
                    elif isinstance(item, TerminalToolCallContent):
                        print(f"  terminal: {item.terminal_id}")
                    elif isinstance(item, dict):
                        print(f"  content: {json.dumps(item, indent=2)}")
        else:
            print(f"\n[session update] {update}")

    # Optional / terminal-related methods ---------------------------------
    async def create_terminal(
        self,
        command: str,
        session_id: str,
        args: list[str] | None = None,
        cwd: str | None = None,
        env: list[EnvVariable] | None = None,
        output_byte_limit: int | None = None,
        **kwargs: Any,
    ) -> CreateTerminalResponse:
        print(f"[Client] createTerminal: {command} {args or []} (cwd={cwd})")
        return CreateTerminalResponse(terminal_id="term-1")

    async def terminal_output(self, session_id: str, terminal_id: str, **kwargs: Any) -> TerminalOutputResponse:
        print(f"[Client] terminalOutput: {session_id} {terminal_id}")
        return TerminalOutputResponse(output="", truncated=False)

    async def release_terminal(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> ReleaseTerminalResponse | None:
        print(f"[Client] releaseTerminal: {session_id} {terminal_id}")
        return ReleaseTerminalResponse()

    async def wait_for_terminal_exit(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> WaitForTerminalExitResponse:
        print(f"[Client] waitForTerminalExit: {session_id} {terminal_id}")
        return WaitForTerminalExitResponse()

    async def kill_terminal(self, session_id: str, terminal_id: str, **kwargs: Any) -> KillTerminalResponse | None:
        print(f"[Client] killTerminal: {session_id} {terminal_id}")
        return KillTerminalResponse()


def _pick_preferred_option(options: Iterable[PermissionOption]) -> PermissionOption | None:
    best: PermissionOption | None = None
    for option in options:
        if option.kind in {"allow_once", "allow_always"}:
            return option
        best = best or option
    return best


def _slice_text(content: str, line: int | None, limit: int | None) -> str:
    lines = content.splitlines()
    start = 0
    if line:
        start = max(line - 1, 0)
    end = len(lines)
    if limit:
        end = min(start + limit, end)
    return "\n".join(lines[start:end])


def _print_text_content(content: object) -> None:
    if isinstance(content, TextContentBlock):
        print(content.text)
    elif isinstance(content, ResourceContentBlock):
        print(f"{content.name or content.uri}")
    elif isinstance(content, EmbeddedResourceContentBlock):
        resource = content.resource
        text = getattr(resource, "text", None)
        if text:
            print(text)
        else:
            blob = getattr(resource, "blob", None)
            print(blob if blob else "<embedded resource>")
    elif isinstance(content, dict):
        text = content.get("text")  # type: ignore[union-attr]
        if text:
            print(text)


async def interactive_loop(conn: ClientSideConnection, session_id: str) -> None:
    print("Type a message and press Enter to send.")
    print("Commands: :cancel, :exit")

    loop = asyncio.get_running_loop()
    while True:
        try:
            line = await loop.run_in_executor(None, lambda: input("\n> ").strip())
        except (EOFError, KeyboardInterrupt):
            print("\nExiting.")
            break

        if not line:
            continue
        if line in {":exit", ":quit"}:
            break
        if line == ":cancel":
            await conn.cancel(session_id=session_id)
            continue

        try:
            await conn.prompt(
                session_id=session_id,
                prompt=[text_block(line)],
            )
        except RequestError as err:
            _print_request_error("prompt", err)
        except Exception as exc:
            print(f"Prompt failed: {exc}", file=sys.stderr)


def _resolve_gemini_cli(binary: str | None) -> str:
    if binary:
        return binary
    env_value = os.environ.get("ACP_GEMINI_BIN")
    if env_value:
        return env_value
    resolved = shutil.which("gemini")
    if resolved:
        return resolved
    raise FileNotFoundError("Unable to locate `gemini` CLI, provide --gemini path")


async def run(argv: list[str]) -> int:  # noqa: C901
    parser = argparse.ArgumentParser(description="Interact with the Gemini CLI over ACP.")
    parser.add_argument("--gemini", help="Path to the Gemini CLI binary")
    parser.add_argument("--model", help="Model identifier to pass to Gemini")
    parser.add_argument("--sandbox", action="store_true", help="Enable Gemini sandbox mode")
    parser.add_argument("--debug", action="store_true", help="Pass --debug to Gemini")
    parser.add_argument("--yolo", action="store_true", help="Auto-approve permission prompts")
    args = parser.parse_args(argv[1:])

    try:
        gemini_path = _resolve_gemini_cli(args.gemini)
    except FileNotFoundError as exc:
        print(exc, file=sys.stderr)
        return 1

    cmd = [gemini_path, "--experimental-acp"]
    if args.model:
        cmd += ["--model", args.model]
    if args.sandbox:
        cmd.append("--sandbox")
    if args.debug:
        cmd.append("--debug")

    try:
        proc = await asyncio.create_subprocess_exec(
            *cmd,
            stdin=asyncio.subprocess.PIPE,
            stdout=asyncio.subprocess.PIPE,
            stderr=None,
        )
    except FileNotFoundError as exc:
        print(f"Failed to start Gemini CLI: {exc}", file=sys.stderr)
        return 1

    if proc.stdin is None or proc.stdout is None:
        print("Gemini process did not expose stdio pipes.", file=sys.stderr)
        proc.terminate()
        with contextlib.suppress(ProcessLookupError):
            await proc.wait()
        return 1

    client_impl = GeminiClient(auto_approve=args.yolo)
    conn = connect_to_agent(client_impl, proc.stdin, proc.stdout)

    try:
        init_resp = await conn.initialize(
            protocol_version=PROTOCOL_VERSION,
            client_capabilities=ClientCapabilities(
                fs=FileSystemCapabilities(read_text_file=True, write_text_file=True),
                terminal=True,
            ),
        )
    except RequestError as err:
        _print_request_error("initialize", err)
        await _shutdown(proc, conn)
        return 1
    except Exception as exc:
        print(f"initialize error: {exc}", file=sys.stderr)
        await _shutdown(proc, conn)
        return 1

    print(f"✅ Connected to Gemini (protocol v{init_resp.protocol_version})")

    try:
        session = await conn.new_session(
            cwd=os.getcwd(),
            mcp_servers=[],
        )
    except RequestError as err:
        _print_request_error("new_session", err)
        await _shutdown(proc, conn)
        return 1
    except Exception as exc:
        print(f"new_session error: {exc}", file=sys.stderr)
        await _shutdown(proc, conn)
        return 1

    print(f"📝 Created session: {session.session_id}")

    try:
        await interactive_loop(conn, session.session_id)
    finally:
        await _shutdown(proc, conn)

    return 0


def _print_request_error(stage: str, err: RequestError) -> None:
    payload = err.to_error_obj()
    message = payload.get("message", "")
    code = payload.get("code")
    print(f"{stage} error ({code}): {message}", file=sys.stderr)
    data = payload.get("data")
    if data is not None:
        try:
            formatted = json.dumps(data, indent=2)
        except TypeError:
            formatted = str(data)
        print(formatted, file=sys.stderr)


async def _shutdown(proc: asyncio.subprocess.Process, conn: ClientSideConnection) -> None:
    with contextlib.suppress(Exception):
        await conn.close()
    if proc.returncode is None:
        proc.terminate()
        try:
            await asyncio.wait_for(proc.wait(), timeout=5)
        except asyncio.TimeoutError:
            proc.kill()
            await proc.wait()


def main(argv: list[str] | None = None) -> int:
    args = sys.argv if argv is None else argv
    return asyncio.run(run(list(args)))


if __name__ == "__main__":
    raise SystemExit(main())
````

## File: schema/meta.json
````json
{
  "agentMethods": {
    "authenticate": "authenticate",
    "initialize": "initialize",
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
    "AgentCapabilities": {
      "description": "Capabilities supported by the agent.\n\nAdvertised during initialization to inform the client about\navailable features and content types.\n\nSee protocol docs: [Agent Capabilities](https://agentclientprotocol.com/protocol/initialization#agent-capabilities)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "method"
      ],
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
      "required": [
        "id",
        "method"
      ],
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
                      "$ref": "#/$defs/ExtResponse"
                    }
                  ],
                  "title": "ExtMethodResponse"
                }
              ],
              "description": "All possible responses that an agent can send to a client.\n\nThis enum is used internally for routing RPC responses. You typically won't need\nto use this directly - the responses are handled automatically by the connection.\n\nThese are responses to the corresponding `ClientRequest` variants."
            }
          },
          "required": [
            "id",
            "result"
          ],
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
          "required": [
            "id",
            "error"
          ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "audience": {
          "items": {
            "$ref": "#/$defs/Role"
          },
          "type": [
            "array",
            "null"
          ]
        },
        "lastModified": {
          "type": [
            "string",
            "null"
          ]
        },
        "priority": {
          "format": "double",
          "type": [
            "number",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "data",
        "mimeType"
      ],
      "type": "object"
    },
    "AuthCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAuthentication capabilities supported by the client.\n\nAdvertised during initialization to inform the agent which authentication\nmethod types the client can handle. This governs opt-in types that require\nadditional client-side support.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
        },
        "label": {
          "description": "Human-readable label for this variable, displayed in client UI.",
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "name"
      ],
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "description": {
          "description": "Optional description providing more details about this authentication method.",
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "id",
        "name"
      ],
      "type": "object"
    },
    "AuthMethodEnvVar": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nEnvironment variable authentication method.\n\nThe user provides credentials that the client passes to the agent as environment variables.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "description": {
          "description": "Optional description providing more details about this authentication method.",
          "type": [
            "string",
            "null"
          ]
        },
        "id": {
          "description": "Unique identifier for this authentication method.",
          "type": "string"
        },
        "link": {
          "description": "Optional link to a page where the user can obtain their credentials.",
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "id",
        "name",
        "vars"
      ],
      "type": "object"
    },
    "AuthMethodTerminal": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nTerminal-based authentication method.\n\nThe client runs an interactive terminal for the user to authenticate via a TUI.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "id",
        "name"
      ],
      "type": "object"
    },
    "AuthenticateRequest": {
      "description": "Request parameters for the authenticate method.\n\nSpecifies which authentication method to use.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "methodId": {
          "description": "The ID of the authentication method to use.\nMust be one of the methods advertised in the initialize response.",
          "type": "string"
        }
      },
      "required": [
        "methodId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "name",
        "description"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "availableCommands": {
          "description": "Commands the agent can execute",
          "items": {
            "$ref": "#/$defs/AvailableCommand"
          },
          "type": "array"
        }
      },
      "required": [
        "availableCommands"
      ],
      "type": "object"
    },
    "BlobResourceContents": {
      "description": "Binary resource contents.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "blob": {
          "type": "string"
        },
        "mimeType": {
          "type": [
            "string",
            "null"
          ]
        },
        "uri": {
          "type": "string"
        }
      },
      "required": [
        "blob",
        "uri"
      ],
      "type": "object"
    },
    "CancelNotification": {
      "description": "Notification to cancel ongoing operations for a session.\n\nSee protocol docs: [Cancellation](https://agentclientprotocol.com/protocol/prompt-turn#cancellation)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "requestId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
        "terminal": {
          "default": false,
          "description": "Whether the Client support all `terminal/*` methods.",
          "type": "boolean"
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
      "required": [
        "method"
      ],
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
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResumes an existing session without returning previous messages.\n\nThis method is only available if the agent advertises the `session.resume` capability.\n\nThe agent should resume the session context, allowing the conversation to continue\nwithout replaying the message history (unlike `session/load`).",
                  "title": "ResumeSessionRequest"
                },
                {
                  "allOf": [
                    {
                      "$ref": "#/$defs/CloseSessionRequest"
                    }
                  ],
                  "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCloses an active session and frees up any resources associated with it.\n\nThis method is only available if the agent advertises the `session.close` capability.\n\nThe agent must cancel any ongoing work (as if `session/cancel` was called)\nand then free up any resources associated with the session.",
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
      "required": [
        "id",
        "method"
      ],
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
                      "$ref": "#/$defs/ExtResponse"
                    }
                  ],
                  "title": "ExtMethodResponse"
                }
              ],
              "description": "All possible responses that a client can send to an agent.\n\nThis enum is used internally for routing RPC responses. You typically won't need\nto use this directly - the responses are handled automatically by the connection.\n\nThese are responses to the corresponding `AgentRequest` variants."
            }
          },
          "required": [
            "id",
            "result"
          ],
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
          "required": [
            "id",
            "error"
          ],
          "title": "Error",
          "type": "object"
        }
      ],
      "x-docs-ignore": true
    },
    "CloseSessionRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for closing an active session.\n\nIf supported, the agent **must** cancel any ongoing work related to the session\n(treat it as if `session/cancel` was called) and then free up any resources\nassociated with the session.\n\nOnly available if the Agent supports the `session.close` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId"
      ],
      "type": "object",
      "x-method": "session/close",
      "x-side": "agent"
    },
    "CloseSessionResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse from closing a session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        }
      },
      "type": "object",
      "x-method": "session/close",
      "x-side": "agent"
    },
    "ConfigOptionUpdate": {
      "description": "Session configuration options have been updated.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "configOptions": {
          "description": "The full set of configuration options and their current values.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": "array"
        }
      },
      "required": [
        "configOptions"
      ],
      "type": "object"
    },
    "Content": {
      "description": "Standard content block (text, images, resources).",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "content"
      ],
      "type": "object"
    },
    "ContentBlock": {
      "description": "Content blocks represent displayable information in the Agent Client Protocol.\n\nThey provide a structured way to handle various types of user-facing content\u2014whether\nit's text from language models, images for analysis, or embedded resources for context.\n\nContent blocks appear in:\n- User prompts sent via `session/prompt`\n- Language model output streamed through `session/update` notifications\n- Progress updates and results from tool calls\n\nThis structure is compatible with the Model Context Protocol (MCP), enabling\nagents to seamlessly forward content from MCP tool outputs without transformation.\n\nSee protocol docs: [Content](https://agentclientprotocol.com/protocol/content)",
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
        }
      },
      "required": [
        "content"
      ],
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
      "required": [
        "amount",
        "currency"
      ],
      "type": "object"
    },
    "CreateTerminalRequest": {
      "description": "Request to create a new terminal and execute a command.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
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
          "type": [
            "integer",
            "null"
          ]
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
      "required": [
        "sessionId",
        "command"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "terminalId": {
          "description": "The unique identifier for the created terminal.",
          "type": "string"
        }
      },
      "required": [
        "terminalId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "currentModeId"
      ],
      "type": "object"
    },
    "Diff": {
      "description": "A diff representing file modifications.\n\nShows changes to files in a format suitable for display in the client UI.\n\nSee protocol docs: [Content](https://agentclientprotocol.com/protocol/tool-calls#content)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "newText": {
          "description": "The new content after modification.",
          "type": "string"
        },
        "oldText": {
          "description": "The original content (None for new files).",
          "type": [
            "string",
            "null"
          ]
        },
        "path": {
          "description": "The file path being modified.",
          "type": "string"
        }
      },
      "required": [
        "path",
        "newText"
      ],
      "type": "object"
    },
    "EmbeddedResource": {
      "description": "The contents of a resource, embedded into a prompt or tool call result.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "resource"
      ],
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
    "EnvVariable": {
      "description": "An environment variable to set when launching an MCP server.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "name",
        "value"
      ],
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
      "required": [
        "code",
        "message"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "cwd"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": [
            "array",
            "null"
          ]
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
      "required": [
        "sessionId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "name",
        "value"
      ],
      "type": "object"
    },
    "ImageContent": {
      "description": "An image provided to or from an LLM.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
        }
      },
      "required": [
        "data",
        "mimeType"
      ],
      "type": "object"
    },
    "Implementation": {
      "description": "Metadata about the implementation of the client or agent.\nDescribes the name and version of an MCP implementation, with an optional\ntitle for UI representation.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "name": {
          "description": "Intended for programmatic or logical use, but can be used as a display\nname fallback if title isn\u2019t present.",
          "type": "string"
        },
        "title": {
          "description": "Intended for UI and end-user contexts \u2014 optimized to be human-readable\nand easily understood.\n\nIf not provided, the name should be used for display.",
          "type": [
            "string",
            "null"
          ]
        },
        "version": {
          "description": "Version of the implementation. Can be displayed to the user or used\nfor debugging or metrics purposes. (e.g. \"1.0.0\").",
          "type": "string"
        }
      },
      "required": [
        "name",
        "version"
      ],
      "type": "object"
    },
    "InitializeRequest": {
      "description": "Request parameters for the initialize method.\n\nSent by the client to establish connection and negotiate capabilities.\n\nSee protocol docs: [Initialization](https://agentclientprotocol.com/protocol/initialization)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "protocolVersion"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "agentCapabilities": {
          "allOf": [
            {
              "$ref": "#/$defs/AgentCapabilities"
            }
          ],
          "default": {
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
      "required": [
        "protocolVersion"
      ],
      "type": "object",
      "x-method": "initialize",
      "x-side": "agent"
    },
    "KillTerminalRequest": {
      "description": "Request to kill a terminal without releasing it.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "terminalId"
      ],
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
          "type": [
            "object",
            "null"
          ]
        }
      },
      "type": "object",
      "x-method": "terminal/kill",
      "x-side": "client"
    },
    "ListSessionsRequest": {
      "description": "Request parameters for listing existing sessions.\n\nOnly available if the Agent supports the `sessionCapabilities.list` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "cursor": {
          "description": "Opaque cursor token from a previous response's nextCursor field for cursor-based pagination",
          "type": [
            "string",
            "null"
          ]
        },
        "cwd": {
          "description": "Filter sessions by working directory. Must be an absolute path.",
          "type": [
            "string",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
        },
        "nextCursor": {
          "description": "Opaque cursor token. If present, pass this in the next request's cursor parameter\nto fetch the next page. If absent, there are no more results.",
          "type": [
            "string",
            "null"
          ]
        },
        "sessions": {
          "description": "Array of session information objects",
          "items": {
            "$ref": "#/$defs/SessionInfo"
          },
          "type": "array"
        }
      },
      "required": [
        "sessions"
      ],
      "type": "object",
      "x-method": "session/list",
      "x-side": "agent"
    },
    "LoadSessionRequest": {
      "description": "Request parameters for loading an existing session.\n\nOnly available if the Agent supports the `loadSession` capability.\n\nSee protocol docs: [Loading Sessions](https://agentclientprotocol.com/protocol/session-setup#loading-sessions)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "mcpServers",
        "cwd",
        "sessionId"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": [
            "array",
            "null"
          ]
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
    "McpCapabilities": {
      "description": "MCP capabilities supported by the agent",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "name",
        "url",
        "headers"
      ],
      "type": "object"
    },
    "McpServerSse": {
      "description": "SSE transport configuration for MCP.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "name",
        "url",
        "headers"
      ],
      "type": "object"
    },
    "McpServerStdio": {
      "description": "Stdio transport configuration for MCP.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "name",
        "command",
        "args",
        "env"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "description": {
          "description": "Optional description of the model.",
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "modelId",
        "name"
      ],
      "type": "object"
    },
    "NewSessionRequest": {
      "description": "Request parameters for creating a new session.\n\nSee protocol docs: [Creating a Session](https://agentclientprotocol.com/protocol/session-setup#creating-a-session)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "cwd",
        "mcpServers"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": [
            "array",
            "null"
          ]
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
      "required": [
        "sessionId"
      ],
      "type": "object",
      "x-method": "session/new",
      "x-side": "agent"
    },
    "PermissionOption": {
      "description": "An option presented to the user when requesting permission.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "optionId",
        "name",
        "kind"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "entries": {
          "description": "The list of tasks to be accomplished.\n\nWhen updating a plan, the agent must send a complete list of all entries\nwith their current status. The client replaces the entire plan with each update.",
          "items": {
            "$ref": "#/$defs/PlanEntry"
          },
          "type": "array"
        }
      },
      "required": [
        "entries"
      ],
      "type": "object"
    },
    "PlanEntry": {
      "description": "A single entry in the execution plan.\n\nRepresents a task or goal that the assistant intends to accomplish\nas part of fulfilling the user's request.\nSee protocol docs: [Plan Entries](https://agentclientprotocol.com/protocol/agent-plan#plan-entries)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "content",
        "priority",
        "status"
      ],
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
    "PromptCapabilities": {
      "description": "Prompt capabilities supported by the agent in `session/prompt` requests.\n\nBaseline agent functionality requires support for [`ContentBlock::Text`]\nand [`ContentBlock::ResourceLink`] in prompt requests.\n\nOther variants must be explicitly opted in to.\nCapabilities for different types of content in prompt requests.\n\nIndicates which content types beyond the baseline (text and resource links)\nthe agent can process.\n\nSee protocol docs: [Prompt Capabilities](https://agentclientprotocol.com/protocol/initialization#prompt-capabilities)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
        },
        "messageId": {
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nA client-generated unique identifier for this user message.\n\nIf provided, the Agent SHOULD echo this value as `userMessageId` in the\n[`PromptResponse`] to confirm it was recorded.\nBoth clients and agents MUST use UUID format for message IDs.",
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "sessionId",
        "prompt"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
        }
      },
      "required": [
        "stopReason"
      ],
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
    "ReadTextFileRequest": {
      "description": "Request to read content from a text file.\n\nOnly available if the client supports the `fs.readTextFile` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "limit": {
          "description": "Maximum number of lines to read.",
          "format": "uint32",
          "minimum": 0,
          "type": [
            "integer",
            "null"
          ]
        },
        "line": {
          "description": "Line number to start reading from (1-based).",
          "format": "uint32",
          "minimum": 0,
          "type": [
            "integer",
            "null"
          ]
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
      "required": [
        "sessionId",
        "path"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "content": {
          "type": "string"
        }
      },
      "required": [
        "content"
      ],
      "type": "object",
      "x-method": "fs/read_text_file",
      "x-side": "client"
    },
    "ReleaseTerminalRequest": {
      "description": "Request to release a terminal and free its resources.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "terminalId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "required": [
            "outcome"
          ],
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
          "required": [
            "outcome"
          ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "toolCall",
        "options"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "outcome"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
        },
        "mimeType": {
          "type": [
            "string",
            "null"
          ]
        },
        "name": {
          "type": "string"
        },
        "size": {
          "format": "int64",
          "type": [
            "integer",
            "null"
          ]
        },
        "title": {
          "type": [
            "string",
            "null"
          ]
        },
        "uri": {
          "type": "string"
        }
      },
      "required": [
        "name",
        "uri"
      ],
      "type": "object"
    },
    "ResumeSessionRequest": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nRequest parameters for resuming an existing session.\n\nResumes an existing session without returning previous messages (unlike `session/load`).\nThis is useful for agents that can resume sessions but don't implement full session loading.\n\nOnly available if the Agent supports the `session.resume` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "cwd"
      ],
      "type": "object",
      "x-method": "session/resume",
      "x-side": "agent"
    },
    "ResumeSessionResponse": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nResponse from resuming an existing session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "configOptions": {
          "description": "Initial session configuration options if supported by the Agent.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": [
            "array",
            "null"
          ]
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
      "enum": [
        "assistant",
        "user"
      ],
      "type": "string"
    },
    "SelectedPermissionOutcome": {
      "description": "The user selected one of the provided options.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "optionId"
      ],
      "type": "object"
    },
    "SessionCapabilities": {
      "description": "Session capabilities supported by the agent.\n\nAs a baseline, all Agents **MUST** support `session/new`, `session/prompt`, `session/cancel`, and `session/update`.\n\nOptionally, they **MAY** support other session methods and notifications by specifying additional capabilities.\n\nNote: `session/load` is still handled by the top-level `load_session` capability. This will be unified in future versions of the protocol.\n\nSee protocol docs: [Session Capabilities](https://agentclientprotocol.com/protocol/initialization#session-capabilities)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWhether the agent supports `session/close`."
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
          "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWhether the agent supports `session/resume`."
        }
      },
      "type": "object"
    },
    "SessionCloseCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCapabilities for the `session/close` method.\n\nBy supplying `{}` it means that the agent supports closing of sessions.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "currentValue"
      ],
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
          "type": "object"
        }
      ],
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "id",
        "name"
      ],
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
      "required": [
        "currentValue",
        "options"
      ],
      "type": "object"
    },
    "SessionConfigSelectGroup": {
      "description": "A group of possible values for a session configuration option.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "group",
        "name",
        "options"
      ],
      "type": "object"
    },
    "SessionConfigSelectOption": {
      "description": "A possible value for a session configuration option.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "description": {
          "description": "Optional description for this option value.",
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "value",
        "name"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
        },
        "updatedAt": {
          "description": "ISO 8601 timestamp of last activity",
          "type": [
            "string",
            "null"
          ]
        }
      },
      "required": [
        "sessionId",
        "cwd"
      ],
      "type": "object"
    },
    "SessionInfoUpdate": {
      "description": "Update to session metadata. All fields are optional to support partial updates.\n\nAgents send this notification to update session information like title or custom metadata.\nThis allows clients to display dynamic session names and track session state changes.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "title": {
          "description": "Human-readable title for the session. Set to null to clear.",
          "type": [
            "string",
            "null"
          ]
        },
        "updatedAt": {
          "description": "ISO 8601 timestamp of last activity. Set to null to clear.",
          "type": [
            "string",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
        },
        "description": {
          "type": [
            "string",
            "null"
          ]
        },
        "id": {
          "$ref": "#/$defs/SessionModeId"
        },
        "name": {
          "type": "string"
        }
      },
      "required": [
        "id",
        "name"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "currentModeId",
        "availableModes"
      ],
      "type": "object"
    },
    "SessionModelState": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe set of models and the one currently active.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "currentModelId",
        "availableModels"
      ],
      "type": "object"
    },
    "SessionNotification": {
      "description": "Notification containing a session update from the agent.\n\nUsed to stream real-time progress and results during prompt processing.\n\nSee protocol docs: [Agent Reports Output](https://agentclientprotocol.com/protocol/prompt-turn#3-agent-reports-output)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "update"
      ],
      "type": "object",
      "x-method": "session/update",
      "x-side": "client"
    },
    "SessionResumeCapabilities": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nCapabilities for the `session/resume` method.\n\nBy supplying `{}` it means that the agent supports resuming of sessions.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
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
          "required": [
            "sessionUpdate"
          ],
          "type": "object"
        }
      ]
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
          "required": [
            "type",
            "value"
          ],
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
          "required": [
            "value"
          ],
          "title": "value_id",
          "type": "object"
        }
      ],
      "description": "Request parameters for setting a session configuration option.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "configId"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "configOptions": {
          "description": "The full set of configuration options and their current values.",
          "items": {
            "$ref": "#/$defs/SessionConfigOption"
          },
          "type": "array"
        }
      },
      "required": [
        "configOptions"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "modeId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "modelId"
      ],
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
          "type": [
            "object",
            "null"
          ]
        }
      },
      "type": "object",
      "x-method": "session/set_model",
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
    "Terminal": {
      "description": "Embed a terminal created with `terminal/create` by its id.\n\nThe terminal must be added before calling `terminal/release`.\n\nSee protocol docs: [Terminal](https://agentclientprotocol.com/protocol/terminals)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "terminalId": {
          "type": "string"
        }
      },
      "required": [
        "terminalId"
      ],
      "type": "object"
    },
    "TerminalExitStatus": {
      "description": "Exit status of a terminal command.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "exitCode": {
          "description": "The process exit code (may be null if terminated by signal).",
          "format": "uint32",
          "minimum": 0,
          "type": [
            "integer",
            "null"
          ]
        },
        "signal": {
          "description": "The signal that terminated the process (may be null if exited normally).",
          "type": [
            "string",
            "null"
          ]
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "terminalId"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "output",
        "truncated"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "text"
      ],
      "type": "object"
    },
    "TextResourceContents": {
      "description": "Text-based resource contents.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
        },
        "mimeType": {
          "type": [
            "string",
            "null"
          ]
        },
        "text": {
          "type": "string"
        },
        "uri": {
          "type": "string"
        }
      },
      "required": [
        "text",
        "uri"
      ],
      "type": "object"
    },
    "ToolCall": {
      "description": "Represents a tool call that the language model has requested.\n\nTool calls are actions that the agent executes on behalf of the language model,\nsuch as reading files, executing code, or fetching data from external sources.\n\nSee protocol docs: [Tool Calls](https://agentclientprotocol.com/protocol/tool-calls)",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "toolCallId",
        "title"
      ],
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "required": [
            "type"
          ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "line": {
          "description": "Optional line number within the file.",
          "format": "uint32",
          "minimum": 0,
          "type": [
            "integer",
            "null"
          ]
        },
        "path": {
          "description": "The file path being accessed or modified.",
          "type": "string"
        }
      },
      "required": [
        "path"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "content": {
          "description": "Replace the content collection.",
          "items": {
            "$ref": "#/$defs/ToolCallContent"
          },
          "type": [
            "array",
            "null"
          ]
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
          "type": [
            "array",
            "null"
          ]
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
          "type": [
            "string",
            "null"
          ]
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
      "required": [
        "toolCallId"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "hint": {
          "description": "A hint to display when the input hasn't been provided yet",
          "type": "string"
        }
      },
      "required": [
        "hint"
      ],
      "type": "object"
    },
    "Usage": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nToken usage information for a prompt turn.",
      "properties": {
        "cachedReadTokens": {
          "description": "Total cache read tokens.",
          "format": "uint64",
          "minimum": 0,
          "type": [
            "integer",
            "null"
          ]
        },
        "cachedWriteTokens": {
          "description": "Total cache write tokens.",
          "format": "uint64",
          "minimum": 0,
          "type": [
            "integer",
            "null"
          ]
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
          "type": [
            "integer",
            "null"
          ]
        },
        "totalTokens": {
          "description": "Sum of all token types across session.",
          "format": "uint64",
          "minimum": 0,
          "type": "integer"
        }
      },
      "required": [
        "totalTokens",
        "inputTokens",
        "outputTokens"
      ],
      "type": "object"
    },
    "UsageUpdate": {
      "description": "**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nContext window and cost update for a session.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "used",
        "size"
      ],
      "type": "object"
    },
    "WaitForTerminalExitRequest": {
      "description": "Request to wait for a terminal command to exit.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "terminalId"
      ],
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
          "type": [
            "object",
            "null"
          ]
        },
        "exitCode": {
          "description": "The process exit code (may be null if terminated by signal).",
          "format": "uint32",
          "minimum": 0,
          "type": [
            "integer",
            "null"
          ]
        },
        "signal": {
          "description": "The signal that terminated the process (may be null if exited normally).",
          "type": [
            "string",
            "null"
          ]
        }
      },
      "type": "object",
      "x-method": "terminal/wait_for_exit",
      "x-side": "client"
    },
    "WriteTextFileRequest": {
      "description": "Request to write content to a text file.\n\nOnly available if the client supports the `fs.writeTextFile` capability.",
      "properties": {
        "_meta": {
          "additionalProperties": true,
          "description": "The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
          "type": [
            "object",
            "null"
          ]
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
      "required": [
        "sessionId",
        "path",
        "content"
      ],
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
          "type": [
            "object",
            "null"
          ]
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
          "enum": [
            "2.0"
          ],
          "type": "string"
        }
      },
      "required": [
        "jsonrpc"
      ],
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
          "enum": [
            "2.0"
          ],
          "type": "string"
        }
      },
      "required": [
        "jsonrpc"
      ],
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

## File: schema/VERSION
````
refs/tags/v0.11.2
````

## File: scripts/__init__.py
````python
"""Utility scripts for generating ACP bindings."""
````

## File: scripts/gen_all.py
````python
#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.append(str(ROOT))

from scripts import gen_meta, gen_schema, gen_signature  # noqa: E402  pylint: disable=wrong-import-position

SCHEMA_DIR = ROOT / "schema"
SCHEMA_JSON = SCHEMA_DIR / "schema.json"
META_JSON = SCHEMA_DIR / "meta.json"
VERSION_FILE = SCHEMA_DIR / "VERSION"

DEFAULT_REPO = "agentclientprotocol/agent-client-protocol"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Regenerate schema.py and meta.py from the ACP schema.")
    parser.add_argument(
        "--version",
        "-v",
        help=(
            "Git ref (tag/branch) of agentclientprotocol/agent-client-protocol to fetch the schema from. "
            "If omitted, uses the cached schema files or falls back to 'main' when missing."
        ),
    )
    parser.add_argument(
        "--repo",
        default=os.environ.get("ACP_SCHEMA_REPO", DEFAULT_REPO),
        help="Source repository providing schema.json/meta.json (default: %(default)s)",
    )
    parser.add_argument(
        "--no-download",
        action="store_true",
        help="Skip downloading schema files even when a version is provided.",
    )
    parser.set_defaults(format_output=True)
    parser.add_argument(
        "--force",
        action="store_true",
        help="Force schema download even if the requested ref is already cached locally.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    version = args.version or os.environ.get("ACP_SCHEMA_VERSION")
    repo = args.repo
    should_download = _should_download(args, version)

    if should_download:
        ref = resolve_ref(version)
        download_schema(repo, ref)
    else:
        ref = resolve_ref(version) if version else _cached_ref()

    if not (SCHEMA_JSON.exists() and META_JSON.exists()):
        print("schema/schema.json or schema/meta.json missing; run with --version to fetch them.", file=sys.stderr)
        sys.exit(1)

    gen_schema.generate_schema()
    gen_meta.generate_meta()
    gen_signature.gen_signature(ROOT / "src" / "acp")

    if ref:
        print(f"Generated schema using ref: {ref}")
    else:
        print("Generated schema using local schema files")


def _should_download(args: argparse.Namespace, version: str | None) -> bool:
    env_override = os.environ.get("ACP_SCHEMA_DOWNLOAD")
    if env_override is not None:
        return env_override.lower() in {"1", "true", "yes"}
    if args.no_download:
        return False
    if version:
        if not SCHEMA_JSON.exists() or not META_JSON.exists():
            return True
        cached = _cached_ref()
        if args.force:
            return True
        return cached != resolve_ref(version)
    return not (SCHEMA_JSON.exists() and META_JSON.exists())


def resolve_ref(version: str | None) -> str:
    if not version:
        return "refs/heads/main"
    if version.startswith("refs/"):
        return version
    if re.fullmatch(r"v?\d+\.\d+\.\d+", version):
        value = version if version.startswith("v") else f"v{version}"
        return f"refs/tags/{value}"
    return f"refs/heads/{version}"


def download_schema(repo: str, ref: str) -> None:
    SCHEMA_DIR.mkdir(parents=True, exist_ok=True)
    schema_url = f"https://raw.githubusercontent.com/{repo}/{ref}/schema/schema.unstable.json"
    meta_url = f"https://raw.githubusercontent.com/{repo}/{ref}/schema/meta.unstable.json"
    try:
        schema_data = fetch_json(schema_url)
        meta_data = fetch_json(meta_url)
    except RuntimeError as exc:  # pragma: no cover - network error path
        print(exc, file=sys.stderr)
        sys.exit(1)

    SCHEMA_JSON.write_text(json.dumps(schema_data, indent=2), encoding="utf-8")
    META_JSON.write_text(json.dumps(meta_data, indent=2), encoding="utf-8")
    VERSION_FILE.write_text(ref + "\n", encoding="utf-8")
    print(f"Fetched schema and meta from {repo}@{ref}")


def fetch_json(url: str) -> dict:
    try:
        with urllib.request.urlopen(url) as response:  # noqa: S310 - trusted source configured by repo
            return json.loads(response.read().decode("utf-8"))
    except urllib.error.URLError as exc:
        raise RuntimeError(f"Failed to fetch {url}: {exc}") from exc


def _cached_ref() -> str | None:
    if VERSION_FILE.exists():
        return VERSION_FILE.read_text(encoding="utf-8").strip() or None
    return None


if __name__ == "__main__":
    main()
````

## File: scripts/gen_meta.py
````python
#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCHEMA_DIR = ROOT / "schema"
VERSION_FILE = SCHEMA_DIR / "VERSION"


def main() -> None:
    generate_meta()


def generate_meta() -> None:
    meta_json = SCHEMA_DIR / "meta.json"
    out_py = ROOT / "src" / "acp" / "meta.py"
    if not meta_json.exists():
        raise SystemExit("schema/meta.json not found. Run gen_schema.py first.")

    data = json.loads(meta_json.read_text("utf-8"))
    agent_methods = data.get("agentMethods", {})
    client_methods = data.get("clientMethods", {})
    version = data.get("version", 1)
    header_lines = ["# Generated from schema/meta.json. Do not edit by hand."]
    if VERSION_FILE.exists():
        ref = VERSION_FILE.read_text("utf-8").strip()
        if ref:
            header_lines.append(f"# Schema ref: {ref}")

    out_py.write_text(
        "\n".join(header_lines)
        + "\n"
        + f"AGENT_METHODS = {agent_methods!r}\n"
        + f"CLIENT_METHODS = {client_methods!r}\n"
        + f"PROTOCOL_VERSION = {int(version)}\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
````

## File: scripts/gen_schema.py
````python
#!/usr/bin/env python3
from __future__ import annotations

import ast
import json
import re
import subprocess
import sys
import textwrap
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCHEMA_DIR = ROOT / "schema"
SCHEMA_JSON = SCHEMA_DIR / "schema.json"
VERSION_FILE = SCHEMA_DIR / "VERSION"
SCHEMA_OUT = ROOT / "src" / "acp" / "schema.py"

# Pattern caches used when post-processing generated schema.
FIELD_DECLARATION_PATTERN = re.compile(r"[A-Za-z_][A-Za-z0-9_]*\s*:")
DESCRIPTION_PATTERN = re.compile(
    r"description\s*=\s*(?P<prefix>[rRbBuU]*)?(?P<quote>'''|\"\"\"|'|\")(?P<value>.*?)(?P=quote)",
    re.DOTALL,
)

STDIO_TYPE_LITERAL = 'Literal["2#-datamodel-code-generator-#-object-#-special-#"]'
MODELS_TO_REMOVE = [
    "AgentClientProtocol",
    "AgentClientProtocol1",
    "AgentClientProtocol2",
    "AgentClientProtocol3",
    "AgentClientProtocol4",
    "AgentClientProtocol5",
    "AgentClientProtocol6",
]

# Map of numbered classes produced by datamodel-code-generator to descriptive names.
# Keep this in sync with the Rust/TypeScript SDK nomenclature.
RENAME_MAP: dict[str, str] = {
    "AgentResponse1": "AgentResponseMessage",
    "AgentResponse2": "AgentErrorMessage",
    "ClientResponse1": "ClientResponseMessage",
    "ClientResponse2": "ClientErrorMessage",
    "ContentBlock1": "TextContentBlock",
    "ContentBlock2": "ImageContentBlock",
    "ContentBlock3": "AudioContentBlock",
    "ContentBlock4": "ResourceContentBlock",
    "ContentBlock5": "EmbeddedResourceContentBlock",
    "McpServer1": "HttpMcpServer",
    "McpServer2": "SseMcpServer",
    "RequestPermissionOutcome1": "DeniedOutcome",
    "RequestPermissionOutcome2": "AllowedOutcome",
    "AuthMethod1": "EnvVarAuthMethod",
    "AuthMethod2": "TerminalAuthMethod",
    "SessionConfigOption1": "SessionConfigOptionSelect",
    "SessionConfigOption2": "SessionConfigOptionBoolean",
    "SetSessionConfigOptionRequest1": "SetSessionConfigOptionBooleanRequest",
    "SetSessionConfigOptionRequest2": "SetSessionConfigOptionSelectRequest",
    "SessionUpdate1": "UserMessageChunk",
    "SessionUpdate2": "AgentMessageChunk",
    "SessionUpdate3": "AgentThoughtChunk",
    "SessionUpdate4": "ToolCallStart",
    "SessionUpdate5": "ToolCallProgress",
    "SessionUpdate6": "AgentPlanUpdate",
    "SessionUpdate7": "AvailableCommandsUpdate",
    "SessionUpdate8": "CurrentModeUpdate",
    "SessionUpdate9": "ConfigOptionUpdate",
    "SessionUpdate10": "SessionInfoUpdate",
    "SessionUpdate11": "UsageUpdate",
    "ToolCallContent1": "ContentToolCallContent",
    "ToolCallContent2": "FileEditToolCallContent",
    "ToolCallContent3": "TerminalToolCallContent",
}

ENUM_LITERAL_MAP: dict[str, tuple[str, ...]] = {
    "PermissionOptionKind": (
        "allow_once",
        "allow_always",
        "reject_once",
        "reject_always",
    ),
    "PlanEntryPriority": ("high", "medium", "low"),
    "PlanEntryStatus": ("pending", "in_progress", "completed"),
    "StopReason": ("end_turn", "max_tokens", "max_turn_requests", "refusal", "cancelled"),
    "ToolCallStatus": ("pending", "in_progress", "completed", "failed"),
    "ToolKind": ("read", "edit", "delete", "move", "search", "execute", "think", "fetch", "switch_mode", "other"),
}

FIELD_TYPE_OVERRIDES: tuple[tuple[str, str, str, bool], ...] = (
    ("PermissionOption", "kind", "PermissionOptionKind", False),
    ("PlanEntry", "priority", "PlanEntryPriority", False),
    ("PlanEntry", "status", "PlanEntryStatus", False),
    ("PromptResponse", "stop_reason", "StopReason", False),
    ("ToolCall", "kind", "ToolKind", True),
    ("ToolCall", "status", "ToolCallStatus", True),
    ("ToolCallUpdate", "kind", "ToolKind", True),
    ("ToolCallUpdate", "status", "ToolCallStatus", True),
)

DEFAULT_VALUE_OVERRIDES: tuple[tuple[str, str, str], ...] = (
    ("AgentCapabilities", "mcp_capabilities", "McpCapabilities()"),
    ("AgentCapabilities", "session_capabilities", "SessionCapabilities()"),
    (
        "AgentCapabilities",
        "prompt_capabilities",
        "PromptCapabilities()",
    ),
    ("ClientCapabilities", "fs", "FileSystemCapabilities()"),
    ("ClientCapabilities", "terminal", "False"),
    (
        "InitializeRequest",
        "client_capabilities",
        "ClientCapabilities()",
    ),
    (
        "InitializeResponse",
        "agent_capabilities",
        "AgentCapabilities()",
    ),
)


@dataclass(frozen=True)
class _ProcessingStep:
    """A named transformation applied to the generated schema content."""

    name: str
    apply: Callable[[str], str]


def main() -> None:
    generate_schema()


def generate_schema() -> None:
    if not SCHEMA_JSON.exists():
        print(
            "Schema file missing. Ensure schema/schema.json exists (run gen_all.py --version to download).",
            file=sys.stderr,
        )
        sys.exit(1)

    cmd = [
        sys.executable,
        "-m",
        "datamodel_code_generator",
        "--input",
        str(SCHEMA_JSON),
        "--input-file-type",
        "jsonschema",
        "--output",
        str(SCHEMA_OUT),
        "--target-python-version",
        "3.12",
        "--collapse-root-models",
        "--output-model-type",
        "pydantic_v2.BaseModel",
        "--use-annotated",
        "--snake-case-field",
    ]

    subprocess.check_call(cmd)  # noqa: S603
    warnings = postprocess_generated_schema(SCHEMA_OUT)
    for warning in warnings:
        print(f"Warning: {warning}", file=sys.stderr)


def postprocess_generated_schema(output_path: Path) -> list[str]:
    if not output_path.exists():
        raise RuntimeError(f"Generated schema not found at {output_path}")

    raw_content = output_path.read_text(encoding="utf-8")
    header_block = _build_header_block()

    content = _strip_existing_header(raw_content)
    content = _remove_unused_models(content)
    content, leftover_classes = _rename_numbered_models(content)

    processing_steps: tuple[_ProcessingStep, ...] = (
        _ProcessingStep("apply field overrides", _apply_field_overrides),
        _ProcessingStep("apply default overrides", _apply_default_overrides),
        _ProcessingStep("attach description comments", _add_description_comments),
        _ProcessingStep("ensure custom BaseModel", _ensure_custom_base_model),
    )

    for step in processing_steps:
        content = step.apply(content)

    missing_targets = _find_missing_targets(content)

    content = _inject_enum_aliases(content)
    final_content = header_block + content.rstrip() + "\n"
    if not final_content.endswith("\n"):
        final_content += "\n"
    output_path.write_text(final_content, encoding="utf-8")

    warnings: list[str] = []
    if leftover_classes:
        warnings.append(
            "Unrenamed schema models detected: "
            + ", ".join(leftover_classes)
            + ". Update RENAME_MAP in scripts/gen_schema.py."
        )
    if missing_targets:
        warnings.append(
            "Renamed schema targets not found after generation: "
            + ", ".join(sorted(missing_targets))
            + ". Check RENAME_MAP or upstream schema changes."
        )
    warnings.extend(_validate_schema_alignment())

    return warnings


def _build_header_block() -> str:
    header_lines = ["# Generated from schema/schema.json. Do not edit by hand."]
    if VERSION_FILE.exists():
        ref = VERSION_FILE.read_text(encoding="utf-8").strip()
        if ref:
            header_lines.append(f"# Schema ref: {ref}")
    return "\n".join(header_lines) + "\n\n"


def _strip_existing_header(content: str) -> str:
    existing_header = re.match(r"(#.*\n)+", content)
    if existing_header:
        return content[existing_header.end() :].lstrip("\n")
    return content.lstrip("\n")


def _rename_numbered_models(content: str) -> tuple[str, list[str]]:
    renamed = content
    for old, new in sorted(RENAME_MAP.items(), key=lambda item: len(item[0]), reverse=True):
        if re.search(rf"\b{re.escape(new)}\b", renamed) is not None:
            renamed = re.sub(rf"\b{re.escape(new)}\b", f"_{new}", renamed)
        pattern = re.compile(rf"\b{re.escape(old)}\b")
        renamed = pattern.sub(new, renamed)

    leftover_class_pattern = re.compile(r"^class (\w+\d+)\(", re.MULTILINE)
    leftover_classes = sorted(set(leftover_class_pattern.findall(renamed)))
    return renamed, leftover_classes


def _find_missing_targets(content: str) -> list[str]:
    missing: list[str] = []
    for new_name in RENAME_MAP.values():
        pattern = re.compile(rf"^class {re.escape(new_name)}\(", re.MULTILINE)
        if not pattern.search(content):
            missing.append(new_name)
    return missing


def _validate_schema_alignment() -> list[str]:
    warnings: list[str] = []
    if not SCHEMA_JSON.exists():
        warnings.append("schema/schema.json missing; unable to validate enum aliases.")
        return warnings

    try:
        schema_enums = _load_schema_enum_literals()
    except json.JSONDecodeError as exc:
        warnings.append(f"Failed to parse schema/schema.json: {exc}")
        return warnings

    for enum_name, expected_values in ENUM_LITERAL_MAP.items():
        schema_values = schema_enums.get(enum_name)
        if schema_values is None:
            warnings.append(
                f"Enum '{enum_name}' not found in schema.json; update ENUM_LITERAL_MAP or investigate schema changes."
            )
            continue
        if tuple(schema_values) != expected_values:
            warnings.append(
                f"Enum mismatch for '{enum_name}': schema.json -> {schema_values}, generated aliases -> {expected_values}"
            )
    return warnings


def _load_schema_enum_literals() -> dict[str, tuple[str, ...]]:
    schema_data = json.loads(SCHEMA_JSON.read_text(encoding="utf-8"))
    defs = schema_data.get("$defs", {})
    enum_literals: dict[str, tuple[str, ...]] = {}

    for name, definition in defs.items():
        values: list[str] = []
        if "enum" in definition:
            values = [str(item) for item in definition["enum"]]
        elif "oneOf" in definition:
            values = [
                str(option["const"])
                for option in definition.get("oneOf", [])
                if isinstance(option, dict) and "const" in option
            ]
        if values:
            enum_literals[name] = tuple(values)

    return enum_literals


def _ensure_custom_base_model(content: str) -> str:
    if "class BaseModel(_BaseModel):" in content:
        return content
    lines = content.splitlines()
    for idx, line in enumerate(lines):
        if not line.startswith("from pydantic import "):
            continue
        imports = [part.strip() for part in line[len("from pydantic import ") :].split(",")]
        has_alias = any(part == "BaseModel as _BaseModel" for part in imports)
        has_config = any(part == "ConfigDict" for part in imports)
        new_imports = []
        for part in imports:
            if part == "BaseModel":
                new_imports.append("BaseModel as _BaseModel")
                has_alias = True
            else:
                new_imports.append(part)
        if not has_alias:
            new_imports.append("BaseModel as _BaseModel")
        if not has_config:
            new_imports.append("ConfigDict")
        lines[idx] = "from pydantic import " + ", ".join(new_imports)
        to_insert = textwrap.dedent("""\
            class BaseModel(_BaseModel):
                model_config = ConfigDict(populate_by_name=True)

                def __getattr__(self, item: str) -> Any:
                    if item.lower() != item:
                        snake_cased = "".join("_" + c.lower() if c.isupper() and i > 0 else c.lower() for i, c in enumerate(item))
                        return getattr(self, snake_cased)
                    raise AttributeError(f"'{type(self).__name__}' object has no attribute '{item}'")
        """)
        insert_idx = idx + 1
        lines.insert(insert_idx, "")
        for offset, line in enumerate(to_insert.splitlines(), 1):
            lines.insert(insert_idx + offset, line)
        break
    return "\n".join(lines) + "\n"


def _apply_field_overrides(content: str) -> str:
    for class_name, field_name, new_type, optional in FIELD_TYPE_OVERRIDES:
        if optional:
            pattern = re.compile(
                rf"(class {class_name}\(BaseModel\):.*?\n\s+{field_name}:\s+Annotated\[\s*)Optional\[str],",
                re.DOTALL,
            )
            content, count = pattern.subn(rf"\1Optional[{new_type}],", content)
        else:
            pattern = re.compile(
                rf"(class {class_name}\(BaseModel\):.*?\n\s+{field_name}:\s+Annotated\[\s*)str,",
                re.DOTALL,
            )
            content, count = pattern.subn(rf"\1{new_type},", content)
        if count == 0:
            print(
                f"Warning: failed to apply type override for {class_name}.{field_name} -> {new_type}",
                file=sys.stderr,
            )
    return content


def _apply_default_overrides(content: str) -> str:
    for class_name, field_name, replacement in DEFAULT_VALUE_OVERRIDES:
        class_pattern = re.compile(
            rf"(class {class_name}\(BaseModel\):)(.*?)(?=\nclass |\Z)",
            re.DOTALL,
        )

        def replace_block(
            match: re.Match[str],
            _field_name: str = field_name,
            _replacement: str = replacement,
            _class_name: str = class_name,
        ) -> str:
            header, block = match.group(1), match.group(2)
            field_patterns: tuple[tuple[re.Pattern[str], Callable[[re.Match[str]], str]], ...] = (
                (
                    re.compile(
                        rf"(\n\s+{_field_name}:.*?\]\s*=\s*)([\s\S]*?)(?=\n\s{{4}}[A-Za-z_]|$)",
                        re.DOTALL,
                    ),
                    lambda m, _rep=_replacement: m.group(1) + _rep,
                ),
                (
                    re.compile(
                        rf"(\n\s+{_field_name}:[^\n]*=)\s*([^\n]+)",
                        re.MULTILINE,
                    ),
                    lambda m, _rep=_replacement: m.group(1) + " " + _rep,
                ),
            )
            for pattern, replacer in field_patterns:
                new_block, count = pattern.subn(replacer, block, count=1)
                if count:
                    return header + new_block
            print(
                f"Warning: failed to override default for {_class_name}.{_field_name}",
                file=sys.stderr,
            )
            return match.group(0)

        content, count = class_pattern.subn(replace_block, content, count=1)
        if count == 0:
            print(
                f"Warning: class {class_name} not found for default override on {field_name}",
                file=sys.stderr,
            )
    return content


def _add_description_comments(content: str) -> str:
    lines = content.splitlines()
    new_lines: list[str] = []
    index = 0

    while index < len(lines):
        line = lines[index]
        stripped = line.lstrip()
        indent = len(line) - len(stripped)

        if indent == 4 and FIELD_DECLARATION_PATTERN.match(stripped or ""):
            block_lines, next_index = _collect_field_block(lines, index, indent)
            block_text = "\n".join(block_lines)
            description = _extract_description(block_text)

            if description:
                indent_str = " " * indent
                comment_lines = [
                    f"{indent_str}# {comment_line}" if comment_line else f"{indent_str}#"
                    for comment_line in description.splitlines()
                ]
                if comment_lines:
                    new_lines.extend(comment_lines)

            new_lines.extend(block_lines)
            index = next_index
            continue

        new_lines.append(line)
        index += 1

    return "\n".join(new_lines)


def _collect_field_block(lines: list[str], start: int, indent: int) -> tuple[list[str], int]:
    block: list[str] = []
    index = start

    while index < len(lines):
        current_line = lines[index]
        current_indent = len(current_line) - len(current_line.lstrip())
        if index != start and current_line.strip() and current_indent <= indent:
            break

        block.append(current_line)
        index += 1

    return block, index


def _extract_description(block_text: str) -> str | None:
    match = DESCRIPTION_PATTERN.search(block_text)
    if not match:
        return None

    prefix = match.group("prefix") or ""
    quote = match.group("quote")
    value = match.group("value")
    literal = f"{prefix}{quote}{value}{quote}"

    # datamodel-code-generator emits standard string literals, but fall back to raw text on parse errors.
    try:
        parsed = ast.literal_eval(literal)
    except (SyntaxError, ValueError):
        return value.replace("\\n", "\n")

    if isinstance(parsed, str):
        return parsed
    return str(parsed)


def _inject_enum_aliases(content: str) -> str:
    enum_lines = [
        f"{name} = Literal[{', '.join(repr(value) for value in values)}]" for name, values in ENUM_LITERAL_MAP.items()
    ]
    if not enum_lines:
        return content
    block = "\n".join(enum_lines) + "\n\n"
    class_index = content.find("\nclass ")
    if class_index == -1:
        return content
    insertion_point = class_index + 1  # include leading newline
    return content[:insertion_point] + block + content[insertion_point:]


def _remove_unused_models(content: str) -> str:
    for model_name in MODELS_TO_REMOVE:
        pattern = re.compile(
            rf"^(class {model_name}\([\s\S]*?\):)([\s\S]*?)(?=^\S|\Z)",
            re.MULTILINE,
        )
        content, count = pattern.subn("", content)
        if count > 0:
            print(f"Removed unused model: {model_name}", file=sys.stderr)
    return content


if __name__ == "__main__":
    main()
````

## File: scripts/gen_signature.py
````python
import ast
import inspect
import typing as t
from pathlib import Path

from pydantic import BaseModel
from pydantic.fields import FieldInfo
from pydantic_core import PydanticUndefined

from acp import schema

SIGNATURE_OPTIONAL_FIELDS: set[tuple[str, str]] = {
    ("LoadSessionRequest", "mcp_servers"),
    ("NewSessionRequest", "mcp_servers"),
}


class NodeTransformer(ast.NodeTransformer):
    def __init__(self) -> None:
        self._type_import_node: ast.ImportFrom | None = None
        self._schema_import_node: ast.ImportFrom | None = None
        self._should_rewrite = False
        self._literals = {name: value for name, value in schema.__dict__.items() if t.get_origin(value) is t.Literal}
        self._current_model_name: str | None = None

    def _add_typing_import(self, name: str) -> None:
        if not self._type_import_node:
            return
        if not any(alias.name == name for alias in self._type_import_node.names):
            self._type_import_node.names.append(ast.alias(name=name))
            self._should_rewrite = True

    def _add_schema_import(self, name: str) -> None:
        if not self._schema_import_node:
            return
        if not any(alias.name == name for alias in self._schema_import_node.names):
            self._schema_import_node.names.append(ast.alias(name=name))
            self._should_rewrite = True

    def transform(self, source_file: Path) -> None:
        with source_file.open("r", encoding="utf-8") as f:
            source_code = f.read()
        tree = ast.parse(source_code)
        self.visit(tree)
        if self._should_rewrite:
            print("Rewriting signatures in", source_file)
            new_code = ast.unparse(tree)
            with source_file.open("w", encoding="utf-8") as f:
                f.write(new_code)

    def visit_ImportFrom(self, node: ast.ImportFrom) -> ast.AST:
        if node.module == "schema":
            self._schema_import_node = node
        elif node.module == "typing":
            self._type_import_node = node
        return node

    def visit_FunctionDef(self, node: ast.FunctionDef) -> ast.AST:
        return self.visit_func(node)

    def visit_AsyncFunctionDef(self, node: ast.AsyncFunctionDef) -> ast.AST:
        return self.visit_func(node)

    def visit_func(self, node: ast.FunctionDef | ast.AsyncFunctionDef) -> ast.AST:
        decorator = next(
            (
                decorator
                for decorator in node.decorator_list
                if isinstance(decorator, ast.Call)
                and isinstance(decorator.func, ast.Name)
                and decorator.func.id == "param_model"
            ),
            None,
        )
        if not decorator:
            return self.generic_visit(node)
        self._should_rewrite = True
        model_name = t.cast(ast.Name, decorator.args[0]).id
        model = t.cast(type[schema.BaseModel], getattr(schema, model_name))
        self._current_model_name = model_name
        try:
            param_defaults = [
                self._to_param_def(name, field) for name, field in model.model_fields.items() if name != "field_meta"
            ]
        finally:
            self._current_model_name = None
        param_defaults.sort(key=lambda x: x[1] is not None)
        node.args.args[1:] = [param for param, _ in param_defaults]
        node.args.defaults = [default for _, default in param_defaults if default is not None]
        if "field_meta" in model.model_fields:
            node.args.kwarg = ast.arg(arg="kwargs", annotation=ast.Name(id="Any"))
        return self.generic_visit(node)

    def _to_param_def(self, name: str, field: FieldInfo) -> tuple[ast.arg, ast.expr | None]:
        arg = ast.arg(arg=name)
        ann = field.annotation
        override_optional = (self._current_model_name, name) in SIGNATURE_OPTIONAL_FIELDS
        if override_optional:
            if ann is not None:
                ann = ann | None
            default = ast.Constant(None)
        else:
            if field.default is PydanticUndefined:
                default = None
            elif isinstance(field.default, dict | BaseModel):
                default = ast.Constant(None)
            else:
                default = ast.Constant(value=field.default)
        if ann is not None:
            arg.annotation = self._format_annotation(ann)
        return arg, default

    def _format_annotation(self, annotation: t.Any) -> ast.expr:
        if t.get_origin(annotation) is t.Literal and annotation in self._literals.values():
            name = next(name for name, value in self._literals.items() if value is annotation)
            self._add_schema_import(name)
            return ast.Name(id=name)
        elif (
            inspect.isclass(annotation) and issubclass(annotation, BaseModel) and annotation.__module__ == "acp.schema"
        ):
            self._add_schema_import(annotation.__name__)
            return ast.Name(id=annotation.__name__)
        elif args := t.get_args(annotation):
            origin = t.get_origin(annotation)
            return ast.Subscript(
                value=self._format_annotation(origin),
                slice=ast.Tuple(elts=[self._format_annotation(arg) for arg in args], ctx=ast.Load())
                if len(args) > 1
                else self._format_annotation(args[0]),
                ctx=ast.Load(),
            )
        elif annotation.__module__ == "typing":
            name = annotation.__name__
            self._add_typing_import(name)
            return ast.Name(id=name)
        elif annotation is None or annotation is type(None):
            return ast.Constant(value=None)
        elif annotation in __builtins__.values():
            return ast.Name(id=annotation.__name__)
        else:
            print(f"Warning: Unhandled annotation type: {annotation}")
            self._add_typing_import("Any")
            return ast.Name(id="Any")


def gen_signature(source_dir: Path) -> None:
    import importlib

    importlib.reload(schema)  # Ensure schema is up to date
    for source_file in source_dir.rglob("*.py"):
        transformer = NodeTransformer()
        transformer.transform(source_file)
````

## File: src/acp/agent/__init__.py
````python
from .connection import AgentSideConnection

__all__ = ["AgentSideConnection"]
````

## File: src/acp/agent/connection.py
````python
from __future__ import annotations

import asyncio
from collections.abc import Callable
from typing import Any, cast, final

from ..connection import Connection
from ..interfaces import Agent, Client
from ..meta import CLIENT_METHODS
from ..schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AvailableCommandsUpdate,
    ConfigOptionUpdate,
    CreateTerminalRequest,
    CreateTerminalResponse,
    CurrentModeUpdate,
    EnvVariable,
    KillTerminalRequest,
    KillTerminalResponse,
    PermissionOption,
    ReadTextFileRequest,
    ReadTextFileResponse,
    ReleaseTerminalRequest,
    ReleaseTerminalResponse,
    RequestPermissionRequest,
    RequestPermissionResponse,
    SessionInfoUpdate,
    SessionNotification,
    TerminalOutputRequest,
    TerminalOutputResponse,
    ToolCallProgress,
    ToolCallStart,
    ToolCallUpdate,
    UsageUpdate,
    UserMessageChunk,
    WaitForTerminalExitRequest,
    WaitForTerminalExitResponse,
    WriteTextFileRequest,
    WriteTextFileResponse,
)
from ..utils import compatible_class, notify_model, param_model, request_model, request_optional_model
from .router import build_agent_router

__all__ = ["AgentSideConnection"]
_AGENT_CONNECTION_ERROR = "AgentSideConnection requires asyncio StreamWriter/StreamReader"


@final
@compatible_class
class AgentSideConnection:
    """Agent-side connection wrapper that dispatches JSON-RPC messages to a Client implementation.
    The agent can use this connection to communicate with the Client so it behaves like a Client.
    """

    def __init__(
        self,
        to_agent: Callable[[Client], Agent] | Agent,
        input_stream: Any,
        output_stream: Any,
        listening: bool = True,
        *,
        use_unstable_protocol: bool = False,
        **connection_kwargs: Any,
    ) -> None:
        agent = to_agent(self) if callable(to_agent) else to_agent
        if not isinstance(input_stream, asyncio.StreamWriter) or not isinstance(output_stream, asyncio.StreamReader):
            raise TypeError(_AGENT_CONNECTION_ERROR)
        handler = build_agent_router(cast(Agent, agent), use_unstable_protocol=use_unstable_protocol)
        self._conn = Connection(handler, input_stream, output_stream, listening=listening, **connection_kwargs)
        if on_connect := getattr(agent, "on_connect", None):
            on_connect(self)

    async def listen(self) -> None:
        """Start listening for incoming messages."""
        await self._conn.main_loop()

    @param_model(SessionNotification)
    async def session_update(
        self,
        session_id: str,
        update: UserMessageChunk
        | AgentMessageChunk
        | AgentThoughtChunk
        | ToolCallStart
        | ToolCallProgress
        | AgentPlanUpdate
        | AvailableCommandsUpdate
        | CurrentModeUpdate
        | ConfigOptionUpdate
        | SessionInfoUpdate
        | UsageUpdate,
        **kwargs: Any,
    ) -> None:
        await notify_model(
            self._conn,
            CLIENT_METHODS["session_update"],
            SessionNotification(session_id=session_id, update=update, field_meta=kwargs or None),
        )

    @param_model(RequestPermissionRequest)
    async def request_permission(
        self, options: list[PermissionOption], session_id: str, tool_call: ToolCallUpdate, **kwargs: Any
    ) -> RequestPermissionResponse:
        return await request_model(
            self._conn,
            CLIENT_METHODS["session_request_permission"],
            RequestPermissionRequest(
                options=options, session_id=session_id, tool_call=tool_call, field_meta=kwargs or None
            ),
            RequestPermissionResponse,
        )

    @param_model(ReadTextFileRequest)
    async def read_text_file(
        self, path: str, session_id: str, limit: int | None = None, line: int | None = None, **kwargs: Any
    ) -> ReadTextFileResponse:
        return await request_model(
            self._conn,
            CLIENT_METHODS["fs_read_text_file"],
            ReadTextFileRequest(path=path, session_id=session_id, limit=limit, line=line, field_meta=kwargs or None),
            ReadTextFileResponse,
        )

    @param_model(WriteTextFileRequest)
    async def write_text_file(
        self, content: str, path: str, session_id: str, **kwargs: Any
    ) -> WriteTextFileResponse | None:
        return await request_optional_model(
            self._conn,
            CLIENT_METHODS["fs_write_text_file"],
            WriteTextFileRequest(content=content, path=path, session_id=session_id, field_meta=kwargs or None),
            WriteTextFileResponse,
        )

    @param_model(CreateTerminalRequest)
    async def create_terminal(
        self,
        command: str,
        session_id: str,
        args: list[str] | None = None,
        cwd: str | None = None,
        env: list[EnvVariable] | None = None,
        output_byte_limit: int | None = None,
        **kwargs: Any,
    ) -> CreateTerminalResponse:
        return await request_model(
            self._conn,
            CLIENT_METHODS["terminal_create"],
            CreateTerminalRequest(
                command=command,
                session_id=session_id,
                args=args,
                cwd=cwd,
                env=env,
                output_byte_limit=output_byte_limit,
                field_meta=kwargs or None,
            ),
            CreateTerminalResponse,
        )

    @param_model(TerminalOutputRequest)
    async def terminal_output(self, session_id: str, terminal_id: str, **kwargs: Any) -> TerminalOutputResponse:
        return await request_model(
            self._conn,
            CLIENT_METHODS["terminal_output"],
            TerminalOutputRequest(session_id=session_id, terminal_id=terminal_id, field_meta=kwargs or None),
            TerminalOutputResponse,
        )

    @param_model(ReleaseTerminalRequest)
    async def release_terminal(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> ReleaseTerminalResponse | None:
        return await request_optional_model(
            self._conn,
            CLIENT_METHODS["terminal_release"],
            ReleaseTerminalRequest(session_id=session_id, terminal_id=terminal_id, field_meta=kwargs or None),
            ReleaseTerminalResponse,
        )

    @param_model(WaitForTerminalExitRequest)
    async def wait_for_terminal_exit(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> WaitForTerminalExitResponse:
        return await request_model(
            self._conn,
            CLIENT_METHODS["terminal_wait_for_exit"],
            WaitForTerminalExitRequest(session_id=session_id, terminal_id=terminal_id, field_meta=kwargs or None),
            WaitForTerminalExitResponse,
        )

    @param_model(KillTerminalRequest)
    async def kill_terminal(self, session_id: str, terminal_id: str, **kwargs: Any) -> KillTerminalResponse | None:
        return await request_optional_model(
            self._conn,
            CLIENT_METHODS["terminal_kill"],
            KillTerminalRequest(session_id=session_id, terminal_id=terminal_id, field_meta=kwargs or None),
            KillTerminalResponse,
        )

    async def ext_method(self, method: str, params: dict[str, Any]) -> dict[str, Any]:
        return await self._conn.send_request(f"_{method}", params)

    async def ext_notification(self, method: str, params: dict[str, Any]) -> None:
        await self._conn.send_notification(f"_{method}", params)

    async def close(self) -> None:
        await self._conn.close()

    async def __aenter__(self) -> AgentSideConnection:
        return self

    async def __aexit__(self, exc_type, exc, tb) -> None:
        await self.close()

    def on_connect(self, conn: Agent) -> None:
        pass
````

## File: src/acp/agent/router.py
````python
from __future__ import annotations

from typing import Any

from pydantic import BaseModel

from ..exceptions import RequestError
from ..interfaces import Agent
from ..meta import AGENT_METHODS
from ..router import MessageRouter, Route, _resolve_handler, _warn_legacy_handler
from ..schema import (
    AuthenticateRequest,
    CancelNotification,
    CloseSessionRequest,
    ForkSessionRequest,
    InitializeRequest,
    ListSessionsRequest,
    LoadSessionRequest,
    NewSessionRequest,
    PromptRequest,
    ResumeSessionRequest,
    SetSessionConfigOptionBooleanRequest,
    SetSessionConfigOptionSelectRequest,
    SetSessionModelRequest,
    SetSessionModeRequest,
)
from ..utils import model_to_kwargs, normalize_result

__all__ = ["build_agent_router"]


_SET_CONFIG_OPTION_MODELS = (SetSessionConfigOptionBooleanRequest, SetSessionConfigOptionSelectRequest)


def _validate_set_config_option_request(params: Any) -> BaseModel:
    if isinstance(params, dict) and params.get("type") == "boolean":
        return SetSessionConfigOptionBooleanRequest.model_validate(params)
    return SetSessionConfigOptionSelectRequest.model_validate(params)


def _make_set_config_option_handler(agent: Agent) -> Any:
    func, attr, legacy_api = _resolve_handler(agent, "set_config_option")
    if func is None:
        return None

    async def wrapper(params: Any) -> Any:
        if legacy_api:
            _warn_legacy_handler(agent, attr)
        request = _validate_set_config_option_request(params)
        if legacy_api:
            return await func(request)
        return await func(**model_to_kwargs(request, _SET_CONFIG_OPTION_MODELS))

    return wrapper


def build_agent_router(agent: Agent, use_unstable_protocol: bool = False) -> MessageRouter:
    router = MessageRouter(use_unstable_protocol=use_unstable_protocol)

    router.route_request(AGENT_METHODS["initialize"], InitializeRequest, agent, "initialize")
    router.route_request(AGENT_METHODS["session_new"], NewSessionRequest, agent, "new_session")
    router.route_request(
        AGENT_METHODS["session_load"],
        LoadSessionRequest,
        agent,
        "load_session",
        adapt_result=normalize_result,
    )
    router.route_request(AGENT_METHODS["session_list"], ListSessionsRequest, agent, "list_sessions")
    router.route_request(
        AGENT_METHODS["session_close"],
        CloseSessionRequest,
        agent,
        "close_session",
        adapt_result=normalize_result,
        unstable=True,
    )
    router.route_request(
        AGENT_METHODS["session_set_mode"],
        SetSessionModeRequest,
        agent,
        "set_session_mode",
        adapt_result=normalize_result,
    )
    router.route_request(AGENT_METHODS["session_prompt"], PromptRequest, agent, "prompt")
    router.route_request(
        AGENT_METHODS["session_set_model"],
        SetSessionModelRequest,
        agent,
        "set_session_model",
        adapt_result=normalize_result,
        unstable=True,
    )
    router.add_route(
        Route(
            method=AGENT_METHODS["session_set_config_option"],
            func=_make_set_config_option_handler(agent),
            kind="request",
            adapt_result=normalize_result,
        )
    )
    router.route_request(
        AGENT_METHODS["authenticate"],
        AuthenticateRequest,
        agent,
        "authenticate",
        adapt_result=normalize_result,
    )
    router.route_request(AGENT_METHODS["session_fork"], ForkSessionRequest, agent, "fork_session", unstable=True)
    router.route_request(AGENT_METHODS["session_resume"], ResumeSessionRequest, agent, "resume_session", unstable=True)

    router.route_notification(AGENT_METHODS["session_cancel"], CancelNotification, agent, "cancel")

    @router.handle_extension_request
    async def _handle_extension_request(name: str, payload: dict[str, Any]) -> Any:
        ext = getattr(agent, "ext_method", None)
        if ext is None:
            raise RequestError.method_not_found(f"_{name}")
        return await ext(name, payload)

    @router.handle_extension_notification
    async def _handle_extension_notification(name: str, payload: dict[str, Any]) -> None:
        ext = getattr(agent, "ext_notification", None)
        if ext is None:
            return
        await ext(name, payload)

    return router
````

## File: src/acp/client/__init__.py
````python
from .connection import ClientSideConnection

__all__ = ["ClientSideConnection"]
````

## File: src/acp/client/connection.py
````python
from __future__ import annotations

import asyncio
from collections.abc import Callable
from typing import Any, cast, final

from ..connection import Connection
from ..interfaces import Agent, Client
from ..meta import AGENT_METHODS
from ..schema import (
    AudioContentBlock,
    AuthenticateRequest,
    AuthenticateResponse,
    CancelNotification,
    ClientCapabilities,
    CloseSessionRequest,
    CloseSessionResponse,
    EmbeddedResourceContentBlock,
    ForkSessionRequest,
    ForkSessionResponse,
    HttpMcpServer,
    ImageContentBlock,
    Implementation,
    InitializeRequest,
    InitializeResponse,
    ListSessionsRequest,
    ListSessionsResponse,
    LoadSessionRequest,
    LoadSessionResponse,
    McpServerStdio,
    NewSessionRequest,
    NewSessionResponse,
    PromptRequest,
    PromptResponse,
    ResourceContentBlock,
    ResumeSessionRequest,
    ResumeSessionResponse,
    SetSessionConfigOptionBooleanRequest,
    SetSessionConfigOptionResponse,
    SetSessionConfigOptionSelectRequest,
    SetSessionModelRequest,
    SetSessionModelResponse,
    SetSessionModeRequest,
    SetSessionModeResponse,
    SseMcpServer,
    TextContentBlock,
)
from ..utils import compatible_class, notify_model, param_model, param_models, request_model, request_model_from_dict
from .router import build_client_router

__all__ = ["ClientSideConnection"]
_CLIENT_CONNECTION_ERROR = "ClientSideConnection requires asyncio StreamWriter/StreamReader"


@final
@compatible_class
class ClientSideConnection:
    """Client-side connection wrapper that dispatches JSON-RPC messages to an Agent implementation.
    The client can use this connection to communicate with the Agent so it behaves like an Agent.
    """

    def __init__(
        self,
        to_client: Callable[[Agent], Client] | Client,
        input_stream: Any,
        output_stream: Any,
        *,
        use_unstable_protocol: bool = False,
        **connection_kwargs: Any,
    ) -> None:
        if not isinstance(input_stream, asyncio.StreamWriter) or not isinstance(output_stream, asyncio.StreamReader):
            raise TypeError(_CLIENT_CONNECTION_ERROR)
        client = to_client(self) if callable(to_client) else to_client
        handler = build_client_router(cast(Client, client), use_unstable_protocol=use_unstable_protocol)
        self._conn = Connection(handler, input_stream, output_stream, **connection_kwargs)
        if on_connect := getattr(client, "on_connect", None):
            on_connect(self)

    @param_model(InitializeRequest)
    async def initialize(
        self,
        protocol_version: int,
        client_capabilities: ClientCapabilities | None = None,
        client_info: Implementation | None = None,
        **kwargs: Any,
    ) -> InitializeResponse:
        return await request_model(
            self._conn,
            AGENT_METHODS["initialize"],
            InitializeRequest(
                protocol_version=protocol_version,
                client_capabilities=client_capabilities or ClientCapabilities(),
                client_info=client_info,
                field_meta=kwargs or None,
            ),
            InitializeResponse,
        )

    @param_model(NewSessionRequest)
    async def new_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None, **kwargs: Any
    ) -> NewSessionResponse:
        resolved_mcp_servers = mcp_servers or []
        return await request_model(
            self._conn,
            AGENT_METHODS["session_new"],
            NewSessionRequest(cwd=cwd, mcp_servers=resolved_mcp_servers, field_meta=kwargs or None),
            NewSessionResponse,
        )

    @param_model(LoadSessionRequest)
    async def load_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> LoadSessionResponse:
        resolved_mcp_servers = mcp_servers or []
        return await request_model_from_dict(
            self._conn,
            AGENT_METHODS["session_load"],
            LoadSessionRequest(
                cwd=cwd, mcp_servers=resolved_mcp_servers, session_id=session_id, field_meta=kwargs or None
            ),
            LoadSessionResponse,
        )

    @param_model(ListSessionsRequest)
    async def list_sessions(
        self, cursor: str | None = None, cwd: str | None = None, **kwargs: Any
    ) -> ListSessionsResponse:
        return await request_model_from_dict(
            self._conn,
            AGENT_METHODS["session_list"],
            ListSessionsRequest(cursor=cursor, cwd=cwd, field_meta=kwargs or None),
            ListSessionsResponse,
        )

    @param_model(SetSessionModeRequest)
    async def set_session_mode(self, mode_id: str, session_id: str, **kwargs: Any) -> SetSessionModeResponse:
        return await request_model_from_dict(
            self._conn,
            AGENT_METHODS["session_set_mode"],
            SetSessionModeRequest(mode_id=mode_id, session_id=session_id, field_meta=kwargs or None),
            SetSessionModeResponse,
        )

    @param_model(SetSessionModelRequest)
    async def set_session_model(self, model_id: str, session_id: str, **kwargs: Any) -> SetSessionModelResponse:
        return await request_model_from_dict(
            self._conn,
            AGENT_METHODS["session_set_model"],
            SetSessionModelRequest(model_id=model_id, session_id=session_id, field_meta=kwargs or None),
            SetSessionModelResponse,
        )

    @param_models(SetSessionConfigOptionBooleanRequest, SetSessionConfigOptionSelectRequest)
    async def set_config_option(
        self, config_id: str, session_id: str, value: str | bool, **kwargs: Any
    ) -> SetSessionConfigOptionResponse:
        request = (
            SetSessionConfigOptionBooleanRequest(
                config_id=config_id,
                session_id=session_id,
                type="boolean",
                value=value,
                field_meta=kwargs or None,
            )
            if isinstance(value, bool)
            else SetSessionConfigOptionSelectRequest(
                config_id=config_id,
                session_id=session_id,
                value=value,
                field_meta=kwargs or None,
            )
        )
        return await request_model_from_dict(
            self._conn,
            AGENT_METHODS["session_set_config_option"],
            request,
            SetSessionConfigOptionResponse,
        )

    @param_model(AuthenticateRequest)
    async def authenticate(self, method_id: str, **kwargs: Any) -> AuthenticateResponse:
        return await request_model_from_dict(
            self._conn,
            AGENT_METHODS["authenticate"],
            AuthenticateRequest(method_id=method_id, field_meta=kwargs or None),
            AuthenticateResponse,
        )

    @param_model(PromptRequest)
    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        message_id: str | None = None,
        **kwargs: Any,
    ) -> PromptResponse:
        return await request_model(
            self._conn,
            AGENT_METHODS["session_prompt"],
            PromptRequest(
                prompt=prompt,
                session_id=session_id,
                message_id=message_id,
                field_meta=kwargs or None,
            ),
            PromptResponse,
        )

    @param_model(ForkSessionRequest)
    async def fork_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> ForkSessionResponse:
        return await request_model(
            self._conn,
            AGENT_METHODS["session_fork"],
            ForkSessionRequest(session_id=session_id, cwd=cwd, mcp_servers=mcp_servers, field_meta=kwargs or None),
            ForkSessionResponse,
        )

    @param_model(ResumeSessionRequest)
    async def resume_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> ResumeSessionResponse:
        return await request_model(
            self._conn,
            AGENT_METHODS["session_resume"],
            ResumeSessionRequest(session_id=session_id, cwd=cwd, mcp_servers=mcp_servers, field_meta=kwargs or None),
            ResumeSessionResponse,
        )

    @param_model(CloseSessionRequest)
    async def close_session(self, session_id: str, **kwargs: Any) -> CloseSessionResponse | None:
        return await request_model_from_dict(
            self._conn,
            AGENT_METHODS["session_close"],
            CloseSessionRequest(session_id=session_id, field_meta=kwargs or None),
            CloseSessionResponse,
        )

    @param_model(CancelNotification)
    async def cancel(self, session_id: str, **kwargs: Any) -> None:
        await notify_model(
            self._conn,
            AGENT_METHODS["session_cancel"],
            CancelNotification(session_id=session_id, field_meta=kwargs or None),
        )

    async def ext_method(self, method: str, params: dict[str, Any]) -> dict[str, Any]:
        return await self._conn.send_request(f"_{method}", params)

    async def ext_notification(self, method: str, params: dict[str, Any]) -> None:
        await self._conn.send_notification(f"_{method}", params)

    async def close(self) -> None:
        await self._conn.close()

    async def __aenter__(self) -> ClientSideConnection:
        return self

    async def __aexit__(self, exc_type, exc, tb) -> None:
        await self.close()

    def on_connect(self, conn: Client) -> None:
        pass
````

## File: src/acp/client/router.py
````python
from __future__ import annotations

from typing import Any

from ..exceptions import RequestError
from ..interfaces import Client
from ..meta import CLIENT_METHODS
from ..router import MessageRouter
from ..schema import (
    CreateTerminalRequest,
    KillTerminalRequest,
    ReadTextFileRequest,
    ReleaseTerminalRequest,
    RequestPermissionRequest,
    SessionNotification,
    TerminalOutputRequest,
    WaitForTerminalExitRequest,
    WriteTextFileRequest,
)
from ..utils import normalize_result

__all__ = ["build_client_router"]


def build_client_router(client: Client, use_unstable_protocol: bool = False) -> MessageRouter:
    router = MessageRouter(use_unstable_protocol=use_unstable_protocol)

    router.route_request(CLIENT_METHODS["fs_write_text_file"], WriteTextFileRequest, client, "write_text_file")
    router.route_request(CLIENT_METHODS["fs_read_text_file"], ReadTextFileRequest, client, "read_text_file")
    router.route_request(
        CLIENT_METHODS["session_request_permission"],
        RequestPermissionRequest,
        client,
        "request_permission",
    )
    router.route_request(
        CLIENT_METHODS["terminal_create"],
        CreateTerminalRequest,
        client,
        "create_terminal",
        optional=True,
        default_result=None,
    )
    router.route_request(
        CLIENT_METHODS["terminal_output"],
        TerminalOutputRequest,
        client,
        "terminal_output",
        optional=True,
        default_result=None,
    )
    router.route_request(
        CLIENT_METHODS["terminal_release"],
        ReleaseTerminalRequest,
        client,
        "release_terminal",
        optional=True,
        default_result={},
        adapt_result=normalize_result,
    )
    router.route_request(
        CLIENT_METHODS["terminal_wait_for_exit"],
        WaitForTerminalExitRequest,
        client,
        "wait_for_terminal_exit",
        optional=True,
        default_result=None,
    )
    router.route_request(
        CLIENT_METHODS["terminal_kill"],
        KillTerminalRequest,
        client,
        "kill_terminal",
        optional=True,
        default_result={},
        adapt_result=normalize_result,
    )

    router.route_notification(CLIENT_METHODS["session_update"], SessionNotification, client, "session_update")

    @router.handle_extension_request
    async def _handle_extension_request(name: str, payload: dict[str, Any]) -> Any:
        ext = getattr(client, "ext_method", None)
        if ext is None:
            raise RequestError.method_not_found(f"_{name}")
        return await ext(name, payload)

    @router.handle_extension_notification
    async def _handle_extension_notification(name: str, payload: dict[str, Any]) -> None:
        ext = getattr(client, "ext_notification", None)
        if ext is None:
            return
        await ext(name, payload)

    return router
````

## File: src/acp/contrib/__init__.py
````python
"""
Experimental helpers for Agent Client Protocol integrations.

Everything exposed from :mod:`acp.contrib` is considered unstable and may change
without notice. These modules are published to share techniques observed in the
reference implementations (for example Toad or kimi-cli) while we continue
refining the core SDK surface.

The helpers live in ``acp.contrib`` so consuming applications must opt-in
explicitly, making it clear that the APIs are incubating.
"""

from __future__ import annotations

from .permissions import PermissionBroker, default_permission_options
from .session_state import SessionAccumulator, SessionSnapshot, ToolCallView
from .tool_calls import ToolCallTracker, TrackedToolCallView

__all__ = [
    "PermissionBroker",
    "SessionAccumulator",
    "SessionSnapshot",
    "ToolCallTracker",
    "ToolCallView",
    "TrackedToolCallView",
    "default_permission_options",
]
````

## File: src/acp/contrib/permissions.py
````python
from __future__ import annotations

from collections.abc import Awaitable, Callable, Sequence
from typing import Any

from ..helpers import text_block, tool_content
from ..schema import PermissionOption, RequestPermissionRequest, RequestPermissionResponse, ToolCallUpdate
from .tool_calls import ToolCallTracker, _copy_model_list


class PermissionBrokerError(ValueError):
    """Base error for permission broker misconfiguration."""


class MissingToolCallError(PermissionBrokerError):
    """Raised when a permission request is missing the referenced tool call."""

    def __init__(self) -> None:
        super().__init__("tool_call must be provided when no ToolCallTracker is configured")


class MissingPermissionOptionsError(PermissionBrokerError):
    """Raised when no permission options are available for a request."""

    def __init__(self) -> None:
        super().__init__("PermissionBroker requires at least one permission option")


def default_permission_options() -> tuple[PermissionOption, PermissionOption, PermissionOption]:
    """Return a standard approval/reject option set."""
    return (
        PermissionOption(option_id="approve", name="Approve", kind="allow_once"),
        PermissionOption(option_id="approve_for_session", name="Approve for session", kind="allow_always"),
        PermissionOption(option_id="reject", name="Reject", kind="reject_once"),
    )


class PermissionBroker:
    """Helper for issuing permission requests tied to tracked tool calls."""

    def __init__(
        self,
        session_id: str,
        requester: Callable[[RequestPermissionRequest], Awaitable[RequestPermissionResponse]],
        *,
        tracker: ToolCallTracker | None = None,
        default_options: Sequence[PermissionOption] | None = None,
    ) -> None:
        self._session_id = session_id
        self._requester = requester
        self._tracker = tracker
        self._default_options = tuple(
            option.model_copy(deep=True) for option in (default_options or default_permission_options())
        )

    async def request_for(
        self,
        external_id: str,
        *,
        description: str | None = None,
        options: Sequence[PermissionOption] | None = None,
        content: Sequence[Any] | None = None,
        tool_call: ToolCallUpdate | None = None,
    ) -> RequestPermissionResponse:
        """Request user approval for a tool call."""
        if tool_call is None:
            if self._tracker is None:
                raise MissingToolCallError()
            tool_call = self._tracker.tool_call_model(external_id)
        else:
            tool_call = tool_call.model_copy(deep=True)

        if content is not None:
            tool_call.content = _copy_model_list(content)

        if description:
            existing = tool_call.content or []
            existing.append(tool_content(text_block(description)))
            tool_call.content = existing

        option_set = tuple(option.model_copy(deep=True) for option in (options or self._default_options))
        if not option_set:
            raise MissingPermissionOptionsError()

        request = RequestPermissionRequest(
            session_id=self._session_id,
            tool_call=tool_call,
            options=list(option_set),
        )
        return await self._requester(request)


__all__ = [
    "PermissionBroker",
    "default_permission_options",
]
````

## File: src/acp/contrib/session_state.py
````python
from __future__ import annotations

from collections.abc import Callable, Sequence
from contextlib import suppress
from typing import Any

from pydantic import BaseModel, ConfigDict

from ..schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AvailableCommand,
    AvailableCommandsUpdate,
    CurrentModeUpdate,
    PlanEntry,
    SessionNotification,
    ToolCallLocation,
    ToolCallProgress,
    ToolCallStart,
    ToolCallStatus,
    ToolKind,
    UserMessageChunk,
)


class SessionNotificationMismatchError(ValueError):
    """Raised when the accumulator receives notifications from a different session."""

    def __init__(self, expected: str, actual: str) -> None:
        message = f"SessionAccumulator received notification for {actual}, expected {expected}"
        super().__init__(message)


class SessionSnapshotUnavailableError(RuntimeError):
    """Raised when a session snapshot is requested before any notifications."""

    def __init__(self) -> None:
        super().__init__("SessionAccumulator has not processed any notifications yet")


def _copy_model_list(items: Sequence[Any] | None) -> list[Any] | None:
    if items is None:
        return None
    return [item.model_copy(deep=True) for item in items]


class _MutableToolCallState:
    def __init__(self, tool_call_id: str) -> None:
        self.tool_call_id = tool_call_id
        self.title: str | None = None
        self.kind: ToolKind | None = None
        self.status: ToolCallStatus | None = None
        self.content: list[Any] | None = None
        self.locations: list[ToolCallLocation] | None = None
        self.raw_input: Any = None
        self.raw_output: Any = None

    def apply_start(self, update: ToolCallStart) -> None:
        self.title = update.title
        self.kind = update.kind
        self.status = update.status
        self.content = _copy_model_list(update.content)
        self.locations = _copy_model_list(update.locations)
        self.raw_input = update.raw_input
        self.raw_output = update.raw_output

    def apply_progress(self, update: ToolCallProgress) -> None:
        if update.title is not None:
            self.title = update.title
        if update.kind is not None:
            self.kind = update.kind
        if update.status is not None:
            self.status = update.status
        if update.content is not None:
            self.content = _copy_model_list(update.content)
        if update.locations is not None:
            self.locations = _copy_model_list(update.locations)
        if update.raw_input is not None:
            self.raw_input = update.raw_input
        if update.raw_output is not None:
            self.raw_output = update.raw_output

    def snapshot(self) -> ToolCallView:
        return ToolCallView(
            tool_call_id=self.tool_call_id,
            title=self.title,
            kind=self.kind,
            status=self.status,
            content=tuple(item.model_copy(deep=True) for item in self.content) if self.content else None,
            locations=tuple(loc.model_copy(deep=True) for loc in self.locations) if self.locations else None,
            raw_input=self.raw_input,
            raw_output=self.raw_output,
        )


class ToolCallView(BaseModel):
    """Immutable view of a tool call in the session."""

    model_config = ConfigDict(frozen=True)

    tool_call_id: str
    title: str | None
    kind: ToolKind | None
    status: ToolCallStatus | None
    content: tuple[Any, ...] | None
    locations: tuple[ToolCallLocation, ...] | None
    raw_input: Any
    raw_output: Any


class SessionSnapshot(BaseModel):
    """Aggregated snapshot of the most recent session state."""

    model_config = ConfigDict(frozen=True)

    session_id: str
    tool_calls: dict[str, ToolCallView]
    plan_entries: tuple[PlanEntry, ...]
    current_mode_id: str | None
    available_commands: tuple[AvailableCommand, ...]
    user_messages: tuple[UserMessageChunk, ...]
    agent_messages: tuple[AgentMessageChunk, ...]
    agent_thoughts: tuple[AgentThoughtChunk, ...]


class SessionAccumulator:
    """Merge :class:`acp.schema.SessionNotification` objects into a session snapshot.

    The accumulator focuses on the common requirements observed in the Toad UI:

    * Always expose the latest merged tool call state (even if updates arrive
      without a matching ``tool_call`` start).
    * Track the agent plan, available commands, and current mode id.
    * Record the raw stream of user/agent message chunks for UI rendering.

    This helper is **experimental**: APIs may change while we gather feedback.
    """

    def __init__(self, *, auto_reset_on_session_change: bool = True) -> None:
        self._auto_reset = auto_reset_on_session_change
        self.session_id: str | None = None
        self._tool_calls: dict[str, _MutableToolCallState] = {}
        self._plan_entries: list[PlanEntry] = []
        self._current_mode_id: str | None = None
        self._available_commands: list[AvailableCommand] = []
        self._user_messages: list[UserMessageChunk] = []
        self._agent_messages: list[AgentMessageChunk] = []
        self._agent_thoughts: list[AgentThoughtChunk] = []
        self._subscribers: list[Callable[[SessionSnapshot, SessionNotification], None]] = []

    def reset(self) -> None:
        """Clear all accumulated state."""
        self.session_id = None
        self._tool_calls.clear()
        self._plan_entries.clear()
        self._current_mode_id = None
        self._available_commands.clear()
        self._user_messages.clear()
        self._agent_messages.clear()
        self._agent_thoughts.clear()

    def subscribe(self, callback: Callable[[SessionSnapshot, SessionNotification], None]) -> Callable[[], None]:
        """Register a callback that receives every new snapshot.

        The callback is invoked immediately after :meth:`apply` finishes. The
        function returns an ``unsubscribe`` callable.
        """

        self._subscribers.append(callback)

        def unsubscribe() -> None:
            with suppress(ValueError):
                self._subscribers.remove(callback)

        return unsubscribe

    def apply(self, notification: SessionNotification) -> SessionSnapshot:
        """Merge a new session notification into the current snapshot."""
        self._ensure_session(notification)
        self._apply_update(notification.update)
        snapshot = self.snapshot()
        self._notify_subscribers(snapshot, notification)
        return snapshot

    def _ensure_session(self, notification: SessionNotification) -> None:
        if self.session_id is None:
            self.session_id = notification.session_id
            return

        if notification.session_id != self.session_id:
            self._handle_session_change(notification.session_id)

    def _handle_session_change(self, session_id: str) -> None:
        expected = self.session_id
        if expected is None:
            self.session_id = session_id
            return

        if not self._auto_reset:
            raise SessionNotificationMismatchError(expected, session_id)

        self.reset()
        self.session_id = session_id

    def _apply_update(self, update: Any) -> None:
        if isinstance(update, ToolCallStart):
            state = self._tool_calls.setdefault(
                update.tool_call_id, _MutableToolCallState(tool_call_id=update.tool_call_id)
            )
            state.apply_start(update)
            return

        if isinstance(update, ToolCallProgress):
            state = self._tool_calls.setdefault(
                update.tool_call_id, _MutableToolCallState(tool_call_id=update.tool_call_id)
            )
            state.apply_progress(update)
            return

        if isinstance(update, AgentPlanUpdate):
            self._plan_entries = _copy_model_list(update.entries) or []
            return

        if isinstance(update, CurrentModeUpdate):
            self._current_mode_id = update.current_mode_id
            return

        if isinstance(update, AvailableCommandsUpdate):
            self._available_commands = _copy_model_list(update.available_commands) or []
            return

        if isinstance(update, UserMessageChunk):
            self._user_messages.append(update.model_copy(deep=True))
            return

        if isinstance(update, AgentMessageChunk):
            self._agent_messages.append(update.model_copy(deep=True))
            return

        if isinstance(update, AgentThoughtChunk):
            self._agent_thoughts.append(update.model_copy(deep=True))

    def _notify_subscribers(
        self,
        snapshot: SessionSnapshot,
        notification: SessionNotification,
    ) -> None:
        for callback in list(self._subscribers):
            callback(snapshot, notification)

    def snapshot(self) -> SessionSnapshot:
        """Return an immutable snapshot of the current state."""
        if self.session_id is None:
            raise SessionSnapshotUnavailableError()

        tool_calls = {tool_call_id: state.snapshot() for tool_call_id, state in self._tool_calls.items()}
        plan_entries = tuple(entry.model_copy(deep=True) for entry in self._plan_entries)
        available_commands = tuple(command.model_copy(deep=True) for command in self._available_commands)
        user_messages = tuple(message.model_copy(deep=True) for message in self._user_messages)
        agent_messages = tuple(message.model_copy(deep=True) for message in self._agent_messages)
        agent_thoughts = tuple(message.model_copy(deep=True) for message in self._agent_thoughts)

        return SessionSnapshot(
            session_id=self.session_id,
            tool_calls=tool_calls,
            plan_entries=plan_entries,
            current_mode_id=self._current_mode_id,
            available_commands=available_commands,
            user_messages=user_messages,
            agent_messages=agent_messages,
            agent_thoughts=agent_thoughts,
        )
````

## File: src/acp/contrib/tool_calls.py
````python
from __future__ import annotations

import uuid
from collections.abc import Callable, Sequence
from typing import Any, cast

from pydantic import BaseModel, ConfigDict

from ..helpers import text_block, tool_content
from ..schema import (
    ToolCallLocation,
    ToolCallProgress,
    ToolCallStart,
    ToolCallStatus,
    ToolCallUpdate,
    ToolKind,
)


class _MissingToolCallTitleError(ValueError):
    """Raised when emitting a tool call start without a configured title."""

    def __init__(self) -> None:
        super().__init__("title must be set before sending a ToolCallStart")


class _UnknownToolCallError(KeyError):
    """Raised when retrieving a tool call that is not tracked."""

    def __init__(self, external_id: str) -> None:
        self.external_id = external_id
        super().__init__(external_id)

    def __str__(self) -> str:
        return f"Unknown tool call id: {self.external_id}"


def _copy_model_list(items: Sequence[Any] | None) -> list[Any] | None:
    if items is None:
        return None
    return [item.model_copy(deep=True) for item in items]


class _Unset:
    """Sentinel for optional parameters."""


UNSET = _Unset()


class TrackedToolCallView(BaseModel):
    """Immutable representation of a tracked tool call."""

    model_config = ConfigDict(frozen=True)

    tool_call_id: str
    title: str | None
    kind: ToolKind | None
    status: ToolCallStatus | None
    content: tuple[Any, ...] | None
    locations: tuple[ToolCallLocation, ...] | None
    raw_input: Any
    raw_output: Any


class _TrackedToolCall:
    def __init__(
        self,
        *,
        tool_call_id: str,
        title: str | None = None,
        kind: ToolKind | None = None,
        status: ToolCallStatus | None = None,
        content: Sequence[Any] | None = None,
        locations: Sequence[ToolCallLocation] | None = None,
        raw_input: Any = None,
        raw_output: Any = None,
    ) -> None:
        self.tool_call_id = tool_call_id
        self.title = title
        self.kind = kind
        self.status = status
        self.content = _copy_model_list(content)
        self.locations = _copy_model_list(locations)
        self.raw_input = raw_input
        self.raw_output = raw_output
        self._stream_buffer: str | None = None

    def to_view(self) -> TrackedToolCallView:
        return TrackedToolCallView(
            tool_call_id=self.tool_call_id,
            title=self.title,
            kind=self.kind,
            status=self.status,
            content=tuple(item.model_copy(deep=True) for item in self.content) if self.content else None,
            locations=tuple(loc.model_copy(deep=True) for loc in self.locations) if self.locations else None,
            raw_input=self.raw_input,
            raw_output=self.raw_output,
        )

    def to_tool_call_model(self) -> ToolCallUpdate:
        return ToolCallUpdate(
            tool_call_id=self.tool_call_id,
            title=self.title,
            kind=self.kind,
            status=self.status,
            content=_copy_model_list(self.content),
            locations=_copy_model_list(self.locations),
            raw_input=self.raw_input,
            raw_output=self.raw_output,
        )

    def to_start_model(self) -> ToolCallStart:
        if self.title is None:
            raise _MissingToolCallTitleError()
        return ToolCallStart(
            session_update="tool_call",
            tool_call_id=self.tool_call_id,
            title=self.title,
            kind=self.kind,
            status=self.status,
            content=_copy_model_list(self.content),
            locations=_copy_model_list(self.locations),
            raw_input=self.raw_input,
            raw_output=self.raw_output,
        )

    def update(
        self,
        *,
        title: Any = UNSET,
        kind: Any = UNSET,
        status: Any = UNSET,
        content: Any = UNSET,
        locations: Any = UNSET,
        raw_input: Any = UNSET,
        raw_output: Any = UNSET,
    ) -> ToolCallProgress:
        kwargs: dict[str, Any] = {}
        if title is not UNSET:
            self.title = cast(str | None, title)
            kwargs["title"] = self.title
        if kind is not UNSET:
            self.kind = cast(ToolKind | None, kind)
            kwargs["kind"] = self.kind
        if status is not UNSET:
            self.status = cast(ToolCallStatus | None, status)
            kwargs["status"] = self.status
        if content is not UNSET:
            seq_content = cast(Sequence[Any] | None, content)
            self.content = _copy_model_list(seq_content)
            kwargs["content"] = _copy_model_list(seq_content)
        if locations is not UNSET:
            seq_locations = cast(Sequence[ToolCallLocation] | None, locations)
            self.locations = cast(
                list[ToolCallLocation] | None,
                _copy_model_list(seq_locations),
            )
            kwargs["locations"] = _copy_model_list(seq_locations)
        if raw_input is not UNSET:
            self.raw_input = raw_input
            kwargs["rawInput"] = raw_input
        if raw_output is not UNSET:
            self.raw_output = raw_output
            kwargs["raw_output"] = raw_output
        return ToolCallProgress(session_update="tool_call_update", tool_call_id=self.tool_call_id, **kwargs)

    def append_stream_text(
        self,
        text: str,
        *,
        title: Any = UNSET,
        status: Any = UNSET,
    ) -> ToolCallProgress:
        self._stream_buffer = (self._stream_buffer or "") + text
        content = [tool_content(text_block(self._stream_buffer))]
        return self.update(title=title, status=status, content=content)


class ToolCallTracker:
    """Utility for generating ACP tool call updates on the server side."""

    def __init__(self, *, id_factory: Callable[[], str] | None = None) -> None:
        self._id_factory = id_factory or (lambda: uuid.uuid4().hex)
        self._calls: dict[str, _TrackedToolCall] = {}

    def start(
        self,
        external_id: str,
        *,
        title: str,
        kind: ToolKind | None = None,
        status: ToolCallStatus | None = "in_progress",
        content: Sequence[Any] | None = None,
        locations: Sequence[ToolCallLocation] | None = None,
        raw_input: Any = None,
        raw_output: Any = None,
    ) -> ToolCallStart:
        """Register a new tool call and return the ``tool_call`` notification."""
        call_id = self._id_factory()
        state = _TrackedToolCall(
            tool_call_id=call_id,
            title=title,
            kind=kind,
            status=status,
            content=content,
            locations=locations,
            raw_input=raw_input,
            raw_output=raw_output,
        )
        self._calls[external_id] = state
        return state.to_start_model()

    def progress(
        self,
        external_id: str,
        *,
        title: Any = UNSET,
        kind: Any = UNSET,
        status: Any = UNSET,
        content: Any = UNSET,
        locations: Any = UNSET,
        raw_input: Any = UNSET,
        raw_output: Any = UNSET,
    ) -> ToolCallProgress:
        """Produce a ``tool_call_update`` message and merge it into the tracker."""
        state = self._require_call(external_id)
        return state.update(
            title=title,
            kind=kind,
            status=status,
            content=content,
            locations=locations,
            raw_input=raw_input,
            raw_output=raw_output,
        )

    def append_stream_text(
        self,
        external_id: str,
        text: str,
        *,
        title: Any = UNSET,
        status: Any = UNSET,
    ) -> ToolCallProgress:
        """Append text to the tool call arguments/content and emit an update."""
        state = self._require_call(external_id)
        return state.append_stream_text(text, title=title, status=status)

    def forget(self, external_id: str) -> None:
        """Remove a tracked tool call (e.g. after completion)."""
        self._calls.pop(external_id, None)

    def view(self, external_id: str) -> TrackedToolCallView:
        """Return an immutable view of the current tool call state."""
        state = self._require_call(external_id)
        return state.to_view()

    def tool_call_model(self, external_id: str) -> ToolCallUpdate:
        """Return a deep copy of the tool call suitable for permission requests."""
        state = self._require_call(external_id)
        return state.to_tool_call_model()

    def _require_call(self, external_id: str) -> _TrackedToolCall:
        try:
            return self._calls[external_id]
        except KeyError as exc:
            raise _UnknownToolCallError(external_id) from exc


__all__ = [
    "UNSET",
    "ToolCallTracker",
    "TrackedToolCallView",
]
````

## File: src/acp/task/__init__.py
````python
from __future__ import annotations

from dataclasses import dataclass
from enum import Enum
from typing import Any

__all__ = ["RpcTask", "RpcTaskKind"]


class RpcTaskKind(Enum):
    REQUEST = "request"
    NOTIFICATION = "notification"


@dataclass(slots=True)
class RpcTask:
    kind: RpcTaskKind
    message: dict[str, Any]


from .dispatcher import (  # noqa: E402
    DefaultMessageDispatcher,
    MessageDispatcher,
    NotificationRunner,
    RequestRunner,
)
from .queue import InMemoryMessageQueue, MessageQueue  # noqa: E402
from .sender import MessageSender, SenderFactory  # noqa: E402
from .state import InMemoryMessageStateStore, MessageStateStore  # noqa: E402
from .supervisor import TaskSupervisor  # noqa: E402

__all__ += [
    "DefaultMessageDispatcher",
    "InMemoryMessageQueue",
    "InMemoryMessageStateStore",
    "MessageDispatcher",
    "MessageQueue",
    "MessageSender",
    "MessageStateStore",
    "NotificationRunner",
    "RequestRunner",
    "SenderFactory",
    "TaskSupervisor",
]
````

## File: src/acp/task/dispatcher.py
````python
from __future__ import annotations

import asyncio
from collections.abc import Awaitable, Callable
from contextlib import suppress
from typing import Any, Protocol

from . import RpcTaskKind
from .queue import MessageQueue
from .state import MessageStateStore
from .supervisor import TaskSupervisor

__all__ = [
    "DefaultMessageDispatcher",
    "MessageDispatcher",
    "NotificationRunner",
    "RequestRunner",
]


RequestRunner = Callable[[dict[str, Any]], Awaitable[Any]]
NotificationRunner = Callable[[dict[str, Any]], Awaitable[None]]


class MessageDispatcher(Protocol):
    def start(self) -> None: ...

    async def stop(self) -> None: ...


class DefaultMessageDispatcher(MessageDispatcher):
    """Background worker that consumes RPC tasks from a broker, coordinating with the store."""

    def __init__(
        self,
        *,
        queue: MessageQueue,
        supervisor: TaskSupervisor,
        store: MessageStateStore,
        request_runner: RequestRunner,
        notification_runner: NotificationRunner,
    ) -> None:
        self._queue = queue
        self._supervisor = supervisor
        self._store = store
        self._request_runner = request_runner
        self._notification_runner = notification_runner
        self._task: asyncio.Task[None] | None = None

    def start(self) -> None:
        if self._task is not None:
            msg = "dispatcher already started"
            raise RuntimeError(msg)
        self._task = self._supervisor.create(self._run(), name="acp.Dispatcher.loop")

    async def _run(self) -> None:
        try:
            async for task in self._queue:
                try:
                    if task.kind is RpcTaskKind.REQUEST:
                        await self._dispatch_request(task.message)
                    else:
                        await self._dispatch_notification(task.message)
                finally:
                    self._queue.task_done()
        except asyncio.CancelledError:
            return

    async def stop(self) -> None:
        await self._queue.close()
        if self._task is not None:
            with suppress(asyncio.CancelledError):
                await self._task
            self._task = None

    async def _dispatch_request(self, message: dict[str, Any]) -> None:
        record = self._store.begin_incoming(message.get("method", ""), message.get("params"))

        async def runner() -> None:
            try:
                result = await self._request_runner(message)
            except Exception as exc:
                self._store.fail_incoming(record, exc)
                raise
            else:
                self._store.complete_incoming(record, result)

        self._supervisor.create(runner(), name="acp.Dispatcher.request")

    async def _dispatch_notification(self, message: dict[str, Any]) -> None:
        async def runner() -> None:
            await self._notification_runner(message)

        self._supervisor.create(runner(), name="acp.Dispatcher.notification")
````

## File: src/acp/task/queue.py
````python
from __future__ import annotations

import asyncio
from collections.abc import AsyncIterator
from contextlib import suppress
from typing import Protocol

from . import RpcTask

__all__ = ["InMemoryMessageQueue", "MessageQueue"]


class MessageQueue(Protocol):
    async def publish(self, task: RpcTask) -> None: ...

    async def close(self) -> None: ...

    def task_done(self) -> None: ...

    async def join(self) -> None: ...

    def __aiter__(self) -> AsyncIterator[RpcTask]: ...


class InMemoryMessageQueue:
    """Simple in-memory broker for RPC task dispatch."""

    def __init__(self, *, maxsize: int = 0) -> None:
        self._queue: asyncio.Queue[RpcTask | None] = asyncio.Queue(maxsize=maxsize)
        self._closed = False

    async def publish(self, task: RpcTask) -> None:
        if self._closed:
            msg = "mssage queue already closed"
            raise RuntimeError(msg)
        await self._queue.put(task)

    async def close(self) -> None:
        if self._closed:
            return
        self._closed = True
        await self._queue.put(None)

    async def join(self) -> None:
        await self._queue.join()

    def task_done(self) -> None:
        with suppress(ValueError):
            self._queue.task_done()

    def __aiter__(self) -> AsyncIterator[RpcTask]:
        return _QueueIterator(self)


class _QueueIterator:
    def __init__(self, queue: InMemoryMessageQueue) -> None:
        self._queue = queue

    def __aiter__(self) -> _QueueIterator:
        return self

    async def __anext__(self) -> RpcTask:
        item = await self._queue._queue.get()
        if item is None:
            self._queue.task_done()
            raise StopAsyncIteration
        return item
````

## File: src/acp/task/sender.py
````python
from __future__ import annotations

import asyncio
import contextlib
import json
import logging
from collections.abc import Callable
from dataclasses import dataclass
from typing import Any

from .supervisor import TaskSupervisor

__all__ = ["MessageSender", "SenderFactory"]


SenderFactory = Callable[[asyncio.StreamWriter, TaskSupervisor], "MessageSender"]


@dataclass(slots=True)
class _PendingSend:
    payload: bytes
    future: asyncio.Future[None]


class MessageSender:
    def __init__(self, writer: asyncio.StreamWriter, supervisor: TaskSupervisor) -> None:
        self._writer = writer
        self._queue: asyncio.Queue[_PendingSend | None] = asyncio.Queue()
        self._closed = False
        self._task = supervisor.create(self._loop(), name="acp.Sender.loop", on_error=self._on_error)

    async def send(self, payload: dict[str, Any]) -> None:
        data = (json.dumps(payload, separators=(",", ":")) + "\n").encode("utf-8")
        future: asyncio.Future[None] = asyncio.get_running_loop().create_future()
        await self._queue.put(_PendingSend(data, future))
        await future

    async def close(self) -> None:
        if self._closed:
            return
        self._closed = True
        await self._queue.put(None)
        if self._task is not None:
            with contextlib.suppress(asyncio.CancelledError):
                await self._task

    async def _loop(self) -> None:
        try:
            while True:
                item = await self._queue.get()
                if item is None:
                    return
                try:
                    self._writer.write(item.payload)
                    await self._writer.drain()
                except Exception as exc:
                    if not item.future.done():
                        item.future.set_exception(exc)
                    raise
                else:
                    if not item.future.done():
                        item.future.set_result(None)
        except asyncio.CancelledError:
            return

    def _on_error(self, task: asyncio.Task[Any], exc: BaseException) -> None:
        logging.exception("Send loop failed", exc_info=exc)
````

## File: src/acp/task/state.py
````python
from __future__ import annotations

import asyncio
from dataclasses import dataclass
from typing import Any, Protocol

__all__ = [
    "InMemoryMessageStateStore",
    "IncomingMessage",
    "MessageStateStore",
    "OutgoingMessage",
]


@dataclass(slots=True)
class OutgoingMessage:
    request_id: int
    method: str
    future: asyncio.Future[Any]


@dataclass(slots=True)
class IncomingMessage:
    method: str
    params: Any
    status: str = "pending"
    result: Any = None
    error: Any = None


class MessageStateStore(Protocol):
    def register_outgoing(self, request_id: int, method: str) -> asyncio.Future[Any]: ...

    def resolve_outgoing(self, request_id: int, result: Any) -> None: ...

    def reject_outgoing(self, request_id: int, error: Any) -> None: ...

    def reject_all_outgoing(self, error: Any) -> None: ...

    def begin_incoming(self, method: str, params: Any) -> IncomingMessage: ...

    def complete_incoming(self, record: IncomingMessage, result: Any) -> None: ...

    def fail_incoming(self, record: IncomingMessage, error: Any) -> None: ...


class InMemoryMessageStateStore(MessageStateStore):
    def __init__(self) -> None:
        self._outgoing: dict[int, OutgoingMessage] = {}
        self._incoming: list[IncomingMessage] = []

    def register_outgoing(self, request_id: int, method: str) -> asyncio.Future[Any]:
        future: asyncio.Future[Any] = asyncio.get_running_loop().create_future()
        self._outgoing[request_id] = OutgoingMessage(request_id, method, future)
        return future

    def resolve_outgoing(self, request_id: int, result: Any) -> None:
        record = self._outgoing.pop(request_id, None)
        if record and not record.future.done():
            record.future.set_result(result)

    def reject_outgoing(self, request_id: int, error: Any) -> None:
        record = self._outgoing.pop(request_id, None)
        if record and not record.future.done():
            record.future.set_exception(error)

    def reject_all_outgoing(self, error: Any) -> None:
        for record in self._outgoing.values():
            if not record.future.done():
                record.future.set_exception(error)
        self._outgoing.clear()

    def begin_incoming(self, method: str, params: Any) -> IncomingMessage:
        record = IncomingMessage(method=method, params=params)
        self._incoming.append(record)
        return record

    def complete_incoming(self, record: IncomingMessage, result: Any) -> None:
        record.status = "completed"
        record.result = result

    def fail_incoming(self, record: IncomingMessage, error: Any) -> None:
        record.status = "failed"
        record.error = error
````

## File: src/acp/task/supervisor.py
````python
from __future__ import annotations

import asyncio
import logging
from collections.abc import Awaitable, Callable
from contextlib import suppress
from typing import Any

__all__ = ["TaskSupervisor"]

ErrorHandler = Callable[[asyncio.Task[Any], BaseException], None]


class TaskSupervisor:
    """Track background tasks and provide graceful shutdown semantics.

    Inspired by fasta2a's task manager, this supervisor keeps a registry of
    asyncio tasks created for request handling so they can be cancelled and
    awaited reliably when the connection closes.
    """

    def __init__(self, *, source: str) -> None:
        self._source = source
        self._tasks: set[asyncio.Task[Any]] = set()
        self._closed = False
        self._error_handlers: list[ErrorHandler] = []

    def add_error_handler(self, handler: ErrorHandler) -> None:
        self._error_handlers.append(handler)

    def create(
        self,
        coroutine: Awaitable[Any],
        *,
        name: str | None = None,
        on_error: ErrorHandler | None = None,
    ) -> asyncio.Task[Any]:
        if self._closed:
            msg = f"TaskSupervisor for {self._source} already closed"
            raise RuntimeError(msg)
        task = asyncio.create_task(coroutine, name=name)
        self._tasks.add(task)
        task.add_done_callback(lambda t: self._on_done(t, on_error))
        return task

    def _on_done(self, task: asyncio.Task[Any], on_error: ErrorHandler | None) -> None:
        self._tasks.discard(task)
        if task.cancelled():
            return
        try:
            task.result()
        except Exception as exc:
            handled = False
            if on_error is not None:
                try:
                    on_error(task, exc)
                    handled = True
                except Exception:
                    logging.exception("Error in %s task-specific error handler", self._source)
            if not handled:
                for handler in self._error_handlers:
                    try:
                        handler(task, exc)
                        handled = True
                    except Exception:
                        logging.exception("Error in %s supervisor error handler", self._source)
            if not handled:
                logging.exception("Unhandled error in %s task", self._source)

    async def shutdown(self) -> None:
        self._closed = True
        if not self._tasks:
            return
        tasks = list(self._tasks)
        for task in tasks:
            task.cancel()
        for task in tasks:
            with suppress(asyncio.CancelledError):
                await task
        self._tasks.clear()
````

## File: src/acp/__init__.py
````python
from typing import Any

from .core import (
    Agent,
    Client,
    RequestError,
    connect_to_agent,
    run_agent,
)
from .helpers import (
    audio_block,
    embedded_blob_resource,
    embedded_text_resource,
    image_block,
    plan_entry,
    resource_block,
    resource_link_block,
    session_notification,
    start_edit_tool_call,
    start_read_tool_call,
    start_tool_call,
    text_block,
    tool_content,
    tool_diff_content,
    tool_terminal_ref,
    update_agent_message,
    update_agent_message_text,
    update_agent_thought,
    update_agent_thought_text,
    update_plan,
    update_tool_call,
    update_user_message,
    update_user_message_text,
)
from .meta import (
    AGENT_METHODS,
    CLIENT_METHODS,
    PROTOCOL_VERSION,
)
from .schema import (
    AuthenticateRequest,
    AuthenticateResponse,
    CancelNotification,
    CreateTerminalRequest,
    CreateTerminalResponse,
    InitializeRequest,
    InitializeResponse,
    KillTerminalRequest,
    KillTerminalResponse,
    LoadSessionRequest,
    LoadSessionResponse,
    NewSessionRequest,
    NewSessionResponse,
    PromptRequest,
    PromptResponse,
    ReadTextFileRequest,
    ReadTextFileResponse,
    ReleaseTerminalRequest,
    ReleaseTerminalResponse,
    RequestPermissionRequest,
    RequestPermissionResponse,
    SessionNotification,
    SetSessionConfigOptionResponse,
    SetSessionConfigOptionSelectRequest,
    SetSessionModelRequest,
    SetSessionModelResponse,
    SetSessionModeRequest,
    SetSessionModeResponse,
    TerminalOutputRequest,
    TerminalOutputResponse,
    WaitForTerminalExitRequest,
    WaitForTerminalExitResponse,
    WriteTextFileRequest,
    WriteTextFileResponse,
)
from .stdio import spawn_agent_process, spawn_client_process, spawn_stdio_connection, stdio_streams
from .transports import default_environment, spawn_stdio_transport

_DEPRECATED_NAMES = [
    (
        "AgentSideConnection",
        "acp.core:AgentSideConnection",
        "Using `AgentSideConnection` directly is deprecated, please use `acp.run_agent` instead.",
    ),
    (
        "ClientSideConnection",
        "acp.core:ClientSideConnection",
        "Using `ClientSideConnection` directly is deprecated, please use `acp.connect_to_agent` instead.",
    ),
]

__all__ = [  # noqa: RUF022
    # constants
    "PROTOCOL_VERSION",
    "AGENT_METHODS",
    "CLIENT_METHODS",
    # types
    "InitializeRequest",
    "InitializeResponse",
    "NewSessionRequest",
    "NewSessionResponse",
    "LoadSessionRequest",
    "LoadSessionResponse",
    "AuthenticateRequest",
    "AuthenticateResponse",
    "PromptRequest",
    "PromptResponse",
    "WriteTextFileRequest",
    "WriteTextFileResponse",
    "ReadTextFileRequest",
    "ReadTextFileResponse",
    "RequestPermissionRequest",
    "RequestPermissionResponse",
    "CancelNotification",
    "SessionNotification",
    "SetSessionModeRequest",
    "SetSessionModeResponse",
    "SetSessionModelRequest",
    "SetSessionModelResponse",
    "SetSessionConfigOptionSelectRequest",
    "SetSessionConfigOptionResponse",
    # terminal types
    "CreateTerminalRequest",
    "CreateTerminalResponse",
    "TerminalOutputRequest",
    "TerminalOutputResponse",
    "WaitForTerminalExitRequest",
    "WaitForTerminalExitResponse",
    "KillTerminalRequest",
    "KillTerminalResponse",
    "ReleaseTerminalRequest",
    "ReleaseTerminalResponse",
    # core
    "run_agent",
    "connect_to_agent",
    "RequestError",
    "Agent",
    "Client",
    # stdio helper
    "stdio_streams",
    "spawn_stdio_connection",
    "spawn_agent_process",
    "spawn_client_process",
    "default_environment",
    "spawn_stdio_transport",
    # helpers
    "text_block",
    "image_block",
    "audio_block",
    "resource_link_block",
    "embedded_text_resource",
    "embedded_blob_resource",
    "resource_block",
    "tool_content",
    "tool_diff_content",
    "tool_terminal_ref",
    "plan_entry",
    "update_plan",
    "update_user_message",
    "update_user_message_text",
    "update_agent_message",
    "update_agent_message_text",
    "update_agent_thought",
    "update_agent_thought_text",
    "session_notification",
    "start_tool_call",
    "start_read_tool_call",
    "start_edit_tool_call",
    "update_tool_call",
]


def __getattr__(name: str) -> Any:
    import warnings
    from importlib import import_module

    for deprecated_name, new_path, warning in _DEPRECATED_NAMES:
        if name == deprecated_name:
            warnings.warn(warning, DeprecationWarning, stacklevel=2)
            module_name, attr_name = new_path.split(":")
            module = import_module(module_name)
            return getattr(module, attr_name)
    raise AttributeError(f"module {__name__} has no attribute {name}")
````

## File: src/acp/connection.py
````python
from __future__ import annotations

import asyncio
import contextlib
import copy
import inspect
import json
import logging
from collections.abc import Awaitable, Callable
from dataclasses import dataclass
from enum import Enum
from typing import Any

from pydantic import BaseModel, ValidationError

from .exceptions import RequestError
from .task import (
    DefaultMessageDispatcher,
    InMemoryMessageQueue,
    InMemoryMessageStateStore,
    MessageDispatcher,
    MessageQueue,
    MessageSender,
    MessageStateStore,
    NotificationRunner,
    RequestRunner,
    RpcTask,
    RpcTaskKind,
    SenderFactory,
    TaskSupervisor,
)
from .telemetry import span_context

JsonValue = Any
MethodHandler = Callable[[str, JsonValue | None, bool], Awaitable[JsonValue | None]]


__all__ = ["Connection", "JsonValue", "MethodHandler", "StreamDirection", "StreamEvent"]


DispatcherFactory = Callable[
    [MessageQueue, TaskSupervisor, MessageStateStore, RequestRunner, NotificationRunner],
    MessageDispatcher,
]


class StreamDirection(str, Enum):
    INCOMING = "incoming"
    OUTGOING = "outgoing"


@dataclass(frozen=True, slots=True)
class StreamEvent:
    direction: StreamDirection
    message: dict[str, Any]


StreamObserver = Callable[[StreamEvent], Awaitable[None] | None]


class Connection:
    """Minimal JSON-RPC 2.0 connection over newline-delimited JSON frames."""

    def __init__(
        self,
        handler: MethodHandler,
        writer: asyncio.StreamWriter,
        reader: asyncio.StreamReader,
        *,
        queue: MessageQueue | None = None,
        state_store: MessageStateStore | None = None,
        dispatcher_factory: DispatcherFactory | None = None,
        sender_factory: SenderFactory | None = None,
        observers: list[StreamObserver] | None = None,
        listening: bool = True,
    ) -> None:
        self._handler = handler
        self._writer = writer
        self._reader = reader
        self._next_request_id = 0
        self._state = state_store or InMemoryMessageStateStore()
        self._tasks = TaskSupervisor(source="acp.Connection")
        self._tasks.add_error_handler(self._on_task_error)
        self._queue = queue or InMemoryMessageQueue()
        self._closed = False
        self._disconnected = False
        self._sender = (sender_factory or self._default_sender_factory)(self._writer, self._tasks)
        if listening:
            self._recv_task = self._tasks.create(
                self._receive_loop(),
                name="acp.Connection.receive",
                on_error=self._on_receive_error,
            )
        else:
            self._recv_task = None
        dispatcher_factory = dispatcher_factory or self._default_dispatcher_factory
        self._dispatcher = dispatcher_factory(
            self._queue,
            self._tasks,
            self._state,
            self._run_request,
            self._run_notification,
        )
        self._dispatcher.start()
        self._observers: list[StreamObserver] = list(observers or [])

    async def close(self) -> None:
        """Stop the receive loop and cancel any in-flight handler tasks."""
        if self._closed:
            return
        self._closed = True
        await self._dispatcher.stop()
        await self._sender.close()
        await self._tasks.shutdown()
        self._state.reject_all_outgoing(ConnectionError("Connection closed"))

    async def main_loop(self) -> None:
        try:
            await self._receive_loop()
        except Exception as exc:
            logging.exception("Connection main loop failed", exc_info=exc)
            self._on_receive_error(None, exc)  # type: ignore[arg-type]
            raise

    async def __aenter__(self) -> Connection:
        return self

    async def __aexit__(self, exc_type, exc, tb) -> None:
        await self.close()

    def add_observer(self, observer: StreamObserver) -> None:
        """Register a callback that receives every raw JSON-RPC message."""
        self._observers.append(observer)

    async def send_request(self, method: str, params: JsonValue | None = None) -> Any:
        self._raise_if_unavailable()
        request_id = self._next_request_id
        self._next_request_id += 1
        future = self._state.register_outgoing(request_id, method)
        payload = {"jsonrpc": "2.0", "id": request_id, "method": method, "params": params}
        await self._sender.send(payload)
        self._notify_observers(StreamDirection.OUTGOING, payload)
        return await future

    async def send_notification(self, method: str, params: JsonValue | None = None) -> None:
        self._raise_if_unavailable()
        payload = {"jsonrpc": "2.0", "method": method, "params": params}
        await self._sender.send(payload)
        self._notify_observers(StreamDirection.OUTGOING, payload)

    async def _receive_loop(self) -> None:
        try:
            while True:
                line = await self._reader.readline()
                if not line:
                    break
                try:
                    message: dict[str, Any] = json.loads(line)
                except Exception:
                    logging.exception("Error parsing JSON-RPC message")
                    continue
                self._notify_observers(StreamDirection.INCOMING, message)
                await self._process_message(message)
        except asyncio.CancelledError:
            return
        self._disconnect()

    async def _process_message(self, message: dict[str, Any]) -> None:
        method = message.get("method")
        has_id = "id" in message
        if method is not None and has_id:
            await self._queue.publish(RpcTask(RpcTaskKind.REQUEST, message))
            return
        if method is not None and not has_id:
            await self._queue.publish(RpcTask(RpcTaskKind.NOTIFICATION, message))
            return
        if has_id:
            await self._handle_response(message)

    def _notify_observers(self, direction: StreamDirection, message: dict[str, Any]) -> None:
        if not self._observers:
            return
        snapshot = copy.deepcopy(message)
        event = StreamEvent(direction, snapshot)
        for observer in list(self._observers):
            try:
                result = observer(event)
            except Exception:
                logging.exception("Stream observer failed", exc_info=True)
                continue
            if inspect.isawaitable(result):
                self._tasks.create(
                    result,
                    name=f"acp.Connection.observer.{direction.value}",
                    on_error=self._on_observer_error,
                )

    def _on_observer_error(self, task: asyncio.Task[Any], exc: BaseException) -> None:
        logging.exception("Stream observer coroutine failed", exc_info=exc)

    async def _run_request(self, message: dict[str, Any]) -> Any:
        payload: dict[str, Any] = {"jsonrpc": "2.0", "id": message["id"]}
        method = message["method"]
        with span_context(
            "acp.request",
            attributes={"method": method},
        ):
            try:
                result = await self._handler(method, message.get("params"), False)
                if isinstance(result, BaseModel):
                    result = result.model_dump(
                        mode="json",
                        by_alias=True,
                        exclude_none=True,
                        exclude_unset=True,
                    )
                payload["result"] = result if result is not None else None
                await self._sender.send(payload)
                self._notify_observers(StreamDirection.OUTGOING, payload)
                return payload.get("result")
            except RequestError as exc:
                payload["error"] = exc.to_error_obj()
                await self._sender.send(payload)
                self._notify_observers(StreamDirection.OUTGOING, payload)
                raise
            except ValidationError as exc:
                err = RequestError.invalid_params({"errors": exc.errors()})
                payload["error"] = err.to_error_obj()
                await self._sender.send(payload)
                self._notify_observers(StreamDirection.OUTGOING, payload)
                raise err from None
            except Exception as exc:
                try:
                    data = json.loads(str(exc))
                except Exception:
                    data = {"details": str(exc)}
                err = RequestError.internal_error(data)
                payload["error"] = err.to_error_obj()
                await self._sender.send(payload)
                self._notify_observers(StreamDirection.OUTGOING, payload)
                raise err from None

    async def _run_notification(self, message: dict[str, Any]) -> None:
        method = message["method"]
        with span_context("acp.notification", attributes={"method": method}), contextlib.suppress(Exception):
            await self._handler(method, message.get("params"), True)

    async def _handle_response(self, message: dict[str, Any]) -> None:
        request_id = message["id"]
        result = message.get("result")
        if "result" in message:
            self._state.resolve_outgoing(request_id, result)
            return
        if "error" in message:
            error_obj = message.get("error") or {}
            self._state.reject_outgoing(
                request_id,
                RequestError(
                    error_obj.get("code", -32603),
                    error_obj.get("message", "Error"),
                    error_obj.get("data"),
                ),
            )
            return
        self._state.resolve_outgoing(request_id, None)

    def _on_receive_error(self, task: asyncio.Task[Any], exc: BaseException) -> None:
        logging.exception("Receive loop failed", exc_info=exc)
        self._disconnect()

    def _on_task_error(self, task: asyncio.Task[Any], exc: BaseException) -> None:
        logging.exception("Background task failed", exc_info=exc)

    def _default_dispatcher_factory(
        self,
        queue: MessageQueue,
        supervisor: TaskSupervisor,
        state: MessageStateStore,
        request_runner: RequestRunner,
        notification_runner: NotificationRunner,
    ) -> MessageDispatcher:
        return DefaultMessageDispatcher(
            queue=queue,
            supervisor=supervisor,
            store=state,
            request_runner=request_runner,
            notification_runner=notification_runner,
        )

    def _default_sender_factory(self, writer: asyncio.StreamWriter, supervisor: TaskSupervisor) -> MessageSender:
        return MessageSender(writer, supervisor)

    def _disconnect(self) -> None:
        if self._disconnected:
            return
        self._disconnected = True
        self._state.reject_all_outgoing(ConnectionError("Connection closed"))

    def _raise_if_unavailable(self) -> None:
        if self._disconnected or self._closed:
            raise ConnectionError("Connection closed")
````

## File: src/acp/core.py
````python
"""Compatibility re-exports for historical imports.

The project now keeps implementation in dedicated modules mirroring the
agent-client-protocol Rust structure, but external callers may still import
from ``acp.core``. Keep the surface API stable by forwarding to the new homes.
"""

from __future__ import annotations

from typing import Any

from .agent.connection import AgentSideConnection
from .client.connection import ClientSideConnection
from .connection import Connection, JsonValue, MethodHandler
from .exceptions import RequestError
from .interfaces import Agent, Client

__all__ = [
    "DEFAULT_STDIO_BUFFER_LIMIT_BYTES",
    "Agent",
    "AgentSideConnection",
    "Client",
    "ClientSideConnection",
    "Connection",
    "JsonValue",
    "MethodHandler",
    "RequestError",
    "connect_to_agent",
    "run_agent",
]

# Default to 50MB for agent/client data transfer.
# The original stdio_streams default is 64KB, which is not large
# enough for multimodal use-cases.
DEFAULT_STDIO_BUFFER_LIMIT_BYTES = 50 * 1024 * 1024


async def run_agent(
    agent: Agent,
    input_stream: Any = None,
    output_stream: Any = None,
    *,
    use_unstable_protocol: bool = False,
    stdio_buffer_limit_bytes: int = DEFAULT_STDIO_BUFFER_LIMIT_BYTES,
    **connection_kwargs: Any,
) -> None:
    """Run an ACP agent over the given input/output streams.

    This is a convenience function that creates an :class:`AgentSideConnection`
    and starts listening for incoming messages.

    Args:
        agent: The agent implementation to run.
        input_stream: The (client) input stream to write to (defaults: ``sys.stdin``).
        output_stream: The (client) output stream to read from (defaults: ``sys.stdout``).
        use_unstable_protocol: Whether to enable unstable protocol features.
        **connection_kwargs: Additional keyword arguments to pass to the
            :class:`AgentSideConnection` constructor.
    """
    from .stdio import stdio_streams

    if input_stream is None and output_stream is None:
        output_stream, input_stream = await stdio_streams(limit=stdio_buffer_limit_bytes)
    conn = AgentSideConnection(
        agent,
        input_stream,
        output_stream,
        listening=False,
        use_unstable_protocol=use_unstable_protocol,
        **connection_kwargs,
    )
    await conn.listen()


def connect_to_agent(
    client: Client,
    input_stream: Any,
    output_stream: Any,
    *,
    use_unstable_protocol: bool = False,
    **connection_kwargs: Any,
) -> ClientSideConnection:
    """Create a ClientSideConnection to an ACP agent over the given input/output streams.

    Args:
        client: The client implementation to use.
        input_stream: The (agent) input stream to write to (default: ``sys.stdin``).
        output_stream: The (agent) output stream to read from (default: ``sys.stdout``).
        use_unstable_protocol: Whether to enable unstable protocol features.
        **connection_kwargs: Additional keyword arguments to pass to the
            :class:`ClientSideConnection` constructor.

    Returns:
        A :class:`ClientSideConnection` instance connected to the agent.
    """
    return ClientSideConnection(
        client, input_stream, output_stream, use_unstable_protocol=use_unstable_protocol, **connection_kwargs
    )
````

## File: src/acp/exceptions.py
````python
from __future__ import annotations

from typing import Any

__all__ = ["RequestError"]


class RequestError(Exception):
    """JSON-RPC 2.0 error helper."""

    def __init__(self, code: int, message: str, data: Any | None = None) -> None:
        super().__init__(message)
        self.code = code
        self.data = data

    @classmethod
    def parse_error(cls, data: dict[str, Any] | None = None) -> RequestError:
        return cls(-32700, "Parse error", data)

    @classmethod
    def invalid_request(cls, data: dict[str, Any] | None = None) -> RequestError:
        return cls(-32600, "Invalid request", data)

    @classmethod
    def method_not_found(cls, method: str) -> RequestError:
        return cls(-32601, "Method not found", {"method": method})

    @classmethod
    def invalid_params(cls, data: dict[str, Any] | None = None) -> RequestError:
        return cls(-32602, "Invalid params", data)

    @classmethod
    def internal_error(cls, data: dict[str, Any] | None = None) -> RequestError:
        return cls(-32603, "Internal error", data)

    @classmethod
    def auth_required(cls, data: dict[str, Any] | None = None) -> RequestError:
        return cls(-32000, "Authentication required", data)

    @classmethod
    def resource_not_found(cls, uri: str | None = None) -> RequestError:
        data = {"uri": uri} if uri is not None else None
        return cls(-32002, "Resource not found", data)

    def to_error_obj(self) -> dict[str, Any]:
        return {"code": self.code, "message": str(self), "data": self.data}
````

## File: src/acp/helpers.py
````python
from __future__ import annotations

from collections.abc import Iterable, Sequence
from typing import Any

from .schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AudioContentBlock,
    AvailableCommand,
    AvailableCommandsUpdate,
    BlobResourceContents,
    ContentToolCallContent,
    CurrentModeUpdate,
    EmbeddedResourceContentBlock,
    FileEditToolCallContent,
    ImageContentBlock,
    PlanEntry,
    PlanEntryPriority,
    PlanEntryStatus,
    ResourceContentBlock,
    SessionInfoUpdate,
    SessionNotification,
    TerminalToolCallContent,
    TextContentBlock,
    TextResourceContents,
    ToolCallLocation,
    ToolCallProgress,
    ToolCallStart,
    ToolCallStatus,
    ToolKind,
    UserMessageChunk,
)

ContentBlock = (
    TextContentBlock | ImageContentBlock | AudioContentBlock | ResourceContentBlock | EmbeddedResourceContentBlock
)

SessionUpdate = (
    AgentMessageChunk
    | AgentPlanUpdate
    | AgentThoughtChunk
    | AvailableCommandsUpdate
    | CurrentModeUpdate
    | UserMessageChunk
    | ToolCallStart
    | ToolCallProgress
    | SessionInfoUpdate
)

ToolCallContentVariant = ContentToolCallContent | FileEditToolCallContent | TerminalToolCallContent

__all__ = [
    "audio_block",
    "embedded_blob_resource",
    "embedded_text_resource",
    "image_block",
    "plan_entry",
    "resource_block",
    "resource_link_block",
    "session_notification",
    "start_edit_tool_call",
    "start_read_tool_call",
    "start_tool_call",
    "text_block",
    "tool_content",
    "tool_diff_content",
    "tool_terminal_ref",
    "update_agent_message",
    "update_agent_message_text",
    "update_agent_thought",
    "update_agent_thought_text",
    "update_available_commands",
    "update_current_mode",
    "update_plan",
    "update_tool_call",
    "update_user_message",
    "update_user_message_text",
]


def text_block(text: str) -> TextContentBlock:
    return TextContentBlock(type="text", text=text)


def image_block(data: str, mime_type: str, *, uri: str | None = None) -> ImageContentBlock:
    return ImageContentBlock(type="image", data=data, mime_type=mime_type, uri=uri)


def audio_block(data: str, mime_type: str) -> AudioContentBlock:
    return AudioContentBlock(type="audio", data=data, mime_type=mime_type)


def resource_link_block(
    name: str,
    uri: str,
    *,
    mime_type: str | None = None,
    size: int | None = None,
    description: str | None = None,
    title: str | None = None,
) -> ResourceContentBlock:
    return ResourceContentBlock(
        type="resource_link",
        name=name,
        uri=uri,
        mime_type=mime_type,
        size=size,
        description=description,
        title=title,
    )


def embedded_text_resource(uri: str, text: str, *, mime_type: str | None = None) -> TextResourceContents:
    return TextResourceContents(uri=uri, text=text, mime_type=mime_type)


def embedded_blob_resource(uri: str, blob: str, *, mime_type: str | None = None) -> BlobResourceContents:
    return BlobResourceContents(uri=uri, blob=blob, mime_type=mime_type)


def resource_block(
    resource: TextResourceContents | BlobResourceContents,
) -> EmbeddedResourceContentBlock:
    return EmbeddedResourceContentBlock(type="resource", resource=resource)


def tool_content(block: ContentBlock) -> ContentToolCallContent:
    return ContentToolCallContent(type="content", content=block)


def tool_diff_content(path: str, new_text: str, old_text: str | None = None) -> FileEditToolCallContent:
    return FileEditToolCallContent(type="diff", path=path, new_text=new_text, old_text=old_text)


def tool_terminal_ref(terminal_id: str) -> TerminalToolCallContent:
    return TerminalToolCallContent(type="terminal", terminal_id=terminal_id)


def plan_entry(
    content: str,
    *,
    priority: PlanEntryPriority = "medium",
    status: PlanEntryStatus = "pending",
) -> PlanEntry:
    return PlanEntry(content=content, priority=priority, status=status)


def update_plan(entries: Iterable[PlanEntry]) -> AgentPlanUpdate:
    return AgentPlanUpdate(session_update="plan", entries=list(entries))


def update_user_message(content: ContentBlock) -> UserMessageChunk:
    return UserMessageChunk(session_update="user_message_chunk", content=content)


def update_user_message_text(text: str) -> UserMessageChunk:
    return update_user_message(text_block(text))


def update_agent_message(content: ContentBlock) -> AgentMessageChunk:
    return AgentMessageChunk(session_update="agent_message_chunk", content=content)


def update_agent_message_text(text: str) -> AgentMessageChunk:
    return update_agent_message(text_block(text))


def update_agent_thought(content: ContentBlock) -> AgentThoughtChunk:
    return AgentThoughtChunk(session_update="agent_thought_chunk", content=content)


def update_agent_thought_text(text: str) -> AgentThoughtChunk:
    return update_agent_thought(text_block(text))


def update_available_commands(commands: Iterable[AvailableCommand]) -> AvailableCommandsUpdate:
    return AvailableCommandsUpdate(
        session_update="available_commands_update",
        available_commands=list(commands),
    )


def update_current_mode(current_mode_id: str) -> CurrentModeUpdate:
    return CurrentModeUpdate(session_update="current_mode_update", current_mode_id=current_mode_id)


def session_notification(session_id: str, update: SessionUpdate) -> SessionNotification:
    return SessionNotification(session_id=session_id, update=update)


def start_tool_call(
    tool_call_id: str,
    title: str,
    *,
    kind: ToolKind | None = None,
    status: ToolCallStatus | None = None,
    content: Sequence[ToolCallContentVariant] | None = None,
    locations: Sequence[ToolCallLocation] | None = None,
    raw_input: Any | None = None,
    raw_output: Any | None = None,
) -> ToolCallStart:
    return ToolCallStart(
        session_update="tool_call",
        tool_call_id=tool_call_id,
        title=title,
        kind=kind,
        status=status,
        content=list(content) if content is not None else None,
        locations=list(locations) if locations is not None else None,
        raw_input=raw_input,
        raw_output=raw_output,
    )


def start_read_tool_call(
    tool_call_id: str,
    title: str,
    path: str,
    *,
    extra_options: Sequence[ToolCallContentVariant] | None = None,
) -> ToolCallStart:
    content = list(extra_options) if extra_options is not None else None
    locations = [ToolCallLocation(path=path)]
    raw_input = {"path": path}
    return start_tool_call(
        tool_call_id,
        title,
        kind="read",
        status="pending",
        content=content,
        locations=locations,
        raw_input=raw_input,
    )


def start_edit_tool_call(
    tool_call_id: str,
    title: str,
    path: str,
    content: Any,
    *,
    extra_options: Sequence[ToolCallContentVariant] | None = None,
) -> ToolCallStart:
    locations = [ToolCallLocation(path=path)]
    raw_input = {"path": path, "content": content}
    return start_tool_call(
        tool_call_id,
        title,
        kind="edit",
        status="pending",
        content=list(extra_options) if extra_options is not None else None,
        locations=locations,
        raw_input=raw_input,
    )


def update_tool_call(
    tool_call_id: str,
    *,
    title: str | None = None,
    kind: ToolKind | None = None,
    status: ToolCallStatus | None = None,
    content: Sequence[ToolCallContentVariant] | None = None,
    locations: Sequence[ToolCallLocation] | None = None,
    raw_input: Any | None = None,
    raw_output: Any | None = None,
) -> ToolCallProgress:
    return ToolCallProgress(
        session_update="tool_call_update",
        tool_call_id=tool_call_id,
        title=title,
        kind=kind,
        status=status,
        content=list(content) if content is not None else None,
        locations=list(locations) if locations is not None else None,
        raw_input=raw_input,
        raw_output=raw_output,
    )
````

## File: src/acp/interfaces.py
````python
from __future__ import annotations

from typing import Any, Protocol

from .schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AudioContentBlock,
    AuthenticateRequest,
    AuthenticateResponse,
    AvailableCommandsUpdate,
    CancelNotification,
    ClientCapabilities,
    CloseSessionRequest,
    CloseSessionResponse,
    ConfigOptionUpdate,
    CreateTerminalRequest,
    CreateTerminalResponse,
    CurrentModeUpdate,
    EmbeddedResourceContentBlock,
    EnvVariable,
    ForkSessionRequest,
    ForkSessionResponse,
    HttpMcpServer,
    ImageContentBlock,
    Implementation,
    InitializeRequest,
    InitializeResponse,
    KillTerminalRequest,
    KillTerminalResponse,
    ListSessionsRequest,
    ListSessionsResponse,
    LoadSessionRequest,
    LoadSessionResponse,
    McpServerStdio,
    NewSessionRequest,
    NewSessionResponse,
    PermissionOption,
    PromptRequest,
    PromptResponse,
    ReadTextFileRequest,
    ReadTextFileResponse,
    ReleaseTerminalRequest,
    ReleaseTerminalResponse,
    RequestPermissionRequest,
    RequestPermissionResponse,
    ResourceContentBlock,
    ResumeSessionRequest,
    ResumeSessionResponse,
    SessionInfoUpdate,
    SessionNotification,
    SetSessionConfigOptionBooleanRequest,
    SetSessionConfigOptionResponse,
    SetSessionConfigOptionSelectRequest,
    SetSessionModelRequest,
    SetSessionModelResponse,
    SetSessionModeRequest,
    SetSessionModeResponse,
    SseMcpServer,
    TerminalOutputRequest,
    TerminalOutputResponse,
    TextContentBlock,
    ToolCallProgress,
    ToolCallStart,
    ToolCallUpdate,
    UsageUpdate,
    UserMessageChunk,
    WaitForTerminalExitRequest,
    WaitForTerminalExitResponse,
    WriteTextFileRequest,
    WriteTextFileResponse,
)
from .utils import param_model, param_models

__all__ = ["Agent", "Client"]


class Client(Protocol):
    @param_model(RequestPermissionRequest)
    async def request_permission(
        self, options: list[PermissionOption], session_id: str, tool_call: ToolCallUpdate, **kwargs: Any
    ) -> RequestPermissionResponse: ...

    @param_model(SessionNotification)
    async def session_update(
        self,
        session_id: str,
        update: UserMessageChunk
        | AgentMessageChunk
        | AgentThoughtChunk
        | ToolCallStart
        | ToolCallProgress
        | AgentPlanUpdate
        | AvailableCommandsUpdate
        | CurrentModeUpdate
        | ConfigOptionUpdate
        | SessionInfoUpdate
        | UsageUpdate,
        **kwargs: Any,
    ) -> None: ...

    @param_model(WriteTextFileRequest)
    async def write_text_file(
        self, content: str, path: str, session_id: str, **kwargs: Any
    ) -> WriteTextFileResponse | None: ...

    @param_model(ReadTextFileRequest)
    async def read_text_file(
        self, path: str, session_id: str, limit: int | None = None, line: int | None = None, **kwargs: Any
    ) -> ReadTextFileResponse: ...

    @param_model(CreateTerminalRequest)
    async def create_terminal(
        self,
        command: str,
        session_id: str,
        args: list[str] | None = None,
        cwd: str | None = None,
        env: list[EnvVariable] | None = None,
        output_byte_limit: int | None = None,
        **kwargs: Any,
    ) -> CreateTerminalResponse: ...

    @param_model(TerminalOutputRequest)
    async def terminal_output(self, session_id: str, terminal_id: str, **kwargs: Any) -> TerminalOutputResponse: ...

    @param_model(ReleaseTerminalRequest)
    async def release_terminal(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> ReleaseTerminalResponse | None: ...

    @param_model(WaitForTerminalExitRequest)
    async def wait_for_terminal_exit(
        self, session_id: str, terminal_id: str, **kwargs: Any
    ) -> WaitForTerminalExitResponse: ...

    @param_model(KillTerminalRequest)
    async def kill_terminal(self, session_id: str, terminal_id: str, **kwargs: Any) -> KillTerminalResponse | None: ...

    async def ext_method(self, method: str, params: dict[str, Any]) -> dict[str, Any]: ...

    async def ext_notification(self, method: str, params: dict[str, Any]) -> None: ...

    def on_connect(self, conn: Agent) -> None: ...


class Agent(Protocol):
    @param_model(InitializeRequest)
    async def initialize(
        self,
        protocol_version: int,
        client_capabilities: ClientCapabilities | None = None,
        client_info: Implementation | None = None,
        **kwargs: Any,
    ) -> InitializeResponse: ...

    @param_model(NewSessionRequest)
    async def new_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None, **kwargs: Any
    ) -> NewSessionResponse: ...

    @param_model(LoadSessionRequest)
    async def load_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> LoadSessionResponse | None: ...

    @param_model(ListSessionsRequest)
    async def list_sessions(
        self, cursor: str | None = None, cwd: str | None = None, **kwargs: Any
    ) -> ListSessionsResponse: ...

    @param_model(SetSessionModeRequest)
    async def set_session_mode(self, mode_id: str, session_id: str, **kwargs: Any) -> SetSessionModeResponse | None: ...

    @param_model(SetSessionModelRequest)
    async def set_session_model(
        self, model_id: str, session_id: str, **kwargs: Any
    ) -> SetSessionModelResponse | None: ...

    @param_models(SetSessionConfigOptionBooleanRequest, SetSessionConfigOptionSelectRequest)
    async def set_config_option(
        self, config_id: str, session_id: str, value: str | bool, **kwargs: Any
    ) -> SetSessionConfigOptionResponse | None: ...

    @param_model(AuthenticateRequest)
    async def authenticate(self, method_id: str, **kwargs: Any) -> AuthenticateResponse | None: ...

    @param_model(PromptRequest)
    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        message_id: str | None = None,
        **kwargs: Any,
    ) -> PromptResponse: ...

    @param_model(ForkSessionRequest)
    async def fork_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> ForkSessionResponse: ...

    @param_model(ResumeSessionRequest)
    async def resume_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> ResumeSessionResponse: ...

    @param_model(CloseSessionRequest)
    async def close_session(self, session_id: str, **kwargs: Any) -> CloseSessionResponse | None: ...

    @param_model(CancelNotification)
    async def cancel(self, session_id: str, **kwargs: Any) -> None: ...

    async def ext_method(self, method: str, params: dict[str, Any]) -> dict[str, Any]: ...

    async def ext_notification(self, method: str, params: dict[str, Any]) -> None: ...

    def on_connect(self, conn: Client) -> None: ...
````

## File: src/acp/meta.py
````python
# Generated from schema/meta.json. Do not edit by hand.
# Schema ref: refs/tags/v0.11.2
AGENT_METHODS = {
    "authenticate": "authenticate",
    "initialize": "initialize",
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
    "session_set_model": "session/set_model",
}
CLIENT_METHODS = {
    "fs_read_text_file": "fs/read_text_file",
    "fs_write_text_file": "fs/write_text_file",
    "session_request_permission": "session/request_permission",
    "session_update": "session/update",
    "terminal_create": "terminal/create",
    "terminal_kill": "terminal/kill",
    "terminal_output": "terminal/output",
    "terminal_release": "terminal/release",
    "terminal_wait_for_exit": "terminal/wait_for_exit",
}
PROTOCOL_VERSION = 1
````

## File: src/acp/py.typed
````
# Marker file for PEP 561 to indicate the package provides type hints.
````

## File: src/acp/router.py
````python
from __future__ import annotations

import inspect
import warnings
from collections.abc import Awaitable, Callable
from dataclasses import dataclass
from typing import Any, Literal, TypeVar

from pydantic import BaseModel

from acp.utils import to_camel_case

from .exceptions import RequestError

__all__ = ["MessageRouter", "Route"]


AsyncHandler = Callable[[Any], Awaitable[Any | None]]
RequestHandler = Callable[[str, dict[str, Any]], Awaitable[Any]]
HandlerT = TypeVar("HandlerT", bound=RequestHandler)


def _warn_legacy_handler(obj: Any, attr: str) -> None:
    warnings.warn(
        f"The old style method {type(obj).__name__}.{attr} is deprecated, please update to the snake-cased form.",
        DeprecationWarning,
        stacklevel=3,
    )


def _resolve_handler(obj: Any, attr: str) -> tuple[AsyncHandler | None, str, bool]:
    legacy_api = False
    func = getattr(obj, attr, None)
    if func is None and "_" in attr:
        attr = to_camel_case(attr)
        func = getattr(obj, attr, None)
        legacy_api = True
    elif callable(func) and "_" not in attr:
        original_func = func
        if hasattr(func, "__func__"):
            original_func = func.__func__
        parameters = inspect.signature(original_func).parameters
        if len(parameters) == 2 and "params" in parameters:
            legacy_api = True

    if func is None or not callable(func):
        return None, attr, legacy_api
    return func, attr, legacy_api


@dataclass(slots=True)
class Route:
    method: str
    func: AsyncHandler | None
    kind: Literal["request", "notification"]
    optional: bool = False
    default_result: Any = None
    adapt_result: Callable[[Any | None], Any] | None = None
    warn_unstable: bool = False

    async def handle(self, params: Any) -> Any:
        if self.func is None:
            if self.optional:
                return self.default_result
            raise RequestError.method_not_found(self.method)
        if self.warn_unstable:
            warnings.warn(
                f"The method {self.method} is part of the unstable protocol, please enable `use_unstable_protocol` flag to use it.",
                UserWarning,
                stacklevel=3,
            )
            raise RequestError.method_not_found(self.method)
        result = await self.func(params)
        if self.adapt_result is not None and self.kind == "request":
            return self.adapt_result(result)
        return result


class MessageRouter:
    def __init__(self, use_unstable_protocol: bool = False) -> None:
        self._requests: dict[str, Route] = {}
        self._notifications: dict[str, Route] = {}
        self._request_extensions: RequestHandler | None = None
        self._notification_extensions: RequestHandler | None = None
        self._use_unstable_protocol = use_unstable_protocol

    def add_route(self, route: Route) -> None:
        if route.kind == "request":
            self._requests[route.method] = route
        else:
            self._notifications[route.method] = route

    def _make_func(self, model: type[BaseModel], obj: Any, attr: str) -> AsyncHandler | None:
        func, attr, legacy_api = _resolve_handler(obj, attr)
        if func is None:
            return None

        async def wrapper(params: Any) -> Any:
            if legacy_api:
                _warn_legacy_handler(obj, attr)
            model_obj = model.model_validate(params)
            if legacy_api:
                return await func(model_obj)  # type: ignore[arg-type]
            params = {k: getattr(model_obj, k) for k in model.model_fields if k != "field_meta"}
            if meta := getattr(model_obj, "field_meta", None):
                params.update(meta)
            return await func(**params)  # type: ignore[arg-type]

        return wrapper

    def route_request(
        self,
        method: str,
        model: type[BaseModel],
        obj: Any,
        attr: str,
        optional: bool = False,
        default_result: Any = None,
        adapt_result: Callable[[Any | None], Any] | None = None,
        unstable: bool = False,
    ) -> Route:
        """Register a request route with obj and attribute name."""
        route = Route(
            method=method,
            func=self._make_func(model, obj, attr),
            kind="request",
            optional=optional,
            default_result=default_result,
            adapt_result=adapt_result,
            warn_unstable=unstable and not self._use_unstable_protocol,
        )
        self.add_route(route)
        return route

    def route_notification(
        self,
        method: str,
        model: type[BaseModel],
        obj: Any,
        attr: str,
        optional: bool = False,
        unstable: bool = False,
    ) -> Route:
        """Register a notification route with obj and attribute name."""
        route = Route(
            method=method,
            func=self._make_func(model, obj, attr),
            kind="notification",
            optional=optional,
            warn_unstable=unstable and not self._use_unstable_protocol,
        )
        self.add_route(route)
        return route

    def handle_extension_request(self, handler: HandlerT) -> HandlerT:
        """Register a handler for extension requests."""
        self._request_extensions = handler
        return handler

    def handle_extension_notification(self, handler: HandlerT) -> HandlerT:
        """Register a handler for extension notifications."""
        self._notification_extensions = handler
        return handler

    async def __call__(self, method: str, params: Any | None, is_notification: bool) -> Any:
        """The main router call to handle a request or notification."""
        if is_notification:
            ext_handler = self._notification_extensions
            routes = self._notifications
        else:
            ext_handler = self._request_extensions
            routes = self._requests

        if isinstance(method, str) and method.startswith("_"):
            if ext_handler is None:
                raise RequestError.method_not_found(method)
            payload = params if isinstance(params, dict) else {}
            return await ext_handler(method[1:], payload)

        route = routes.get(method)
        if route is None:
            raise RequestError.method_not_found(method)

        return await route.handle(params)
````

## File: src/acp/schema.py
````python
# Generated from schema/schema.json. Do not edit by hand.
# Schema ref: refs/tags/v0.11.2

from __future__ import annotations

from enum import Enum
from typing import Annotated, Any, Dict, List, Literal, Optional, Union

from pydantic import BaseModel as _BaseModel, Field, RootModel, ConfigDict

PermissionOptionKind = Literal["allow_once", "allow_always", "reject_once", "reject_always"]
PlanEntryPriority = Literal["high", "medium", "low"]
PlanEntryStatus = Literal["pending", "in_progress", "completed"]
StopReason = Literal["end_turn", "max_tokens", "max_turn_requests", "refusal", "cancelled"]
ToolCallStatus = Literal["pending", "in_progress", "completed", "failed"]
ToolKind = Literal["read", "edit", "delete", "move", "search", "execute", "think", "fetch", "switch_mode", "other"]


class BaseModel(_BaseModel):
    model_config = ConfigDict(populate_by_name=True)

    def __getattr__(self, item: str) -> Any:
        if item.lower() != item:
            snake_cased = "".join("_" + c.lower() if c.isupper() and i > 0 else c.lower() for i, c in enumerate(item))
            return getattr(self, snake_cased)
        raise AttributeError(f"'{type(self).__name__}' object has no attribute '{item}'")


class Jsonrpc(Enum):
    field_2_0 = "2.0"


class AuthCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Whether the client supports `terminal` authentication methods.
    #
    # When `true`, the agent may include `terminal` entries in its authentication methods.
    terminal: Annotated[
        Optional[bool],
        Field(
            description="Whether the client supports `terminal` authentication methods.\n\nWhen `true`, the agent may include `terminal` entries in its authentication methods."
        ),
    ] = False


class AuthEnvVar(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Human-readable label for this variable, displayed in client UI.
    label: Annotated[
        Optional[str],
        Field(description="Human-readable label for this variable, displayed in client UI."),
    ] = None
    # The environment variable name (e.g. `"OPENAI_API_KEY"`).
    name: Annotated[
        str,
        Field(description='The environment variable name (e.g. `"OPENAI_API_KEY"`).'),
    ]
    # Whether this variable is optional.
    #
    # Defaults to `false`.
    optional: Annotated[
        Optional[bool],
        Field(description="Whether this variable is optional.\n\nDefaults to `false`."),
    ] = False
    # Whether this value is a secret (e.g. API key, token).
    # Clients should use a password-style input for secret vars.
    #
    # Defaults to `true`.
    secret: Annotated[
        Optional[bool],
        Field(
            description="Whether this value is a secret (e.g. API key, token).\nClients should use a password-style input for secret vars.\n\nDefaults to `true`."
        ),
    ] = True


class AuthMethodAgent(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Optional description providing more details about this authentication method.
    description: Annotated[
        Optional[str],
        Field(description="Optional description providing more details about this authentication method."),
    ] = None
    # Unique identifier for this authentication method.
    id: Annotated[str, Field(description="Unique identifier for this authentication method.")]
    # Human-readable name of the authentication method.
    name: Annotated[str, Field(description="Human-readable name of the authentication method.")]


class AuthMethodEnvVar(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Optional description providing more details about this authentication method.
    description: Annotated[
        Optional[str],
        Field(description="Optional description providing more details about this authentication method."),
    ] = None
    # Unique identifier for this authentication method.
    id: Annotated[str, Field(description="Unique identifier for this authentication method.")]
    # Optional link to a page where the user can obtain their credentials.
    link: Annotated[
        Optional[str],
        Field(description="Optional link to a page where the user can obtain their credentials."),
    ] = None
    # Human-readable name of the authentication method.
    name: Annotated[str, Field(description="Human-readable name of the authentication method.")]
    # The environment variables the client should set.
    vars: Annotated[
        List[AuthEnvVar],
        Field(description="The environment variables the client should set."),
    ]


class AuthMethodTerminal(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Additional arguments to pass when running the agent binary for terminal auth.
    args: Annotated[
        Optional[List[str]],
        Field(description="Additional arguments to pass when running the agent binary for terminal auth."),
    ] = None
    # Optional description providing more details about this authentication method.
    description: Annotated[
        Optional[str],
        Field(description="Optional description providing more details about this authentication method."),
    ] = None
    # Additional environment variables to set when running the agent binary for terminal auth.
    env: Annotated[
        Optional[Dict[str, str]],
        Field(description="Additional environment variables to set when running the agent binary for terminal auth."),
    ] = None
    # Unique identifier for this authentication method.
    id: Annotated[str, Field(description="Unique identifier for this authentication method.")]
    # Human-readable name of the authentication method.
    name: Annotated[str, Field(description="Human-readable name of the authentication method.")]


class AuthenticateRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the authentication method to use.
    # Must be one of the methods advertised in the initialize response.
    method_id: Annotated[
        str,
        Field(
            alias="methodId",
            description="The ID of the authentication method to use.\nMust be one of the methods advertised in the initialize response.",
        ),
    ]


class AuthenticateResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class BlobResourceContents(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    blob: str
    mime_type: Annotated[Optional[str], Field(alias="mimeType")] = None
    uri: str


class CloseSessionResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class Cost(BaseModel):
    # Total cumulative cost for session.
    amount: Annotated[float, Field(description="Total cumulative cost for session.")]
    # ISO 4217 currency code (e.g., "USD", "EUR").
    currency: Annotated[str, Field(description='ISO 4217 currency code (e.g., "USD", "EUR").')]


class CreateTerminalResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The unique identifier for the created terminal.
    terminal_id: Annotated[
        str,
        Field(
            alias="terminalId",
            description="The unique identifier for the created terminal.",
        ),
    ]


class Diff(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The new content after modification.
    new_text: Annotated[str, Field(alias="newText", description="The new content after modification.")]
    # The original content (None for new files).
    old_text: Annotated[
        Optional[str],
        Field(alias="oldText", description="The original content (None for new files)."),
    ] = None
    # The file path being modified.
    path: Annotated[str, Field(description="The file path being modified.")]


class EnvVariable(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The name of the environment variable.
    name: Annotated[str, Field(description="The name of the environment variable.")]
    # The value to set for the environment variable.
    value: Annotated[str, Field(description="The value to set for the environment variable.")]


class FileSystemCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Whether the Client supports `fs/read_text_file` requests.
    read_text_file: Annotated[
        Optional[bool],
        Field(
            alias="readTextFile",
            description="Whether the Client supports `fs/read_text_file` requests.",
        ),
    ] = False
    # Whether the Client supports `fs/write_text_file` requests.
    write_text_file: Annotated[
        Optional[bool],
        Field(
            alias="writeTextFile",
            description="Whether the Client supports `fs/write_text_file` requests.",
        ),
    ] = False


class HttpHeader(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The name of the HTTP header.
    name: Annotated[str, Field(description="The name of the HTTP header.")]
    # The value to set for the HTTP header.
    value: Annotated[str, Field(description="The value to set for the HTTP header.")]


class Implementation(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Intended for programmatic or logical use, but can be used as a display
    # name fallback if title isn’t present.
    name: Annotated[
        str,
        Field(
            description="Intended for programmatic or logical use, but can be used as a display\nname fallback if title isn’t present."
        ),
    ]
    # Intended for UI and end-user contexts — optimized to be human-readable
    # and easily understood.
    #
    # If not provided, the name should be used for display.
    title: Annotated[
        Optional[str],
        Field(
            description="Intended for UI and end-user contexts — optimized to be human-readable\nand easily understood.\n\nIf not provided, the name should be used for display."
        ),
    ] = None
    # Version of the implementation. Can be displayed to the user or used
    # for debugging or metrics purposes. (e.g. "1.0.0").
    version: Annotated[
        str,
        Field(
            description='Version of the implementation. Can be displayed to the user or used\nfor debugging or metrics purposes. (e.g. "1.0.0").'
        ),
    ]


class KillTerminalResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class ListSessionsRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Opaque cursor token from a previous response's nextCursor field for cursor-based pagination
    cursor: Annotated[
        Optional[str],
        Field(
            description="Opaque cursor token from a previous response's nextCursor field for cursor-based pagination"
        ),
    ] = None
    # Filter sessions by working directory. Must be an absolute path.
    cwd: Annotated[
        Optional[str],
        Field(description="Filter sessions by working directory. Must be an absolute path."),
    ] = None


class McpCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Agent supports [`McpServer::Http`].
    http: Annotated[Optional[bool], Field(description="Agent supports [`McpServer::Http`].")] = False
    # Agent supports [`McpServer::Sse`].
    sse: Annotated[Optional[bool], Field(description="Agent supports [`McpServer::Sse`].")] = False


class McpServerHttp(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # HTTP headers to set when making requests to the MCP server.
    headers: Annotated[
        List[HttpHeader],
        Field(description="HTTP headers to set when making requests to the MCP server."),
    ]
    # Human-readable name identifying this MCP server.
    name: Annotated[str, Field(description="Human-readable name identifying this MCP server.")]
    # URL to the MCP server.
    url: Annotated[str, Field(description="URL to the MCP server.")]


class McpServerSse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # HTTP headers to set when making requests to the MCP server.
    headers: Annotated[
        List[HttpHeader],
        Field(description="HTTP headers to set when making requests to the MCP server."),
    ]
    # Human-readable name identifying this MCP server.
    name: Annotated[str, Field(description="Human-readable name identifying this MCP server.")]
    # URL to the MCP server.
    url: Annotated[str, Field(description="URL to the MCP server.")]


class McpServerStdio(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Command-line arguments to pass to the MCP server.
    args: Annotated[
        List[str],
        Field(description="Command-line arguments to pass to the MCP server."),
    ]
    # Path to the MCP server executable.
    command: Annotated[str, Field(description="Path to the MCP server executable.")]
    # Environment variables to set when launching the MCP server.
    env: Annotated[
        List[EnvVariable],
        Field(description="Environment variables to set when launching the MCP server."),
    ]
    # Human-readable name identifying this MCP server.
    name: Annotated[str, Field(description="Human-readable name identifying this MCP server.")]


class ModelInfo(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Optional description of the model.
    description: Annotated[Optional[str], Field(description="Optional description of the model.")] = None
    # Unique identifier for the model.
    model_id: Annotated[str, Field(alias="modelId", description="Unique identifier for the model.")]
    # Human-readable name of the model.
    name: Annotated[str, Field(description="Human-readable name of the model.")]


class PromptCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Agent supports [`ContentBlock::Audio`].
    audio: Annotated[Optional[bool], Field(description="Agent supports [`ContentBlock::Audio`].")] = False
    # Agent supports embedded context in `session/prompt` requests.
    #
    # When enabled, the Client is allowed to include [`ContentBlock::Resource`]
    # in prompt requests for pieces of context that are referenced in the message.
    embedded_context: Annotated[
        Optional[bool],
        Field(
            alias="embeddedContext",
            description="Agent supports embedded context in `session/prompt` requests.\n\nWhen enabled, the Client is allowed to include [`ContentBlock::Resource`]\nin prompt requests for pieces of context that are referenced in the message.",
        ),
    ] = False
    # Agent supports [`ContentBlock::Image`].
    image: Annotated[Optional[bool], Field(description="Agent supports [`ContentBlock::Image`].")] = False


class ReadTextFileResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    content: str


class ReleaseTerminalResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class DeniedOutcome(BaseModel):
    outcome: Literal["cancelled"]


class Role(Enum):
    assistant = "assistant"
    user = "user"


class SelectedPermissionOutcome(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the option the user selected.
    option_id: Annotated[
        str,
        Field(alias="optionId", description="The ID of the option the user selected."),
    ]


class SessionCloseCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class SessionConfigBoolean(BaseModel):
    # The current value of the boolean option.
    current_value: Annotated[
        bool,
        Field(alias="currentValue", description="The current value of the boolean option."),
    ]


class SessionForkCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class SessionInfo(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The working directory for this session. Must be an absolute path.
    cwd: Annotated[
        str,
        Field(description="The working directory for this session. Must be an absolute path."),
    ]
    # Unique identifier for the session
    session_id: Annotated[str, Field(alias="sessionId", description="Unique identifier for the session")]
    # Human-readable title for the session
    title: Annotated[Optional[str], Field(description="Human-readable title for the session")] = None
    # ISO 8601 timestamp of last activity
    updated_at: Annotated[
        Optional[str],
        Field(alias="updatedAt", description="ISO 8601 timestamp of last activity"),
    ] = None


class _SessionInfoUpdate(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Human-readable title for the session. Set to null to clear.
    title: Annotated[
        Optional[str],
        Field(description="Human-readable title for the session. Set to null to clear."),
    ] = None
    # ISO 8601 timestamp of last activity. Set to null to clear.
    updated_at: Annotated[
        Optional[str],
        Field(
            alias="updatedAt",
            description="ISO 8601 timestamp of last activity. Set to null to clear.",
        ),
    ] = None


class SessionListCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class SessionModelState(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The set of models that the Agent can use
    available_models: Annotated[
        List[ModelInfo],
        Field(
            alias="availableModels",
            description="The set of models that the Agent can use",
        ),
    ]
    # The current model the Agent is in.
    current_model_id: Annotated[
        str,
        Field(alias="currentModelId", description="The current model the Agent is in."),
    ]


class SessionResumeCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class SessionInfoUpdate(_SessionInfoUpdate):
    session_update: Annotated[Literal["session_info_update"], Field(alias="sessionUpdate")]


class SetSessionConfigOptionBooleanRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the configuration option to set.
    config_id: Annotated[
        str,
        Field(alias="configId", description="The ID of the configuration option to set."),
    ]
    # The ID of the session to set the configuration option for.
    session_id: Annotated[
        str,
        Field(
            alias="sessionId",
            description="The ID of the session to set the configuration option for.",
        ),
    ]
    type: Literal["boolean"]
    # The boolean value.
    value: Annotated[bool, Field(description="The boolean value.")]


class SetSessionConfigOptionSelectRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the configuration option to set.
    config_id: Annotated[
        str,
        Field(alias="configId", description="The ID of the configuration option to set."),
    ]
    # The ID of the session to set the configuration option for.
    session_id: Annotated[
        str,
        Field(
            alias="sessionId",
            description="The ID of the session to set the configuration option for.",
        ),
    ]
    # The value ID.
    value: Annotated[str, Field(description="The value ID.")]


class SetSessionModeRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the mode to set.
    mode_id: Annotated[str, Field(alias="modeId", description="The ID of the mode to set.")]
    # The ID of the session to set the mode for.
    session_id: Annotated[
        str,
        Field(alias="sessionId", description="The ID of the session to set the mode for."),
    ]


class SetSessionModeResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class SetSessionModelRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the model to set.
    model_id: Annotated[str, Field(alias="modelId", description="The ID of the model to set.")]
    # The ID of the session to set the model for.
    session_id: Annotated[
        str,
        Field(alias="sessionId", description="The ID of the session to set the model for."),
    ]


class SetSessionModelResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class Terminal(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    terminal_id: Annotated[str, Field(alias="terminalId")]


class TerminalExitStatus(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The process exit code (may be null if terminated by signal).
    exit_code: Annotated[
        Optional[int],
        Field(
            alias="exitCode",
            description="The process exit code (may be null if terminated by signal).",
            ge=0,
        ),
    ] = None
    # The signal that terminated the process (may be null if exited normally).
    signal: Annotated[
        Optional[str],
        Field(description="The signal that terminated the process (may be null if exited normally)."),
    ] = None


class TerminalOutputRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]
    # The ID of the terminal to get output from.
    terminal_id: Annotated[
        str,
        Field(alias="terminalId", description="The ID of the terminal to get output from."),
    ]


class TerminalOutputResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Exit status if the command has completed.
    exit_status: Annotated[
        Optional[TerminalExitStatus],
        Field(alias="exitStatus", description="Exit status if the command has completed."),
    ] = None
    # The terminal output captured so far.
    output: Annotated[str, Field(description="The terminal output captured so far.")]
    # Whether the output was truncated due to byte limits.
    truncated: Annotated[bool, Field(description="Whether the output was truncated due to byte limits.")]


class TextResourceContents(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    mime_type: Annotated[Optional[str], Field(alias="mimeType")] = None
    text: str
    uri: str


class FileEditToolCallContent(Diff):
    type: Literal["diff"]


class TerminalToolCallContent(Terminal):
    type: Literal["terminal"]


class ToolCallLocation(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Optional line number within the file.
    line: Annotated[Optional[int], Field(description="Optional line number within the file.", ge=0)] = None
    # The file path being accessed or modified.
    path: Annotated[str, Field(description="The file path being accessed or modified.")]


class UnstructuredCommandInput(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # A hint to display when the input hasn't been provided yet
    hint: Annotated[
        str,
        Field(description="A hint to display when the input hasn't been provided yet"),
    ]


class Usage(BaseModel):
    # Total cache read tokens.
    cached_read_tokens: Annotated[
        Optional[int],
        Field(alias="cachedReadTokens", description="Total cache read tokens.", ge=0),
    ] = None
    # Total cache write tokens.
    cached_write_tokens: Annotated[
        Optional[int],
        Field(alias="cachedWriteTokens", description="Total cache write tokens.", ge=0),
    ] = None
    # Total input tokens across all turns.
    input_tokens: Annotated[
        int,
        Field(
            alias="inputTokens",
            description="Total input tokens across all turns.",
            ge=0,
        ),
    ]
    # Total output tokens across all turns.
    output_tokens: Annotated[
        int,
        Field(
            alias="outputTokens",
            description="Total output tokens across all turns.",
            ge=0,
        ),
    ]
    # Total thought/reasoning tokens
    thought_tokens: Annotated[
        Optional[int],
        Field(alias="thoughtTokens", description="Total thought/reasoning tokens", ge=0),
    ] = None
    # Sum of all token types across session.
    total_tokens: Annotated[
        int,
        Field(
            alias="totalTokens",
            description="Sum of all token types across session.",
            ge=0,
        ),
    ]


class _UsageUpdate(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Cumulative session cost (optional).
    cost: Annotated[Optional[Cost], Field(description="Cumulative session cost (optional).")] = None
    # Total context window size in tokens.
    size: Annotated[int, Field(description="Total context window size in tokens.", ge=0)]
    # Tokens currently in context.
    used: Annotated[int, Field(description="Tokens currently in context.", ge=0)]


class WaitForTerminalExitRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]
    # The ID of the terminal to wait for.
    terminal_id: Annotated[
        str,
        Field(alias="terminalId", description="The ID of the terminal to wait for."),
    ]


class WaitForTerminalExitResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The process exit code (may be null if terminated by signal).
    exit_code: Annotated[
        Optional[int],
        Field(
            alias="exitCode",
            description="The process exit code (may be null if terminated by signal).",
            ge=0,
        ),
    ] = None
    # The signal that terminated the process (may be null if exited normally).
    signal: Annotated[
        Optional[str],
        Field(description="The signal that terminated the process (may be null if exited normally)."),
    ] = None


class WriteTextFileRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The text content to write to the file.
    content: Annotated[str, Field(description="The text content to write to the file.")]
    # Absolute path to the file to write.
    path: Annotated[str, Field(description="Absolute path to the file to write.")]
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]


class WriteTextFileResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None


class Annotations(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    audience: Optional[List[Role]] = None
    last_modified: Annotated[Optional[str], Field(alias="lastModified")] = None
    priority: Optional[float] = None


class AudioContent(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    annotations: Optional[Annotations] = None
    data: str
    mime_type: Annotated[str, Field(alias="mimeType")]


class EnvVarAuthMethod(AuthMethodEnvVar):
    type: Literal["env_var"]


class TerminalAuthMethod(AuthMethodTerminal):
    type: Literal["terminal"]


class AvailableCommandInput(RootModel[UnstructuredCommandInput]):
    # The input specification for a command.
    root: Annotated[
        UnstructuredCommandInput,
        Field(description="The input specification for a command."),
    ]


class CancelNotification(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the session to cancel operations for.
    session_id: Annotated[
        str,
        Field(
            alias="sessionId",
            description="The ID of the session to cancel operations for.",
        ),
    ]


class CancelRequestNotification(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the request to cancel.
    request_id: Annotated[
        Optional[Union[int, str]],
        Field(alias="requestId", description="The ID of the request to cancel."),
    ] = None


class ClientCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Authentication capabilities supported by the client.
    # Determines which authentication method types the agent may include
    # in its `InitializeResponse`.
    auth: Annotated[
        Optional[AuthCapabilities],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nAuthentication capabilities supported by the client.\nDetermines which authentication method types the agent may include\nin its `InitializeResponse`."
        ),
    ] = {"terminal": False}
    # File system capabilities supported by the client.
    # Determines which file operations the agent can request.
    fs: Annotated[
        Optional[FileSystemCapabilities],
        Field(
            description="File system capabilities supported by the client.\nDetermines which file operations the agent can request."
        ),
    ] = FileSystemCapabilities()
    # Whether the Client support all `terminal/*` methods.
    terminal: Annotated[
        Optional[bool],
        Field(description="Whether the Client support all `terminal/*` methods."),
    ] = False


class ClientNotification(BaseModel):
    method: str
    params: Optional[Union[CancelNotification, Any]] = None


class CloseSessionRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the session to close.
    session_id: Annotated[str, Field(alias="sessionId", description="The ID of the session to close.")]


class AudioContentBlock(AudioContent):
    type: Literal["audio"]


class CreateTerminalRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Array of command arguments.
    args: Annotated[Optional[List[str]], Field(description="Array of command arguments.")] = None
    # The command to execute.
    command: Annotated[str, Field(description="The command to execute.")]
    # Working directory for the command (absolute path).
    cwd: Annotated[
        Optional[str],
        Field(description="Working directory for the command (absolute path)."),
    ] = None
    # Environment variables for the command.
    env: Annotated[
        Optional[List[EnvVariable]],
        Field(description="Environment variables for the command."),
    ] = None
    # Maximum number of output bytes to retain.
    #
    # When the limit is exceeded, the Client truncates from the beginning of the output
    # to stay within the limit.
    #
    # The Client MUST ensure truncation happens at a character boundary to maintain valid
    # string output, even if this means the retained output is slightly less than the
    # specified limit.
    output_byte_limit: Annotated[
        Optional[int],
        Field(
            alias="outputByteLimit",
            description="Maximum number of output bytes to retain.\n\nWhen the limit is exceeded, the Client truncates from the beginning of the output\nto stay within the limit.\n\nThe Client MUST ensure truncation happens at a character boundary to maintain valid\nstring output, even if this means the retained output is slightly less than the\nspecified limit.",
            ge=0,
        ),
    ] = None
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]


class _CurrentModeUpdate(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the current mode
    current_mode_id: Annotated[str, Field(alias="currentModeId", description="The ID of the current mode")]


class Error(BaseModel):
    # A number indicating the error type that occurred.
    # This must be an integer as defined in the JSON-RPC specification.
    code: Annotated[
        int,
        Field(
            description="A number indicating the error type that occurred.\nThis must be an integer as defined in the JSON-RPC specification."
        ),
    ]
    # Optional primitive or structured value that contains additional information about the error.
    # This may include debugging information or context-specific details.
    data: Annotated[
        Optional[Any],
        Field(
            description="Optional primitive or structured value that contains additional information about the error.\nThis may include debugging information or context-specific details."
        ),
    ] = None
    # A string providing a short description of the error.
    # The message should be limited to a concise single sentence.
    message: Annotated[
        str,
        Field(
            description="A string providing a short description of the error.\nThe message should be limited to a concise single sentence."
        ),
    ]


class ImageContent(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    annotations: Optional[Annotations] = None
    data: str
    mime_type: Annotated[str, Field(alias="mimeType")]
    uri: Optional[str] = None


class InitializeRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Capabilities supported by the client.
    client_capabilities: Annotated[
        Optional[ClientCapabilities],
        Field(
            alias="clientCapabilities",
            description="Capabilities supported by the client.",
        ),
    ] = ClientCapabilities()
    # Information about the Client name and version sent to the Agent.
    #
    # Note: in future versions of the protocol, this will be required.
    client_info: Annotated[
        Optional[Implementation],
        Field(
            alias="clientInfo",
            description="Information about the Client name and version sent to the Agent.\n\nNote: in future versions of the protocol, this will be required.",
        ),
    ] = None
    # The latest protocol version supported by the client.
    protocol_version: Annotated[
        int,
        Field(
            alias="protocolVersion",
            description="The latest protocol version supported by the client.",
            ge=0,
            le=65535,
        ),
    ]


class KillTerminalRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]
    # The ID of the terminal to kill.
    terminal_id: Annotated[str, Field(alias="terminalId", description="The ID of the terminal to kill.")]


class ListSessionsResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Opaque cursor token. If present, pass this in the next request's cursor parameter
    # to fetch the next page. If absent, there are no more results.
    next_cursor: Annotated[
        Optional[str],
        Field(
            alias="nextCursor",
            description="Opaque cursor token. If present, pass this in the next request's cursor parameter\nto fetch the next page. If absent, there are no more results.",
        ),
    ] = None
    # Array of session information objects
    sessions: Annotated[List[SessionInfo], Field(description="Array of session information objects")]


class HttpMcpServer(McpServerHttp):
    type: Literal["http"]


class SseMcpServer(McpServerSse):
    type: Literal["sse"]


class NewSessionRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The working directory for this session. Must be an absolute path.
    cwd: Annotated[
        str,
        Field(description="The working directory for this session. Must be an absolute path."),
    ]
    # List of MCP (Model Context Protocol) servers the agent should connect to.
    mcp_servers: Annotated[
        List[Union[HttpMcpServer, SseMcpServer, McpServerStdio]],
        Field(
            alias="mcpServers",
            description="List of MCP (Model Context Protocol) servers the agent should connect to.",
        ),
    ]


class PermissionOption(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Hint about the nature of this permission option.
    kind: Annotated[PermissionOptionKind, Field(description="Hint about the nature of this permission option.")]
    # Human-readable label to display to the user.
    name: Annotated[str, Field(description="Human-readable label to display to the user.")]
    # Unique identifier for this permission option.
    option_id: Annotated[
        str,
        Field(
            alias="optionId",
            description="Unique identifier for this permission option.",
        ),
    ]


class PlanEntry(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Human-readable description of what this task aims to accomplish.
    content: Annotated[
        str,
        Field(description="Human-readable description of what this task aims to accomplish."),
    ]
    # The relative importance of this task.
    # Used to indicate which tasks are most critical to the overall goal.
    priority: Annotated[
        PlanEntryPriority,
        Field(
            description="The relative importance of this task.\nUsed to indicate which tasks are most critical to the overall goal."
        ),
    ]
    # Current execution status of this task.
    status: Annotated[PlanEntryStatus, Field(description="Current execution status of this task.")]


class PromptResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Indicates why the agent stopped processing the turn.
    stop_reason: Annotated[
        StopReason,
        Field(
            alias="stopReason",
            description="Indicates why the agent stopped processing the turn.",
        ),
    ]
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Token usage for this turn (optional).
    usage: Annotated[
        Optional[Usage],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nToken usage for this turn (optional)."
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # The acknowledged user message ID.
    #
    # If the client provided a `messageId` in the [`PromptRequest`], the agent echoes it here
    # to confirm it was recorded. If the client did not provide one, the agent MAY assign one
    # and return it here. Absence of this field indicates the agent did not record a message ID.
    user_message_id: Annotated[
        Optional[str],
        Field(
            alias="userMessageId",
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nThe acknowledged user message ID.\n\nIf the client provided a `messageId` in the [`PromptRequest`], the agent echoes it here\nto confirm it was recorded. If the client did not provide one, the agent MAY assign one\nand return it here. Absence of this field indicates the agent did not record a message ID.",
        ),
    ] = None


class ReadTextFileRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Maximum number of lines to read.
    limit: Annotated[Optional[int], Field(description="Maximum number of lines to read.", ge=0)] = None
    # Line number to start reading from (1-based).
    line: Annotated[
        Optional[int],
        Field(description="Line number to start reading from (1-based).", ge=0),
    ] = None
    # Absolute path to the file to read.
    path: Annotated[str, Field(description="Absolute path to the file to read.")]
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]


class ReleaseTerminalRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]
    # The ID of the terminal to release.
    terminal_id: Annotated[str, Field(alias="terminalId", description="The ID of the terminal to release.")]


class AllowedOutcome(SelectedPermissionOutcome):
    outcome: Literal["selected"]


class RequestPermissionResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The user's decision on the permission request.
    outcome: Annotated[
        Union[DeniedOutcome, AllowedOutcome],
        Field(
            description="The user's decision on the permission request.",
            discriminator="outcome",
        ),
    ]


class ResourceLink(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    annotations: Optional[Annotations] = None
    description: Optional[str] = None
    mime_type: Annotated[Optional[str], Field(alias="mimeType")] = None
    name: str
    size: Optional[int] = None
    title: Optional[str] = None
    uri: str


class ResumeSessionRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The working directory for this session.
    cwd: Annotated[str, Field(description="The working directory for this session.")]
    # List of MCP servers to connect to for this session.
    mcp_servers: Annotated[
        Optional[List[Union[HttpMcpServer, SseMcpServer, McpServerStdio]]],
        Field(
            alias="mcpServers",
            description="List of MCP servers to connect to for this session.",
        ),
    ] = None
    # The ID of the session to resume.
    session_id: Annotated[str, Field(alias="sessionId", description="The ID of the session to resume.")]


class SessionCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Whether the agent supports `session/close`.
    close: Annotated[
        Optional[SessionCloseCapabilities],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWhether the agent supports `session/close`."
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Whether the agent supports `session/fork`.
    fork: Annotated[
        Optional[SessionForkCapabilities],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWhether the agent supports `session/fork`."
        ),
    ] = None
    # Whether the agent supports `session/list`.
    list: Annotated[
        Optional[SessionListCapabilities],
        Field(description="Whether the agent supports `session/list`."),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Whether the agent supports `session/resume`.
    resume: Annotated[
        Optional[SessionResumeCapabilities],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nWhether the agent supports `session/resume`."
        ),
    ] = None


class SessionConfigOptionBoolean(SessionConfigBoolean):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Optional semantic category for this option (UX only).
    category: Annotated[
        Optional[str],
        Field(description="Optional semantic category for this option (UX only)."),
    ] = None
    # Optional description for the Client to display to the user.
    description: Annotated[
        Optional[str],
        Field(description="Optional description for the Client to display to the user."),
    ] = None
    # Unique identifier for the configuration option.
    id: Annotated[str, Field(description="Unique identifier for the configuration option.")]
    # Human-readable label for the option.
    name: Annotated[str, Field(description="Human-readable label for the option.")]
    type: Literal["boolean"]


class SessionConfigSelectOption(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Optional description for this option value.
    description: Annotated[Optional[str], Field(description="Optional description for this option value.")] = None
    # Human-readable label for this option value.
    name: Annotated[str, Field(description="Human-readable label for this option value.")]
    # Unique identifier for this option value.
    value: Annotated[str, Field(description="Unique identifier for this option value.")]


class SessionMode(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    description: Optional[str] = None
    # Unique identifier for a Session Mode.
    id: Annotated[str, Field(description="Unique identifier for a Session Mode.")]
    name: str


class SessionModeState(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The set of modes that the Agent can operate in
    available_modes: Annotated[
        List[SessionMode],
        Field(
            alias="availableModes",
            description="The set of modes that the Agent can operate in",
        ),
    ]
    # The current mode the Agent is in.
    current_mode_id: Annotated[
        str,
        Field(alias="currentModeId", description="The current mode the Agent is in."),
    ]


class CurrentModeUpdate(_CurrentModeUpdate):
    session_update: Annotated[Literal["current_mode_update"], Field(alias="sessionUpdate")]


class UsageUpdate(_UsageUpdate):
    session_update: Annotated[Literal["usage_update"], Field(alias="sessionUpdate")]


class TextContent(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    annotations: Optional[Annotations] = None
    text: str


class AgentCapabilities(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Whether the agent supports `session/load`.
    load_session: Annotated[
        Optional[bool],
        Field(
            alias="loadSession",
            description="Whether the agent supports `session/load`.",
        ),
    ] = False
    # MCP capabilities supported by the agent.
    mcp_capabilities: Annotated[
        Optional[McpCapabilities],
        Field(
            alias="mcpCapabilities",
            description="MCP capabilities supported by the agent.",
        ),
    ] = McpCapabilities()
    # Prompt capabilities supported by the agent.
    prompt_capabilities: Annotated[
        Optional[PromptCapabilities],
        Field(
            alias="promptCapabilities",
            description="Prompt capabilities supported by the agent.",
        ),
    ] = PromptCapabilities()
    session_capabilities: Annotated[Optional[SessionCapabilities], Field(alias="sessionCapabilities")] = (
        SessionCapabilities()
    )


class AgentErrorMessage(BaseModel):
    error: Error
    # JSON RPC Request Id
    #
    # An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
    #
    # The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
    #
    # [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
    #
    # [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
    id: Annotated[
        Optional[Union[int, str]],
        Field(
            description="JSON RPC Request Id\n\nAn identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]\n\nThe Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.\n\n[1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.\n\n[2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions."
        ),
    ] = None


class AvailableCommand(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Human-readable description of what the command does.
    description: Annotated[str, Field(description="Human-readable description of what the command does.")]
    # Input for the command if required
    input: Annotated[
        Optional[AvailableCommandInput],
        Field(description="Input for the command if required"),
    ] = None
    # Command name (e.g., `create_plan`, `research_codebase`).
    name: Annotated[
        str,
        Field(description="Command name (e.g., `create_plan`, `research_codebase`)."),
    ]


class _AvailableCommandsUpdate(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Commands the agent can execute
    available_commands: Annotated[
        List[AvailableCommand],
        Field(alias="availableCommands", description="Commands the agent can execute"),
    ]


class ClientResponseMessage(BaseModel):
    # JSON RPC Request Id
    #
    # An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
    #
    # The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
    #
    # [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
    #
    # [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
    id: Annotated[
        Optional[Union[int, str]],
        Field(
            description="JSON RPC Request Id\n\nAn identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]\n\nThe Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.\n\n[1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.\n\n[2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions."
        ),
    ] = None
    # All possible responses that a client can send to an agent.
    #
    # This enum is used internally for routing RPC responses. You typically won't need
    # to use this directly - the responses are handled automatically by the connection.
    #
    # These are responses to the corresponding `AgentRequest` variants.
    result: Annotated[
        Union[
            WriteTextFileResponse,
            ReadTextFileResponse,
            RequestPermissionResponse,
            CreateTerminalResponse,
            TerminalOutputResponse,
            ReleaseTerminalResponse,
            WaitForTerminalExitResponse,
            KillTerminalResponse,
            Any,
        ],
        Field(
            description="All possible responses that a client can send to an agent.\n\nThis enum is used internally for routing RPC responses. You typically won't need\nto use this directly - the responses are handled automatically by the connection.\n\nThese are responses to the corresponding `AgentRequest` variants."
        ),
    ]


class ClientErrorMessage(BaseModel):
    error: Error
    # JSON RPC Request Id
    #
    # An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
    #
    # The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
    #
    # [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
    #
    # [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
    id: Annotated[
        Optional[Union[int, str]],
        Field(
            description="JSON RPC Request Id\n\nAn identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]\n\nThe Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.\n\n[1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.\n\n[2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions."
        ),
    ] = None


class ClientResponse(RootModel[Union[ClientResponseMessage, ClientErrorMessage]]):
    root: Union[ClientResponseMessage, ClientErrorMessage]


class TextContentBlock(TextContent):
    type: Literal["text"]


class ImageContentBlock(ImageContent):
    type: Literal["image"]


class ResourceContentBlock(ResourceLink):
    type: Literal["resource_link"]


class EmbeddedResource(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    annotations: Optional[Annotations] = None
    # Resource content that can be embedded in a message.
    resource: Annotated[
        Union[TextResourceContents, BlobResourceContents],
        Field(description="Resource content that can be embedded in a message."),
    ]


class ForkSessionRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The working directory for this session.
    cwd: Annotated[str, Field(description="The working directory for this session.")]
    # List of MCP servers to connect to for this session.
    mcp_servers: Annotated[
        Optional[List[Union[HttpMcpServer, SseMcpServer, McpServerStdio]]],
        Field(
            alias="mcpServers",
            description="List of MCP servers to connect to for this session.",
        ),
    ] = None
    # The ID of the session to fork.
    session_id: Annotated[str, Field(alias="sessionId", description="The ID of the session to fork.")]


class InitializeResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Capabilities supported by the agent.
    agent_capabilities: Annotated[
        Optional[AgentCapabilities],
        Field(
            alias="agentCapabilities",
            description="Capabilities supported by the agent.",
        ),
    ] = AgentCapabilities()
    # Information about the Agent name and version sent to the Client.
    #
    # Note: in future versions of the protocol, this will be required.
    agent_info: Annotated[
        Optional[Implementation],
        Field(
            alias="agentInfo",
            description="Information about the Agent name and version sent to the Client.\n\nNote: in future versions of the protocol, this will be required.",
        ),
    ] = None
    # Authentication methods supported by the agent.
    auth_methods: Annotated[
        Optional[List[Union[EnvVarAuthMethod, TerminalAuthMethod, AuthMethodAgent]]],
        Field(
            alias="authMethods",
            description="Authentication methods supported by the agent.",
        ),
    ] = []
    # The protocol version the client specified if supported by the agent,
    # or the latest protocol version supported by the agent.
    #
    # The client should disconnect, if it doesn't support this version.
    protocol_version: Annotated[
        int,
        Field(
            alias="protocolVersion",
            description="The protocol version the client specified if supported by the agent,\nor the latest protocol version supported by the agent.\n\nThe client should disconnect, if it doesn't support this version.",
            ge=0,
            le=65535,
        ),
    ]


class LoadSessionRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The working directory for this session.
    cwd: Annotated[str, Field(description="The working directory for this session.")]
    # List of MCP servers to connect to for this session.
    mcp_servers: Annotated[
        List[Union[HttpMcpServer, SseMcpServer, McpServerStdio]],
        Field(
            alias="mcpServers",
            description="List of MCP servers to connect to for this session.",
        ),
    ]
    # The ID of the session to load.
    session_id: Annotated[str, Field(alias="sessionId", description="The ID of the session to load.")]


class Plan(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The list of tasks to be accomplished.
    #
    # When updating a plan, the agent must send a complete list of all entries
    # with their current status. The client replaces the entire plan with each update.
    entries: Annotated[
        List[PlanEntry],
        Field(
            description="The list of tasks to be accomplished.\n\nWhen updating a plan, the agent must send a complete list of all entries\nwith their current status. The client replaces the entire plan with each update."
        ),
    ]


class SessionConfigSelectGroup(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Unique identifier for this group.
    group: Annotated[str, Field(description="Unique identifier for this group.")]
    # Human-readable label for this group.
    name: Annotated[str, Field(description="Human-readable label for this group.")]
    # The set of option values in this group.
    options: Annotated[
        List[SessionConfigSelectOption],
        Field(description="The set of option values in this group."),
    ]


class AgentPlanUpdate(Plan):
    session_update: Annotated[Literal["plan"], Field(alias="sessionUpdate")]


class AvailableCommandsUpdate(_AvailableCommandsUpdate):
    session_update: Annotated[Literal["available_commands_update"], Field(alias="sessionUpdate")]


class EmbeddedResourceContentBlock(EmbeddedResource):
    type: Literal["resource"]


class ContentChunk(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # A single item of content
    content: Annotated[
        Union[
            TextContentBlock, ImageContentBlock, AudioContentBlock, ResourceContentBlock, EmbeddedResourceContentBlock
        ],
        Field(description="A single item of content", discriminator="type"),
    ]
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # A unique identifier for the message this chunk belongs to.
    #
    # All chunks belonging to the same message share the same `messageId`.
    # A change in `messageId` indicates a new message has started.
    # Both clients and agents MUST use UUID format for message IDs.
    message_id: Annotated[
        Optional[str],
        Field(
            alias="messageId",
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nA unique identifier for the message this chunk belongs to.\n\nAll chunks belonging to the same message share the same `messageId`.\nA change in `messageId` indicates a new message has started.\nBoth clients and agents MUST use UUID format for message IDs.",
        ),
    ] = None


class PromptRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # A client-generated unique identifier for this user message.
    #
    # If provided, the Agent SHOULD echo this value as `userMessageId` in the
    # [`PromptResponse`] to confirm it was recorded.
    # Both clients and agents MUST use UUID format for message IDs.
    message_id: Annotated[
        Optional[str],
        Field(
            alias="messageId",
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nA client-generated unique identifier for this user message.\n\nIf provided, the Agent SHOULD echo this value as `userMessageId` in the\n[`PromptResponse`] to confirm it was recorded.\nBoth clients and agents MUST use UUID format for message IDs.",
        ),
    ] = None
    # The blocks of content that compose the user's message.
    #
    # As a baseline, the Agent MUST support [`ContentBlock::Text`] and [`ContentBlock::ResourceLink`],
    # while other variants are optionally enabled via [`PromptCapabilities`].
    #
    # The Client MUST adapt its interface according to [`PromptCapabilities`].
    #
    # The client MAY include referenced pieces of context as either
    # [`ContentBlock::Resource`] or [`ContentBlock::ResourceLink`].
    #
    # When available, [`ContentBlock::Resource`] is preferred
    # as it avoids extra round-trips and allows the message to include
    # pieces of context from sources the agent may not have access to.
    prompt: Annotated[
        List[
            Union[
                TextContentBlock,
                ImageContentBlock,
                AudioContentBlock,
                ResourceContentBlock,
                EmbeddedResourceContentBlock,
            ]
        ],
        Field(
            description="The blocks of content that compose the user's message.\n\nAs a baseline, the Agent MUST support [`ContentBlock::Text`] and [`ContentBlock::ResourceLink`],\nwhile other variants are optionally enabled via [`PromptCapabilities`].\n\nThe Client MUST adapt its interface according to [`PromptCapabilities`].\n\nThe client MAY include referenced pieces of context as either\n[`ContentBlock::Resource`] or [`ContentBlock::ResourceLink`].\n\nWhen available, [`ContentBlock::Resource`] is preferred\nas it avoids extra round-trips and allows the message to include\npieces of context from sources the agent may not have access to."
        ),
    ]
    # The ID of the session to send this user message to
    session_id: Annotated[
        str,
        Field(
            alias="sessionId",
            description="The ID of the session to send this user message to",
        ),
    ]


class SessionConfigSelect(BaseModel):
    # The currently selected value.
    current_value: Annotated[str, Field(alias="currentValue", description="The currently selected value.")]
    # The set of selectable options.
    options: Annotated[
        Union[List[SessionConfigSelectOption], List[SessionConfigSelectGroup]],
        Field(description="The set of selectable options."),
    ]


class UserMessageChunk(ContentChunk):
    session_update: Annotated[Literal["user_message_chunk"], Field(alias="sessionUpdate")]


class AgentMessageChunk(ContentChunk):
    session_update: Annotated[Literal["agent_message_chunk"], Field(alias="sessionUpdate")]


class AgentThoughtChunk(ContentChunk):
    session_update: Annotated[Literal["agent_thought_chunk"], Field(alias="sessionUpdate")]


class ClientRequest(BaseModel):
    # JSON RPC Request Id
    #
    # An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
    #
    # The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
    #
    # [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
    #
    # [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
    id: Annotated[
        Optional[Union[int, str]],
        Field(
            description="JSON RPC Request Id\n\nAn identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]\n\nThe Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.\n\n[1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.\n\n[2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions."
        ),
    ] = None
    method: str
    params: Optional[
        Union[
            InitializeRequest,
            AuthenticateRequest,
            NewSessionRequest,
            LoadSessionRequest,
            ListSessionsRequest,
            ForkSessionRequest,
            ResumeSessionRequest,
            CloseSessionRequest,
            SetSessionModeRequest,
            PromptRequest,
            SetSessionModelRequest,
            Union[SetSessionConfigOptionBooleanRequest, SetSessionConfigOptionSelectRequest],
            Any,
        ]
    ] = None


class Content(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The actual content block.
    content: Annotated[
        Union[
            TextContentBlock, ImageContentBlock, AudioContentBlock, ResourceContentBlock, EmbeddedResourceContentBlock
        ],
        Field(description="The actual content block.", discriminator="type"),
    ]


class SessionConfigOptionSelect(SessionConfigSelect):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Optional semantic category for this option (UX only).
    category: Annotated[
        Optional[str],
        Field(description="Optional semantic category for this option (UX only)."),
    ] = None
    # Optional description for the Client to display to the user.
    description: Annotated[
        Optional[str],
        Field(description="Optional description for the Client to display to the user."),
    ] = None
    # Unique identifier for the configuration option.
    id: Annotated[str, Field(description="Unique identifier for the configuration option.")]
    # Human-readable label for the option.
    name: Annotated[str, Field(description="Human-readable label for the option.")]
    type: Literal["select"]


class SetSessionConfigOptionResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The full set of configuration options and their current values.
    config_options: Annotated[
        List[Union[SessionConfigOptionSelect, SessionConfigOptionBoolean]],
        Field(
            alias="configOptions",
            description="The full set of configuration options and their current values.",
        ),
    ]


class ContentToolCallContent(Content):
    type: Literal["content"]


class ToolCallUpdate(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Replace the content collection.
    content: Annotated[
        Optional[List[Union[ContentToolCallContent, FileEditToolCallContent, TerminalToolCallContent]]],
        Field(description="Replace the content collection."),
    ] = None
    # Update the tool kind.
    kind: Annotated[Optional[ToolKind], Field(description="Update the tool kind.")] = None
    # Replace the locations collection.
    locations: Annotated[
        Optional[List[ToolCallLocation]],
        Field(description="Replace the locations collection."),
    ] = None
    # Update the raw input.
    raw_input: Annotated[Optional[Any], Field(alias="rawInput", description="Update the raw input.")] = None
    # Update the raw output.
    raw_output: Annotated[Optional[Any], Field(alias="rawOutput", description="Update the raw output.")] = None
    # Update the execution status.
    status: Annotated[Optional[ToolCallStatus], Field(description="Update the execution status.")] = None
    # Update the human-readable title.
    title: Annotated[Optional[str], Field(description="Update the human-readable title.")] = None
    # The ID of the tool call being updated.
    tool_call_id: Annotated[
        str,
        Field(alias="toolCallId", description="The ID of the tool call being updated."),
    ]


class _ConfigOptionUpdate(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The full set of configuration options and their current values.
    config_options: Annotated[
        List[Union[SessionConfigOptionSelect, SessionConfigOptionBoolean]],
        Field(
            alias="configOptions",
            description="The full set of configuration options and their current values.",
        ),
    ]


class ForkSessionResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Initial session configuration options if supported by the Agent.
    config_options: Annotated[
        Optional[List[Union[SessionConfigOptionSelect, SessionConfigOptionBoolean]]],
        Field(
            alias="configOptions",
            description="Initial session configuration options if supported by the Agent.",
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Initial model state if supported by the Agent
    models: Annotated[
        Optional[SessionModelState],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        ),
    ] = None
    # Initial mode state if supported by the Agent
    #
    # See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
    modes: Annotated[
        Optional[SessionModeState],
        Field(
            description="Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        ),
    ] = None
    # Unique identifier for the newly created forked session.
    session_id: Annotated[
        str,
        Field(
            alias="sessionId",
            description="Unique identifier for the newly created forked session.",
        ),
    ]


class LoadSessionResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Initial session configuration options if supported by the Agent.
    config_options: Annotated[
        Optional[List[Union[SessionConfigOptionSelect, SessionConfigOptionBoolean]]],
        Field(
            alias="configOptions",
            description="Initial session configuration options if supported by the Agent.",
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Initial model state if supported by the Agent
    models: Annotated[
        Optional[SessionModelState],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        ),
    ] = None
    # Initial mode state if supported by the Agent
    #
    # See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
    modes: Annotated[
        Optional[SessionModeState],
        Field(
            description="Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        ),
    ] = None


class NewSessionResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Initial session configuration options if supported by the Agent.
    config_options: Annotated[
        Optional[List[Union[SessionConfigOptionSelect, SessionConfigOptionBoolean]]],
        Field(
            alias="configOptions",
            description="Initial session configuration options if supported by the Agent.",
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Initial model state if supported by the Agent
    models: Annotated[
        Optional[SessionModelState],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        ),
    ] = None
    # Initial mode state if supported by the Agent
    #
    # See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
    modes: Annotated[
        Optional[SessionModeState],
        Field(
            description="Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        ),
    ] = None
    # Unique identifier for the created session.
    #
    # Used in all subsequent requests for this conversation.
    session_id: Annotated[
        str,
        Field(
            alias="sessionId",
            description="Unique identifier for the created session.\n\nUsed in all subsequent requests for this conversation.",
        ),
    ]


class RequestPermissionRequest(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Available permission options for the user to choose from.
    options: Annotated[
        List[PermissionOption],
        Field(description="Available permission options for the user to choose from."),
    ]
    # The session ID for this request.
    session_id: Annotated[str, Field(alias="sessionId", description="The session ID for this request.")]
    # Details about the tool call requiring permission.
    tool_call: Annotated[
        ToolCallUpdate,
        Field(
            alias="toolCall",
            description="Details about the tool call requiring permission.",
        ),
    ]


class ResumeSessionResponse(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Initial session configuration options if supported by the Agent.
    config_options: Annotated[
        Optional[List[Union[SessionConfigOptionSelect, SessionConfigOptionBoolean]]],
        Field(
            alias="configOptions",
            description="Initial session configuration options if supported by the Agent.",
        ),
    ] = None
    # **UNSTABLE**
    #
    # This capability is not part of the spec yet, and may be removed or changed at any point.
    #
    # Initial model state if supported by the Agent
    models: Annotated[
        Optional[SessionModelState],
        Field(
            description="**UNSTABLE**\n\nThis capability is not part of the spec yet, and may be removed or changed at any point.\n\nInitial model state if supported by the Agent"
        ),
    ] = None
    # Initial mode state if supported by the Agent
    #
    # See protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)
    modes: Annotated[
        Optional[SessionModeState],
        Field(
            description="Initial mode state if supported by the Agent\n\nSee protocol docs: [Session Modes](https://agentclientprotocol.com/protocol/session-modes)"
        ),
    ] = None


class ToolCallProgress(ToolCallUpdate):
    session_update: Annotated[Literal["tool_call_update"], Field(alias="sessionUpdate")]


class ConfigOptionUpdate(_ConfigOptionUpdate):
    session_update: Annotated[Literal["config_option_update"], Field(alias="sessionUpdate")]


class ToolCall(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # Content produced by the tool call.
    content: Annotated[
        Optional[List[Union[ContentToolCallContent, FileEditToolCallContent, TerminalToolCallContent]]],
        Field(description="Content produced by the tool call."),
    ] = None
    # The category of tool being invoked.
    # Helps clients choose appropriate icons and UI treatment.
    kind: Annotated[
        Optional[ToolKind],
        Field(
            description="The category of tool being invoked.\nHelps clients choose appropriate icons and UI treatment."
        ),
    ] = None
    # File locations affected by this tool call.
    # Enables "follow-along" features in clients.
    locations: Annotated[
        Optional[List[ToolCallLocation]],
        Field(description='File locations affected by this tool call.\nEnables "follow-along" features in clients.'),
    ] = None
    # Raw input parameters sent to the tool.
    raw_input: Annotated[
        Optional[Any],
        Field(alias="rawInput", description="Raw input parameters sent to the tool."),
    ] = None
    # Raw output returned by the tool.
    raw_output: Annotated[
        Optional[Any],
        Field(alias="rawOutput", description="Raw output returned by the tool."),
    ] = None
    # Current execution status of the tool call.
    status: Annotated[Optional[ToolCallStatus], Field(description="Current execution status of the tool call.")] = None
    # Human-readable title describing what the tool is doing.
    title: Annotated[
        str,
        Field(description="Human-readable title describing what the tool is doing."),
    ]
    # Unique identifier for this tool call within the session.
    tool_call_id: Annotated[
        str,
        Field(
            alias="toolCallId",
            description="Unique identifier for this tool call within the session.",
        ),
    ]


class AgentRequest(BaseModel):
    # JSON RPC Request Id
    #
    # An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
    #
    # The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
    #
    # [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
    #
    # [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
    id: Annotated[
        Optional[Union[int, str]],
        Field(
            description="JSON RPC Request Id\n\nAn identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]\n\nThe Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.\n\n[1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.\n\n[2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions."
        ),
    ] = None
    method: str
    params: Optional[
        Union[
            WriteTextFileRequest,
            ReadTextFileRequest,
            RequestPermissionRequest,
            CreateTerminalRequest,
            TerminalOutputRequest,
            ReleaseTerminalRequest,
            WaitForTerminalExitRequest,
            KillTerminalRequest,
            Any,
        ]
    ] = None


class AgentResponseMessage(BaseModel):
    # JSON RPC Request Id
    #
    # An identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]
    #
    # The Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.
    #
    # [1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.
    #
    # [2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions.
    id: Annotated[
        Optional[Union[int, str]],
        Field(
            description="JSON RPC Request Id\n\nAn identifier established by the Client that MUST contain a String, Number, or NULL value if included. If it is not included it is assumed to be a notification. The value SHOULD normally not be Null [1] and Numbers SHOULD NOT contain fractional parts [2]\n\nThe Server MUST reply with the same value in the Response object if included. This member is used to correlate the context between the two objects.\n\n[1] The use of Null as a value for the id member in a Request object is discouraged, because this specification uses a value of Null for Responses with an unknown id. Also, because JSON-RPC 1.0 uses an id value of Null for Notifications this could cause confusion in handling.\n\n[2] Fractional parts may be problematic, since many decimal fractions cannot be represented exactly as binary fractions."
        ),
    ] = None
    # All possible responses that an agent can send to a client.
    #
    # This enum is used internally for routing RPC responses. You typically won't need
    # to use this directly - the responses are handled automatically by the connection.
    #
    # These are responses to the corresponding `ClientRequest` variants.
    result: Annotated[
        Union[
            InitializeResponse,
            AuthenticateResponse,
            NewSessionResponse,
            LoadSessionResponse,
            ListSessionsResponse,
            ForkSessionResponse,
            ResumeSessionResponse,
            CloseSessionResponse,
            SetSessionModeResponse,
            SetSessionConfigOptionResponse,
            PromptResponse,
            SetSessionModelResponse,
            Any,
        ],
        Field(
            description="All possible responses that an agent can send to a client.\n\nThis enum is used internally for routing RPC responses. You typically won't need\nto use this directly - the responses are handled automatically by the connection.\n\nThese are responses to the corresponding `ClientRequest` variants."
        ),
    ]


class AgentResponse(RootModel[Union[AgentResponseMessage, AgentErrorMessage]]):
    root: Union[AgentResponseMessage, AgentErrorMessage]


class ToolCallStart(ToolCall):
    session_update: Annotated[Literal["tool_call"], Field(alias="sessionUpdate")]


class SessionNotification(BaseModel):
    # The _meta property is reserved by ACP to allow clients and agents to attach additional
    # metadata to their interactions. Implementations MUST NOT make assumptions about values at
    # these keys.
    #
    # See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)
    field_meta: Annotated[
        Optional[Dict[str, Any]],
        Field(
            alias="_meta",
            description="The _meta property is reserved by ACP to allow clients and agents to attach additional\nmetadata to their interactions. Implementations MUST NOT make assumptions about values at\nthese keys.\n\nSee protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/extensibility)",
        ),
    ] = None
    # The ID of the session this update pertains to.
    session_id: Annotated[
        str,
        Field(
            alias="sessionId",
            description="The ID of the session this update pertains to.",
        ),
    ]
    # The actual update content.
    update: Annotated[
        Union[
            UserMessageChunk,
            AgentMessageChunk,
            AgentThoughtChunk,
            ToolCallStart,
            ToolCallProgress,
            AgentPlanUpdate,
            AvailableCommandsUpdate,
            CurrentModeUpdate,
            ConfigOptionUpdate,
            SessionInfoUpdate,
            UsageUpdate,
        ],
        Field(description="The actual update content.", discriminator="session_update"),
    ]


class AgentNotification(BaseModel):
    method: str
    params: Optional[Union[SessionNotification, Any]] = None
````

## File: src/acp/stdio.py
````python
from __future__ import annotations

import asyncio
import asyncio.subprocess as aio_subprocess
import contextlib
import logging
import platform
import sys
from asyncio import transports as aio_transports
from collections.abc import AsyncIterator, Callable, Mapping
from contextlib import asynccontextmanager
from pathlib import Path
from typing import Any, cast

from .agent.connection import AgentSideConnection
from .client.connection import ClientSideConnection
from .connection import Connection, MethodHandler, StreamObserver
from .interfaces import Agent, Client
from .transports import spawn_stdio_transport

__all__ = [
    "spawn_agent_process",
    "spawn_client_process",
    "spawn_stdio_connection",
    "stdio_streams",
]


class _WritePipeProtocol(asyncio.BaseProtocol):
    def __init__(self) -> None:
        self._loop = asyncio.get_running_loop()
        self._paused = False
        self._drain_waiter: asyncio.Future[None] | None = None

    def pause_writing(self) -> None:  # type: ignore[override]
        self._paused = True
        if self._drain_waiter is None:
            self._drain_waiter = self._loop.create_future()

    def resume_writing(self) -> None:  # type: ignore[override]
        self._paused = False
        if self._drain_waiter is not None and not self._drain_waiter.done():
            self._drain_waiter.set_result(None)
        self._drain_waiter = None

    async def _drain_helper(self) -> None:
        if self._paused and self._drain_waiter is not None:
            await self._drain_waiter


def _start_stdin_feeder(loop: asyncio.AbstractEventLoop, reader: asyncio.StreamReader) -> None:
    # Feed stdin from a background thread line-by-line
    def blocking_read() -> None:
        try:
            while True:
                data = sys.stdin.buffer.readline()
                if not data:
                    break
                loop.call_soon_threadsafe(reader.feed_data, data)
        finally:
            loop.call_soon_threadsafe(reader.feed_eof)

    import threading

    threading.Thread(target=blocking_read, daemon=True).start()


class _StdoutTransport(asyncio.BaseTransport):
    def __init__(self) -> None:
        self._is_closing = False

    def write(self, data: bytes) -> None:  # type: ignore[override]
        if self._is_closing:
            return
        try:
            sys.stdout.buffer.write(data)
            sys.stdout.buffer.flush()
        except Exception:
            logging.exception("Error writing to stdout")

    def can_write_eof(self) -> bool:  # type: ignore[override]
        return False

    def is_closing(self) -> bool:  # type: ignore[override]
        return self._is_closing

    def close(self) -> None:  # type: ignore[override]
        self._is_closing = True
        with contextlib.suppress(Exception):
            sys.stdout.flush()

    def abort(self) -> None:  # type: ignore[override]
        self.close()

    def get_extra_info(self, name: str, default=None):  # type: ignore[override]
        return default


async def _windows_stdio_streams(
    loop: asyncio.AbstractEventLoop,
    limit: int | None = None,
) -> tuple[asyncio.StreamReader, asyncio.StreamWriter]:
    reader = asyncio.StreamReader(limit=limit) if limit is not None else asyncio.StreamReader()
    _ = asyncio.StreamReaderProtocol(reader)

    _start_stdin_feeder(loop, reader)

    write_protocol = _WritePipeProtocol()
    transport = _StdoutTransport()
    writer = asyncio.StreamWriter(cast(aio_transports.WriteTransport, transport), write_protocol, None, loop)
    return reader, writer


async def _posix_stdio_streams(
    loop: asyncio.AbstractEventLoop,
    limit: int | None = None,
) -> tuple[asyncio.StreamReader, asyncio.StreamWriter]:
    # Reader from stdin
    reader = asyncio.StreamReader(limit=limit) if limit is not None else asyncio.StreamReader()
    reader_protocol = asyncio.StreamReaderProtocol(reader)
    await loop.connect_read_pipe(lambda: reader_protocol, sys.stdin)

    # Writer to stdout with protocol providing _drain_helper
    write_protocol = _WritePipeProtocol()
    transport, _ = await loop.connect_write_pipe(lambda: write_protocol, sys.stdout)
    writer = asyncio.StreamWriter(transport, write_protocol, None, loop)
    return reader, writer


async def stdio_streams(limit: int | None = None) -> tuple[asyncio.StreamReader, asyncio.StreamWriter]:
    """Create stdio asyncio streams; on Windows use a thread feeder + custom stdout transport.

    Args:
        limit: Optional buffer limit for the stdin reader.
    """
    loop = asyncio.get_running_loop()
    if platform.system() == "Windows":
        return await _windows_stdio_streams(loop, limit=limit)
    return await _posix_stdio_streams(loop, limit=limit)


@asynccontextmanager
async def spawn_stdio_connection(
    handler: MethodHandler,
    command: str,
    *args: str,
    env: Mapping[str, str] | None = None,
    cwd: str | Path | None = None,
    observers: list[StreamObserver] | None = None,
    **transport_kwargs: Any,
) -> AsyncIterator[tuple[Connection, aio_subprocess.Process]]:
    """Spawn a subprocess and bind its stdio to a low-level Connection."""
    async with spawn_stdio_transport(command, *args, env=env, cwd=cwd, **transport_kwargs) as (reader, writer, process):
        conn = Connection(handler, writer, reader, observers=observers)
        try:
            yield conn, process
        finally:
            await conn.close()


@asynccontextmanager
async def spawn_agent_process(
    to_client: Callable[[Agent], Client] | Client,
    command: str,
    *args: str,
    env: Mapping[str, str] | None = None,
    cwd: str | Path | None = None,
    transport_kwargs: Mapping[str, Any] | None = None,
    **connection_kwargs: Any,
) -> AsyncIterator[tuple[ClientSideConnection, aio_subprocess.Process]]:
    """Spawn an ACP agent subprocess and return a ClientSideConnection to it."""
    async with spawn_stdio_transport(
        command,
        *args,
        env=env,
        cwd=cwd,
        **(dict(transport_kwargs) if transport_kwargs else {}),
    ) as (reader, writer, process):
        conn = ClientSideConnection(to_client, writer, reader, **connection_kwargs)
        try:
            yield conn, process
        finally:
            await conn.close()


@asynccontextmanager
async def spawn_client_process(
    to_agent: Callable[[Client], Agent] | Agent,
    command: str,
    *args: str,
    env: Mapping[str, str] | None = None,
    cwd: str | Path | None = None,
    transport_kwargs: Mapping[str, Any] | None = None,
    **connection_kwargs: Any,
) -> AsyncIterator[tuple[AgentSideConnection, aio_subprocess.Process]]:
    """Spawn an ACP client subprocess and return an AgentSideConnection to it."""
    async with spawn_stdio_transport(
        command,
        *args,
        env=env,
        cwd=cwd,
        **(dict(transport_kwargs) if transport_kwargs else {}),
    ) as (reader, writer, process):
        conn = AgentSideConnection(to_agent, writer, reader, **connection_kwargs)
        try:
            yield conn, process
        finally:
            await conn.close()
````

## File: src/acp/telemetry.py
````python
from __future__ import annotations

import os
from collections.abc import Mapping
from contextlib import AbstractContextManager, ExitStack, nullcontext
from typing import Any, cast

try:
    from logfire import span as logfire_span  # type: ignore[unresolved-import]
except ModuleNotFoundError:  # pragma: no cover - logfire is optional
    logfire_span = None  # type: ignore[assignment]
else:  # pragma: no cover - optional
    os.environ.setdefault("LOGFIRE_IGNORE_NO_CONFIG", "1")

try:  # pragma: no cover - opentelemetry is optional
    from opentelemetry.trace import get_tracer as otel_get_tracer  # type: ignore[unresolved-import]
except ModuleNotFoundError:  # pragma: no cover - opentelemetry is optional
    otel_get_tracer = None  # type: ignore[assignment]

DEFAULT_TAGS = ["acp"]
TRACER = otel_get_tracer(__name__) if otel_get_tracer else None


def _start_tracer_span(name: str, *, attributes: Mapping[str, Any] | None = None) -> AbstractContextManager[Any]:
    if TRACER is None:
        return nullcontext()
    attrs = dict(attributes or {})
    return TRACER.start_as_current_span(name, attributes=attrs)


def span_context(name: str, *, attributes: Mapping[str, Any] | None = None) -> AbstractContextManager[None]:
    if logfire_span is None and TRACER is None:
        return nullcontext()
    stack = ExitStack()
    attrs: dict[str, Any] = {"logfire.tags": DEFAULT_TAGS}
    if attributes:
        attrs.update(attributes)
    if logfire_span is not None:
        stack.enter_context(logfire_span(name, attributes=attrs))
    stack.enter_context(_start_tracer_span(name, attributes=attributes))
    return cast(AbstractContextManager[None], stack)
````

## File: src/acp/transports.py
````python
from __future__ import annotations

import asyncio
import asyncio.subprocess as aio_subprocess
import contextlib
import os
from collections.abc import AsyncIterator, Mapping
from contextlib import asynccontextmanager
from pathlib import Path

__all__ = ["DEFAULT_INHERITED_ENV_VARS", "default_environment", "spawn_stdio_transport"]

DEFAULT_INHERITED_ENV_VARS = (
    [
        "APPDATA",
        "HOMEDRIVE",
        "HOMEPATH",
        "LOCALAPPDATA",
        "PATH",
        "PATHEXT",
        "PROCESSOR_ARCHITECTURE",
        "SYSTEMDRIVE",
        "SYSTEMROOT",
        "TEMP",
        "USERNAME",
        "USERPROFILE",
    ]
    if os.name == "nt"
    else ["HOME", "LOGNAME", "PATH", "SHELL", "TERM", "USER"]
)


def default_environment() -> dict[str, str]:
    """Return a trimmed environment based on MCP best practices."""
    env: dict[str, str] = {}
    for key in DEFAULT_INHERITED_ENV_VARS:
        value = os.environ.get(key)
        if value is None:
            continue
        # Skip function-style env vars on some shells (see MCP reference)
        if value.startswith("()"):
            continue
        env[key] = value
    return env


@asynccontextmanager
async def spawn_stdio_transport(
    command: str,
    *args: str,
    env: Mapping[str, str] | None = None,
    cwd: str | Path | None = None,
    stderr: int | None = aio_subprocess.PIPE,
    limit: int | None = None,
    shutdown_timeout: float = 2.0,
) -> AsyncIterator[tuple[asyncio.StreamReader, asyncio.StreamWriter, aio_subprocess.Process]]:
    """Launch a subprocess and expose its stdio streams as asyncio transports.

    This mirrors the defensive shutdown behaviour used by the MCP Python SDK:
    close stdin first, wait for graceful exit, then escalate to terminate/kill.
    """
    merged_env = dict(default_environment())
    if env:
        merged_env.update(env)

    if limit is None:
        process = await asyncio.create_subprocess_exec(
            command,
            *args,
            stdin=aio_subprocess.PIPE,
            stdout=aio_subprocess.PIPE,
            stderr=stderr,
            env=merged_env,
            cwd=str(cwd) if cwd is not None else None,
        )
    else:
        process = await asyncio.create_subprocess_exec(
            command,
            *args,
            stdin=aio_subprocess.PIPE,
            stdout=aio_subprocess.PIPE,
            stderr=stderr,
            env=merged_env,
            cwd=str(cwd) if cwd is not None else None,
            limit=limit,
        )

    if process.stdout is None or process.stdin is None:
        process.kill()
        await process.wait()
        msg = "spawn_stdio_transport requires stdout/stderr pipes"
        raise RuntimeError(msg)

    try:
        yield process.stdout, process.stdin, process
    finally:
        # Attempt graceful stdin shutdown first
        if process.stdin is not None:
            try:
                process.stdin.write_eof()
            except (AttributeError, OSError, RuntimeError):
                process.stdin.close()
            with contextlib.suppress(Exception):
                await process.stdin.drain()
            with contextlib.suppress(Exception):
                process.stdin.close()
            with contextlib.suppress(Exception):
                await process.stdin.wait_closed()

        try:
            await asyncio.wait_for(process.wait(), timeout=shutdown_timeout)
        except asyncio.TimeoutError:
            process.terminate()
            try:
                await asyncio.wait_for(process.wait(), timeout=shutdown_timeout)
            except asyncio.TimeoutError:
                process.kill()
                await process.wait()
````

## File: src/acp/utils.py
````python
from __future__ import annotations

import functools
import warnings
from collections.abc import Callable
from typing import Any, TypeVar

from pydantic import BaseModel

from .connection import Connection

__all__ = [
    "ensure_dict",
    "normalize_result",
    "notify_model",
    "request_model",
    "request_model_from_dict",
    "request_optional_model",
    "serialize_params",
    "validate_model",
    "validate_model_from_dict",
    "validate_optional_model",
]

ModelT = TypeVar("ModelT", bound=BaseModel)
MethodT = TypeVar("MethodT", bound=Callable)
ClassT = TypeVar("ClassT", bound=type)
T = TypeVar("T")
MultiParamModelSpec = tuple[type[BaseModel], ...]


def _param_models_name(models: MultiParamModelSpec) -> str:
    return " | ".join(model_type.__name__ for model_type in models)


def _param_models_field_names(models: MultiParamModelSpec) -> tuple[str, ...]:
    shared_fields = set(models[0].model_fields)
    for model_type in models[1:]:
        shared_fields &= set(model_type.model_fields)
    return tuple(field_name for field_name in models[0].model_fields if field_name in shared_fields)


def model_to_kwargs(model_obj: BaseModel, models: MultiParamModelSpec) -> dict[str, Any]:
    kwargs = {
        field_name: getattr(model_obj, field_name)
        for field_name in _param_models_field_names(models)
        if field_name != "field_meta"
    }
    if meta := getattr(model_obj, "field_meta", None):
        kwargs.update(meta)
    return kwargs


def serialize_params(params: BaseModel) -> dict[str, Any]:
    """Return a JSON-serializable representation used for RPC calls."""
    return params.model_dump(by_alias=True, exclude_none=True, exclude_defaults=True)


def normalize_result(payload: Any) -> dict[str, Any]:
    """Convert optional BaseModel/None responses into JSON-friendly payloads."""
    if payload is None:
        return {}
    if isinstance(payload, BaseModel):
        return serialize_params(payload)
    return payload


def ensure_dict(payload: Any) -> dict[str, Any]:
    """Return payload when it is a dict, otherwise an empty dict."""
    return payload if isinstance(payload, dict) else {}


def validate_model(payload: Any, model_type: type[ModelT]) -> ModelT:
    """Validate payload using the provided Pydantic model."""
    return model_type.model_validate(payload)


def validate_model_from_dict(payload: Any, model_type: type[ModelT]) -> ModelT:
    """Validate payload, coercing non-dict values to an empty dict first."""
    return model_type.model_validate(ensure_dict(payload))


def validate_optional_model(payload: Any, model_type: type[ModelT]) -> ModelT | None:
    """Validate payload when it is a dict, otherwise return None."""
    if isinstance(payload, dict):
        return model_type.model_validate(payload)
    return None


async def request_model(
    conn: Connection,
    method: str,
    params: BaseModel,
    response_model: type[ModelT],
) -> ModelT:
    """Send a request with serialized params and validate the response."""
    response = await conn.send_request(method, serialize_params(params))
    return validate_model(response, response_model)


async def request_model_from_dict(
    conn: Connection,
    method: str,
    params: BaseModel,
    response_model: type[ModelT],
) -> ModelT:
    """Send a request and validate the response, coercing non-dict payloads."""
    response = await conn.send_request(method, serialize_params(params))
    return validate_model_from_dict(response, response_model)


async def request_optional_model(
    conn: Connection,
    method: str,
    params: BaseModel,
    response_model: type[ModelT],
) -> ModelT | None:
    """Send a request and validate optional dict responses."""
    response = await conn.send_request(method, serialize_params(params))
    return validate_optional_model(response, response_model)


async def notify_model(conn: Connection, method: str, params: BaseModel) -> None:
    """Send a notification with serialized params."""
    await conn.send_notification(method, serialize_params(params))


def param_model(param_cls: type[BaseModel]) -> Callable[[MethodT], MethodT]:
    """Decorator to map the method parameters to a Pydantic model.
    It is just a marker and does nothing at runtime.
    """

    def decorator(func: MethodT) -> MethodT:
        func.__param_model__ = param_cls  # type: ignore[attr-defined]
        return func

    return decorator


def param_models(*param_cls: type[BaseModel]) -> Callable[[MethodT], MethodT]:
    """Decorator to mark a method as accepting multiple legacy parameter models."""
    if not param_cls:
        raise ValueError("param_models() requires at least one model class")

    def decorator(func: MethodT) -> MethodT:
        func.__param_models__ = param_cls  # type: ignore[attr-defined]
        return func

    return decorator


def to_camel_case(snake_str: str) -> str:
    """Convert snake_case strings to camelCase."""
    components = snake_str.split("_")
    return components[0] + "".join(x.title() for x in components[1:])


def _make_legacy_func(func: Callable[..., T], model: type[BaseModel]) -> Callable[[Any, BaseModel], T]:
    @functools.wraps(func)
    def wrapped(self, params: BaseModel) -> T:
        warnings.warn(
            f"Calling {func.__name__} with {model.__name__} parameter is "  # type: ignore[attr-defined]
            "deprecated, please update to the new API style.",
            DeprecationWarning,
            stacklevel=3,
        )
        kwargs = {
            field_name: getattr(params, field_name) for field_name in model.model_fields if field_name != "field_meta"
        }
        if meta := getattr(params, "field_meta", None):
            kwargs.update(meta)
        return func(self, **kwargs)  # type: ignore[arg-type]

    return wrapped


def _make_compatible_func(func: Callable[..., T], model: type[BaseModel]) -> Callable[..., T]:
    @functools.wraps(func)
    def wrapped(self, *args: Any, **kwargs: Any) -> T:
        param = None
        if not kwargs and len(args) == 1:
            param = args[0]
        elif not args and len(kwargs) == 1:
            param = kwargs.get("params")
        if isinstance(param, model):
            warnings.warn(
                f"Calling {func.__name__} with {model.__name__} parameter "  # type: ignore[attr-defined]
                "is deprecated, please update to the new API style.",
                DeprecationWarning,
                stacklevel=3,
            )
            kwargs = {
                field_name: getattr(param, field_name)
                for field_name in model.model_fields
                if field_name != "field_meta"
            }
            if meta := getattr(param, "field_meta", None):
                kwargs.update(meta)
            return func(self, **kwargs)  # type: ignore[arg-type]
        return func(self, *args, **kwargs)

    return wrapped


def _make_multi_legacy_func(func: Callable[..., T], models: MultiParamModelSpec) -> Callable[[Any, BaseModel], T]:
    model_name = _param_models_name(models)

    @functools.wraps(func)
    def wrapped(self, params: BaseModel) -> T:
        warnings.warn(
            f"Calling {func.__name__} with {model_name} parameter is "  # type: ignore[attr-defined]
            "deprecated, please update to the new API style.",
            DeprecationWarning,
            stacklevel=3,
        )
        return func(self, **model_to_kwargs(params, models))  # type: ignore[arg-type]

    return wrapped


def _make_multi_compatible_func(func: Callable[..., T], models: MultiParamModelSpec) -> Callable[..., T]:
    model_name = _param_models_name(models)

    @functools.wraps(func)
    def wrapped(self, *args: Any, **kwargs: Any) -> T:
        param = None
        if not kwargs and len(args) == 1:
            param = args[0]
        elif not args and len(kwargs) == 1:
            param = kwargs.get("params")
        if isinstance(param, models):
            warnings.warn(
                f"Calling {func.__name__} with {model_name} parameter "  # type: ignore[attr-defined]
                "is deprecated, please update to the new API style.",
                DeprecationWarning,
                stacklevel=3,
            )
            return func(self, **model_to_kwargs(param, models))  # type: ignore[arg-type]
        return func(self, *args, **kwargs)

    return wrapped


def compatible_class(cls: ClassT) -> ClassT:
    """Mark a class as backward compatible with old API style."""
    for attr in dir(cls):
        func = getattr(cls, attr)
        if not callable(func):
            continue
        model = getattr(func, "__param_model__", None)
        models = getattr(func, "__param_models__", None)
        if model is None and models is None:
            continue
        if "_" in attr:
            if models is not None:
                setattr(cls, to_camel_case(attr), _make_multi_legacy_func(func, models))
            else:
                if model is None:
                    continue
                setattr(cls, to_camel_case(attr), _make_legacy_func(func, model))
        else:
            if models is not None:
                setattr(cls, attr, _make_multi_compatible_func(func, models))
            else:
                if model is None:
                    continue
                setattr(cls, attr, _make_compatible_func(func, model))
    return cls
````

## File: tests/contrib/test_contrib_permissions.py
````python
from __future__ import annotations

import pytest

from acp.contrib.permissions import PermissionBroker, default_permission_options
from acp.contrib.tool_calls import ToolCallTracker
from acp.schema import (
    AllowedOutcome,
    ContentToolCallContent,
    PermissionOption,
    RequestPermissionRequest,
    RequestPermissionResponse,
    TextContentBlock,
)


@pytest.mark.asyncio
async def test_permission_broker_uses_tracker_state():
    captured: dict[str, RequestPermissionRequest] = {}

    async def fake_requester(request: RequestPermissionRequest):
        captured["request"] = request
        return RequestPermissionResponse(
            outcome=AllowedOutcome(option_id=request.options[0].option_id, outcome="selected")
        )

    tracker = ToolCallTracker(id_factory=lambda: "perm-id")
    tracker.start("external", title="Need approval")
    broker = PermissionBroker("session", fake_requester, tracker=tracker)

    result = await broker.request_for("external", description="Perform sensitive action")
    assert isinstance(result.outcome, AllowedOutcome)
    assert result.outcome.option_id == captured["request"].options[0].option_id
    assert captured["request"].tool_call.content is not None
    last_content = captured["request"].tool_call.content[-1]
    assert isinstance(last_content, ContentToolCallContent)
    assert isinstance(last_content.content, TextContentBlock)
    assert last_content.content.text.startswith("Perform sensitive action")


@pytest.mark.asyncio
async def test_permission_broker_accepts_custom_options():
    tracker = ToolCallTracker(id_factory=lambda: "custom")
    tracker.start("external", title="Custom options")
    options = [
        PermissionOption(option_id="allow", name="Allow once", kind="allow_once"),
    ]
    recorded: list[str] = []

    async def requester(request: RequestPermissionRequest):
        recorded.append(request.options[0].option_id)
        return RequestPermissionResponse(
            outcome=AllowedOutcome(option_id=request.options[0].option_id, outcome="selected")
        )

    broker = PermissionBroker("session", requester, tracker=tracker)
    await broker.request_for("external", options=options)
    assert recorded == ["allow"]


def test_default_permission_options_shape():
    options = default_permission_options()
    assert len(options) == 3
    assert {opt.option_id for opt in options} == {"approve", "approve_for_session", "reject"}
````

## File: tests/contrib/test_contrib_session_state.py
````python
from __future__ import annotations

import pytest

from acp.contrib.session_state import SessionAccumulator
from acp.schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AvailableCommandsUpdate,
    ContentToolCallContent,
    CurrentModeUpdate,
    PlanEntry,
    SessionNotification,
    TextContentBlock,
    ToolCallProgress,
    ToolCallStart,
    UserMessageChunk,
)


def notification(session_id: str, update):
    return SessionNotification(session_id=session_id, update=update)


def test_session_accumulator_merges_tool_calls():
    acc = SessionAccumulator()
    start = ToolCallStart(
        session_update="tool_call",
        tool_call_id="call-1",
        title="Read file",
        status="in_progress",
    )
    acc.apply(notification("s", start))
    progress = ToolCallProgress(
        session_update="tool_call_update",
        tool_call_id="call-1",
        status="completed",
        content=[
            ContentToolCallContent(
                type="content",
                content=TextContentBlock(type="text", text="Done"),
            )
        ],
    )
    snapshot = acc.apply(notification("s", progress))
    tool = snapshot.tool_calls["call-1"]
    assert tool.status == "completed"
    assert tool.title == "Read file"
    assert tool.content and tool.content[0].content.text == "Done"


def test_session_accumulator_records_plan_and_mode():
    acc = SessionAccumulator()
    acc.apply(
        notification(
            "s",
            AgentPlanUpdate(
                session_update="plan",
                entries=[
                    PlanEntry(content="Step 1", priority="medium", status="pending"),
                ],
            ),
        )
    )
    snapshot = acc.apply(
        notification("s", CurrentModeUpdate(session_update="current_mode_update", current_mode_id="coding"))
    )
    assert snapshot.plan_entries[0].content == "Step 1"
    assert snapshot.current_mode_id == "coding"


def test_session_accumulator_tracks_messages_and_commands():
    acc = SessionAccumulator()
    acc.apply(
        notification(
            "s",
            AvailableCommandsUpdate(
                session_update="available_commands_update",
                available_commands=[],
            ),
        )
    )
    acc.apply(
        notification(
            "s",
            UserMessageChunk(
                session_update="user_message_chunk",
                content=TextContentBlock(type="text", text="Hello"),
            ),
        )
    )
    acc.apply(
        notification(
            "s",
            AgentMessageChunk(
                session_update="agent_message_chunk",
                content=TextContentBlock(type="text", text="Hi!"),
            ),
        )
    )
    snapshot = acc.snapshot()
    user_content = snapshot.user_messages[0].content
    agent_content = snapshot.agent_messages[0].content
    assert isinstance(user_content, TextContentBlock)
    assert isinstance(agent_content, TextContentBlock)
    assert user_content.text == "Hello"
    assert agent_content.text == "Hi!"


def test_session_accumulator_auto_resets_on_new_session():
    acc = SessionAccumulator()
    acc.apply(
        notification(
            "s1",
            ToolCallStart(
                session_update="tool_call",
                tool_call_id="call-1",
                title="First",
            ),
        )
    )
    acc.apply(
        notification(
            "s2",
            ToolCallStart(
                session_update="tool_call",
                tool_call_id="call-2",
                title="Second",
            ),
        )
    )

    snapshot = acc.snapshot()
    assert snapshot.session_id == "s2"
    assert "call-1" not in snapshot.tool_calls
    assert "call-2" in snapshot.tool_calls


def test_session_accumulator_rejects_cross_session_when_auto_reset_disabled():
    acc = SessionAccumulator(auto_reset_on_session_change=False)
    acc.apply(
        notification(
            "s1",
            ToolCallStart(
                session_update="tool_call",
                tool_call_id="call-1",
                title="First",
            ),
        )
    )
    with pytest.raises(ValueError):
        acc.apply(
            notification(
                "s2",
                ToolCallStart(
                    session_update="tool_call",
                    tool_call_id="call-2",
                    title="Second",
                ),
            )
        )
````

## File: tests/contrib/test_contrib_tool_calls.py
````python
from __future__ import annotations

from acp.contrib.tool_calls import ToolCallTracker
from acp.schema import ContentToolCallContent, TextContentBlock, ToolCallProgress


def test_tool_call_tracker_generates_ids_and_updates():
    tracker = ToolCallTracker(id_factory=lambda: "generated-id")
    start = tracker.start("external", title="Run command")
    assert start.tool_call_id == "generated-id"
    progress = tracker.progress("external", status="completed")
    assert isinstance(progress, ToolCallProgress)
    assert progress.tool_call_id == "generated-id"
    view = tracker.view("external")
    assert view.status == "completed"


def test_tool_call_tracker_streaming_text_updates_content():
    tracker = ToolCallTracker(id_factory=lambda: "stream-id")
    tracker.start("external", title="Stream", status="in_progress")
    update1 = tracker.append_stream_text("external", "hello")
    assert update1.content is not None
    first_content = update1.content[0]
    assert isinstance(first_content, ContentToolCallContent)
    assert isinstance(first_content.content, TextContentBlock)
    assert first_content.content.text == "hello"
    update2 = tracker.append_stream_text("external", ", world", status="in_progress")
    assert update2.content is not None
    second_content = update2.content[0]
    assert isinstance(second_content, ContentToolCallContent)
    assert isinstance(second_content.content, TextContentBlock)
    assert second_content.content.text == "hello, world"
````

## File: tests/golden/cancel_notification.json
````json
{
  "sessionId": "sess_abc123def456"
}
````

## File: tests/golden/content_audio.json
````json
{
  "type": "audio",
  "mimeType": "audio/wav",
  "data": "UklGRiQAAABXQVZFZm10IBAAAAABAAEAQB8AAAB..."
}
````

## File: tests/golden/content_image.json
````json
{
  "type": "image",
  "mimeType": "image/png",
  "data": "iVBORw0KGgoAAAANSUhEUgAAAAEAAAAB..."
}
````

## File: tests/golden/content_resource_blob.json
````json
{
  "type": "resource",
  "resource": {
    "uri": "file:///home/user/document.pdf",
    "mimeType": "application/pdf",
    "blob": "<b64>"
  }
}
````

## File: tests/golden/content_resource_link.json
````json
{
  "type": "resource_link",
  "uri": "file:///home/user/document.pdf",
  "name": "document.pdf",
  "mimeType": "application/pdf",
  "size": 1024000
}
````

## File: tests/golden/content_resource_text.json
````json
{
  "type": "resource",
  "resource": {
    "uri": "file:///home/user/script.py",
    "mimeType": "text/x-python",
    "text": "def hello():\n    print('Hello, world!')"
  }
}
````

## File: tests/golden/content_text.json
````json
{
  "type": "text",
  "text": "What's the weather like today?"
}
````

## File: tests/golden/fs_read_text_file_request.json
````json
{
  "sessionId": "sess_abc123def456",
  "path": "/home/user/project/src/main.py",
  "line": 10,
  "limit": 50
}
````

## File: tests/golden/fs_read_text_file_response.json
````json
{
  "content": "def hello_world():\n    print('Hello, world!')\n"
}
````

## File: tests/golden/fs_write_text_file_request.json
````json
{
  "sessionId": "sess_abc123def456",
  "path": "/home/user/project/config.json",
  "content": "{\n  \"debug\": true,\n  \"version\": \"1.0.0\"\n}"
}
````

## File: tests/golden/initialize_request.json
````json
{
  "protocolVersion": 1,
  "clientCapabilities": {
    "fs": {
      "readTextFile": true,
      "writeTextFile": true
    }
  }
}
````

## File: tests/golden/initialize_response.json
````json
{
  "protocolVersion": 1,
  "agentCapabilities": {
    "loadSession": true,
    "mcpCapabilities": {},
    "promptCapabilities": {
      "image": true,
      "audio": true,
      "embeddedContext": true
    },
    "sessionCapabilities": {}
  },
  "authMethods": []
}
````

## File: tests/golden/new_session_request.json
````json
{
  "cwd": "/home/user/project",
  "mcpServers": [
    {
      "name": "filesystem",
      "command": "/path/to/mcp-server",
      "args": [
        "--stdio"
      ],
      "env": []
    }
  ]
}
````

## File: tests/golden/new_session_response.json
````json
{
  "sessionId": "sess_abc123def456"
}
````

## File: tests/golden/permission_outcome_cancelled.json
````json
{
  "outcome": "cancelled"
}
````

## File: tests/golden/permission_outcome_selected.json
````json
{
  "outcome": "selected",
  "optionId": "allow-once"
}
````

## File: tests/golden/prompt_request.json
````json
{
  "sessionId": "sess_abc123def456",
  "prompt": [
    {
      "type": "text",
      "text": "Can you analyze this code for potential issues?"
    },
    {
      "type": "resource",
      "resource": {
        "uri": "file:///home/user/project/main.py",
        "mimeType": "text/x-python",
        "text": "def process_data(items):\n    for item in items:\n        print(item)"
      }
    }
  ]
}
````

## File: tests/golden/request_permission_request.json
````json
{
  "sessionId": "sess_abc123def456",
  "toolCall": {
    "toolCallId": "call_001"
  },
  "options": [
    {
      "optionId": "allow-once",
      "name": "Allow once",
      "kind": "allow_once"
    },
    {
      "optionId": "reject-once",
      "name": "Reject",
      "kind": "reject_once"
    }
  ]
}
````

## File: tests/golden/request_permission_response_selected.json
````json
{
  "outcome": {
    "outcome": "selected",
    "optionId": "allow-once"
  }
}
````

## File: tests/golden/session_update_agent_message_chunk.json
````json
{
  "sessionUpdate": "agent_message_chunk",
  "content": {
    "type": "text",
    "text": "The capital of France is Paris."
  }
}
````

## File: tests/golden/session_update_agent_thought_chunk.json
````json
{
  "sessionUpdate": "agent_thought_chunk",
  "content": {
    "type": "text",
    "text": "Thinking about best approach..."
  }
}
````

## File: tests/golden/session_update_config_option_update.json
````json
{
  "sessionUpdate": "config_option_update",
  "configOptions": [
    {
      "type": "select",
      "id": "model",
      "name": "Model",
      "description": "Choose a model",
      "currentValue": "gpt-4o-mini",
      "options": [
        {
          "name": "GPT-4o Mini",
          "value": "gpt-4o-mini"
        },
        {
          "name": "GPT-4o",
          "value": "gpt-4o",
          "description": "Highest quality"
        }
      ]
    },
    {
      "type": "select",
      "id": "mode",
      "name": "Mode",
      "currentValue": "fast",
      "options": [
        {
          "group": "speed",
          "name": "Speed",
          "options": [
            {
              "name": "Fast",
              "value": "fast"
            },
            {
              "name": "Balanced",
              "value": "balanced"
            }
          ]
        },
        {
          "group": "quality",
          "name": "Quality",
          "options": [
            {
              "name": "High",
              "value": "high"
            }
          ]
        }
      ]
    }
  ]
}
````

## File: tests/golden/session_update_plan.json
````json
{
  "sessionUpdate": "plan",
  "entries": [
    {
      "content": "Check for syntax errors",
      "priority": "high",
      "status": "pending"
    },
    {
      "content": "Identify potential type issues",
      "priority": "medium",
      "status": "pending"
    }
  ]
}
````

## File: tests/golden/session_update_tool_call_edit.json
````json
{
  "sessionUpdate": "tool_call",
  "toolCallId": "call_003",
  "title": "Apply edit",
  "kind": "edit",
  "status": "pending",
  "locations": [
    {
      "path": "/home/user/project/src/config.json"
    }
  ],
  "rawInput": {
    "path": "/home/user/project/src/config.json",
    "content": "print('hello')"
  }
}
````

## File: tests/golden/session_update_tool_call_locations_rawinput.json
````json
{
  "sessionUpdate": "tool_call",
  "toolCallId": "call_lr",
  "title": "Tracking file",
  "locations": [
    {
      "path": "/home/user/project/src/config.json"
    }
  ],
  "rawInput": {
    "path": "/home/user/project/src/config.json"
  }
}
````

## File: tests/golden/session_update_tool_call_read.json
````json
{
  "sessionUpdate": "tool_call",
  "toolCallId": "call_001",
  "title": "Reading configuration file",
  "kind": "read",
  "status": "pending",
  "locations": [
    {
      "path": "/home/user/project/src/config.json"
    }
  ],
  "rawInput": {
    "path": "/home/user/project/src/config.json"
  }
}
````

## File: tests/golden/session_update_tool_call_update_content.json
````json
{
  "sessionUpdate": "tool_call_update",
  "toolCallId": "call_001",
  "status": "in_progress",
  "content": [
    {
      "type": "content",
      "content": {
        "type": "text",
        "text": "Found 3 configuration files..."
      }
    }
  ]
}
````

## File: tests/golden/session_update_tool_call_update_more_fields.json
````json
{
  "sessionUpdate": "tool_call_update",
  "toolCallId": "call_010",
  "title": "Processing changes",
  "kind": "edit",
  "status": "completed",
  "locations": [
    {
      "path": "/home/user/project/src/config.json"
    }
  ],
  "rawInput": {
    "path": "/home/user/project/src/config.json"
  },
  "rawOutput": {
    "result": "ok"
  },
  "content": [
    {
      "type": "content",
      "content": {
        "type": "text",
        "text": "Edit completed."
      }
    }
  ]
}
````

## File: tests/golden/session_update_tool_call.json
````json
{
  "sessionUpdate": "tool_call",
  "toolCallId": "call_001",
  "title": "Reading configuration file",
  "kind": "read",
  "status": "pending"
}
````

## File: tests/golden/session_update_user_message_chunk.json
````json
{
  "sessionUpdate": "user_message_chunk",
  "content": {
    "type": "text",
    "text": "What's the capital of France?"
  }
}
````

## File: tests/golden/set_session_config_option_request.json
````json
{
  "sessionId": "sess-123",
  "configId": "model",
  "value": "gpt-4o-mini"
}
````

## File: tests/golden/set_session_config_option_response.json
````json
{
  "configOptions": [
    {
      "type": "select",
      "id": "mode",
      "name": "Mode",
      "currentValue": "balanced",
      "options": [
        {
          "name": "Fast",
          "value": "fast"
        },
        {
          "name": "Balanced",
          "value": "balanced"
        }
      ]
    }
  ]
}
````

## File: tests/golden/tool_content_content_text.json
````json
{
  "type": "content",
  "content": {
    "type": "text",
    "text": "Analysis complete. Found 3 issues."
  }
}
````

## File: tests/golden/tool_content_diff_no_old.json
````json
{
  "type": "diff",
  "path": "/home/user/project/src/config.json",
  "newText": "{\n  \"debug\": true\n}"
}
````

## File: tests/golden/tool_content_diff.json
````json
{
  "type": "diff",
  "path": "/home/user/project/src/config.json",
  "oldText": "{\n  \"debug\": false\n}",
  "newText": "{\n  \"debug\": true\n}"
}
````

## File: tests/golden/tool_content_terminal.json
````json
{
  "type": "terminal",
  "terminalId": "term_001"
}
````

## File: tests/real_user/__init__.py
````python

````

## File: tests/real_user/test_cancel_prompt_flow.py
````python
import asyncio
from typing import Any

import pytest

from acp.schema import (
    AudioContentBlock,
    EmbeddedResourceContentBlock,
    ImageContentBlock,
    PromptRequest,
    PromptResponse,
    ResourceContentBlock,
    TextContentBlock,
)
from tests.conftest import TestAgent

# Regression from a real user session where cancel needed to interrupt a long-running prompt.


class LongRunningAgent(TestAgent):
    """Agent variant whose prompt waits for a cancel notification."""

    def __init__(self) -> None:
        super().__init__()
        self.prompt_started = asyncio.Event()
        self.cancel_received = asyncio.Event()

    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        **kwargs: Any,
    ) -> PromptResponse:
        self.prompts.append(PromptRequest(prompt=prompt, session_id=session_id, field_meta=kwargs or None))
        self.prompt_started.set()
        try:
            await asyncio.wait_for(self.cancel_received.wait(), timeout=1.0)
        except asyncio.TimeoutError as exc:
            msg = "Cancel notification did not arrive while prompt pending"
            raise AssertionError(msg) from exc
        return PromptResponse(stop_reason="cancelled")

    async def cancel(self, session_id: str, **kwargs: Any) -> None:
        await super().cancel(session_id, **kwargs)
        self.cancel_received.set()


@pytest.mark.asyncio
@pytest.mark.parametrize("agent", [LongRunningAgent()])
async def test_cancel_reaches_agent_during_prompt(connect, agent) -> None:
    _, agent_conn = connect()

    prompt_task = asyncio.create_task(
        agent_conn.prompt(
            session_id="sess-xyz",
            prompt=[TextContentBlock(type="text", text="hello")],
        )
    )

    await agent.prompt_started.wait()
    assert not prompt_task.done(), "Prompt finished before cancel was sent"

    await agent_conn.cancel(session_id="sess-xyz")

    await asyncio.wait_for(agent.cancel_received.wait(), timeout=1.0)

    response = await asyncio.wait_for(prompt_task, timeout=1.0)
    assert response.stop_reason == "cancelled"
    assert agent.cancellations == ["sess-xyz"]
````

## File: tests/real_user/test_mcp_servers_optional.py
````python
import asyncio
from typing import Any

import pytest

from acp import InitializeResponse, LoadSessionResponse, NewSessionResponse
from acp.core import AgentSideConnection, ClientSideConnection
from acp.schema import HttpMcpServer, McpServerStdio, SseMcpServer
from tests.conftest import TestAgent, TestClient


class McpOptionalAgent(TestAgent):
    def __init__(self) -> None:
        super().__init__()
        self.seen_new_session: tuple[str, Any] | None = None
        self.seen_load_session: tuple[str, str, Any] | None = None

    async def new_session(
        self,
        cwd: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> NewSessionResponse:
        resolved_mcp_servers = mcp_servers or []
        self.seen_new_session = (cwd, resolved_mcp_servers)
        return await super().new_session(cwd=cwd, mcp_servers=resolved_mcp_servers, **kwargs)

    async def load_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> LoadSessionResponse | None:
        resolved_mcp_servers = mcp_servers or []
        self.seen_load_session = (cwd, session_id, resolved_mcp_servers)
        return await super().load_session(cwd=cwd, session_id=session_id, mcp_servers=resolved_mcp_servers, **kwargs)


@pytest.mark.asyncio
async def test_session_requests_default_empty_mcp_servers(server) -> None:
    client = TestClient()
    captured_agent: list[McpOptionalAgent] = []

    agent_conn = ClientSideConnection(client, server._client_writer, server._client_reader)  # type: ignore[arg-type]
    _agent_side = AgentSideConnection(
        lambda _conn: captured_agent.append(McpOptionalAgent()) or captured_agent[-1],
        server._server_writer,
        server._server_reader,
        listening=True,
    )

    init = await asyncio.wait_for(agent_conn.initialize(protocol_version=1), timeout=1.0)
    assert isinstance(init, InitializeResponse)

    new_session = await asyncio.wait_for(agent_conn.new_session(cwd="/workspace"), timeout=1.0)
    assert isinstance(new_session, NewSessionResponse)

    load_session = await asyncio.wait_for(
        agent_conn.load_session(cwd="/workspace", session_id=new_session.session_id),
        timeout=1.0,
    )
    assert isinstance(load_session, LoadSessionResponse)

    assert captured_agent, "Agent was not constructed"
    [agent] = captured_agent
    assert agent.seen_new_session == ("/workspace", [])
    assert agent.seen_load_session == ("/workspace", new_session.session_id, [])
````

## File: tests/real_user/test_permission_flow.py
````python
import asyncio
from typing import Any

import pytest

from acp import PromptResponse
from acp.core import AgentSideConnection, ClientSideConnection
from acp.schema import (
    AudioContentBlock,
    EmbeddedResourceContentBlock,
    ImageContentBlock,
    PermissionOption,
    ResourceContentBlock,
    TextContentBlock,
    ToolCallUpdate,
)
from tests.conftest import TestAgent, TestClient

# Regression from real-world runs where agents paused prompts to obtain user permission.


class PermissionRequestAgent(TestAgent):
    """Agent that asks the client for permission during a prompt."""

    def __init__(self, conn: AgentSideConnection) -> None:
        super().__init__()
        self._conn = conn
        self.permission_responses = []

    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        **kwargs: Any,
    ) -> PromptResponse:
        permission = await self._conn.request_permission(
            session_id=session_id,
            options=[
                PermissionOption(option_id="allow", name="Allow", kind="allow_once"),
                PermissionOption(option_id="deny", name="Deny", kind="reject_once"),
            ],
            tool_call=ToolCallUpdate(tool_call_id="call-1", title="Write File"),
        )
        self.permission_responses.append(permission)
        return await super().prompt(prompt, session_id, **kwargs)


@pytest.mark.asyncio
async def test_agent_request_permission_roundtrip(server) -> None:
    client = TestClient()
    client.queue_permission_selected("allow")

    captured_agent = []

    agent_conn = ClientSideConnection(client, server._client_writer, server._client_reader)  # type: ignore[arg-type]
    _agent_conn = AgentSideConnection(
        lambda conn: captured_agent.append(PermissionRequestAgent(conn)) or captured_agent[-1],
        server._server_writer,
        server._server_reader,
        listening=True,
    )

    response = await asyncio.wait_for(
        agent_conn.prompt(
            session_id="sess-perm",
            prompt=[TextContentBlock(type="text", text="needs approval")],
        ),
        timeout=1.0,
    )
    assert response.stop_reason == "end_turn"

    assert captured_agent, "Agent was not constructed"
    [agent] = captured_agent
    assert agent.permission_responses, "Agent did not receive permission response"
    permission_response = agent.permission_responses[0]
    assert permission_response.outcome.outcome == "selected"
    assert permission_response.outcome.option_id == "allow"
````

## File: tests/real_user/test_stdio_limits.py
````python
import os
import subprocess
import sys
import tempfile
import textwrap

import pytest

from acp.transports import spawn_stdio_transport

LARGE_LINE_SIZE = 70 * 1024


def _large_line_script(size: int = LARGE_LINE_SIZE) -> str:
    return textwrap.dedent(
        f"""
        import sys
        sys.stdout.write("X" * {size})
        sys.stdout.write("\\n")
        sys.stdout.flush()
        """
    ).strip()


@pytest.mark.asyncio
async def test_spawn_stdio_transport_hits_default_limit() -> None:
    script = _large_line_script()
    async with spawn_stdio_transport(sys.executable, "-c", script) as (reader, _writer, _process):
        # readline() re-raises LimitOverrunError as ValueError on CPython 3.12+.
        with pytest.raises(ValueError):
            await reader.readline()


@pytest.mark.asyncio
async def test_spawn_stdio_transport_custom_limit_handles_large_line() -> None:
    script = _large_line_script()
    async with spawn_stdio_transport(
        sys.executable,
        "-c",
        script,
        limit=LARGE_LINE_SIZE * 2,
    ) as (reader, _writer, _process):
        line = await reader.readline()
        assert len(line) == LARGE_LINE_SIZE + 1


@pytest.mark.asyncio
async def test_run_agent_stdio_buffer_limit() -> None:
    """Test that run_agent with different buffer limits can handle appropriately sized messages."""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Test 1: Small buffer (1KB) fails with large message (70KB)
        small_agent = os.path.join(tmpdir, "small_agent.py")
        with open(small_agent, "w") as f:
            f.write("""
import asyncio
from acp.core import run_agent
from acp.interfaces import Agent

class TestAgent(Agent):
    async def list_capabilities(self):
        return {"capabilities": {}}

asyncio.run(run_agent(TestAgent(), stdio_buffer_limit_bytes=1024))
""")

        # Send a 70KB message - should fail with 1KB buffer
        large_msg = '{"jsonrpc":"2.0","method":"test","params":{"data":"' + "X" * LARGE_LINE_SIZE + '"}}\n'
        result = subprocess.run(  # noqa: S603
            [sys.executable, small_agent], input=large_msg, capture_output=True, text=True, timeout=2
        )

        # Should have errors in stderr about the buffer limit
        assert "Error" in result.stderr or result.returncode != 0, (
            f"Expected error with small buffer, got: {result.stderr}"
        )

        # Test 2: Large buffer (200KB) succeeds with large message (70KB)
        large_agent = os.path.join(tmpdir, "large_agent.py")
        with open(large_agent, "w") as f:
            f.write(f"""
import asyncio
from acp.core import run_agent
from acp.interfaces import Agent

class TestAgent(Agent):
    async def list_capabilities(self):
        return {{"capabilities": {{}}}}

asyncio.run(run_agent(TestAgent(), stdio_buffer_limit_bytes={LARGE_LINE_SIZE * 3}))
""")

        # Same message, but with a buffer 3x the size - should handle it
        result = subprocess.run(  # noqa: S603
            [sys.executable, large_agent], input=large_msg, capture_output=True, text=True, timeout=2
        )

        # With a large enough buffer, the agent should at least start successfully
        # (it may have other errors from invalid JSON-RPC, but not buffer overrun)
        if "LimitOverrunError" in result.stderr or "buffer" in result.stderr.lower():
            pytest.fail(f"Large buffer still hit limit error: {result.stderr}")
````

## File: tests/conftest.py
````python
import asyncio
import contextlib
from collections.abc import AsyncGenerator, Callable
from typing import Any

import pytest
import pytest_asyncio

from acp import (
    AuthenticateResponse,
    CreateTerminalResponse,
    InitializeResponse,
    KillTerminalResponse,
    LoadSessionResponse,
    NewSessionResponse,
    PromptRequest,
    PromptResponse,
    ReadTextFileResponse,
    ReleaseTerminalResponse,
    RequestError,
    RequestPermissionResponse,
    SessionNotification,
    SetSessionConfigOptionResponse,
    SetSessionModeResponse,
    TerminalOutputResponse,
    WaitForTerminalExitResponse,
    WriteTextFileResponse,
)
from acp.core import AgentSideConnection, ClientSideConnection
from acp.schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AllowedOutcome,
    AudioContentBlock,
    AvailableCommandsUpdate,
    ClientCapabilities,
    ConfigOptionUpdate,
    CurrentModeUpdate,
    DeniedOutcome,
    EmbeddedResourceContentBlock,
    EnvVariable,
    HttpMcpServer,
    ImageContentBlock,
    Implementation,
    ListSessionsResponse,
    McpServerStdio,
    PermissionOption,
    ResourceContentBlock,
    SessionInfoUpdate,
    SseMcpServer,
    TextContentBlock,
    ToolCallProgress,
    ToolCallStart,
    ToolCallUpdate,
    UserMessageChunk,
)


class _Server:
    def __init__(self) -> None:
        self._server: asyncio.AbstractServer | None = None
        self._server_reader: asyncio.StreamReader | None = None
        self._server_writer: asyncio.StreamWriter | None = None
        self._client_reader: asyncio.StreamReader | None = None
        self._client_writer: asyncio.StreamWriter | None = None

    async def __aenter__(self):
        async def handle(reader: asyncio.StreamReader, writer: asyncio.StreamWriter):
            self._server_reader = reader
            self._server_writer = writer

        self._server = await asyncio.start_server(handle, host="127.0.0.1", port=0)
        host, port = self._server.sockets[0].getsockname()[:2]
        self._client_reader, self._client_writer = await asyncio.open_connection(host, port)

        # wait until server side is set
        for _ in range(100):
            if self._server_reader and self._server_writer:
                break
            await asyncio.sleep(0.01)
        assert self._server_reader and self._server_writer
        assert self._client_reader and self._client_writer
        return self

    async def __aexit__(self, exc_type, exc, tb):
        if self._client_writer:
            self._client_writer.close()
            with contextlib.suppress(Exception):
                await self._client_writer.wait_closed()
        if self._server_writer:
            self._server_writer.close()
            with contextlib.suppress(Exception):
                await self._server_writer.wait_closed()
        if self._server:
            self._server.close()
            await self._server.wait_closed()

    @property
    def server_writer(self) -> asyncio.StreamWriter:
        assert self._server_writer is not None
        return self._server_writer

    @property
    def server_reader(self) -> asyncio.StreamReader:
        assert self._server_reader is not None
        return self._server_reader

    @property
    def client_writer(self) -> asyncio.StreamWriter:
        assert self._client_writer is not None
        return self._client_writer

    @property
    def client_reader(self) -> asyncio.StreamReader:
        assert self._client_reader is not None
        return self._client_reader


@pytest_asyncio.fixture
async def server() -> AsyncGenerator[_Server, None]:
    """Provides a server-client connection pair for testing."""
    async with _Server() as server_instance:
        yield server_instance


class TestClient:
    __test__ = False  # prevent pytest from collecting this class

    def __init__(self) -> None:
        self.permission_outcomes: list[RequestPermissionResponse] = []
        self.files: dict[str, str] = {}
        self.notifications: list[SessionNotification] = []
        self.ext_calls: list[tuple[str, dict]] = []
        self.ext_notes: list[tuple[str, dict]] = []
        self._agent_conn = None

    def on_connect(self, conn) -> None:
        self._agent_conn = conn

    def queue_permission_cancelled(self) -> None:
        self.permission_outcomes.append(RequestPermissionResponse(outcome=DeniedOutcome(outcome="cancelled")))

    def queue_permission_selected(self, option_id: str) -> None:
        self.permission_outcomes.append(
            RequestPermissionResponse(outcome=AllowedOutcome(option_id=option_id, outcome="selected"))
        )

    async def request_permission(
        self, options: list[PermissionOption], session_id: str, tool_call: ToolCallUpdate, **kwargs: Any
    ) -> RequestPermissionResponse:
        if self.permission_outcomes:
            return self.permission_outcomes.pop()
        return RequestPermissionResponse(outcome=DeniedOutcome(outcome="cancelled"))

    async def write_text_file(
        self, content: str, path: str, session_id: str, **kwargs: Any
    ) -> WriteTextFileResponse | None:
        self.files[str(path)] = content
        return WriteTextFileResponse()

    async def read_text_file(
        self, path: str, session_id: str, limit: int | None = None, line: int | None = None, **kwargs: Any
    ) -> ReadTextFileResponse:
        content = self.files.get(str(path), "default content")
        return ReadTextFileResponse(content=content)

    async def session_update(
        self,
        session_id: str,
        update: UserMessageChunk
        | AgentMessageChunk
        | AgentThoughtChunk
        | ToolCallStart
        | ToolCallProgress
        | AgentPlanUpdate
        | AvailableCommandsUpdate
        | CurrentModeUpdate
        | ConfigOptionUpdate
        | SessionInfoUpdate,
        **kwargs: Any,
    ) -> None:
        self.notifications.append(SessionNotification(session_id=session_id, update=update, field_meta=kwargs or None))

    # Optional terminal methods (not implemented in this test client)
    async def create_terminal(
        self,
        command: str,
        session_id: str,
        args: list[str] | None = None,
        cwd: str | None = None,
        env: list[EnvVariable] | None = None,
        output_byte_limit: int | None = None,
        **kwargs: Any,
    ) -> CreateTerminalResponse:
        raise NotImplementedError

    async def terminal_output(
        self, session_id: str, terminal_id: str | None = None, **kwargs: Any
    ) -> TerminalOutputResponse:  # pragma: no cover - placeholder
        raise NotImplementedError

    async def release_terminal(
        self, session_id: str, terminal_id: str | None = None, **kwargs: Any
    ) -> ReleaseTerminalResponse | None:
        raise NotImplementedError

    async def wait_for_terminal_exit(
        self, session_id: str, terminal_id: str | None = None, **kwargs: Any
    ) -> WaitForTerminalExitResponse:
        raise NotImplementedError

    async def kill_terminal(
        self, session_id: str, terminal_id: str | None = None, **kwargs: Any
    ) -> KillTerminalResponse | None:
        raise NotImplementedError

    async def ext_method(self, method: str, params: dict) -> dict:
        self.ext_calls.append((method, params))
        if method == "example.com/ping":
            return {"response": "pong", "params": params}
        raise RequestError.method_not_found(method)

    async def ext_notification(self, method: str, params: dict) -> None:
        self.ext_notes.append((method, params))


class TestAgent:
    __test__ = False  # prevent pytest from collecting this class

    def __init__(self) -> None:
        self.prompts: list[PromptRequest] = []
        self.cancellations: list[str] = []
        self.config_option_calls: list[tuple[str, str, str | bool]] = []
        self.ext_calls: list[tuple[str, dict]] = []
        self.ext_notes: list[tuple[str, dict]] = []

    async def initialize(
        self,
        protocol_version: int,
        client_capabilities: ClientCapabilities | None = None,
        client_info: Implementation | None = None,
        **kwargs: Any,
    ) -> InitializeResponse:
        # Avoid serializer warnings by omitting defaults
        return InitializeResponse(protocol_version=protocol_version, agent_capabilities=None, auth_methods=[])

    async def new_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio], **kwargs: Any
    ) -> NewSessionResponse:
        return NewSessionResponse(session_id="test-session-123")

    async def load_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio], session_id: str, **kwargs: Any
    ) -> LoadSessionResponse | None:
        return LoadSessionResponse()

    async def authenticate(self, method_id: str, **kwargs: Any) -> AuthenticateResponse | None:
        return AuthenticateResponse()

    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        message_id: str | None = None,
        **kwargs: Any,
    ) -> PromptResponse:
        self.prompts.append(
            PromptRequest(
                prompt=prompt,
                session_id=session_id,
                message_id=message_id,
                field_meta=kwargs or None,
            )
        )
        return PromptResponse(stop_reason="end_turn")

    async def cancel(self, session_id: str, **kwargs: Any) -> None:
        self.cancellations.append(session_id)

    async def list_sessions(
        self, cursor: str | None = None, cwd: str | None = None, **kwargs: Any
    ) -> ListSessionsResponse:
        return ListSessionsResponse(sessions=[])

    async def set_session_mode(self, mode_id: str, session_id: str, **kwargs: Any) -> SetSessionModeResponse | None:
        return SetSessionModeResponse()

    async def set_config_option(
        self, config_id: str, session_id: str, value: str | bool, **kwargs: Any
    ) -> SetSessionConfigOptionResponse | None:
        self.config_option_calls.append((config_id, session_id, value))
        return SetSessionConfigOptionResponse(config_options=[])

    async def ext_method(self, method: str, params: dict) -> dict:
        self.ext_calls.append((method, params))
        if method == "example.com/echo":
            return {"echo": params}
        raise RequestError.method_not_found(method)

    async def ext_notification(self, method: str, params: dict) -> None:
        self.ext_notes.append((method, params))


@pytest.fixture(name="agent")
def agent_fixture() -> TestAgent:
    return TestAgent()


@pytest.fixture(name="client")
def client_fixture() -> TestClient:
    return TestClient()


@pytest.fixture(name="connect")
def connect_func(server, agent, client) -> Callable[[bool, bool], tuple[AgentSideConnection, ClientSideConnection]]:
    def _connect(
        connect_agent: bool = True, connect_client: bool = True, use_unstable_protocol: bool = False
    ) -> tuple[AgentSideConnection, ClientSideConnection]:
        agent_conn = None
        client_conn = None
        if connect_agent:
            agent_conn = AgentSideConnection(
                agent,
                server.server_writer,
                server.server_reader,
                listening=True,
                use_unstable_protocol=use_unstable_protocol,
            )
        if connect_client:
            client_conn = ClientSideConnection(
                client, server.client_writer, server.client_reader, use_unstable_protocol=use_unstable_protocol
            )
        return agent_conn, client_conn  # type: ignore[return-value]

    return _connect
````

## File: tests/test_compatibility.py
````python
import pytest

from acp import (
    AuthenticateResponse,
    InitializeResponse,
    LoadSessionResponse,
    NewSessionResponse,
    PromptRequest,
    PromptResponse,
    ReadTextFileResponse,
    RequestError,
    RequestPermissionResponse,
    SessionNotification,
    SetSessionConfigOptionResponse,
    SetSessionModelResponse,
    SetSessionModeResponse,
    WriteTextFileResponse,
)
from acp.schema import (
    AllowedOutcome,
    AuthenticateRequest,
    CancelNotification,
    DeniedOutcome,
    InitializeRequest,
    LoadSessionRequest,
    NewSessionRequest,
    ReadTextFileRequest,
    RequestPermissionRequest,
    SetSessionConfigOptionBooleanRequest,
    SetSessionConfigOptionSelectRequest,
    SetSessionModelRequest,
    SetSessionModeRequest,
    WriteTextFileRequest,
)


class LegacyAgent:
    def __init__(self) -> None:
        self.prompts: list[PromptRequest] = []
        self.config_option_requests: list[
            SetSessionConfigOptionBooleanRequest | SetSessionConfigOptionSelectRequest
        ] = []
        self.cancellations: list[str] = []
        self.ext_calls: list[tuple[str, dict]] = []
        self.ext_notes: list[tuple[str, dict]] = []

    async def initialize(self, params: InitializeRequest) -> InitializeResponse:
        # Avoid serializer warnings by omitting defaults
        return InitializeResponse(protocol_version=params.protocol_version, agent_capabilities=None, auth_methods=[])

    async def newSession(self, params: NewSessionRequest) -> NewSessionResponse:
        return NewSessionResponse(session_id="test-session-123")

    async def loadSession(self, params: LoadSessionRequest) -> LoadSessionResponse | None:
        return LoadSessionResponse()

    async def authenticate(self, params: AuthenticateRequest) -> AuthenticateResponse | None:
        return AuthenticateResponse()

    async def prompt(self, params: PromptRequest) -> PromptResponse:
        self.prompts.append(params)
        return PromptResponse(stop_reason="end_turn")

    async def cancel(self, params: CancelNotification) -> None:
        self.cancellations.append(params.session_id)

    async def setSessionMode(self, params: SetSessionModeRequest) -> SetSessionModeResponse | None:
        return SetSessionModeResponse()

    async def setSessionModel(self, params: SetSessionModelRequest) -> SetSessionModelResponse | None:
        return SetSessionModelResponse()

    async def setConfigOption(
        self, params: SetSessionConfigOptionBooleanRequest | SetSessionConfigOptionSelectRequest
    ) -> SetSessionConfigOptionResponse | None:
        self.config_option_requests.append(params)
        return SetSessionConfigOptionResponse(config_options=[])

    async def extMethod(self, method: str, params: dict) -> dict:
        self.ext_calls.append((method, params))
        if method == "example.com/echo":
            return {"echo": params}
        raise RequestError.method_not_found(method)

    async def extNotification(self, method: str, params: dict) -> None:
        self.ext_notes.append((method, params))


class LegacyClient:
    __test__ = False  # prevent pytest from collecting this class

    def __init__(self) -> None:
        self.permission_outcomes: list[RequestPermissionResponse] = []
        self.files: dict[str, str] = {}
        self.notifications: list[SessionNotification] = []
        self.ext_calls: list[tuple[str, dict]] = []
        self.ext_notes: list[tuple[str, dict]] = []

    def queue_permission_cancelled(self) -> None:
        self.permission_outcomes.append(RequestPermissionResponse(outcome=DeniedOutcome(outcome="cancelled")))

    def queue_permission_selected(self, option_id: str) -> None:
        self.permission_outcomes.append(
            RequestPermissionResponse(outcome=AllowedOutcome(option_id=option_id, outcome="selected"))
        )

    async def requestPermission(self, params: RequestPermissionRequest) -> RequestPermissionResponse:
        if self.permission_outcomes:
            return self.permission_outcomes.pop()
        return RequestPermissionResponse(outcome=DeniedOutcome(outcome="cancelled"))

    async def writeTextFile(self, params: WriteTextFileRequest) -> WriteTextFileResponse:
        self.files[str(params.path)] = params.content
        return WriteTextFileResponse()

    async def readTextFile(self, params: ReadTextFileRequest) -> ReadTextFileResponse:
        content = self.files.get(str(params.path), "default content")
        return ReadTextFileResponse(content=content)

    async def sessionUpdate(self, params: SessionNotification) -> None:
        self.notifications.append(params)

    # Optional terminal methods (not implemented in this test client)
    async def createTerminal(self, params):  # pragma: no cover - placeholder
        raise NotImplementedError

    async def terminalOutput(self, params):  # pragma: no cover - placeholder
        raise NotImplementedError

    async def releaseTerminal(self, params):  # pragma: no cover - placeholder
        raise NotImplementedError

    async def waitForTerminalExit(self, params):  # pragma: no cover - placeholder
        raise NotImplementedError

    async def killTerminal(self, params):  # pragma: no cover - placeholder
        raise NotImplementedError

    async def extMethod(self, method: str, params: dict) -> dict:
        self.ext_calls.append((method, params))
        if method == "example.com/ping":
            return {"response": "pong", "params": params}
        raise RequestError.method_not_found(method)

    async def extNotification(self, method: str, params: dict) -> None:
        self.ext_notes.append((method, params))


@pytest.mark.asyncio
@pytest.mark.parametrize("agent,client", [(LegacyAgent(), LegacyClient())])
async def test_initialize_and_new_session_compat(connect, client):
    client_conn, agent_conn = connect()

    with pytest.warns(DeprecationWarning) as record:
        resp = await agent_conn.newSession(NewSessionRequest(cwd="/home/tmp", mcp_servers=[]))

    assert len(record) == 2
    assert "Calling new_session with NewSessionRequest parameter is deprecated" in str(record[0].message)
    assert "The old style method LegacyAgent.newSession is deprecated" in str(record[1].message)

    assert isinstance(resp, NewSessionResponse)
    assert resp.session_id == "test-session-123"

    with pytest.warns(DeprecationWarning) as record:
        resp = await agent_conn.new_session(cwd="/home/tmp", mcp_servers=[])
    assert len(record) == 1
    assert "The old style method LegacyAgent.newSession is deprecated" in str(record[0].message)

    with pytest.warns(DeprecationWarning) as record:
        await client_conn.writeTextFile(
            WriteTextFileRequest(path="test.txt", content="Hello, World!", session_id="test-session-123")
        )

    assert len(record) == 2
    assert client.files["test.txt"] == "Hello, World!"

    with pytest.warns(DeprecationWarning) as record:
        resp = await client_conn.read_text_file(path="test.txt", session_id="test-session-123")

    assert len(record) == 1
    assert resp.content == "Hello, World!"


@pytest.mark.asyncio
@pytest.mark.parametrize("agent,client", [(LegacyAgent(), LegacyClient())])
async def test_set_config_option_boolean_compat(connect, agent):
    _, agent_conn = connect()

    with pytest.warns(DeprecationWarning) as record:
        resp = await agent_conn.setConfigOption(
            SetSessionConfigOptionBooleanRequest(
                config_id="brave_mode",
                session_id="test-session-123",
                type="boolean",
                value=True,
            )
        )

    assert len(record) == 2
    assert "SetSessionConfigOptionBooleanRequest | SetSessionConfigOptionSelectRequest parameter is deprecated" in str(
        record[0].message
    )
    assert "The old style method LegacyAgent.setConfigOption is deprecated" in str(record[1].message)
    assert isinstance(resp, SetSessionConfigOptionResponse)
    assert agent.config_option_requests == [
        SetSessionConfigOptionBooleanRequest(
            config_id="brave_mode",
            session_id="test-session-123",
            type="boolean",
            value=True,
        )
    ]
````

## File: tests/test_gemini_example.py
````python
from __future__ import annotations

import os
import shlex
import shutil
import subprocess
import sys
from pathlib import Path

import pytest


def _flag_enabled() -> bool:
    value = os.environ.get("ACP_ENABLE_GEMINI_TESTS", "").strip().lower()
    return value in {"1", "true", "yes", "on"}


def _resolve_gemini_binary() -> str | None:
    override = os.environ.get("ACP_GEMINI_BIN")
    if override:
        return override
    return shutil.which("gemini")


GEMINI_BIN = _resolve_gemini_binary()
pytestmark = pytest.mark.skipif(
    not (_flag_enabled() and GEMINI_BIN),
    reason="Gemini tests disabled. Set ACP_ENABLE_GEMINI_TESTS=1 and provide the gemini CLI.",
)


def test_gemini_example_smoke() -> None:
    env = os.environ.copy()
    src_path = str(Path(__file__).resolve().parent.parent / "src")
    python_path = env.get("PYTHONPATH")
    env["PYTHONPATH"] = src_path if not python_path else os.pathsep.join([src_path, python_path])

    extra_args = shlex.split(env.get("ACP_GEMINI_TEST_ARGS", ""))
    cmd = [
        sys.executable,
        str(Path("examples/gemini.py").resolve()),
        "--gemini",
        GEMINI_BIN or "gemini",
        "--yolo",
        *extra_args,
    ]

    proc = subprocess.Popen(  # noqa: S603 - command is built from trusted inputs
        cmd,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        cwd=Path(__file__).resolve().parent.parent,
    )

    assert proc.stdin is not None
    assert proc.stdout is not None

    try:
        stdout, stderr = proc.communicate(":exit\n", timeout=120)
    except subprocess.TimeoutExpired:
        proc.kill()
        stdout, stderr = proc.communicate()
        pytest.fail(_format_failure("Gemini example timed out", stdout, stderr), pytrace=False)

    combined = f"{stdout}\n{stderr}"
    if proc.returncode != 0:
        auth_errors = (
            "Authentication failed",
            "Authentication required",
            "GOOGLE_CLOUD_PROJECT",
        )
        if any(token in combined for token in auth_errors):
            pytest.skip(f"Gemini CLI authentication required:\n{combined}")
        pytest.fail(
            _format_failure(f"Gemini example exited with {proc.returncode}", stdout, stderr),
            pytrace=False,
        )

    assert "Connected to Gemini" in combined or "✅ Connected to Gemini" in combined


def _format_failure(prefix: str, stdout: str, stderr: str) -> str:
    return f"{prefix}.\nstdout:\n{stdout}\nstderr:\n{stderr}"
````

## File: tests/test_golden.py
````python
from __future__ import annotations

import json
from collections.abc import Callable
from pathlib import Path

import pytest
from pydantic import BaseModel

from acp import (
    audio_block,
    embedded_blob_resource,
    embedded_text_resource,
    image_block,
    plan_entry,
    resource_block,
    resource_link_block,
    start_edit_tool_call,
    start_read_tool_call,
    start_tool_call,
    text_block,
    tool_content,
    tool_diff_content,
    tool_terminal_ref,
    update_agent_message_text,
    update_agent_thought_text,
    update_plan,
    update_tool_call,
    update_user_message_text,
)
from acp.schema import (
    AgentMessageChunk,
    AgentPlanUpdate,
    AgentThoughtChunk,
    AllowedOutcome,
    AudioContentBlock,
    CancelNotification,
    ConfigOptionUpdate,
    ContentToolCallContent,
    DeniedOutcome,
    EmbeddedResourceContentBlock,
    FileEditToolCallContent,
    ImageContentBlock,
    InitializeRequest,
    InitializeResponse,
    NewSessionRequest,
    NewSessionResponse,
    PromptRequest,
    ReadTextFileRequest,
    ReadTextFileResponse,
    RequestPermissionRequest,
    RequestPermissionResponse,
    ResourceContentBlock,
    SetSessionConfigOptionResponse,
    SetSessionConfigOptionSelectRequest,
    TerminalToolCallContent,
    TextContentBlock,
    ToolCallLocation,
    ToolCallProgress,
    ToolCallStart,
    UserMessageChunk,
    WriteTextFileRequest,
)

GOLDEN_DIR = Path(__file__).parent / "golden"

# Map each golden fixture to the concrete schema model it should conform to.
GOLDEN_CASES: dict[str, type[BaseModel]] = {
    "cancel_notification": CancelNotification,
    "content_audio": AudioContentBlock,
    "content_image": ImageContentBlock,
    "content_resource_blob": EmbeddedResourceContentBlock,
    "content_resource_link": ResourceContentBlock,
    "content_resource_text": EmbeddedResourceContentBlock,
    "content_text": TextContentBlock,
    "fs_read_text_file_request": ReadTextFileRequest,
    "fs_read_text_file_response": ReadTextFileResponse,
    "fs_write_text_file_request": WriteTextFileRequest,
    "initialize_request": InitializeRequest,
    "initialize_response": InitializeResponse,
    "new_session_request": NewSessionRequest,
    "new_session_response": NewSessionResponse,
    "permission_outcome_cancelled": DeniedOutcome,
    "permission_outcome_selected": AllowedOutcome,
    "prompt_request": PromptRequest,
    "request_permission_request": RequestPermissionRequest,
    "request_permission_response_selected": RequestPermissionResponse,
    "session_update_agent_message_chunk": AgentMessageChunk,
    "session_update_agent_thought_chunk": AgentThoughtChunk,
    "session_update_config_option_update": ConfigOptionUpdate,
    "session_update_plan": AgentPlanUpdate,
    "session_update_tool_call": ToolCallStart,
    "session_update_tool_call_edit": ToolCallStart,
    "session_update_tool_call_locations_rawinput": ToolCallStart,
    "session_update_tool_call_read": ToolCallStart,
    "session_update_tool_call_update_content": ToolCallProgress,
    "session_update_tool_call_update_more_fields": ToolCallProgress,
    "session_update_user_message_chunk": UserMessageChunk,
    "set_session_config_option_request": SetSessionConfigOptionSelectRequest,
    "set_session_config_option_response": SetSessionConfigOptionResponse,
    "tool_content_content_text": ContentToolCallContent,
    "tool_content_diff": FileEditToolCallContent,
    "tool_content_diff_no_old": FileEditToolCallContent,
    "tool_content_terminal": TerminalToolCallContent,
}

_PARAMS = tuple(sorted(GOLDEN_CASES.items()))
_PARAM_IDS = [name for name, _ in _PARAMS]

GOLDEN_BUILDERS: dict[str, Callable[[], BaseModel]] = {
    "content_text": lambda: text_block("What's the weather like today?"),
    "content_image": lambda: image_block("iVBORw0KGgoAAAANSUhEUgAAAAEAAAAB...", "image/png"),
    "content_audio": lambda: audio_block("UklGRiQAAABXQVZFZm10IBAAAAABAAEAQB8AAAB...", "audio/wav"),
    "content_resource_text": lambda: resource_block(
        embedded_text_resource(
            "file:///home/user/script.py",
            "def hello():\n    print('Hello, world!')",
            mime_type="text/x-python",
        )
    ),
    "content_resource_blob": lambda: resource_block(
        embedded_blob_resource(
            "file:///home/user/document.pdf",
            "<b64>",
            mime_type="application/pdf",
        )
    ),
    "content_resource_link": lambda: resource_link_block(
        "document.pdf",
        "file:///home/user/document.pdf",
        mime_type="application/pdf",
        size=1_024_000,
    ),
    "tool_content_content_text": lambda: tool_content(text_block("Analysis complete. Found 3 issues.")),
    "tool_content_diff": lambda: tool_diff_content(
        "/home/user/project/src/config.json",
        '{\n  "debug": true\n}',
        '{\n  "debug": false\n}',
    ),
    "tool_content_diff_no_old": lambda: tool_diff_content(
        "/home/user/project/src/config.json",
        '{\n  "debug": true\n}',
    ),
    "tool_content_terminal": lambda: tool_terminal_ref("term_001"),
    "session_update_user_message_chunk": lambda: update_user_message_text("What's the capital of France?"),
    "session_update_agent_message_chunk": lambda: update_agent_message_text("The capital of France is Paris."),
    "session_update_agent_thought_chunk": lambda: update_agent_thought_text("Thinking about best approach..."),
    "session_update_plan": lambda: update_plan([
        plan_entry(
            "Check for syntax errors",
            priority="high",
            status="pending",
        ),
        plan_entry(
            "Identify potential type issues",
            priority="medium",
            status="pending",
        ),
    ]),
    "session_update_tool_call": lambda: start_tool_call(
        "call_001",
        "Reading configuration file",
        kind="read",
        status="pending",
    ),
    "session_update_tool_call_read": lambda: start_read_tool_call(
        "call_001",
        "Reading configuration file",
        "/home/user/project/src/config.json",
    ),
    "session_update_tool_call_edit": lambda: start_edit_tool_call(
        "call_003",
        "Apply edit",
        "/home/user/project/src/config.json",
        "print('hello')",
    ),
    "session_update_tool_call_locations_rawinput": lambda: start_tool_call(
        "call_lr",
        "Tracking file",
        locations=[ToolCallLocation(path="/home/user/project/src/config.json")],
        raw_input={"path": "/home/user/project/src/config.json"},
    ),
    "session_update_tool_call_update_content": lambda: update_tool_call(
        "call_001",
        status="in_progress",
        content=[tool_content(text_block("Found 3 configuration files..."))],
    ),
    "session_update_tool_call_update_more_fields": lambda: update_tool_call(
        "call_010",
        title="Processing changes",
        kind="edit",
        status="completed",
        locations=[ToolCallLocation(path="/home/user/project/src/config.json")],
        raw_input={"path": "/home/user/project/src/config.json"},
        raw_output={"result": "ok"},
        content=[tool_content(text_block("Edit completed."))],
    ),
}

_HELPER_PARAMS = tuple(sorted(GOLDEN_BUILDERS.items()))
_HELPER_IDS = [name for name, _ in _HELPER_PARAMS]


def _load_golden(name: str) -> dict:
    path = GOLDEN_DIR / f"{name}.json"
    return json.loads(path.read_text())


def _dump_model(model: BaseModel) -> dict:
    return model.model_dump(mode="json", by_alias=True, exclude_none=True, exclude_unset=True)


def test_golden_cases_covered() -> None:
    available = {path.stem for path in GOLDEN_DIR.glob("*.json")}
    assert available == set(GOLDEN_CASES), "Add the new golden file to GOLDEN_CASES."


@pytest.mark.parametrize(
    ("name", "model_cls"),
    _PARAMS,
    ids=_PARAM_IDS,
)
def test_json_golden_roundtrip(name: str, model_cls: type[BaseModel]) -> None:
    raw = _load_golden(name)
    model = model_cls.model_validate(raw)
    assert _dump_model(model) == raw


@pytest.mark.parametrize(
    ("name", "builder"),
    _HELPER_PARAMS,
    ids=_HELPER_IDS,
)
def test_helpers_match_golden(name: str, builder: Callable[[], BaseModel]) -> None:
    raw = _load_golden(name)
    model = builder()
    assert isinstance(model, BaseModel)
    assert _dump_model(model) == raw
````

## File: tests/test_rpc.py
````python
import asyncio
import json
import sys
from pathlib import Path
from typing import Any

import pytest

from acp import (
    Agent,
    AuthenticateResponse,
    Client,
    CreateTerminalResponse,
    InitializeResponse,
    LoadSessionResponse,
    NewSessionResponse,
    PromptRequest,
    PromptResponse,
    RequestPermissionRequest,
    RequestPermissionResponse,
    SetSessionConfigOptionResponse,
    SetSessionModeResponse,
    WriteTextFileResponse,
    spawn_agent_process,
    start_tool_call,
    update_agent_message_text,
    update_tool_call,
)
from acp.connection import Connection
from acp.core import AgentSideConnection, ClientSideConnection
from acp.schema import (
    AgentMessageChunk,
    AllowedOutcome,
    AudioContentBlock,
    ClientCapabilities,
    DeniedOutcome,
    EmbeddedResourceContentBlock,
    EnvVariable,
    HttpMcpServer,
    ImageContentBlock,
    Implementation,
    ListSessionsResponse,
    McpServerStdio,
    PermissionOption,
    ResourceContentBlock,
    SseMcpServer,
    TextContentBlock,
    ToolCallLocation,
    ToolCallProgress,
    ToolCallStart,
    ToolCallUpdate,
    UserMessageChunk,
)
from tests.conftest import TestClient

# ------------------------ Tests --------------------------


@pytest.mark.asyncio
async def test_initialize_and_new_session(connect):
    _, agent_conn = connect()

    resp = await agent_conn.initialize(protocol_version=1)
    assert isinstance(resp, InitializeResponse)
    assert resp.protocol_version == 1

    new_sess = await agent_conn.new_session(mcp_servers=[], cwd="/test")
    assert new_sess.session_id == "test-session-123"

    load_resp = await agent_conn.load_session(session_id=new_sess.session_id, cwd="/test", mcp_servers=[])
    assert isinstance(load_resp, LoadSessionResponse)

    auth_resp = await agent_conn.authenticate(method_id="password")
    assert isinstance(auth_resp, AuthenticateResponse)

    mode_resp = await agent_conn.set_session_mode(session_id=new_sess.session_id, mode_id="ask")
    assert isinstance(mode_resp, SetSessionModeResponse)


@pytest.mark.asyncio
async def test_bidirectional_file_ops(client, connect):
    client.files["/test/file.txt"] = "Hello, World!"
    client_conn, _ = connect()

    # Agent asks client to read
    res = await client_conn.read_text_file(session_id="sess", path="/test/file.txt")
    assert res.content == "Hello, World!"

    # Agent asks client to write
    write_result = await client_conn.write_text_file(session_id="sess", path="/test/file.txt", content="Updated")
    assert isinstance(write_result, WriteTextFileResponse)
    assert client.files["/test/file.txt"] == "Updated"


@pytest.mark.asyncio
async def test_cancel_notification_and_capture_wire(connect, agent):
    _, agent_conn = connect()
    # Send cancel notification from client-side connection to agent
    await agent_conn.cancel(session_id="test-123")

    # Read raw line from server peer (it will be consumed by agent receive loop quickly).
    # Instead, wait a brief moment and assert agent recorded it.
    for _ in range(50):
        if agent.cancellations:
            break
        await asyncio.sleep(0.01)
    assert agent.cancellations == ["test-123"]


@pytest.mark.asyncio
async def test_session_notifications_flow(connect, client):
    client_conn, _ = connect()

    # Agent -> Client notifications
    await client_conn.session_update(
        session_id="sess",
        update=AgentMessageChunk(
            session_update="agent_message_chunk",
            content=TextContentBlock(type="text", text="Hello"),
        ),
    )
    await client_conn.session_update(
        session_id="sess",
        update=UserMessageChunk(
            session_update="user_message_chunk",
            content=TextContentBlock(type="text", text="World"),
        ),
    )

    # Wait for async dispatch
    for _ in range(50):
        if len(client.notifications) >= 2:
            break
        await asyncio.sleep(0.01)
    assert len(client.notifications) >= 2
    assert client.notifications[0].session_id == "sess"


@pytest.mark.asyncio
async def test_on_connect_create_terminal_handle(server):
    class _TerminalAgent(Agent):
        __test__ = False

        def __init__(self) -> None:
            self._conn: Client | None = None
            self.handle_id: str | None = None

        def on_connect(self, conn: Client) -> None:
            self._conn = conn

        async def prompt(
            self,
            prompt: list[TextContentBlock],
            session_id: str,
            **kwargs: Any,
        ) -> PromptResponse:
            assert self._conn is not None
            handle = await self._conn.create_terminal(command="echo", session_id=session_id)
            self.handle_id = handle.terminal_id
            return PromptResponse(stop_reason="end_turn")

    class _TerminalClient(TestClient):
        __test__ = False

        async def create_terminal(
            self,
            command: str,
            session_id: str,
            args: list[str] | None = None,
            cwd: str | None = None,
            env: list[EnvVariable] | None = None,
            output_byte_limit: int | None = None,
            **kwargs: Any,
        ) -> CreateTerminalResponse:
            return CreateTerminalResponse(terminal_id="term-123")

    agent = _TerminalAgent()
    client = _TerminalClient()
    agent_conn = AgentSideConnection(agent, server.server_writer, server.server_reader, listening=True)
    client_conn = ClientSideConnection(client, server.client_writer, server.client_reader)

    await client_conn.prompt(session_id="sess", prompt=[TextContentBlock(type="text", text="start")])
    assert agent.handle_id == "term-123"

    await client_conn.close()
    await agent_conn.close()


@pytest.mark.asyncio
async def test_concurrent_reads(connect, client):
    for i in range(5):
        client.files[f"/test/file{i}.txt"] = f"Content {i}"
    client_conn, _ = connect()

    async def read_one(i: int):
        return await client_conn.read_text_file(session_id="sess", path=f"/test/file{i}.txt")

    results = await asyncio.gather(*(read_one(i) for i in range(5)))
    for i, res in enumerate(results):
        assert res.content == f"Content {i}"


@pytest.mark.asyncio
async def test_pending_request_fails_when_remote_sends_eof(server):
    conn = Connection(lambda method, params, is_notification: None, server.client_writer, server.client_reader)
    request = asyncio.create_task(conn.send_request("ping", {"value": 1}))

    await asyncio.sleep(0.05)
    server.server_writer.close()
    await server.server_writer.wait_closed()

    with pytest.raises(ConnectionError, match="Connection closed"):
        await asyncio.wait_for(request, timeout=1.0)

    await conn.close()


@pytest.mark.asyncio
async def test_new_requests_fail_fast_after_remote_eof(server):
    conn = Connection(lambda method, params, is_notification: None, server.client_writer, server.client_reader)

    server.server_writer.close()
    await server.server_writer.wait_closed()
    await asyncio.sleep(0.05)

    with pytest.raises(ConnectionError, match="Connection closed"):
        await asyncio.wait_for(conn.send_request("ping", {"value": 1}), timeout=1.0)

    await conn.close()


@pytest.mark.asyncio
async def test_invalid_params_results_in_error_response(connect, server):
    # Only start agent-side (server) so we can inject raw request from client socket
    connect(connect_agent=True, connect_client=False)

    # Send initialize with wrong param type (protocolVersion should be int)
    req = {"jsonrpc": "2.0", "id": 1, "method": "initialize", "params": {"protocolVersion": "oops"}}
    server.client_writer.write((json.dumps(req) + "\n").encode())
    await server.client_writer.drain()

    # Read response
    line = await asyncio.wait_for(server.client_reader.readline(), timeout=1)
    resp = json.loads(line)
    assert resp["id"] == 1
    assert "error" in resp
    assert resp["error"]["code"] == -32602  # invalid params


@pytest.mark.asyncio
async def test_method_not_found_results_in_error_response(connect, server):
    connect(connect_agent=True, connect_client=False)

    req = {"jsonrpc": "2.0", "id": 2, "method": "unknown/method", "params": {}}
    server.client_writer.write((json.dumps(req) + "\n").encode())
    await server.client_writer.drain()

    line = await asyncio.wait_for(server.client_reader.readline(), timeout=1)
    resp = json.loads(line)
    assert resp["id"] == 2
    assert resp["error"]["code"] == -32601  # method not found


@pytest.mark.asyncio
async def test_set_session_mode_and_extensions(connect, agent, client):
    client_conn, agent_conn = connect()

    # setSessionMode
    resp = await agent_conn.set_session_mode(session_id="sess", mode_id="yolo")
    assert isinstance(resp, SetSessionModeResponse)

    # extMethod
    echo = await agent_conn.ext_method("example.com/echo", {"x": 1})
    assert echo == {"echo": {"x": 1}}

    # extNotification
    await agent_conn.ext_notification("note", {"y": 2})
    # allow dispatch
    await asyncio.sleep(0.05)
    assert agent.ext_notes and agent.ext_notes[-1][0] == "note"

    # client extension method
    ping = await client_conn.ext_method("example.com/ping", {"k": 3})
    assert ping == {"response": "pong", "params": {"k": 3}}
    assert client.ext_calls and client.ext_calls[-1] == ("example.com/ping", {"k": 3})


@pytest.mark.asyncio
async def test_set_config_option(connect, agent, client):
    _, agent_conn = connect()

    resp = await agent_conn.set_config_option(session_id="sess", config_id="theme", value="dark")
    assert isinstance(resp, SetSessionConfigOptionResponse)
    assert resp.config_options == []
    assert agent.config_option_calls == [("theme", "sess", "dark")]


@pytest.mark.asyncio
async def test_set_config_option_boolean(connect, agent, client):
    _, agent_conn = connect()

    resp = await agent_conn.set_config_option(session_id="sess", config_id="brave_mode", value=True)
    assert isinstance(resp, SetSessionConfigOptionResponse)
    assert resp.config_options == []
    assert agent.config_option_calls == [("brave_mode", "sess", True)]


@pytest.mark.asyncio
async def test_prompt_message_id_roundtrip(connect, agent, client):
    _, agent_conn = connect()

    resp = await agent_conn.prompt(
        session_id="sess",
        prompt=[TextContentBlock(type="text", text="hello")],
        message_id="123e4567-e89b-12d3-a456-426614174000",
    )
    assert isinstance(resp, PromptResponse)
    assert agent.prompts[-1].message_id == "123e4567-e89b-12d3-a456-426614174000"


@pytest.mark.asyncio
async def test_list_sessions_stable(connect, agent, client):
    _, agent_conn = connect()

    resp = await agent_conn.list_sessions()
    assert isinstance(resp, ListSessionsResponse)
    assert resp.sessions == []


@pytest.mark.asyncio
async def test_ignore_invalid_messages(connect, server):
    connect(connect_agent=True, connect_client=False)

    # Message without id and method
    msg1 = {"jsonrpc": "2.0"}
    server.client_writer.write((json.dumps(msg1) + "\n").encode())
    await server.client_writer.drain()

    # Message without jsonrpc and without id/method
    msg2 = {"foo": "bar"}
    server.client_writer.write((json.dumps(msg2) + "\n").encode())
    await server.client_writer.drain()

    # Should not receive any response lines
    with pytest.raises(asyncio.TimeoutError):
        await asyncio.wait_for(server.client_reader.readline(), timeout=0.1)


class _ExampleAgent(Agent):
    __test__ = False

    def __init__(self) -> None:
        self._conn: Client | None = None
        self.permission_response: RequestPermissionResponse | None = None
        self.prompt_requests: list[PromptRequest] = []

    def on_connect(self, conn: Client) -> None:
        self._conn = conn

    async def initialize(
        self,
        protocol_version: int,
        client_capabilities: ClientCapabilities | None = None,
        client_info: Implementation | None = None,
        **kwargs: Any,
    ) -> InitializeResponse:
        return InitializeResponse(protocol_version=protocol_version)

    async def new_session(
        self, cwd: str, mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio], **kwargs: Any
    ) -> NewSessionResponse:
        return NewSessionResponse(session_id="sess_demo")

    async def prompt(
        self,
        prompt: list[
            TextContentBlock
            | ImageContentBlock
            | AudioContentBlock
            | ResourceContentBlock
            | EmbeddedResourceContentBlock
        ],
        session_id: str,
        **kwargs: Any,
    ) -> PromptResponse:
        assert self._conn is not None
        self.prompt_requests.append(PromptRequest(prompt=prompt, session_id=session_id, field_meta=kwargs or None))

        await self._conn.session_update(
            session_id,
            update_agent_message_text("I'll help you with that."),
        )

        await self._conn.session_update(
            session_id,
            start_tool_call(
                "call_1",
                "Modifying configuration",
                kind="edit",
                status="pending",
                locations=[ToolCallLocation(path="/project/config.json")],
                raw_input={"path": "/project/config.json"},
            ),
        )

        permission_request = {
            "session_id": session_id,
            "tool_call": ToolCallUpdate(
                tool_call_id="call_1",
                title="Modifying configuration",
                kind="edit",
                status="pending",
                locations=[ToolCallLocation(path="/project/config.json")],
                raw_input={"path": "/project/config.json"},
            ),
            "options": [
                PermissionOption(kind="allow_once", name="Allow", option_id="allow"),
                PermissionOption(kind="reject_once", name="Reject", option_id="reject"),
            ],
        }
        response = await self._conn.request_permission(**permission_request)
        self.permission_response = response

        if isinstance(response.outcome, AllowedOutcome) and response.outcome.option_id == "allow":
            await self._conn.session_update(
                session_id,
                update_tool_call(
                    "call_1",
                    status="completed",
                    raw_output={"success": True},
                ),
            )
            await self._conn.session_update(
                session_id,
                update_agent_message_text("Done."),
            )

        return PromptResponse(stop_reason="end_turn")


class _ExampleClient(TestClient):
    __test__ = False

    def __init__(self) -> None:
        super().__init__()
        self.permission_requests: list[RequestPermissionRequest] = []

    async def request_permission(
        self,
        options: list[PermissionOption] | RequestPermissionRequest,
        session_id: str | None = None,
        tool_call: ToolCallUpdate | None = None,
        **kwargs: Any,
    ) -> RequestPermissionResponse:
        if isinstance(options, RequestPermissionRequest):
            params = options
        else:
            assert session_id is not None and tool_call is not None
            params = RequestPermissionRequest(
                options=options,
                session_id=session_id,
                tool_call=tool_call,
                field_meta=kwargs or None,
            )
        self.permission_requests.append(params)
        if not params.options:
            return RequestPermissionResponse(outcome=DeniedOutcome(outcome="cancelled"))
        option = params.options[0]
        return RequestPermissionResponse(outcome=AllowedOutcome(option_id=option.option_id, outcome="selected"))


@pytest.mark.asyncio
@pytest.mark.parametrize("agent,client", [(_ExampleAgent(), _ExampleClient())])
async def test_example_agent_permission_flow(connect, client, agent):
    _, agent_conn = connect()

    init = await agent_conn.initialize(protocol_version=1)
    assert init.protocol_version == 1

    session = await agent_conn.new_session(mcp_servers=[], cwd="/workspace")
    assert session.session_id == "sess_demo"

    resp = await agent_conn.prompt(
        session_id=session.session_id,
        prompt=[TextContentBlock(type="text", text="Please edit config")],
    )
    assert resp.stop_reason == "end_turn"
    for _ in range(50):
        if len(client.notifications) >= 4:
            break
        await asyncio.sleep(0.02)

    assert len(client.notifications) >= 4
    session_updates = [getattr(note.update, "session_update", None) for note in client.notifications]
    assert session_updates[:4] == ["agent_message_chunk", "tool_call", "tool_call_update", "agent_message_chunk"]

    first_message = client.notifications[0].update
    assert isinstance(first_message, AgentMessageChunk)
    assert isinstance(first_message.content, TextContentBlock)
    assert first_message.content.text == "I'll help you with that."

    tool_call = client.notifications[1].update
    assert isinstance(tool_call, ToolCallStart)
    assert tool_call.title == "Modifying configuration"
    assert tool_call.status == "pending"

    tool_update = client.notifications[2].update
    assert isinstance(tool_update, ToolCallProgress)
    assert tool_update.status == "completed"
    assert tool_update.raw_output == {"success": True}

    final_message = client.notifications[3].update
    assert isinstance(final_message, AgentMessageChunk)
    assert isinstance(final_message.content, TextContentBlock)
    assert final_message.content.text == "Done."

    assert len(client.permission_requests) == 1
    options = client.permission_requests[0].options
    assert [opt.option_id for opt in options] == ["allow", "reject"]

    assert agent.permission_response is not None
    assert isinstance(agent.permission_response.outcome, AllowedOutcome)
    assert agent.permission_response.outcome.option_id == "allow"


@pytest.mark.asyncio
async def test_spawn_agent_process_roundtrip(tmp_path):
    script = Path(__file__).parents[1] / "examples" / "echo_agent.py"
    assert script.exists()

    test_client = TestClient()

    async with spawn_agent_process(test_client, sys.executable, str(script)) as (client_conn, process):
        init = await client_conn.initialize(protocol_version=1)
        assert isinstance(init, InitializeResponse)
        session = await client_conn.new_session(mcp_servers=[], cwd=str(tmp_path))
        await client_conn.prompt(
            session_id=session.session_id,
            prompt=[TextContentBlock(type="text", text="hi spawn")],
        )

        # Wait for echo agent notification to arrive
        for _ in range(50):
            if test_client.notifications:
                break
            await asyncio.sleep(0.02)

        assert test_client.notifications

    assert process.returncode is not None
````

## File: tests/test_unstable.py
````python
from typing import Any

import pytest

from acp.exceptions import RequestError
from acp.schema import (
    CloseSessionResponse,
    ForkSessionResponse,
    HttpMcpServer,
    ListSessionsResponse,
    McpServerStdio,
    ResumeSessionResponse,
    SetSessionModelResponse,
    SseMcpServer,
)
from tests.conftest import TestAgent


class UnstableAgent(TestAgent):
    async def list_sessions(self, cursor: str | None = None, cwd: str | None = None, **kwargs) -> ListSessionsResponse:
        return ListSessionsResponse(sessions=[])

    async def close_session(self, session_id: str, **kwargs) -> CloseSessionResponse | None:
        return CloseSessionResponse()

    async def set_session_model(self, model_id: str, session_id: str, **kwargs: Any) -> SetSessionModelResponse | None:
        return SetSessionModelResponse()

    async def fork_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> ForkSessionResponse:
        return ForkSessionResponse(session_id="forked_sess")

    async def resume_session(
        self,
        cwd: str,
        session_id: str,
        mcp_servers: list[HttpMcpServer | SseMcpServer | McpServerStdio] | None = None,
        **kwargs: Any,
    ) -> ResumeSessionResponse:
        return ResumeSessionResponse()


@pytest.mark.parametrize("agent", [UnstableAgent()])
@pytest.mark.asyncio
async def test_call_unstable_protocol(connect):
    _, agent_conn = connect(use_unstable_protocol=True)

    resp = await agent_conn.list_sessions()
    assert isinstance(resp, ListSessionsResponse)

    resp = await agent_conn.set_session_model(session_id="sess", model_id="gpt-4o-mini")
    assert isinstance(resp, SetSessionModelResponse)

    resp = await agent_conn.fork_session(cwd="/workspace", session_id="sess")
    assert isinstance(resp, ForkSessionResponse)

    resp = await agent_conn.resume_session(cwd="/workspace", session_id="sess")
    assert isinstance(resp, ResumeSessionResponse)

    resp = await agent_conn.close_session(session_id="sess")
    assert isinstance(resp, CloseSessionResponse)


@pytest.mark.parametrize("agent", [UnstableAgent()])
@pytest.mark.asyncio
async def test_call_unstable_protocol_warning(connect):
    _, agent_conn = connect(use_unstable_protocol=False)

    with pytest.warns(UserWarning) as record:
        with pytest.raises(RequestError):
            await agent_conn.set_session_model(session_id="sess", model_id="gpt-4o-mini")
        assert len(record) == 1

    with pytest.warns(UserWarning) as record:
        with pytest.raises(RequestError):
            await agent_conn.close_session(session_id="sess")
        assert len(record) == 1
````

## File: tests/test_utils.py
````python
import pytest

from acp.schema import (
    AgentMessageChunk,
    SetSessionConfigOptionBooleanRequest,
    SetSessionConfigOptionSelectRequest,
    TextContentBlock,
)
from acp.utils import serialize_params


def test_serialize_params_uses_meta_aliases() -> None:
    chunk = AgentMessageChunk(
        session_update="agent_message_chunk",
        content=TextContentBlock(type="text", text="demo", field_meta={"inner": "value"}),
        field_meta={"outer": "value"},
    )

    payload = serialize_params(chunk)

    assert payload["_meta"] == {"outer": "value"}
    assert payload["content"]["_meta"] == {"inner": "value"}


def test_serialize_params_omits_meta_when_absent() -> None:
    chunk = AgentMessageChunk(
        session_update="agent_message_chunk",
        content=TextContentBlock(type="text", text="demo"),
    )

    payload = serialize_params(chunk)

    assert "_meta" not in payload
    assert "_meta" not in payload["content"]


def test_field_meta_can_be_set_by_name_on_models() -> None:
    chunk = AgentMessageChunk(
        session_update="agent_message_chunk",
        content=TextContentBlock(type="text", text="demo", field_meta={"inner": "value"}),
        field_meta={"outer": "value"},
    )

    assert chunk.field_meta == {"outer": "value"}
    assert chunk.content.field_meta == {"inner": "value"}


def test_serialize_params_uses_boolean_config_variant() -> None:
    request = SetSessionConfigOptionBooleanRequest(
        config_id="brave_mode",
        session_id="sess",
        type="boolean",
        value=True,
    )

    payload = serialize_params(request)

    assert payload == {
        "configId": "brave_mode",
        "sessionId": "sess",
        "type": "boolean",
        "value": True,
    }


def test_serialize_params_uses_select_config_variant() -> None:
    request = SetSessionConfigOptionSelectRequest(
        config_id="theme",
        session_id="sess",
        value="dark",
    )

    payload = serialize_params(request)

    assert payload == {
        "configId": "theme",
        "sessionId": "sess",
        "value": "dark",
    }


@pytest.mark.parametrize(
    "original, expected",
    [
        ("simple_test", "simpleTest"),
        ("another_example_here", "anotherExampleHere"),
        ("lowercase", "lowercase"),
        ("alreadyCamelCase", "alreadyCamelCase"),
    ],
)
def test_to_camel_case(original, expected) -> None:
    from acp.utils import to_camel_case

    assert to_camel_case(original) == expected
````

## File: .gitignore
````
docs/source

# From https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore

# Byte-compiled / optimized / DLL files
__pycache__/
*.py[codz]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py.cover
.hypothesis/
.pytest_cache/
cover/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
.pybuilder/
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
#   For a library or package, you might want to ignore these files since the code is
#   intended to run in multiple environments; otherwise, check them in:
# .python-version

# pipenv
#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
#   However, in case of collaboration, if having platform-specific dependencies or dependencies
#   having no cross-platform support, pipenv may install dependencies that don't work, or not
#   install all needed dependencies.
#Pipfile.lock

# UV
#   Similar to Pipfile.lock, it is generally recommended to include uv.lock in version control.
#   This is especially recommended for binary packages to ensure reproducibility, and is more
#   commonly ignored for libraries.
#uv.lock

# poetry
#   Similar to Pipfile.lock, it is generally recommended to include poetry.lock in version control.
#   This is especially recommended for binary packages to ensure reproducibility, and is more
#   commonly ignored for libraries.
#   https://python-poetry.org/docs/basic-usage/#commit-your-poetrylock-file-to-version-control
#poetry.lock
#poetry.toml

# pdm
#   Similar to Pipfile.lock, it is generally recommended to include pdm.lock in version control.
#   pdm recommends including project-wide configuration in pdm.toml, but excluding .pdm-python.
#   https://pdm-project.org/en/latest/usage/project/#working-with-version-control
#pdm.lock
#pdm.toml
.pdm-python
.pdm-build/

# pixi
#   Similar to Pipfile.lock, it is generally recommended to include pixi.lock in version control.
#pixi.lock
#   Pixi creates a virtual environment in the .pixi directory, just like venv module creates one
#   in the .venv directory. It is recommended not to include this directory in version control.
.pixi

# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.envrc
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# pytype static type analyzer
.pytype/

# Cython debug symbols
cython_debug/

# PyCharm
#  JetBrains specific template is maintained in a separate JetBrains.gitignore that can
#  be found at https://github.com/github/gitignore/blob/main/Global/JetBrains.gitignore
#  and can be added to the global gitignore or merged into this file.  For a more nuclear
#  option (not recommended) you can uncomment the following to ignore the entire idea folder.
#.idea/

# Abstra
# Abstra is an AI-powered process automation framework.
# Ignore directories containing user credentials, local state, and settings.
# Learn more at https://abstra.io/docs
.abstra/

# Visual Studio Code
#  Visual Studio Code specific template is maintained in a separate VisualStudioCode.gitignore
#  that can be found at https://github.com/github/gitignore/blob/main/Global/VisualStudioCode.gitignore
#  and can be added to the global gitignore or merged into this file. However, if you prefer,
#  you could uncomment the following to ignore the entire vscode folder
# .vscode/

# Ruff stuff:
.ruff_cache/

# PyPI configuration file
.pypirc

# Cursor
#  Cursor is an AI-powered code editor. `.cursorignore` specifies files/directories to
#  exclude from AI features like autocomplete and code analysis. Recommended for sensitive data
#  refer to https://docs.cursor.com/context/ignore-files
.cursorignore
.cursorindexingignore

# Marimo
marimo/_static/
marimo/_lsp/
__marimo__/

# .zed
.zed/

# others
reference/
.DS_Store
````

## File: .pre-commit-config.yaml
````yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: "v5.0.0"
    hooks:
      - id: check-case-conflict
      - id: check-merge-conflict
      - id: check-toml
      - id: check-yaml
      - id: check-json
        exclude: ^.devcontainer/devcontainer.json
      - id: pretty-format-json
        exclude: ^.devcontainer/devcontainer.json
        args: [--autofix, --no-sort-keys]
      - id: end-of-file-fixer
      - id: trailing-whitespace

  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: "v0.12.7"
    hooks:
      - id: ruff-check
        args: [ --exit-non-zero-on-fix ]
        exclude: ^src/acp/(meta|schema)\.py$
      - id: ruff-format
````

## File: AGENTS.md
````markdown
# Repository Handbook

Use this page as the quick orientation for the Python SDK repo. It mirrors the tone of the main README/index and surfaces what you need without hunting through multiple docs.

## Repo Map

| Path | Why it exists |
| --- | --- |
| `src/acp/` | Runtime package: agent/client bases, transports, helpers, schema bindings, contrib utilities |
| `schema/` | Upstream JSON schema sources (regenerate with `make gen-all`) |
| `examples/` | Runnable scripts such as `echo_agent.py`, `client.py`, `gemini.py`, `duet.py` |
| `tests/` | Pytest suite, including optional Gemini smoke tests in `tests/test_gemini_example.py` |
| `docs/` | MkDocs content published at `agentclientprotocol.github.io/python-sdk/` |

## Daily Commands

| Need | Command |
| --- | --- |
| Bootstrap env + pre-commit | `make install` |
| Format, lint, types, deps | `make check` |
| Test suite (pytest + doctest) | `make test` |
| Regenerate schema + bindings | `ACP_SCHEMA_VERSION=<tag> make gen-all` |

## Style Guardrails

- Target Python 3.10+ and keep public APIs typed.
- Ruff handles formatting + linting (`uv run ruff format` / `check`)—keep both clean before pushing.
- Reach for the generated Pydantic models and helpers (e.g. `text_block`, `start_tool_call`) instead of hand-crafting dicts; helpers stay aligned with the schema via `tests/test_golden.py`.
- Place reusable internals in `_`-prefixed modules.

## Testing Expectations

- Tests live under `tests/` and follow the `test_*.py` naming. Mark async tests with `pytest.mark.asyncio`.
- Run `make test` (or `uv run python -m pytest`) before committing and include reproduction steps for new fixtures.
- Gemini CLI checks are opt-in: set `ACP_ENABLE_GEMINI_TESTS=1` and optionally `ACP_GEMINI_BIN=/path/to/gemini` to exercise `tests/test_gemini_example.py`.

## PR Checklist

- Use Conventional Commit prefixes (`feat:`, `fix:`, `docs:`, etc.) and call out schema regenerations explicitly.
- Summarise exercised behaviours, link related issues, and attach `make check` / targeted pytest output in PR descriptions.
- Update docs/examples when user-visible APIs or transports change, and document any new environment requirements.

## Agent Integration Tips

- Start new agents from `examples/echo_agent.py` or `examples/agent.py`; pair them with `examples/client.py` for loopback validation.
- `spawn_agent_process` / `spawn_client_process` embed ACP parties inside Python apps without hand-wiring stdio.
- Validate new transports against `tests/test_rpc.py` and (when relevant) the Gemini example to ensure streaming + permission flows stay compliant.
````

## File: CONTRIBUTING.md
````markdown
# Contributing

Thanks for helping improve the Agent Client Protocol Python SDK! This guide mirrors the concise tone of the README/index so you can skim it quickly and get back to building.

## Ways to help

- **Report bugs** — file an issue with repro steps, OS + Python versions, and any environment toggles.
- **Improve docs/examples** — clarify workflows, add integration notes, or document a new transport.
- **Fix issues** — search for `bug` / `help wanted` labels or tackle anything that affects your integration.
- **Propose features** — describe the use case, API shape, and constraints so we can scope the work together.

## Filing great issues

When reporting a bug or requesting a feature, include:

- The ACP schema / SDK version you’re using.
- How to reproduce the behaviour (commands, inputs, expected vs. actual).
- Logs or payload snippets when available (scrub secrets).

## Local workflow

1. **Fork & clone** your GitHub fork: `git clone git@github.com:<you>/python-sdk.git`.
2. **Bootstrap tooling** inside the repo root: `make install`. This provisions `uv`, syncs deps, and installs pre-commit hooks.
3. **Create a topic branch:** `git checkout -b feat-my-improvement`.
4. **Develop + document:**
   - Keep code typed (Python 3.10+), prefer generated models/helpers over dicts.
   - Update docs/examples when user-facing behaviour shifts.
5. **Run the test gauntlet:**
   ```bash
   make check   # formatting, lint, type analysis, deps
   make test    # pytest + doctests
   ```
   Optional: `ACP_ENABLE_GEMINI_TESTS=1 make test` when you have the Gemini CLI available.
6. **(Optional) Cross-Python smoke:** `tox` if you want the same matrix CI runs.
7. **Commit + push:** `git commit -m "feat: add better tool call helper"` followed by `git push origin <branch>`.

## Pull request checklist

- [ ] PR title follows Conventional Commits.
- [ ] Tests cover the new behaviour (or the reason they’re not needed is documented).
- [ ] `make check` / `make test` output is attached or referenced.
- [ ] Docs and examples reflect user-visible changes.
- [ ] Any schema regeneration (`make gen-all`) is called out explicitly.

## Need help?

Open a discussion or ping us in the ACP Zulip if you’re stuck on design decisions, transport quirks, or schema questions. We’d rather collaborate early than rework later.
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

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright [yyyy] [name of copyright owner]

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

## File: Makefile
````makefile
.PHONY: install
install: ## Install the virtual environment and install the pre-commit hooks
	@echo "🚀 Creating virtual environment using uv"
	@uv sync
	@uv run prek install

.PHONY: gen-all
gen-all: ## Generate all code from schema
	@echo "🚀 Generating all code"
	@uv run scripts/gen_all.py
	@uv run ruff check --fix
	@uv run ruff format .

.PHONY: check
check: ## Run code quality tools.
	@echo "🚀 Checking lock file consistency with 'pyproject.toml'"
	@uv lock --locked
	@echo "🚀 Linting code: Running pre-commit via prek"
	@uv run prek run -a
	@echo "🚀 Static type checking: Running ty"
	@uv run ty check --exclude "src/acp/meta.py" --exclude "src/acp/schema.py" --exclude "examples/*.py"
	@echo "🚀 Checking for obsolete dependencies: Running deptry"
	@uv run deptry src

.PHONY: test
test: ## Test the code with pytest
	@echo "🚀 Testing code: Running pytest"
	@uv run python -m pytest --doctest-modules

.PHONY: build
build: clean-build ## Build wheel file
	@echo "🚀 Creating wheel file"
	@uvx --from build pyproject-build --installer uv

.PHONY: clean-build
clean-build: ## Clean build artifacts
	@echo "🚀 Removing build artifacts"
	@uv run python -c "import shutil; import os; shutil.rmtree('dist') if os.path.exists('dist') else None"

.PHONY: publish
publish: ## Publish a release to PyPI.
	@echo "🚀 Publishing."
	@uvx twine upload --repository-url https://upload.pypi.org/legacy/ dist/*

.PHONY: build-and-publish
build-and-publish: build publish ## Build and publish.

.PHONY: docs-test
docs-test: ## Test if documentation can be built without warnings or errors
	@uv run mkdocs build -s

.PHONY: docs
docs: ## Build and serve the documentation
	@uv run mkdocs serve

.PHONY: help
help:
	@awk -F '## ' '/^[A-Za-z_-]+:.*##/ { target = $$1; sub(/:.*/, "", target); printf "\033[36m%-20s\033[0m %s\n", target, $$2 }' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
````

## File: mkdocs.yml
````yaml
site_name: Agent Client Protocol - Python SDK
repo_url: https://github.com/agentclientprotocol/python-sdk
site_url: https://agentclientprotocol.github.io/python-sdk
site_description: A Python implement of Agent Client Protocol (ACP, by Zed Industries)
site_author: Chojan Shang
edit_uri: edit/main/docs/
repo_name: agentclientprotocol/python-sdk
copyright: Maintained by <a href="https://github.com/psiace">psiace</a>.

nav:
  - Home: index.md
  - Quick Start: quickstart.md
  - Use Cases: use-cases.md
  - Experimental Contrib: contrib.md
  - Releasing: releasing.md
  - 0.7 Migration Guide: migration-guide-0.7.md
  - 0.8 Migration Guide: migration-guide-0.8.md
plugins:
  - search
  - mkdocstrings:
      handlers:
        python:
          paths: ["src/acp"]
theme:
  name: material
  feature:
    tabs: true
  palette:
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: white
      accent: deep orange
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: black
      accent: deep orange
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  icon:
    repo: fontawesome/brands/github

extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/agentclientprotocol/python-sdk
    - icon: fontawesome/brands/python
      link: https://pypi.org/project/agent-client-protocol

markdown_extensions:
  - toc:
      permalink: true
  - pymdownx.arithmatex:
      generic: true
````

## File: pyproject.toml
````toml
[project]
name = "agent-client-protocol"
version = "0.9.0"
description = "A Python implement of Agent Client Protocol (ACP, by Zed Industries)"
authors = [
    { name = "Chojan Shang", email = "psiace@apache.org" },
    { name = "Frost Ming", email = "me@frostming.com" },
]
readme = "README.md"
keywords = ['python']
requires-python = ">=3.10,<3.15"
classifiers = [
    "Intended Audience :: Developers",
    "Programming Language :: Python",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.10",
    "Programming Language :: Python :: 3.11",
    "Programming Language :: Python :: 3.12",
    "Programming Language :: Python :: 3.13",
    "Programming Language :: Python :: 3.14",
    "Topic :: Software Development :: Libraries :: Python Modules",
]
dependencies = [
    "pydantic>=2.7",
]


[project.urls]
Homepage = "https://agentclientprotocol.github.io/python-sdk/"
Repository = "https://github.com/agentclientprotocol/python-sdk"
Documentation = "https://agentclientprotocol.github.io/python-sdk/"

[dependency-groups]
dev = [
    "datamodel-code-generator>=0.25",
    "pytest>=7.2.0",
    "pytest-asyncio>=0.21.0",
    "tox-uv>=1.11.3",
    "deptry>=0.23.0",
    "ty>=0.0.1a16",
    "ruff>=0.11.5",
    "mkdocs>=1.4.2",
    "mkdocs-material>=8.5.10",
    "mkdocstrings[python]>=0.26.1",
    "python-dotenv>=1.1.1",
    "prek>=0.2.17",
]

[project.optional-dependencies]
logfire = ["logfire>=0.14", "opentelemetry-sdk>=1.28.0"]

[build-system]
requires = ["pdm-backend"]
build-backend = "pdm.backend"

[tool.pdm.build]
source-includes = ["examples/", "tests/"]

[tool.ty.environment]
python = "./.venv"
python-version = "3.10"

[tool.pytest.ini_options]
testpaths = ["tests"]

[tool.ruff]
target-version = "py310"
line-length = 120
fix = true

[tool.ruff.lint]
select = [
    # flake8-2020
    "YTT",
    # flake8-bandit
    "S",
    # flake8-bugbear
    "B",
    # flake8-builtins
    "A",
    # flake8-comprehensions
    "C4",
    # flake8-debugger
    "T10",
    # flake8-simplify
    "SIM",
    # isort
    "I",
    # mccabe
    "C90",
    # pycodestyle
    "E", "W",
    # pyflakes
    "F",
    # pygrep-hooks
    "PGH",
    # pyupgrade
    "UP",
    # ruff
    "RUF",
    # tryceratops
    "TRY",
]
ignore = [
    # LineTooLong
    "E501",
    # DoNotAssignLambda
    "E731",
    # Long exception message
    "TRY003",
]

[tool.ruff.lint.per-file-ignores]
"tests/*" = ["S101"]
"src/acp/meta.py" = ["ALL"]
"src/acp/schema.py" = ["ALL"]

[tool.ruff.format]
preview = true

[tool.deptry.package_module_name_map]
opentelemetry-sdk = "opentelemetry"
````

## File: README.md
````markdown
<a href="https://agentclientprotocol.com/">
  <img alt="Agent Client Protocol" src="https://zed.dev/img/acp/banner-dark.webp">
</a>

# Agent Client Protocol (Python)

Build ACP-compliant agents and clients in Python with generated schema models, asyncio transports, helper builders, and runnable demos.

> Releases track the upstream ACP schema; contributions that tighten coverage or tooling are always welcome.

## Install

```bash
pip install agent-client-protocol
# or
uv add agent-client-protocol
```

## At a glance

- **Spec parity:** Generated Pydantic models in `acp.schema` track every ACP release so payloads stay valid.
- **Runtime ergonomics:** Async base classes, stdio JSON-RPC plumbing, and lifecycle helpers keep custom agents tiny.
- **Examples ready:** Streaming, permissions, Gemini bridge, and duet demos live under `examples/`.
- **Helper builders:** `acp.helpers` mirrors the Go/TS SDK APIs for content blocks, tool calls, and session updates.
- **Contrib utilities:** Session accumulators, tool call trackers, and permission brokers share patterns from real deployments.

## Who benefits

- Agent authors who need typed models, helper builders, and event-stream ergonomics for ACP-compatible assistants.
- Client integrators embedding ACP parties inside Python applications or wrapping existing CLIs via stdio.
- Tooling teams experimenting with permission flows, streaming UX, or Gemini bridges without re-implementing transports.
See real adopters like kimi-cli in the [Use Cases list](https://agentclientprotocol.github.io/python-sdk/use-cases/).

## How to get started

- Follow the [Quickstart guide](https://agentclientprotocol.github.io/python-sdk/quickstart/) for installation, echo-agent validation, editor wiring (e.g. Zed), and programmatic launch recipes.
- Browse the [example gallery](https://github.com/agentclientprotocol/python-sdk/tree/main/examples) to see progressively richer integrations you can copy or extend.
- Skim the [docs hub](https://agentclientprotocol.github.io/python-sdk/) for focused references on contrib helpers, releasing, and transport details.

## Quick links

| Need               | Link                                                                   |
|--------------------|------------------------------------------------------------------------|
| Docs hub           | <https://agentclientprotocol.github.io/python-sdk/>                    |
| Quickstart         | <https://agentclientprotocol.github.io/python-sdk/quickstart/>         |
| Use cases          | <https://agentclientprotocol.github.io/python-sdk/use-cases/>          |
| Contrib helpers    | <https://agentclientprotocol.github.io/python-sdk/contrib/>            |
| Releasing workflow | <https://agentclientprotocol.github.io/python-sdk/releasing/>          |
| Examples           | <https://github.com/agentclientprotocol/python-sdk/tree/main/examples> |
| Tests              | <https://github.com/agentclientprotocol/python-sdk/tree/main/tests>    |
| PyPI               | <https://pypi.org/project/agent-client-protocol/>                      |

## Project layout

- `src/acp/`: runtime package (agents, clients, transports, helpers, schema bindings, contrib utilities)
- `schema/`: upstream JSON schema sources (regenerate via `make gen-all`)
- `docs/`: MkDocs content backing the published documentation
- `examples/`: runnable scripts covering stdio orchestration patterns
- `tests/`: pytest suite with golden fixtures and optional Gemini coverage

## Developer commands

- `make install` provisions the `uv` virtualenv and installs pre-commit hooks.
- `make check` runs Ruff formatting/linting, type analysis, dependency hygiene, and lock verification.
- `make test` executes `pytest` (with doctests) inside the managed environment.
- `ACP_SCHEMA_VERSION=<ref> make gen-all` refreshes protocol artifacts when the schema advances.

Keep docs and examples current whenever you ship public API or transport changes, and prefer Conventional Commits (`feat:`, `fix:`, etc.) when submitting patches.

## Community & support

- File issues or feature requests at <https://github.com/agentclientprotocol/python-sdk>.
- Discuss ideas or get help via GitHub Discussions: <https://github.com/agentclientprotocol/python-sdk/discussions>.
- Join the broader ACP conversations at <https://agentclientprotocol.com/>, the Zed community channels, or the community Zulip: <https://agentclientprotocol.zulipchat.com/>.
- Shared learnings, integrations, or third-party transports are welcome additions to the documentation—open a PR!
````

## File: tox.ini
````ini
[tox]
skipsdist = true
envlist = py310, py311, py312, py313, py314

[gh-actions]
python =
    3.10: py310
    3.11: py311
    3.12: py312
    3.13: py313
    3.14: py314

[testenv]
passenv = PYTHON_VERSION
allowlist_externals = uv
commands =
    uv sync --python {envpython}
    uv run python -m pytest --doctest-modules tests --cov --cov-config=pyproject.toml --cov-report=xml
    ty check
````
