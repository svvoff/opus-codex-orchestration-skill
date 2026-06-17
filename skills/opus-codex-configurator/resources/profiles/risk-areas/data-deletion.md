# Profile: Data Deletion Risk Area

## Category

risk-area

## When to use

Use when the repository includes deletion, purge, retention, account deletion, cleanup jobs, or destructive data operations.

## Detection signals

- delete/purge/cleanup/destroy/remove jobs;
- account deletion flows;
- data retention code;
- destructive DB queries.

## Adds to project profile

- `risk_areas += ["data-deletion"]`
- human approval for behavior changes.

## Codex rules

Codex must not change destructive data behavior unless explicitly authorized.

## Opus rules

Opus must require rollback notes, migration safety notes, and tests for destructive paths.

## Validation requirements

Require tests that prove only intended records are deleted and protected records remain untouched.
