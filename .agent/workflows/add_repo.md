---
description: Onboards a new repository or service into the workspace with auto-discovery and validation.
---

# ➕ Workflow: Add Repository

**Trigger:** `@[/add_repo] [URL/Path]`
**Persona:** 📚 **The Librarian** (System Admin)
**Goal:** Ingest a repo, map its metadata (Stack, Persona, Key Files), and register it in `repo_map.json`.

## 1. 📥 Phase 1: Ingestion & Validation
1.  **Check Context Map**:
    -   Read `[Workspace_Root]/.context/repo_map.json`.
    -   **Validation:** If `[Repo_Name]` already exists in `repositories` keys -> **STOP**. Warn: "Repo already registered."

2.  **Check Filesystem**:
    -   **Condition A (URL):** If input is a Git URL:
        -   Execute: `git clone [URL]` into `[Workspace_Root]/[Repo_Name]`.
    -   **Condition B (Folder):** If input is a local path:
        -   Verify directory exists.
        -   *If No:* **STOP**. "Directory not found."

## 2. 🕵️ Phase 2: Auto-Discovery (The Brain)
*Scan the folder to infer metadata.*

1.  **Detect Stack & Persona (Priority Order)**:
    -   *Scan Root Files:*
        -   `go.mod` -> **Stack:** `go` | **Persona:** `.antigravity/personas/gopher.md`
        -   `package.json` + (`next`/`react`) -> **Stack:** `react` | **Persona:** `.antigravity/personas/pixel.md`
        -   `package.json` + (`nest`/`express`) -> **Stack:** `node` | **Persona:** `.antigravity/personas/backend.md`
        -   `requirements.txt` / `pyproject.toml` -> **Stack:** `python` | **Persona:** `.antigravity/personas/snake.md`
        -   `Dockerfile` / `k8s/` -> **Stack:** `infra` | **Persona:** `.antigravity/personas/architect.md`
    -   *Fallback:* If unknown, set Persona to `general.md`.

2.  **Map Key Files (Context Hints)**:
    -   **Entry:** Find `cmd/main.go`, `src/index.ts`, `app.py`.
    -   **Config:** Find `.env.example`, `config.yaml`.
    -   **Specs:** Find `api/openapi.yaml`, `proto/*.proto`.

3.  **Detect Commands**:
    -   **Test:** Check `Makefile` for `test:` target OR `package.json` for `"test":`.
    -   **Lint:** Check for `.eslintrc`, `.golangci.yml`.

## 3. 🗺️ Phase 3: Register in Context
1.  **Update `repo_map.json`**:
    -   Read current JSON.
    -   Append new entry under `repositories`:
    ```json
    "[Repo_Name]": {
        "path": "./[Repo_Name]",
        "type": "service",
        "stack": "[Detected_Stack]",
        "persona": "[Detected_Persona]",
        "key_files": ["[Entry_File]", "[Spec_File]"],
        "commands": {
            "test": "[Detected_Test_Cmd]",
            "lint": "[Detected_Lint_Cmd]"
        },
        "owner": {
            "team": "TBD",
            "slack": "TBD"
        }
    }
    ```
    -   **Save File.**

## 4. 🤖 Phase 4: Agent Initialization
1.  **Inject Identity**:
    -   Check if `[Repo_Path]/AGENTS.md` exists.
    -   *If No:* Copy from `.antigravity/templates/AGENTS.md` to `[Repo_Path]/AGENTS.md`.
    -   **Customize**:
        -   Replace `{{REPO_NAME}}` with `[Repo_Name]`.
        -   Replace `{{STACK}}` with `[Detected_Stack]`.
        -   Replace `{{PERSONA}}` with `[Detected_Persona]`.
    -   *Instruction:* "Created `AGENTS.md`. Please review architecture patterns."

## 5. ✅ Phase 5: Verification
1.  **Dry Run**:
    -   Try running the detected test command (e.g., `make help` or `go version`).
    -   **Rule:** If command fails, update `repo_map.json` commands to `"manual_check_required"`.
2.  **Final Report**:
    -   "Repo **[Repo_Name]** onboarded."
    -   "**Stack:** [Stack] | **Persona:** [Persona]"
    -   "**Action:** Please fill in `owner` details in `repo_map.json`."