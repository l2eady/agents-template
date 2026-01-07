# Design: Standardized Template References

**Objective**: Ensure all workflow artifacts (`RFC`, `Plan`, `PR`) are explicitly linked to each other to maintain context and traceability across the lifecycle.

## 1. The "References" Block Pattern

We will implement a standardized `> Metadata` block at the very top of each markdown file (below the title). This is more robust than a separate "References" section because it is immediately visible and follows standard "front-matter-like" patterns in Markdown.

### Pattern: Key-Value Block quotes
```markdown
> **JIRA**: [ID]({BASE_JIRA_URL}/browse/[ID])
> **RFC**: [RFC Title](link to artifact) | None
> **Previous Plan**: [Plan Title](link) | None
```

## 2. Dynamic Link Resolution Strategy (New)
**Constraint**: All external URLs MUST be derived from `.context/repo_map.json` to ensure validity. Hardcoding domains is forbidden.

- **Source**: `repo_map.json` -> `config` object.
- **Variables**:
    - `{BASE_JIRA_URL}`: e.g., `https://my-org.atlassian.net`
    - `{ORG_URL}`: e.g., `https://github.com/my-org`
- **Agent Responsibility**: When creating a file from a template, the Agent must read `repo_map.json`, extract the config, and replace these placeholders.

## 3. Proposed Template Changes

### A. `rfc.md`
Current:
```markdown
| Status | Proposed / Accepted / Deprecated |
| :--- | :--- |
| **Date** | YYYY-MM-DD |
| **Author** | [Name] |
| **JIRA** | [Link] |
```

Proposed:
Add explicit row for **Related Plans/Docs**.

```markdown
| Status | Proposed / Accepted / Deprecated |
| :--- | :--- |
| **Date** | YYYY-MM-DD |
| **Author** | [Name] |
| **JIRA** | [{JIRA_ID}]({BASE_JIRA_URL}/browse/{JIRA_ID}) |
| **Parent RFC** | [Link] (Optional) |
```

### B. `plan.md`
Current:
```markdown
> **Status**: [DRAFT / REVIEW / APPROVED]
> **Owner**: [Agent Persona]
> **Date**: YYYY-MM-DD
```

Proposed:
```markdown
> **Status**: [DRAFT / REVIEW / APPROVED]
> **Owner**: [Agent Persona]
> **Date**: YYYY-MM-DD
> **JIRA**: [{JIRA_ID}]({BASE_JIRA_URL}/browse/{JIRA_ID})
> **Related RFC**: [Link to RFC Artifact] (Required if RFC exists)
```

### C. `pull_request.md`
Current:
```markdown
## Related Issue / URLs
- JIRA: ...
```

Proposed:
Update "Background / Context" to be "References & Context".

```markdown
## References & Context
- **JIRA**: [{JIRA_ID}]({BASE_JIRA_URL}/browse/{JIRA_ID})
- **Plan**: [{Plan_ID}](artifacts/plans/plan_{ID}.md) (Link to the agent plan)
- **RFC**: [Link] (If applicable)
```

## 3. Implementation Plan
1.  Update `.antigravity/templates/plan.md`
2.  Update `.antigravity/templates/rfc.md`
3.  Update `.antigravity/templates/pull_request.md`
