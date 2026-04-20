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

Always **`bun run build`** (or `bun run smoke`) after pulling `main` if `dist/` might be stale.

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

## Further reading

- **Hermes-style agent guide** (reference for structure and depth): `https://github.com/NousResearch/hermes-agent/blob/main/AGENTS.md`
- **Human-facing docs:** `README.md`, `docs/`, `SECURITY.md`
