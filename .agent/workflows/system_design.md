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
1.  **Draft RFC**: If the research leads to a concrete design, create `rfc/{ID}-{Title}.md`.
    - Use `rfc/TEMPLATE.md`.
    - Define Schema, API Contract, and Dependency Changes here.
2.  **User Review**: Ask user to approve the RFC.

## 3. Handover to Implementation
- Once RFC is **Accepted**, you are ready for `/feature_kickoff`.
- **Crucial Link**: The `{ID}` used in filenames here (e.g., `JIRA-123`) MUST match the ID used in `feature_kickoff`.