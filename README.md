# 🛰️ Platform Agency Agents

[![CI](https://github.com/anmolnagpal/platform-agency-agents/actions/workflows/ci.yml/badge.svg)](https://github.com/anmolnagpal/platform-agency-agents/actions/workflows/ci.yml)

> Opinionated AI agent roster for platform engineering teams: Terraform landing zones, multi-cloud operations, GitHub Actions delivery, Kubernetes runtime, security & compliance assurance, and technical enablement.

## Why This Exists

Shipping infra today means juggling IaC, delivery, runtime, and governance disciplines. Platform Agency packages deep-specialist agents (with code, workflows, and evidence gates) so you can activate a complete DevSecOps program inside Claude Code, Cursor, Windsurf, Aider, Gemini CLI, or any other agentic IDE.

- **Platform-first:** Every agent owns a concrete slice of the stack (Terraform, Actions, K8s, SOC2) with deliverables you can run.
- **Control-loop orchestration:** Built around the CONTROL LOOP (Assess → Architect → Automate → Assure) so multiple agents can collaborate without chaos.
- **Batteries included:** Sample Terraform root module, reusable GitHub Actions workflow, compliance mappings, and orchestration runbooks.

## Quick Start

1. **Browse agents** across the divisions below and copy the ones you need.
2. **Install into your tool** (Claude/Cursor/etc.) via the conversion scripts:
   ```bash
   ./scripts/convert.sh        # regenerate integrations
   ./scripts/install.sh        # interactive installer
   ./scripts/install.sh --tool cursor   # or target a single tool
   ```
3. **Activate the CONTROL LOOP** using the prompts in `strategy/QUICKSTART.md` to coordinate Terraform → CI/CD → Kubernetes → Compliance workflows.

## Divisions & Agents

| Division | Description | Agents |
| --- | --- | --- |
| **Foundation** | Landing zones, Terraform, multi-cloud, baseline identity/network | [Terraform Platform Architect](foundation/foundation-terraform-platform-architect.md), [Multi-Cloud Operator](foundation/foundation-multicloud-operator.md) |
| **Delivery** | CI/CD architecture, GitHub Actions, release automation | [GitHub Actions Engineer](delivery/delivery-cicd-github-actions-engineer.md), [Release Automation Lead](delivery/delivery-release-automation-lead.md) |
| **Runtime** | Kubernetes platforms, observability, SRE | [Kubernetes Platform Engineer](runtime/runtime-kubernetes-platform-engineer.md), [Observability Architect](runtime/runtime-sre-observability-architect.md) |
| **Assurance** | Security controls, compliance mapping, audits | [Cloud Security Engineer](assurance/assurance-cloud-security-engineer.md), [Compliance Control Mapper](assurance/assurance-compliance-control-mapper.md) |
| **Enablement** | Documentation, platform adoption, developer experience | [DevOps Technical Writer](enablement/enablement-devops-technical-writer.md), [Enablement Coach](enablement/enablement-coach.md) |

Each Markdown file includes identity, core mission, critical rules, deliverables (with Terraform/CLI/YAML snippets), workflow process, communication style, success metrics, and advanced capabilities.

## CONTROL LOOP Strategy

`strategy/QUICKSTART.md` introduces CONTROL LOOP:

1. **Assess** – Terraform drift, threat models, compliance deltas.
2. **Architect** – Platform blueprints, GitHub Actions topology, service mesh decisions.
3. **Automate** – IaC modules, CI/CD pipelines, GitOps deployments.
4. **Assure** – Security scans, evidence packs, SLO burn reviews, audit handoffs.

Use the ready-made prompts to spin up multi-agent pipelines (Terraform → Actions → K8s → Compliance) with evidence gates at every handoff. Deep dive docs live in `strategy/CONTROL-LOOP.md` and scenario runbooks under `strategy/runbooks/`.

## Templates & Examples

- `templates/terraform-root-module/` – Opinionated root module with remote state, workspaces, and policy hooks.
- `templates/github-actions/monorepo-ci.yml` – Reusable workflow covering lint → unit → integration → OPA/policy.
- `examples/control-loop-zero-to-prod.md` – Traces how the roster ships a regulated SaaS platform from scratch.

## Integrations

Run `./scripts/convert.sh` to build tool-specific packages in `integrations/`:

- `claude-code/` `.md` agents
- `cursor/` `.mdc` rules
- `aider/` `CONVENTIONS.md`
- `windsurf/` `.windsurfrules`
- `gemini-cli/` extension skills
- `antigravity/` skills
- `opencode/` agent files

Then `./scripts/install.sh` copies the right assets into your environment (auto-detect + TUI just like the Agency repo).

## Install in Your Tool

Once `integrations/` is generated, you can install the agents anywhere—even manually. Here are the most common setups:

- **Claude Code**  
  ```bash
  ./scripts/install.sh --tool claude-code
  # copies .md agents to ~/.claude/agents/
  ```
  Activate any agent inside Claude Code with “Use <Agent Name>”.

- **Cursor**  
  ```bash
  ./scripts/install.sh --tool cursor
  # creates .cursor/rules/<agent>.mdc in your project
  ```
  Cursor automatically ingests `.cursor/rules/` on open.

- **Windsurf**  
  ```bash
  ./scripts/install.sh --tool windsurf
  # drops .windsurfrules into the repo root
  ```
  Windsurf loads `.windsurfrules` as always-on guidance.

- **Aider**  
  ```bash
  ./scripts/install.sh --tool aider
  # writes CONVENTIONS.md (all agents merged) to the repo root
  ```
  Start Aider normally; it will read the conventions file.

- **Gemini CLI**  
  ```bash
  ./scripts/install.sh --tool gemini-cli
  # installs a Gemini CLI extension under ~/.gemini/extensions/agency-devops/
  ```
  Then run `gemini skill list` to verify the new skills.

- **Antigravity**  
  ```bash
  ./scripts/install.sh --tool antigravity
  # copies agency-* skills into ~/.gemini/antigravity/skills/
  ```

- **OpenAI / GitHub Copilot Chat**  
  Copy any agent `.md` into `.github/copilot-instructions.md` (or paste it directly into a Copilot custom instruction). The agents were written to be drop-in instructions, so Copilot Chat, Copilot Workspace, or Playground sessions can use them without conversion.

- **Manual usage**  
  Grab the Markdown file you need, paste it into your agentic IDE (Windsurf, Gemini, Copilot, etc.), and follow the workflow prompts—no tooling required.

## Contributing

See `CONTRIBUTING.md` for the agent template, control-loop guardrails, and lint/test commands. TL;DR:

- Follow the standard agent sections (identity, mission, rules, deliverables, workflow, comms, learning, metrics, advanced).
- Provide runnable artifacts (Terraform snippets, workflow YAML, CLI commands) and success metrics.
- Run `./scripts/lint-agents.sh` plus any template-specific tests before opening a PR.

---

MIT License. 
