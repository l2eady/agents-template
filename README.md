# 🛸 Antigravity Agents Template (v2.0)

> **The Operating System for Multi-Agent Swarms.**
> Designed for high-velocity teams using Cursor, Windsurf, or Agentic IDEs.

## 🌟 Philosophy: The Swarm Strategy
This template enforces a strict **"Plan First"** and **"Persona-Driven"** workflow. Agents are not just random coders; they are specialized roles (Architect, Bridge, Gopher) working in concert.

### The Team (Personas)
*   **🏗️ The Architect:** Plans features, ensures clean design.
*   **🌉 The Bridge:** Checks cross-repo impact (API/Proto).
*   **📚 The Librarian:** Manages context, git state, and documentation.
*   **🛡️ The QA:** Strict gatekeeper. No logs = No PR.
*   **👷 The Implementers:** `Gopher` (Go), `Pixel` (React), `Kotliner` (Kotlin), `Scripter` (Python).

---

## 📂 Structure (The Brain)

```text
.
├── .agent/workflows/       # 🧠 The Logic: Step-by-step agent instructions
│   ├── setup_workspace.md  # 🏗️ Wizard for new machines
│   ├── add_repo.md         # ➕ Onboard new repositories
│   ├── context_sync.md     # 📚 Wake-up routine
│   ├── system_design.md    # 📐 RFC & Architecture planning
│   ├── feature_kickoff.md  # 🚀 Start here! (Plan First)
│   ├── implement.md        # 🐝 The Coding Loop
│   ├── debug.md            # 🐞 Scientific Debugging
│   ├── quality_check.md    # 🚧 Turbo/Fail-Fast Tests
│   ├── pr_checklist.md     # 📦 Release & PR Generation
│   ├── sync_docs.md        # 📝 Documentation Updates
│   └── switch_context.md   # 🔄 Switch active focus
├── .antigravity/           # 🏛️ The Core: Templates & Personas
│   ├── personas/           # Identity files
│   └── templates/          # RFC, PR, Directives
├── .context/               # 💾 The Memory: Persistent state
│   ├── repo_map.json       # 🗺️ Multi-repo configuration
│   └── current_focus.md    # 🫀 The Pulse (Active Status)
└── artifacts/              # 🗃️ The Output
    ├── plans/              # ✅ Approved Implementation Blueprints (The "How")
    ├── research/           # 🕵️ Exploration, POCs, Trade-off Analysis (The "Learning")
    ├── rfc/                # 📝 Technical Proposals, API Specs, Schema Designs (The "Proposal")
    └── logs/               # 🧾 Execution Evidence & Test Results
```

---

## 🚀 Getting Started

### ⚙️ Prerequisites
Before running `make init`, ensure you have the following tools:
- **Make:** Standard build tool (Pre-installed on Mac/Linux).
- **jq:** JSON processor (Required for `repo_map.json` parsing).
  - Mac: `brew install jq`
  - Linux: `apt-get install jq`
  - Windows: `choco install jq`

### 1. Initialize Workspace
```bash
make init
# Creates directory structure and seeds templates
```

### 2. Configure Repos (First Time Only)
```bash
@[/setup_workspace]
# Scan your disk, detect stacks, and build repo_map.json
```

---

## 🛠️ Antigravity Workflows (The OS)

Drive the Software Development Life Cycle (SDLC) using these slash commands.

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
| **Switch** | `@[/switch_context]` | **Jump.** Safely switch context between repositories. |

### Phase 3: Finalization
| Goal | Command | Description |
| :--- | :--- | :--- |
| **Verify** | `@[/quality_check]` | **Gatekeeper.** Run fully regression suite. |
| **Ship** | `@[/pr_checklist]` | **Release.** Generate Change Log & PR Description. |
| **Document** | `@[/sync_docs]` | **Housekeeping.** Update README/AGENTS.md. |

### 🔧 Administration
| Goal | Command | Description |
| :--- | :--- | :--- |
| **Setup** | `@[/setup_workspace]` | **Init.** Wizard to setup a new workspace. |
| **Add Repo** | `@[/add_repo]` | **Grow.** Onboard a new repository or service. |

---

## 🎹 The Orchestrator (`Makefile`)

| Command | Action |
| :--- | :--- |
| `make init` | Create folder structure. |
| `make test-all` | Run tests across ALL repos in `repo_map.json`. |
| `make e2e` | Run integration tests (infrastructure/e2e). |
| `make plan ID=X` | Initialize a generic Plan file. |
| `make pr ID=X` | Initialize a PR Report file. |
| `make clean` | Clean up temporary logs. |

---

## 📜 License
MIT