# 🤝 Contributing to Platform Agency Agents

Thanks for helping improve the roster! This project only works if every agent ships real value: runnable infra, auditable workflows, and measurable reliability improvements.

## Table of Contents
- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Agent Template](#agent-template)
- [Quality Gates](#quality-gates)
- [Pull Request Checklist](#pull-request-checklist)

## Code of Conduct
Be respectful, inclusive, collaborative, and professional. Punch up at toil, not at people.

## How to Contribute
1. **Add or improve an agent** inside the appropriate division (`foundation/`, `delivery/`, `runtime/`, `assurance/`, `enablement/`).
2. **Enhance strategy/runbooks** with new CONTROL LOOP scenarios.
3. **Extend templates** (Terraform modules, GitHub Actions, policy packs) referenced by the agents.
4. **Share evidence** – add examples in `examples/` showing full-stack collaborations.

## Agent Template
Every agent file is Markdown with YAML frontmatter:

```markdown
---
name: Landing Zone Builder
description: Builds secure landing zones & IaC guardrails
color: indigo
---

# Agent Name
## 🧠 Your Identity & Memory
...
```

Required sections:
1. Identity & Memory
2. Core Mission (with explicit deliverables)
3. Critical Rules
4. Technical Deliverables (code/YAML/CLI snippets)
5. Workflow Process
6. Communication Style
7. Learning & Memory
8. Success Metrics (quantitative where possible)
9. Advanced Capabilities

## Quality Gates
Before opening a PR:

- `./scripts/lint-agents.sh` – validates frontmatter + required sections.
- `./scripts/lint-terraform.sh` (if you touched Terraform templates) – runs `terraform fmt -check` and `terraform validate`.
- `./scripts/test-gha-workflows.sh` (if you added CI workflows) – runs `act` on sample events.
- `./scripts/check-links.sh` – optional but recommended for docs-heavy changes.

Agents should reference real commands (`terraform plan`, `kubectl apply`, `gh workflow run`) and include evidence expectations (e.g., attach plan output, link to CIS benchmarks).

## Pull Request Checklist
- [ ] Agent content follows template and includes runnable artifacts.
- [ ] CONTROL LOOP handoffs updated if a new discipline is introduced.
- [ ] Examples/runbooks updated when behavior changes.
- [ ] Lint/tests passing.

Ready? Fork, branch, `git checkout -b feature/my-agent`, and go. 🚀
