# Profile: Production Config Risk Area

## Category

risk-area

## When to use

Use when a repository includes production environment config, release config, signing, deployment, CI/CD, or provider production settings.

## Detection signals

- production env files;
- release workflows;
- deploy scripts;
- signing config;
- Firebase production config;
- API base URLs;
- Terraform/Kubernetes/Helm config.

## Adds to project profile

- `risk_areas += ["production-config"]`
- approval gate for production-impacting changes.

## Codex rules

Codex must not modify production configuration unless the task packet explicitly authorizes it.

## Opus rules

Opus must ask whether production config changes are allowed before generating tasks that may affect deployment, release, signing, or production services.

## Validation requirements

Require explicit evidence that production config was not changed, or a clearly authorized change summary if it was.
