# Coding Style & Architectural Standards

Since this workspace contains **Multiple Repositories** with different tech stacks, this file acts as a **Router** and **Global Standard**.

## 🗺️ Repo-to-Style Map (Data Map)

| Repository Pattern | Language | Stack | Style Reference |
| :--- | :--- | :--- | :--- |
| `*_service` | Go | Fiber/Gin | [Go Backend Style](#go-backend-style) |
| `frontend_*` | TypeScript | React/Next.js | [Frontend Style](#frontend-style) |
| `data_*` | Python | Pandas/Pydantic | [Data Science Style](#python-data-style) |
| `infra` | HCL/YAML | Terraform/K8s | [Infrastructure Style](#infrastructure-style) |

> **Note:** If a repository contains a `CONTRIBUTING.md` or `STYLE.md` at its root, **that file takes precedence** over these global rules.

---

## 🟢 Global Defaults (Apply everywhere)

1.  **Naming:** Use `snake_case` for filenames, `camelCase` for variables (except Python/Go where standard idioms apply).
2.  **Comments:** Explain *WHY*, not *WHAT*.
3.  **Config:** All configuration must be via Environment Variables. No hardcoded secrets.
4.  **Error Handling:** Fail fast. Return errors explicitly. Do not swallow exceptions silently.

---

## 🐹 Go Backend Style
*Applicable to: Auth Service, Payment Service*

- **Project Layout:** Follow [Standard Go Project Layout](https://github.com/golang-standards/project-layout).
    - `cmd/`: Main applications
    - `internal/`: Private application code
    - `pkg/`: Library code ok to use by external apps
- **Linter:** `golangci-lint` must pass with default settings.
- **Error Handling:** Use `errors.Wrap` for context. Don't just return `err`.

## ⚛️ Frontend Style
*Applicable to: Web Dashboards, Mobile App*

- **Component Structure:**
    ```text
    components/
      Button/
        index.tsx
        Button.test.tsx
        Button.stories.tsx
    ```
- **State Management:** Prefer React Query (Server State) > Zustand (Global Client State) > Context API.
- **Styling:** TailwindCSS with strict utility class ordering (use `prettier-plugin-tailwindcss`).

## 🐍 Python Data Style
*Applicable to: Analytics, AI Agents*

- **Type Hints:** Strict typing required (`mypy --strict`).
- **Docstrings:** Google Style Docstrings for all public functions.
- **Models:** Use Pydantic V2 for all data validation.

## 🏗️ Infrastructure Style
*Applicable to: Terraform, Helm, Docker*

- **Tagging:** All resources must have `Owner` and `Environment` tags.
- **Docker:**
    - Use multi-stage builds.
    - Run as non-root user.
    - Tag images with Commit SHA.

---

## 🔄 Data Map & Schema Registry

When passing data between Repositories (e.g., Auth Service -> Payment Service), we follow these **Contract Schemas**:

- **Location:** Defined in `common/proto` (for gRPC) or `common/openapi` (for REST).
- **Versioning:** Semantic versioning in the URL/Package path.
- **Validation:** Schemas must be validated at the Edge gate.
