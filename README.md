# 🛡️ Soulkeeper

Native Antigravity proactive skills, persistent Engram memory, and anti-hallucination rules for AI coding agents.

---

## 🎯 Proactive Skills

Loaded on-demand via Antigravity progressive disclosure:

| Skill | Trigger | Purpose |
|---|---|---|
| **[`plan-first`](skills/plan-first/SKILL.md)** | Tasks with >3 steps or multi-file edits | Check memory → inspect code → write 3–7 step plan → execute one step at a time with checks. |
| **[`no-invented-code`](skills/no-invented-code/SKILL.md)** | Writing imports, functions, flags, or APIs | Verify real symbols in codebase, manifest (`package.json`, `go.mod`, etc.), or docs. Never hallucinate. |
| **[`systematic-debugging`](skills/systematic-debugging/SKILL.md)** | Errors, test failures, or crashes | 7-step investigation: search memory → reproduce → locate → prove root cause → fix → save lesson. |
| **[`verify-before-done`](skills/verify-before-done/SKILL.md)** | Before declaring "fixed" or "done" | Run project tests, linters, or builds. Inspect actual terminal outputs before claiming completion. |

---

## 🧠 Persistent Memory (Engram MCP)

Cross-session SQLite persistent memory integrated via Antigravity MCP:

| Tool | Usage |
|---|---|
| `mem_context` | Automatically inspects previous project context at the start of a task. |
| `mem_search` | Searches past memories, resolved bugs, and architecture decisions by query. |
| `mem_save` | Saves new decisions, bug solutions, and gotchas for future sessions. |

---

## 🛡️ Core Rules (`rules/AGENTS.md`)

- **Strict Truthfulness:** Clearly differentiate Verified Facts, Assumptions, and Unknowns.
- **Evidence-Based:** Never declare "fixed" without running real verification commands.
- **Stay in Scope:** Never refactor unrelated code.
- **Continuous Memory:** Check context before starting, save lessons upon resolution.

---

## 🚀 Installation

### Option 1: Native Installer Script (Recommended)

Installs the Engram binary, configures the Antigravity MCP server, and installs all skills:
```bash
./install.sh
```

### Option 2: Antigravity CLI Plugin

Inside the project directory:
```bash
agy plugin install .
```

Verify status:
```bash
agy plugin list
agy mcp list
```

---

## 📄 License & Credits

Released under the [MIT License](https://opensource.org/licenses/MIT).  
Forked and adapted from [Hvftpie13/Flashmind_Gemini-3.8-Flash_Smart-agent](https://github.com/Hvftpie13/Flashmind_Gemini-3.8-Flash_Smart-agent.git).
