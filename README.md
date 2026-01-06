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
│   ├── feature_kickoff.md  # 🚀 Start here! (Plan First)
│   ├── implement.md        # 🐝 The Coding Loop
│   ├── quality_check.md    # 🚧 Turbo/Fail-Fast Tests
│   └── context_sync.md     # 📚 Wake-up routine
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

## 🛠️ Daily Workflows

### ☀️ Morning Routine
**"Wake up" the agent and sync context.**
```bash
@[/context_sync]
# Checks Git output, failing logs, and drift.
```

### 🏗️ Start a New Feature
**Never write code without a plan.**
```bash
@[/feature_kickoff] JIRA-123
# 1. Checks for dirty files (Safety First)
# 2. Creates 'feat/JIRA-123-slug' branch
# 3. Creates Plan Artifact
```

### 🐝 Implement & Code
**Execute the plan with Swarm Intelligence.**
```bash
@[/implement]
# 1. Architect checks Plan/RFC
# 2. Bridge checks Cross-Repo Impact
# 3. Gopher/Pixel writes code (Targeted TDD)
```

### 🚧 Verify & PR
**Strict Mode: No evidence, no merge.**
```bash
@[/quality_check]  # Run Unit/E2E tests (Fail Fast)
@[/pr_checklist]   # Generate PR Description + Security Scan
```

---

## 🎹 The Orchestrator (`Makefile`)

| Command | Action |
| :--- | :--- |
| `make init` | Create folder structure. |
| `make test-all` | Run tests across ALL repos in `repo_map.json`. |
| `make plan ID=X` | Initialize a generic Plan file. |
| `make pr ID=X` | Initialize a PR Report file. |

---

## 📜 License
MA