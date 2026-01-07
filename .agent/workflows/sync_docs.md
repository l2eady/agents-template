---
description: The Documentarian
---

# 📝 Workflow: Sync Docs

**Trigger:** `@[/sync_docs]` (Usually triggered by Context Sync or PR Checklist)
**Persona:** 📝 **The Documentarian**
**Goal:** Ensure documentation (AGENTS.md, README) matches the code reality.

## 1. 🕵️ Phase 1: Drift Analysis
1.  **Adopt Persona**: Read `[Workspace_Root]/.antigravity/personas/documentarian.md`.
2.  **Identify Scope**:
    -   Read `[Workspace_Root]/.context/current_focus.md` to know the Feature Context.
    -   Run `git diff main...HEAD --stat` to see what files changed.
3.  **Gap Analysis**:
    -   *Check:* Did we add new Environment Variables? -> Check `README.md`.
    -   *Check:* Did we change Agent Logic/Workflow? -> Check `AGENTS.md`.
    -   *Check:* Did we verify BDD Scenarios? -> Check `plan_[ID].md`.

## 2. ✏️ Phase 2: The Update (Drafting)
1.  **Drafting**:
    -   Edit the markdown files to reflect reality.
    -   **Constraint:** Be concise. Use bullet points.
    -   **Rule:** Do NOT delete legacy docs unless explicitly replaced. Appending is safer.
2.  **Verification**:
    -   Display the `git diff` of the documentation files to the user.
    -   Prompt: "I have updated `AGENTS.md` to include [Feature X]. Does this look correct?"

## 3. 💾 Phase 3: Commit
1.  **User Approval**: Wait for "Yes" or "Confirm".
2.  **Execute**:
    -   `git add docs/ AGENTS.md README.md`
    -   `git commit -m "docs: sync documentation with implementation of [ID]"`
    -   "Documentation synchronized. Ready for PR."