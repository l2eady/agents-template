---
description: Onboards a new repository or service into the workspace.
---

# Add Repository Workflow

## 1. Repository Creation/Cloning
1.  **Clone or Create**:
    ```bash
    # If cloning
    git clone [URL] [Folder_Name]
    # If new
    mkdir [Folder_Name]
    ```

## 2. Register in Context
1.  **Update `repo_map.json`**:
    - Add new entry under `repositories`.
    - Set `path`, `stack`, `dependencies`.
    - **Set `default_base_branch`** (Default: `main`).

## 3. Initialize Agent Config
1.  **Copy Template**:
    ```bash
    cp AGENTS.md.template [Folder_Name]/AGENTS.md
    ```
2.  **Customize**: Update the new `AGENTS.md` with specific purpose and tech stack.

## 4. Finalize
- Run `make init` if necessary to set up local environments.
