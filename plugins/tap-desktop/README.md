# TAP - Total Audio Promo (Claude Desktop extension)

A one-click MCP Bundle (`.mcpb`) that connects Claude Desktop to a TAP workspace over stdio, using
a personal TAP API key rather than OAuth. Plan release campaigns, draft pitches, check progress and
keep contacts tidy. Review and approve your pitches in TAP; TAP sends what you approve.

## What's in here

- `manifest.json` - the MCP Bundle manifest (spec `0.3`). Declares a `node` server, a required
  sensitive `tap_api_key` user config field, and the icon, privacy and support links Claude Desktop
  shows in the install dialog.
- `server/index.js` - a thin launcher. It execs the published `@totalaudiopromo/tap-mcp` npm
  package over stdio (`npx -y @totalaudiopromo/tap-mcp`) rather than bundling TAP's MCP source a
  second time, so this extension always runs the same server code as the hosted connector and the
  stdio instructions in `plugins/tap/README.md`.
- `icon.png` - the TAP app icon (180x180 PNG).
- `build.sh` - validates the manifest and packs `tap-desktop.mcpb` locally.

## Build and validate locally

```bash
plugins/tap-desktop/build.sh
```

This runs `mcpb validate manifest.json`, then `mcpb pack . tap-desktop.mcpb`, then
`mcpb info tap-desktop.mcpb` so the packed contents can be checked by eye. Requires network access
to fetch `@anthropic-ai/mcpb` via `npx` (or install it once with
`npm install -g @anthropic-ai/mcpb`).

## Where the `.mcpb` file lives

Each GitHub release of this repository carries `tap-desktop.mcpb` as an asset.

Re-run `build.sh` and re-upload whenever `manifest.json` or `server/index.js` changes,
and bump `version` in `manifest.json` so Claude Desktop treats it as an update.

## Getting a TAP API key

Settings > API Keys in TAP (`tap_ak_...`). Claude Desktop's install dialog prompts for it as
"TAP API key" and stores it as a sensitive value (masked, not in plain settings).
