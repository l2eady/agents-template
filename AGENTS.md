# 🧠 Agent Directives: Agents Template (Infrastructure)

> **System Instruction:** You are working on the **Antigravity Infrastructure**. Your goal is to refine the "Operating System" for other agents.

## 1. 🏗️ Identity & Core Context
*   **Base Persona:** `architect.md` (Primary) & `librarian.md` (Secondary).
*   **Architecture Pattern:** **Repository Template** (Scaffolding / Configuration as Code)
*   **Domain Focus:** **Developer Experience** & **Multi-Agent Orchestration**
*   **State Management:** File-based via `.context/` and `.agent/workflows/`.

## 2. 🛠️ Tech Stack & Standard Operating Procedures (SOP)
| Category | Technology | Standard Command | Notes |
| :--- | :--- | :--- | :--- |
| **Language** | Markdown / Makefile | `make` | Pure config |
| **Logic** | Antigravity Workflows | `@[/workflow]` | Stored in `.agent/workflows/` |
| **Test (Verification)** | Manual / Dry Run | `make test` | Logic verification by tracing trigger->goal |
| **Lint** | Markdown Lint | - | - |
| **Build** | Template Generation | `make init` | Ensures template validity |

## 3. 🗺️ Cognitive Map
### 🔑 Key Directories
- 📂 `.agent/workflows/`: **The Logic.** (How agents behave).
- 📂 `.antigravity/personas/`: **The Roles.** (Who agents are).
- 📂 `.antigravity/templates/`: **The Output.** (RFCs, PRs, Reports).
- 📂 `.context/`: **The State.** (Repo Map, Focus).
- 📄 `Makefile`: **The Controller.**

### 🛤️ Critical Critical Paths
1.  **Workflow Creation:** `Idea` -> `Plan` -> `Workflow File (.md)` -> `Verification`
2.  **Template Update:** `Template Change` -> `Workflow Update` -> `Doc Sync`

## 4. 🚨 The Law (Strict Constraints)
1.  **The "Model-Friendly" Rule:** Workflows must be unambiguous prompts. If an LLM gets confused, the workflow is buggy.
2.  **The Consistency Rule:** Changes to `templates/` must be reflected in `workflows/` immediately.
3.  **The Self-Contained Rule:** The template must work "out of the box" after `make init` without external dependencies.
4.  **The Test Rule:** "If it's not tested, it doesn't exist." Use `make plan` to dry-run new workflows.
5.  **The Pathing Rule:** Always use relative paths starting from root or logical variables.

## 5. 🔄 Workflow Integration (Antigravity OS)
*Drive the SDLC using these slash commands. Do not deviate.*

### Phase 1: Strategic Planning
| Goal | Command | Description |
| :--- | :--- | :--- |
| **Sync Context** | `@[/context_sync]` | **Start here.** Align your mind with the codebase state. |
| **Design System** | `@[/system_design]` | **New Feature?** Draft an RFC. Resolve Security/Arch trade-offs. |
| **Start Feature** | `@[/feature_kickoff]` | **Ready to code?** Generate the Plan, Branch, and Scaffolding. |

### Phase 2: Execution (The Loop)
| Goal | Command | Description |
| :--- | :--- | :--- |
| **Write Code** | `@[/implement]` | **Build.** Iterative TDD. Persona-routed editing. |
| **Fix Bugs** | `@[/debug]` | **Stuck?** Isolate, Reproduce, Regress, Fix. (Scientific Method). |

### Phase 3: Finalization
| Goal | Command | Description |
| :--- | :--- | :--- |
| **Verify** | `@[/quality_check]` | **Gatekeeper.** Run fully regression suite. |
| **Ship** | `@[/pr_checklist]` | **Release.** Generate Change Log & PR Description. |
| **Document** | `@[/sync_docs]` | **Housekeeping.** Update README/AGENTS.md. |

## 6. 💡 Common Patterns & Snippets
- **Artifact Standard**:
    - Research: `[Workspace_Root]/artifacts/research/research_[topic].md`
    - RFC: `[Workspace_Root]/artifacts/rfc/rfc_[id]_[topic].md`
    - Plan: `[Workspace_Root]/artifacts/plans/plan_[id]_[job].md`
