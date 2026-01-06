---
description: Runs quality checks (Unit Tests & E2E) across the workspace.
---

# 🚧 Workflow: Quality Check

**Trigger:** `@[/quality_check]`
**Persona:** 🛡️ The Gatekeeper (QA)
**Goal:** Verify code health efficiently (Fail Fast).

## 1. ⚙️ Strategy Determination
1.  **Detect Monorepo**:
    - Check for `turbo.json` in root.
    - *If Found:* Use **Turbo Mode**.
    - *Else:* Use **Standard Mode**.

## 2. 🧪 Unit Testing
1.  **Execute**:
    - **Turbo Mode**: `npx turbo run test --filter=[Repo]`.
    - **Standard Mode**: Read `commands.test` from `repo_map.json` -> Run in [Repo_Path].
2.  **Fail Fast Gate ⛔**:
    - **Constraint:** If Unit Tests FAIL -> **STOP IMMEDIATELY**.
    - **Action:** Report failure. Do NOT proceed to E2E. "Fix Unit Tests first."

## 3. 🕸️ E2E Testing
*Only runs if Unit Tests passed.*
1.  **Execute**:
    - Run defined E2E scenarios.
2.  **Logic Check**:
    - Look for "Business Logic" errors in logs (not just HTTP 200).

## 4. 📝 Report
- **Pass:** "All Green. Ready for PR."
- **Fail:** "Verification Failed. See `artifacts/logs/`."