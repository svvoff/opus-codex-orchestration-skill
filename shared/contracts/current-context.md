# Contract: Current Context

Path:

```text
docs/ai/current-context.md
```

## Purpose

Record the minimal context used for the currently selected task.

## Required sections

- Selected task
- Why selected
- Files read
- Files intentionally not read
- Context summary for Codex
- Risk gates
- Validation requirements

## Rule

This file helps debug token usage and prevents Opus from silently depending on huge hidden context.
