# Runbook: Zero-to-Prod Regulated SaaS

**Goal:** Launch a multi-region SaaS platform (HIPAA + SOC2) using CONTROL LOOP.

## Inputs
- Business brief with data sensitivity classification
- Approved budget + timeline
- Target regions (us-east-1, west europe)

## Phase Mapping

| Phase | Agents | Key Actions | Evidence |
| --- | --- | --- | --- |
| Assess | Terraform Platform Architect, Cloud Security Engineer | Inventory accounts, baseline IAM, run terraform plan against `templates/terraform-root-module` | Drift report, IAM findings, CIS score |
| Architect | Multi-Cloud Operator, Release Automation Lead, Kubernetes Platform Engineer | Author landing zone ADR, GitHub Actions topology, cluster sizing doc | ADR, topology diagram, sizing sheet |
| Automate | Terraform Platform Architect, GitHub Actions Engineer, Kubernetes Platform Engineer | Implement IaC, build workflows, configure GitOps bootstrap | TF plan/apply logs, workflow runs, Argo sync proof |
| Assure | Cloud Security Engineer, Compliance Control Mapper, Observability Architect | Run tfsec + Trivy, map controls, define SLOs | Scan reports, SOC2 matrix, SLO doc |
| Enable | DevOps Technical Writer, Enablement Coach | Publish runbooks, hold enablement session | Runbook PR, attendance notes |

## Milestones
1. **Week 1:** Assess complete, backlog prioritized.
2. **Week 2:** Landing zone + CI/CD architecture approved.
3. **Week 3:** Terraform + Actions merged, first cluster online.
4. **Week 4:** Assure gate passed, go-live checklist signed.

## Risks & Mitigations
- **Multi-cloud scope creep** – lock MVP to primary cloud, document future expansion.
- **Compliance evidence gaps** – pair writers with Compliance Control Mapper early.
- **Kubernetes over-customization** – use reference add-on stack (Ingress, cert-manager, external-dns) before layering extras.

## Handoffs
- Store specs under `project-docs/zero-to-prod/`.
- Use `handoff.md` template from strategy/coordination (TBD) for each phase.
