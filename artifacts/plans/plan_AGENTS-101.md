# IMPL-AGENTS-101: Standardize Template References

> **Status**: APPROVED
> **Owner**: The Architect
> **Date**: 2026-01-07
> **JIRA**: [AGENTS-101]({BASE_JIRA_URL}/browse/AGENTS-101)
> **Related Design**: [design_template_references.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/artifacts/research/design_template_references.md)

## 1. Goal Description
Standardize the "References" section across all workflow templates (`plan.md`, `rfc.md`, `pull_request.md`) to ensuring traceability between artifacts.
We will introduce a `> Metadata` block at the top of these files and enforce the use of dynamic variables (`{BASE_JIRA_URL}`) derived from `repo_map.json`.

## 2. User Review Required (Critical)
> [!NOTE]
> This change modifies the core templates. Existing artifacts will not be updated, but new ones will follow the new standard.

- [x] Design approved in [design_template_references.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/artifacts/research/design_template_references.md).

## 3. Proposed Changes

### Component: Templates
#### [MODIFY] [.antigravity/templates/plan.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/.antigravity/templates/plan.md)
- Replace header with new Metadata block.
- Add `JIRA` and `Related RFC` fields.

#### [MODIFY] [.antigravity/templates/rfc.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/.antigravity/templates/rfc.md)
- Add `Parent RFC` row to the header table.
- update `JIRA` link to use dynamic placeholder.

#### [MODIFY] [.antigravity/templates/pull_request.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/.antigravity/templates/pull_request.md)
-  Rename `Related Issue / URLs` to `References & Context`.
- Add explicit links for Plan and RFC.

### Component: Workflows
#### [MODIFY] [.agent/workflows/system_design.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/.agent/workflows/system_design.md)
- **Constraint**: RFC generation must read `repo_map.json` to resolve `{BASE_JIRA_URL}`.
- **Action**: Populate `Parent RFC` and `JIRA` fields in the artifact.

#### [MODIFY] [.agent/workflows/feature_kickoff.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/.agent/workflows/feature_kickoff.md)
- **Constraint**: Plan generation must populate `Related RFC` (if one exists).
- **Resolver**: Ensure `JIRA` link is valid using `repo_map.json`.

#### [MODIFY] [.agent/workflows/pr_checklist.md](file:///Users/puttapongkhemcharoen/Downloads/Personal/projects/agents-template/.agent/workflows/pr_checklist.md)
- **Auto-Fill**: explicitly populate `Plan` and `RFC` fields in the PR description references.

## 4. Verification Plan

### 4.1 Manual Verification
1.  **Generate Test Artifacts**:
    - Manually create a dummy plan/RFC using the new templates.
    - Verify the layout renders correctly in Markdown.
2.  **Verify Variable consistency**: check that `{BASE_JIRA_URL}` is used consistently.
