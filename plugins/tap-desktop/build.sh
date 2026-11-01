#!/usr/bin/env bash
# Build and validate the TAP Claude Desktop extension (MCP Bundle).
#
# Produces tap-desktop.mcpb in this directory. The artefact is not committed
# to the repository (see README.md "Where the .mcpb file lives"); run this
# locally or in CI to regenerate it, and host the output as a GitHub release
# asset or under apps/tap/public/downloads/.
set -euo pipefail
cd "$(dirname "$0")"

echo "== validating manifest =="
npx -y @anthropic-ai/mcpb validate manifest.json

echo "== packing bundle =="
npx -y @anthropic-ai/mcpb pack . tap-desktop.mcpb

echo "== bundle info =="
npx -y @anthropic-ai/mcpb info tap-desktop.mcpb
