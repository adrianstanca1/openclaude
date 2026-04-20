# OpenClaude — guide for AI assistants and contributors

This file is the **canonical**, editor-agnostic playbook for anyone (human or model) changing this repository. It follows the same intent as other Nous-style projects: keep instructions in **one place** instead of scattering them across tool-specific folders.

Optional Cursor-only hints live under `.cursor/skills/local-handbook/` and should stay **thin**—they may point here but must not duplicate long policy.

## What this project is

OpenClaude is a **terminal-first coding-agent CLI** (TypeScript / Bun) that speaks to many model providers (OpenAI-compatible APIs, Gemini, Codex, Ollama, etc.), with tools, MCP, slash commands, and streaming.

- **Canonical upstream:** `https://github.com/Gitlawb/openclaude`
- **Packaged name:** `@gitlawb/openclaude` on npm

## Environment

- **Runtime:** [Bun](https://bun.sh) for development scripts and tests.
- **Build output:** `dist/cli.mjs` (produced by `bun run scripts/build.ts`).
- **CLI entry (local):** `node dist/cli.mjs` after a successful build, or `bin/openclaude` during development.
- **Tooling on PATH:** Some editors run shells with a minimal `PATH`, so `bun` may be missing even when Homebrew or `~/.bun/bin` is installed.
  - This repo includes **`.vscode/settings.json`** so VS Code / Cursor integrated terminals prepend `~/.bun/bin`, `/opt/homebrew/bin`, and `/usr/local/bin` on macOS (and `~/.bun/bin` + `/usr/local/bin` on Linux).
  - After cloning, run **`bun install --frozen-lockfile`** before tests so everything in `package.json` is present under `node_modules/`.

Always **`bun run build`** (or `bun run smoke`) after pulling `main` if `dist/` might be stale.

## Local OpenAI-compatible backends & browser UIs

OpenClaude often uses `OPENAI_BASE_URL` against a local server (e.g. [Ollama](https://ollama.com) at `http://127.0.0.1:11434/v1`). **Browser-based** clients (Hermes Workspace and similar) call the same **`/v1/chat/completions`** contract but use cross-origin `fetch`, so failures differ from the CLI.

- **Symptom:** `curl http://127.0.0.1:11434/v1/models` returns **200**, but the browser shows **"Failed to fetch"** or the Network tab shows **403** on `OPTIONS` / requests with an **`Origin`** header — that is usually **CORS**, not a dead server.
- **Ollama:** set **`OLLAMA_ORIGINS`** to the exact origin(s) of your web UI (comma-separated), or `*` only on trusted dev machines. **Restart** the Ollama service so the variable is applied. Prefer **`http://127.0.0.1:11434/v1`** as the base URL (avoid `0.0.0.0` in the browser).
- **Sanity check after CORS changes:**

```bash
curl -sS -D- -o /dev/null -H "Origin: https://example.com" "http://127.0.0.1:11434/v1/models" | head -20
```

On **GET/POST** responses you want **2xx** plus **`Access-Control-Allow-Origin`** (matching your UI origin or `*`, depending on policy). For **`OPTIONS`** preflight responses, also expect **`Access-Control-Allow-Methods`** and **`Access-Control-Allow-Headers`** to include what the browser sends (e.g. `POST`, `Content-Type`, `Authorization`). If the UI sends cookies or `Authorization: Bearer …` with credentials mode, **`Access-Control-Allow-Credentials: true`** must pair with a **specific** origin (not `*`).

- **Gateway products:** when docs recommend **`pnpm dev`** / **`hermes --gateway`**, point the UI at the **gateway base URL** they print so TLS, routing, and CORS match what the client expects — do not assume a raw Ollama port is enough for every UI.

Hermes links live under **Further reading** (avoid duplicating URLs here).

## Repository map (high level)

```
├── bin/openclaude              # CLI wrapper for local dev
├── scripts/                    # build.ts, provider tooling, checks
├── src/                        # application source (CLI, services, tools, utils)
├── vscode-extension/openclaude-vscode/   # VS Code companion extension
├── docs/                       # supplementary documentation
├── package.json                # scripts and dependencies
└── AGENTS.md                   # this file
```

When you touch **provider or API shims**, start under `src/services/api/` and related tests. When you touch **tools**, look under `src/tools/`. **MCP** entrypoints live under `src/entrypoints/mcp.ts` and tests alongside them.

## Workflow expectations (for AI assistants)

1. **Read before you edit** — open callers, types, and existing tests; match naming, imports, and patterns already in the tree.
2. **Smallest useful diff** — no unrelated refactors, formatting-only sweeps, or new abstractions unless the task requires them.
3. **Verify with commands** — pick the narrowest script below that matches your change; run it and report the outcome (pass/fail with relevant output). Do not claim green without running something appropriate.
4. **Secrets** — never commit API keys or paste them into issues/PRs. Use environment variables and local config only.
5. **Session continuity** — interpret the latest request in the context of earlier messages; default to steering the current task unless the user clearly changes scope.

## Commands (verification)

| Goal | Command |
|------|---------|
| Full build + quick sanity | `bun run smoke` |
| TypeScript only | `bun run typecheck` |
| Unit tests (default) | `bun test` |
| Provider-focused tests | `bun run test:provider` |
| Provider recommendation tests | `bun run test:provider-recommendation` |
| Stricter gate (typecheck + smoke + doctor) | `bun run hardening:strict` |

CI runs **PR Checks** on GitHub; align with what those workflows exercise when you change packaging or core paths.

## Git and forks

- If you work from a **fork**, keep **`upstream`** pointed at `Gitlawb/openclaude` and merge or rebase **`upstream/main`** regularly so PRs stay reviewable.
- Prefer **linear, well-described commits**; follow any commit-message conventions enforced in this clone (some contributor workflows use conventional commits).

## Where Cursor-specific files fit

The directory `.cursor/skills/local-handbook/` exists for **Cursor Agent** users. It should:

- stay short, and
- **link back here** for anything that applies to all tools.

If guidance diverges, **this `AGENTS.md` wins**.

Other **Cursor / VS Code** assets in this repo (all optional for non-Cursor workflows):

| Path | Purpose |
|------|---------|
| `.cursor/rules/openclaude-*.mdc` | Project rules (core always-on; scoped rules for providers and tools/MCP). |
| `.cursor/mcp.json` | Pinned MCP servers (Playwright, Sequential Thinking, Memory) — reload MCP in the editor after changes. |
| `.cursor/skills/openclaude-powerkit/` | Extra skill: verification ladder and MCP notes for this codebase. |
| `.vscode/settings.json` | Terminal `PATH` prepends for Homebrew / Bun on macOS and Linux. |
| `.vscode/extensions.json` | Recommended extensions (Bun, Python for `python/tests`). |
| `.vscode/tasks.json` | Palette tasks for **Smoke**, **Unit tests**, **Provider tests**, **Runtime doctor** (via **`scripts/cursor-dev-path.sh`** so PATH matches integrated terminals). |
| `scripts/cursor-dev-path.sh` | Shared PATH prepend for **macOS / Linux** (used by `tasks.json`; mirrors `.vscode/settings.json`). |

## Further reading

- **Hermes / Nous:** [hermes-agent `AGENTS.md`](https://github.com/NousResearch/hermes-agent/blob/main/AGENTS.md) (structure and depth) and [FAQ & troubleshooting](https://hermes-agent.nousresearch.com/docs/reference/faq) (operators, browser UIs, gateways).
- **Human-facing docs:** `README.md`, `docs/`, `SECURITY.md`
