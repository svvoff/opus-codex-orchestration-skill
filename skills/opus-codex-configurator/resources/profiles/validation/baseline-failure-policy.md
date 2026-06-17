# Profile: Baseline Failure Policy

## Category

validation

## When to use

Use when repository-wide validation may already be failing before Codex changes.

## Policy

If validation fails:

1. Determine whether the failure is caused by Codex's changes.
2. If unrelated, provide evidence.
3. Do not fix unrelated failures unless explicitly asked.
4. Do not hide, skip, or delete failing tests.
5. Ask Opus whether to create a separate task for baseline failures.

## Evidence for baseline failures

Codex should provide:

- failing command;
- failing file/test;
- whether modified files are involved;
- targeted validation for modified area;
- suggested separate follow-up task.

## Opus review rule

Opus may accept a task with unrelated baseline failures only when:

- the modified area has targeted passing validation;
- the failure is plausibly unrelated;
- the remaining risk is clearly stated;
- the user/project policy allows acceptance with baseline failures.
