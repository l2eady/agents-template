# 🎨 Antigravity Coding Style Guidelines

**Effective Date:** 2026-01-06
**Status:** Live

> **Context is King.** Do not blindly apply generic rules. The existing code in the target repository is the "Source of Truth" for style.
> **Persona Mapping:**
> - 🐹 **Gopher:** [Go Backend](#go-backend)
> - ⚛️ **Pixel:** [Frontend Style](#-frontend-style)
> - 🧶 **Kotliner:** [Kotlin Backend](#-kotlin-backend-style)
> - 🐍 **Scripter:** [Python Data](#-python-data-style)

## 👑 The "When in Rome" Protocol (Strict Order)

When modifying any file, you **MUST** follow this hierarchy of authority for coding style:

### 1. ⚙️ Local Configuration (Highest Priority)
Look for these files in the repository root or current directory. **If they exist, OBEY THEM.**
- **General:** `.editorconfig`, `.prettierrc`
- **Go:** `.golangci.yml`, `golangci.yaml`
- **JS/TS:** `.eslintrc.*`, `tsconfig.json`
- **Kotlin:** `build.gradle.kts`, `settings.gradle.kts`, `detekt.yml`, `.ktlint`
- **Python:** `pyproject.toml`, `setup.cfg`, `.pylintrc`

### 2. 📜 Repository Documentation
Check for explicit human-written guides:
- `CONTRIBUTING.md`
- `STYLE.md`
- `AGENTS.md` (Repo-specific overrides)
- `README.md`

### 3. 👯 Mimic Existing Patterns
If no config exists, open 5-15 other files in the **same directory/package**.
- **Indentation:** Tab vs Space? 2 spaces vs 4 spaces?
- **Naming:** `camelCase` vs `snake_case`? `IInterface` vs `Interface`?
- **Error Handling:** `if err != nil` vs `Check(err)`?
- **Imports:** Grouped? Sorted? Local vs Third-party split?

**RULE:** writing "Better" code that looks "Different" is **BAD CODE**. Consistency > "Correctness".

---

## 🛡️ Global Defaults (The Safety Net)
*Only use these if and ONLY IF steps 1-3 yielded no guidance.*

### Go (Backend)
- **Format:** `gofmt` standard.
- **Errors:** Explicit `if err != nil { return nil, err }`. Wraps errors with `fmt.Errorf("context: %w", err)`.
- **Naming:** Short variable names (`ctx`, `r`, `w`). PascalCase for exports.

### React/JS (Frontend)
- **Indent:** 2 Spaces.
- **Semicolons:** Yes (unless repo is strictly no-semi).
- **Naming:** `PascalCase` for Components, `camelCase` for functions/vars.
- **Components:** Functional components with Hooks.

### Infrastructure (Helm/Terraform)
- **Indent:** 2 Spaces.
- **Comments:** Explain "Why", not "What".
l apps
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

## � Kotlin Backend Style
*Applicable to: Backend Services, CLI Tools*

- **Framework:** Ktor (Preferred for Microservices) or Spring Boot 3.x.
- **Build System:** Gradle Kotlin DSL (`.kts`).
- **Concurrency:** Structured Concurrency (Coroutines).
- **Testing:** JUnit 5 or Kotest.

## 🐍 Python Data Style
*Applicable to: Analytics, AI Agents*

- **Type Hints:** Strict typing required (`mypy --strict`).
- **Docstrings:** Google Style Docstrings for all public functions.
- **Models:** Use Pydantic V2 for all data validation.

## 🏗️ Infrastructure Style
*Applicable to: Terraform, Helm, Docker, Argo CD, Kubernetes*

- **Tagging:** All resources must have `Owner` and `Environment` tags.
- **Terraform:**
    - Use remote state with locking (S3 + DynamoDB).
    - Modularize resources; avoid monolithic `main.tf`.
- **Helm/Kubernetes:**
    - Use `values.yaml` for defaults.
    - No hardcoded secrets (Use SealedSecrets or ExternalSecrets).
    - Resource Limits/Requests are MANDATORY.
- **Docker:**
    - Use multi-stage builds (Distroless preferred).
    - Run as non-root user (Security).
    - Tag images with Commit SHA (Immutability).
- **Argo CD:**
    - Use "App of Apps" pattern.
    - Sync Policy: Automated (Prune=true, SelfHeal=true).

---

## 🔄 Data Map & Schema Registry

When passing data between Repositories (e.g., Auth Service -> Payment Service), we follow these **Contract Schemas**:

- **Location:** Defined in `common/proto` (for gRPC) or `common/openapi` (for REST).
- **Versioning:** Semantic versioning in the URL/Package path.
- **Validation:** Schemas must be validated at the Edge gate.
