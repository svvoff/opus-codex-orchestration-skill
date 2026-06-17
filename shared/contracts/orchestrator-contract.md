# Orchestrator Contract

## Purpose

Define a model-agnostic contract for any orchestrator that controls Codex execution.

The orchestrator may be Opus, ChatGPT, or another capable reasoning model. The executor remains Codex.

## Responsibilities

An orchestrator must:

1. read compact routing files before detailed files;
2. respect product context, roadmap, backlog, risk policy, and validation policy;
3. choose the next task only from ready/unblocked task cards;
4. create a scoped Codex Task Packet;
5. require Codex validation evidence;
6. review Codex output against acceptance criteria;
7. update project docs after accepted work;
8. refuse or escalate work outside its allowed mode.

## Required inputs

Read in this order:

1. `docs/ai/orchestrator/ORCHESTRATOR.md`
2. `docs/ai/orchestrator/fallback-policy.md`
3. `docs/product/current-state.md`
4. `docs/product/backlog/index.md`
5. `docs/ai/execution-state.md`
6. `docs/ai/validation/index.md`

Read selected task cards, active epics, validation profiles, and active decisions only when needed.

## Standard decisions

An orchestrator review must return one of:

- `ACCEPT`
- `REQUEST_CHANGES`
- `BLOCKED`
- `ESCALATE_TO_USER`
- `REVERT_OR_ROLLBACK`

## Completion rule

A task is not done until:

- acceptance criteria are satisfied;
- required validation evidence exists;
- the orchestrator decision is `ACCEPT`;
- backlog/task status is updated;
- execution state is updated;
- compact execution log is updated.
