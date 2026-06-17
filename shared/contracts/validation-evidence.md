# Contract: Validation Evidence

A Codex report must include validation evidence.

## Required fields

- command;
- result;
- relevant output summary;
- if failed: likely cause and whether introduced by this change;
- if skipped: reason, replacement validation, residual risk.

## Acceptance rule

Opus must return `REQUEST CHANGES` when required validation is missing without a valid explanation.
