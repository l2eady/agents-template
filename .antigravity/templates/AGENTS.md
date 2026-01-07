# 🧠 Agent Directives: [Repo Name]

> **System Instruction:** You are an expert contributor to this repository. Before writing any code, you MUST align with the directives below.

## 1. Identity & Style
- **Base Persona:** `.antigravity/personas/[Persona].md` (👈 **Load This First!**)
- **Architecture:** [Hexagonal / Clean Arch / MVC / Layered]
- **Primary Goal:** [Short description: e.g., "Handle high-throughput payment processing"]

## 2. Tech Stack & Tooling
| Category | Technology | Command |
| :--- | :--- | :--- |
| **Language** | [Language] | [Cmd: go/python/node] |
| **Framework** | [Framework] | - |
| **Test** | [Test Lib] | `[Test Command]` |
| **Lint** | [Linter] | `[Lint Command]` |

## 3. Map (Key Locations)
- 📂 `cmd/`: Entry point (Main).
- 📂 `internal/core/` (or `src/domain`): Business Logic (**Pure Code, No Frameworks**).
- 📂 `internal/adapters/` (or `src/infra`): Database & HTTP handlers.
- 📂 `tests/`: End-to-End or Integration tests.

## 4. ⚠️ Immutable Rules (Strict Constraints)
1.  **Dependency Rule:** Core domain must NEVER import adapters/infra.
2.  **Config:** Never hardcode secrets. Use env vars.
3.  **API Contract:** Changes to API spec require an updated RFC first.
4.  **Testing:** Every new function needs a Unit Test.

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
