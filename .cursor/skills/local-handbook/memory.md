# Memory (durable facts)

## This repository (`openclaude-main`)

- **Package:** `@gitlawb/openclaude` — CLI bridging Claude Code to many LLM providers (OpenAI, Gemini, Ollama, etc.).
- **Build / run:** `bun run scripts/build.ts`; `node dist/cli.mjs` after build; `bin/openclaude` entry.
- **Handbook / GitHub:** merged on the fork via **PR #1** (`https://github.com/adrianstanca1/openclaude/pull/1`). **Upstream contribution:** `https://github.com/Gitlawb/openclaude/pull/766` (same `.cursor/skills/local-handbook/` for **Gitlawb/openclaude**). **Sync:** keep **`upstream`** as `https://github.com/Gitlawb/openclaude.git`; run **`git fetch upstream`** then merge/rebase **`upstream/main`** into this fork’s **`main`** before large work (recent merge tip **`2915f62`**). **`origin`** is `https://github.com/adrianstanca1/openclaude.git`. After idle time, **`git fetch origin`** and align with **`origin/main`**.

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
