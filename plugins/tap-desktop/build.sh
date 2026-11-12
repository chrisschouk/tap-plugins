#!/usr/bin/env bash
# Build and validate the TAP Claude Desktop extension (MCP Bundle).
#
# Produces tap-desktop.mcpb in this directory. The artefact is not committed
# (see README.md "Where the .mcpb file lives"); run this to regenerate it and
# upload the output as a GitHub release asset.
set -euo pipefail
cd "$(dirname "$0")"

echo "== validating manifest =="
npx -y @anthropic-ai/mcpb validate manifest.json

echo "== packing bundle =="
npx -y @anthropic-ai/mcpb pack . tap-desktop.mcpb

echo "== bundle info =="
npx -y @anthropic-ai/mcpb info tap-desktop.mcpb
