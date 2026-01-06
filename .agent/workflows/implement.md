---
description: Implementation loop with Persona routing.
---

# 🐝 Workflow: Implement

**Trigger:** `@[/implement]` or `ag run`
**Goal:** strict, persona-driven code execution with Cross-Repo awareness.

## 1. 🏗️ Phase 1: The Blueprint (Architect)
1.  **Context Check**:
    - Read `current_focus.md` and `artifacts/plans/plan_[ID].md`.
    - **Constraint:** If no active Plan/RFC -> **STOP**. "Plan First Approach required. Run `@[/feature_kickoff]`."

## 2. 🌉 Phase 2: The Handover (Bridge)
*Before writing code, check the impact.*
1.  **Impact Analysis**:
    - Scan `repo_map.json`.
    - Check `common/`, `proto/` for recent changes.
2.  **Contract Check**:
    - "Does this change require a Proto/API update?"
    - *If Yes:* "Has the Proto PR been merged?" -> If No, **BLOCK**.

## 3. 🐝 Phase 3: The Execution (Swarm)

1.  **Persona Selection (Dynamic Switching)**:
    -   **Identify Target File**: specific file being modified.
    -   **Consult Routing**: Read `routing_rules` in `.context/repo_map.json`.
        -   *Match:* If file matches glob (e.g. `**/*.tsx`) -> Load mapped persona (e.g. `pixel`).
        -   *No Match:* Load the `default` persona.
    -   **Load Context**: Load Persona file & `.antigravity/styles/[repo].md`.
    -   **Constraint:** Adhere to "Negative Constraints" strictly.

2.  **The Inner Loop (Targeted TDD)**:
    - **Scope**: Identify *only* the specific file/function being modified.
    - **Targeted Test**: Create or identify a *targeted unit test* (avoid running full suite).
    - **Code**: Write code to satisfy the plan and the test.
    - **Verify**: Run the *targeted test*.
        - *Pass:* `git commit -m "feat: [step details]"`
        - *Fail:* Read error, Fix, Retry (Max 3 retries).
    - **Refactor**: Check against "Negative Constraints" before moving on.

## 4. 🛡️ Phase 4: The Report
1.  **Status Update**:
    - Update `current_focus.md` (Progress checklist).
2.  **Ready for QA**:
    - "Implementation complete. Run `@[/quality_check]` to verify."