---
description: Starts a new feature implementation process across the workspace.
---

# Feature Kickoff Workflow

This workflow initializes the workspace for a new task.

## 1. Plan Initialization
1.  **Understand the Goal**: Identify the JIRA ID or Feature Name from the user request.
2.  **Context Link**:
    - Search for `rfc/*{ID}*.md`.
    - Search for `artifacts/research/*{ID}*.md`.
    - *If found*: Reference these documents in the new plan as "Primary Context".
3.  **Create Artifact**: Create `artifacts/plans/plan_[ID].md` using the standard template, importing decisions from the RFC.
4.  **Update Focus**: Add the new task to `.context/current_focus.md`.

## 2. Repository Setup
For each repository involved in this feature (refer to `.context/repo_map.json`):

1.  **Identify Base Branch**: Read `default_base_branch` from `repo_map.json` (e.g., `staging` or `main`).
2.  **Fetch Latest**:
    ```bash
    cd [Repo_Path] && git fetch origin [Base_Branch]
    ```
3.  **Checkout New Branch**:
    ```bash
    cd [Repo_Path] && git checkout -b feat/[ID] origin/[Base_Branch]
    ```

## 3. Documentation Check
1.  Check if `docs/feat/[ID].md` exists. If not, create a placeholder.

## 4. Notify User
- Confirm that the plan is created and branches are ready.
