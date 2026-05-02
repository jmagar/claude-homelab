#!/usr/bin/env python3
"""
Install zsh/bash tab completions for gh-address-comments CLI tools.

Completions support:
  - Flag names for all four commands
  - Thread ID completion from a local cache (~/.cache/gh-comments/threads.json)
  - Cache is populated automatically when gh-fetch-comments runs

Usage:
  gh-install-completions          # auto-detect shell, install to standard location
  gh-install-completions --shell zsh
  gh-install-completions --shell bash
  gh-install-completions --print  # print to stdout instead of installing
"""

from __future__ import annotations

import argparse
import os
import sys

ZSH_COMPLETION = r"""
#compdef gh-fetch-comments gh-mark-resolved gh-verify-resolution gh-pr-summary gh-post-reply

_gh_thread_ids() {
  local cache="$HOME/.cache/gh-comments/threads.json"
  if [[ -f "$cache" ]]; then
    local -a ids
    ids=($(python3 -c "
import json, sys
try:
    data = json.load(open('$cache'))
    for t in data.get('review_threads', []):
        if not t.get('isResolved') and not t.get('isOutdated'):
            path = t.get('path', '?')
            line = t.get('line') or t.get('originalLine', '?')
            tid = t.get('id', '')
            print(f'{tid}:{path}:L{line}')
except Exception:
    pass
" 2>/dev/null))
    _describe 'thread IDs' ids
  fi
}

_gh_fetch_comments() {
  _arguments \
    '--pr[PR number]:number' \
    '--repo[Repository]:owner/repo' \
    {-o,--output}'[Save output to file]:file:_files' \
    '--since[Compare against snapshot]:file:_files' \
    '(-h --help)'{-h,--help}'[Show help]'
}

_gh_mark_resolved() {
  _arguments \
    '--all[Resolve all unresolved threads from --input]' \
    {-i,--input}'[JSON file from gh-fetch-comments]:file:_files' \
    '--dry-run[Preview without making changes]' \
    '--workers[Max concurrent API calls]:number' \
    '(-h --help)'{-h,--help}'[Show help]' \
    '*:thread ID:_gh_thread_ids'
}

_gh_verify_resolution() {
  _arguments \
    {-i,--input}'[Read from file]:file:_files' \
    '--watch[Poll until all threads resolved]' \
    '--pr[PR number for watch mode]:number' \
    '--repo[Repository for watch mode]:owner/repo' \
    '--interval[Poll interval in seconds]:seconds' \
    '(-h --help)'{-h,--help}'[Show help]'
}

_gh_pr_summary() {
  _arguments \
    {-i,--input}'[Read from file]:file:_files' \
    '--by[Group by]:grouping:(file reviewer priority)' \
    '--open-only[Show only unresolved threads]' \
    '--filter-priority[Filter by priority]:level:(P0 P1 P2 P3)' \
    '--format[Output format]:format:(text markdown)' \
    '(-h --help)'{-h,--help}'[Show help]'
}

_gh_post_reply() {
  _arguments \
    '--all[Reply to all open threads from --input]' \
    {-i,--input}'[JSON file from gh-fetch-comments]:file:_files' \
    '--commit[Auto-generate Fixed-in message]:sha' \
    '--dry-run[Preview without posting]' \
    '--workers[Max concurrent API calls]:number' \
    '(-h --help)'{-h,--help}'[Show help]' \
    '1:thread ID:_gh_thread_ids' \
    '2:message'
}

case "$service" in
  gh-fetch-comments)    _gh_fetch_comments ;;
  gh-mark-resolved)     _gh_mark_resolved ;;
  gh-verify-resolution) _gh_verify_resolution ;;
  gh-pr-summary)        _gh_pr_summary ;;
  gh-post-reply)        _gh_post_reply ;;
esac
"""

