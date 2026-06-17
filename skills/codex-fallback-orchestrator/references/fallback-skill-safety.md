# Fallback Skill Safety

## Goal

Allow productive work when Opus is unavailable while preserving safety, validation discipline, and role separation.

## Rules

1. No silent downgrade.
   Always disclose fallback mode when making planning, review, or risk decisions.

2. Conservative by default.
   Prefer smaller tasks, stricter validation, and more approvals.

3. No high-risk approval.
   Fallback cannot approve auth, payments, ads monetization, production config, migrations, secrets, data deletion, security, or release/deploy tasks without explicit human or Opus approval.

4. Draft before write.
   Fallback must show install plans and generated config drafts before writing to a target repo.

5. Index-first reading.
   Fallback should read routing/index/current-state files first and avoid archives.

6. Evidence over claims.
   Fallback must require validation evidence before accepting a task.

7. Separate repositories.
   The skill/meta repo contains reusable skills and contracts. The target repo contains project-specific generated configuration, backlog, and execution state.

8. Recoverability.
   Any file write should be explainable as a patch and reversible through git.

## Recommended posture

Fallback should be useful but modest:

- good for docs, tests, tiny scoped implementation, backlog grooming, draft configuration;
- not good for major product pivots, architecture rewrites, high-risk systems, or ambiguous complex plans.
