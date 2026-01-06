# Variables
REPO_MAP := .context/repo_map.json
ARTIFACTS_DIR := artifacts
DOCS_DIR := docs

# Colors for pretty printing
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
RESET  := $(shell tput -Txterm sgr0)

.PHONY: help test-all e2e init plan pr clean

help: ## Show this help message
	@echo "${GREEN}🛸 Antigravity Workspace Orchestrator${RESET}"
	@echo "-----------------------------------"
	@awk 'BEGIN {FS = ":.*##"; printf "\033[36m\033[0m"} /^[a-zA-Z_-]+:.*?##/ { printf "  ${YELLOW}%-15s${RESET} %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ 🧪 Testing
test-all: ## Run unit tests across all repos defined in repo_map.json
	@echo "${YELLOW}🚀 Launching tests across the galaxy...${RESET}"
	@# 1. Read paths from JSON using jq
	@# 2. Loop through each path and run their local test command
	@if [ ! -f $(REPO_MAP) ]; then echo "❌ $(REPO_MAP) not found!"; exit 1; fi
	@jq -r '.repositories | to_entries[] | "\(.value.path) \(.key)"' $(REPO_MAP) | while read path name; do \
		echo "Testing ${GREEN}$$name${RESET} at $$path..."; \
		if [ -d "$$path" ]; then \
			(cd $$path && make test || echo "❌ $$name Failed"); \
		else \
			echo "⚠️  Path $$path not found, skipping..."; \
		fi \
	done

e2e: ## Run integration tests
	@echo "${YELLOW}🔗 Running E2E verification...${RESET}"
	# Note: Update this path to your actual e2e directory location if different
	@if [ -d "infrastructure/e2e" ]; then make -C infrastructure/e2e test; else echo "⚠️  No global E2E dir found."; fi

##@ 📝 Workflow Shortcuts
plan: ## [Input: ID=...] Start a new Feature Kickoff structure
	@if [ -z "$(ID)" ]; then echo "❌ Please specify ID (e.g., make plan ID=JIRA-123)"; exit 1; fi
	@echo "${GREEN}🏗️  Initializing Plan for $(ID)...${RESET}"
	@cp .antigravity/templates/rfc.md $(ARTIFACTS_DIR)/plans/plan_$(ID).md
	@echo "✅ Created $(ARTIFACTS_DIR)/plans/plan_$(ID).md"
	@echo "👉 Next: Trigger Agent with @[/feature_kickoff] $(ID)"

pr: ## [Input: ID=...] Generate PR Description
	@if [ -z "$(ID)" ]; then echo "❌ Please specify ID"; exit 1; fi
	@echo "${GREEN}📦 Generating PR Checklist for $(ID)...${RESET}"
	@# In a real scenario, the agent would pipe output here.
	@touch docs/reports/pr_$(ID).md
	@echo "👉 Ready to follow .antigravity/workflows/pr_checklist.md"
	@echo "📝 Draft will be saved to: docs/reports/pr_$(ID).md"

##@ 🧹 Maintenance
init: ## Initialize directory structure
	@echo "${GREEN}✨ Initializing workspace...${RESET}"
	@# Centralized artifacts. RFCs moved inside artifacts/ to keep root clean.
	@mkdir -p $(ARTIFACTS_DIR)/{plans,logs,research,rfc} .antigravity/{personas,workflows,templates} .context docs/reports
	@touch .context/repo_map.json
	@touch .antigravity/templates/rfc.md
	@echo "✅ Done."

clean: ## Clean up temporary logs
	@echo "${YELLOW}🧹 Cleaning artifacts...${RESET}"
	@rm -rf $(ARTIFACTS_DIR)/logs/*.log