BASH_COMPLETION = r"""
# bash completions for gh-address-comments tools

_gh_thread_ids_cache() {
  local cache="$HOME/.cache/gh-comments/threads.json"
  if [[ -f "$cache" ]]; then
    python3 -c "
import json
try:
    data = json.load(open('$cache'))
    for t in data.get('review_threads', []):
        if not t.get('isResolved') and not t.get('isOutdated'):
            print(t.get('id', ''))
except Exception:
    pass
" 2>/dev/null
  fi
}

_gh_fetch_comments_completions() {
  local opts="--pr --repo --output -o --since --help -h"
  COMPREPLY=($(compgen -W "$opts" -- "${COMP_WORDS[COMP_CWORD]}"))
}

_gh_mark_resolved_completions() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="--all --input -i --dry-run --workers --help -h"
  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "$opts" -- "$cur"))
  else
    local ids
    ids=$(_gh_thread_ids_cache)
    COMPREPLY=($(compgen -W "$ids" -- "$cur"))
  fi
}

_gh_verify_resolution_completions() {
  local opts="--input -i --watch --pr --repo --interval --help -h"
  COMPREPLY=($(compgen -W "$opts" -- "${COMP_WORDS[COMP_CWORD]}"))
}

_gh_pr_summary_completions() {
  local opts="--input -i --by --open-only --filter-priority --format --help -h"
  COMPREPLY=($(compgen -W "$opts" -- "${COMP_WORDS[COMP_CWORD]}"))
}

_gh_post_reply_completions() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local opts="--all --input -i --commit --dry-run --workers --help -h"
  if [[ "$cur" == -* ]]; then
    COMPREPLY=($(compgen -W "$opts" -- "$cur"))
  elif [[ "${#COMP_WORDS[@]}" -le 2 ]]; then
    local ids
    ids=$(_gh_thread_ids_cache)
    COMPREPLY=($(compgen -W "$ids" -- "$cur"))
  fi
}

complete -F _gh_fetch_comments_completions gh-fetch-comments
complete -F _gh_mark_resolved_completions gh-mark-resolved
complete -F _gh_verify_resolution_completions gh-verify-resolution
complete -F _gh_pr_summary_completions gh-pr-summary
complete -F _gh_post_reply_completions gh-post-reply
"""

CACHE_HOOK = '''
# gh-address-comments: auto-update thread ID cache when fetching comments
# Add this to your shell's post-command hook, or source it manually.
# The cache at ~/.cache/gh-comments/threads.json is used for tab completion.

_gh_update_thread_cache() {
  # Called as a wrapper — just pass through and cache the output
  local out
  out=$(command gh-fetch-comments "$@")
  local exit_code=$?
  if [[ $exit_code -eq 0 ]] && echo "$out" | python3 -c "import json,sys; d=json.load(sys.stdin); exit(0 if 'review_threads' in d else 1)" 2>/dev/null; then
    mkdir -p "$HOME/.cache/gh-comments"
    echo "$out" > "$HOME/.cache/gh-comments/threads.json"
  fi
  echo "$out"
  return $exit_code
}
'''


def detect_shell() -> str:
    shell = os.environ.get("SHELL", "")
    if "zsh" in shell:
        return "zsh"
    if "bash" in shell:
        return "bash"
    return "bash"


def zsh_completion_dir() -> str:
    # Check for oh-my-zsh custom completions first
    omz = os.path.expanduser("~/.oh-my-zsh/custom/completions")
    if os.path.isdir(omz):
        return omz
    # Standard zsh site-functions
    xdg = os.environ.get("XDG_DATA_HOME", os.path.expanduser("~/.local/share"))
    return os.path.join(xdg, "zsh", "site-functions")


def bash_completion_dir() -> str:
    xdg = os.environ.get("XDG_DATA_HOME", os.path.expanduser("~/.local/share"))
    return os.path.join(xdg, "bash-completion", "completions")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Install shell tab completions for gh-address-comments tools",
    )
    parser.add_argument("--shell", choices=["zsh", "bash"], help="Shell to install for (default: auto-detect)")
    parser.add_argument("--print", action="store_true", dest="print_only", help="Print completion script to stdout instead of installing")
    args = parser.parse_args()

    shell = args.shell or detect_shell()

    if shell == "zsh":
        script = ZSH_COMPLETION
        dest_dir = zsh_completion_dir()
        dest_file = os.path.join(dest_dir, "_gh_address_comments")
        source_hint = f"fpath=({dest_dir} $fpath)  # add to ~/.zshrc if not already present"
    else:
        script = BASH_COMPLETION
        dest_dir = bash_completion_dir()
        dest_file = os.path.join(dest_dir, "gh-address-comments")
        source_hint = f"source {dest_file}  # add to ~/.bashrc if not auto-sourced"

    if args.print_only:
        print(script)
        return

    os.makedirs(dest_dir, exist_ok=True)
    with open(dest_file, "w") as f:
        f.write(script)

    print(f"✓ Installed {shell} completions to {dest_file}")
    print(f"\nIf completions don't work immediately, add this to your shell config:")
    print(f"  {source_hint}")
    print(f"\nThen restart your shell or run: exec {shell}")
    print(f"\nThread ID completions read from: ~/.cache/gh-comments/threads.json")
    print(f"This cache is populated when you run: gh-fetch-comments -o <file>")

    # Write cache dir
    cache_dir = os.path.expanduser("~/.cache/gh-comments")
    os.makedirs(cache_dir, exist_ok=True)


if __name__ == "__main__":
    main()
