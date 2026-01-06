---
description: The Documentarian
---

# 📝 Workflow: The Documentarian (Sync Docs)

**Role:** Technical Writer / Housekeeper
Use this workflow BEFORE closing a task or engaging PR Checklist.

## 1. Drift Analysis
1.  **🤯 Adopt Persona**:
    - **Read `.antigravity/personas/documentarian.md`**.
2.  **Scan for Drift**:
    - Run `git diff main...HEAD --stat` (or `git status` if no main).
    - Identify changed modules vs `AGENTS.md` / `README.md`.
3.  **Log Evidence**:
    - Create `artifacts/logs/doc_drift.log`:
      ```text
      [DETECTED DRIFT]
      - Start Feature X: Added to code, missing in AGENTS.md
      - New Env Var: Missing in README.md
      ```

## 2. Reconciliation (Auto-Fix)
1.  **Update**: Edit the markdown files to reflect reality.
2.  **Commit**: `docs: update documentation to match implementation`.

## 3. Verify
- User Review: "I have updated AGENTS.md to include the new Import feature. Please confirm."
