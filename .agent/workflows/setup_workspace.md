---
description: Interactive wizard to setup a new Antigravity workspace from this template.
---

# 🏗️ Workflow: Setup Workspace

**Trigger:** `@[/setup_workspace]`
**Primary Persona:** 📚 The Librarian
**Goal:** Initialize the "Brain", detect repos, and configure intelligent defaults.

## 1. 🧬 Foundation Injection
1.  **Scaffold Structure**: 
    - Ensure `.antigravity/`, `.agent/`, `.context/` exist.
    - **Crucial:** `mkdir -p artifacts/logs artifacts/plans artifacts/research artifacts/rfc` (Create with `.gitkeep` if needed).
    - `cp Makefile AGENTS.md [Target]/` (If missing).

2.  **Initialize Context**:
    - `cp .antigravity/templates/context.md .context/current_focus.md` (Do not overwrite if exists).
    - Verify `.antigravity/templates/rfc.md` exists.
    - Create/Reset `.context/repo_map.json` with skeletal v1.2 structure:
      ```json
      {
        "version": "1.2",
        "workspace_root": ".",
        "config": {},
        "repositories": {}
      }
      ```

## 2. 🕵️ Intelligent Discovery (The Deep Scan)
*Loop through every subdirectory in the root to build the map.*

1.  **Stack & Persona Detection**:
    - **Go:** `go.mod` -> Stack: `go` | Persona: `gopher`.
    - **React:** `package.json` + `react` -> Stack: `react` | Persona: `pixel`.
    - **Python:** `requirements.txt` -> Stack: `python` | Persona: `scripter`.
    - **Kotlin:** `build.gradle.kts` -> Stack: `kotlin` | Persona: `kotlin_backend`.
    - **Infra:** `Dockerfile` / `Chart.yaml` -> Stack: `infra` | Persona: `architect`.

2.  **Style Distillery**:
    - Check `.editorconfig`, `.prettierrc`.
    - Generate `.antigravity/styles/[repo_name].md` (Copy from global defaults if specific config found).

3.  **Heuristic Config Mining**:
    - **URLs:** content-search `.env.example`, `helm/values.yaml` for `BASE_URL`.
    - **Commands:** content-search `Makefile` (`test`, `build`) or `package.json` (`scripts`).

## 3. 🗺️ Map Generation
1.  **Assemble JSON**: populate `repo_map.json` with detected `stack`, `persona`, `urls` (if found), `commands`, and `key_files` (`main.go`, `Dockerfile`).

## 4. 🤝 Human-in-the-Loop Verification
1.  **Batch Summary**: Display a table of detected repos and stacks.
2.  **Global Config**: Ask "Enter JIRA URL" & "Enter GitHub Org URL".
3.  **Fill Blanks**: Ask "Enter Staging URL for [Repo]" ONLY if detection failed.

## 5. ✅ Finalize
1.  **Initialize Repo Directives**:
    - For each repo, copy `.antigravity/templates/AGENTS.md` to `[Repo]/AGENTS.md`.
    - Replace placeholders (`[Persona]`, `[Stack]`) with discovered data.
2.  **Update Global AGENTS.md**: List the configured repositories at the root level.
3.  **Boot Message**: "Workspace initialized. The Librarian is active. Run `@[/context_sync]` to start."