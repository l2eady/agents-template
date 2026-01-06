---
description: Generates a PR description and validates readiness for review.
---

# 📝 Workflow: PR Checklist

**Trigger:** `@[/pr_checklist]`
**Persona:** 🛡️ Senior QA + 📝 Documentarian

## 1. 🕵️ Readiness & Security Scan (The Paranoia)
1.  **Secret Scan**:
    - Check staged files (`git diff --cached --name-only`).
    - **Regex Match:** `.env`, `.pem`, `key`, `secret`, `token`, `password`.
    - **Rule:** If match found -> **STOP**. "Security Risk: Sensitive file detected."

2.  **Dirty Check**:
    - Are there unstaged changes? "Warning: PR might be incomplete."

## 2. 📄 Template Generation
1.  **Load Template**: Read `.antigravity/templates/pull_request.md`.
2.  **Auto-Fill**:
    - **Summary**: Synthesize from `current_focus.md` and `git log`.
    - **Dependencies**: List Cross-Repo PRs if noted in `repo_map.json` or Plans.
    - **JIRA**: Extract from Branch Name.

## 3. 🛡️ Strict Compliance Check
1.  **Log Validation**:
    - "Does `artifacts/logs/` contain a passing test run?"
    - **Rule:** If No -> Flag as "Missing Verification Evidence".

## 4. 📝 Documentation Review
1.  **Agent Logic**:
    - "Did `AGENTS.md` change?"
2.  **Output**:
    - Generate PR description to `docs/reports/pr_[ID].md`.
    - "PR Draft saved. Copy content to GitHub/GitLab."