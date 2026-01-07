# Pull Request: [Title]

## References & Context
- **JIRA**: [{JIRA_ID}]({BASE_JIRA_URL}/browse/{JIRA_ID})
- **Plan**: [{Plan_ID}](artifacts/plans/plan_{ID}.md)
- **RFC**: [Link] (If applicable)

## PR Title
- `feat({JIRA_ID}): xxx`
- `bugfix({JIRA_ID}): xxx`
- `refactor({JIRA_ID}): xxx`
- `chore({JIRA_ID}): xxx`

## Summary

### Background / Context

<!-- Describe the background and context that led to this PR -->
[Briefly describe the problem or requirement. Context used: `artifacts/plans/plan_[ID].md`]

### What This PR Does

<!-- Briefly describe what this PR does and what improvements it brings -->


## Changes

<!-- Describe the changes in detail (Files touched, Logic changed) -->

## 🔗 Dependencies
<!-- List any PRs that must be merged before this one -->
- [ ] Merge PR [Repo_Name]#[PR_ID] first.
- [ ] Update Infra configuration in [Infra_Repo]#[PR_ID].

## 🤖 Agentic Impact
- [ ] Updated `AGENTS.md` to reflect new logic for this feature.

---

### Testing

<!-- Describe what tests you have performed or plan to perform (Unit Tests / E2E / Manual) -->
- [ ] **Unit Tests**: `make test` (Pass/Fail) -> See `artifacts/logs/...`
- [ ] **E2E Tests**: `make e2e` (Pass/Fail)
- [ ] **Strict Mode**: Execution Logs attached? (Required by QA)

## Post-Deployment Tasks

<!-- Tasks that need to be done after deployment -->

- [ ] Monitor error logs
- [ ] Verify database schema
- [ ] Verify metrics

------

## Slack Notification
Hi Team,

please help review: [Title]

PR Link: [Link]

Jira Link: [{BASE_JIRA_URL}/browse/{JIRA_ID}]

## How to Test on Staging
- **Secret Token**: `[Get from Infra Repository/Vault/1Password]` (Do NOT hardcode here)
- **User Token**: `Bearer {xxx}`
- **Base URL**: `{REPO_STAGING_URL}` (See `repo_map.json`)
- **Template**:
  ```bash
  curl -v -X POST "{REPO_STAGING_URL}/[ENDPOINT]" \
    -H "Authorization: [Secret]" \
    -H "Content-Type: application/json" \
    -d '{"key": "value"}'
  ```

## Test Scenarios

<!-- Test Scenarios that might be useful for QA Team -->