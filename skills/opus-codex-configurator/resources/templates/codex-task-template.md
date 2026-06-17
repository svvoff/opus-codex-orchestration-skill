# Codex Task Packet

## Task ID

TASK-YYYYMMDD-001

## Type

BUGFIX | FEATURE_SLICE | REFACTOR | TEST_ONLY | INVESTIGATION | DOCS | VALIDATION_ONLY

## Title

Short imperative title.

## Goal

What outcome should exist after this task?

## Background

Why this change is needed.

## Relevant context

Read these first:

- `path/to/file`
- `path/to/module`
- related tests/docs

## Current behavior

Describe what currently happens.

## Desired behavior

Describe exactly what should happen after the change.

## Implementation requirements

- Requirement 1
- Requirement 2
- Requirement 3

## Non-goals

Do not:

- change unrelated modules;
- redesign the system;
- update dependencies;
- change public APIs unless required.

## Constraints

- Keep changes minimal.
- Follow existing patterns.
- Preserve backward compatibility unless explicitly authorized.

## Acceptance criteria

The task is complete only if:

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Tests or validation cover the requested behavior
- [ ] Required validation evidence is provided

## Validation commands

Run:

```bash
<command 1>
<command 2>
```

If any command cannot be run, explain why.

## Risk level

Low | Medium | High

## Stop conditions

Stop and report back if:

- scope expands;
- high-risk areas are touched without authorization;
- architecture/product decisions are required;
- validation fails for unclear reasons.

## Rollback notes

How to revert this safely if needed.

## Required output report

Use `docs/ai/codex-report-template.md`.
