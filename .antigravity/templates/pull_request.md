# [{JIRA_ID}] [Title]

## 🔗 References & Context
- **JIRA**: [{JIRA_ID}]({BASE_JIRA_URL}/browse/{JIRA_ID})
- **Plan**: [{Plan_ID}](artifacts/plans/plan_{ID}.md)
- **RFC**: [Link to RFC Artifact] (If applicable)

## 📝 Summary
### Background / Context
[Auto-filled by Workflow]

### What This PR Does
[Auto-filled by Workflow]

## 🛠️ Changes
- **[Component]**: [Description]
- **[Component]**: [Description]

## 🛡️ Quality Assurance (Definition of Done)
*Verified against BDD Scenarios in Plan.*

- [ ] **Unit Tests**: Passed (See `artifacts/logs/[ID]_qc_unit_...log`)
- [ ] **Evidence**: [Link to Execution Log]
- [ ] **BDD Scenarios**:
    - [ ] SC-01: [Scenario Name]
    - [ ] SC-ERR-01: [Scenario Name]

## 🔗 Dependencies & Impact
- [ ] **Cross-Repo**: Merge PR [Repo_Name]#[PR_ID] first.
- [ ] **Infra**: Update configuration in [Infra_Repo]#[PR_ID].
- [ ] **Agents**: Updated `AGENTS.md` (if logic changed).

## 🚀 Post-Deployment Tasks
- [ ] Monitor error logs for `[Error_Key]`
- [ ] Verify metrics: `[Metric_Name]`

---

## 📢 Slack Notification
Hi Team, please help review: **[{JIRA_ID}] [Title]**

- **PR Link**: [Link]
- **Jira Link**: [{BASE_JIRA_URL}/browse/{JIRA_ID}]
- **Impact**: [High/Medium/Low]

## 🧪 How to Test on Staging
*Copy-paste to verify immediately.*

- **Config**: Get tokens from Vault/1Password (Do NOT hardcode).
- **Curl Template**:
  ```bash
  curl -v -X POST "{REPO_STAGING_URL}/[ENDPOINT]" \
    -H "Authorization: Bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"key": "value"}'