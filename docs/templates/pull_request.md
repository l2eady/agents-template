# Pull Request: [Title]

## Related Issue / URLs

<!-- Link to the JIRA ticket or Confluence page -->

- JIRA: [TWPHAG-XXX](https://opn-ooo.atlassian.net/browse/TWPHAG-XXX)

## PR Title
- `feat(TWPHAG-xxx): xxx`
- `bugfix(TWPHAG-xxx): xxx`
- `refactor(TWPHAG-xxx): xxx`
- `chore(TWPHAG-xxx): xxx`

## Summary

### Background / Context

<!-- Describe the background and context that led to this PR -->
[Briefly describe the problem or requirement. Context used: `artifacts/plans/plan_[ID].md`]

### What This PR Does

<!-- Briefly describe what this PR does and what improvements it brings -->


## Changes

<!-- Describe the changes in detail (Files touched, Logic changed) -->

---

### Testing

<!-- Describe what tests you have performed or plan to perform (Unit Tests / E2E / Manual) -->
- [ ] **Unit Tests**: `make test` (Pass/Fail) -> See `artifacts/logs/...`
- [ ] **E2E Tests**: `make e2e` (Pass/Fail)

## Post-Deployment Tasks

<!-- Tasks that need to be done after deployment -->

- [ ] Monitor error logs
- [ ] Verify database schema
- [ ] Verify metrics

------

## Slack Notification
Hi @Passagon (Bank), Kittiboonyagarn @Phongphan Phuttha, @Kong @pacharapong.t @atittarn.r @Kim,

please help review: [Title]

PR Link: [Link]

Jira Link: [Link]

## How to Test on Staging
- **Secret Token**: `Secret 42N9792UBBK5KBaiJCAMd3DPz2hc9KR6`
- **User Token**: `Bearer {xxx}`
- **Base URL**: `https://twallet-ph-service.twallet-ph-staging.opn.dev`
- **Template**:
  ```bash
  curl -v -X POST "https://twallet-ph-service.twallet-ph-staging.opn.dev/[ENDPOINT]" \
    -H "Authorization: Secret 42N9792UBBK5KBaiJCAMd3DPz2hc9KR6" \
    -H "Content-Type: application/json" \
    -d '{"key": "value"}'
  ```

## Test Scenarios

<!-- Test Scenarios that might be useful for QA Team -->
