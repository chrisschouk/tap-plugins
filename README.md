# TAP plugins and connectors

Ways to connect an AI assistant to a TAP workspace, and where each one lives.

## Claude Code plugin (`plugins/tap/`)

```
/plugin marketplace add chrisschouk/tap-plugins
/plugin install tap@tap-marketplace
```

Loads four skills (plan a release campaign, draft and refine pitches, campaign check-in, contacts
tidy) and wires up the hosted TAP MCP server (`https://totalaudiopromo.com/api/mcp`, OAuth 2.1 +
Dynamic Client Registration - sign in with your TAP account on first use, no key needed). See
`plugins/tap/README.md`, including the stdio-with-API-key alternative.

## Claude Desktop extension / MCP Bundle (`plugins/tap-desktop/`)

A one-click `.mcpb` install for Claude Desktop, using a personal TAP API key over stdio instead of
OAuth. Download `tap-desktop.mcpb` from the latest [release](https://github.com/chrisschouk/tap-plugins/releases/latest)
and open it with Claude Desktop. Create your key in TAP under Settings, API Keys.

Install once you have the file: Claude Desktop > Settings > Extensions > Install from file, or
double-click the `.mcpb` file. Claude Desktop prompts for the TAP API key (Settings > API Keys in
TAP) and stores it as a sensitive value.

## claude.ai custom connector

claude.ai > Settings > Connectors > Add custom connector > paste
`https://totalaudiopromo.com/api/mcp`. claude.ai drives the same OAuth 2.1 + DCR sign-in as the
Claude Code plugin.

## ChatGPT

Settings > Apps and Connectors > Advanced > Developer mode (enable it) > Add MCP server. Paste
`https://totalaudiopromo.com/api/mcp` as the server URL. ChatGPT's developer mode servers follow
the same MCP OAuth flow; a TAP sign-in prompt should appear the first time a tool is called.

## Licence

Proprietary rights reserved for this preview. You may install the plugin and extension to connect
an assistant to your own TAP account; no other rights are granted. See `LICENSE`.
