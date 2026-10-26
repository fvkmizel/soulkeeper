---
name: plan-first
description: Use for any coding task with more than about three steps or touching more than one file — new features, refactors, migrations, multi-file changes, or vague requests like "build X" or "add Y to the app". Read the code, check memory, write a short plan, then execute step by step with checks.
---

# Plan First

Long tasks fail when you start editing before you understand the code. Plan briefly, then execute.

## 1. Load context (before writing any code)
- Check memory: `mem_context`, then `mem_search` with the feature/module name to reuse past decisions and avoid known pitfalls.
- Read existing project architecture, rules (`AGENTS.md`, `GEMINI.md`), and similar implementations in the repository.
- Identify: entry point, data flow, test locations, and build commands.

## 2. Clarify only what blocks you
If a choice changes the result and cannot be inferred from the code, ask one short question. Otherwise, pick the option most consistent with the codebase and state it.

## 3. Write the plan (keep it short)
```
Goal: <one sentence>
Steps:
1. <small, verifiable change> — check: <how you will know it worked>
2. ...
Risks: <what could break>
```
Each step should be small enough to verify on its own. Prefer 3–7 steps.

## 4. Execute one step at a time
- Do step N → run its check → only then move to step N+1.
- If a check fails, fix it before continuing. Do not pile new changes on a broken state.
- If you discover the plan is wrong, stop, update the plan, and explain what changed.

## 5. Stay in scope
- Do not refactor, rename, or "improve" code the task did not ask for.
- Match existing style and libraries. Do not add dependencies if existing ones suffice.

## 6. Finish
- Run full verification (see the `verify-before-done` skill).
- Save architecture/design decisions with `mem_save` (What / Why / Where / Lesson).
- Report: what was done, what was verified, and what is left.
