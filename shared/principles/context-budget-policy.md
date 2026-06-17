# Context Budget Policy

## Purpose

Reduce Opus token usage by reading only the minimum context required for the current decision.

This file is the **canonical source** for read order. Other documents that describe
"what to read" should reference these tiers and only state context-specific additions
(e.g. the configurator also reads `configurator-input.md`).

## Context tiers

### Tier 0 — Always read

Small routing/state files:

- `docs/product/current-state.md`
- `docs/product/backlog/index.md`
- `docs/ai/execution-state.md`
- `docs/ai/validation/index.md`

When the repo is configured for orchestration, Tier 0 also includes the orchestrator
routing files:

- `docs/ai/orchestrator/ORCHESTRATOR.md`
- `docs/ai/orchestrator/fallback-policy.md`
- `docs/ai/orchestrator/handoff-state.md`

Together these form the **delivery-loop read set** consumed before selecting a task.

### Tier 1 — Read for the current task

- selected task card;
- active epic referenced by the task;
- relevant validation profile;
- directly referenced active decisions.

### Tier 2 — Read on demand

- current roadmap stage;
- product brief;
- architecture notes;
- related completed tasks;
- previous execution reports.

### Tier 3 — Archive

Do not read by default:

- completed task files;
- old execution logs;
- done epics;
- deferred tasks;
- future roadmap stages;
- archived decisions.

## Rule

Never read Tier 2 or Tier 3 files unless they are needed for dependency resolution, regression investigation, risk review, or an explicit user request.
