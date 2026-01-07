# IMPL-[ID]: [Title]

> **Status**: [PLANNING / IN_PROGRESS / DONE]
> **Owner**: [Agent Persona, e.g., Gopher + Pixel]
> **Date**: YYYY-MM-DD
> **JIRA**: [{JIRA_ID}]({BASE_JIRA_URL}/browse/{JIRA_ID})
> **Related RFC**: [Link to RFC Artifact] | None

## 1. Goal Description
*Briefly describe the problem and the "Definition of Done".*
*(Auto-filled from RFC Context)*

## 2. User Review Required (Critical)
*Document decisions requiring user attention.*
> **Use GitHub Alerts (IMPORTANT/WARNING)**
- [ ] Breaking Change: [Description]
- [ ] Config Change: [Description]

## 3. 🛠️ Step-by-Step Execution Strategy
*Order is critical. Dependencies first.*

### Phase 1: Foundation (DB & Config)
- [ ] **[Repo: Backend]** Migration: Add column `x` to table `y`.
- [ ] **[Repo: Infra]** Env Var: Add `ENABLE_FEATURE_X`.

### Phase 2: Core Logic (Backend)
- [ ] **[Repo: Backend]** Domain: Create `struct/model`.
- [ ] **[Repo: Backend]** Service: Implement business logic.
- [ ] **[Repo: Backend]** API: Add Handler/Controller.

### Phase 3: Consumer (Frontend/Client)
- [ ] **[Repo: Frontend]** API Client: Update Type/Interface.
- [ ] **[Repo: Frontend]** UI: Create Component.

## 4. Proposed File Changes (The "What")
*Group files by component. Use [NEW], [MODIFY], [DELETE].*

### Component: [Name]
- [NEW] `path/to/new_file.go`
- [MODIFY] `path/to/existing_file.go`

## 5. 🧪 Verification Checklist (BDD)
*Copy exact scenarios from RFC. These are your Pass/Fail criteria.*

### Automated Tests
- [ ] **Unit Tests**: Coverage > 80% for new logic.
- [ ] **SC-01 (Happy Path)**: [Description]
- [ ] **SC-ERR-01 (Error Case)**: [Description]

### Manual Verification
- Command: `curl -X POST ...`
- Expected: `200 OK { ... }`