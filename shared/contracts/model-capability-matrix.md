# Model Capability Matrix Contract

## Purpose

Describe allowed work by orchestrator mode rather than assuming all models have identical judgment.

## Matrix

| Work type | Primary orchestrator | Conservative fallback | Codex-only emergency |
|---|---|---|---|
| Product discovery | allowed | limited grooming only | not allowed |
| Roadmap changes | allowed | user approval required | not allowed |
| Backlog task selection | allowed | low/medium-risk only | explicit task only |
| task packet creation | allowed | allowed for ready tasks | not applicable |
| High-risk approval | allowed with care | user approval required | not allowed |
| Architecture decisions | allowed | user approval required | not allowed |
| Validation review | allowed | low/medium-risk only | not allowed |
| Documentation updates | allowed | allowed | docs-only tasks only |

## Rule

Generate target-project configuration against this matrix. Do not rely on a specific vendor/model name for safety-critical behavior.
