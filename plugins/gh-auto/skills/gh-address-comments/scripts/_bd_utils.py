"""
Shared utilities for bd (beads) CLI integration.

Provides a single check_bd_ready() function that verifies:
  1. bd is installed and in PATH
  2. A .beads/ database is reachable from the current directory
     (walks up the tree, also respects BEADS_DIR env var)

All bead-related scripts import from here so the logic stays in one place.
"""

from __future__ import annotations

import os
import subprocess
import sys


def _bd_in_path() -> bool:
    return subprocess.run(["which", "bd"], capture_output=True).returncode == 0


def _find_beads_dir() -> str | None:
    """Walk up from cwd looking for a .beads/ directory, like bd itself does."""
    # Explicit override takes priority
    env = os.environ.get("BEADS_DIR")
    if env and os.path.isdir(env):
        return env

    current = os.path.abspath(os.getcwd())
    while True:
        candidate = os.path.join(current, ".beads")
        if os.path.isdir(candidate):
            return candidate
        parent = os.path.dirname(current)
        if parent == current:
            break
        current = parent
    return None


def check_bd_ready(*, fatal: bool = True) -> bool:
    """
    Check that bd is installed and a .beads/ database is reachable.

    If fatal=True (default), prints a helpful error and sys.exit(1) on failure.
    If fatal=False, returns False on failure so the caller can skip bead steps.
    """
    if not _bd_in_path():
        msg = (
            "bd (beads) not found in PATH.\n"
            "Install it with:\n"
            "  curl -fsSL https://raw.githubusercontent.com/steveyegge/beads/main/scripts/install.sh | bash\n"
            "Or skip bead integration by omitting --close-beads / gh-create-beads."
        )
        if fatal:
            print(f"Error: {msg}", file=sys.stderr)
            sys.exit(1)
        print(f"⚠️  {msg}", file=sys.stderr)
        return False

    beads_dir = _find_beads_dir()
    if beads_dir is None:
        cwd = os.getcwd()
        msg = (
            f"No .beads/ directory found from {cwd}.\n"
            "Either:\n"
            "  • cd into a project that has beads initialised, or\n"
            "  • run 'bd init' to create a new database here, or\n"
            "  • set BEADS_DIR=/path/to/.beads"
        )
        if fatal:
            print(f"Error: {msg}", file=sys.stderr)
            sys.exit(1)
        print(f"⚠️  {msg}", file=sys.stderr)
        return False

    return True
