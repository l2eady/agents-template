---
description: Starts a new feature implementation process across the workspace.
---

# 🚀 Workflow: Feature Kickoff

**Trigger:** `@[/feature_kickoff] [JIRA-ID]`
**Persona:** 🏗️ The Architect
**Goal:** Cleanly initialize a new feature across the swarm (Safe Branching + Plan).

## 1. 🛡️ Safety First (Pre-Flight Check)
1.  **Dirty Check**:
    - Run `git status --porcelain` in ALL target repos.
    - **Rule:** If ANY repo has uncommitted changes -> **STOP**.
    - **Action:** Ask user to `stash` or `commit` first. No "force checkout" allowed.

## 2. 🌲 Universal Branching
1.  **Generate Branch Name**:
    - Format: `feat/[ID]-[short-slug]` (e.g. `feat/JIRA-1931-email-cron`).
    - *Slug Generation:* Extract keywords from JIRA title or User prompt.
2.  **Sync Creation**:
    - Identify impacted repos (Architect decision).
    - `git checkout -b [Branch_Name]` on those repos only.

## 3. 📝 Plan Initialization
1.  **Create Plan**:
    - **Read Template**: `.antigravity/templates/plan.md`.
    - **Generate**: `artifacts/plans/plan_[ID].md`.
    - **MANDATORY**: Fill **EVERY** section defined in the template. Do not skip "User Review" or "Verification".
    - *Tip:* If an RFC exists, link it.
    - *Tip:* If an RFC exists (`artifacts/rfc/[ID]...`), link it in the plan.
    - Set Status to **PLANNING**.
2.  **Update Context**:
    - Update `current_focus.md` at **Workspace Root** (`.context/current_focus.md`) with:
        - **Active Objective:** [ID] [Title]
        - **Active Branch:** [Branch_Name]
        - **Primary Plan:** `artifacts/plans/plan_[ID].md`

## 4. 🤝 Handover
1.  **Switch Mode**: Enter **PLANNING** mode.
2.  **Prompt**: "Feature [ID] initialized on branch [Branch]. Plan skeleton created. Ready to draft implementation details?"