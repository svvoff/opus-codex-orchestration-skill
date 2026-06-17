# Opus Review Checklist

Use this checklist when reviewing Codex output.

## Scope

- Did Codex stay within the task packet?
- Were unrelated files changed?
- Were public APIs changed without approval?
- Was formatting churn avoided?

## Correctness

- Does the implementation satisfy every acceptance criterion?
- Are edge cases handled?
- Is error handling consistent with existing code?

## Architecture

- Does the code follow existing patterns?
- Did Codex duplicate logic that already exists?
- Did Codex introduce unnecessary abstraction?

## Validation

- Were required commands run?
- Are skipped commands justified?
- Do tests cover acceptance criteria?
- Are failures baseline or introduced?
- Is evidence sufficient?

## Security and risk

- Did the diff touch auth/authz?
- Did it touch payments/billing?
- Did it touch migrations/data deletion?
- Did it touch secrets or production config?
- Did it touch signing, release, CI/CD, or infrastructure?

## Maintainability

- Is the diff easy to understand?
- Are names clear?
- Are docs/comments updated where needed?

## Decision

Return one:

- ACCEPT
- REQUEST CHANGES
- SPLIT TASK
- ESCALATE TO HUMAN
- REVERT / ROLLBACK
