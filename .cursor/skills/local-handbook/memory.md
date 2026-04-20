# Memory (durable facts)

## Canonical guide

All commands, workflow rules, and repo layout live in **`AGENTS.md`** at the repo root. Read that file before non-trivial work.

## Fork / upstream (only what differs by remote)

- **Upstream:** `https://github.com/Gitlawb/openclaude`
- **This fork (`origin`):** `https://github.com/adrianstanca1/openclaude`
- **Upstream PR (handbook / agents work):** `https://github.com/Gitlawb/openclaude/pull/766`
- **Fork merge PR (historical):** `https://github.com/adrianstanca1/openclaude/pull/1`

Keep **`upstream`** as a remote and merge **`upstream/main`** into your working branch when preparing contributions.

## Machine-specific notes (optional)

Cross-machine preferences (OS paths, personal MCP layout, etc.) belong in **your own** `~/.cursor/skills/local-handbook/memory.md`, not in this repo.

## In-repo Cursor extras (this workspace)

- **Rules:** `.cursor/rules/openclaude-*.mdc` (core always-on; providers/tools are glob-scoped).
- **MCP:** `.cursor/mcp.json` (Playwright, Sequential Thinking, Memory).
- **Power workflow skill:** `.cursor/skills/openclaude-powerkit/SKILL.md`.
- **Editor recommendations:** `.vscode/extensions.json` (Bun + Python for `python/tests`).
- **Tasks:** `.vscode/tasks.json` (Smoke, unit tests, provider tests, runtime doctor).
