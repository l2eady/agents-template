---
description: Initiates a Research & Design phase before coding begins.
---

# System Design Workflow (Pre-Code)

Use this workflow when you need to research and design a complex system before writing implementation code.

## 1. Research Phase
1.  **🤯 Adopt Persona**:
    - **Read `.antigravity/personas/architect.md`**.
    - *Shift your mindset to high-level design and trade-offs.*

2.  **Trigger**: User says "Research X" or "Design X for JIRA-123".
3.  **Output**: Create `artifacts/research/{ID}_{Topic}.md`.

## 2. Architecture Decision (RFC)
1.  **Draft RFC**:
    - **Crucial:** Read `.antigravity/templates/rfc.md` first.
    - Copy the **Exact Structure** (including Sequence Diagrams and Tables) to `artifacts/rfc/{ID}_{Title}.md`.
    - **Context Resoloution**: Read `repo_map.json` "config" to resolve `{BASE_JIRA_URL}` and populate the JIRA link.
    - Fill in the sections. Do not skip the "Technical Design" or "Sequence Diagram" sections.
2.  **User Review**: Ask user to approve the RFC.

## 3. Handover to Implementation
- Once RFC is **Accepted**, you are ready for `/feature_kickoff`.
- **Crucial Link**: The `{ID}` used in filenames here (e.g., `JIRA-123`) MUST match the ID used in `feature_kickoff`.