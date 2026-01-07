---
description: Runs quality checks (Unit Tests & E2E) across the workspace.
---

# 🚧 Workflow: Quality Check

**Trigger:** `@[/quality_check]`
**Persona:** 🐞 **Senior QA Engineer** (Strict Mode)
**Goal:** Verify code health with extreme prejudice. Fail fast on any ambiguity.

## 1. 👺 Phase 1: Adopt the Mindset
1.  **Load Context**:
    -   Read `[Workspace_Root]/.antigravity/personas/qa.md`.
    -   Read `[Workspace_Root]/.context/current_focus.md`.
    -   **Extract ID**: Get the Active Objective ID (e.g., `JIRA-123`) -> Variable `[ID]`.
2.  **Strategy Determination (Priority Order)**:
    -   **1. Turbo Check:** Does `turbo.json` exist? -> Use `npx turbo run test`.
    -   **2. Makefile Check:** Does `Makefile` exist AND contain `test:` target? -> Use `make test`.
    -   **3. Native Fallback:** Identify stack from `[Workspace_Root]/.context/repo_map.json` and use:
        -   Go: `go test -v ./...`
        -   JS/TS: `npm test`
        -   Python: `pytest`

## 2. 🧪 Phase 2: Unit Testing (The Safety Net)
1.  **Execute**:
    -   Run the determined command.
    -   **MANDATORY:** Pipe ALL output (Stdout + Stderr) to `[Workspace_Root]/artifacts/logs/[ID]_qc_unit_[TIMESTAMP].log`.
2.  **The "Clean Logs" Gate ⛔**:
    -   **Constraint (Exit Code):** If Exit Code != 0 -> **FAIL**.
    -   **Constraint (Strict Warnings):**
        -   Scan the log file for keywords: `WARN`, `WARNING`, `DeprecationWarning`.
        -   *If found:* **STOP**. "Persona Violation: Warnings detected in logs. Fix them immediately." (Reference `qa.md`).
3.  **Coverage Check**:
    -   Did we hit the target coverage? (If configured in `plan.md`).

## 3. 🕸️ Phase 3: BDD & Destructive Testing
*Only run if Unit Tests were clean.*

1.  **Load Contracts**:
    -   Read `[Workspace_Root]/artifacts/plans/plan_[ID].md` -> Extract "Verification Checklist (BDD)".
    -   Read `[Workspace_Root]/artifacts/rfc/...` -> Check "Edge Cases" section.

2.  **Execute Scenarios (Automated First)**:
    -   **Action:** Convert BDD steps into `curl` commands or script calls.
    -   **Output:** Save results to `[Workspace_Root]/artifacts/logs/[ID]_qc_e2e_[TIMESTAMP].log`.
    -   **Happy Path Check:** Run SC-01 (Success Case).
    -   **Edge Case Check:** Run SC-ERR-01 (Error Case).

3.  **Destructive Check (Mental Model)**:
    -   *Self-Ask:* "If I send a string instead of an int, does it 500?"
    -   *Self-Ask:* "If the DB is slow, does this handle timeout?"
    -   **Action:** Check application logs for Stack Traces or Panic.
    -   *If stack trace found:* **FAIL**.

## 4. 📝 Phase 4: The Verdict
1.  **Evidence Review**:
    -   Verify `[Workspace_Root]/artifacts/logs/` exists and contains files prefixed with `[ID]`.
2.  **Reporting**:
    -   **FAIL:** "QA Rejected. Found [Error/Warning]. See `[Workspace_Root]/artifacts/logs/[ID]_...`. Run `@[/debug]`."
    -   **PASS:** "QA Approved. Logic verified against BDD. No warnings in logs. Then **Generate File**: Save content to `[Workspace_Root]/docs/reports/qa_[ID].md`. Ready for `@[/pr_checklist]`."