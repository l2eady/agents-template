---
description: Interactive wizard to setup a new Antigravity workspace from this template.
---

# 🏗️ Workflow: Setup Workspace (Installer)

**Trigger:** `@[/setup_workspace] [Target_Path]`
**Example:** `@[/setup_workspace] ../OPN`
**Persona:** 🚚 **The Distro** (Installer Agent)
**Goal:** Install Antigravity Framework into a target external directory.

## 1. 🎯 Phase 1: Target Validation
1.  **Parse Input**:
    -   Identify `[Target_Path]` from the trigger.
    -   *Constraint:* If empty, ask "Where should I install? (e.g., `../OPN` or `./target`)".
2.  **Verify Path**:
    -   Check if directory `[Target_Path]` exists.
    -   *If No:* **STOP**. "Target path `[Target_Path]` not found. Please create the folder first."

## 2. 🚚 Phase 2: Injection (The Payload)
*Execute copy commands from Source (Here) to Target.*

1.  **Scaffold Directories**:
    -   `mkdir -p [Target_Path]/.agent/workflows`
    -   `mkdir -p [Target_Path]/.antigravity`
    -   `mkdir -p [Target_Path]/.context/sessions`
    -   `mkdir -p [Target_Path]/artifacts/logs`
    -   `mkdir -p [Target_Path]/artifacts/plans`
    -   `mkdir -p [Target_Path]/artifacts/rfc`
    -   `mkdir -p [Target_Path]/docs/reports`

2.  **Asset Migration**:
    -   **Personas & Templates**:
        -   `cp -r .antigravity/personas [Target_Path]/.antigravity/`
        -   `cp -r .antigravity/templates [Target_Path]/.antigravity/`
    -   **Workflows**:
        -   `cp .agent/workflows/* [Target_Path]/.agent/workflows/`
        -   **Cleanup:** Remove this installer workflow from the target to avoid recursion.
        -   `rm [Target_Path]/.agent/workflows/setup_workspace.md`
    -   **Root Files**:
        -   `cp Makefile [Target_Path]/` (if exists)

3.  **Config Bootstrap**:
    -   **Context**:
        -   `cp .antigravity/templates/context.md [Target_Path]/.context/current_focus.md`
    -   **Repo Map**:
        -   *Check:* If `[Target_Path]/.context/repo_map.json` missing -> Create basic structure.
        ```json
        {
          "meta": { "version": "2.0", "updated_at": "YYYY-MM-DD" },
          "project_config": { "base_jira_url": "", "repo_staging_url": "" },
          "repositories": {}
        }
        ```

## 3. 🕵️ Phase 3: Remote Discovery
*Scan the [Target_Path] to generate its local configuration.*

1.  **Scan Target Stack**:
    -   Check files inside `[Target_Path]`:
        -   `go.mod` -> **Stack: Go**
        -   `package.json` -> **Stack: Node/React**
        -   `pyproject.toml` / `requirements.txt` -> **Stack: Python**
        -   `Dockerfile` / `terraform` -> **Stack: Infra**

2.  **Interactive Configuration (The Interview)**:
    -   **Prompt User**: "I detected a **[Detected_Stack]** project. Please provide the following (or type 'skip'):"
        1.  "**JIRA Base URL** (e.g., `https://mycompany.atlassian.net`)"
        2.  "**GitHub/GitLab URL** (e.g., `https://github.com/myorg/myrepo`)"
        3.  "**Staging Base URL** (e.g., `https://api.staging.example.com`)"

3.  **Generate `repo_map.json`**:
    -   Construct the JSON with user inputs (or placeholders `TODO_CHANGE_ME` if skipped).
    -   **Write to**: `[Target_Path]/.context/repo_map.json`.
    ```json
    {
      "meta": { "version": "2.0", "updated_at": "YYYY-MM-DD" },
      "project_config": {
        "base_jira_url": "[Input_JIRA_URL]",
        "git_repo_url": "[Input_Git_URL]"
      },
      "repositories": {
        "main": {
          "path": ".",
          "stack": "[Detected_Stack]",
          "urls": {
            "staging": "[Input_Staging_URL]",
            "production": "TODO_CHANGE_ME"
          }
        }
      }
    }
    ```

## 4. 🏁 Phase 4: Handoff
1.  **Generate `AGENTS.md`**:
    -   Read `.antigravity/templates/AGENTS.md`.
    -   Replace `{{STACK}}` with `[Detected_Stack]`.
    -   Write to `[Target_Path]/AGENTS.md`.

2.  **Final Report**:
    -   "✅ Antigravity Framework installed to `[Target_Path]`."
    -   "⚙️ Configuration saved to `.context/repo_map.json`."
    -   "**Next Action:** Close this window and open `[Target_Path]` in VS Code."