#!/bin/bash
# Export claude-homelab secrets from Doppler into the current shell.
# Source this from your shell profile, or use `doppler run` directly.
#
# Usage (in ~/.zshrc or ~/.bashrc):
#   source ~/claude-homelab/scripts/doppler-env.sh
#
# Or wrap your CLI launch:
#   doppler run --project claude-homelab --config prd -- kiro-cli chat
#   doppler run --project claude-homelab --config prd -- agy

if command -v doppler &>/dev/null; then
  # Only export if not already running under doppler
  if [[ -z "${DOPPLER_ENVIRONMENT:-}" ]]; then
    eval "$(doppler secrets download \
      --project claude-homelab \
      --config prd \
      --no-file \
      --format env-no-quotes 2>/dev/null | sed 's/^/export /')"
  fi
fi
