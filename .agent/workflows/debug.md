---
description: Targeted Bug Triage & Resolution (Scientific Method)
---

# 🐞 Workflow: Debug (The Investigator)

**Trigger:** `@[/debug] [Context/Error Log]`
**Persona:** 🕵️ The Investigator + 🧪 The Scientist
**Goal:** Fix bugs through rigorous Root Cause Analysis (RCA) and Regression Testing.

## 1. 🔍 Phase 1: Observation & Reproduction
1.  **Collect Evidence**:
    - Read provided logs or user report.
    - Search codebase for the error message or relevant code paths.
2.  **Reproduction**:
    - **MANDATORY**: Attempt to reproduce the bug locally.
    - Create a script or manual steps to trigger the failure.
    - Status: 🔴 **REPRODUCED** or ⚪ **CANNOT REPRODUCE**.

## 2. 🧪 Phase 2: Hypothesis & Regression Test
1.  **Form Hypothesis**: "The bug is likely caused by [Reason] in [File]."
2.  **Write Regression Test**:
    - Write a *Minimal Reproducible Example* as a unit/integration test.
    - **Constraint**: The test MUST fail before you touch implementation code.
    - *Goal*: Prove you understand the bug.

## 3. 🛠️ Phase 3: The Fix
1.  **Minimal Intervention**:
    - Apply the fix in the identified file.
    - Avoid "Refactoring while fixing" unless necessary.
2.  **Verify**:
    - Run the regression test.
    - **Constraint**: If test fails, go back to Phase 2.

## 4. 🏥 Phase 4: Post-Mortem & Prevention
1.  **Blast Radius**: Check if this fix affects other components.
2.  **Documentation**:
    - Update `current_focus.md` with:
        - **Bug**: [Description]
        - **RCA**: [Root Cause]
        - **Prevention**: [How we ensure this doesn't happen again]
3.  **Handover**: "Bug fixed and verified with regression test. Run `@[/pr_checklist]`."
