# Example: CONTROL LOOP Zero-to-Prod

This walkthrough shows how eight agents collaborated to launch a HIPAA-ready patient engagement platform on AWS + Azure.

## Cast
- Landing Zone Builder – landing zones, account factories
- Multi-Cloud Navigator – Azure stack parity, IAM federation
- Pipeline Orchestrator – reusable workflows, deployment protections
- Release Captain – promotion logic, change management
- Kubernetes Platform Builder – EKS + AKS GitOps clusters
- Observability Lead – metrics/logging/SLOs
- Cloud Security Guard – guardrails, scanning, incident hooks
- Compliance Evidence Lead – SOC2/HIPAA evidence pack

## Timeline (4 weeks)
1. **Assess:** Landing Zone Builder cloned templates/terraform-root-module, ran `terraform plan` against staging accounts, produced drift report + cost projection. Cloud Security Guard ran IAM Access Analyzer + GuardDuty summary, flagged orphaned keys.
2. **Architect:** Multi-Cloud Navigator designed account structure (AWS Control Tower + Azure Landing Zones) and identity federation via Entra ID. Kubernetes Platform Builder produced cluster add-on matrix. Release Captain sketched GitHub Actions topology with environments + manual approvals.
3. **Automate:**
   - Landing Zone Builder parameterized remote state + workspace layout, pushed PRs.
   - Pipeline Orchestrator authored `templates/github-actions/monorepo-ci.yml`, added reusable workflows for Terraform + app builds.
   - Kubernetes Platform Builder bootstrapped ArgoCD with Helmfile, configured add-ons.
4. **Assure:** Cloud Security Guard ran tfsec, Checkov, Trivy, kube-bench; Compliance Evidence Lead linked artifacts to SOC2 CCs and HIPAA safeguards; Observability Lead set SLOs (99.9% API, 95th latency < 300ms) and seeded Alertmanager routes.
5. **Enable:** Platform Technical Writer (supporting role) merged ADRs/runbooks; Enablement Coach ran sandbox session for feature teams.

## Outputs
- Landing zone Terraform stack per cloud with policy-as-code
- GitHub Actions workflows + reusable actions
- GitOps bootstrap repo (Helmfile + ArgoCD AppSets)
- Compliance evidence pack (matrix + scan reports)
- Runbooks + onboarding session recording

Use this as inspiration when crafting your own CONTROL LOOP engagement.
