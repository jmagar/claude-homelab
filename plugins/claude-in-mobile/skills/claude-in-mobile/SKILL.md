---
name: claude-in-mobile
description: Use when controlling or testing Android devices, iOS Simulators, macOS desktop apps, Aurora OS devices, Chrome/Chromium browser sessions, or app-store releases through the claude-in-mobile MCP server or native CLI.
---

# Claude in Mobile

Use this skill for Claude Mobile and `claude-in-mobile` MCP workflows.

## What It Is

`claude-in-mobile` is an MCP server and native CLI for automating Android,
iOS Simulator, macOS desktop apps, Aurora OS devices, browser sessions, and app
store release operations. It exposes a small set of token-efficient meta-tools
instead of a large list of single-purpose tools.

## MCP Configuration

The plugin launches the upstream MCP server as:

```json
{
  "mcpServers": {
    "mobile": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "claude-in-mobile@3.7.0"]
    }
  }
}
```

Use `mobile` tools for Claude Code automation. Use the native CLI for scripts,
CI smoke tests, or quick manual checks.

## Requirements

- Android: `adb` in `PATH`, plus a connected USB-debuggable device or emulator.
- iOS: macOS, Xcode, a booted iOS Simulator, and WebDriverAgent for full UI
  tree inspection.
- Desktop: macOS and Accessibility permission for the automation host.
- Aurora OS: `audb` in `PATH`, SSH enabled on the device, and Python installed
  on the device for tap and swipe support.
- Browser: Chrome or Chromium reachable through CDP when using browser tools.

## Core Tool Families

- `device`: list devices, set target, and enable optional modules.
- `input`: tap, long press, swipe, text, and key events.
- `screen`: capture and annotate screenshots.
- `ui`: inspect trees, find elements, tap text, wait, and assert UI state.
- `app`: launch, stop, install, and list apps.
- `system`: shell, logs, info, URLs, clipboard, permissions, files, and metrics.
- `flow_batch`: execute multiple sequential operations in one round trip.
- `flow_run`: run conditional or repeated automation flows.
- `flow_parallel`: fan out the same action across multiple devices.

Optional modules:

- `browser`: Chrome/Chromium navigation, clicks, form fill, screenshots, and JS.
- `desktop`: app launch, windows, focus, resize, clipboard, performance, and
  monitor operations.
- `store`: Google Play, Huawei AppGallery, and RuStore upload/release workflows.

## Common Workflows

Device discovery:

```text
List connected devices, then set the active target before running actions.
```

Visual inspection:

```text
Capture an annotated screenshot, inspect the UI tree, then tap by text or by a
numbered/coordinate target from the screenshot.
```

Cross-platform app smoke test:

```text
Launch the app on Android and iOS, wait for the first screen, assert that the
expected text is visible, capture screenshots, then collect logs on failure.
```

Desktop app test:

```text
Enable the desktop module, launch or attach to the macOS app, focus the window,
resize to a stable viewport, inspect windows, then drive clicks and keyboard
input.
```

Store release:

```text
Enable the store module, confirm package name and artifact path, upload the
build, set release notes, and submit or stage rollout only after explicit user
confirmation.
```

## Native CLI Examples

```bash
claude-in-mobile screenshot android
claude-in-mobile tap android 540 960 --from-size 540x960
claude-in-mobile input android "hello world"
claude-in-mobile store upload --package com.example.app --file app.aab
```

## Guardrails

- Verify the active target before any destructive action.
- Prefer UI text or accessibility identifiers over raw coordinates when
  possible.
- Collect screenshots and logs before changing app/device state during bug
  investigation.
- Treat `system shell`, file operations, permission changes, and store actions
  as privileged operations.
- Do not run store publishing, rollout, or destructive device commands without
  explicit package, artifact, and target confirmation.
