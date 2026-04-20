#!/usr/bin/env bash
# Prepends the same dev tool locations as .vscode/settings.json so palette tasks
# and agents find bun/Homebrew without duplicating PATH strings in tasks.json.
set -euo pipefail
case "$(uname -s)" in
Darwin) export PATH="${HOME}/.bun/bin:/opt/homebrew/bin:/usr/local/bin:${PATH}" ;;
Linux) export PATH="${HOME}/.bun/bin:/usr/local/bin:${PATH}" ;;
*) export PATH="${HOME}/.bun/bin:${PATH}" ;;
esac
exec "$@"
