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
1. Assess – Terraform Platform Architect + Cloud Security Engineer audit current state.
2. Architect – Multi-Cloud Operator + Kubernetes Platform Engineer design target.
3. Automate – GitHub Actions Engineer + Release Automation Lead build CI/CD + GitOps.
4. Assure – Compliance Control Mapper + Observability Architect collect evidence/SLOs.

Require evidence between phases: plan outputs, policy reports, SLO burn charts.
```

### Sprint
```
Run CONTROL-LOOP/sprint for feature <feature>. Skip Assess (platform validated).
Team: GitHub Actions Engineer, Kubernetes Platform Engineer, Observability Architect, DevOps Technical Writer.
Deliverables: Branch protection update, workflow YAML, Helm release plan, runbook PR.
```

### Micro
```
Run CONTROL-LOOP/micro for Terraform drift remediation in <env>.
Assess = Terraform Platform Architect (run terraform plan + tfsec).
Automate = Release Automation Lead (trigger workflow), Kubernetes Platform Engineer (roll restarts if needed).
Assure = Cloud Security Engineer (opa eval) + Compliance Control Mapper (map to SOC2 CC6.1).
```

## Evidence Expectations

- **Assess:** Terraform plan (no-op or diff), drift report, threat model delta.
- **Architect:** Reference architecture diagram, ADR, GitHub Actions topology.
- **Automate:** PRs with passing checks, workflow run URLs, `kubectl diff` output.
- **Assure:** Security scan report, compliance matrix, SLO dashboards/screenshots.

See `strategy/CONTROL-LOOP.md` for expanded doctrine and `strategy/runbooks/` for scenario-specific orchestration.
