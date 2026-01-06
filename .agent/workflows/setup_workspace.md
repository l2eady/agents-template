---
description: Interactive wizard to setup a new Antigravity workspace from this template.
---

# 🏗️ Workflow: Setup Workspace

**Trigger:** `@[/setup_workspace]`
**Primary Persona:** 📚 The Librarian
**Goal:** Initialize the "Brain", detect repos, and configure intelligent defaults.

## 1. 🧬 Foundation Injection
1.  **Scaffold Structure**: 
    - `cp -r .antigravity [Target]/`
    - Ensure `.agent/`, `.context/` exist.
    - **Crucial:** `mkdir -p artifacts/logs artifacts/plans artifacts/research artifacts/rfc` (Create with `.gitkeep` if needed).
    - `cp Makefile AGENTS.md [Target]/` (If missing).
    - `cp -r .agent/workflows [Target]/.agent/` (Remove `setup_workspace.md` from target after copy).

2.  **Initialize Context**:
    - `cp .antigravity/templates/context.md .context/current_focus.md` (Do not overwrite if exists).
    - Verify `.antigravity/templates/rfc.md` exists.
    - Create/Reset `.context/repo_map.json` with skeletal v2.0 structure:
      ```json
      {
        "version": "2.0",
        "workspace_root": ".",
        "config": {},
        "repositories": {}
      }
      ```

## 2. 🕵️ Intelligent Discovery (Multi-Stack Edition)
*Loop through every subdirectory in the root to build the map.*

1.  **Initialize**:
    - Set `personas = {}`
    - Set `routing_rules = {}`

2.  **Scan & Accumulate**:
    *Check all signals. Do NOT stop at the first match.*

    -   **Signal: Backend (Go/Kotlin)**
        -   If `go.mod` found:
            -   `personas.backend = "gopher"`
            -   `routing_rules["**/*.go"] = "backend"`
        -   If `build.gradle.kts` found:
            -   `personas.backend = "kotlin_backend"`
            -   `routing_rules["**/*.kt"] = "backend"`

    -   **Signal: Frontend (Node/React)**
        -   If `package.json` found:
            -   `personas.frontend = "pixel"`
            -   `routing_rules["**/*.ts"] = "frontend"`
            -   `routing_rules["**/*.tsx"] = "frontend"`
            -   *Heuristic:* If inside `src/ui`, prefix rule with `src/ui/**`.

    -   **Signal: Infrastructure**
        -   If `Dockerfile`, `Chart.yaml`, `terraform/` found:
            -   `personas.infra = "architect"`
            -   `routing_rules["**/Dockerfile"] = "infra"`
            -   `routing_rules["**/*.yaml"] = "infra"`

3.  **Determine Default**:
    -   If `backend` exists -> `default = backend`
    -   Else if `frontend` exists -> `default = frontend`
    -   Else -> `default = architect`

2.  **Style Distillery**:
    - Check `.editorconfig`, `.prettierrc`.
    - Generate `.antigravity/styles/[repo_name].md` (Copy from global defaults if specific config found).

3.  **Heuristic Config Mining**:
    - **URLs:** content-search `.env.example`, `helm/values.yaml` for `BASE_URL`.
    - **Commands:** content-search `Makefile` (`test`, `build`) or `package.json` (`scripts`).

## 3. 🗺️ Map Generation
1.  **Assemble JSON**: populate `repo_map.json` repositories with:
    -   `path`: relative path.
    -   `stack`: detected stack (e.g. `hybrid`, `go`, `react`).
    -   `personas`: the accumulation map (e.g. `{ "default": "gopher", "frontend": "pixel" }`).
    -   `routing_rules`: the glob mapping (e.g. `{ "**/*.tsx": "frontend" }`).
    -   `urls`, `commands`, `key_files`.

## 4. 🤝 Human-in-the-Loop Verification
1.  **Batch Summary**: Display a table of detected repos and stacks.
2.  **Global Config**: Ask "Enter JIRA URL" & "Enter GitHub Org URL".
3.  **Fill Blanks**: Ask "Enter Staging URL for [Repo]" ONLY if detection failed.

## 5. ✅ Finalize
1.  **Enhance Global AGENTS.md**:
    - **If exists**: Read content. Locate or Create the `## Repositories` section. Upsert the repository list table. **Preserve** existing custom instructions.
    - **If missing**: Create from `templates/AGENTS.md` and populate.
3.  **Boot Message**: "Workspace initialized. The Librarian is active. Run `@[/context_sync]` to start."