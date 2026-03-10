# 🛰️ Platform Agency Agents

[![CI](https://github.com/anmolnagpal/platform-agency-agents/actions/workflows/ci.yml/badge.svg)](https://github.com/anmolnagpal/platform-agency-agents/actions/workflows/ci.yml)

> Complete platform-engineering AI agency: Terraform landing zones, GitHub Actions delivery, Kubernetes runtime, security/compliance assurance, and developer enablement.

**Why teams install this**
- Deep-specialist agents (Terraform, Actions, K8s, SOC2, docs) with runnable snippets and evidence gates.
- CONTROL LOOP operating model (Assess → Architect → Automate → Assure) keeps multi-agent work in sync.
- Ready-to-ship artifacts: Terraform root module, reusable Actions workflow, compliance mappings, runbooks.
- Works everywhere: Claude Code, Cursor, Windsurf, Aider, Gemini CLI, Copilot Chat, OpenCode.

## Quick Start
1. `./scripts/convert.sh` – regenerate tool-specific integrations in `integrations/`.
2. `./scripts/install.sh` (or `--tool <name>`) – copy agents into Claude Code, Cursor, Windsurf, Aider, Gemini CLI, Antigravity, OpenCode.
3. Open `strategy/QUICKSTART.md` and follow the CONTROL LOOP prompts to coordinate Terraform → CI/CD → Kubernetes → Compliance handoffs.

### Option 1: Claude Code (Recommended)
```bash
./scripts/convert.sh
cp integrations/claude-code/*.md ~/.claude/agents/
# or ./scripts/install.sh --tool claude-code
```
Say “Hey Claude, activate <Agent Name>” in a session and start shipping.

### Option 2: Use as Reference
Browse any agent Markdown file to grab:
- Identity + mission
- Critical rules + workflow
- Deliverables with CLI/Terraform/YAML examples
- Communication style + success metrics

### Option 3: Other Tools (Cursor, Aider, Windsurf, Gemini CLI, OpenCode)
```bash
./scripts/convert.sh
./scripts/install.sh --tool cursor      # writes .cursor/rules/*.mdc
./scripts/install.sh --tool aider       # writes CONVENTIONS.md
./scripts/install.sh --tool windsurf    # writes .windsurfrules
./scripts/install.sh --tool gemini-cli  # installs ~/.gemini/extensions/agency-devops/
./scripts/install.sh --tool opencode    # creates .opencode/agent/
```

## Agent Roster

| Division | Agents | Use when you need… |
| --- | --- | --- |
| **Foundation** | [Landing Zone Builder](foundation/foundation-terraform-platform-architect.md) · [Multi-Cloud Navigator](foundation/foundation-multicloud-operator.md) | Landing zones, identity/network baselines, multi-cloud guardrails. |
| **Delivery** | [Pipeline Orchestrator](delivery/delivery-cicd-github-actions-engineer.md) · [Release Captain](delivery/delivery-release-automation-lead.md) | CI/CD topologies, promotion policy, ChatOps deploys, rollback rehearsals. |
| **Runtime** | [Kubernetes Platform Builder](runtime/runtime-kubernetes-platform-engineer.md) · [Observability Lead](runtime/runtime-sre-observability-architect.md) | Cluster blueprints, GitOps, SLO dashboards, incident response. |
| **Assurance** | [Cloud Security Guard](assurance/assurance-cloud-security-engineer.md) · [Compliance Evidence Lead](assurance/assurance-compliance-control-mapper.md) | SOC2 / ISO mappings, policy-as-code gates, evidence packs. |
| **Enablement** | [Platform Technical Writer](enablement/enablement-devops-technical-writer.md) · [Enablement Coach](enablement/enablement-coach.md) | Adoption guides, platform onboarding, stakeholder communications. |

Each agent ships identity, mission, rules, workflow, deliverables, comms style, learning loop, metrics, and advanced capabilities.

## CONTROL LOOP Plays
- **Regulated SaaS zero-to-prod** – Landing Zone Builder + Pipeline Orchestrator + Kubernetes Platform Builder + Compliance Evidence Lead turn up landing zone → CI/CD → K8s → audit evidence (see `examples/control-loop-zero-to-prod.md`).
- **Incident-ready release train** – Release Captain + Observability Lead rehearse ChatOps deploys, SLO checks, rollback bundles using the delivery + runtime agents.
- **Security drift clamp-down** – Cloud Security Guard + Landing Zone Builder run drift scans, generate policy patches, and feed results into Assurance gate.
- **Developer adoption surge** – Enablement Coach + Platform Technical Writer convert the roster into onboarding playbooks and scorecards.

## Templates & Proof
- `templates/terraform-root-module/` – remote state, workspaces, policy hooks.
- `templates/github-actions/monorepo-ci.yml` – lint → unit → integration → OPA/policy workflow.
- `strategy/CONTROL-LOOP.md` + `strategy/QUICKSTART.md` – orchestration prompts.
- `strategy/runbooks/` – scenario handbooks for Terraform, Actions, K8s, Compliance.

## Multi-Tool Install Cheat Sheet
- `claude-code` – copies `.md` agents to `~/.claude/agents/`.
- `cursor` – creates `.cursor/rules/*.mdc` per agent.
- `windsurf` – writes `.windsurfrules` to repo root.
- `aider` – exports merged `CONVENTIONS.md`.
- `gemini-cli` – installs extension under `~/.gemini/extensions/agency-devops/`.
- `antigravity` – copies skills to `~/.gemini/antigravity/skills/`.
- `opencode` – drops agent pack into `.opencode/`.
- `manual` – copy/paste any agent Markdown into your IDE instructions.

## Contributing
- Follow the agent template in `CONTRIBUTING.md`.
- Provide runnable artifacts + success metrics for every deliverable.
- Run `./scripts/lint-agents.sh` (and any template-specific tests) before PRs.

MIT License.
