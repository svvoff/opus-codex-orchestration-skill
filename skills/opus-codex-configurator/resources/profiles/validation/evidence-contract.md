# Profile: Validation Evidence Contract

## Category

validation

## When to use

Use for every Codex execution report.

## Core rule

```text
No validation evidence = no acceptance.
```

## Codex must report

For every validation command:

```md
### Command

```bash
<command>
```

### Result

Passed / Failed / Not run

### Notes

Short explanation, especially for failures or skipped commands.
```

## If a command fails

Codex must explain:

- whether the failure appears related to the change;
- evidence for that conclusion;
- whether a smaller targeted check passed;
- what risk remains.

## If a command cannot be run

Codex must explain:

- the exact command;
- why it could not run;
- what was run instead;
- what risk remains.

## Forbidden claims

Codex must not say:

- "tests pass" without commands;
- "should work" as validation;
- "not tested" without explanation;
- "minor change" as a substitute for evidence.
