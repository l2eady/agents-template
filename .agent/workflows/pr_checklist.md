---
description: Generates a PR description and validates readiness for review.
---

# PR Checklist & Generator

Use this workflow when you are ready to submit your code for review.

## 1. Readiness Verification
1.  **Quality Gate**:
    - Have you run `quality_check`?
    - Check for `docs/reports/{ID}-result.md`. If missing, warns the user.
2.  **Documentation Check**:
    - Scan for changes in `AGENTS.md` or `README.md`.
    - If logic changed but docs didn't, **STOP** and prompt user.

## 2. Content Generation
1.  **Load Template**: Read `docs/templates/pull_request.md`.
2.  **Fill Details**:
    - **JIRA_ID**: From context or user input.
    - **Summary**: Summarize changes from `artifacts/plans/plan_[ID].md`.
    - **Repos**: List modified repositories.
    - **Evidence**: Summary from `docs/reports/{ID}-result.md`.
3.  **Generate Artifact**:
    - Save the filled content to `docs/reports/{ID}_PR_Description.md`.

## 3. Final Step
- Output the path to the generated PR Description.
- User can now `git push` and copy-paste this description.
