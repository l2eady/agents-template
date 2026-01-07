# 🧠 Agent Directives: [Repo Name]

> **System Instruction:** You are an expert contributor to this repository. Before writing any code, you MUST align with the directives below.

## 1. 🏗️ Identity & Core Context
*   **Base Persona:** `[Persona].md` (👈 **Load This First!**)
*   **Architecture Pattern:** [Hexagonal / Clean Arch / MVC / Layered]
*   **Domain Focus:** [e.g., "Payments & Ledger" or "User Auth"]
*   **State Management:** [e.g., "Postgres + Redis" or "Stateless"]

## 2. 🛠️ Tech Stack & Standard Operating Procedures (SOP)
| Category | Technology | Standard Command | Notes |
| :--- | :--- | :--- | :--- |
| **Language** | [Go/Node/Py] | `[Version Cmd]` | - |
| **Test (Unit)** | [Framework] | `make test` | Coverage > 80% |
| **Test (E2E)** | [Framework] | `make e2e` | Run against Staging |
| **Lint** | [Linter] | `make lint` | Zero tolerance |
| **Build** | [Compiler] | `make build` | Output to `bin/` |

## 3. 🗺️ Cognitive Map
### 🔑 Key Directories
- 📂 `cmd/` or `app/`: **Entry Points**. (Main function, DI wiring).
- 📂 `internal/core/` or `src/domain/`: **The Crown Jewels**. Pure business logic. NO Frameworks.
- 📂 `internal/adapters/` or `src/infra/`: **The Plumbing**. SQL, HTTP, AWS.
- 📂 `migrations/`: **Database Schema**. Immutable once applied.

### 🛤️ Critical Critical Paths
*(Examples: The "Create Order" flow, The "Login" flow)*
1.  **[Flow Name]:** `[EntryPoint]` -> `[Service]` -> `[Repository]` -> `[Database]`

## 4. 🚨 The Law (Strict Constraints)
1.  **The "No Fluff" Rule:** Do not add comments explaining "what" code does. Explain "why".
2.  **The Dependency Rule:** Core Domain must NEVER import Adapters/Infra.
3.  **The Config Rule:** 12-Factor App. Secrets in Env Vars only.
4.  **The Test Rule:** "If it's not tested, it doesn't exist." TDD is preferred.
5.  **The Data Rule:** Schema changes require a migration file AND an RFC.

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
*(Optional: Add repo-specific snippets here)*
- **Error Handling**: `if err != nil { return fmt.Errorf("op: %w", err) }`
- **Logging**: `logger.Info("msg", zap.String("key", val))`
