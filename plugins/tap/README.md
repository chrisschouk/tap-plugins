# TAP - Total Audio Promo (Claude Code plugin)

Plan release campaigns, draft pitches, check campaign progress and keep contacts tidy in your
connected TAP workspace, from inside Claude Code. Review and approve your pitches in TAP; TAP sends
what you approve.

## Install

```
/plugin marketplace add chrisschouk/tap-plugins
/plugin install tap@tap-marketplace
```

(Substitute the actual marketplace `name` from `.claude-plugin/marketplace.json` at the repo root
if it differs - see that file.)

## Connecting your TAP workspace

This plugin wires up the hosted TAP MCP server by default:

```json
{
  "mcpServers": {
    "tap": { "type": "http", "url": "https://totalaudiopromo.com/api/mcp" }
  }
}
```

The first time a skill in this plugin calls a TAP tool, Claude Code opens the standard OAuth 2.1 +
Dynamic Client Registration flow and you sign in with your TAP account. No API key or other
credential needs to go in this plugin or your settings.

### Alternative: stdio with an API key

If you would rather run the TAP MCP server locally over stdio (for example, while developing
against a local TAP instance, or if the hosted connector is unreachable), replace the `tap` entry
above in your own `.mcp.json` or Claude Code settings with:

```json
{
  "mcpServers": {
    "tap": {
      "command": "npx",
      "args": ["-y", "@totalaudiopromo/tap-mcp"],
      "env": {
        "TAP_API_KEY": "tap_ak_..."
      }
    }
  }
}
```

Get `TAP_API_KEY` from TAP, under Settings > API Keys. Keep it out of anything you commit.

## Skills

- `plan-release-campaign` - create or open a campaign, build a contact pool, draft pitches.
- `draft-and-refine-pitches` - draft and iterate on pitch copy, in TAP's voice (specific, no hype,
  UK spelling, facts cited or cut).
- `campaign-check-in` - outcomes, replies, what's queued, suggested next actions.
- `contacts-tidy` - find duplicates, wrong or stale routes, and missing detail in your contact
  list.

Each skill uses only tools the TAP MCP server ([`@totalaudiopromo/tap-mcp`](https://www.npmjs.com/package/@totalaudiopromo/tap-mcp)) actually provides.

## What this plugin does not do

It never sends a message, posts anything, or starts Press play. Drafting, queuing and proposing
happen here; the pitches are reviewed and approved in TAP, and TAP sends them.
