---
name: local-handbook
description: >-
  Cursor-only shim. The canonical agent guide is ../../../AGENTS.md (repo
  root). Open AGENTS.md first for workflow, verification, and structure.
  This skill only adds Cursor path reminders; it must not contradict AGENTS.md.
---

# Local handbook (Cursor)

## Canonical source

Read **`AGENTS.md`** at the repository root (`../../../AGENTS.md` from this file). It replaces long, duplicated instructions in this folder.

## When Cursor still loads this skill

- You need a one-line reminder that **Bun** builds `dist/cli.mjs` and **`bun run smoke`** is the fastest sanity check.
- You are about to edit **`.cursor/`** itself—keep changes minimal and point agents back to **`AGENTS.md`**.

## Files here

| File | Purpose |
|------|---------|
| `logic.md` | Optional extra process notes; defer to **AGENTS.md** when they overlap. |
| `memory.md` | Short fork/upstream URLs only—no duplicate command tables. |
