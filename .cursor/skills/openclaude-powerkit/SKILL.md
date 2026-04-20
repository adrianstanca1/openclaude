---
name: openclaude-powerkit
description: >-
  OpenClaude repo power workflow: read AGENTS.md, run smoke/tests, provider gates,
  MCP stack in .cursor/mcp.json (Playwright, Sequential Thinking, Memory), fork
  upstream sync. Use for multi-step
  CLI/provider/tool work, CI parity, or enhancing Cursor setup in this project.
---

# OpenClaude power kit (this repo)

## First read

1. **`AGENTS.md`** (repo root) — command table and map.
2. **`.cursor/rules/openclaude-core.mdc`** — always-on defaults (PATH, Bun, secrets).

## Verification ladder (narrow → wide)

| Situation | Command |
|-----------|---------|
| After build-affecting edits | `bun run smoke` |
| Default unit tests | `bun test` (CI uses `--max-concurrency=1`) |
| Provider / API shims | `bun run test:provider` |
| Provider recommendation logic | `bun run test:provider-recommendation` |

Do not claim green without running the narrowest relevant command(s) and showing pass/fail.

## Where to edit

- **Providers:** `src/services/api/` — see **`.cursor/rules/openclaude-providers.mdc`** when those globs apply.
- **Tools / MCP / permissions:** **`.cursor/rules/openclaude-tools-mcp.mdc`** when those globs apply.

## MCP stack (project `.cursor/mcp.json`)

Reload MCP in Cursor after changing this file.

| Server | Role |
|--------|------|
| **playwright** | Browser automation (`browser_*` tools); install Chromium if needed: `npx playwright install chromium` |
| **sequential-thinking** | Official `sequential_thinking` tool for stepwise / revisable reasoning |
| **memory** | Official Knowledge Graph memory server for durable session notes |

Add API-key MCPs (e.g. Context7, Firecrawl) in your **user** MCP config or paste blocks here when you want them in-repo.

## Optional plugins (your machine)

Superpowers-style bundles (brainstorming, verification-before-completion, plans) are **not** declared in-repo — install from the Cursor marketplace on each machine where you want them. This skill only reminds you they exist; it does not replace **AGENTS.md**.

## Fork hygiene

Upstream and PR pointers live in **`.cursor/skills/local-handbook/memory.md`**. Prefer merging **`upstream/main`** before opening contributions to **Gitlawb/openclaude**.
