.PHONY: help test e2e

help:
	@echo "🛸 Antigravity Workspace Orchestrator"
	@echo "-----------------------------------"
	@echo "make test   - Run unit tests across all known repos"
	@echo "make e2e    - Run integration tests"
	@echo "make init   - Initialize a new repo from template"

test:
	@echo "Running tests for all services..."
	# Add logic to loop through repos in .context/repo_map.json or hardcoded list
	# (cd Repo_1 && make test)
	# (cd Repo_2 && make test)

e2e:
	@echo "Running E2E verification..."
	# (cd Infra_Repo && make e2e)

init:
	@echo "Initializing workspace..."
	@mkdir -p artifacts/plans artifacts/logs artifacts/research rfc docs/feat docs/bugfix docs/reports .context .agent/workflows .antigravity
