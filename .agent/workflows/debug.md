---
description: Targeted Bug Triage & Resolution (Scientific Method)
---

# 🐞 Workflow: Debug

**Trigger:** `@[/debug]`
**Persona:** 🧩 **Dynamic** (Specific Stack Expert in **Debug Mode**)
**Goal:** Fix bugs through rigorous Root Cause Analysis (RCA) and Regression Testing.

## 1. 🔍 Phase 1: Context & Routing
1.  **Identify Target**:
    -   Read `[Workspace_Root]/.context/current_focus.md`.
    -   Look at the error logs or user report to identify the **suspect file/repo**.
2.  **Adopt Persona (Dynamic)**:
    -   **Consult Routing**: Check `[Workspace_Root]/.context/repo_map.json` for the suspect file.
        -   *Match `**/*.go`:* Load `[Workspace_Root]/.antigravity/personas/gopher.md`.
        -   *Match `**/*.tsx`:* Load `[Workspace_Root]/.antigravity/personas/pixel.md`.
    -   **Apply Debug Overlay**:
        -   *Instruction:* "You are now in **DEBUG MODE**. Your priority is NOT feature delivery, but **Stability & Correctness**. Trust nothing. Verify everything."

## 2. 🧪 Phase 2: Reproduction (The Trap)
1.  **Reproduction Strategy**:
    -   **MANDATORY**: Create a *Minimal Reproducible Example*.
    -   *Constraint:* Do NOT try to fix blindly. If you can't reproduce it, you can't fix it.
2.  **Write Regression Test**:
    -   Create a new test case that explicitly triggers the bug.
    -   **Verify Red State**: Run the test. It MUST FAIL.
3.  **Commit "The Trap"**:
    -   `git add [TestFile]`
    -   `git commit -m "test: add regression case for [ID] (expect fail)"`

## 3. 🛠️ Phase 3: The Fix (Surgical)
1.  **Minimal Intervention**:
    -   Apply the fix in the implementation code.
    -   **Constraint**: Use your Persona's best practices (e.g., idiomatic Go error handling, React hooks rules).
    -   *Refactoring Ban:* Do not refactor unrelated code.
2.  **Verify (Green State)**:
    -   Run the regression test.
    -   **Result**: It MUST PASS.

## 4. 🏥 Phase 4: Post-Mortem & QA Handover
1.  **Blast Radius (Local Check)**:
    -   Run related tests in the *same package* to ensure immediate stability.
2.  **Documentation**:
    -   Append to `current_focus.md`:
        -   **🐛 Resolution**: [Root Cause] -> [Fix]
3.  **Handover**:
    -   "Bug fixed and verified locally. Now verifying global impact..."
    -   **Next Action:** "Run `@[/quality_check]` to ensure no side effects."