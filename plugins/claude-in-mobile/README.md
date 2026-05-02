# Claude in Mobile Plugin

Claude in Mobile, also called Claude Mobile in its README, is an MCP server and native CLI for mobile, desktop, browser, and store automation.

Source: https://github.com/AlexGladkov/claude-in-mobile

## MCP Server

This plugin exposes the upstream MCP server as `mobile`:

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

The upstream project also documents manual Claude Code setup:

```bash
claude mcp add --transport stdio mobile -- npx claude-in-mobile@latest
```

This plugin pins `claude-in-mobile@3.7.0` for reproducible installs.

## What It Automates

- Android devices and emulators through ADB.
- iOS Simulator through `simctl`, with WebDriverAgent for full UI inspection.
- macOS desktop applications through the desktop module.
- Aurora OS devices through `audb`.
- Chrome or Chromium browser sessions through CDP.
- Google Play, Huawei AppGallery, and RuStore publishing through the optional store module.

## Requirements

Android:

```text
ADB installed and in PATH
USB debugging enabled or emulator running
```

iOS:

```text
macOS
Xcode
iOS Simulator
Appium xcuitest driver or WDA_PATH for WebDriverAgent
```

Desktop:

```text
macOS
Accessibility permission granted to the automation host
JDK 17+ when building the desktop companion from source
```

Aurora OS:

```text
audb installed
SSH-enabled Aurora device
Python installed on device for tap/swipe support
```

## Core MCP Tools

Version 3.7.0 documents eight always-loaded meta-tools:

- `device`: list, select, and manage active devices and modules.
- `input`: tap, double tap, long press, swipe, text, and key events.
- `screen`: screenshots and annotated screenshots.
- `ui`: tree, find, tap text, analyze, wait, assert visible, and assert gone.
- `app`: launch, stop, install, and list apps.
- `system`: shell, logs, info, clipboard, permissions, files, URLs, webviews, and metrics.
- `flow_batch`: run sequential commands in one MCP round trip.
- `flow_run`: run conditional multi-step flows.

Optional modules load on demand:

- `browser`: Chrome/Chromium automation through CDP.
- `desktop`: desktop app launch, windows, focus, resize, clipboard, performance, and monitors.
- `store`: app-store upload, release, rollout, and version operations.

## Native CLI

The upstream project also provides a native CLI through Homebrew:

```bash
brew tap AlexGladkov/claude-in-mobile https://github.com/AlexGladkov/claude-in-mobile
brew install claude-in-mobile
```

Examples:

```bash
claude-in-mobile screenshot android
claude-in-mobile tap android 540 960 --from-size 540x960
claude-in-mobile store upload --package com.example.app --file app.aab
```

## Security Notes

- Treat device shell access as privileged.
- Avoid running destructive store or device operations unless the target device/app/package is explicit.
- On macOS, grant Accessibility permissions only to trusted automation hosts.
- For iOS UI inspection, prefer an explicit `WDA_PATH` when relying on a known WebDriverAgent checkout.
