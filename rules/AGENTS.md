# Soulkeeper: Memory + Anti-Hallucination Coding Rules

Soulkeeper: Core AI instruction retention, persistent memory, and consistency keeper across sessions.

## 1. Memory (Engram)
- **Start of Task:** If Engram tools are available, call `mem_context`, then `mem_search` with relevant keywords to retrieve previous architecture decisions, known bugs, and project conventions.
- **Save Lessons:** Automatically save lessons with `mem_save` after:
  - Fixing a bug (symptom, root cause, fix, and lesson).
  - Making an architectural or design decision.
  - Discovering version-specific gotchas or tricky configurations.
  Format: Title + What / Why / Where / Lesson.
- If memory tools are not present, proceed normally with standard evidence-based rules.

## 2. Core Principles
- **Verify Before Using (No Invented Code):** Check identifiers, imports, functions, and config keys in the codebase before using them. Never invent flags or APIs.
- **Plan Before Multi-Step Tasks (Plan First):** For tasks spanning >3 steps or multiple files, write a concise plan first. Execute one step at a time with checks.
- **Systematic Debugging:** Reproduce the issue with minimal commands. Prove root cause ("It fails because..."). Minimal surgical fixes only.
- **Verify Before Declaring Done:** Always execute project tests/builds and inspect terminal output before concluding.
- **Strict Truthfulness:** Differentiate clearly: Verified Fact vs. Assumption vs. Unknown.
