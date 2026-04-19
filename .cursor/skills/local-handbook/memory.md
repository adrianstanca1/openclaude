# Memory (durable facts)

## This repository (`openclaude-main`)

- **Package:** `@gitlawb/openclaude` — CLI bridging Claude Code to many LLM providers (OpenAI, Gemini, Ollama, etc.).
- **Build / run:** `bun run scripts/build.ts`; `node dist/cli.mjs` after build; `bin/openclaude` entry.
- **Handbook / GitHub:** the Cursor **local-handbook** skill was merged via **PR #1** (`https://github.com/adrianstanca1/openclaude/pull/1`, state **MERGED**). Upstream mirror: **`https://github.com/Gitlawb/openclaude`**; this fork’s remote is **`origin`** (`https://github.com/adrianstanca1/openclaude.git`). After a large hiatus, run **`git fetch origin`** and align this clone with **`origin/main`** so you are not on a stale or unrelated history.

### Verification (pick narrowest match)

- **`bun run typecheck`** — TypeScript.
- **`bun run smoke`** — `build` + `node dist/cli.mjs --version`.
- **`bun run hardening:strict`** — `typecheck` + smoke + `doctor:runtime`.
- **`bun run test:provider`** / **`bun run test:provider-recommendation`** — targeted Bun tests when touching those areas.

## Machine-wide context

Cross-machine bullets live in **`~/.cursor/skills/local-handbook/memory.md`** (your home directory on each machine).

## Anti-patterns (repo + global)

- Shipping or logging API keys; committing secrets.
- Claiming builds/tests pass without running a command from the list above in this session.
