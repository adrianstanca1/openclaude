# Memory (durable facts)

## This repository (`openclaude-main`)

- **Path:** `/Users/adrianstanca/Desktop/openclaude-main`
- **Package:** `@gitlawb/openclaude` — CLI that fronts Claude Code against many providers (OpenAI, Gemini, Ollama, etc.).
- **Build:** `bun run scripts/build.ts` (see root `package.json`); dev entry `node dist/cli.mjs` after build; published files include `dist/cli.mjs`, `bin/openclaude`.

## Machine-wide context

Authoritative cross-repo bullets (macOS, Cursor, Go tools, MCP symlink, global skill dirs, communication defaults) live in:

`~/.cursor/skills/local-handbook/memory.md`

Read that file when OS- or editor-level facts matter.

## Anti-patterns (repo + global)

- Shipping or logging API keys; committing `.env` with secrets.
- Claiming `bun run build` / tests pass without running them in the current session.
