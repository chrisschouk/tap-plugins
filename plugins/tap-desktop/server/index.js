#!/usr/bin/env node
/**
 * Thin launcher for the TAP MCP Bundle (Claude Desktop extension).
 *
 * The bundle format wants a server file it can point at directly, but the
 * real server is the published `@totalaudiopromo/tap-mcp` npm package, kept
 * in packages/tap-mcp of this monorepo. Duplicating that source into the
 * bundle would drift the moment either copy changed, so this file instead
 * execs the published package over stdio and forwards every event:
 * `npx -y @totalaudiopromo/tap-mcp`, inheriting stdio and the environment
 * Claude Desktop set from user_config (TAP_API_KEY).
 */

const { spawn } = require('node:child_process');

const child = spawn('npx', ['-y', '@totalaudiopromo/tap-mcp'], {
  stdio: 'inherit',
  env: process.env,
});

child.on('exit', (code, signal) => {
  if (signal) {
    process.kill(process.pid, signal);
    return;
  }
  process.exit(code ?? 0);
});

child.on('error', (err) => {
  console.error('[tap-mcp launcher] failed to start @totalaudiopromo/tap-mcp:', err);
  process.exit(1);
});
