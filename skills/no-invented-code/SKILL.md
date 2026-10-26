---
name: no-invented-code
description: Use whenever writing or suggesting code that calls a function, file, module, package, CLI flag, config key, environment variable, or API endpoint — especially third-party libraries, SDKs, or framework features. Prevents hallucinated APIs by checking the repo, docs, and memory before using anything.
---

# No Invented Code

Every identifier you use must exist. If you have not seen it, check it — or state explicitly that you have not.

## Inside the project
Before calling or importing something from the codebase:
- Search for it (`grep`, file search, symbols). Confirm the **exact** name, signature, and export.
- Read the file it lives in. Check argument order, return type, and whether it is async.
- Before referencing a file path, confirm the file exists.
- Use the project's existing helpers instead of inventing new ones with similar names.

## Third-party libraries
- Check the **installed version** first: `package.json` / lockfile, `requirements.txt` / `pyproject.toml`, `go.mod`, `Cargo.toml`. APIs change between major versions.
- Verify the API against one of: library source in `node_modules` / site-packages, official docs for that version, or existing repo usage.
- If you cannot verify, say so: *"I believe the option is `X` in v4, but I could not confirm it — please check."*

## Adding a dependency
- Confirm the package name exists and is correct (watch for typosquatting).
- Prefer what the project already uses. Mention every new dependency in your report.

## Commands, flags, config keys, env vars
- Check `--help`, tool docs, or existing scripts before using a flag or key.
- Never invent environment variables; find where the code reads them.

## Memory
If you discover a version-specific gotcha (renamed API, breaking change, wrong docs), save it with `mem_save` so it is remembered in future sessions.
