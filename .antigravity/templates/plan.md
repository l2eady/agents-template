# IMPL-[ID]: [Title]

> **Status**: [DRAFT / REVIEW / APPROVED]
> **Owner**: [Agent Persona]
> **Date**: YYYY-MM-DD

## 1. Goal Description
*Provide a brief description of the problem, background context, and what the change accomplishes.*

## 2. User Review Required (Critical)
*Document anything that requires user review or clarification (e.g., breaking changes, significant design decisions).*
> **Use GitHub Alerts (IMPORTANT/WARNING)**

- [ ] Decision 1...
- [ ] Breaking Change X...

**(If none, explicitly state "None")**

## 3. Proposed Changes
*Group files by component. Use [NEW], [MODIFY], [DELETE].*

### Component: [Name]
- [NEW] `path/to/new_file.go`
- [MODIFY] `path/to/existing_file.go`
    - *Brief note on what changes inside.*

## 4. Verification Plan
*Summary of how you will verify changes.*

### 4.1 Automated Tests
- Command: `make test`
- New Unit Tests: [List coverage areas]

### 4.2 Manual Verification
- Command: `curl ...`
- Expected Output: `...`
