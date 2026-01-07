---
description: Starts a new feature implementation process across the workspace.
---

# 🚀 Workflow: Feature Kickoff

**Trigger:** `@[/feature_kickoff] [JIRA-ID]`
**Persona:** 🏗️ The Architect
**Goal:** Cleanly initialize a new feature across the swarm (Safe Branching + Plan + Context Switching).

## 1. 🛡️ Safety First (Pre-Flight Check)
1.  **Dirty Check**:
    -   Read `[Workspace_Root]/.context/repo_map.json` to find all active repositories.
    -   Run `git status --porcelain` in ALL target repos.
    -   **Rule:** If ANY repo has uncommitted changes -> **STOP**.
    -   **Action:** Ask user to `stash` or `commit` first. No "force checkout" allowed.

## 2. 🌲 Universal Branching
1.  **Generate Branch Name**:
    -   Format: `feat/[ID]-[short-slug]` (e.g. `feat/JIRA-1931-email-cron`).
    -   *Slug Generation:* Extract keywords from JIRA title or User prompt.
2.  **Sync Creation**:
    -   Identify impacted repos based on the user request.
    -   **Execute:** `git checkout -b [Branch_Name]` on those repos only.

## 3. 📝 Plan Initialization (The Bridge)
1.  **Context Loading (Smart Ingest)**:
    -   **Search:** Check if `[Workspace_Root]/artifacts/rfc/[ID]*.md` exists.
    -   **If RFC Found:** Read it. Extract **BDD Scenarios** and **Schema Changes**.
    -   **If No RFC:** Prepare to ask user for requirements.

2.  **Create Plan Artifact**:
    -   **Execute**: `cp [Workspace_Root]/.antigravity/templates/plan.md [Workspace_Root]/artifacts/plans/plan_[ID].md`
    -   **Auto-Fill (Crucial)**:
        -   **Goal**: Summarize from RFC or User Input.
        -   **Scenarios**: Copy BDD tables from RFC (if available).
        -   **Links**: Resolve `{BASE_JIRA_URL}` from `repo_map.json`.
    -   **Status**: Set to `Status: PLANNING`.

3.  **Context Preservation (Auto-Save)**:
    -   **Read Current:** Check `[Workspace_Root]/.context/current_focus.md`.
    -   **Condition:** If an `Active Objective` exists AND differs from the new [ID].
    -   **Action:** Copy current content to `[Workspace_Root]/.context/sessions/session_[Old_ID].md`.
    -   **Log:** "Previous session [Old_ID] saved to storage."

4.  **Update Context (New Task)**:
    -   Overwrite `[Workspace_Root]/.context/current_focus.md` with new template data.
    -   **Content:**
        -   **Active Objective:** [ID] [Title]
        -   **Active Branch:** [Branch_Name]
        -   **Primary Plan:** `[Workspace_Root]/artifacts/plans/plan_[ID].md`
        -   **Status:** 🔵 Planning

## 4. 🤝 Handover
1.  **Switch Mode**: Enter **PLANNING** mode.
2.  **Prompt**: "Feature [ID] initialized. Previous context saved (if any). Review `[Workspace_Root]/artifacts/plans/plan_[ID].md` now?"