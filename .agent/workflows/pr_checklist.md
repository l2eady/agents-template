---
description: Generates a PR description and validates readiness for review.
---

# 📝 Workflow: PR Checklist

**Trigger:** `@[/pr_checklist]`
**Persona:** 🛡️ **Senior QA** + 📝 **The Documentarian**
**Goal:** Prepare a clean, secure, and well-documented Pull Request.

## 1. 🧹 Phase 1: Git Hygiene & Security
1.  **Commit Audit**:
    -   Scan `git log -n 20`.
    -   **Detection:** Look for "wip", "fix", "temp", "debug", or `ai-wip`.
    -   **Action:** If found, advise user: "Multiple WIP commits detected. Consider squashing before PR."
    -   *Suggestion:* `git rebase -i HEAD~[N]`
2.  **Secret Scan (The Paranoia)**:
    -   Check staged files (`git diff --cached --name-only`).
    -   **Regex Match:** `.env`, `.pem`, `key`, `secret`, `token`, `password`, `credentials.json`.
    -   **Rule:** If match found -> **STOP**. "Security Risk: Sensitive file detected in staging area."

## 2. 📋 Phase 2: Definition of Done (DoD)
1.  **Plan Verification**:
    -   Read `[Workspace_Root]/artifacts/plans/plan_[ID].md`.
    -   **Constraint:** Are all checklist items `[ ]` marked as `[x]`?
    -   *If No:* **WARN**. "Plan is incomplete. Are you sure you want to open a PR?"
2.  **Evidence Check**:
    -   Scan `[Workspace_Root]/artifacts/logs/`.
    -   **Constraint:** Is there a recent `[ID]_qc_...` log file that shows "PASS"?
    -   *If No:* **BLOCK**. "Missing QA Evidence. Run `@[/quality_check]` first."

## 3. 📄 Phase 3: The Description Generation
1.  **Load Template**: Read `[Workspace_Root]/.antigravity/templates/pull_request.md`.
2.  **Auto-Fill Strategy**:
    -   **Title:** `feat/fix: [ID] [Concise Title]`
    -   **Summary:** Synthesize from `[Workspace_Root]/.context/current_focus.md` (Objective) and `git log` (Changes).
    -   **Impact:** Read `[Workspace_Root]/.context/repo_map.json` -> List other repos if this is a cross-repo change.
    -   **Links:**
        -   **JIRA**: Resolve `{BASE_JIRA_URL}`.
        -   **Plan**: Link to `[Workspace_Root]/artifacts/plans/plan_[ID].md`.
        -   **RFC**: Link to `[Workspace_Root]/artifacts/rfc/...` (if exists).

## 4. 📤 Phase 4: Output
1.  **Generate File**:
    -   Save content to `[Workspace_Root]/docs/reports/pr_[ID].md`.
2.  **Final Output**:
    -   Display the content in Chat (for easy copy-paste).
    -   "PR Description generated. Ready to ship! 🚀"