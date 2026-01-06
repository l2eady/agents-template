---
description: Onboards a new repository or service into the workspace with auto-discovery and validation.
---

#  Workflow: Add Repository
**Trigger:** `@[/add_repo] [URL/Path]`
**Primary Persona:** 📚 The Librarian
**Goal:** Ingest a repo, map its metadata (Stack, Persona, Key Files), and register it in `repo_map.json`.

## 1. 📥 Ingestion & Validation
1.  **Check Context Map**:
    - Read `.context/repo_map.json`.
    - If `[Folder_Name]` already exists in keys -> **STOP**. Warn user: "Repo already registered."

2.  **Check Disk**:
    - Check if directory `[Folder_Name]` exists.
    - If YES but not in Map -> Ask: "Folder exists. Import as [Repo_Name]?"
    - If NO -> Run `git clone [URL]` or `mkdir [Path]`.

## 2. 🕵️ Auto-Discovery (The Brain)
*Scan the new folder to determine metadata automatically.*

1.  **Detect Stack & Persona**:
    - Only one match per repo. Priority order:
    - `go.mod` found? -> **Stack:** `go` | **Persona:** `gopher`
    - `package.json` + `react`? -> **Stack:** `react` | **Persona:** `pixel`
    - `requirements.txt` / `pyproject.toml`? -> **Stack:** `python` | **Persona:** `scripter`
    - `gradle.properties` / `.kts`? -> **Stack:** `kotlin` | **Persona:** `kotlin_backend`
    - `Dockerfile` / `Chart.yaml` -> **Stack:** `infra` | **Persona:** `architect`

2.  **Map Key Files (Context Hints)**:
    - **Entry Point:** Find `cmd/main.go`, `src/index.ts`, `app/main.py`.
    - **Infra:** Find `Dockerfile`, `docker-compose.yml`, `k8s/`.
    - **Specs:** Find `api/openapi.yaml`, `proto/*.proto`.

3.  **Detect Commands**:
    - Check `Makefile` or `package.json`.
    - extract `test`, `build`, `lint` commands.

## 3. 🗺️ Register in Context (The Map)
1.  **Update `repo_map.json`**:
    - Add the new entry under `repositories`:
    ```json
    "[Folder_Name]": {
        "path": "[Rel_Path]",
        "type": "service",
        "stack": "[Detected_Stack]",
        "persona": "[Detected_Persona]",
        "key_files": ["[Entry_Point]", "[Dockerfile]"],
        "urls": {
            "staging": "https://[project]-staging.opn.dev",
            "production": "https://[project].opn.dev"
        },
        "style_guide": ".antigravity/styles/[Detected_Stack].md",
        "commands": {
            "test": "[Detected_Test_Cmd]",
            "build": "[Detected_Build_Cmd]"
        },
        "owner": {
            "team": "[Ask_User]",
            "slack": "[Ask_User]"
        }
    }
    ```

## 4. 🤖 Agent Initialization
1.  **Create/Update `AGENTS.md` (in the new repo)**:
    - Copy from `.antigravity/templates/AGENTS.md`.
    - **Inject Context**:
        - **[Repo Name]**: Folder name.
        - **[Persona]**: Detected Persona (e.g., `gopher`).
        - **[Architecture]**: Infer if possible (e.g. `internal/core` -> Hexagonal), else "Layered".
        - **[Key Locations]**: Map discovered entry points.
    - **Instruction**: "Review `AGENTS.md` and confirm Architecture pattern."

## 5. ✅ Sanity Check (Verification)
1.  **Dry Run**:
    - Try running the detected test command (e.g. `make test --dry-run` or just check `make help`).
    - **Rule:** If command fails or missing, set `commands.test` in `repo_map.json` to `"manual_check_required"`.

2.  **Notification**:
    - "Repo [Name] onboarded successfully. Configured for [Persona]. Please review `repo_map.json`."