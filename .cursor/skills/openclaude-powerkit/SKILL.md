---
name: openclaude-powerkit
description: >-
  OpenClaude repo power workflow: read AGENTS.md, run smoke/tests, provider gates,
  MCP stack in .cursor/mcp.json (Playwright, Sequential Thinking, Memory), fork
  upstream sync, local OpenAI backends / browser CORS (Ollama, Hermes-style
  UIs). Use for multi-step CLI/provider/tool work, CI parity, or Cursor setup.
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

In **VS Code / Cursor**, you can run the same checks via **Tasks: Run Task** → **OpenClaude: smoke** (or unit / provider / doctor tasks from `.vscode/tasks.json`).

## Where to edit

- **Providers:** `src/services/api/` — see **`.cursor/rules/openclaude-providers.mdc`** when those globs apply.
- **Tools / MCP / permissions:** **`.cursor/rules/openclaude-tools-mcp.mdc`** when those globs apply.

## Browser UI vs CLI (Ollama, Hermes Workspace)

When **`curl …/v1/models` succeeds** but a **browser** shows **Failed to fetch** against the same host, assume **CORS** until disproven. For **Ollama**, configure **`OLLAMA_ORIGINS`**, restart the server, use **`http://127.0.0.1:11434/v1`**. Prefer the product’s **gateway URL** when docs specify `hermes --gateway` / `pnpm dev` so the client matches the supported topology. Details: **`AGENTS.md` → "Local OpenAI-compatible backends & browser UIs"**.

## MCP stack

Servers are declared in **`.cursor/mcp.json`** and summarized in **`AGENTS.md`** (*Where Cursor-specific files fit*) — avoid duplicating the list here. Reload MCP in Cursor after edits. **Playwright:** `npx playwright install chromium` if browser tools fail. Add API-key MCPs in your **user** config or extend `.cursor/mcp.json` when you want them in-repo.

## Optional plugins (your machine)

Superpowers-style bundles (brainstorming, verification-before-completion, plans) are **not** declared in-repo — install from the Cursor marketplace on each machine where you want them. This skill only reminds you they exist; it does not replace **AGENTS.md**.

## Fork hygiene

Upstream and PR pointers live in **`.cursor/skills/local-handbook/memory.md`**. Prefer merging **`upstream/main`** before opening contributions to **Gitlawb/openclaude**.
