# Runbook: Zero-to-Prod Regulated SaaS

**Goal:** Launch a multi-region SaaS platform (HIPAA + SOC2) using CONTROL LOOP.

## Inputs
- Business brief with data sensitivity classification
- Approved budget + timeline
- Target regions (us-east-1, west europe)

## Phase Mapping

| Phase | Agents | Key Actions | Evidence |
| --- | --- | --- | --- |
| Assess | Landing Zone Builder, Cloud Security Guard | Inventory accounts, baseline IAM, run terraform plan against `templates/terraform-root-module` | Drift report, IAM findings, CIS score |
| Architect | Multi-Cloud Navigator, Release Captain, Kubernetes Platform Builder | Author landing zone ADR, GitHub Actions topology, cluster sizing doc | ADR, topology diagram, sizing sheet |
| Automate | Landing Zone Builder, Pipeline Orchestrator, Kubernetes Platform Builder | Implement IaC, build workflows, configure GitOps bootstrap | TF plan/apply logs, workflow runs, Argo sync proof |
| Assure | Cloud Security Guard, Compliance Evidence Lead, Observability Lead | Run tfsec + Trivy, map controls, define SLOs | Scan reports, SOC2 matrix, SLO doc |
| Enable | Platform Technical Writer, Enablement Coach | Publish runbooks, hold enablement session | Runbook PR, attendance notes |

## Milestones
1. **Week 1:** Assess complete, backlog prioritized.
2. **Week 2:** Landing zone + CI/CD architecture approved.
3. **Week 3:** Terraform + Actions merged, first cluster online.
4. **Week 4:** Assure gate passed, go-live checklist signed.

## Risks & Mitigations
- **Multi-cloud scope creep** – lock MVP to primary cloud, document future expansion.
- **Compliance evidence gaps** – pair writers with Compliance Evidence Lead early.
- **Kubernetes over-customization** – use reference add-on stack (Ingress, cert-manager, external-dns) before layering extras.

## Handoffs
- Store specs under `project-docs/zero-to-prod/`.
- Use `handoff.md` template from strategy/coordination (TBD) for each phase.

---

## Scenario: Incident-Ready Release Train

**Goal:** Keep release trains deploy-ready with rehearsed rollback + SLO checks.

| Phase | Agents | Key Actions | Evidence |
| --- | --- | --- | --- |
| Assess | Release Captain, Observability Lead | Review change failure rate, SLO burn, incident backlog | DORA metrics snapshot, SLO burn report |
| Architect | Release Captain, Pipeline Orchestrator | Update promotion plan, approvals, verification suite | Release calendar, workflow diagram |
| Automate | Release Captain, Pipeline Orchestrator, Kubernetes Platform Builder | Run ChatOps deploy rehearsals, GitOps rollouts, synthetic tests | ChatOps logs, Argo sync output, synthetic results |
| Assure | Observability Lead, Cloud Security Guard | Validate rollback bundle, attach SLO + security evidence | Rollback timing log, SLO dashboard export, security scan |

## Scenario: Security Drift Clamp-Down

**Goal:** Eliminate IaC/runtime drift and close compliance gaps.

| Phase | Agents | Key Actions | Evidence |
| --- | --- | --- | --- |
| Assess | Landing Zone Builder, Cloud Security Guard | Run drift scans, tfsec/Trivy, cost variance review | Drift report, scan outputs, cost delta sheet |
| Architect | Multi-Cloud Navigator, Compliance Evidence Lead | Define remediations + compensating controls, update control matrix | ADR update, control matrix delta |
| Automate | Landing Zone Builder, Pipeline Orchestrator | Implement fixes via IaC + pipelines, enforce policy gates | PR links, pipeline logs, policy reports |
| Assure | Compliance Evidence Lead, Cloud Security Guard | Package evidence, update audit artifacts, brief leadership | Evidence bundle path, risk memo |

## Scenario: Developer Adoption Surge

**Goal:** Accelerate platform adoption across new teams/squads.

| Phase | Agents | Key Actions | Evidence |
| --- | --- | --- | --- |
| Assess | Enablement Coach, Platform Technical Writer | Survey teams, track current adoption metrics | Survey summary, dashboard screenshot |
| Architect | Enablement Coach, Platform Technical Writer, Delivery agents | Build onboarding curriculum, sandbox plan, sample repos | Enablement plan, sample repo links |
| Automate | Enablement Coach, Pipeline Orchestrator | Run workshops, office hours, guided deploys | Attendance log, deployment tracker |
| Assure | Enablement Coach, Compliance Evidence Lead | Measure self-serve %, collect testimonials, update docs | Adoption dashboard, testimonial notes, doc PRs |
