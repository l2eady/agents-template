---
description: Implementation loop with Persona routing.
---

# 🐝 Workflow: Implement

**Trigger:** `@[/implement]` or `ag run`
**Goal:** Execute the Plan with strict, persona-driven code generation and Cross-Repo awareness.

## 1. 🏗️ Phase 1: The Blueprint (Architect)
1.  **Context Loading**:
    -   Read `[Workspace_Root]/.context/current_focus.md`.
    -   **Constraint:** If no active Plan (`[Workspace_Root]/artifacts/plans/plan_[ID].md`) -> **STOP**.
    -   **Action:** Read the **Entire Plan File**.
    -   **State Check:** Identify the first unchecked item `[ ]` in "Step-by-Step Execution Strategy".

## 2. 🌉 Phase 2: The Handover (Bridge)
*Before writing code, check the impact of the current task.*
1.  **Impact Analysis**:
    -   Scan `[Workspace_Root]/.context/repo_map.json`.
    -   Check if the task involves `common/` or `proto/`.
2.  **Contract Check**:
    -   "Does this specific task require a Proto/API update?"
    -   *If Yes:* "Has the Proto/Interface been updated in a previous step?" -> If No, **PRIORITIZE** that task first.


## 3. 🐝 Phase 3: The Execution Loop (Swarm)
*Execute the following loop for the current incomplete task from the Plan.*

### Step 3.1: Persona Selection (Dynamic Switching)
1.  **Identify Target**: Which file needs to be modified for this task?
2.  **Navigate**: `cd [Repo_Path]` (Resolve path from `[Workspace_Root]/.context/repo_map.json`).
3.  **Consult Routing**: Read `routing_rules` in `repo_map.json`.
    -   *Match:* If file matches glob (e.g., `**/*.tsx`) -> Load mapped persona (e.g., `[Workspace_Root]/.antigravity/personas/pixel.md`).
    -   *No Match:* Load the `default` persona.
4.  **Load Context**:
    -   Load Persona Rules ("Negative Constraints").
    -   Load Style Guide: `[Workspace_Root]/.antigravity/styles/[repo].md`.

### Step 3.2: The Inner Loop (Targeted TDD)
1.  **Test First (If applicable)**:
    -   Create or Identify a *Targeted Unit Test* for this specific function.
    -   *Constraint:* Do NOT run the full suite. Use `go test -run [TestName]` or `jest -t [TestName]`.
2.  **Code Gen**:
    -   Write code to satisfy the Plan item and the Test.
    -   **Constraint:** Adhere strictly to the loaded Persona & Style Guide.
3.  **Verify & Fix**:
    -   Run the targeted test.
    -   *Pass:* Proceed to Commit.
    -   *Fail:* Analyze error -> Fix -> Retry (Max 3 retries).
    -   *Critical Failure:* If 3 retries fail, **STOP** and ask user for guidance.
4.  **Commit**:
    -   `git add [File]`
    -   `git commit -S -m "feat([ID]): [Task Description]"`

### Step 3.3: Plan Update
1.  **Mark Complete**: Check `[x]` for the completed item in `[Workspace_Root]/artifacts/plans/plan_[ID].md`.
2.  **Loop or Stop**:
    -   If more tasks exist in the current Phase -> **Repeat Phase 3**.
    -   If Phase is complete -> **Stop and Report**.

## 4. 🛡️ Phase 4: The Report
1.  **Status Update**:
    -   Update `[Workspace_Root]/.context/current_focus.md`.
2.  **Ready for QA**:
    -   Output: "Phase completed. [N] tasks executed. Run `@[/quality_check]` to verify."