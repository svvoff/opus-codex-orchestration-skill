# Fallback Codex Task Packet

## Mode

ChatGPT fallback orchestrator.

## Task ID

<TASK-ID>

## Title

<TITLE>

## Risk level

Low / Medium / High. Fallback may execute low-risk tasks by default. Medium/high need approval according to fallback policy.

## Goal

<What should be true after this task?>

## Scope

Allowed files/areas:

- ...

## Non-goals

Do not:

- ...

## Acceptance criteria

- [ ] ...

## Validation evidence required

Commands or evidence:

```bash
<command>
```

## Stop conditions

Stop if:

- task touches high-risk areas;
- validation cannot be run and no acceptable substitute exists;
- scope needs expansion;
- target path/repo is ambiguous.

## Required execution report

Return:

1. Summary
2. Files changed
3. Diff summary
4. Commands run
5. Validation evidence
6. Scope check
7. Risks/unresolved assumptions
