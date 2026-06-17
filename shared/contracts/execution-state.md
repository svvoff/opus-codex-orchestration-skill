# Contract: Execution State

Path:

```text
docs/ai/execution-state.md
```

## Purpose

Compact state file for the current delivery loop.

## Required sections

- Current milestone
- Current task
- Last execution result
- Recently completed tasks
- Blocked tasks
- Known baseline issues
- Validation status
- Context budget reminder

## Rule

This file is always safe to read during normal execution. Keep it short.
