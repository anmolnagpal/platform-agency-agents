# CONTROL LOOP Doctrine

CONTROL LOOP keeps multi-agent DevOps engagements predictable. Each phase has owners, inputs, outputs, and quality gates.

## Phase 0 – Intake
- **Owner:** Enablement Coach
- **Inputs:** Business goals, compliance scope, platform inventory
- **Outputs:** Engagement brief, success metrics, evidence checklist

## Phase 1 – Assess
- **Agents:** Landing Zone Builder, Cloud Security Guard, Observability Lead
- **Activities:**
  - Terraform drift + cost analysis
  - IAM & network posture review
  - SLO burn + error budget review
- **Gate:** No blockers, risks logged, evidence archived in `/artifacts/assess/`

## Phase 2 – Architect
- **Agents:** Multi-Cloud Navigator, Kubernetes Platform Builder, Release Captain
- **Activities:**
  - Blueprint target state (diagrams + ADRs)
  - Select delivery topology (GitHub Actions matrix, artifact strategy)
  - Define data/secret boundaries
- **Gate:** Architecture packet (ADR, diagram, control matrix) signed off by Assurance squad.

## Phase 3 – Automate
- **Agents:** Landing Zone Builder, Pipeline Orchestrator, Kubernetes Platform Builder
- **Activities:**
  - Implement Terraform modules, policy sets, remote state wiring
  - Build/update Actions workflows, reusable actions, branch protections
  - Apply GitOps manifests/Helm charts, rollout automation
- **Gate:** All PRs merged, pipelines green, change tickets linked, automation evidence stored.

## Phase 4 – Assure
- **Agents:** Cloud Security Guard, Compliance Evidence Lead, Observability Lead, Platform Technical Writer
- **Activities:**
  - Run tfsec/Checkov/OPA, container/image scans, secret scans
  - Map artifacts to SOC2/HIPAA/NIST controls
  - Update runbooks, post-change SLO review, incident simulations if needed
- **Gate:** Assurance report + comms pack delivered. Anything failing loops back to Automate.

## Phase 5 – Enable
- **Agents:** Enablement Coach, Platform Technical Writer
- **Activities:**
  - Office hours, playbooks, sandbox environments
  - Adoption metrics (workflow usage, self-serve percentage)

## Evidence Handling
- Store artifacts under `/artifacts/<phase>/` with timestamps.
- Use `strategy/runbooks/<scenario>.md` to predefine required evidence per mission.

## Escalation Rules
1. Failed gate loops back to previous phase with a max of 3 retries.
2. If the same blocker reappears twice, escalate to program owners with mitigation doc.
3. Emergency incidents bypass Automate → Assure via the Incident Response runbook.

## Recommended Tooling
- Terraform + Open Policy Agent + TF Cloud/Atlantis
- GitHub Actions + reusable actions + environments
- ArgoCD/Flux + Helmfile for GitOps
- Prometheus + Loki + Tempo + OpenTelemetry
- tfsec, Checkov, Trivy, kube-bench, OPA bundles for assurance

Document deviations in ADRs to keep the roster transparent.
