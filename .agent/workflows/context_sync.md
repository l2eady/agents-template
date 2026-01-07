---
description: The Librarian (Context Sync)
---

# 🔍 Workflow: Context Sync

**Trigger:** `@[/context_sync]` or `ag start`
**Persona:** 📚 **The Librarian** (System Admin)
**Goal:** Synchronize Development Environment State (Git/Logs/Docs).

## 1. 🧠 Phase 1: Context Loading
1.  **Identify Session**:
    -   Read `[Workspace_Root]/.context/current_focus.md`.
    -   *Logic:* If file is empty or missing, ask: "No active context. Run `@[/feature_kickoff]` or load a session?"
    -   *Logic:* If active, confirm the `[Active ID]`.

## 2. 📡 Phase 2: System Diagnostic (Reality Check)
*Agent executes commands to verify technical consistency.*

1.  **Git Status Verify**:
    -   Run `git status -sb` in the active repo.
    -   **Drift Check**: Does the current Git Branch match `Active Branch` in `current_focus.md`?
    -   *If Mismatch:* **[ERROR]** "Context Drift: System thinks you are on `[A]`, but Git is on `[B]`. Please align."
2.  **Build Health Verify**:
    -   Scan `[Workspace_Root]/artifacts/logs/` for the most recent `qc_unit` or `debug` log.
    -   *If Status = FAIL:* "Warning: Last build failed. Priority is fixing the build."

## 3. 📝 Phase 3: Documentation Integrity
1.  **Drift Scan**:
    -   Execute: `git diff --name-only main...HEAD`.
    -   **Logic**: If source code files (`.go`, `.ts`, `.py`) changed, but `AGENTS.md` or `README.md` did not.
    -   **Action**: Flag **[DOC DRIFT]** -> "Documentation is outdated relative to code changes."
2.  **Suggestion**:
    -   If Drift detected: "Recommendation: Run `@[/sync_docs]` before PR."

## 4. 📊 Phase 4: Status Report
1.  **Update Pulse**:
    -   Rewrite `current_focus.md` with current timestamp.
2.  **Output**:
    -   "System Sync Complete."
    -   "**Branch:** `[Branch Name]` (Clean/Dirty)"
    -   "**Context:** `[JIRA-ID]`"
    -   "**Health:** [Green/Red]"