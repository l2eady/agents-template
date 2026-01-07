# 🧠 Agent Directives: Agents Template (Infrastructure)

> **System Instruction:** You are working on the **Antigravity Infrastructure**. Your goal is to refine the "Operating System" for other agents.

## 1. Identity & Style
- **Base Persona:** `.antigravity/personas/architect.md` (Primary) & `librarian.md` (Secondary).
- **Architecture:** **Repository Template** (Scaffolding / Configuration as Code).
- **Primary Goal:** Provide a robust, standardized foundation for Multi-Repo Agentic Swarms.

## 2. Tech Stack & Tooling
| Category | Technology | Command |
| :--- | :--- | :--- |
| **Orchestrator** | Makefile | `make` |
| **Logic** | Markdown Workflows | `.agent/workflows/*.md` |
| **Brain** | JSON / Markdown | `.context/` |
| **Templating** | Markdown | `.antigravity/templates/` |

## 3. Map (Key Locations)
- 📂 `.agent/workflows/`: **The Logic.** (How agents behave).
- 📂 `.antigravity/personas/`: **The Roles.** (Who agents are).
- 📂 `.antigravity/templates/`: **The Output.** (RFCs, PRs, Reports).
- 📂 `.context/`: **The State.** (Repo Map, Focus).
- 📄 `Makefile`: **The Controller.**

### 3.1 Artifact Standard (Where to write?)
- **Research (`artifacts/research/`)**: Unsure? Need to learn? Write here. Format: `research_[topic].md`.
- **RFC (`artifacts/rfc/`)**: New Architecture? Breaking Change? Propose here. Format: `rfc_[id]_[topic].md`.
- **Plan (`artifacts/plans/`)**: Ready to code? Plan here. Format: `plan_[id]_[job].md`.

## 4. ⚠️ Immutable Rules (Strict Constraints)
1.  **Consistency:** Changes to `templates/` must be reflected in `workflows/` (e.g., if you change RFC structure, update `feature_kickoff.md`).
2.  **Pathing:** Always use relative paths starting from root or logical variables.
3.  **Simplicity:** Workflows must be understandable by an LLM (Model-Friendly).
4.  **Self-Contained:** The template must work "out of the box" after `make init`.
5.  **Validation:** Before committing changes to `workflows/*.md`, ensure they do not reference non-existent paths or circular dependencies.

## 5. Workflow Integration (Antigravity OS)
Use these slash commands to drive the SDLC:

| Phase | Command | Purpose |
| :--- | :--- | :--- |
| **Start** | `@[/context_sync]` | Align context, git status, and logs. |
| **Design** | `@[/system_design]` | Research & Draft RFCs (Security & Architecture). |
| **Plan** | `@[/feature_kickoff]` | Create Branch & Implementation Plan. |
| **Build** | `@[/implement]` | Write code with Persona routing & Targeted TDD. |
| **Fix** | `@[/debug]` | Reproduce & Fix bugs using Scientific Method. |
| **Verify** | `@[/quality_check]` | Run Unit & E2E Tests (Fail Fast). |
| **Release** | `@[/pr_checklist]` | Generate PR Description & verify compliance. |
| **Docs** | `@[/sync_docs]` | Ensure README/AGENTS.md matches code. |
