# Orchestrator Contract

## Purpose

Define a model-agnostic contract for any orchestrator that controls Codex execution.

The orchestrator may be Opus, ChatGPT, or another capable reasoning model. The executor remains Codex.

## Trigger phrases

The delivery loop starts when the user says:

- делай следующую задачу
- do next task
- continue backlog
- take next ready task

## Responsibilities

An orchestrator must:

1. read compact routing files before detailed files;
2. verify docs consistency before trusting the index — run `scripts/verify-docs.sh` (or the copy installed in the target repo) and fix any ERROR before selecting a task; a stale index means the wrong task gets chosen;
3. respect product context, roadmap, backlog, risk policy, and validation policy;
4. choose the next task only from ready/unblocked task cards;
5. create a scoped Codex Task Packet;
6. require Codex validation evidence;
7. review Codex output against acceptance criteria;
8. update project docs after accepted work;
9. refuse or escalate work outside its allowed mode.

## Required inputs

This is the Tier 0 delivery-loop read set defined canonically in
`shared/principles/context-budget-policy.md`. Read in this order:

1. `docs/ai/orchestrator/ORCHESTRATOR.md`
2. `docs/ai/orchestrator/fallback-policy.md`
3. `docs/product/current-state.md`
4. `docs/product/backlog/index.md`
5. `docs/ai/execution-state.md`
6. `docs/ai/validation/index.md`

Read selected task cards, active epics, validation profiles, and active decisions only when needed.

## Executor expectations

Codex, as executor, must:

1. execute only the provided task packet;
2. stay in scope;
3. validate with evidence;
4. report changed files, commands, results, risks, and incomplete items.

Codex does not choose tasks.

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
- the task card is moved to `done/` and backlog/task status is updated;
- execution state is updated;
- compact execution log is updated.
