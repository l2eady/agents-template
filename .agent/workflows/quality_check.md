---
description: Runs quality checks (Unit Tests & E2E) across the workspace.
---

# Quality Check Workflow

## 1. Context Analysis
- Identify which repositories have changes using `git status` or by checking `.context/current_focus.md`.

## 2. Unit Testing
For each modified repository:
1.  **Execute Tests**:
    ```bash
    # Example for Go
    cd [Repo_Path] && make test
    ```
// turbo
2.  **Log Results**: Save the output to `artifacts/logs/test_[Repo]_[Timestamp].log`.

## 3. Integration Testing (E2E)
1.  **Run E2E Suite**:
    ```bash
    make e2e
    ```
2.  **Capture Evidence**: Record any failure logs to `artifacts/logs/`.

## 4. Report
- Summarize pass/fail status in the chat.
- If failure, consult `rules.md` for strict error handling protocols.
