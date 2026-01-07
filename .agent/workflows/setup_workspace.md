---
description: Interactive wizard to setup a new Antigravity workspace from this template.
---

# 🏗️ Workflow: Setup Workspace (Installer)

**Trigger:** `@[/setup_workspace] [Target_Path]`
**Example:** `@[/setup_workspace] ../OPN-Workspace`
**Persona:** 🚚 **The Distro** (Installer Agent)
**Goal:** Install Antigravity into a target directory, handling multi-repo discovery with strict priority logic to avoid false positives.

## 1. 🎯 Phase 1: Target Validation
1.  **Parse Input**:
    -   Identify `[Target_Path]`.
    -   *Constraint:* If empty, ask "Where should I install? (e.g., `../OPN` or `./target`)".
2.  **Verify Path**:
    -   Check if directory `[Target_Path]` exists.
    -   *If No:* **STOP**. "Target path `[Target_Path]` not found. Please create the folder first."

## 2. 🚚 Phase 2: Injection (The Payload)
*Execute copy commands from Source (Here) to Target.*

1.  **Scaffold Directories**:
    -   `mkdir -p [Target_Path]/.agent/workflows`
    -   `mkdir -p [Target_Path]/.antigravity/styles`
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
        -   **Cleanup:** Remove this installer workflow from the target.
        -   `rm [Target_Path]/.agent/workflows/setup_workspace.md`
    -   **Root Files**:
        -   `cp Makefile [Target_Path]/` (if exists and target is empty)
        -   `cp .antigravity/templates/context.md [Target_Path]/.context/current_focus.md`

## 3. 🕵️ Phase 3: Priority Discovery (The Logic)
*Scan sub-directories with Strict Priority to handle hybrid repos (e.g. Kotlin with Proto/Go).*

1.  **Global Configuration**:
    -   **Prompt User**: "Starting Setup. Please provide Global Configs (or 'skip'):"
        1.  "**JIRA Base URL**"
        2.  "**GitHub/GitLab Org URL**"

2.  **Initialize Map**: `repositories = {}`

3.  **Scan Loop**:
    *Loop through immediate sub-directories of `[Target_Path]`. For each folder `[Repo_Name]`:*

    -   **🚦 Step 3.1: Stack Detection (Strict Priority Chain)**:
        *Evaluate in this EXACT order. Stop at the first match.*

        * **Priority 1: JVM (Kotlin/Java)**
            * **Check:** Does `[Repo_Name]/build.gradle.kts`, `build.gradle`, or `pom.xml` exist?
            * **If Yes:**
                * **Stack:** `kotlin`
                * **Persona:** `.antigravity/personas/kotlin_backend.md`
                * **Action:** Break loop (Ignore any `go.mod` inside).

        * **Priority 2: Python**
            * **Check:** Does `[Repo_Name]/pyproject.toml`, `poetry.lock` exist?
            * **If Yes:**
                * **Stack:** `python`
                * **Persona:** `.antigravity/personas/snake.md`
                * **Action:** Break loop.

        * **Priority 3: Node/TypeScript**
            * **Check:** Does `[Repo_Name]/package.json` exist?
            * **If Yes:**
                * **Stack:** `typescript`
                * **Persona:** `.antigravity/personas/pixel.md` (Assuming Frontend/Fullstack).
                * **Action:** Break loop.

        * **Priority 4: Go (Verified)**
            * **Check:** Does `[Repo_Name]/go.mod` exist?
            * **Verification:** check for `main.go` inside root OR `cmd/` folder.
            * **If Verified:**
                * **Stack:** `go`
                * **Persona:** `.antigravity/personas/gopher.md`
                * **Action:** Break loop.
            * **If Unverified (No main.go):** Treat as library/schema, continue to next check.

        * **Priority 5: Infrastructure**
            * **Check:** `[Repo_Name]/Dockerfile`, `*.tf`, `charts/` exist?
            * **If Yes:**
                * **Stack:** `infra`
                * **Persona:** `.antigravity/personas/architect.md`

    -   **🎨 Step 3.2: Style Guide Generation**:
        * **File:** `[Target_Path]/.antigravity/styles/[Repo_Name].md`
        * **Logic:**
            * *Kotlin:* Default to `ktlint` rules.
            * *Python:* Default to `ruff` rules.
            * *TS:* Default to `eslint/prettier`.
            * *Go:* Default to `golangci-lint`.
        * **Action:** Write file with header `# Style Guide: [Repo_Name]`.

    -   **🗺️ Step 3.3: Map Construction**:
        * Add to `repositories` object:
        ```json
        "[Repo_Name]": {
            "path": "./[Repo_Name]",
            "stack": "[Detected_Stack]",
            "persona": "[Mapped_Persona]",
            "style_guide": ".antigravity/styles/[Repo_Name].md",
            "urls": {
                "staging": "TBD",
                "production": "TBD"
            }
        }
        ```

4.  **Write `repo_map.json`**:
    -   Combine Config + Repositories.
    -   **Write to**: `[Target_Path]/.context/repo_map.json`.
    ```json
    {
      "meta": { "version": "2.1", "updated_at": "YYYY-MM-DD" },
      "project_config": {
        "base_jira_url": "[Input_JIRA_URL]",
        "git_org_url": "[Input_Git_URL]"
      },
      "repositories": [repositories_object]
    }
    ```

## 4. 🏁 Phase 4: Handoff
1.  **Generate `AGENTS.md`**:
    -   Read `.antigravity/templates/AGENTS.md`.
    -   **Inject**: Table of Repositories, Stacks, and Personas.
    -   Write to `[Target_Path]/AGENTS.md`.

2.  **Final Report**:
    -   "✅ Antigravity Installed to `[Target_Path]`."
    -   "🔍 **Discovery:** Mapped Repos with priority logic."
    -   "🎨 **Styles:** Generated per-repo style guides."
    -   "**Next Action:** Close this window and open `[Target_Path]` in VS Code."