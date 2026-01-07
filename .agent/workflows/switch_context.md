---
description: Context Switcher
---

# 🔄 Workflow: Context Switch

**Trigger:** `@[/switch] [Target_ID]`
**Goal:** Safely swap the active context AND git state without data loss.

## 1. 💾 Phase 1: Snapshot Current State (The Departure)
1.  **Identify Current**:
    -   Read `current_focus.md`.
    -   Get `[Active_ID]` and `[Active_Branch]`.
2.  **Git Safety Check (Auto-Stash)**:
    -   Run `git status --porcelain`.
    -   **Condition:** If changes exist (Dirty):
        -   **Action:** `git stash push -m "Auto-stash: Switching away from [Active_ID]"`
        -   **Log:** "Uncommitted changes stashed securely."
3.  **Persist Context**:
    -   Copy `current_focus.md` to `[Workspace_Root]/.context/sessions/session_[Active_ID].md`.
    -   "Memory of [Active_ID] saved."

## 2. 📂 Phase 2: Restore Target State (The Arrival)
1.  **Load Metadata**:
    -   Check if `[Workspace_Root]/.context/sessions/session_[Target_ID].md` exists.
    -   *If Yes:* Copy it to `current_focus.md`.
    -   *If No:* Create a blank slate with `[Target_ID]`.
2.  **Restore Git Branch**:
    -   Read `[Active_Branch]` from the newly loaded `current_focus.md`.
    -   **Action:** `git checkout [Active_Branch]`.
    -   *Constraint:* If branch doesn't exist yet (New Task), stay on current or ask user.
3.  **Stash Recovery (Optional)**:
    -   Check `git stash list`.
    -   **Action:** If a stash entry matches "Auto-stash: ... [Target_ID]", tell the user:
        -   "💡 Found stashed work for this task. Run `git stash pop` to restore?"

## 3. 🧠 Phase 3: Brain Refresh
1.  **Summary**:
    -   "Switched to **[Target_ID]**."
    -   "Git Branch: **[Active_Branch]** (Checked out)."
    -   "Context loaded from session."