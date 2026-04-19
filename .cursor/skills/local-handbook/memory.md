# Memory (durable facts)

## This repository (`openclaude-main`)

- **Path:** `/Users/adrianstanca/Desktop/openclaude-main`
- **Package:** `@gitlawb/openclaude` — CLI bridging Claude Code to many LLM providers (OpenAI, Gemini, Ollama, etc.).
- **Build / run:** `bun run scripts/build.ts`; `node dist/cli.mjs` after build; `bin/openclaude` entry.
- **Handbook on GitHub:** branch **`sync/cursor-handbook`** → **PR** `https://github.com/adrianstanca1/openclaude/pull/1` (fork **`origin`**; upstream **`Gitlawb/openclaude`**). Local `main` may still diverge from `origin/main` (unrelated history); use PR or fresh clone for long-term sync.

### Verification (pick narrowest match)

- **`bun run typecheck`** — TypeScript.
- **`bun run smoke`** — `build` + `node dist/cli.mjs --version`.
- **`bun run hardening:strict`** — `typecheck` + smoke + `doctor:runtime`.
- **`bun run test:provider`** / **`bun run test:provider-recommendation`** — targeted Bun tests when touching those areas.

## Machine-wide context

Cross-machine bullets live in **`~/.cursor/skills/local-handbook/memory.md`**.

## Anti-patterns (repo + global)

- Shipping or logging API keys; committing secrets.
- Claiming builds/tests pass without running a command from the list above in this session.
