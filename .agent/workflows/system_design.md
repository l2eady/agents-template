---
description: System Design & RFC phase before coding begins.
---

# System Design Workflow (Pre-Code)



**Trigger:** `@[/system_design]` or `User: "Design X"`
**Goal:** Transform ambiguous requirements into a concrete, approved technical specification.


## 1. 🧠 Analysis & Research (Optional)
*Perform this step if multiple approaches exist or the path is unclear.*

1.  **Adopt Persona**:
    -   **Role**: 🏗️ **The Architect** (Read `[Workspace_Root]/.antigravity/personas/architect.md`).
    -   *Mindset*: Focus on Scalability, Maintainability, and Trade-offs.

2.  **Trade-off Analysis**:
    -   **Action**: Create `[Workspace_Root]/artifacts/research/{ID}_tradeoff.md`.
    -   **Structure**:
        1.  **Problem Statement**: What are we solving?
        2.  **Options**: Compare at least 2 approaches (e.g., *Option A: Polling* vs *Option B: WebSocket*).
        3.  **Pros/Cons Matrix**: Use a Markdown table.
        4.  **Recommendation**: Pick one and justify why.

3.  **Visual Thinking**:
    -   Draft a rough **Mermaid** sequence diagram or flowchart in the research file to visualize the complexity.


## 2. 📝 Architecture Decision (RFC)
*This is the Source of Truth. Do not skip.*

1.  **Load Template**:
    -   Read `[Workspace_Root]/.antigravity/templates/rfc.md`.

2.  **Drafting**:
    -   **Action**: Create `[Workspace_Root]/artifacts/rfc/{ID}_{Slug}.md`.
    -   **Metadata**: Set `Status: DRAFT` in the frontmatter/header.
    -   **Link**: Add `[JIRA Link]({BASE_URL}/browse/{ID})` (Resolve `BASE_URL` from `[Workspace_Root]/.context/repo_map.json`).
    -   **Synthesis**: Import the *Winning Option* from the Research phase (if applicable).

3.  **🛡️ Security Injection (The Auditor)**:
    -   *Shift Persona:* 🛡️ **The Security Auditor**.
    -   **Audit**: Review the draft specifically for IDOR, Injection, and PII leaks.
    -   **Action**: Fill the "Security & Privacy" section of the RFC.
    -   **Constraint**: If AuthZ is complex, require a specific Sequence Diagram for the Auth flow.

## 3. 🚦 The Approval Gate
1.  **Review Request**: Present the RFC to the user.
    -   *Prompt:* "Please review `[Workspace_Root]/artifacts/rfc/{ID}_{Slug}.md`. Should I refine or approve?"

2.  **On Rejection**:
    -   Iterate on the specific section based on feedback.
    -   Keep `Status: DRAFT`.

3.  **On Approval**:
    -   **Action**: Change metadata to `Status: APPROVED` in the RFC file.
    -   **Freeze**: Treat this document as **Immutable** (unless a new RFC supersedes it).

## 4. 🤝 Handover
-   **Output**: "RFC Approved. Ready for implementation."
-   **Next Action**: Suggest running the kickoff workflow:
    ```bash
    @[/feature_kickoff] {ID}
    ```