---
description: The Librarian (Context Sync)
---

# 🔍 Workflow: Context Sync

**Trigger:** `@[/context_sync]` or `ag start`
**Persona:** 📚 The Librarian + 📝 The Documentarian
**Goal:** Synchronize Brain (Context), Reality (Git/Logs), and Knowledge (Docs).

## 1. 🧠 Identity & Knowledge Load
1.  **Adoption**: Read `.antigravity/personas/librarian.md`.
2.    - **Load State**: Read `[Workspace_Root]/.context/repo_map.json` and `[Workspace_Root]/.context/current_focus.md`.

## 2. 📡 Reality Check (The Deep Scan)
*Agent executes commands to perceive the actual state.*

1.  **Git Status (Per Repo)**:
    - Loop through active repos:
        - `git status -sb`
        - `git log -1 --format="%h %s (%cr)"`
    - **Drift Detection**: Does the Git Branch match `Active Branch` in `current_focus.md`?
        - *If No:* Flag **[DRIFT DETECTED]**.

2.  **Log Correlation**:
    - Check `artifacts/logs/`. Was the last run a FAIL?
        - *If Fail:* Priority becomes **"Fix Broken Build"**.

3.  **Dependency Impact**:
    - Check for changes in `common/`, `proto/`.
    - *If Changed:* Flag **[RISK: Cross-Repo Impact]**.

## 3. 📝 Documentation Integrity
1.  **Doc Scan**: check `docs/` timestamp vs `src/` timestamp.
2.  **Drift Alert**: If Code changed significantly (>5 files) without `README.md` or `AGENTS.md` update -> **[DOC DRIFT DETECTED]**.
3.  **Auto-Fix**: Offer to run `@[/sync_docs]`?

## 4. 🧘 Synthesis & Life Sync (The "Ma" Factor)
1.  **Time Check**:
    - Get Current Time (JST).
    - **Rule:** If > 18:00 JST: Prompt *"Wrap up for Bouldering?"* or *"Switch to Personal Project?"*.
2.  **Stale Alert**:
    - If `current_focus.md` > 24h old AND Git is dirty:
    - **Warning:** "Context Drift Detected. You left code open."

## 5. 💾 Write-Back (The Pulse)
1.    - **Update `[Workspace_Root]/.context/current_focus.md`**:
    - **Active Objective:** Synthesize from JIRA + Git.
    - **Status:** 🟢 / 🟡 / 🔴.
    - **Mental Snapshot:** "Last working on [Repo]. Hypothesis: [Hypothesis]."
2.  **Report**:
    - "Welcome back. You are on branch `[branch]`. Logs say [Status]. Docs are [Healthy/Drifting]. Ready?"