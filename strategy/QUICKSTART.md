# ⚡ CONTROL LOOP Quick Start

CONTROL LOOP = **Assess → Architect → Automate → Assure**. Use these prompts to spin up multiplayer DevOps missions in Claude Code, Cursor, or any agentic IDE.

## Modes

| I need to... | Mode | Agents | Time |
| --- | --- | --- | --- |
| Stand up a compliant platform from scratch | `CONTROL-LOOP/full` | Entire roster | 2-6 weeks |
| Ship a feature or integration on existing platforms | `CONTROL-LOOP/sprint` | 4-6 agents | 3-10 days |
| Run a targeted task (audit, upgrade, incident) | `CONTROL-LOOP/micro` | 2-4 agents | < 2 days |

## Prompt Templates

### Full Program
```
Activate Enablement Coach as facilitator and run CONTROL-LOOP/full.

Project: <name>
Constraints: <regs, uptime, regions>
Artifacts: templates/terraform-root-module, templates/github-actions/monorepo-ci.yml

Phases:
1. Assess – Landing Zone Builder + Cloud Security Guard audit current state.
2. Architect – Multi-Cloud Navigator + Kubernetes Platform Builder design target.
3. Automate – Pipeline Orchestrator + Release Captain build CI/CD + GitOps.
4. Assure – Compliance Evidence Lead + Observability Lead collect evidence/SLOs.

Require evidence between phases: plan outputs, policy reports, SLO burn charts.
```

### Sprint
```
Run CONTROL-LOOP/sprint for feature <feature>. Skip Assess (platform validated).
Team: Pipeline Orchestrator, Kubernetes Platform Builder, Observability Lead, Platform Technical Writer.
Deliverables: Branch protection update, workflow YAML, Helm release plan, runbook PR.
```

### Micro
```
Run CONTROL-LOOP/micro for Terraform drift remediation in <env>.
Assess = Landing Zone Builder (run terraform plan + tfsec).
Automate = Release Captain (trigger workflow), Kubernetes Platform Builder (roll restarts if needed).
Assure = Cloud Security Guard (opa eval) + Compliance Evidence Lead (map to SOC2 CC6.1).
```

## Evidence Expectations

- **Assess:** Terraform plan (no-op or diff), drift report, threat model delta.
- **Architect:** Reference architecture diagram, ADR, GitHub Actions topology.
- **Automate:** PRs with passing checks, workflow run URLs, `kubectl diff` output.
- **Assure:** Security scan report, compliance matrix, SLO dashboards/screenshots.

See `strategy/CONTROL-LOOP.md` for expanded doctrine and `strategy/runbooks/` for scenario-specific orchestration.
