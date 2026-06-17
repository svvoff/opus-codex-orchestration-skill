# Token-Aware Design

Opus can become expensive if it repeatedly reads full roadmaps, full backlogs, completed task history, and archived execution reports. This project is designed around small routing files and archive-by-default behavior.

## Reading rule

```text
Read indexes first.
Read active/current files second.
Read archives only when necessary.
```

## Default files for “do next task”

The exact read set is defined once in the canonical
[`shared/principles/context-budget-policy.md`](../shared/principles/context-budget-policy.md)
(Tier 0 delivery-loop read set + the selected task card). Do not restate it here; reference it.

Do not read by default:

- `docs/product/backlog/tasks/done/`
- `docs/product/backlog/tasks/deferred/`
- `docs/product/backlog/epics/done/`
- `docs/ai/execution-log/archive/`
- future roadmap stages unrelated to the current milestone

## Completion memory

Completed tasks should be moved to `done/` and summarized in compact ledgers:

- `docs/ai/execution-log/latest.md` — last 5–10 completions;
- `docs/ai/execution-log/archive/YYYY-MM.md` — monthly summaries;
- full done task cards — available but not read by default.
